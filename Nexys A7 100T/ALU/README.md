# ALU

## Description
This project was part of a lab for my logic design class at BU. This project builds an ALU, Arithmetic Logic Unit. The mathemitical operations are done using a carry select 
adder, which is faster then a ripple carry adder but slower then a carry look ahead adder. The logical operations are done directly using a gates. These operations are handled 
by the ALU module which uses case and if statements to mux, the outputs correctly depending on the inputs. The user can select the inputs using a keyboard, the system only 
listens to valid inputs. If an invalid input is pressed then nothing happens. This info is then encoded and decoded for the ALU to understand. The results of the ALU are 
displayed using 7 segment display for letters and numbers, and an LED light and VGA to visually show if their is possible calculations errors due to carry out bits not being 
calculated, which happens because this a 4 bit adder, so anything bigger will cause an error. This lab took about 1-2 days to complete.

## I/O
### Inputs
- Keyboard
- Switch
- CPU Reset Button
- 100MHz Clock

### Outputs
- LED
- 7 Segment Display
- VGA

## Main Modules
The following modules are the main modules that controlled by the top module, dec_alu, though they are put together with many sub-modules.

### Encoder
This module takes in user input from the keyboard, then creates BCD sentences out of the numbers typed in. The encoder then converts this to binary, this done through a
reverse version of double dabble. This allows the decoder to understand the values as a traditional binary number allowing these numbers to be sent directly to the ALU for
computation.

### Decoder
This module takes inputs from the encoder and alu. Depending on the operation asked for the decoder gives a new value for a and b, and also sets the values for mode, operation,
and carry in. Once the alu is done with its computation it sends the result back to the decoder where it is reverted back to BCD so it can be displayed on the 7 segment display.

### ALU
This module worries about computating the mathimatical or logical operation requested by the user. Once it is done it sends the final result back to the decoder.

### disp_7_seg and vga_controller
Both of these modules worry about displaying values either using numbers and letters (7 seg display) or colors (VGA). The 7 segment display shows one of three things, the
current thing the user is inputing, or the current requested computation, or the result of the requested computation. To activate the display the for the current thing being
inputted the user needs to start typing there input, once the user presses enter it will show one of the two display possibilities. This other two display possibilities
can be choosen using the switch.
