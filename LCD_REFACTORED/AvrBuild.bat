@ECHO OFF
del "z:\programs\lcd_refactored\lcd_refactored.map"
del "z:\programs\lcd_refactored\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\lcd_refactored\labels.tmp" -fI  -o "z:\programs\lcd_refactored\lcd_refactored.hex" -d "z:\programs\lcd_refactored\lcd_refactored.obj" -e "z:\programs\lcd_refactored\lcd_refactored.eep" -m "z:\programs\lcd_refactored\lcd_refactored.map" -W+ie   "Z:\PROGRAMS\LCD_REFACTORED\LCD_REFACTORED.asm"
