@ECHO OFF
del "z:\programs\kit\kit.map"
del "z:\programs\kit\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\kit\labels.tmp" -fI  -o "z:\programs\kit\kit.hex" -d "z:\programs\kit\kit.obj" -e "z:\programs\kit\kit.eep" -m "z:\programs\kit\kit.map" -W+ie   "Z:\PROGRAMS\KIT\KIT.asm"
