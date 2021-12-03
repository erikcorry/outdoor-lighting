import gpio
import i2c
import si7006

TRANBJERG_LAT ::= 56.0900
TRANBJERG_LONG ::= 10.1337

main:
  power_pin := gpio.Pin 2 --output
  led_red := gpio.Pin 23 --pull_down --output
  led_green := gpio.Pin 22 --pull_down --output
  led_blue := gpio.Pin 21 --pull_down --output

  sda := gpio.Pin 17
  scl := gpio.Pin 16
  bus := i2c.Bus --sda=sda --scl=scl --frequency=100_000
  device := bus.device si7006.I2C_ADDRESS

  driver := si7006.Driver device

  while true:
    temperature := driver.read_temperature
    if temperature < 9.9:
      power_pin.set 1
      led_blue.set 1  // Blue for it's cold.
      led_green.set 0
      led_red.set 0
    else if temperature > 10.1:
      power_pin.set 0
      led_red.set 1  // Blue for it's cold.
      led_green.set 0
      led_blue.set 0
    else:
      led_red.set 0
      led_green.set 1  // Green for it's just right.
      led_blue.set 0

    sleep --ms=5000
