@ECHO OFF
del "z:\programs\flags\flags.map"
del "z:\programs\flags\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\flags\labels.tmp" -fI  -o "z:\programs\flags\flags.hex" -d "z:\programs\flags\flags.obj" -e "z:\programs\flags\flags.eep" -m "z:\programs\flags\flags.map" -W+ie   "Z:\PROGRAMS\Flags\Flags.asm"
