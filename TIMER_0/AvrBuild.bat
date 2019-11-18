@ECHO OFF
del "z:\programs\timer_0\timer_0.map"
del "z:\programs\timer_0\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\timer_0\labels.tmp" -fI  -o "z:\programs\timer_0\timer_0.hex" -d "z:\programs\timer_0\timer_0.obj" -e "z:\programs\timer_0\timer_0.eep" -m "z:\programs\timer_0\timer_0.map" -W+ie   "Z:\PROGRAMS\TIMER_0\TIMER_0.asm"
