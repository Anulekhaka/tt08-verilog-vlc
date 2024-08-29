<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The input should switch between the TURN LEFT, TURN RIGHT, and EMERGENCY modes, adjusting the flash sequence and rate accordingly. Simultaneously, it should control the lamps on both sides of the vehicle.


## How to test

Apply the TURN LEFT input and observe the left lamps flashing in the regular sequence (0, 1, 2, 3, …).Similarly for TURN_RIGHT Activate EMERGENCY mode and verify that all six lamps flash in the specified emergency sequence (0, 1, 2, 3, 2, 1, 0, …), with double the flashing rate compared to TURN LEFT or TURN RIGHT mode. Left and right lamps should flash simultaneously.


## External hardware

nothing
