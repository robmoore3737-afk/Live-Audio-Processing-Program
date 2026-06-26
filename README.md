# Live-Audio-Processing-Program

This Live-Audio-Processing program is a real-time Csound/CsoundQT effect patch that takes microphone input and applies user-defined processing, which is then sent to an output. The effects at hand include: gain changing, low-pass filtering, delay and feedback amount, and overall effect (dry/wet). Live signal processing is controlled in real-time with a graphical interface. 

This project is a compact processor that allows for intuitive interaction and is ideal for live performance. 

## Overview 

This software captures sound events through a microphone and processes them in real time. The incoming signal passes through a simple DSP chain consisting of gain control, low-pass filtering, delay with feedback and wet/dry mixing before being sent to the output. 

The effects can create interesting textures when sounds events are captured by the microphone providing a creative tool for live performance. The user is recommended to use headphones when testing; if the audio set up is liable to additional feedback, a build up and smearing of signal may result. The graphical user interface makes interacting with the software practical and intuitive. 


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

## GUI slider controls

### - Gain Effect
The gain controls the overall energy given on the way out. This helps maintaining audio levels . 

### - Low-Pass Filter
The control for the filter allows higher frequencies to pass when the control value is high, and blocks higher frequencies the lower the value.

### Delay Time 
Increasing the value of this parameters increases the time delay (seconds) of the signal reaching the output. The highest vaue is 4 seconds. Lower values create tighter echos. 

### Feedback 
Controls how much of the delay signal is put bacxk into the delay line. This increases the number of repeats potentially creating  smeared or more resonant textures.

### Wet/Dry Mix
Explore the spectrum of an original signal to heavly processed signal encompassing all of the effects. Lower values equal a more original signal.

## Live-use note
This program can be used in live-performance contexts, but care must be taken with microphone and speaker placement. Because the software processes live microphone input and returns it to the output, acoustic feedback may occur if the speaker signal is re-captured by the microphone.

## Repository contents
live-audio-processing-program/
  README.md
  src/
    LiveAudioProgram.csd
  docs/
    one-page-description.md
  assets/
    screenshot.png
  build_and_run.md


## Author
Robert Moore
