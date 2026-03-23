/* 
 * File:   cap.c
 * Author: user
 *
 * Created on 16 March 2026, 1:29 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>

#define FOSC 1000000 // Clock Speed
#define BAUD 4800
#define UBRR (((FOSC / (8UL * BAUD)) + 1) / 2) - 1

void USART_Init(void)
{
    /*Set baud rate */
    UBRR0H = UBRR>>8;
    UBRR0L = UBRR ;
    
    /* Enable receiver and transmitter */
    UCSR0B = (1<<RXEN0)|(1<<TXEN0);
    
    /* Set frame format: 8data, 2stop bit */
    UCSR0C = (1<<USBS0)|(3<<UCSZ00);
}

void USART_Transmit(unsigned char data)
{
    /* Wait for empty transmit buffer */
    while (!(UCSR0A & (1<<UDRE0))) {};

    /* Put data into buffer, sends the data */
    UDR0 = data;
}

unsigned char USART_Receive(void)
{
    /* Wait for data to be received */
    while (!(UCSR0A & (1<<RXC0))) {};
    
    /* Get and return received data from buffer */
    return UDR0;
}

void main(void)
{
    USART_Init();
    unsigned char character;
    while (1) {
        character = USART_Receive();
        if ((character >= 'a') && (character <= 'z')) {
            character -=32;
        }
    }
}
