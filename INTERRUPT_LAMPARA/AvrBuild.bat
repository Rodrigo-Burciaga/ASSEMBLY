@ECHO OFF
del "z:\programs\interrupt\interrupt.map"
del "z:\programs\interrupt\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\interrupt\labels.tmp" -fI  -o "z:\programs\interrupt\interrupt.hex" -d "z:\programs\interrupt\interrupt.obj" -e "z:\programs\interrupt\interrupt.eep" -m "z:\programs\interrupt\interrupt.map" -W+ie   "Z:\PROGRAMS\INTERRUPT\INTERRUPT.asm"
