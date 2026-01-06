# Mice-behaviour-training-set-up-
All codes for interfacing hardware and MATLAB to set up the behavior training rig 
# Auditory Discrimination Behavior Rig (MATLAB + NI-DAQ + TDT RZ6)

This repository contains MATLAB code and rig-control logic for a mouse behavioral setup used for **auditory stimulus discrimination**. The rig combines **sensor-based response detection** (nose poke + lick), **automated water reward delivery**, and **sound playback through a TDT RZ6**. Task timing and parameters are designed to be easily adjustable for different training stages and protocols.

---

## What the rig supports

### Behavioral sensors & responses
- **Nose poke detection** using **IR sensors**
- **Lick detection** using a **lickometer**

### Reward delivery
- **Water reward** delivered to the lick spout through a **solenoid valve**
- Solenoid timing (open duration) is configurable from MATLAB

### Auditory stimulus delivery
- Sounds are played through **TDT RZ6**
- Stimulus parameters (identity, timing, trial structure) are configurable for discrimination tasks

### Task control & hardware interface
- MATLAB-based task logic and trial control
- Hardware I/O interfaced via **NI-DAQ** (digital/analog I/O, TTLs as needed)

---

## Hardware overview (typical)

- **TDT RZ6** (sound output)
- **NI-DAQ** device (digital/analog I/O)
- IR sensor(s) for nose poke
- Lickometer
- Solenoid valve + tubing + water reservoir
- Lick spout / lick port


## Software requirements

- **MATLAB**
- **NI-DAQmx** drivers for NI hardware
- TDT drivers/toolbox appropriate for your setup (for RZ6 control)


## Task description 

A typical session is organized as repeated trials:

1. **Inter-trial interval (ITI)**
2. **Auditory stimulus playback** (TDT RZ6)
3. **Response window**
   - nose poke / lick events are monitored
4. **Outcome**
   - reward delivery (solenoid) for correct responses
   - timeout / other feedback for incorrect responses (protocol-dependent)
5. **Logging**
   - timestamps for events, outcomes, and trial metadata

All timing variables (stimulus duration, response window, ITI, reward duration, etc.) are intended to be configurable.

---

## Configuration

Edit the configuration file(s) to match your rig:
- NI device name (e.g., `Dev1`)
- Channel mappings:
  - IR nose poke input
  - lickometer input
  - solenoid output
  - optional TTL outputs (trial start, stimulus on, reward, etc.)
- TDT RZ6 settings:
  - stimulus file path / stimulus bank
  - sampling rate (as set in your TDT circuit)
  - trigger method (software trigger or TTL, depending on your design)
- Task parameters:
  - trial count, block structure, stimulus probabilities
  - decision rule, response window, timeout duration
  - reward amount (solenoid open time)

---

## Data output

Session logs typically include:
- Trial-by-trial stimulus identity
- Nose poke and lick event times
- Reward times / outcomes
- Trial timestamps (stimulus on/off, response window, trial end)
- Session metadata (animal ID, date, parameter set)




## Contact
Add your name + email / lab webpage here.
