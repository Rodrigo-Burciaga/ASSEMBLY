@ECHO OFF
del "z:\programs\assembly\practice_8\practice_8.map"
del "z:\programs\assembly\practice_8\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\assembly\practice_8\labels.tmp" -fI  -o "z:\programs\assembly\practice_8\practice_8.hex" -d "z:\programs\assembly\practice_8\practice_8.obj" -e "z:\programs\assembly\practice_8\practice_8.eep" -m "z:\programs\assembly\practice_8\practice_8.map" -W+ie   "Z:\PROGRAMS\ASSEMBLY\PRACTICE_8\PRACTICE_8.asm"
