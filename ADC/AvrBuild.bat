@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\adc\labels.tmp" -fI  -o "z:\programs\adc\adc.hex" -d "z:\programs\adc\adc.obj" -e "z:\programs\adc\adc.eep" -m "z:\programs\adc\adc.map" -W+ie   "Z:\PROGRAMS\ADC\ADC.asm"
