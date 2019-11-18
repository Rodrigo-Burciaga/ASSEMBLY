@ECHO OFF
del "z:\programs\hello_world\hello_world.map"
del "z:\programs\hello_world\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\hello_world\labels.tmp" -fI  -o "z:\programs\hello_world\hello_world.hex" -d "z:\programs\hello_world\hello_world.obj" -e "z:\programs\hello_world\hello_world.eep" -m "z:\programs\hello_world\hello_world.map" -W+ie   "Z:\PROGRAMS\Hello_World\Hello_World.asm"
