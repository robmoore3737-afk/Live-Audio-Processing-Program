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
## Widget Control
## Troubleshooting
