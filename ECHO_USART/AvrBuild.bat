@ECHO OFF
del "z:\programs\echo_usart\echo_usart.map"
del "z:\programs\echo_usart\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\echo_usart\labels.tmp" -fI  -o "z:\programs\echo_usart\echo_usart.hex" -d "z:\programs\echo_usart\echo_usart.obj" -e "z:\programs\echo_usart\echo_usart.eep" -m "z:\programs\echo_usart\echo_usart.map" -W+ie   "Z:\PROGRAMS\ECHO_USART\ECHO_USART.asm"
