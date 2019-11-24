@ECHO OFF
del "z:\programs\assembly\echo_usart\echo_usart.map"
del "z:\programs\assembly\echo_usart\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\assembly\echo_usart\labels.tmp" -fI  -o "z:\programs\assembly\echo_usart\echo_usart.hex" -d "z:\programs\assembly\echo_usart\echo_usart.obj" -e "z:\programs\assembly\echo_usart\echo_usart.eep" -m "z:\programs\assembly\echo_usart\echo_usart.map" -W+ie   "Z:\PROGRAMS\ASSEMBLY\ECHO_USART\ECHO_USART.asm"
