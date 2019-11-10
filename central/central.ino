/* 
   Arduino Mega for my Land Rover console.

   I have rebuilt my Land Rover, and the wiring system I made is
   non-standard.  Most of it is 8-way cables coming into a central hub
   of 3 rows of 8 sockets, with ad-hoc connections between them at the
   back.  Many of these have smaller wires attached, with a view to
   connecting them to voltage dividers driving LEDs and the inputs of
   a large PISO shift register that can be read by an Arduino Mega
   ADK, which will connect to an Android phablet (mounting bezel
   defined at
   https://github.com/hillwithsmallfields/cnc-things/blob/master/panel-phablet-surround/panel-phablet-surround.scad)
   so that can report on the status of all the connections.

   The phablet's power button is hidden and operated by a solenoid (so
   if it is running a tracker or other security system, it can't so
   easily be switched off by an intruder), which is controlled from
   this Arduino.

   The Arduino will probably pick up a variety of other monitoring
   functions such as voltages and temperatures (see
   https://create.arduino.cc/projecthub/TheGadgetBoy/ds18b20-digital-temperature-sensor-and-arduino-9cc806
   and
   https://www.milesburton.com/Dallas_Temperature_Control_Library).

   There might also be up to six buttons next to the phablet, that can
   be read by the Arduino --- not sure about this yet; the holes are
   there in the metalwork but I'm not sure about bringing them through
   the bezel around the phablet.
 */

#include <OneWire.h> 
#include <DallasTemperature.h>

#define PHABLET_POWER_SWITCH 1
#define PHABLET_POWER_SWITCH_DELAY 2000

#define HUB_BITS 64
#define HUB_SERIAL_CLOCK 2
#define HUB_LOAD_STROBE 3
#define HUB_DATA 4

#define IGNITION 5

#define ONE_WIRE_BUS 6

#define MAIN_VOLTAGE A0
#define MAIN_VOLTAGE_SCALE 4.0 /* adjust to calibrate voltage divider */
#define AUX_VOLTAGE A1
#define AUX_VOLTAGE_SCALE 4.0 /* adjust to calibrate voltage divider */

uint8_t hub_data[(HUB_BITS+7) / 8];
bool previous_ignition = false;
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

void setup() {
  pinMode(PHABLET_POWER_SWITCH, OUTPUT);
  pinMode(HUB_SERIAL_CLOCK, OUTPUT);
  sensors.begin();
}

void toggle_phablet_power() {
  digitalWrite(PHABLET_POWER_SWITCH, HIGH);
  delay(PHABLET_POWER_SWITCH_DELAY);
  digitalWrite(PHABLET_POWER_SWITCH, LOW);
}

void read_hub() {
  int hub_bytes = (HUB_BITS + 7) / 8;

  digitalWrite(HUB_LOAD_STROBE, HIGH);
  delay(1);
  digitalWrite(HUB_LOAD_STROBE, LOW);

  for (int i = 0; i < hub_bytes; i++) {
    unsigned uint8_t acc = 0;
    for (int j = 0; j < 8; j++) {
      digitalWrite(HUB_SERIAL_CLOCK, HIGH);
      delay(1);
      digitalWrite(HUB_SERIAL_CLOCK, LOW);
      delay(1);
      acc = (acc << 1) | digitalRead(HUB_DATA);
    }
    hub_data[i] = acc;
  }
}

float temp0;
float temp1;
float temp2;
float main_voltage;
float aux_voltage;

void loop() {
  ignition = digitalRead(IGNITION);
  
  if (ignition) {
    /* vehicle is running */
    if (!previous_ignition) {
      /* vehicle is being started */
    }
    read_hub();
    sensors.requestTemperatures();
    temp0 = sensors.getTempCByIndex(0);
    temp1 = sensors.getTempCByIndex(1);
    temp2 = sensors.getTempCByIndex(2);
    main_voltage = analogRead(MAIN_VOLTAGE) * MAIN_VOLTAGE_SCALE;
    aux_voltage = analogRead(AUX_VOLTAGE) * AUX_VOLTAGE_SCALE;
  } else {
    /* vehicle is on standby */
    if (previous_ignition) {
      /* vehicle has just been switched off */
    }
  }
  previous_ignition = ignition;
}
