#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h> //ASK!!!!!!

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

void UART_init(void) {
    UBRR0H = (unsigned char)(UBRR_VALUE >> 8);
    UBRR0L = (unsigned char)UBRR_VALUE;

    UCSR0B = (1 << TXEN0);
    UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
}

void UART_transmit(char data) {
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
    ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0) | (1 << ADEN);
}

uint16_t read_ADC(void) {
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC)) {
    }
    return ADC;
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

void ADC_select_channel(uint8_t channel) {
    channel &= 0x0F; //Look at lowest 4 bits
    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0)); //Clear channel
    ADMUX |= channel;
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

    float measurements[NO_MEASUREMENTS];
    uint16_t voltageReadingDC, currentReadingDC;

    while (1) {
        //DC Voltage reading
        ADC_select_channel(0);
        read_ADC();//Throw away first reading
        voltageReadingDC = read_ADC();
        measurements[0] = calculate_DC_voltage(voltageReadingDC);

        //DC Current reading
        ADC_select_channel(1);
        read_ADC();
        currentReadingDC = read_ADC();
        measurements[1] = calculate_DC_current(currentReadingDC);

        //Printings
        UART_print("Voltage ADC = ");
        UART_print_uint(voltageReadingDC);
        UART_print("  Voltage = ");
        UART_print_float_2dp(measurements[0]);
        UART_print(" V   ");

        UART_print("Current ADC = ");
        UART_print_uint(currentReadingDC);
        UART_print("  Current = ");
        UART_print_float_2dp(measurements[1]);
        UART_print(" A\r\n");

        UART_print_measurements(measurements);


    }

    return 0;
}