@ECHO OFF
del "z:\programs\practice_4\practice_4.map"
del "z:\programs\practice_4\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\practice_4\labels.tmp" -fI  -o "z:\programs\practice_4\practice_4.hex" -d "z:\programs\practice_4\practice_4.obj" -e "z:\programs\practice_4\practice_4.eep" -m "z:\programs\practice_4\practice_4.map" -W+ie   "Z:\PROGRAMS\PRACTICE_4\PRACTICE_4.asm"
