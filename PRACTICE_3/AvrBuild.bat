@ECHO OFF
del "z:\programs\practice_3\practice_3.map"
del "z:\programs\practice_3\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\practice_3\labels.tmp" -fI  -o "z:\programs\practice_3\practice_3.hex" -d "z:\programs\practice_3\practice_3.obj" -e "z:\programs\practice_3\practice_3.eep" -m "z:\programs\practice_3\practice_3.map" -W+ie   "Z:\PROGRAMS\PRACTICE_3\PRACTICE_3.asm"
