#include <SPI.h>

#define WITH_LEDs 1

const int ControllerInPin     = 2;  // PD2 // 4
const int ControllerOutPin    = 3;  // PD3 // 5
const int ControllerEnablePin = 4;  // PD4 // 6

const int SpeakerPin          = 5;  // PD5 // 11

const int ButtonInPin         = 6;  // PD6 // 12
const int ButtonOutPin        = 7;  // PD7 // 13

const int PotCSPin            = 10; // PB2 // 16
// MOSI                       = 11; // PB3 // 17
// MISO                       = 12; // PB4 // 18
// SCK                        = 13; // PB5 // 19

#ifdef WITH_LEDs
const int LedInPin            = A0; // PC0 // 23
const int LedOutPin           = A1; // PC1 // 24
const int LedOperatingPin     = A2; // PC2 // 25
const int LedStartingPin      = A3; // PC4 // 26
#endif

void setup() {
  pinMode(ButtonInPin, INPUT);
  pinMode(ButtonOutPin, INPUT);
  pinMode(PotCSPin, OUTPUT);
  pinMode(ControllerInPin, OUTPUT);
  pinMode(ControllerOutPin, OUTPUT);
  pinMode(ControllerEnablePin, OUTPUT);
  pinMode(SpeakerPin, OUTPUT);
#ifdef WITH_LEDs
  pinMode(LedInPin, OUTPUT);
  pinMode(LedOutPin, OUTPUT);
  pinMode(LedOperatingPin, OUTPUT);
  pinMode(LedStartingPin, OUTPUT);
#endif
  // initialize SPI:
  SPI.begin(); 
#ifdef WITH_LEDs
  digitalWrite(LedStartingPin, HIGH);
  digitalWrite(LedOperatingPin, LOW);
  digitalWrite(LedInPin, LOW);
  digitalWrite(LedOutPin, LOW);
#endif
}

void set_pot(int setting) {
  digitalWrite(PotCSPin, LOW);
  delay(100);
  SPI.transfer(setting);
  delay(100);
  digitalWrite(PotCSPin, HIGH);
}

void set_speed(int speed) {
  if (speed == 0) {
    digitalWrite(ControllerEnablePin, LOW);
    digitalWrite(ControllerInPin, LOW);
    digitalWrite(ControllerOutPin, LOW);
    set_pot(0);
#ifdef WITH_LEDs
    digitalWrite(LedInPin, LOW);
    digitalWrite(LedOutPin, LOW);
#endif
  } else if (speed > 0) {
    digitalWrite(ControllerEnablePin, HIGH);
    digitalWrite(ControllerInPin, HIGH);
    digitalWrite(ControllerOutPin, LOW);
    set_pot(speed);
#ifdef WITH_LEDs
    digitalWrite(LedInPin, HIGH);
    digitalWrite(LedOutPin, LOW);
#endif
  } else {
    digitalWrite(ControllerEnablePin, HIGH);
    digitalWrite(ControllerInPin, LOW);
    digitalWrite(ControllerOutPin, HIGH);
    set_pot(-speed);
#ifdef WITH_LEDs
    digitalWrite(LedInPin, LOW);
    digitalWrite(LedOutPin, HIGH);
#endif
  }
}

/* This indicates whether we are in normal operation; otherwise, we
   are checking both buttons work */
int operating = 0;

/* For checking whether the buttons work */
int in_button_count = 0;
int out_button_count = 0;

/* Remembering previous button states, for debouncing */
int prev_in = 0;
int prev_out = 0;

/* For applying changes to the controller only when needed */
int prev_speed = 0;

/* For remembering when the most recent button activity was */
unsigned long last_press = 0;

/* after this long without button presses, go back to checking the
   buttons work */
#define TIMEOUT 1000 * 60 * 5

/* how frequently to poll the buttons etc */
#define CYCLE_TIME 20
#define SPEED_INCREMENT 1
#define SPEED_MAX 255
#define SPEED_MIN -255

void loop() {
  int in_button = digitalRead(ButtonInPin) == 0;
  int out_button = digitalRead(ButtonOutPin) == 0;
  if (operating) {
    int speed = prev_speed;
    if (in_button && prev_in) {
      if (out_button && prev_out) {
        speed = 0;
      } else {
        if (speed < SPEED_MAX) {
          speed += SPEED_INCREMENT;
        }
      }
    } else if (out_button && prev_out) {
      if (speed > SPEED_MIN) {
        speed -= SPEED_INCREMENT;
      }
    }
    if (speed != prev_speed) {
      set_speed(speed);
    }
    if (prev_in != in_button || prev_out != out_button) {
      last_press = millis();
    } else {
      if (millis() - last_press > TIMEOUT) {
        operating = 0;
#ifdef WITH_LEDs
        digitalWrite(LedOperatingPin, LOW);
        digitalWrite(LedStartingPin, HIGH);
#endif
      }
    }
  } else {
    if (prev_in && ! in_button) {
      in_button_count++;
    }
    if (prev_out && ! out_button) {
      out_button_count++;
    }
    if (in_button_count >= 3 && out_button_count >= 3) {
      operating = 1;
#ifdef WITH_LEDs
      digitalWrite(LedOperatingPin, HIGH);
      digitalWrite(LedStartingPin, LOW);
#endif
    }
  }
  prev_in = in_button;
  prev_out = out_button;
  delay(CYCLE_TIME);
}
