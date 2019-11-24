@ECHO OFF
del "z:\programs\assembly\practice_9\practice_9.map"
del "z:\programs\assembly\practice_9\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\assembly\practice_9\labels.tmp" -fI  -o "z:\programs\assembly\practice_9\practice_9.hex" -d "z:\programs\assembly\practice_9\practice_9.obj" -e "z:\programs\assembly\practice_9\practice_9.eep" -m "z:\programs\assembly\practice_9\practice_9.map" -W+ie   "Z:\PROGRAMS\ASSEMBLY\PRACTICE_9\PRACTICE_9.asm"
