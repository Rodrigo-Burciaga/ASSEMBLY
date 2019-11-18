@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\bin_bcd\labels.tmp" -fI  -o "z:\programs\bin_bcd\bin_bcd.hex" -d "z:\programs\bin_bcd\bin_bcd.obj" -e "z:\programs\bin_bcd\bin_bcd.eep" -m "z:\programs\bin_bcd\bin_bcd.map" -W+ie   "Z:\PROGRAMS\bin_bcd\bin_bcd.asm"
