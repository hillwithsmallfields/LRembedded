/*

  Controller for a valve manifold and Eberspacher D7L for my Land Rover.

  The mechanical hardware it controls is three linear actuators with
  clutches (built as throttle motors for cruise control) each
  operating a Y-flap valve directing the incoming air in two
  directions in variable proportions.  The valves are arranged as a
  tree, to give four destinations for the air: the front of the cab,
  the second row seats, the loadspace, and a pipe up to a roofrack
  tent.

  The arduino takes in heat requests from switches in the four areas,
  and sets the valves up to divide the hot air from the heater between
  all the areas that are requesting it.  It also switches the heater
  on and off appropriately.

  Uses https://github.com/adafruit/Adafruit_Motor_Shield_V2_Library

  https://learn.adafruit.com/adafruit-motor-shield-v2-for-arduino/library-reference

  https://learn.adafruit.com/adafruit-motor-shield-v2-for-arduino/faq

  pins A4 and A5 are used by the motor shield for SDA and SCL

    |-----+--------+-----------------|
    | pin | wire   | function        |
    |-----+--------+-----------------|
    |   1 | green  | common negative |
    |   2 | red    | positive        |
    |   3 | white  | position        |
    |   4 | blue   | clutch          |
    |   5 | yellow | motor           |
    |   6 | orange | motor           |
    |-----+--------+-----------------|

    The clutches draw 1/3 of an amp each.

 */

#include <Wire.h>
#include <Adafruit_MotorShield.h>

int front_request = 1;
int middle_request = 2;
int loadspace_request = 3;
int tent_request = 4;

int heater_on = 5;
int heater_full = 6;

/* delay */
const long_enough_to_detect_movement = 50;

/* sensor scale */
const sensor_range = 1023;
const halfway = sensor_range / 2;
const quarterway = sensor_range / 4;

/* motors */
const low_speed = 16;
const normal_speed = 128;

/* whether to switch to full power if there are requests from both
   sides of the root valve
 */
const auto_full_on = 0;

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 

typedef struct {
  Adafruit_DCMotor *motor;
  int sensor;                   /* each motor has a potentiometer to measure its position */
  int lowest;                   /* value from the sensor at the furthest back position */
  int range;                    /* difference in sensor readings between the two ends */
} manifold_valve;

/* The arrangement of outputs is such that the pairs which are
   likeliest to be on at the same time (tent and loadspace for
   camping, front and middle for driving) are on different outputs of
   the root valve, which I hope will make for the best airflow.
 */
manifold_valve root;            /* splits the hot air between upper and lower */
manifold_valve upper;           /* splits hot air between middle and loadspace */
manifold_valve lower;           /* splits hot air between tent and front */

Adafruit_DCMotor *clutches;

void calibrate(manifold_valve *valve) {
  /* move a motor in both directions, registering where it gets stuck
     at the limit of its travel */
  valve->motor->setSpeed(low_speed);
  int position = analogRead(valve->sensor);
  int prev = -1;
  valve->motor->run(BACKWARD);
  while (position != prev) {
    delay(long_enough_to_detect_movement);
    position = analogRead(valve->sensor);
  }
  valve->lowest = position;
  valve->motor->run(FORWARD);
  while (position != prev) {
    delay(long_enough_to_detect_movement);
    position = analogRead(valve->sensor);
  }
  valve->range = position - valve->lowest;
  valve->motor->run(RELEASE);
  valve->motor->setSpeed(normal_speed);
}

void setup() {
  AFMS.begin();
  pinMode(heater_on, OUTPUT);
  pinMode(heater_full, OUTPUT);
  clutches = AFMS.getMotor(4);
  clutches->run(FORWARD);
  root.motor = AFMS.getMotor(1); root.sensor = A0; calibrate(&root);
  upper.motor = AFMS.getMotor(2); upper.sensor = A1; calibrate(&upper);
  lower.motor = AFMS.getMotor(3); lower.sensor = A2; calibrate(&lower);
  clutches->run(RELEASE);
}

/* Move a valve to a set position.  The positions are specified in the
   scale that analogRead uses, and are scaled to suit the movement
   range of that particular valve.
 */
void set_position(manifold_valve valve, int new_position) {

  new_position = valve->lowest + ((new_position * valve->range) / sensor_range);
  
  int position = analogRead(valve->sensor);
  while (position != new_position) {
    if (position < new_position) {
      valve->motor->run(FORWARD);
    } else {
      valve->motor->run(BACKWARD);
    }
    delay(long_enough_to_detect_movement);
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
    int upper_position = halfway + middle_on*halfway - front_on*halfway;
    int lower_position = halfway + loadspace_on*halfway - tent_on*halfway;
    /* todo: I don't think this is right */
    int root_position = halfway + (middle_on*quarterway + front_on*quarterway) - (loadspace_on*quarterway + tent_on*quarterway);

    if ((analogRead(root.sensor) != root_position)
        || analogRead(upper.sensor) != upper_position
        || analogRead(lower.sensor) != lower_position) {
      clutches->run(FORWARD);
      set_position(&root, root_position);
      set_position(&upper, upper_position);
      set_position(&lower, lower_position);
      clutches->run(RELEASE);
    }
    digitalWrite(heater_on, HIGH);
    if (auto_full_on
        && (middle_on || loadspace_on)
        && (front_on || tent_on)) {
      digitalWrite(heater_full, HIGH);
    }
  } else {
    digitalWrite(heater_full, LOW);
    digitalWrite(heater_on, LOW);
  }
}
