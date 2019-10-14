/*

  Controller for a valve manifold and Eberspacher D7L

  Uses https://github.com/adafruit/Adafruit_Motor_Shield_V2_Library

  https://learn.adafruit.com/adafruit-motor-shield-v2-for-arduino/library-reference

  https://learn.adafruit.com/adafruit-motor-shield-v2-for-arduino/faq

  pins A4 and A5 are used by the motor shield for SDA and SCL

 */

#include <Wire.h>
#include <Adafruit_MotorShield.h>

int front_request = 1;
int middle_request = 2;
int loadspace_request = 3;
int tent_request = 4;

int heater_on = 5;
int heater_full = 6;

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 

typedef struct {
  Adafruit_DCMotor *motor;
  int sensor;
  int lowest;
  int highest;
} manifold_valve;

manifold_valve root;            /* splits the hot air between upper and lower */
manifold_valve upper;           /* splits hot air between middle and loadspace */
manifold_valve lower;           /* splits hot air between tent and front */

void calibrate(manifold_valve *valve) {
  valve->motor->setSpeed(10);
  int position = analogRead(valve->sensor);
  int prev = -1;
  valve->motor->run(FORWARD);
  while (position != prev) {
    delay(50);
    position = analogRead(valve->sensor);
  }
  valve->highest = position;
  valve->motor->run(BACKWARD);
  while (position != prev) {
    delay(50);
    position = analogRead(valve->sensor);
  }
  valve->lowest = position;
}

void setup() {
  AFMS.begin();
  pinMode(heater_on, OUTPUT);
  pinMode(heater_full, OUTPUT);
  root.motor = AFMS.getMotor(1); root.sensor = A0; calibrate(&root);
  upper.motor = AFMS.getMotor(2); upper.sensor = A1; calibrate(&upper);
  lower.motor = AFMS.getMotor(3); lower.sensor = A2; calibrate(&lower);
}

void set_position(manifold_valve valve, int new_position) {

  /* todo: use the values from the valve calibration to scale new_position */

  int position = analogRead(valve->sensor);
  while (position != new_position) {
    if (position < new_position) {
      valve->motor->run(FORWARD);
    } else {
      valve->motor->run(BACKWARD);
    }
    position = analogRead(sensor);
  }
  valve->motor->run(RELEASE);
}

void loop() {
  int front_on = digitalRead(front_request);
  int middle_on = digitalRead(middle_request);
  int loadspace_on = digitalRead(loadspace_request);
  int tent_on = digitalRead(tent_request);

  if (front_on || middle_on || loadspace_on || tent_on) {
  
    /* todo: define scaling factors according to the actual and desired airflows in each output */
  
    int upper_position = 127 + middle_on*127 - loadspace_on*127;
    int lower_position = 127 + front_on*127 - tent_on*127;
    int root_position = 127 + (middle_on*63 + loadspace_on*63) - (front_on*63 + tent_on*63);

    set_position(&root, root_position);
    set_position(&upper, upper_position);
    set_position(&lower, lower_position);
    digitalWrite(heater_on, HIGH);
    if ((middle_on || loadspace_on) && (front_on || tent_on)) {
      digitalWrite(heater_full, HIGH);
    }
  } else {
    digitalWrite(heater_full, LOW);
    digitalWrite(heater_on, LOW);
  }
}
