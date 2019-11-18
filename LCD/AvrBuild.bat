@ECHO OFF
del "z:\programs\assembly\lcd\lcd.map"
del "z:\programs\assembly\lcd\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\assembly\lcd\labels.tmp" -fI  -o "z:\programs\assembly\lcd\lcd.hex" -d "z:\programs\assembly\lcd\lcd.obj" -e "z:\programs\assembly\lcd\lcd.eep" -m "z:\programs\assembly\lcd\lcd.map" -W+ie   "Z:\PROGRAMS\ASSEMBLY\LCD\LCD.asm"
