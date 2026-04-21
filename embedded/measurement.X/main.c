#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h> //ASK!!!!!!
#include <avr/interrupt.h>

//UART Communication
#define F_CPU 8000000UL
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)

//Measurements
#define VREF 5.0f
#define NUM_SAMPLES 100
#define DISCARD_FIRST_SAMPLE 1
#define AC_VOLTAGE_RATIO (680.0/3300.0)
#define NO_MEASUREMENTS 2
#define NO_CHANNELS 2

//GLOBAL VARIABLES
volatile uint16_t ADCReading[NO_CHANNELS];
volatile uint8_t areReadingsReady = 0;
volatile uint8_t ADCCurrentChannel = 0;

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
    ADMUX = (0 << REFS1) | (0 << REFS0) | (0 << ADLAR); // AREF, 10 bit results
    ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0) | (1 << ADEN) | (1 << ADIE);
}

void ADC_start_conversion(void) {
    ADCSRA |= (1 << ADSC);
}

void ADC_select_channel(uint8_t channel) {
    channel &= 0x0F; //Look at lowest 4 bits
    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0)); //Clear channel
    ADMUX |= channel;
}

ISR(ADC_vect) {
    //Save ADC reading to array
    ADCReading[ADCCurrentChannel] = ADC;
    ADCCurrentChannel++;
    //Wrap back around to channel 0 if we've done all 5 measurements
    if (ADCCurrentChannel >= NO_CHANNELS){
        ADCCurrentChannel = 0;
        areReadingsReady = 1;
    }

    ADC_select_channel(ADCCurrentChannel);
    ADC_start_conversion();
}

float calculate_DC_voltage(uint16_t ADCreading) {
    
    float scalingRatio =  (4.724f / 10.0f);
    
    //Set convert ADC reading into voltage
    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
    
    float Vin = scaledVout / scalingRatio;

    return Vin;
}

float calculate_DC_current(uint16_t ADCreading) {
    
    float scalingRatio = 21;
    
    //Set convert ADC reading into voltage
    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
    
    float Vin = scaledVout / scalingRatio;

    return Vin;
}

void UART_print_measurements(float arr[NO_MEASUREMENTS]) {
    UART_print("[");
    UART_print_float_2dp(arr[0]);
    UART_print(", ");
    UART_print_float_2dp(arr[1]);
    UART_print("]\r\n");
}

int main(void) {
    UART_init();
    setup_ADC();
    ADC_select_channel(0);
    sei();
    ADC_start_conversion();

    float measurements[NO_MEASUREMENTS];
    uint16_t localADC[NO_CHANNELS];

    while (1) {
        if (areReadingsReady) {
            //Briefly disable interrupts for safety
            cli();
            localADC[0] = ADCReading[0];
            localADC[1] = ADCReading[1];
            areReadingsReady = 0;
            sei();
            
            //Save measurements
            measurements[0] = calculate_DC_voltage(localADC[0]);
            measurements[1] = calculate_DC_current(localADC[1]);

            //Print measurements out
            UART_print("Voltage ADC = ");
            UART_print_uint(localADC[0]);
            UART_print("  Voltage = ");
            UART_print_float_2dp(measurements[0]);
            UART_print(" V   ");

            UART_print("Current ADC = ");
            UART_print_uint(localADC[1]);
            UART_print("  Current = ");
            UART_print_float_2dp(measurements[1]);
            UART_print(" A\r\n");

            UART_print_measurements(measurements);
        }
    }

    return 0;
}