# Setup and Run

## Overview

This project is a real-time Csound audio effect. It takes microphone input, applies gain, low-pass filtering, delay, 
feedback and wet/dry mixing, and sends the processed signal to the output. Because the project runs in real time, there is 
no separate software build step in the conventional complie-program sense. Instead, the '.csd' file is downloaded, opened in 
CsoundQt directly.

## Requirements
- Csound installed
- CsoundQt installed (Csound frontend)
- A working microphone
- A working output device such as headphones or speakers

## Main file
Open the main project file in CsoundQt:
'scr/LiveAudioProcessingProgram.csd'

## Running the project
1. Open the source file
2. Make sure widget panel is visible - see 'widget_setup.png' for reference
3. Select the correct input and output audio devices
4. Run the patch
5. Speak or make short bursts of sound and adjust the controls

## Realtime audio settings
Using the Csound options '-iadc' and '-odac' Csound can recieve and send signal at the same time.

These flags tell Csound to use:
  - 'adc' for live analogue to digital conversion for input
  - 'dac' for live digital to analogue conversion for output

Depending on the operating system, multiple real-time audio modules may be used, for example:
  - 'portaudio'
  - 'coraudio' on macOS
  - 'alsa' or 'jacj' on Linux

## CsoundQt configuration notes
If there is no live input, ensure the correct device has been selected in the CsoundQt Cconfiguratin settings or check wiring conections. 

Ensure 'RT Audio Module' is set to an appropriate backend for your machine. 


## Widget Control
Using the opcode 'invalue', CsoundQt accesses the graphical user interface via channels names to adjust the processing in real-time. It is imperative that the widget properties show the channel name as the same in the code, otherwise Csound will recieve the wrong information. 

The channel names are: "gain", "cutoff", "delay", "feedback", and "mix." 


## Troubleshooting

### No sound
- Check microphone is connected and selected as input device
- Check output device is connected and selected as output device
- Make sure the patch is running real-time not "offline rendering"

### Widgets do not affect the sound
- Make sure the frontend CsoundQt is running the patch, nut just Csound
- Make sure the widget panel is visible
- Ensure widget channel names in "properties" make the invalue string
- Make sure your machine volume is also turned up

### Crashing
- Check the audi device settings
- Run the patch with simple input/output routine
- Run the program in terminal to see error messages

### Live-use note
This project may be used in live performance but caution is advised in microphone and speaker set up. The microphone may pick up acoustic acitivty from the speaker itself, creating an feedback system that can be easily overloaded. For this reason using headphones or carefully positioned input and output devices is recommened. Gain and feedback levels can be lowered to minimise this overloading effect.
