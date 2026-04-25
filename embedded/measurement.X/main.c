#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h> //ASK!!!!!!
#include <avr/interrupt.h> //Ask!

//UART COMMUNICATION
#define F_CPU 8000000UL
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)

//MEASUREMENTS: for measurements read from the channels, and measurements calculated from those
#define VREF 5.0f
#define NUM_SAMPLES 100
#define NO_MEASUREMENTS 12
#define MEAS_DC_VOLTAGE              0
#define MEAS_DC_CURRENT              1
#define MEAS_AC_VOLTAGE              2
#define MEAS_AC_CURRENT_HIGH         3
#define MEAS_AC_CURRENT_LOW          4
#define MEAS_PHASE                   5
#define MEAS_POWER_FACTOR            6
#define MEAS_FREQUENCY               7
#define MEAS_REAL_POWER              8
#define MEAS_REACTIVE_POWER          9
#define MEAS_APPARENT_POWER          10
#define MEAS_TIME                    11

//CHANNELS: the actual readings from the circuit
#define NO_CHANNELS 2
#define DC_VOLTAGE_CHANNEL 0
#define DC_CURRENT_CHANNEL 1
#define AC_VOLTAGE_CHANNEL 2
#define AC_CURRENT_HIGH_CHANNEL 3
#define AC_CURRENT_LOW_CHANNEL 4

//GLOBAL VARIABLES
    //STORED VARAIBLES FOR RMS MEASUREMENT
        //FOR AC VOLTAGE
volatile uint32_t acVoltageSum = 0;
volatile uint32_t acVoltageSumSq = 0;
volatile uint16_t acVoltageCount = 0;
volatile uint16_t acVoltageMin = 1023;
volatile uint16_t acVoltageMax = 0;

        //FOR AC CURRENT - HIGH
volatile uint32_t acCurrentHighSum = 0;
volatile uint32_t acCurrentHighSumSq = 0;
volatile uint16_t acCurrentHighCount = 0;
volatile uint16_t acCurrentHighMin = 1023;
volatile uint16_t acCurrentHighMax = 0;

        //FOR AC CURRENT - LOW
volatile uint32_t acCurrentLowSum = 0;
volatile uint32_t acCurrentLowSumSq = 0;
volatile uint16_t acCurrentLowCount = 0;
volatile uint16_t acCurrentLowMin = 1023;
volatile uint16_t acCurrentLowMax = 0;

volatile uint8_t acWindowReady = 0;

    //STORED VARIABLES FOR ADC READING
volatile uint16_t ADCReading[NO_CHANNELS];
volatile uint8_t areReadingsReady = 0;
volatile uint8_t ADCSelectedChannel = 0;
volatile uint8_t discardNextSample = 0;

void UART_init(void) {
    UBRR0H = (unsigned char)(UBRR_VALUE >> 8);
    UBRR0L = (unsigned char)UBRR_VALUE;

    UCSR0B = (1 << TXEN0);
    UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
}

void UART_transmit(char data) {
    //THIS IS BLOCKING
    while (!(UCSR0A & (1 << UDRE0))) {
    }
    UDR0 = data;
}

void UART_print(const char *str) {
    while (*str) {
        UART_transmit(*str++);
    }
}

void UART_print_uint(uint16_t value) {
    char buffer[8];
    snprintf(buffer, sizeof(buffer), "%u", value);
    UART_print(buffer);
}

void UART_print_float_2dp(float value) {
    if (value < 0) {
        UART_print("-");
        value = -value;
    }

    uint16_t scaled = (uint16_t)(value * 100.0f + 0.5f);
    uint16_t whole = scaled / 100;
    uint16_t frac  = scaled % 100;

    char buffer[16];
    snprintf(buffer, sizeof(buffer), "%u.%02u", whole, frac);
    UART_print(buffer);
}

void setup_ADC(void) {
    //Set voltage reference to AREF and use 10 bit results.
    ADMUX = (0 << REFS1) | (0 << REFS0) | (0 << ADLAR);

    //Enable interrupts. Set prescalar divisor to 64
    ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADEN) | (1 << ADIE);
}

void ADC_start_conversion(void) {
    ADCSRA |= (1 << ADSC);
}

//Takes in a number from 0 to 4, corresponding to an ADC Channel
//0 -> DC Voltage, 1-> DC Current, 2-> AC Voltage, 3->AC Current (Low Resolution), 4->AC Current (High Resolution)
void ADC_select_channel(uint8_t channel) {
    channel &= 0x0F; //Look at lowest 4 bits
    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0)); //Clear channel
    ADMUX |= channel;

}

//Save the ADC reading, switch channels, and start another conversion
ISR(ADC_vect) {
    if (discardNextSample) {
        //Discard the first sample after switching channels
        discardNextSample = 0;
        ADC_start_conversion();
        return;
    }

    //Save ADC reading to array
    ADCReading[ADCSelectedChannel] = ADC;
    ADCSelectedChannel++;
    //Wrap back around to channel 0 if we've done all 5 measurements
    if (ADCSelectedChannel >= NO_CHANNELS){
        ADCSelectedChannel = 0;
        areReadingsReady = 1;
    }

    ADC_select_channel(ADCSelectedChannel);
    ADC_start_conversion();
}

//Converts the ADC reading into DC voltage, then calculates input DC voltage
float calculate_DC_voltage(uint16_t ADCreading) {
    
    float scalingRatio =  (4.724f / 10.0f);
    float errorRatio = 1.0f;
    
    //Set convert ADC reading into voltage
    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
    
    float Vin = (scaledVout / scalingRatio) * errorRatio;

    return Vin;
}

//Converts the ADC reading into DC current, then calculates input DC current
float calculate_DC_current(uint16_t ADCreading) {
    
    float scalingRatio = 21;
    float errorRatio = 1.0f;
    
    //Set convert ADC reading into voltage
    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
    
    float Vin = (scaledVout / scalingRatio) * errorRatio;

    return Vin;
}

float calculate_AC_voltage(uint16_t ADCreading){
    //haven't implemented yet
    //but the plan is to use the rms formula
    return 4.2f;
}

void UART_print_measurements(float arr[NO_MEASUREMENTS]) {
    UART_print("[");

    for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
        UART_print_float_2dp(arr[i]);

        if (i < NO_MEASUREMENTS - 1) {
            UART_print(", ");
        }
    }

    UART_print("]\r\n");
}

int main(void) {
    UART_init();
    setup_ADC();

    ADC_select_channel(DC_VOLTAGE_CHANNEL);

    sei();
    ADC_start_conversion();

    float measurements[NO_MEASUREMENTS];
    uint16_t localADC[NO_CHANNELS];

    while (1) {
        if (areReadingsReady) {
            //Disable interrupts while copying over ADC readings for safety
            cli();

            localADC[DC_VOLTAGE_CHANNEL] = ADCReading[DC_VOLTAGE_CHANNEL];
            localADC[DC_CURRENT_CHANNEL] = ADCReading[DC_CURRENT_CHANNEL];

            areReadingsReady = 0;
            sei();

            //Fill all measurements with placeholders
            for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
                measurements[i] = 4.2f;
            } //NOTE: Only code for DC voltage and DC Current have been implemented!!

            //Save implemented measurements
            measurements[MEAS_DC_VOLTAGE] =
                calculate_DC_voltage(localADC[DC_VOLTAGE_CHANNEL]);

            measurements[MEAS_DC_CURRENT] =
                calculate_DC_current(localADC[DC_CURRENT_CHANNEL]);

            //Print debug output (for me)
            UART_print("Voltage ADC = ");
            UART_print_uint(localADC[DC_VOLTAGE_CHANNEL]);
            UART_print("  Voltage = ");
            UART_print_float_2dp(measurements[MEAS_DC_VOLTAGE]);
            UART_print(" V   ");

            UART_print("Current ADC = ");
            UART_print_uint(localADC[DC_CURRENT_CHANNEL]);
            UART_print("  Current = ");
            UART_print_float_2dp(measurements[MEAS_DC_CURRENT]);
            UART_print(" A\r\n");

            //print full measurement array for communication to gui
            UART_print_measurements(measurements);
        }
    }

    return 0;
}