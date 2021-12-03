import solar_position
import gpio

TRANBJERG_LAT ::= 56.0900
TRANBJERG_LONG ::= 10.1337

main:
  power_pin := gpio.Pin 2 --output
  led_red := gpio.Pin 23 --pull_down --output
  led_green := gpio.Pin 22 --pull_down --output
  led_blue := gpio.Pin 21 --pull_down --output

  power_pin.set 0
  sleep --ms=1000

  power_pin.set 1
  sleep --ms=1000
