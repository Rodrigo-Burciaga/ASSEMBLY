@ECHO OFF
del "z:\programs\led2\led2.map"
del "z:\programs\led2\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\led2\labels.tmp" -fI  -o "z:\programs\led2\led2.hex" -d "z:\programs\led2\led2.obj" -e "z:\programs\led2\led2.eep" -m "z:\programs\led2\led2.map" -W+ie   "Z:\PROGRAMS\LED2\LED2.asm"
