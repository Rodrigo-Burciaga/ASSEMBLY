@ECHO OFF
del "z:\programs\rjmp\rjmp.map"
del "z:\programs\rjmp\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\rjmp\labels.tmp" -fI  -o "z:\programs\rjmp\rjmp.hex" -d "z:\programs\rjmp\rjmp.obj" -e "z:\programs\rjmp\rjmp.eep" -m "z:\programs\rjmp\rjmp.map" -W+ie   "Z:\PROGRAMS\RJMP\RJMP.asm"
