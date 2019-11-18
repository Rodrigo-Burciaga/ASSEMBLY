@ECHO OFF
del "z:\programs\training\training.map"
del "z:\programs\training\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\training\labels.tmp" -fI  -o "z:\programs\training\training.hex" -d "z:\programs\training\training.obj" -e "z:\programs\training\training.eep" -m "z:\programs\training\training.map" -W+ie   "Z:\PROGRAMS\Training\Training.asm"
