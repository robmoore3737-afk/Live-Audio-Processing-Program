# Live-Audio-Processing-Program

This Live-Audio-Processing program is a real-time Csound/CsoundQT effect patch that takes microphone input and applies user-defined processing, which is then sent to an output. The effects at hand include: gain changing, low-pass filtering, delay and feedback amount, and overall effect (dry/wet). Live signal processing is controlled in real-time with a graphical interface. 

This project is a compact processor that allows for intuitive interaction and is ideal for live performance. 

## Overview 

This software captures sound events through a microphone and processes them in real time. The incoming signal passes through a simple DSP chain consisting of gain control, low-pass filtering, delay with feedback and wet/dry mixing before being sent to the output. 

The effects can create interesting textures when sounds events are captured by the microphone providing a creative tool for live performance. The user is recommended to use headphones when testing; if the audio set up is liable to additional feedback, a build up and smearing of signal may result. The graphical user interface makes interacting with the software practical and intuitive. With minimal signal mixing, the code effectively acts as an audio interface. 

## Features
- Live Microphone input
- Real-time output gain control
- Low-pass filter for timbral shaping
- adjustiable delay time
- Delay feedback control
- Wet/dry mix control
- GUI-based real-time parameter control


## Using the code

1. Dowload and run the "LiveAudioProessingProgram.csd"
2. Enable realtime audio input and output
3. Select input and output devices
4. Confirm GUI widgets have the correct channel names
5. Run the programm
6. Speak, clap or send short/long sounds into the micrcophone and adjust the effects

## GUI controls

### GAIN EFFECT
The gain controls the overall energy given on the way out, scaled to ....

### LOW-PASS Filter
The control for the filter 
