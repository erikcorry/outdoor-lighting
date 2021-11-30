import solar_position
import gpio

TRANBJERG_LAT ::= 56.0900
TRANBJERG_LONG ::= 10.1337

main:
  power_pin := gpio.Pin 2 --output
  led_red := gpio.Pin 23 --pull_down --output
  led_green := gpio.Pin 22 --pull_down --output
  led_blue := gpio.Pin 21 --pull_down --output
  while true:
    now := Time.now
    position := solar_position.solar_position now TRANBJERG_LONG TRANBJERG_LAT
    hour := now.local.h
    if position.night:
      power_pin.set 1
      led_red.set   0
      led_green.set 1
    else:
      power_pin.set 0
      led_red.set   1
      led_green.set 0
    sleep --ms=5000
