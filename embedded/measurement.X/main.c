// *************************      INCLUDES      ******************************
#define F_CPU 8000000UL
#include <avr/io.h>
#include "u8g2.h"
#include <util/delay.h>
#include <math.h>
#include <stdio.h>
#include <avr/power.h>
#include <time.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdint.h>

// *************************      CLOCK SPEED      ******************************
FUSES = {
	.low = 0xE2, // LOW {SUT_CKSEL=INTRCOSC_8MHZ_6CK_14CK_65MS, CKOUT=CLEAR, CKDIV8=CLEAR}
	.high = 0xD9, // HIGH {BOOTRST=CLEAR, BOOTSZ=2048W_3800, EESAVE=CLEAR, WDTON=CLEAR, SPIEN=SET, DWEN=CLEAR, RSTDISBL=CLEAR}
	.extended = 0xFF, // EXTENDED {BODLEVEL=DISABLED}
};

LOCKBITS = 0xFF; // {LB=NO_LOCK, BLB0=NO_LOCK, BLB1=NO_LOCK}



// *************************      LCD DEFINES      ******************************
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

// *************************      RTC DEFINES      ******************************
//RTC / DS1307
#define DS1307_ADDR 0x68
#define RTC_SET_ON_BOOT 0

typedef struct {
    uint8_t sec;
    uint8_t min;
    uint8_t hour;
    uint8_t dayOfWeek;
    uint8_t day;
    uint8_t month;
    uint8_t year;
    uint8_t clockHalted;
} rtc_time_t;

// *************************      UART COMMUNICATION      ******************************
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)
#define TX_BUFFER_SIZE 64
volatile char tx_buffer[TX_BUFFER_SIZE];
volatile uint8_t tx_head = 0;
volatile uint8_t tx_tail = 0;

// *************************      MEASUREMENT DEFINES      ******************************
//MEASUREMENTS: for measurements read from the channels, and measurements calculated from those
#define VREF 5.0f
#define NUM_SAMPLES 1000
#define NO_MEASUREMENTS 16
#define MEAS_DC_VOLTAGE 0
#define MEAS_DC_CURRENT 1
#define MEAS_AC_VOLTAGE 2
#define MEAS_AC_CURRENT_HIGH 3
#define MEAS_AC_CURRENT_LOW 4
#define MEAS_AC_VOLTAGE_VPP 5
#define MEAS_AC_CURRENT_HIGH_VPP 6
#define MEAS_AC_CURRENT_LOW_VPP 7
#define MEAS_PHASE_DIFFERENCE 8
#define MEAS_POWER_FACTOR 9
#define MEAS_FREQUENCY 10
#define MEAS_DC_POWER 11
#define MEAS_AC_REAL_POWER 12
#define MEAS_AC_REACTIVE_POWER 13
#define MEAS_AC_APPARANT_POWER 14
#define MEAS_RTC_TIME 15

#define HYSTERESIS 0.5f
#define FREQ_AVG_COUNT 10
#define T1_TICK_FREQ 1000000UL
#define FREQ_CALC_CONSTANT (T1_TICK_FREQ * (uint32_t)FREQ_AVG_COUNT)

//CHANNELS: the actual readings from the circuit
#define NO_CHANNELS 4
#define DC_VOLTAGE_CHANNEL 0
#define DC_CURRENT_CHANNEL 1
#define AC_VOLTAGE_CHANNEL 2
#define AC_CURRENT_HIGH_CHANNEL 3


// *************************      MEASUREMENT GLOBALS      ******************************
//For frequency and phase measurement!
volatile uint32_t timer2Overflows = 0;
volatile uint8_t timer2Flag = 0;
volatile uint8_t LcdTick = 0;

volatile uint32_t periodTicks = 0;
volatile uint32_t totalPeriodAccumulator = 0;
volatile uint8_t cycleCounter = 0;

volatile uint16_t lastACValue = 512;
volatile uint16_t lastACCurrentValue = 512;

volatile uint16_t lastVTimestamp = 0;
volatile uint16_t vCrossingTime = 0;
volatile uint16_t iCrossingTime = 0;

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

volatile uint16_t acSampleCount = 0;
volatile uint8_t acProcessingBusy = 0;
volatile uint8_t acDataReady = 0;

//STORED VARIABLES FOR ADC READING
volatile uint16_t ADCReading[NO_CHANNELS];
volatile uint8_t areReadingsReady = 0;
volatile uint8_t ADCSelectedChannel = 0;
volatile uint8_t discardNextSample = 0;

//flag for checking if AC current or dependent measurements are UL
volatile uint8_t isUL;

//cached RTC variables
volatile rtc_time_t rtcCachedTime;
volatile uint32_t rtcCachedSeconds = 0;
volatile uint8_t rtcValid = 0;
volatile uint8_t rtcTimeSet = 0;
volatile uint32_t lastRTCPoll = 0;


//Turns ratio
float turnsRatio = 26.788;

// LCD code function prototypes
uint8_t u8x8_avr_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
void lcd_init();
void init();
void DrawPCIcon();
void DrawTime();
void MainScreenDraw(float* measurements); //LCD code slightly changed by joe
void MainScreen(float* measurements);
void MeasurementSelectDraw(void);
void MeasurementSelect();
void SettingsDraw();
void Settings();
void TurnsRatioMenu();
void TurnsRatioMenuDraw();
void DrawScreen();

// active rtc prototypes
void TWI_init(void);
uint8_t TWI_wait_for_twint(void);
uint8_t TWI_start(uint8_t address_rw);
void TWI_stop(void);
uint8_t TWI_write(uint8_t data);
uint8_t TWI_read_ack(uint8_t *data);
uint8_t TWI_read_nack(uint8_t *data);
uint8_t bcd_to_dec(uint8_t bcd);
uint8_t dec_to_bcd(uint8_t dec);
uint8_t DS1307_read_time(rtc_time_t *t);
uint8_t DS1307_set_time(const rtc_time_t *t);
uint32_t rtc_seconds_of_day(const rtc_time_t *t);
uint8_t RTC_poll_and_cache(void);

// LCD Global variables
u8g2_t u8g2;
float MenuSettings[] = {0, 0, 0, 0, 4, 26.788}; // Measurement 1, Measurement 2, Measurement 3, Measurement 4, BacklightIndex, TurnsRatio
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

int Menu = 0; // 0 = main screen, 1 = measurement select, 2 = settings, 3 = edit turns ratio
int SelectPosition[2]; // 0 = row position for the main screen, 1 = secondary position used for other menus
int Backlight[] = {0, 64, 128, 192, 255}; // Values for OCR0B for Backlight
int BacklightIndexCopy = 4; // Copy of Backlight Index
float TurnsRatioCopy = 26.788; // Copy of Transformer Turns Ratio
int ButtonTurn = 1; // Button turn baton

//RTC Functions
void TWI_init(void) {
    TWSR = 0x00;
    TWBR = 32;
    TWCR = (1 << TWEN);
}

uint8_t TWI_wait_for_twint(void) {
    uint16_t timeout = 60000;
    while (!(TWCR & (1 << TWINT))) {
        timeout--;
        if (timeout == 0) return 0;
    }
    return 1;
}

uint8_t TWI_start(uint8_t address_rw) {
    TWCR = (1 << TWINT) | (1 << TWSTA) | (1 << TWEN);
    if (!TWI_wait_for_twint()) return 0;

    uint8_t status = TWSR & 0xF8;
    if ((status != 0x08) && (status != 0x10)) return 0;

    TWDR = address_rw;
    TWCR = (1 << TWINT) | (1 << TWEN);
    if (!TWI_wait_for_twint()) return 0;

    status = TWSR & 0xF8;
    if ((status != 0x18) && (status != 0x40)) return 0;

    return 1;
}

void TWI_stop(void) {
    TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWSTO);
    _delay_us(10);
}

uint8_t TWI_write(uint8_t data) {
    TWDR = data;
    TWCR = (1 << TWINT) | (1 << TWEN);
    if (!TWI_wait_for_twint()) return 0;

    uint8_t status = TWSR & 0xF8;
    return (status == 0x28);
}

uint8_t TWI_read_ack(uint8_t *data) {
    TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWEA);
    if (!TWI_wait_for_twint()) return 0;
    *data = TWDR;
    return 1;
}

uint8_t TWI_read_nack(uint8_t *data) {
    TWCR = (1 << TWINT) | (1 << TWEN);
    if (!TWI_wait_for_twint()) return 0;
    *data = TWDR;
    return 1;
}

uint8_t bcd_to_dec(uint8_t bcd) {
    return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

uint8_t dec_to_bcd(uint8_t dec) {
    return ((dec / 10) << 4) | (dec % 10);
}

uint8_t DS1307_read_time(rtc_time_t *t) {
    uint8_t raw;

    if (!TWI_start((DS1307_ADDR << 1) | 0)) return 0;
    if (!TWI_write(0x00)) { TWI_stop(); return 0; }
    if (!TWI_start((DS1307_ADDR << 1) | 1)) { TWI_stop(); return 0; }

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->clockHalted = (raw & 0x80) ? 1 : 0;
    t->sec = bcd_to_dec(raw & 0x7F);

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->min = bcd_to_dec(raw);

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->hour = bcd_to_dec(raw & 0x3F);

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->dayOfWeek = bcd_to_dec(raw);

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->day = bcd_to_dec(raw);

    if (!TWI_read_ack(&raw)) { TWI_stop(); return 0; }
    t->month = bcd_to_dec(raw);

    if (!TWI_read_nack(&raw)) { TWI_stop(); return 0; }
    t->year = bcd_to_dec(raw);

    TWI_stop();
    return 1;
}

uint8_t DS1307_set_time(const rtc_time_t *t) {
    if (!TWI_start((DS1307_ADDR << 1) | 0)) return 0;
    if (!TWI_write(0x00)) { TWI_stop(); return 0; }

    if (!TWI_write(dec_to_bcd(t->sec) & 0x7F)) { TWI_stop(); return 0; } // clear CH bit
    if (!TWI_write(dec_to_bcd(t->min)))       { TWI_stop(); return 0; }
    if (!TWI_write(dec_to_bcd(t->hour)))      { TWI_stop(); return 0; }
    if (!TWI_write(dec_to_bcd(t->dayOfWeek))) { TWI_stop(); return 0; }
    if (!TWI_write(dec_to_bcd(t->day)))       { TWI_stop(); return 0; }
    if (!TWI_write(dec_to_bcd(t->month)))     { TWI_stop(); return 0; }
    if (!TWI_write(dec_to_bcd(t->year)))      { TWI_stop(); return 0; }

    TWI_stop();
    return 1;
}

uint32_t rtc_seconds_of_day(const rtc_time_t *t) {
    return ((uint32_t)t->hour * 3600UL) +
           ((uint32_t)t->min * 60UL) +
           (uint32_t)t->sec;
}

uint8_t RTC_poll_and_cache(void) {
    rtc_time_t rtc;
    if (DS1307_read_time(&rtc)) {
        rtcCachedTime = rtc;
        rtcCachedSeconds = rtc_seconds_of_day(&rtc);
        rtcValid = 1;
        rtcTimeSet = rtc.clockHalted ? 0 : 1;
        return 1;
    }
    rtcValid = 0;
    rtcTimeSet = 0;
    return 0;
}

void UART_init(void) {
    tx_head = 0;
    tx_tail = 0;
    
	UBRR0H = (unsigned char)(UBRR_VALUE >> 8);
	UBRR0L = (unsigned char)UBRR_VALUE;

	UCSR0B = (1 << TXEN0) | (1 << RXEN0);
    //Frame: 8 data bits, 2 stop bits
	UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
}

void UART_transmit(char data) {
    uint8_t next_head = (tx_head + 1) % TX_BUFFER_SIZE;

    //If buffer is full, we must wait
    while (next_head == tx_tail); 

    tx_buffer[tx_head] = data;
    tx_head = next_head;

    //Enable the interrupt
    UCSR0B |= (1 << UDRIE0);
}

ISR(USART_UDRE_vect) {
    if (tx_head != tx_tail) {
        //Calculate next tail position
        uint8_t next_tail = (tx_tail + 1) % TX_BUFFER_SIZE;
        UDR0 = tx_buffer[tx_tail];
        tx_tail = next_tail;
    } else {
        //Buffer empty, disable interrupt
        UCSR0B &= ~(1 << UDRIE0);
    }
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
void setup_timer1_freerun(void) {
    //Normal mode
    TCCR1A = 0; 
    
    //Prescaler /8
    //At 8MHz, this means 1 tick = 1 microsecond.
    //The timer wraps every 65,536 microseconds (~65.5ms)
    //This is perfect for 50Hz (20ms) or 60Hz (16.6ms) signals.
    TCCR1B = (1 << CS11);
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

void handle_frequency_logic(uint16_t reading, uint8_t channel) {
    uint16_t midPoint = 512; 

    if (channel == AC_VOLTAGE_CHANNEL) {
        //Detect Positive-going Zero Crossing for Voltage
        if (lastACValue <= (midPoint - HYSTERESIS) && reading > (midPoint + HYSTERESIS)) {
            uint16_t currentTime = TCNT1; 
            uint16_t duration = currentTime - lastVTimestamp;
            lastVTimestamp = currentTime;
            vCrossingTime = currentTime; 

            totalPeriodAccumulator += duration;
            cycleCounter++;

            if (cycleCounter >= FREQ_AVG_COUNT) {
                periodTicks = totalPeriodAccumulator;
                totalPeriodAccumulator = 0;
                cycleCounter = 0;
            }
        }
        lastACValue = reading;
    }

    if (channel == AC_CURRENT_HIGH_CHANNEL) {
        // Detect Positive-going Zero Crossing for Current (for phase offset)
        if (lastACCurrentValue <= (midPoint - HYSTERESIS) && reading > (midPoint + HYSTERESIS)) {
            iCrossingTime = TCNT1;
        }
        lastACCurrentValue = reading;
    }
}

ISR(ADC_vect) {
    uint8_t channel = ADCSelectedChannel;
    uint16_t reading = ADC;

    if (discardNextSample) {
        discardNextSample = 0;
        ADC_start_conversion();
        return;
    }

    ADCReading[channel] = reading;

    if (!acProcessingBusy) {
        //Calculate frequency of voltage wave
        handle_frequency_logic(reading, channel);

        //Accumulate RMS data
        if (channel == AC_VOLTAGE_CHANNEL) {
            acVoltageSum += reading;
            acVoltageSumSq += (uint32_t)reading * (uint32_t)reading;
        }

        if (channel == AC_CURRENT_HIGH_CHANNEL) {
            acCurrentHighSum += reading;
            acCurrentHighSumSq += (uint32_t)reading * (uint32_t)reading;
            
            acSampleCount++;
            if (acSampleCount >= NUM_SAMPLES) {
                acDataReady = 1;
                acProcessingBusy = 1; 
            }
        }
    }

    //Channel switching logic
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
	float errorRatio = 1.681f;
    float errorSum = 0.080f;
	
	//Set convert ADC reading into voltage
	float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
	
	float vin = (scaledVout / scalingRatio);
    float vinCorrected = vin * errorRatio + errorSum;
	return vinCorrected;
}

//Converts the ADC reading into DC current, then calculates input DC current
float calculate_DC_current(uint16_t ADCreading) {
	
	float scalingRatio = 1.0f;
	float errorRatio = 1.954f;
    float errorSum = 0.023f;
	
	//Set convert ADC reading into voltage
	float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
	
	float vin = (scaledVout / scalingRatio);
    float vinCorrected = vin * errorRatio + errorSum;

	return vinCorrected;
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
	float errorRatio = 0.649f;
    float errorSum = -0.004f;

	float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
	float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);
    
    float vin = (ADCRMSVoltage / scalingRatio) * turnsRatio;
    float vinCorrected = vin * errorRatio + errorSum;
	return vinCorrected;
}

float calculate_AC_current_high_RMS(uint32_t sum, uint32_t sumSq, uint16_t count) {
	float scalingRatio = 1.0f;
	float currentToVoltageRatio = 10.0f;
	float errorRatio = 0.866f;
    float errorSum = -0.096f;

	float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
	float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);
	float currentRMS = (ADCRMSVoltage / scalingRatio) * currentToVoltageRatio;
    float currentRMSCorrected = currentRMS * errorRatio + errorSum;
	return currentRMSCorrected;
}

float calculate_frequency(uint32_t ticks) {
    if (ticks == 0) return 0.0f;
    // (1,000,000 ticks/sec * 10 cycles) / total ticks for 10 cycles
    return (float)FREQ_CALC_CONSTANT / (float)ticks;
}

float calculate_phase_difference(uint16_t vTime, uint16_t iTime, uint32_t avgPeriodTicks) {
    if (avgPeriodTicks == 0) return 0.0f;

    //Get the period of a single cycle from the averaged total
    float singleCycleTicks = (float)avgPeriodTicks / (float)FREQ_AVG_COUNT;
    
    //Calculate raw difference (time between V-crossing and I-crossing)
    //Result is in microseconds (ticks)
    int16_t diff = (int16_t)(iTime - vTime);

    //Convert time difference to degrees
    float phase = ((float)diff / singleCycleTicks) * 360.0f;

    //Normalize to -180 to 180 degrees
    while (phase > 180.0f){
        phase -= 360.0f;
    }
    while (phase < -180.0f){
        phase += 360.0f;
    }

    return phase;
}

float calculate_power_factor(float phase){
    float phaseRadians = phase * M_PI / 180.0f;
    float powerFactor = cosf(phaseRadians);
    
    return powerFactor;
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
		case U8X8_MSG_DELAY_NANO:// delay arg_int * 1 nano second
            // At 20Mhz, each cycle is 50ns, the call itself is slower.
			break;
		case U8X8_MSG_DELAY_100NANO:// delay arg_int * 100 nano seconds
            // Approximate best case values...
			#define CALL_CYCLES 26UL
			#define CALC_CYCLES 4UL
			#define RETURN_CYCLES 4UL
			#define CYCLES_PER_LOOP 4UL

			cycles = (100UL * arg_int) / (P_CPU_NS * CYCLES_PER_LOOP);

			if(cycles > CALL_CYCLES + RETURN_CYCLES + CALC_CYCLES)
				break;

			__asm__ __volatile__ (
			"1: sbiw %0,1" "\n\t"
			"brne 1b" : "=w" (cycles) : "0" (cycles)
			);
			break;
		case U8X8_MSG_DELAY_10MICRO:        // delay arg_int * 10 micro seconds
			for(int i=0 ; i < arg_int ; i++)
				_delay_us(10);
			break;
		case U8X8_MSG_DELAY_MILLI:          // delay arg_int * 1 milli second
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
			break;                          // can be used to setup pins
		case U8X8_MSG_GPIO_SPI_CLOCK:       // Clock pin: Output level in arg_int
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
		case U8X8_MSG_GPIO_CS:               // CS (chip select) pin: Output level in arg_int
			if(arg_int)
				DISPLAY_CS_PORT |= (1<<DISPLAY_CS_PIN);
			else
				DISPLAY_CS_PORT &= ~(1<<DISPLAY_CS_PIN);
			break;  
		case U8X8_MSG_GPIO_DC:              // DC (data/cmd, A0, register select) pin: Output level in arg_int
			if(arg_int)
				DISPLAY_DC_PORT |= (1<<DISPLAY_DC_PIN);
			else
				DISPLAY_DC_PORT &= ~(1<<DISPLAY_DC_PIN);
			break;

		case U8X8_MSG_GPIO_RESET:           // Reset pin: Output level in arg_int
			if(arg_int)
				DISPLAY_RESET_PORT |= (1<<DISPLAY_RESET_PIN);
			else
				DISPLAY_RESET_PORT &= ~(1<<DISPLAY_RESET_PIN);
			break;
		default:
			if (u8x8_avr_delay(u8x8, U8X8_MSG_DELAY_NANO, arg_int, arg_ptr))// check for any delay msgs
				return 1;
			u8x8_SetGPIOResult(u8x8, 1);    // default return value
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

void setup_timer2(void) {
    // CTC Mode
    TCCR2A = (1 << WGM21);
    
    // Set for ~32ms interval at 8MHz
    // 8,000,000 / 1024 (prescaler) / 250 (OCR2A) = 31.25 Hz
    OCR2A = 249;
     // /1024 prescaler
    TCCR2B = (1 << CS22) | (1 << CS21) | (1 << CS20);
    
    // Enable interrupt
    TIMSK2 |= (1 << OCIE2A);
}
// 2. Update the Timer2 ISR
ISR(TIMER2_COMPA_vect) {
    timer2Flag = 1;     // Used for your internal timing logic
    timer2Overflows++;  // Used for your current timestamping
    LcdTick = 1;        // Now the LCD refreshes from here!
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
    clock_prescale_set(clock_div_1);    // set the clock prescaler to 1
	
    // Set input ports for buttons
    DDRB &= ~((1<<1)|(1<<4)|(1<<6)|(1<<7));     // 1 and 4 are the Enter and Back buttons
    DDRD &= ~((1<<2)|(1<<6)|(1<<7));            // 2 is for checking pc connection

    
    // Set output port for LCD backlight
	DDRD |= (1<<5);

	TCCR0A |= (1 << WGM01) | (1 << WGM00) | (1 << COM0B1);  // set fast PWM Mode and non-inverting mode
	TCCR0B |= (1 << CS01);                                  // set prescaler to 8
    setup_timer1_freerun();
	setup_timer2();
	setup_ADC();

    TWI_init();
	lcd_init();

    // Enable global interrupts 
    sei();

	// To be removed after flashing the mcu
	eepromUpdate(5, (float)turnsRatio);
	MenuSettings[5] = turnsRatio;

    if (((int)eepromRead(MEASUREMENT_1_ADDRESS) >= 1) && ((int)eepromRead(MEASUREMENT_1_ADDRESS) <= 15)) {
		for (int i = 0; i < 6; i++){
            if (i < 4) {
                MenuSettings[i] = (eepromRead(MenuSettingsEEPROMAddresses[i]) - 1);// Read values from addresses if values are already stored there.
            } else {
                MenuSettings[i] = eepromRead(MenuSettingsEEPROMAddresses[i]);       // Read values from addresses if values are already stored there.
            }
		}
    } else {
        for (int i = 0; i < 6; i++){// Write initial values to menu setting addresses
			if (i == 4) {
				eepromUpdate(i, (float)4);// Initial Backlight value. 4 is 100% Backlight.
			} else if (i == 5) {
				eepromUpdate(i, (float)turnsRatio);
			} else {
				eepromUpdate(i, 1);
			}
		}
    }
    BacklightIndexCopy = MenuSettings[4];
    OCR0B = Backlight[BacklightIndexCopy]; // Set Backlight
    turnsRatio = MenuSettings[5];
    TurnsRatioCopy = turnsRatio;
}

void DrawPCIcon() {
    u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawFrame(&u8g2, 121, 59, 5, 3);
	u8g2_DrawBox(&u8g2, 122, 62, 3, 1);
}

void DrawTime() {
    u8g2_SetFont(&u8g2, u8g2_font_u8glib_4_hr);// Change to smaller font
    u8g2_SetDrawColor(&u8g2, 2);

    char TimeString[20];
    if (rtcValid && rtcTimeSet) {
        sprintf(TimeString, "%02u/%02u/%02u %02u:%02u",
                rtcCachedTime.day,
                rtcCachedTime.month,
                rtcCachedTime.year,
                rtcCachedTime.hour,
                rtcCachedTime.min);
    } else if (rtcValid && !rtcTimeSet) {
        sprintf(TimeString, "--/--/-- --:--");
    } else {
        sprintf(TimeString, "RTC ERROR");
    }

	u8g2_DrawStr(&u8g2, 60, 57, TimeString);
    u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr);
}

void MainScreenDraw(float measurements[]) {
	for (int i=0; i<5; i++) {
        if (i == SelectPosition[0]) {   // Selection Box
            u8g2_SetDrawColor(&u8g2, 1);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 0);
        } else {
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 1);
        }
		if (i<4) {
			u8g2_DrawStr(&u8g2, 1, 10 + (i * 13), MeasurementName[(int)MenuSettings[i]]);   // MenuSettings stores the index for which measurement it is
            char measurementBuffer[10];
            int measurementInt = measurements[(int)MenuSettings[i]];
            int afterDecimal = ((measurements[(int)MenuSettings[i]])-measurementInt)*100;
            if (afterDecimal < 10) {
	            sprintf(measurementBuffer , "%d.0%d", (int)measurementInt, (int)round(afterDecimal));// Convert Measurement float value to string
	        } else {
	            sprintf(measurementBuffer , "%d.%d", (int)measurementInt, (int)round(afterDecimal));// Convert Measurement float value to string
            }
            u8g2_DrawStr(&u8g2, 47, 10 + (i * 13), measurementBuffer); // Each row is 9 high with 2 space in between
		} else {
			u8g2_DrawStr(&u8g2, 1, 61, "Settings");
		}
	}
    u8g2_SetDrawColor(&u8g2, 2);
    u8g2_DrawLine(&u8g2, 44, 1, 44, 48);    // Line separating measurement name from measurement value
}

void MainScreen(float measurements[]) {
	MainScreenDraw(measurements);   // Refreshes display constantly to display changing values.
	if (ButtonTurn) {               // Attempts to prevent pressing of multiple buttons.
		if (ENTER || RIGHT) {       // Enter and right
			ButtonTurn = 0;
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			if (SelectPosition[0]<4) {
				Menu = 1;           // Measurement select menu
				SelectPosition[1] = (int)MenuSettings[SelectPosition[0]];   // Set position at the index of the measurement for Measurement select screen.
				u8g2_ClearBuffer(&u8g2);
                MeasurementSelectDraw();
				u8g2_SendBuffer(&u8g2);
			} else if (SelectPosition[0] == 4) {
				Menu = 2;           // Settings menu
				SelectPosition[1] = 0;
                u8g2_ClearBuffer(&u8g2);
                SettingsDraw();
                u8g2_SendBuffer(&u8g2);
			}
			ButtonTurn = 1;
		} else if (UP) {            // Up
			ButtonTurn = 0;
			SelectPosition[0]--;
			if (SelectPosition[0]<0) {
				SelectPosition[0] = 4;
			}
			ButtonTurn = 1;
		} else if (DOWN) {          // Down
            if (OCR0B == 0) {
                OCR0B = Backlight[(int)MenuSettings[4]];    // Set Backlight
            } else {
                OCR0B = 0;          // Set Backlight
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
		if (i == SelectPosition[0]) {   // Selection Box
			u8g2_SetDrawColor(&u8g2, 1);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawStr(&u8g2, 1, 10 + (i * 13), MeasurementName[(int)MenuSettings[i]]);
		} else {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
			u8g2_SetDrawColor(&u8g2, 1);
		}
        int idx;
		if (i < SelectPosition[0]) {    // Shows measurements above select
            idx = SelectPosition[1] - (SelectPosition[0] - i);
		} else {    // Shows measurements below select
            idx = SelectPosition[1] + (i - SelectPosition[0]);
		}
        while (idx < 0) idx += MEASUREMENTS;
        while (idx >= MEASUREMENTS) idx -= MEASUREMENTS;
		u8g2_DrawStr(&u8g2, 50, 10 + (i * 13), MeasurementName[idx]);
	}
    u8g2_SetDrawColor(&u8g2, 0);
    u8g2_DrawBox(&u8g2, 0, (4 * 13) - 1, 128, 13);
	u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawLine(&u8g2, 44, 1, 44, 48);    // Line separating measurement name from measurement value
}

//u8g2_ClearBuffer(&u8g2);
//u8g2_SendBuffer(&u8g2);

void MeasurementSelect(){
	if (ButtonTurn){
		if (ENTER || LEFT) {    // Enter and left
			ButtonTurn = 0;
			MenuSettings[SelectPosition[0]] = SelectPosition[1];    // Confirm measurement selection
			eepromUpdate(MenuSettingsEEPROMAddresses[SelectPosition[0]], SelectPosition[1] + 1);    // Update in EEPROM
			Menu = 0;
			ButtonTurn = 1;
		} else if (BACK) {  // Back
			ButtonTurn = 0;
			Menu = 0;
			ButtonTurn = 1;
		} else if (UP) {    // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = MEASUREMENTS - 1;
			}
			u8g2_ClearBuffer(&u8g2);
			MeasurementSelectDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if (DOWN) {  // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > (MEASUREMENTS - 1)) {
				SelectPosition[1] = 0;
			}
			u8g2_ClearBuffer(&u8g2);
			MeasurementSelectDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		}
	}
}

void SettingsDraw() {
	//u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr); // Reset font after returning from TurnsRatioMenuDraw
	for (int i=0; i<2; i++) {
		if (i == SelectPosition[0]) {
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
			u8g2_DrawTriangle(&u8g2, 60, 1, 53, 5, 60, 9);  // Arrows
			u8g2_DrawTriangle(&u8g2, 70, 1, 77, 5, 70, 9);
			char Index[2];
			sprintf(Index , "%d", BacklightIndexCopy);      // Convert int BacklightIndexCopy to string
			u8g2_DrawStr(&u8g2, 63, 10, Index);
		} else {
			u8g2_DrawStr(&u8g2, 1, 24, "Turns Ratio:");
			
			char turnsRatioBuffer[10];
			int turnsRatioInt = TurnsRatioCopy;
			int afterDecimal = (TurnsRatioCopy-turnsRatioInt)*100;
			if (afterDecimal < 10) {
				sprintf(turnsRatioBuffer , "%d.0%d", (int)turnsRatioInt, (int)round(afterDecimal));// Convert Measurement float value to string
				} else {
				sprintf(turnsRatioBuffer , "%d.%d", (int)turnsRatioInt, (int)round(afterDecimal));// Convert Measurement float value to string
			}
			
			u8g2_DrawStr(&u8g2, 70, 24, turnsRatioBuffer);
		}
	}
}

void Settings() {
    SettingsDraw();
	if (ButtonTurn){
		if (PINB & (1<<1)) {    // Enter
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			if (SelectPosition[1] == 1) {   // Into transformer turns ratio edit screen
				ButtonTurn = 0;
				Menu = 3;
				SelectPosition[1] = 0;
				ButtonTurn = 1;
				u8g2_ClearBuffer(&u8g2);
                TurnsRatioMenuDraw();
				u8g2_SendBuffer(&u8g2);
			} else {    // Confirm Backlight setting
				ButtonTurn = 0;
				Menu = 0;
				MenuSettings[4] = BacklightIndexCopy;
				OCR0B = Backlight[(int)MenuSettings[4]];
				eepromUpdate(BACKLIGHT_ADDRESS, BacklightIndexCopy);
				ButtonTurn = 1;
			}
		} else if ((PINB & (1<<4))) {   // Back. Exit settings without saving backlight setting changes
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			ButtonTurn = 0;
			Menu = 0;
			BacklightIndexCopy = (int)MenuSettings[4];  // Return without saving Backlight changes
			OCR0B = Backlight[BacklightIndexCopy];
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) {   // Up
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 1;
			}
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) { // Down
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 1) {
				SelectPosition[1] = 0;
			}
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<6)) && (SelectPosition[1] == 0)) {   // Right. Increase backlight setting
			ButtonTurn = 0;
			BacklightIndexCopy++;
			if (BacklightIndexCopy > 4) {
				BacklightIndexCopy = 0;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<7)) && (SelectPosition[1] == 0)) {   // Left. Decrease backlight setting
			ButtonTurn = 0;
			BacklightIndexCopy--;
			if (BacklightIndexCopy < 0) {
				BacklightIndexCopy = 4;
			}
			OCR0B = Backlight[BacklightIndexCopy];
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		}
	}
}

void TurnsRatioMenuDraw() {
	int DecimalOffset = 0;  // Used to offset the x position due to the decimal

	SettingsDraw();     // Display normal settings screen
	
	char turnsRatioBuffer[10];
	int turnsRatioInt = TurnsRatioCopy;
	int afterDecimal = (TurnsRatioCopy-turnsRatioInt)*100;
	if (afterDecimal < 10) {
		sprintf(turnsRatioBuffer , "%d.0%d", (int)turnsRatioInt, (int)round(afterDecimal));// Convert TurnsRatioCopy to string
	} else {
		sprintf(turnsRatioBuffer , "%d.%d", (int)turnsRatioInt, (int)round(afterDecimal));// Convert TurnsRatioCopy to string
	}
	u8g2_DrawStr(&u8g2, 2, 51, turnsRatioBuffer);

	//u8g2_SetFont(&u8g2, u8g2_font_VCR_OSD_mn); // Change to larger font
	for (int i=0; i<5; i++) { // Exact values yet to be confirmed
		if (i == 2) { // Account for decimal
			DecimalOffset = 3;
		}
		u8g2_DrawTriangle(&u8g2, (i * 5) - 2 + DecimalOffset, 27, (i * 5) + DecimalOffset, 22, (i * 5) + 2 + DecimalOffset, 27);    // Arrows
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
		if ((PINB & (1<<1))) {  // Enter. Confirm New Turn Ratio
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			ButtonTurn = 0;
			MenuSettings[5] = TurnsRatioCopy;
            turnsRatio = MenuSettings[5];
			eepromUpdate(TURNS_RATIO_ADDRESS, (float)turnsRatio);
			Menu = 2;
			ButtonTurn = 1;
			u8g2_ClearBuffer(&u8g2);
            SettingsDraw();
			u8g2_SendBuffer(&u8g2);
		} else if ((PINB & (1<<4))) {   // Back. Return without saving Turns Ratio changes
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			ButtonTurn = 0;
			Menu = 2;
			SelectPosition[1] = 1;
			ButtonTurn = 1;
			u8g2_ClearBuffer(&u8g2);
            SettingsDraw();
			u8g2_SendBuffer(&u8g2);
		} else if ((PINB & (1<<6))) {
			ButtonTurn = 0;
			int digit = (TurnsRatioCopy / pow(10, 1-(SelectPosition[1])) );
			digit = digit % 10;
			if (digit == 9) {   // Check specific digit
				TurnsRatioCopy -= (90 / pow(10, SelectPosition[1]));    // Up from 9, cycle to 0
			} else {
				TurnsRatioCopy += (10 / pow(10, SelectPosition[1]));    // plus 10 / (10 ^ digit place). e.g. if 1st digit: 10 / 10 ^ 0 = 10 / 1 = 10
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) {   // Down
			ButtonTurn = 0;
			int digit = (TurnsRatioCopy / pow(10, 1-(SelectPosition[1])) );
			digit = digit % 10;
			if (digit == 9) {   // Check specific digit
				TurnsRatioCopy += (90 / pow(10, SelectPosition[1]));    // Down from 0, cycle to 9
			} else {
				TurnsRatioCopy -= (10 / pow(10, SelectPosition[1]));    // subtract 10 / (10 ^ digit place). e.g. if 1st digit: 10 / 10 ^ 0 = 10 / 1 = 10
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<6))) {   // Right
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 4) {
				SelectPosition[1] = 0;
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<7))) {   // Left
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 4;
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		}
	}
}

void process_measurements(float* measurements) {
    if (acDataReady) {
        //Calculate RMS
        measurements[MEAS_AC_VOLTAGE] = calculate_AC_voltage_RMS(acVoltageSum, acVoltageSumSq, acSampleCount);
        measurements[MEAS_AC_CURRENT_HIGH] = calculate_AC_current_high_RMS(acCurrentHighSum, acCurrentHighSumSq, acSampleCount);
        
        //Calculate Power Factor and Frequency
        float freq = calculate_frequency(periodTicks);
        float phase = calculate_phase_difference(vCrossingTime, iCrossingTime, periodTicks);
        measurements[MEAS_FREQUENCY] = freq;
        measurements[MEAS_PHASE_DIFFERENCE] = phase;
        measurements[MEAS_POWER_FACTOR] = calculate_power_factor(phase);

        //Reset buffers
        cli();
        acVoltageSum = 0;
        acVoltageSumSq = 0;
        acCurrentHighSum = 0;
        acCurrentHighSumSq = 0;
        acSampleCount = 0;
        acDataReady = 0;
        acProcessingBusy = 0; //Indicate we're ready
        sei();
    }
    
    uint32_t ticks;

    cli();
    ticks = timer2Overflows;
    sei();

    if ((ticks - lastRTCPoll) >= 31)
    {
        lastRTCPoll = ticks;

        RTC_poll_and_cache();

        if (rtcValid && rtcTimeSet)
        {
            measurements[MEAS_RTC_TIME] =
                (float)rtcCachedSeconds;
        }
        else
        {
            measurements[MEAS_RTC_TIME] = 0.0f;
        }
    }
}

// ***************    MAIN    *************************
int main(void) {
    //Initialisations
    lcd_init();
    init();
    UART_init();
    
    //This buffer will be sent via serial
    float measurements[NO_MEASUREMENTS] = {0};
    
    //Fill all measurements with placeholders
    for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
        measurements[i] = 4.2f;
    }
  
    ADC_start_conversion();
    ADC_select_channel(DC_VOLTAGE_CHANNEL);
    sei();
    
    #if RTC_SET_ON_BOOT
        {
            rtc_time_t setTime;
            setTime.sec = 0;
            setTime.min = 30;
            setTime.hour = 14;
            setTime.dayOfWeek = 2;
            setTime.day = 6;
            setTime.month = 5;
            setTime.year = 26;
            setTime.clockHalted = 0;
            DS1307_set_time(&setTime);
        }
    #endif
    RTC_poll_and_cache();
    
    

    while(1){
        // Process new measurement data if the window is ready
        process_measurements(measurements);
        UART_print_measurements(measurements);
        
        // *************************      LCD CODE      ******************************
        
        if (LcdTick && !Menu) {
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
        if (LcdTick && !Menu) {
            u8g2_SendBuffer(&u8g2);
            LcdTick = 0;
        }
    }
}