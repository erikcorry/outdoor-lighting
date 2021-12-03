import fixed_point show *
import gpio
import i2c
import si7006

main:
  sda := gpio.Pin 17
  scl := gpio.Pin 16
  bus := i2c.Bus --sda=sda --scl=scl --frequency=100_000
  device := bus.device si7006.I2C_ADDRESS
  driver := si7006.Driver device
  print "Firmware: $driver.firmware"
  print "Serial#: $(%016x driver.serial_number)"
  print "Temperature: $(FixedPoint --decimals=1 driver.read_temperature)C"
  print "Humidity: $(FixedPoint --decimals=1 driver.read_humidity)%"
