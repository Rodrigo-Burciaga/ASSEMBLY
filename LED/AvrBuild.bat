@ECHO OFF
del "z:\programs\led\led.map"
del "z:\programs\led\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\led\labels.tmp" -fI  -o "z:\programs\led\led.hex" -d "z:\programs\led\led.obj" -e "z:\programs\led\led.eep" -m "z:\programs\led\led.map" -W+ie   "Z:\PROGRAMS\LED\LED.asm"
