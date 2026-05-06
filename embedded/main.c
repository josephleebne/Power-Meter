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
#include <math.h>
#include <stdio.h>
#include <avr/power.h>
#include <time.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdint.h>

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

#define MEASUREMENTS 16

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

//UART COMMUNICATION
#define BAUD 9600
#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)

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

volatile uint32_t timer2Overflows = 0;
volatile uint8_t timer2Flag = 0;
volatile uint8_t LcdTick = 0;

// UART fixed-rate sending (~1 second)
volatile uint8_t uartSendTick = 0;
volatile uint8_t uartSendFlag = 0;

volatile uint32_t periodTicks = 0;
volatile uint32_t totalPeriodAccumulator = 0;
volatile uint8_t cycleCounter = 0;

volatile uint16_t lastACValue = 512;
volatile uint16_t lastACCurrentValue = 512;

volatile uint16_t lastVTimestamp = 0;
volatile uint16_t vCrossingTime = 0;
volatile uint16_t iCrossingTime = 0;

//CHANNELS: the actual readings from the circuit
#define NO_CHANNELS 4
#define DC_VOLTAGE_CHANNEL 0
#define DC_CURRENT_CHANNEL 1
#define AC_VOLTAGE_CHANNEL 2
#define AC_CURRENT_HIGH_CHANNEL 3

//Turns ratio
float turnsRatio = 26.788;

uint8_t u8x8_avr_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
void lcd_init();
void init();
void DrawPCIcon();
void DrawTime();
void MainScreenDraw(float* measurements);
void MainScreen(float* measurements);
void MeasurementSelectDraw(void);
void MeasurementSelect();
void SettingsDraw();
void Settings();
void TurnsRatioMenu();
void TurnsRatioMenuDraw();
void DrawScreen();

////For I2C and RTC
//void TWI_init(void);
//uint8_t TWI_start(uint8_t address_rw);
//void TWI_stop(void);
//uint8_t TWI_write(uint8_t data);
//uint8_t TWI_read_ack(void);
//uint8_t TWI_read_nack(void);
//uint8_t bcd_to_dec(uint8_t bcd);
//uint8_t dec_to_bcd(uint8_t dec);
//uint8_t DS1307_read_time(rtc_time_t *t);
//uint8_t DS1307_set_time(const rtc_time_t *t);
//uint32_t rtc_seconds_of_day(const rtc_time_t *t);

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
AC apparent power,
RTC time (seconds since midnight)
*/

//char* MeasurementName[13] = {"DCV (V)","DCC (A)","DCP (W)","ACV (V)","ACC (A)","ACF (Hz)","ACPD (Degrees)","ACP (W)","ACRP (VAR)","ACAP (VA)", "ACPF","ACPV (V)","ACPC (A)"};
char* MeasurementName[16] = {"DCV (V)",
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
	"ACAP (W)",
    "RTC (s)"};

int Menu; // 0 = main screen, 1 = measurement select, 2 = settings, 3 = edit turns ratio
int SelectPosition[2]; // 0 = row position for the main screen, 1 = secondary position used for other menus
int ButtonTurn = 1; // Button turn baton
int Backlight[] = {0, 64, 128, 192, 255}; // Values for OCR0B for Backlight
int BacklightIndexCopy; // Copy of Backlight Index
float TurnsRatioCopy; // Copy of Transformer Turns Ratio

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

// cached rtc
volatile rtc_time_t rtcCachedTime;
volatile uint32_t rtcCachedSeconds = 0;
volatile uint8_t rtcValid = 0;
volatile uint8_t rtcTimeSet = 0;

//void TWI_init(void) {
//    TWSR = 0x00;      // Prescaler = 1
//    TWBR = 32;        // Approx 100kHz when F_CPU = 8MHz
//    TWCR = (1 << TWEN);
//}
//
//uint8_t TWI_start(uint8_t address_rw) {
//    TWCR = (1 << TWINT) | (1 << TWSTA) | (1 << TWEN);
//    while (!(TWCR & (1 << TWINT))) {
//    }
//
//    uint8_t status = TWSR & 0xF8;
//    if ((status != 0x08) && (status != 0x10)) {
//        return 0;
//    }
//
//    TWDR = address_rw;
//    TWCR = (1 << TWINT) | (1 << TWEN);
//    while (!(TWCR & (1 << TWINT))) {
//    }
//
//    status = TWSR & 0xF8;
//    if ((status != 0x18) && (status != 0x40)) {
//        return 0;
//    }
//
//    return 1;
//}
//
//void TWI_stop(void) {
//    TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWSTO);
//    _delay_us(10);
//}
//
//uint8_t TWI_write(uint8_t data) {
//    TWDR = data;
//    TWCR = (1 << TWINT) | (1 << TWEN);
//    while (!(TWCR & (1 << TWINT))) {
//    }
//
//    uint8_t status = TWSR & 0xF8;
//    return (status == 0x28);
//}
//
//uint8_t TWI_read_ack(void) {
//    TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWEA);
//    while (!(TWCR & (1 << TWINT))) {
//    }
//    return TWDR;
//}
//
//uint8_t TWI_read_nack(void) {
//    TWCR = (1 << TWINT) | (1 << TWEN);
//    while (!(TWCR & (1 << TWINT))) {
//    }
//    return TWDR;
//}
//
//uint8_t bcd_to_dec(uint8_t bcd) {
//    return ((bcd >> 4) * 10) + (bcd & 0x0F);
//}
//
//uint8_t dec_to_bcd(uint8_t dec) {
//    return ((dec / 10) << 4) | (dec % 10);
//}
//
//uint8_t DS1307_read_time(rtc_time_t *t) {
//    if (!TWI_start((DS1307_ADDR << 1) | 0)) {
//        return 0;
//    }
//
//    if (!TWI_write(0x00)) {
//        TWI_stop();
//        return 0;
//    }
//
//    if (!TWI_start((DS1307_ADDR << 1) | 1)) {
//        TWI_stop();
//        return 0;
//    }
//
//    t->sec       = bcd_to_dec(TWI_read_ack() & 0x7F);
//    t->min       = bcd_to_dec(TWI_read_ack());
//    t->hour      = bcd_to_dec(TWI_read_ack() & 0x3F);
//    t->dayOfWeek = bcd_to_dec(TWI_read_ack());
//    t->day       = bcd_to_dec(TWI_read_ack());
//    t->month     = bcd_to_dec(TWI_read_ack());
//    t->year      = bcd_to_dec(TWI_read_nack());
//
//    TWI_stop();
//    return 1;
//}
//
//uint8_t DS1307_set_time(const rtc_time_t *t) {
//    if (!TWI_start((DS1307_ADDR << 1) | 0)) {
//        return 0;
//    }
//
//    if (!TWI_write(0x00)) {
//        TWI_stop();
//        return 0;
//    }
//
//    if (!TWI_write(dec_to_bcd(t->sec)))       { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->min)))       { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->hour)))      { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->dayOfWeek))) { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->day)))       { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->month)))     { TWI_stop(); return 0; }
//    if (!TWI_write(dec_to_bcd(t->year)))      { TWI_stop(); return 0; }
//
//    TWI_stop();
//    return 1;
//}
//
//uint32_t rtc_seconds_of_day(const rtc_time_t *t) {
//    return ((uint32_t)t->hour * 3600UL) +
//           ((uint32_t)t->min * 60UL) +
//           (uint32_t)t->sec;
//}

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

void UART_print_u32(uint32_t value) {
    char buffer[16];
    snprintf(buffer, sizeof(buffer), "%lu", (unsigned long)value);
    UART_print(buffer);
}

void UART_print_float_2dp(float value) {
    if (value < 0) {
        UART_print("-");
        value = -value;
    }

    uint32_t scaled = (uint32_t)(value * 100.0f + 0.5f);
    uint32_t whole = scaled / 100;
    uint32_t frac  = scaled % 100;

    char buffer[24];
    snprintf(buffer, sizeof(buffer), "%lu.%02lu",
             (unsigned long)whole,
             (unsigned long)frac);
    UART_print(buffer);
}

//OCR2A triggers approx every 30ms
void setup_timer1_freerun(void) {
    TCCR1A = 0;
    TCCR1B = (1 << CS11);
}

void setup_ADC(void) {
	ADMUX = (0 << REFS1) | (0 << REFS0) | (0 << ADLAR);
	ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADEN) | (1 << ADIE);
}

void ADC_start_conversion(void) {
	ADCSRA |= (1 << ADSC);
}

void ADC_select_channel(uint8_t channel) {
	channel &= 0x0F;
	ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0));
	ADMUX |= channel;
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

    uint16_t midPoint = 512;

    if (channel == AC_VOLTAGE_CHANNEL) {
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
        if (lastACCurrentValue <= (midPoint - HYSTERESIS) && reading > (midPoint + HYSTERESIS)) {
            iCrossingTime = TCNT1;
        }
        lastACCurrentValue = reading;
    }

    if (channel == AC_VOLTAGE_CHANNEL && !acWindowReady) {
        acVoltageSum += reading;
        acVoltageSumSq += (uint32_t)reading * (uint32_t)reading;

        if (reading < acVoltageMin) acVoltageMin = reading;
        if (reading > acVoltageMax) acVoltageMax = reading;
    }

    if (channel == AC_CURRENT_HIGH_CHANNEL && !acWindowReady) {
        acCurrentHighSum += reading;
        acCurrentHighSumSq += (uint32_t)reading * (uint32_t)reading;

        if (reading < acCurrentHighMin) acCurrentHighMin = reading;
        if (reading > acCurrentHighMax) acCurrentHighMax = reading;

        acSampleCount++;
        if (acSampleCount >= NUM_SAMPLES) {
            acWindowReady = 1;
        }
    }

    ADCSelectedChannel++;
    if (ADCSelectedChannel >= NO_CHANNELS){
        ADCSelectedChannel = 0;
        areReadingsReady = 1;
    }

    ADC_select_channel(ADCSelectedChannel);
    discardNextSample = 1;
    ADC_start_conversion();
}

float calculate_DC_voltage(uint16_t ADCreading) {

	float scalingRatio =  (4.724f / 10.0f);
	float errorRatio = 1.681f;
    float errorSum = 0.080f;

	float scaledVout = ((float)ADCreading * VREF) / 1023.0f;

	float vin = (scaledVout / scalingRatio);
    float vinCorrected = vin * errorRatio + errorSum;
	return vinCorrected;
}

float calculate_DC_current(uint16_t ADCreading) {

	float scalingRatio = 1.0f;
	float errorRatio = 1.954f;
    float errorSum = 0.023f;

	float scaledVout = ((float)ADCreading * VREF) / 1023.0f;

	float vin = (scaledVout / scalingRatio);
    float vinCorrected = vin * errorRatio + errorSum;

	return vinCorrected;
}

float calculate_RMS_ADC(uint32_t sum, uint32_t sumSq, uint16_t count) {
	if (count == 0) {
		return 0.0f;
	}

	float mean = (float)sum / (float)count;
	float meanSq = (float)sumSq / (float)count;

	float variance = meanSq - (mean * mean);

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

    float vin = ADCRMSVoltage / scalingRatio;
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

float calculate_AC_voltage_Vpp(uint16_t minCounts, uint16_t maxCounts) {
    float adcVppCounts = (float)(maxCounts - minCounts);
    float adcVppVolts = ADC_counts_to_volts(adcVppCounts);
    float scalingRatio = (1.4f / 14.14f);
    return adcVppVolts / scalingRatio;
}

float calculate_AC_current_high_Vpp(uint16_t minCounts, uint16_t maxCounts) {
    float adcVppCounts = (float)(maxCounts - minCounts);
    float adcVppVolts = ADC_counts_to_volts(adcVppCounts);
    float scalingRatio = 1.0f;
    float currentToVoltageRatio = 10.0f;
    return (adcVppVolts / scalingRatio) * currentToVoltageRatio;
}

float calculate_frequency(uint32_t ticks) {
    if (ticks == 0) return 0.0f;
    return (float)FREQ_CALC_CONSTANT / (float)ticks;
}

float calculate_phase_difference(uint16_t vTime, uint16_t iTime, uint32_t avgPeriodTicks) {
    if (avgPeriodTicks == 0) return 0.0f;

    float singleCycleTicks = (float)avgPeriodTicks / (float)FREQ_AVG_COUNT;
    int16_t diff = (int16_t)(iTime - vTime);

    float phase = ((float)diff / singleCycleTicks) * 360.0f;

    while (phase > 180.0f) phase -= 360.0f;
    while (phase < -180.0f) phase += 360.0f;

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
        if (i == MEAS_RTC_TIME) {
            UART_print_u32((uint32_t)arr[i]);
        } else {
            UART_print_float_2dp(arr[i]);
        }

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
		case U8X8_MSG_DELAY_NANO:
			break;
		case U8X8_MSG_DELAY_100NANO:
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
		case U8X8_MSG_DELAY_10MICRO:
			for(int i=0 ; i < arg_int ; i++)
				_delay_us(10);
			break;
		case U8X8_MSG_DELAY_MILLI:
			for(int i=0 ; i < arg_int ; i++)
				_delay_ms(1);
			break;
		default:
			return 0;
	}
	return 1;
}

uint8_t u8x8_avr_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {

	switch(msg)
	{
		case U8X8_MSG_GPIO_AND_DELAY_INIT:
			DISPLAY_CLK_DIR |= 1<<DISPLAY_CLK_PIN;
			DISPLAY_DATA_DIR |= 1<<DISPLAY_DATA_PIN;
			DISPLAY_CS_DIR |= 1<<DISPLAY_CS_PIN;
			DISPLAY_DC_DIR |= 1<<DISPLAY_DC_PIN;
			DISPLAY_RESET_DIR |= 1<<DISPLAY_RESET_PIN;
			break;
		case U8X8_MSG_GPIO_SPI_CLOCK:
			if(arg_int)
				DISPLAY_CLK_PORT |= (1<<DISPLAY_CLK_PIN);
			else
				DISPLAY_CLK_PORT &= ~(1<<DISPLAY_CLK_PIN);
			break;
		case U8X8_MSG_GPIO_SPI_DATA:
			if(arg_int)
				DISPLAY_DATA_PORT |= (1<<DISPLAY_DATA_PIN);
			else
				DISPLAY_DATA_PORT &= ~(1<<DISPLAY_DATA_PIN);
			break;
		case U8X8_MSG_GPIO_CS:
			if(arg_int)
				DISPLAY_CS_PORT |= (1<<DISPLAY_CS_PIN);
			else
				DISPLAY_CS_PORT &= ~(1<<DISPLAY_CS_PIN);
			break;
		case U8X8_MSG_GPIO_DC:
			if(arg_int)
				DISPLAY_DC_PORT |= (1<<DISPLAY_DC_PIN);
			else
				DISPLAY_DC_PORT &= ~(1<<DISPLAY_DC_PIN);
			break;

		case U8X8_MSG_GPIO_RESET:
			if(arg_int)
				DISPLAY_RESET_PORT |= (1<<DISPLAY_RESET_PIN);
			else
				DISPLAY_RESET_PORT &= ~(1<<DISPLAY_RESET_PIN);
			break;
		default:
			if (u8x8_avr_delay(u8x8, U8X8_MSG_DELAY_NANO, arg_int, arg_ptr))
				return 1;
			u8x8_SetGPIOResult(u8x8, 1);
			break;
	}
	return 1;
}

float eepromRead(unsigned int address) {
    while(EECR & (1<<EEPE)){
    }
    EEAR = address;
    EECR |= (1<<EERE);
    return EEDR;
}

void eepromUpdate(unsigned int address, float data) {
    while(EECR & (1<<EEPE)) {
    }
    if (data != eepromRead(address)) {
        EEAR = address;
        EEDR = data;
        EECR |= (1<<EEMPE);
        EECR |= (1<<EEPE);
    }
}

void setup_timer2(void) {
    TCCR2A = (1 << WGM21);
    OCR2A = 249;
    TCCR2B = (1 << CS22) | (1 << CS21) | (1 << CS20);
    TIMSK2 |= (1 << OCIE2A);
}

ISR(TIMER2_COMPA_vect) {
    timer2Flag = 1;
    timer2Overflows++;
    LcdTick = 1;

    uartSendTick++;
    if (uartSendTick >= 32) {
        uartSendTick = 0;
        uartSendFlag = 1;
    }
}

void lcd_init(void){
	u8g2_Setup_st7920_s_128x64_f(&u8g2, U8G2_R0, u8x8_byte_4wire_sw_spi, u8x8_avr_gpio_and_delay);

	u8g2_InitDisplay(&u8g2);
	u8g2_SetPowerSave(&u8g2, 0);

	u8g2_SetFontMode(&u8g2, 1);
    u8g2_SetFont(&u8g2, u8g2_font_prospero_nbp_tr);
	u8g2_SetDrawColor(&u8g2, 2);
}

void init(){
    clock_prescale_set(clock_div_1);

    DDRB &= ~((1<<1)|(1<<4)|(1<<6)|(1<<7));
    DDRD &= ~((1<<2)|(1<<6)|(1<<7));

	DDRD |= (1<<5);

	TCCR0A |= (1 << WGM01) | (1 << WGM00) | (1 << COM0B1);
	TCCR0B |= (1 << CS01);
    setup_timer1_freerun();
	setup_timer2();
	setup_ADC();
    TWI_init();
	lcd_init();

    sei();

	// To be removed after flashing the mcu
	eepromUpdate(5, (float)turnsRatio);
	MenuSettings[5] = turnsRatio;

    if (((int)eepromRead(MEASUREMENT_1_ADDRESS) >= 1) && ((int)eepromRead(MEASUREMENT_1_ADDRESS) <= 15)) {
		for (int i = 0; i < 6; i++){
            if (i < 4) {
                MenuSettings[i] = (eepromRead(MenuSettingsEEPROMAddresses[i]) - 1);
            } else {
                MenuSettings[i] = eepromRead(MenuSettingsEEPROMAddresses[i]);
            }
		}
    } else {
        for (int i = 0; i < 6; i++){
			if (i == 4) {
				eepromUpdate(i, (float)4);
			} else if (i == 5) {
				eepromUpdate(i, (float)turnsRatio);
			} else {
				eepromUpdate(i, 1);
			}
		}
    }
	turnsRatio = MenuSettings[5];
}

void DrawPCIcon() {
    u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawFrame(&u8g2, 121, 59, 5, 3);
	u8g2_DrawBox(&u8g2, 122, 62, 3, 1);
}

void DrawTime() {
    u8g2_SetFont(&u8g2, u8g2_font_u8glib_4_hr);
    u8g2_SetDrawColor(&u8g2, 2);
    char Index[2];
	sprintf(Index , "%d", (int)eepromRead(MEASUREMENT_3_ADDRESS));
	u8g2_DrawStr(&u8g2, 55, 61, Index);

    char TimeString[18];
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
        if (i == SelectPosition[0]) {
            u8g2_SetDrawColor(&u8g2, 1);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 0);
        } else {
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, (i * 13) - 1, 128, 13);
            u8g2_SetDrawColor(&u8g2, 1);
        }
		if (i<4) {
			u8g2_DrawStr(&u8g2, 1, 10 + (i * 13), MeasurementName[(int)MenuSettings[i]]);
            char measurementBuffer[10];
			int measurementInt = measurements[(int)MenuSettings[i]];
            sprintf(measurementBuffer , "%d.%d", (int)measurementInt, (int)round(((measurements[(int)MenuSettings[i]])-measurementInt)*100));
            u8g2_DrawStr(&u8g2, 47, 10 + (i * 13), measurementBuffer);
		} else {
			u8g2_DrawStr(&u8g2, 1, 61, "Settings");
		}
	}
    u8g2_SetDrawColor(&u8g2, 2);
    u8g2_DrawLine(&u8g2, 44, 1, 44, 48);
}

void MainScreen(float measurements[]) {
	MainScreenDraw(measurements);
	if (ButtonTurn) {
		if (ENTER || RIGHT) {
			ButtonTurn = 0;
            u8g2_SetDrawColor(&u8g2, 0);
            u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			if (SelectPosition[0]<4) {
				Menu = 1;
				SelectPosition[1] = (int)MenuSettings[SelectPosition[0]];
				u8g2_ClearBuffer(&u8g2);
                MeasurementSelectDraw();
				u8g2_SendBuffer(&u8g2);
			} else if (SelectPosition[0] == 4) {
				Menu = 2;
				SelectPosition[1] = 0;
				BacklightIndexCopy = (int)MenuSettings[4];
                u8g2_ClearBuffer(&u8g2);
                SettingsDraw();
                u8g2_SendBuffer(&u8g2);
			}
			ButtonTurn = 1;
		} else if (UP) {
			ButtonTurn = 0;
			SelectPosition[0]--;
			if (SelectPosition[0]<0) {
				SelectPosition[0] = 4;
			}
			ButtonTurn = 1;
		} else if (DOWN) {
            if (OCR0B == 0) {
                OCR0B = Backlight[(int)MenuSettings[4]];
            } else {
                OCR0B = 0;
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
		if (i == SelectPosition[0]) {
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
		if (i < SelectPosition[0]) {
            idx = SelectPosition[1] - (SelectPosition[0] - i);
		} else {
            idx = SelectPosition[1] + (i - SelectPosition[0]);
		}
        while (idx < 0) idx += MEASUREMENTS;
        while (idx >= MEASUREMENTS) idx -= MEASUREMENTS;
		u8g2_DrawStr(&u8g2, 50, 10 + (i * 13), MeasurementName[idx]);
	}
    u8g2_SetDrawColor(&u8g2, 0);
    u8g2_DrawBox(&u8g2, 0, (4 * 13) - 1, 128, 13);
	u8g2_SetDrawColor(&u8g2, 2);
	u8g2_DrawLine(&u8g2, 44, 1, 44, 48);
}

//u8g2_ClearBuffer(&u8g2);
//u8g2_SendBuffer(&u8g2);

void MeasurementSelect(){
	if (ButtonTurn){
		if (ENTER || LEFT) {
			ButtonTurn = 0;
			MenuSettings[SelectPosition[0]] = SelectPosition[1];
			eepromUpdate(MenuSettingsEEPROMAddresses[SelectPosition[0]], SelectPosition[1] + 1);
			Menu = 0;
			ButtonTurn = 1;
		} else if (BACK) {
			ButtonTurn = 0;
			Menu = 0;
			ButtonTurn = 1;
		} else if (UP) {
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = MEASUREMENTS - 1;
			}
			u8g2_ClearBuffer(&u8g2);
			MeasurementSelectDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if (DOWN) {
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
			u8g2_DrawTriangle(&u8g2, 60, 1, 53, 5, 60, 9);
			u8g2_DrawTriangle(&u8g2, 70, 1, 77, 5, 70, 9);
			char Index[2];
			sprintf(Index , "%d", BacklightIndexCopy);
			u8g2_DrawStr(&u8g2, 63, 10, Index);
		} else {
			u8g2_DrawStr(&u8g2, 1, 24, "Turns Ratio:");
			char turnsRatioBuffer[10];
			int turnsRatioInt = turnsRatio;
			sprintf(turnsRatioBuffer , "%d.%d", turnsRatioInt, (int)round((turnsRatio-turnsRatioInt)*100));
			u8g2_DrawStr(&u8g2, 70, 24, turnsRatioBuffer);
		}
	}
}

void Settings() {
    SettingsDraw();
	if (ButtonTurn){
		if (PINB & (1<<1)) {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			if (SelectPosition[1] == 1) {
				ButtonTurn = 0;
				Menu = 3;
				TurnsRatioCopy = MenuSettings[5];
				SelectPosition[1] = 0;
				ButtonTurn = 1;
				u8g2_ClearBuffer(&u8g2);
                TurnsRatioMenuDraw();
				u8g2_SendBuffer(&u8g2);
			} else {
				ButtonTurn = 0;
				Menu = 0;
				MenuSettings[4] = BacklightIndexCopy;
				OCR0B = Backlight[(int)MenuSettings[4]];
				ButtonTurn = 1;
			}
		} else if ((PINB & (1<<4))) {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			ButtonTurn = 0;
			Menu = 0;
			BacklightIndexCopy = (int)MenuSettings[4];
			OCR0B = Backlight[(int)MenuSettings[4]];
			ButtonTurn = 1;
		} else if ((PINB & (1<<6))) {
			ButtonTurn = 0;
			SelectPosition[1]--;
			if (SelectPosition[1] < 0) {
				SelectPosition[1] = 1;
			}
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) {
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 1) {
				SelectPosition[1] = 0;
			}
			u8g2_ClearBuffer(&u8g2);
			SettingsDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<6)) && (SelectPosition[1] == 0)) {
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
		} else if ((PIND & (1<<7)) && (SelectPosition[1] == 0)) {
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
	int DecimalOffset = 0;

	SettingsDraw();

	char TurnsRatio[7];
	sprintf(TurnsRatio , "%.3f", TurnsRatioCopy);
	u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);

	//u8g2_SetFont(&u8g2, u8g2_font_VCR_OSD_mn); // Change to larger font
	for (int i=0; i<5; i++) { // Exact values yet to be confirmed
		if (i == 2) { // Account for decimal
			DecimalOffset = 3;
		}
		u8g2_DrawTriangle(&u8g2, (i * 5) - 2 + DecimalOffset, 27, (i * 5) + DecimalOffset, 22, (i * 5) + 2 + DecimalOffset, 27);
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
		if ((PINB & (1<<1))) {
			u8g2_SetDrawColor(&u8g2, 0);
			u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
			ButtonTurn = 0;
			MenuSettings[5] = TurnsRatioCopy;
			//eeprom_update_float((float*)MenuSettingsEEPROMAddresses[5], TurnsRatioCopy);
            turnsRatio = MenuSettings[5];
			Menu = 2;
			ButtonTurn = 1;
			u8g2_ClearBuffer(&u8g2);
            SettingsDraw();
			u8g2_SendBuffer(&u8g2);
		} else if ((PINB & (1<<4))) {
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

			char TurnsRatio[7];
			sprintf(TurnsRatio , "%.3f", TurnsRatioCopy);
			u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);

			if ((TurnsRatio[SelectPosition[1]] - '0') == 9) {
				TurnsRatioCopy -= (90 / pow(10, SelectPosition[1]));
			} else {
				TurnsRatioCopy += (10 / pow(10, SelectPosition[1]));
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PINB & (1<<7))) {
			ButtonTurn = 0;

			char TurnsRatio[7];
			sprintf(TurnsRatio , "%.3f", TurnsRatioCopy);
			u8g2_DrawStr(&u8g2, 2, 51, TurnsRatio);

			if ((TurnsRatio[SelectPosition[1]] - '0') == 0) {
				TurnsRatioCopy += (90 / pow(10, SelectPosition[1]));
			} else {
				TurnsRatioCopy -= (10 / pow(10, SelectPosition[1]));
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<6))) {
			ButtonTurn = 0;
			SelectPosition[1]++;
			if (SelectPosition[1] > 4) {
				SelectPosition[1] = 0;
			}
			u8g2_ClearBuffer(&u8g2);
			TurnsRatioMenuDraw();
			u8g2_SendBuffer(&u8g2);
			ButtonTurn = 1;
		} else if ((PIND & (1<<7))) {
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

// ***************    MAIN    *************************

int main(void) {
    init();

	UART_init();

	ADC_select_channel(DC_VOLTAGE_CHANNEL);

	sei();
	ADC_start_conversion();

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

	float measurements[NO_MEASUREMENTS];
	uint16_t localDCVoltageADC;
	uint16_t localDCCurrentADC;

	for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
		measurements[i] = 4.2f;
	}

    uint32_t localPeriodTicks = 0;

	while(1){
		if (acWindowReady){
            uint32_t localACVoltageSum;
            uint32_t localACVoltageSumSq;

            uint32_t localACCurrentHighSum;
            uint32_t localACCurrentHighSumSq;

            uint16_t localACSampleCount;
			uint16_t localVTime;
			uint16_t localITime;
            uint16_t localACVoltageMin;
            uint16_t localACVoltageMax;
            uint16_t localACCurrentHighMin;
            uint16_t localACCurrentHighMax;

            cli();

            localACVoltageSum = acVoltageSum;
            localACVoltageSumSq = acVoltageSumSq;

            localACCurrentHighSum = acCurrentHighSum;
            localACCurrentHighSumSq = acCurrentHighSumSq;

            localACSampleCount = acSampleCount;
            localACVoltageMin = acVoltageMin;
            localACVoltageMax = acVoltageMax;
            localACCurrentHighMin = acCurrentHighMin;
            localACCurrentHighMax = acCurrentHighMax;

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

            localPeriodTicks = periodTicks;

			localVTime = vCrossingTime;
    		localITime = iCrossingTime;
            sei();

            measurements[MEAS_AC_VOLTAGE] =
                calculate_AC_voltage_RMS(localACVoltageSum,
                                         localACVoltageSumSq,
                                         localACSampleCount);

            measurements[MEAS_AC_CURRENT_HIGH] =
                calculate_AC_current_high_RMS(localACCurrentHighSum,
                                              localACCurrentHighSumSq,
                                              localACSampleCount);

            measurements[MEAS_AC_VOLTAGE_VPP] =
                calculate_AC_voltage_Vpp(localACVoltageMin, localACVoltageMax);

            measurements[MEAS_AC_CURRENT_HIGH_VPP] =
                calculate_AC_current_high_Vpp(localACCurrentHighMin, localACCurrentHighMax);

			measurements[MEAS_FREQUENCY] = calculate_frequency(localPeriodTicks);
    		measurements[MEAS_PHASE_DIFFERENCE] = calculate_phase_difference(localVTime, localITime, localPeriodTicks);
    		measurements[MEAS_POWER_FACTOR] = calculate_power_factor(measurements[MEAS_PHASE_DIFFERENCE]);
            measurements[MEAS_AC_APPARANT_POWER] = measurements[MEAS_AC_VOLTAGE] * measurements[MEAS_AC_CURRENT_HIGH];
            measurements[MEAS_AC_REAL_POWER] = measurements[MEAS_AC_APPARANT_POWER] * measurements[MEAS_POWER_FACTOR];

            {
                float apparentSq = measurements[MEAS_AC_APPARANT_POWER] * measurements[MEAS_AC_APPARANT_POWER];
                float realSq = measurements[MEAS_AC_REAL_POWER] * measurements[MEAS_AC_REAL_POWER];
                float reactiveSq = apparentSq - realSq;
                if (reactiveSq < 0.0f) reactiveSq = 0.0f;
                measurements[MEAS_AC_REACTIVE_POWER] = sqrtf(reactiveSq);
            }
        }

        if (areReadingsReady) {
            cli();

            localDCVoltageADC = ADCReading[DC_VOLTAGE_CHANNEL];
            localDCCurrentADC = ADCReading[DC_CURRENT_CHANNEL];

            areReadingsReady = 0;
            sei();

            measurements[MEAS_DC_VOLTAGE] = calculate_DC_voltage(localDCVoltageADC);
            measurements[MEAS_DC_CURRENT] = calculate_DC_current(localDCCurrentADC);
            measurements[MEAS_DC_POWER] = measurements[MEAS_DC_VOLTAGE] * measurements[MEAS_DC_CURRENT];
        }

        if (uartSendFlag) {
            uartSendFlag = 0;

            RTC_poll_and_cache();
            if (rtcValid && rtcTimeSet) {
                measurements[MEAS_RTC_TIME] = (float)rtcCachedSeconds;
            } else {
                measurements[MEAS_RTC_TIME] = 0.0f;
            }

            UART_print_measurements(measurements);
        }

        if (LcdTick && !Menu) {
            u8g2_ClearBuffer(&u8g2);
        }
		if (!Menu) {
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
//------------------------------------------------------------------------------
//JOE'S OLD MEASUREMENT ONLY CODE (for testing without lcd)
//#include <stdio.h>
//#include <stdlib.h>
//#include <stdint.h>
//#include <avr/io.h>
//#include <math.h> //ASK!!!!!!
//#include <avr/interrupt.h> //Ask!
//#include <util/delay.h>
//
////UART COMMUNICATION
//#define F_CPU 8000000UL
//#define BAUD 9600
//#define UBRR_VALUE ((F_CPU / (16UL * BAUD)) - 1)
//
////MEASUREMENTS: for measurements read from the channels, and measurements calculated from those
//#define VREF 5.0f
//#define NUM_SAMPLES 100
//#define NO_MEASUREMENTS 16 //See comment at the end of main for the format
//#define MEAS_DC_VOLTAGE              0
//#define MEAS_DC_CURRENT              1
//#define MEAS_AC_VOLTAGE              2
//#define MEAS_AC_CURRENT_HIGH         3
//#define MEAS_AC_CURRENT_LOW          4
//#define MEAS_PHASE                   5
//#define MEAS_POWER_FACTOR            6
//#define MEAS_FREQUENCY               7
//#define MEAS_REAL_POWER              8
//#define MEAS_REACTIVE_POWER          9
//#define MEAS_APPARENT_POWER          10
//#define MEAS_TIME                    11
//
////CHANNELS: the actual readings from the circuit
//#define NO_CHANNELS 4
//#define DC_VOLTAGE_CHANNEL 0
//#define DC_CURRENT_CHANNEL 1
//#define AC_VOLTAGE_CHANNEL 2
//#define AC_CURRENT_HIGH_CHANNEL 3
//#define AC_CURRENT_LOW_CHANNEL 4
//
////GLOBAL VARIABLES
//volatile uint32_t acVoltageSum = 0;
//volatile uint32_t acVoltageSumSq = 0;
//volatile uint16_t acVoltageMin = 1023;
//volatile uint16_t acVoltageMax = 0;
//
//volatile uint32_t acCurrentHighSum = 0;
//volatile uint32_t acCurrentHighSumSq = 0;
//volatile uint16_t acCurrentHighMin = 1023;
//volatile uint16_t acCurrentHighMax = 0;
//
//volatile uint32_t acCurrentLowSum = 0;
//volatile uint32_t acCurrentLowSumSq = 0;
//volatile uint16_t acCurrentLowMin = 1023;
//volatile uint16_t acCurrentLowMax = 0;
//
//volatile uint16_t acSampleCount = 0;
//volatile uint8_t acWindowReady = 0;
//
//volatile uint16_t ADCReading[NO_CHANNELS];
//volatile uint8_t areReadingsReady = 0;
//volatile uint8_t ADCSelectedChannel = 0;
//volatile uint8_t discardNextSample = 0;
//
//volatile uint8_t timerFlag = 1;
//
//void UART_init(void) {
//    UBRR0H = (unsigned char)(UBRR_VALUE >> 8);
//    UBRR0L = (unsigned char)UBRR_VALUE;
//
//    UCSR0B = (1 << TXEN0);
//    UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
//}
//
//void UART_transmit(char data) {
//    while (!(UCSR0A & (1 << UDRE0))) {
//    }
//    UDR0 = data;
//}
//
//void UART_print(const char *str) {
//    while (*str) {
//        UART_transmit(*str++);
//    }
//}
//
//void UART_print_uint(uint16_t value) {
//    char buffer[8];
//    snprintf(buffer, sizeof(buffer), "%u", value);
//    UART_print(buffer);
//}
//
//void UART_print_float_2dp(float value) {
//    if (value < 0) {
//        UART_print("-");
//        value = -value;
//    }
//
//    uint16_t scaled = (uint16_t)(value * 100.0f + 0.5f);
//    uint16_t whole = scaled / 100;
//    uint16_t frac  = scaled % 100;
//
//    char buffer[16];
//    snprintf(buffer, sizeof(buffer), "%u.%02u", whole, frac);
//    UART_print(buffer);
//}
//
////OCR2A triggers approx every 30ms
//void setup_timer(void){
//    TCCR2A = (1 << WGM21);
//    OCR2A = 255;
//    TCCR2B |= (1 << CS22) | (1 << CS21) | (1 << CS20);
//    TIMSK2 |= (1 << OCIE2A);
//}
//
//ISR(TIMER2_COMPA_vect){
//    timerFlag = 1;
//}
//
//void setup_ADC(void) {
//    ADMUX = (0 << REFS1) | (0 << REFS0) | (0 << ADLAR);
//    ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADEN) | (1 << ADIE);
//}
//
//void ADC_start_conversion(void) {
//    ADCSRA |= (1 << ADSC);
//}
//
//void ADC_select_channel(uint8_t channel) {
//    channel &= 0x0F;
//    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0));
//    ADMUX |= channel;
//}
//
//ISR(ADC_vect) {
//
//    uint16_t channel = ADCSelectedChannel;
//    uint16_t reading = ADC;
//
//    if (discardNextSample) {
//        discardNextSample = 0;
//        ADC_start_conversion();
//        return;
//    }
//
//    ADCReading[channel] = reading;
//
//    if (channel == AC_VOLTAGE_CHANNEL && !acWindowReady) {
//        acVoltageSum += reading;
//        acVoltageSumSq += (uint32_t)reading * (uint32_t)reading;
//
//        if (reading < acVoltageMin) acVoltageMin = reading;
//        if (reading > acVoltageMax) acVoltageMax = reading;
//    }
//    if (channel == AC_CURRENT_HIGH_CHANNEL && !acWindowReady) {
//        acCurrentHighSum += reading;
//        acCurrentHighSumSq += (uint32_t)reading * (uint32_t)reading;
//
//        if (reading < acCurrentHighMin) acCurrentHighMin = reading;
//        if (reading > acCurrentHighMax) acCurrentHighMax = reading;
//
//        acSampleCount++;
//        if (acSampleCount >= NUM_SAMPLES) {
//            acWindowReady = 1;
//        }
//    }
//
//    ADCSelectedChannel++;
//    if (ADCSelectedChannel >= NO_CHANNELS){
//        ADCSelectedChannel = 0;
//        areReadingsReady = 1;
//    }
//
//    ADC_select_channel(ADCSelectedChannel);
//    discardNextSample = 1;
//    ADC_start_conversion();
//}
//
//float calculate_DC_voltage(uint16_t ADCreading) {
//
//    float scalingRatio =  (4.724f / 10.0f);
//    float errorRatio = 1.0f;
//
//    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
//
//    float Vin = (scaledVout / scalingRatio) * errorRatio;
//
//    return Vin;
//}
//
//float calculate_DC_current(uint16_t ADCreading) {
//
//    float scalingRatio = 1.0f;
//    float errorRatio = 1.0f;
//
//    float scaledVout = ((float)ADCreading * VREF) / 1023.0f;
//
//    float Vin = (scaledVout / scalingRatio) * errorRatio;
//
//    return Vin;
//}
//
//float calculate_RMS_ADC(uint32_t sum, uint32_t sumSq, uint16_t count) {
//    if (count == 0) {
//        return 0.0f;
//    }
//
//    float mean = (float)sum / (float)count;
//    float meanSq = (float)sumSq / (float)count;
//
//    float variance = meanSq - (mean * mean);
//
//    if (variance < 0.0f) {
//        variance = 0.0f;
//    }
//
//    return sqrtf(variance);
//}
//
//float ADC_counts_to_volts(float ADCCounts) {
//    return ADCCounts * VREF / 1023.0f;
//}
//
//float calculate_AC_voltage_RMS(uint32_t sum, uint32_t sumSq, uint16_t count) {
//    float scalingRatio = (1.4f / 14.14f);
//    float errorRatio = 1.0f;
//
//    float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
//    float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);
//
//    return (ADCRMSVoltage / scalingRatio) * errorRatio;
//}
//
//float calculate_AC_current_high_RMS(uint32_t sum, uint32_t sumSq, uint16_t count) {
//    float scalingRatio = 1.0f;
//    float currentToVoltageRatio = 1.0f;
//    float errorRatio = 1.0f;
//
//    float RMSCounts = calculate_RMS_ADC(sum, sumSq, count);
//    float ADCRMSVoltage = ADC_counts_to_volts(RMSCounts);
//    float currentRMS = (ADCRMSVoltage / scalingRatio) * currentToVoltageRatio;
//
//    return currentRMS * errorRatio;
//}
//
//void UART_print_measurements(float arr[NO_MEASUREMENTS]) {
//    UART_print("[");
//
//    for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
//        UART_print_float_2dp(arr[i]);
//
//        if (i < NO_MEASUREMENTS - 1) {
//            UART_print(", ");
//        }
//    }
//
//    UART_print("]\r\n");
//}
//
//int main(void) {
//    UART_init();
//    setup_ADC();
//    setup_timer();
//
//    ADC_select_channel(DC_VOLTAGE_CHANNEL);
//
//    sei();
//    ADC_start_conversion();
//
//    float measurements[NO_MEASUREMENTS];
//    uint16_t localDCVoltageADC;
//    uint16_t localDCCurrentADC;
//
//    for (uint8_t i = 0; i < NO_MEASUREMENTS; i++) {
//        measurements[i] = 4.2f;
//    }
//
//    while (1) {
//        if (acWindowReady){
//            uint32_t localACVoltageSum;
//            uint32_t localACVoltageSumSq;
//
//            uint32_t localACCurrentHighSum;
//            uint32_t localACCurrentHighSumSq;
//
//            uint16_t localACSampleCount;
//
//            cli();
//
//            localACVoltageSum = acVoltageSum;
//            localACVoltageSumSq = acVoltageSumSq;
//
//            localACCurrentHighSum = acCurrentHighSum;
//            localACCurrentHighSumSq = acCurrentHighSumSq;
//
//            localACSampleCount = acSampleCount;
//
//            acVoltageSum = 0;
//            acVoltageSumSq = 0;
//            acVoltageMin = 1023;
//            acVoltageMax = 0;
//
//            acCurrentHighSum = 0;
//            acCurrentHighSumSq = 0;
//            acCurrentHighMin = 1023;
//            acCurrentHighMax = 0;
//
//            acSampleCount = 0;
//            acWindowReady = 0;
//
//            sei();
//
//            measurements[MEAS_AC_VOLTAGE] =
//                calculate_AC_voltage_RMS(localACVoltageSum,
//                                         localACVoltageSumSq,
//                                         localACSampleCount);
//
//            measurements[MEAS_AC_CURRENT_HIGH] =
//                calculate_AC_current_high_RMS(localACCurrentHighSum,
//                                              localACCurrentHighSumSq,
//                                              localACSampleCount);
//        }
//
//        if (areReadingsReady) {
//            cli();
//
//            localDCVoltageADC = ADCReading[DC_VOLTAGE_CHANNEL];
//            localDCCurrentADC = ADCReading[DC_CURRENT_CHANNEL];
//
//            areReadingsReady = 0;
//            sei();
//
//            measurements[MEAS_DC_VOLTAGE] = calculate_DC_voltage(localDCVoltageADC);
//            measurements[MEAS_DC_CURRENT] = calculate_DC_current(localDCCurrentADC);
//
//            if (timerFlag) {
//                timerFlag = 0;
//                UART_print_measurements(measurements);
//            }
//        }
//    }
//
//    return 0;
//}