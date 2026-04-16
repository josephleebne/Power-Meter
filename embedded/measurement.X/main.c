/* 
 * File:   main.c
 * Author: josephlee
 *
 * Created on April 16, 2026, 1:57 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>

/*
 * 
 */
int main(void) {
    DDRB = 0x01; //PB0 to output
    DDRB = 0x01; //PB0 to high
    
    while (1) {
    }
    return (EXIT_SUCCESS);
}

