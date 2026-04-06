/*
 * lcd menu.c
 *
 * Created: 18/03/2026 7:42:38 PM
 * Author : User
 */ 

/*

  main.c
	
  AVR Test Project
  This project will use 4-Wire SW SPI

  Universal 8bit Graphics Library (https://github.com/olikraus/u8g2/)

  Copyright (c) 2018, olikraus@gmail.com
  All rights reserved.

  Redistribution and use in source and binary forms, with or without modification, 
  are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list 
    of conditions and the following disclaimer.
    
  * Redistributions in binary form must reproduce the above copyright notice, this 
    list of conditions and the following disclaimer in the documentation and/or other 
    materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
	
*/


#include <avr/io.h>
#include <u8g2.h>
#include <util/delay.h>
#include <avr/eeprom.h>
#include <math.h>

#define DISPLAY_CLK_DIR DDRB
#define DISPLAY_CLK_PORT PORTB
#define DISPLAY_CLK_PIN 5

#define DISPLAY_DATA_DIR DDRB
#define DISPLAY_DATA_PORT PORTB
#define DISPLAY_DATA_PIN 3

#define DISPLAY_CS_DIR DDRB
#define DISPLAY_CS_PORT PORTB
#define DISPLAY_CS_PIN 2

#define DISPLAY_DC_DIR DDRB
#define DISPLAY_DC_PORT PORTB
#define DISPLAY_DC_PIN 1

#define DISPLAY_RESET_DIR DDRB
#define DISPLAY_RESET_PORT PORTB
#define DISPLAY_RESET_PIN 0

#define P_CPU_NS (1000000000UL / F_CPU)

#define MEASUREMENT_1_ADDRESS 0
#define MEASUREMENT_2_ADDRESS 1
#define MEASUREMENT_3_ADDRESS 2
#define MEASUREMENT_4_ADDRESS 3
#define BACKLIGHT_ADDRESS 4
#define TURNS_RATIO_ADDRESS 5

uint8_t u8x8_avr_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
void lcd_init();
void init();
void MainScreen();
void MeasurementSelect();
void Settings();
void TurnsRatioMenu();
void DrawScreen();

// Global variables
u8g2_t u8g2;
float MenuSettings[] = {0, 0, 0, 0, 4, 1}; // Measurement 1, Measurement 2, Measurement 3, Measurement 4, BacklightIndex, TurnsRatio
int MenuSettingsEEPROMAddresses[] = {MEASUREMENT_1_ADDRESS, MEASUREMENT_2_ADDRESS, MEASUREMENT_3_ADDRESS, MEASUREMENT_4_ADDRESS, BACKLIGHT_ADDRESS, TURNS_RATIO_ADDRESS};
int Menu; // 0 = main screen, 1 = measurement select, 2 = settings, 3 = edit turns ratio
int SelectPosition[2];
int ButtonTurn = 1;
int Backlight[] = {0, 64, 128, 192, 255};
int BacklightIndexCopy;
float TurnsRatioCopy;

uint8_t u8x8_avr_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
	uint8_t cycles;

	switch(msg)
	{
		case U8X8_MSG_DELAY_NANO:     // delay arg_int * 1 nano second
			// At 20Mhz, each cycle is 50ns, the call itself is slower.
			break;
		case U8X8_MSG_DELAY_100NANO:    // delay arg_int * 100 nano seconds
			// Approximate best case values...
#define CALL_CYCLES 26UL
#define CALC_CYCLES 4UL
#define RETURN_CYCLES 4UL
#define CYCLES_PER_LOOP 4UL

			cycles = (100UL * arg_int) / (P_CPU_NS * CYCLES_PER_LOOP);

			if(cycles > CALL_CYCLES + RETURN_CYCLES + CALC_CYCLES) 
				break;

			__asm__ __volatile__ (
			"1: sbiw %0,1" "\n\t" // 2 cycles
			"brne 1b" : "=w" (cycles) : "0" (cycles) // 2 cycles
			);
			break;
		case U8X8_MSG_DELAY_10MICRO:    // delay arg_int * 10 micro seconds
			for(int i=0 ; i < arg_int ; i++)
				_delay_us(10);
			break;
		case U8X8_MSG_DELAY_MILLI:      // delay arg_int * 1 milli second
			for(int i=0 ; i < arg_int ; i++)
				_delay_ms(1);
			break;
		default:
			return 0;
	}
	return 1;
}

uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{
	// Re-use library for delays

	switch(msg)
	{
		case U8X8_MSG_GPIO_AND_DELAY_INIT:  // called once during init phase of u8g2/u8x8
			DISPLAY_CLK_DIR |= 1<<DISPLAY_CLK_PIN;
			DISPLAY_DATA_DIR |= 1<<DISPLAY_DATA_PIN;
			DISPLAY_CS_DIR |= 1<<DISPLAY_CS_PIN;
			DISPLAY_DC_DIR |= 1<<DISPLAY_DC_PIN;
			DISPLAY_RESET_DIR |= 1<<DISPLAY_RESET_PIN;
			break;              // can be used to setup pins
		case U8X8_MSG_GPIO_SPI_CLOCK:        // Clock pin: Output level in arg_int
			if(arg_int)
				DISPLAY_CLK_PORT |= (1<<DISPLAY_CLK_PIN);
			else
				DISPLAY_CLK_PORT &= ~(1<<DISPLAY_CLK_PIN);
			break;
		case U8X8_MSG_GPIO_SPI_DATA:        // MOSI pin: Output level in arg_int
			if(arg_int)
				DISPLAY_DATA_PORT |= (1<<DISPLAY_DATA_PIN);
			else
				DISPLAY_DATA_PORT &= ~(1<<DISPLAY_DATA_PIN);
			break;
		case U8X8_MSG_GPIO_CS:        // CS (chip select) pin: Output level in arg_int
			if(arg_int)
				DISPLAY_CS_PORT |= (1<<DISPLAY_CS_PIN);
			else
				DISPLAY_CS_PORT &= ~(1<<DISPLAY_CS_PIN);
			break;
		case U8X8_MSG_GPIO_DC:        // DC (data/cmd, A0, register select) pin: Output level in arg_int
			if(arg_int)
				DISPLAY_DC_PORT |= (1<<DISPLAY_DC_PIN);
			else
				DISPLAY_DC_PORT &= ~(1<<DISPLAY_DC_PIN);
			break;
		
		case U8X8_MSG_GPIO_RESET:     // Reset pin: Output level in arg_int
			if(arg_int)
				DISPLAY_RESET_PORT |= (1<<DISPLAY_RESET_PIN);
			else
				DISPLAY_RESET_PORT &= ~(1<<DISPLAY_RESET_PIN);
			break;
		default:
			if (u8x8_avr_delay(u8x8, msg, arg_int, arg_ptr))	// check for any delay msgs
				return 1;
			u8x8_SetGPIOResult(u8x8, 1);      // default return value
			break;
	}
	return 1;
}

int main(void)
{
    lcd_init();
    init();
    
	/* full buffer example, setup procedure ends in _f */
	u8g2_ClearBuffer(&u8g2);
	u8g2_SetFont(&u8g2, u8g2_font_ncenB14_tr);
	u8g2_DrawStr(&u8g2, 1, 18, "U8g2 on AVR");
	u8g2_SendBuffer(&u8g2);
		
	while(1){
		DrawScreen();
		if (!Menu) {
			MainScreen();
		} else if (Menu == 1) {
			MeasurementSelect();
		} else if (Menu == 2) {
			Settings();
		} else if (Menu == 3) {
			TurnsRatioMenu();
		}
	}
}

void lcd_init(void){
    /*
		Select a setup procedure for your display from here: https://github.com/olikraus/u8g2/wiki/u8g2setupc
		1. Arg: Address of an empty u8g2 structure
		2. Arg: Usually U8G2_R0, others are listed here: https://github.com/olikraus/u8g2/wiki/u8g2reference#carduino-example
		3. Arg: Protocol procedure (u8g2-byte), list is here: https://github.com/olikraus/u8g2/wiki/Porting-to-new-MCU-platform#communication-callback-eg-u8x8_byte_hw_i2c
		4. Arg: Defined in this code itself (see above)
	*/
	//u8g2_Setup_st7565_ea_dogm132_f( &u8g2, U8G2_R0, u8x8_byte_4wire_sw_spi, u8x8_avr_gpio_and_delay );
	u8g2_Setup_st7920_s_128x64_f(&u8g2, U8G2_R0, u8x8_byte_4wire_sw_spi, u8x8_avr_gpio_and_delay);
	
	u8g2_InitDisplay(&u8g2);
	u8g2_SetPowerSave(&u8g2, 0);
}

void init(){
    // Set input ports for buttons
    DDRB &= ~(1<<1)|(1<<4)|(1<<6)|(1<<7); // 1 and 4 are the Enter and Back buttons
    DDRD &= ~(1<<6)|(1<<7);
    
    // Set output port for LCD backlight
	DDRD |= (1<<5);
	
	TCCR0A |= (1 << WGM01) | (1 << WGM00) | (1 << COM0B1); // set fast PWM Mode and non-inverting mode
	TCCR0B |= (1 << CS01);  // set prescaler to 8
    
    if ((eeprom_read_word((uint16_t)MEASUREMENT_1_ADDRESS) < 1) || (eeprom_read_word((uint16_t*) MEASUREMENT_1_ADDRESS) > 13)){
		for (int i = 0; i < 6; i++){
			if (i == 4) {
				eeprom_write_word((uint16_t*)MenuSettingsEEPROMAddresses[i], 4);
			} else {
				eeprom_write_word((uint16_t*)MenuSettingsEEPROMAddresses[i], 1);
			}
		}
    } else {
		for (int i = 0; i < 6; i++){
			MenuSettings[0] = eeprom_read_word ((uint16_t*)MenuSettingsEEPROMAddresses[i]);
		}
    }
	
	OCR0B = Backlight[(int)MenuSettings[4]];
}

/*
(PINB & (1<<1)) // Enter
((PINB & (1<<4))) // Back
((PINB & (1<<6))) // Up
((PINB & (1<<7))) // Down
((PIND & (1<<6))) // Right
((PIND & (1<<7))) // Left
*/

void MainScreen() {
	if (ButtonTurn){
		if ((PINB & (1<<1)) || (PIND & (1<<6))) { // Enter and right
			ButtonTurn = 0;
			if ((SelectPosition[0]<4)) {
				Menu = 1; // Measurement select menu
				SelectPosition[1] = eeprom_read_word ((uint16_t*)MenuSettingsEEPROMAddresses[SelectPosition[0]]);
			} else if (SelectPosition[0] == 4) {
				Menu = 2; // Settings menu
				SelectPosition[1] = 0;
				BacklightIndexCopy = (int)MenuSettings[4];
			}
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) { // Up
			ButtonTurn = 0;
			SelectPosition[0]--;
			if (SelectPosition[0]<0) {
				SelectPosition[0] = 4;
			}
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			SelectPosition[0]++;
			if (SelectPosition[0]>4) {
				SelectPosition[0] = 0;
			}
			ButtonTurn = 1;
		}
	}
}

void MeasurementSelect(){
	if (ButtonTurn){
		if ((PINB & (1<<1)) || (PINB & (1<<7))) { // Enter and left
			ButtonTurn = 0;
			eeprom_write_word((uint16_t*)MenuSettingsEEPROMAddresses[SelectPosition[0]], SelectPosition[1]+1);
			Menu--;
			ButtonTurn = 1;
		} else if (PINB & (1<<4)) { // Back
			ButtonTurn = 0;
			Menu--;
			SelectPosition[1] = 0;
			ButtonTurn = 1;
		} else if (PINB & (1<<6)) { // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1]<0) {
				SelectPosition[1] = 12;
			}
			ButtonTurn = 1;
		} else if (PINB & (1<<7)) { // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1]>12) {
				SelectPosition[1] = 0;
			}
			ButtonTurn = 1;
		}
	}
}

void Settings(){
	if (ButtonTurn){
		if (PINB & (1<<1)) { // Enter
			if (SelectPosition[1] == 1) {
				ButtonTurn = 0;
				Menu++;
				TurnsRatioCopy = eeprom_read_word ((uint16_t*)MenuSettingsEEPROMAddresses[5]);
				SelectPosition[1] = 0;
				ButtonTurn = 1;
			} else {
				ButtonTurn = 0;
				Menu--;
				MenuSettings[4] = BacklightIndexCopy;
				OCR0B = Backlight[(int)MenuSettings[4]];
				eeprom_write_word((uint16_t*)MenuSettingsEEPROMAddresses[4], MenuSettings[4]);
				ButtonTurn = 1;
			}
		} else if ((PINB & (1<<4))) { // Back
			ButtonTurn = 0;
			Menu--;
			BacklightIndexCopy = (int)MenuSettings[4];
			OCR0B = Backlight[(int)MenuSettings[4]];
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) { // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 1;
			}
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 1) {
				SelectPosition[1] = 0;
			}
			ButtonTurn = 1;
		} else if ((PIND & (1<<6)) && (SelectPosition[1] == 0)) { // Right
			ButtonTurn = 0;
			BacklightIndexCopy++;
			if (BacklightIndexCopy > 4) {
				BacklightIndexCopy = 0;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			ButtonTurn = 1;
		} else if ((PIND & (1<<7)) && (SelectPosition[1] == 0)) { // Left
			ButtonTurn = 0;
			BacklightIndexCopy--;
			if (BacklightIndexCopy < 0) {
				BacklightIndexCopy = 4;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			ButtonTurn = 1;
		}
	}
}

void TurnsRatioMenu(){
	if (ButtonTurn){
		if ((PINB & (1<<1))) { // Enter
			ButtonTurn = 0;
			MenuSettings[5] = TurnsRatioCopy;
			eeprom_write_word((uint16_t*)MenuSettingsEEPROMAddresses[5], TurnsRatioCopy);
			Menu--;
			ButtonTurn = 1;
		} else if ((PINB & (1<<4))) { // Back
			ButtonTurn = 0;
			Menu--;
			SelectPosition[1] = 1;
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) { // Up
			ButtonTurn = 0;
			if ((10 / pow(10,SelectPosition[1])) == 9) {
				TurnsRatioCopy -= (90 / pow(10,SelectPosition[1]));
			} else {
				TurnsRatioCopy += (10 / pow(10,SelectPosition[1]));
			}
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			if ((10 / pow(10,SelectPosition[1])) == 0) {
				TurnsRatioCopy += (90 / pow(10, SelectPosition[1]));
			} else {
				TurnsRatioCopy -= (10 / pow(10, SelectPosition[1]));
			}
			ButtonTurn = 1;
		} else if ((PIND & (1<<6))) { // Right
			ButtonTurn = 0;
			SelectPosition[1]++;
			ButtonTurn = 1;
		} else if ((PIND & (1<<7))) { // Left
			ButtonTurn = 0;
			SelectPosition[1]--;
			ButtonTurn = 1;
		}
	}
}

void DrawScreen(){
	
}
