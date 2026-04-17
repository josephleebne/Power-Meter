#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <avr/io.h>

#define F_CPU 8000000UL
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)

void UART_init(void) {
    UBRR0H = (unsigned char)(UBRR_VALUE >> 8);
    UBRR0L = (unsigned char)UBRR_VALUE;

    UCSR0B = (1 << TXEN0);
    UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
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

void UART_print_voltage_2dp(float value) {
    if (value < 0) {
        UART_print("-");
        value = -value;
    }

    int whole = (int)value;
    int frac = (int)((value - whole) * 100.0f + 0.5f);  // rounded to 2 dp

    if (frac >= 100) {
        whole += 1;
        frac = 0;
    }

    char buffer[16];
    snprintf(buffer, sizeof(buffer), "%d.%02d", whole, frac);
    UART_print(buffer);
}

void setup_ADC(void) {
    ADMUX = 0x00;   // AREF, right-adjusted, ADC0
    ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0) | (1 << ADEN);
}

uint16_t read_ADC(void) {
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC)) {
    }
    return ADC;
}

float calculate_DC_voltage(uint16_t ADCreading) {
    float scaledVout = ((float)ADCreading * 5.0f) / 1023.0f;
    float bias = 1.65f;
    float error = 0.188f;
    float trueVout = (scaledVout - bias) / 0.1f + error;
    return trueVout;
}

int main(void) {
    UART_init();
    setup_ADC();

    while (1) {
        uint16_t ADCreading = read_ADC();
        float DC_Voltage = calculate_DC_voltage(ADCreading);

        UART_print("ADC = ");
        UART_print_uint(ADCreading);
        UART_print("  Voltage = ");
        UART_print_voltage_2dp(DC_Voltage);
        UART_print(" V\r\n");
    }

    return EXIT_SUCCESS;
}