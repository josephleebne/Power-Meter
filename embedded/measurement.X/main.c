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
#define NO_CHANNELS 4
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
volatile uint16_t acVoltageMin = 1023;
volatile uint16_t acVoltageMax = 0;

        //FOR AC CURRENT - HIGH
volatile uint32_t acCurrentHighSum = 0;
volatile uint32_t acCurrentHighSumSq = 0;
volatile uint16_t acCurrentHighMin = 1023;
volatile uint16_t acCurrentHighMax = 0;

        //FOR AC CURRENT - LOW
volatile uint32_t acCurrentLowSum = 0;
volatile uint32_t acCurrentLowSumSq = 0;
volatile uint16_t acCurrentLowMin = 1023;
volatile uint16_t acCurrentLowMax = 0;

volatile uint16_t acSampleCount = 0;
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
void ADC_select_channel(uint8_t channel) {
    channel &= 0x0F; //Look at lowest 4 bits
    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0)); //Clear channel
    ADMUX |= channel;

}

//Save the ADC reading, switch channels, and start another conversion
ISR(ADC_vect) {

    uint16_t channel = ADCSelectedChannel;
    uint16_t reading = ADC;

    if (discardNextSample) {
        //Discard the first sample after switching channels
        discardNextSample = 0;
        ADC_start_conversion();
        return;
    }

    //Save ADC reading to array
    ADCReading[channel] = reading;

    //AC Voltage measurement
    if (channel == AC_VOLTAGE_CHANNEL && !acWindowReady) {
        //For RMS measurement
        acVoltageSum += reading;
        acVoltageSumSq += (uint32_t)reading * (uint32_t)reading;

        //For pk measurement, will probably remove later
        if (reading < acVoltageMin) acVoltageMin = reading;
        if (reading > acVoltageMax) acVoltageMax = reading;
    }
        //AC Current (High) measurement
    if (channel == AC_CURRENT_HIGH_CHANNEL && !acWindowReady) {
        //For RMS measurement
        acCurrentHighSum += reading;
        acCurrentHighSumSq += (uint32_t)reading * (uint32_t)reading;

        //For pk measurement, will probably remove later
        if (reading < acCurrentHighMin) acCurrentHighMin = reading;
        if (reading > acCurrentHighMax) acCurrentHighMax = reading;
        
        acSampleCount++;
        if (acSampleCount >= NUM_SAMPLES) {
            acWindowReady = 1;
        }
    }

    //Change channel, and wrap back around to channel 0 if we've done all 5
    ADCSelectedChannel++;
    if (ADCSelectedChannel >= NO_CHANNELS){
        ADCSelectedChannel = 0;
        areReadingsReady = 1;
    }

    ADC_select_channel(ADCSelectedChannel);
    discardNextSample = 1;
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

float calculate_RMS_ADC(uint32_t sum, uint32_t sumSq, uint16_t count) {
    if (count == 0) { //Prevent 0 division
        return 0.0f;
    }

    float mean = (float)sum / (float)count;
    float meanSq = (float)sumSq / (float)count;

    float variance = meanSq - (mean * mean);

    //Prevent negative square roots due to rounding
    if (variance < 0.0f) {
        variance = 0.0f;
    }

    return sqrtf(variance);
}

float ADC_counts_to_volts(float ADCCounts) {
    return ADCCounts * VREF / 1023.0f;
}

float calculate_AC_voltage_RMS(uint32_t sum, uint32_t sumSq, uint16_t count) {
    float scalingRatio = (1.4f / 14.14f);
    float errorRatio = 1.0f;

    float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
    float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);

    return (ADCRMSVoltage / scalingRatio) * errorRatio;
}

float calculate_AC_current_high_RMS(uint32_t sum, uint32_t sumSq, uint16_t count) {
    float scalingRatio = 1.0f;
    float currentToVoltageRatio = 10.0f;
    float errorRatio = 1.0f;

    float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
    float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);
    float currentRMS = (ADCRMSVoltage / scalingRatio) * currentToVoltageRatio;

    return currentRMS * errorRatio;
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
    uint16_t localDCVoltageADC;
    uint16_t localDCCurrentADC;

    //Fill all measurements with placeholders
    for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
        measurements[i] = 4.2f;
    } //Only code for DC/AC voltage and Current have been implemented!!

    while (1) {
        if (acWindowReady){
            //Disable interrupts while copying over ADC readings for safety
            uint32_t localACVoltageSum;
            uint32_t localACVoltageSumSq;

            uint32_t localACCurrentHighSum;
            uint32_t localACCurrentHighSumSq;

            uint16_t localACSampleCount;

            cli();

            localACVoltageSum = acVoltageSum;
            localACVoltageSumSq = acVoltageSumSq;

            localACCurrentHighSum = acCurrentHighSum;
            localACCurrentHighSumSq = acCurrentHighSumSq;

            localACSampleCount = acSampleCount;

            //Reset for next group of samples
            acVoltageSum = 0;
            acVoltageSumSq = 0;
            acVoltageMin = 1023;
            acVoltageMax = 0;

            acCurrentHighSum = 0;
            acCurrentHighSumSq = 0;
            acCurrentHighMin = 1023;
            acCurrentHighMax = 0;

            acSampleCount = 0;
            acWindowReady = 0;

            sei();

            //Save AC measurements
            measurements[MEAS_AC_VOLTAGE] =
                calculate_AC_voltage_RMS(localACVoltageSum,
                                         localACVoltageSumSq,
                                         localACSampleCount);

            measurements[MEAS_AC_CURRENT_HIGH] =
                calculate_AC_current_high_RMS(localACCurrentHighSum,
                                              localACCurrentHighSumSq,
                                              localACSampleCount);
        }

        if (areReadingsReady) {
            //Disable interrupts while copying over ADC readings for safety
            cli();

            localDCVoltageADC = ADCReading[DC_VOLTAGE_CHANNEL];
            localDCCurrentADC = ADCReading[DC_CURRENT_CHANNEL];

            areReadingsReady = 0;
            sei();

            //Save DC measurements
            measurements[MEAS_DC_VOLTAGE] = calculate_DC_voltage(localDCVoltageADC);

            measurements[MEAS_DC_CURRENT] = calculate_DC_current(localDCCurrentADC);

            //Print debug output (for me)
            UART_print("DC Voltage ADC = ");
            UART_print_uint(localDCVoltageADC);
            UART_print("  Voltage = ");
            UART_print_float_2dp(measurements[MEAS_DC_VOLTAGE]);
            UART_print(" V   ");

            UART_print("DC Current ADC = ");
            UART_print_uint(localDCCurrentADC);
            UART_print("  Current = ");
            UART_print_float_2dp(measurements[MEAS_DC_CURRENT]);
            UART_print(" A\r\n");

            UART_print("AC Voltage RMS = ");
            UART_print_float_2dp(measurements[MEAS_AC_VOLTAGE]);
            UART_print(" V\r\n");

            UART_print("AC Current (High) RMS = ");
            UART_print_float_2dp(measurements[MEAS_AC_CURRENT_HIGH]);
            UART_print(" A\r\n");

            //print full measurement array for communication to gui
            UART_print_measurements(measurements);
            //Format is [DC Voltage, DC Current, AC Voltage, AC Current (high current mode), AC Current (low current mode), 
            //phase, power factor, frequency, real power, reactive power, apparant power, RTC time]
        }
    }

    return 0;
}