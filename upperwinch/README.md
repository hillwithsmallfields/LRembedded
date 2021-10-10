MotorSpeedDriver
================

This is an Arduino-based driver for a motor speed controller,
providing ramp-up and ramp-down of speed from two buttons instead of
having to operate switches and a potentiometer.

The motor is a small (900Kgf) winch on my Land Rover roof rack.

The circuit that this combination replaces is an H-bridge of relays
operated by pairs of pushbuttons (on different parts of the vehicle),
one of each pair to run it in each direction.

As the winch is noisy, I wanted to make it possible to vary the speed,
but I wanted to keep the simple two-button interface.

I asked an electronics professional about designing the motor
controller, and he said don't even try at that sort of current (70A),
just buy a ready-made one; too much can go wrong (like switching on
the wrong parts of an H-bridge together).  The unit I bought has a
potentiometer with three connections, and a click-switch on it with
two; and an SPDT switch for selecting the direction.  Both of the
switches are to ground, and work by pulling down.

Hardware
========

For experimentation, I'm using an Arduino Nano; for the final version,
on a PCB, I'll use an ATmega328 directly.

Software
========

Operation
---------

Pressing one button steadily increases the speed in that direction; if
the motor was going in the other direction, it'll slow it down, until
it passes through zero and speeds up in the other direction.

Pressing both buttons at once stops the motor immediately.

Starting
--------

As the buttons are exposed to the elements, although they're nominally
weatherproof, sometimes it takes a few presses to get them to close
the circuit, and as I don't want to risk starting the motor in one
direction then not being able to stop it, the software won't start the
motor until both buttons have been pressed and released.
