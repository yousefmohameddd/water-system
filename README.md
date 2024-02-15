# Plant Care System

## Description

This system was created in VHDL and tested using an Altera DE10 Lite board. Other boards can be used. It is designed to efficiently water plants based on user-defined parameters and automatically dispense fertilizer using an Arduino connected to a motor.
after the watering process is complete.

## How to Use

Change the signal called "seconds" to control the amount of time the plant is watered. The only input is a switch that acts as a power on/off button for the entire system.\
Each of the outputs must be connected as follows:
- servo: Connect it directly to the Arduino
- pump: Connect it with a pump of your choice
- stage1 & stage2 & led: Connect to any led of your choice

The Arduino takes the servo output from the FPGA board as input and outputs a signal for the servo motor that controls the fertilizer.


