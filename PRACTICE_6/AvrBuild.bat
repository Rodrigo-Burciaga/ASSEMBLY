@ECHO OFF
del "z:\programs\practice_6\practice_6.map"
del "z:\programs\practice_6\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\practice_6\labels.tmp" -fI  -o "z:\programs\practice_6\practice_6.hex" -d "z:\programs\practice_6\practice_6.obj" -e "z:\programs\practice_6\practice_6.eep" -m "z:\programs\practice_6\practice_6.map" -W+ie   "Z:\PROGRAMS\PRACTICE_6\PRACTICE_6.asm"
