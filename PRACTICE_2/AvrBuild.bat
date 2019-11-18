@ECHO OFF
del "z:\programs\practice_2\practice_2.map"
del "z:\programs\practice_2\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\practice_2\labels.tmp" -fI  -o "z:\programs\practice_2\practice_2.hex" -d "z:\programs\practice_2\practice_2.obj" -e "z:\programs\practice_2\practice_2.eep" -m "z:\programs\practice_2\practice_2.map" -W+ie   "Z:\PROGRAMS\PRACTICE_2\PRACTICE_2.asm"
