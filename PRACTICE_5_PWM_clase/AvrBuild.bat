@ECHO OFF
del "z:\programs\practice_5_pwm_clase\pwm_clase.map"
del "z:\programs\practice_5_pwm_clase\labels.tmp"
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "z:\programs\practice_5_pwm_clase\labels.tmp" -fI  -o "z:\programs\practice_5_pwm_clase\pwm_clase.hex" -d "z:\programs\practice_5_pwm_clase\pwm_clase.obj" -e "z:\programs\practice_5_pwm_clase\pwm_clase.eep" -m "z:\programs\practice_5_pwm_clase\pwm_clase.map" -W+ie   "Z:\PROGRAMS\PWM_clase\PWM_clase.asm"
