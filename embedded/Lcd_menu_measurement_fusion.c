#include <avr/io.h>

FUSES = {
	.low = 0xE2, // LOW {SUT_CKSEL=INTRCOSC_8MHZ_6CK_14CK_65MS, CKOUT=CLEAR, CKDIV8=CLEAR}
	.high = 0xD9, // HIGH {BOOTRST=CLEAR, BOOTSZ=2048W_3800, EESAVE=CLEAR, WDTON=CLEAR, SPIEN=SET, DWEN=CLEAR, RSTDISBL=CLEAR}
	.extended = 0xFF, // EXTENDED {BODLEVEL=DISABLED}
};

LOCKBITS = 0xFF; // {LB=NO_LOCK, BLB0=NO_LOCK, BLB1=NO_LOCK}

#define F_CPU 8000000UL

#include "u8g2.h"
#include <util/delay.h>
//#include <avr/eeprom.h>
#include <math.h>
#include <stdio.h>
#include <avr/power.h>
#include <time.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdint.h>
#include <avr/io.h>

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

#define ENTER (PINB & (1<<1))
#define BACK (PINB & (1<<4))
#define UP (PINB & (1<<6))
#define DOWN (PINB & (1<<7))
#define RIGHT (PIND & (1<<6))
#define LEFT (PIND & (1<<7))

#define P_CPU_NS (1000000000UL / F_CPU)

#define MEASUREMENT_1_ADDRESS 0
#define MEASUREMENT_2_ADDRESS 1
#define MEASUREMENT_3_ADDRESS 2
#define MEASUREMENT_4_ADDRESS 3
#define BACKLIGHT_ADDRESS 4
#define TURNS_RATIO_ADDRESS 5

#define MEASUREMENTS 15

//UART COMMUNICATION
#define F_CPU 8000000UL
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)

//MEASUREMENTS: for measurements read from the channels, and measurements calculated from those
#define VREF 5.0f
#define NUM_SAMPLES 100
#define NO_MEASUREMENTS 16 //See comment at the end of main for the format
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

uint8_t u8x8_avr_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
void lcd_init();
void init();
void DrawPCIcon();
void DrawTime();
void MainScreenDraw();
void MainScreen();
void MeasurementSelectDraw();
void MeasurementSelect();
void SettingsDraw();
void Settings();
void TurnsRatioMenu();
void TurnsRatioMenuDraw();
void DrawScreen();

// Global variables
u8g2_t u8g2;
float MenuSettings[] = {0, 0, 0, 0, 4, 1}; // Measurement 1, Measurement 2, Measurement 3, Measurement 4, BacklightIndex, TurnsRatio
int MenuSettingsEEPROMAddresses[] = {MEASUREMENT_1_ADDRESS, MEASUREMENT_2_ADDRESS, MEASUREMENT_3_ADDRESS, MEASUREMENT_4_ADDRESS, BACKLIGHT_ADDRESS, TURNS_RATIO_ADDRESS};

/*
DC Voltage,
DC Current, 
AC Voltage RMS, 
AC Current (high current mode) RMS, 
AC Current (low current mode) RMS, 
AC Voltage Vpp, 
AC Current (high current mode) Vpp, 
AC Current (low current mode) Vpp, 
        phase difference, 
        power factor, 
        frequency, 
        DC power, 
        AC real power, 
        AC reactive power, 
        AC apparent power
   */     

//char* MeasurementName[13] = {"DCV (V)","DCC (A)","DCP (W)","ACV (V)","ACC (A)","ACF (Hz)","ACPD (Degrees)","ACP (W)","ACRP (VAR)","ACAP (VA)", "ACPF","ACPV (V)","ACPC (A)"};
char* MeasurementName[15] = {"DCV (V)",
	"DCC (A)",
	"ACV (V)",
	"ACCH (A)",
	"ACCL (A)",
	"ACVPP (V)",
	"ACCPPH (A)",
	"ACCPPL (A)",
	"PD",
	"PF",
	"F (Hz)",
	"DCP (W)",
	"ACRP (W)",
	"ACRRP (W)",
	"ACAP (W)"};

int Menu; // 0 = main screen, 1 = measurement select, 2 = settings, 3 = edit turns ratio
int SelectPosition[2]; // 0 = row position for the main screen, 1 = secondary position used for other menus
int ButtonTurn = 1; // Button turn baton
int Backlight[] = {0, 64, 128, 192, 255}; // Values for OCR0B for Backlight
int BacklightIndexCopy; // Copy of Backlight Index
float TurnsRatioCopy; // Copy of Transformer Turns Ratio
int LcdTick; // Tick to indicate screen refresh

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

//Timer
volatile uint8_t timerFlag = 1;

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

//OCR2A triggers approx every 30ms
void setup_timer(void){
	
	//CTC mode
	TCCR2A = (1 << WGM21);
	
	//Set output compare value
	OCR2A = 255;
	
	// /1024 prescalar
	TCCR2B |= (1 << CS22) | (1 << CS21) | (1 << CS20);
	
	//Enable interrupts
	TIMSK2 |= (1 << OCIE2A);
}

ISR(TIMER2_COMPA_vect){
	timerFlag = 1;
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
	
	float scalingRatio = 1.0f;
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
	float currentToVoltageRatio = 1.0f;
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

// *****************************    LCD CODE    *********************************************

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

uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
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
			if (u8x8_avr_delay(u8x8, U8X8_MSG_DELAY_NANO, arg_int, arg_ptr))	// check for any delay msgs
				return 1;
			u8x8_SetGPIOResult(u8x8, 1);      // default return value
			break;
	}
	return 1;
}

float eepromRead(unsigned int address) {
    /* Wait for completion of previous write */
    while(EECR & (1<<EEPE)){
    }
    /* Set up address register */
    EEAR = address;
    /* Start eeprom read by writing EERE */
    EECR |= (1<<EERE);
    /* Return data from Data Register */
    return EEDR;
}

void eepromUpdate(unsigned int address, float data) {
    /* Wait for completion of previous write */
    while(EECR & (1<<EEPE)) {
    }
    if (data != eepromRead(address)) {
        /* Set up address and Data Registers */
        EEAR = address;
        EEDR = data;
        /* Write logical one to EEMPE */
        EECR |= (1<<EEMPE);
        /* Start eeprom write by setting EEPE */
        EECR |= (1<<EEPE);
    }
}

// Define An Interrupt Handler for TIMER1_COMPA Interrupt (Nesting Disabled)
ISR(TIMER1_COMPA_vect) {
    LcdTick = 1;     // signal "tick" event
}

void lcd_init(void){
    /*
		Select a setup procedure for your display from here: https://github.com/olikraus/u8g2/wiki/u8g2setupc
		1. Arg: Address of an empty u8g2 structure
		2. Arg: Usually U8G2_R0, others are listed here: https://github.com/olikraus/u8g2/wiki/u8g2reference#carduino-example
		3. Arg: Protocol procedure (u8g2-byte), list is here: https://github.com/olikraus/u8g2/wiki/Porting-to-new-MCU-platform#communication-callback-eg-u8x8_byte_hw_i2c
		4. Arg: Defined in this code itself (see above)
	*/
	u8g2_Setup_st7920_s_128x64_f(&u8g2, U8G2_R0, u8x8_byte_4wire_sw_spi, u8x8_avr_gpio_and_delay);
	
	u8g2_InitDisplay(&u8g2);
	u8g2_SetPowerSave(&u8g2, 0);
	
	u8g2_SetFontMode(&u8g2, 1);
    u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr);
	u8g2_SetDrawColor(&u8g2, 2);
}

void init(){
    clock_prescale_set(clock_div_1); // set the clock prescaler to 1
    
    //eeprom_update_float((float*)(MenuSettingsEEPROMAddresses[4]), (float)4);
    
    // Set input ports for buttons
    DDRB &= ~(1<<1)|(1<<4)|(1<<6)|(1<<7); // 1 and 4 are the Enter and Back buttons
    DDRD &= ~(1<<2)|(1<<6)|(1<<7); // 2 is for checking pc connection
    
    // Set output port for LCD backlight
	DDRD |= (1<<5);
	
	TCCR0A |= (1 << WGM01) | (1 << WGM00) | (1 << COM0B1); // set fast PWM Mode and non-inverting mode
	TCCR0B |= (1 << CS01);  // set prescaler to 8
    
    // Set up Timer/Counter1
    TCCR1B |= (1 << WGM12);   // Configure timer 1 for CTC mode
    OCR1A = (uint16_t)(1000000 / 4);     // Set CTC compare value for 8MHz AVR clock , with a prescaler of 8 (1000000 is 1 second)
    TIMSK1 |= (1 << OCIE1A);  // Enable CTC interrupt
    TCCR1B |= (1 << CS11); // Start Timer/Counter1 at F_CPU/8

    // Enable global interrupts 
    sei();
    
    if (((int)eepromRead(MEASUREMENT_1_ADDRESS) >= 1) && ((int)eepromRead(MEASUREMENT_1_ADDRESS) <= 14)) {
		for (int i = 0; i < 6; i++){
            if (i < 4) {
                MenuSettings[i] = (eepromRead(MenuSettingsEEPROMAddresses[i]) - 1); // Read values from addresses if values are already stored there.
            } else {
                MenuSettings[i] = eepromRead(MenuSettingsEEPROMAddresses[i]); // Read values from addresses if values are already stored there.
            }
		}
        OCR0B = 0;
    } else {
        for (int i = 0; i < 6; i++){ // Write initial values to menu setting addresses
			if (i == 4) {
				eepromUpdate(i, (float)4); // Initial Backlight value. 4 is 100% Backlight.
			} else {
				eepromUpdate(i, 1);
			}
		}
        OCR0B = Backlight[4];
    }
	//OCR0B = Backlight[4]; // Set Backlight
	//OCR0B = Backlight[(int)eeprom_read_float((float*)BACKLIGHT_ADDRESS)]; // Set Backlight
}

void DrawPCIcon() {
    u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawFrame(&u8g2, 121, 59, 5, 3);
	u8g2_DrawBox(&u8g2, 122, 62, 3, 1);
}

void DrawTime() {
    u8g2_SetFont(&u8g2, u8g2_font_u8glib_4_hr); // Change to smaller font
    u8g2_SetDrawColor(&u8g2, 2);
    char Index[2];
	sprintf(Index , "%d", (int)eepromRead(MEASUREMENT_3_ADDRESS));
	u8g2_DrawStr(&u8g2, 55, 61, Index);
	u8g2_DrawStr(&u8g2, 60, 57, "{INSERT DATETIME}");
    u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr);
}

void MainScreenDraw(float* measurements) {
	for (int i=0; i<5; i++) {
        if (i == SelectPosition[0]) { // Selection Box
            u8g2_SetDrawColor(&u8g2, 1);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 0);
        } else {
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 1);
        }
		if (i<4) {
			u8g2_DrawStr(&u8g2, 1, 10 + (i * 13), MeasurementName[(int)MenuSettings[i]]); // MenuSettings stores the index for which measurement it is
            char Measurement[7];
            sprintf(Measurement , "%.2f", measurements[(int)MenuSettings[i]]); // Convert Measurement float value to string
            u8g2_DrawStr(&u8g2, 47, 10 + (i * 13), Measurement); // Each row is 9 high with 2 space in between
		} else {
			u8g2_DrawStr(&u8g2, 1, 61, "Settings");
		}
	}
    u8g2_SetDrawColor(&u8g2, 2);
    u8g2_DrawLine(&u8g2, 44, 1, 44, 48); // Line separating measurement name from measurement value
}

void MainScreen(float* measurements) {
	MainScreenDraw(measurements); // Refreshes display constantly to display changing values.
	if (ButtonTurn) { // Attempts to prevent pressing of multiple buttons.
		if (ENTER || RIGHT) { // Enter and right
			ButtonTurn = 0;
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			if (SelectPosition[0]<4) {
				Menu = 1; // Measurement select menu
				SelectPosition[1] = (int)MenuSettings[SelectPosition[0]]; // Set position at the index of the measurement for Measurement select screen.
                MeasurementSelectDraw();
			} else if (SelectPosition[0] == 4) {
				Menu = 2; // Settings menu
				SelectPosition[1] = 0;
				BacklightIndexCopy = (int)MenuSettings[4];
                SettingsDraw();
			}
			ButtonTurn = 1;
		} else if (UP) { // Up
			ButtonTurn = 0;
			SelectPosition[0]--;
			if (SelectPosition[0]<0) {
				SelectPosition[0] = 4;
			}
			ButtonTurn = 1;
		} else if (DOWN) { // Down
            if (OCR0B == 0) {
                OCR0B = Backlight[(int)MenuSettings[4]]; // Set Backlight
            } else {
                OCR0B = 0; // Set Backlight
            }
			ButtonTurn = 0;
			SelectPosition[0]++;
			if (SelectPosition[0]>4) {
				SelectPosition[0] = 0;
			}
			ButtonTurn = 1;
		}
	}
}

void MeasurementSelectDraw() {
	for (int i=0; i<4; i++) {
		if (i == SelectPosition[0]) { // Selection Box
			u8g2_SetDrawColor(&u8g2, 1);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawStr(&u8g2, 1, 10 + (i * 13), MeasurementName[(int)MenuSettings[i]]);
		} else {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 1);
		}
		if (i < SelectPosition[0]) { // Shows measurements above select
			u8g2_DrawStr(&u8g2, 50, 10 + (i * 13), MeasurementName[SelectPosition[1] - (SelectPosition[0] - i)]);
		} else { // Shows measurements below select
			u8g2_DrawStr(&u8g2, 50, 10 + (i * 13), MeasurementName[SelectPosition[1] + (i - SelectPosition[0])]);
		}
	}
    u8g2_SetDrawColor(&u8g2, 0);
    u8g2_DrawBox(&u8g2, 0, (4 * 13) - 1, 128, 13);
	u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawLine(&u8g2, 44, 1, 44, 48); // Line separating measurement name from measurement value
}

void MeasurementSelect(){
    MeasurementSelectDraw();
	if (ButtonTurn){
		if (ENTER || LEFT) { // Enter and left
			ButtonTurn = 0;
			MenuSettings[SelectPosition[0]] = SelectPosition[1]; // Confirm measurement selection
			eepromUpdate(MenuSettingsEEPROMAddresses[SelectPosition[0]], SelectPosition[1] + 1); // Update in EEPROM
			Menu--;
			ButtonTurn = 1;
		} else if (BACK) { // Back
			ButtonTurn = 0;
			Menu--;
			ButtonTurn = 1;
		} else if (UP) { // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = MEASUREMENTS - 1;
			}
			MeasurementSelectDraw();
			ButtonTurn = 1;
		} else if (DOWN) { // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > (MEASUREMENTS - 1)) {
				SelectPosition[1] = 0;
			}
			MeasurementSelectDraw();
			ButtonTurn = 1;
		}
	}
}

void SettingsDraw() {
	//u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr); // Reset font after returning from TurnsRatioMenuDraw
	for (int i=0; i<2; i++) {
		if (i == SelectPosition[0]) { // Selection Box
			u8g2_SetDrawColor(&u8g2, 1);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 0);
		} else {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 1);
		}
		if (i == 0) {
			u8g2_DrawStr(&u8g2, 1, 10, "Backlight:");
			u8g2_DrawTriangle(&u8g2, 60, 1, 53, 5, 60, 9); // Arrows
			u8g2_DrawTriangle(&u8g2, 70, 1, 77, 5, 70, 9);
			char Index[2];
			sprintf(Index , "%d", BacklightIndexCopy); // Convert int BacklightIndexCopy to string
			u8g2_DrawStr(&u8g2, 63, 10, Index);
		} else {
			u8g2_DrawStr(&u8g2, 1, 24, "Turns Ratio:");
			char TurnsRatio[7];
			sprintf(TurnsRatio , "%.3f", (float)MenuSettings[5]); // Convert float TurnsRatio to string
			u8g2_DrawStr(&u8g2, 70, 24, TurnsRatio);
		}
	}
}

void Settings() {
    SettingsDraw();
	if (ButtonTurn){
		if (PINB & (1<<1)) { // Enter
			if (SelectPosition[1] == 1) { // Into transformer turns ratio edit screen
				ButtonTurn = 0;
				Menu++;
				TurnsRatioCopy = MenuSettings[5];
				SelectPosition[1] = 0;
				ButtonTurn = 1;
                TurnsRatioMenuDraw();
			} else { // Confirm Backlight setting
				ButtonTurn = 0;
				Menu--;
				MenuSettings[4] = BacklightIndexCopy;
				OCR0B = Backlight[(int)MenuSettings[4]];
				//eeprom_update_float((float*)MenuSettingsEEPROMAddresses[4], MenuSettings[4]);
				ButtonTurn = 1;
			}
		} else if ((PINB & (1<<4))) { // Back. Exit settings without saving backlight setting changes
			ButtonTurn = 0;
			Menu--;
			BacklightIndexCopy = (int)MenuSettings[4]; // Return without saving Backlight changes
			OCR0B = Backlight[(int)MenuSettings[4]];
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) { // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 1;
			}
			SettingsDraw();
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 1) {
				SelectPosition[1] = 0;
			}
			SettingsDraw();
			ButtonTurn = 1;
		} else if ((PIND & (1<<6)) && (SelectPosition[1] == 0)) { // Right. Increase backlight setting
			ButtonTurn = 0;
			BacklightIndexCopy++;
			if (BacklightIndexCopy > 4) {
				BacklightIndexCopy = 0;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			SettingsDraw();
			ButtonTurn = 1;
		} else if ((PIND & (1<<7)) && (SelectPosition[1] == 0)) { // Left. Decrease backlight setting
			ButtonTurn = 0;
			BacklightIndexCopy--;
			if (BacklightIndexCopy < 0) {
				BacklightIndexCopy = 4;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			SettingsDraw();
			ButtonTurn = 1;
		}
	}
}

void TurnsRatioMenuDraw() {
	int DecimalOffset; // Used to offset the x position due to the decimal
	
	SettingsDraw(); // Display normal settings screen
	
	char TurnsRatio[7];
	sprintf(TurnsRatio , "%.3f", TurnsRatioCopy); // Convert TurnsRatioCopy to string
	u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);
	
	//u8g2_SetFont(&u8g2, u8g2_font_VCR_OSD_mn); // Change to larger font
	for (int i=0; i<5; i++) { // Exact values yet to be confirmed
		if (i == 2) { // Account for decimal
			DecimalOffset = 3; 
		}
		u8g2_DrawTriangle(&u8g2, (i * 5) - 2 + DecimalOffset, 27, (i * 5) + DecimalOffset, 22, (i * 5) + 2 + DecimalOffset, 27); // Arrows
		u8g2_DrawTriangle(&u8g2, (i * 5) - 2 + DecimalOffset, 46, (i * 5) + DecimalOffset, 51, (i * 5) + 2 + DecimalOffset, 46);
		if (i == SelectPosition[0]) {
			u8g2_SetDrawColor(&u8g2, 1);
			u8g2_DrawBox(&u8g2, (i * 5) + DecimalOffset, 60, 5, 11);
			u8g2_SetDrawColor(&u8g2, 2);
		}
	}
}

void TurnsRatioMenu(){
    TurnsRatioMenuDraw();
	if (ButtonTurn){
		if ((PINB & (1<<1))) { // Enter. Confirm New Turn Ratio
			ButtonTurn = 0;
			MenuSettings[5] = TurnsRatioCopy; 
			//eeprom_update_float((float*)MenuSettingsEEPROMAddresses[5], TurnsRatioCopy);
			Menu--;
			ButtonTurn = 1;
            SettingsDraw();
		} else if ((PINB & (1<<4))) { // Back. Return without saving Turns Ratio changes
			ButtonTurn = 0;
			Menu--;
			SelectPosition[1] = 1;
			ButtonTurn = 1;
            SettingsDraw();
		} else if ((PINB & (1<<6))) { // Up
			ButtonTurn = 0;
			
			char TurnsRatio[7];
			sprintf(TurnsRatio , "%.3f", TurnsRatioCopy); // Convert TurnsRatioCopy to string
			u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);
			
			if ((TurnsRatio[SelectPosition[1]] - '0') == 9) { // Check specific digit
				TurnsRatioCopy -= (90 / pow(10, SelectPosition[1])); // Up from 9, cycle to 0
			} else {
				TurnsRatioCopy += (10 / pow(10, SelectPosition[1])); // plus 10 / (10 ^ digit place). e.g. if 1st digit: 10 / 10 ^ 0 = 10 / 1 = 10
			}
			TurnsRatioMenuDraw();
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			
			char TurnsRatio[7];
			sprintf(TurnsRatio , "%.3f", TurnsRatioCopy); // Convert TurnsRatioCopy to string
			u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);
			
			if ((TurnsRatio[SelectPosition[1]] - '0') == 0) {  // Check specific digit
				TurnsRatioCopy += (90 / pow(10, SelectPosition[1])); // Down from 0, cycle to 9
			} else {
				TurnsRatioCopy -= (10 / pow(10, SelectPosition[1])); // subtract 10 / (10 ^ digit place). e.g. if 1st digit: 10 / 10 ^ 0 = 10 / 1 = 10
			}
			TurnsRatioMenuDraw();
			ButtonTurn = 1;
		} else if ((PIND & (1<<6))) { // Right
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 4) {
				SelectPosition[1] = 0;
			}
			TurnsRatioMenuDraw();
			ButtonTurn = 1;
		} else if ((PIND & (1<<7))) { // Left
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 4;
			}
			TurnsRatioMenuDraw();
			ButtonTurn = 1;
		}
	}
}

// ***************    MAIN    *************************


int main(void) {
    lcd_init();
    init();
	
	UART_init();
	setup_ADC();
	setup_timer();

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
    
	while(1){
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
/*
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
*/
            //print full measurement array for communication to gui, every 30ms
            if (timerFlag) {
                timerFlag = 0;
                UART_print_measurements(measurements);
            }
            //ARRAY FORMAT IS: [DC Voltage, DC Current, AC Voltage RMS, AC Current (high current mode) RMS, AC Current (low current mode) RMS, AC Voltage Vpp, AC Current (high current mode) Vpp, AC Current (low current mode) Vpp, phase difference, power factor, frequency, DC power, AC real power, AC reactive power, AC apparant power, RTC time]
        }
		
		// *************************     LCD CODE      ******************************
		
        if (LcdTick) {
            u8g2_ClearBuffer(&u8g2);
        }
		if (!Menu) { // The different menu screens.
			MainScreen(measurements);
		} else if (Menu == 1) {
			MeasurementSelect();
		} else if (Menu == 2) {
			Settings();
		} else if (Menu == 3) {
			TurnsRatioMenu();
		}
		if (PIND & (1<<2)) {
			DrawPCIcon();
		}
		DrawTime();
        if (LcdTick) {
            u8g2_SendBuffer(&u8g2);
            LcdTick = 0;
        }
	}
}