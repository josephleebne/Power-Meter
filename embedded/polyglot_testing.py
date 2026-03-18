#This is a test script to attempt to blink a red LED with the seeduino.

#NOTE this code blinks the led in the top right of the seeduino, not the red LED. But at least we know the board works. 


import time
from polyglot_turtle import PolyglotTurtleXiao, PinDirection

if __name__ == "__main__":
    pt = PolyglotTurtleXiao()

    red_led_pin = 2

    pt.gpio_set_direction(red_led_pin, PinDirection.OUTPUT)

    while 1:
        pt.gpio_set_level(red_led_pin, True)
        time.sleep(0.5)
        pt.gpio_set_level(red_led_pin, False)
        time.sleep(0.5)