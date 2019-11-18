@ECHO OFF
del "z:\programs\corrimiento_disply\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\corrimiento_disply\labels.tmp" -fI  -o "z:\programs\corrimiento_disply\corrimiento_disply.hex" -d "z:\programs\corrimiento_disply\corrimiento_disply.obj" -e "z:\programs\corrimiento_disply\corrimiento_disply.eep" -m "z:\programs\corrimiento_disply\corrimiento_disply.map" -W+ie   "Z:\PROGRAMS\corrimiento_disply\corrimiento_disply.asm"
