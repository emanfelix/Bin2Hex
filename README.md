# Bin2Hex
A small game written in Verilog for practicing binary to hex conversion
### Where does it run
This code can be put on any FPGA board but current XDC file is is for Nexys A7 100t

### How to play
Objective: User must convert a randomly given hex number into binary

The game produces a randomly generated number and displays the number on a 7 seg display once the user flips the ready switch
 
 When user flips the ready switch the 30 second countdown timer begins and user has 30 seconds to enter answer
 #### Points
 - 3 points if answered < 10 s 
 - 2 points if answered 10 s < t < 20 s 
 - 1 point if answred 19 s < t < 30 s
 - 0 points if answered incorrectly or > 29 s 
 
 a deep tone is played for incorrect answer
 a higher pitched tune is played for correct answer
 
 points are awarded by time to input

### Demo

https://youtu.be/IXCfMsIpdg0

