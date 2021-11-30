# Erik's outdoor lights.

The balcony app switches on the lights when the sun is down, but switches
them off between 1am and 6am when nobody is looking anyway.

The carport app switches on the lights when the sun is down, but it is
mounted behind a movement sensor, so it has to boot up whenever someone
goes by.

Deployed with

```
toit device use erik-balcony
toit deploy balcony.yaml

toit device use erik-carport
toit deploy carport.yaml
