EESchema Schematic File Version 4
LIBS:MotorSpeedDriver-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328-PU U1
U 1 1 61099AC8
P 3000 3450
F 0 "U1" H 2359 3496 50  0000 R CNN
F 1 "ATmega328-PU" H 2359 3405 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 3000 3450 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3000 3450 50  0001 C CNN
	1    3000 3450
	1    0    0    -1  
$EndComp
$Comp
L Potentiometer_Digital:MCP41010 U3
U 1 1 61099C06
P 7600 2550
F 0 "U3" H 7600 3128 50  0000 C CNN
F 1 "MCP41010" H 7600 3037 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7600 2550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/11195c.pdf" H 7600 2550 50  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2750 7100 2750
Wire Wire Line
	7100 2750 7100 2450
Wire Wire Line
	7100 2450 7200 2450
$Comp
L Connector:Screw_Terminal_01x03 ControllerPot1
U 1 1 61099F36
P 8600 2550
F 0 "ControllerPot1" H 8680 2592 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 8680 2501 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-3-5.08_1x03_P5.08mm_Horizontal" H 8600 2550 50  0001 C CNN
F 3 "~" H 8600 2550 50  0001 C CNN
	1    8600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2450 8400 2450
Wire Wire Line
	8000 2550 8400 2550
Wire Wire Line
	8000 2650 8400 2650
$Comp
L Transistor_FET:2N7000 Q2
U 1 1 6109A261
P 7300 4800
F 0 "Q2" H 7505 4846 50  0000 L CNN
F 1 "2N7000" H 7505 4755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7500 4725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 7300 4800 50  0001 L CNN
	1    7300 4800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7000 Q3
U 1 1 6109A2F7
P 7950 4800
F 0 "Q3" H 8155 4846 50  0000 L CNN
F 1 "2N7000" H 8155 4755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8150 4725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 7950 4800 50  0001 L CNN
	1    7950 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6109A4D0
P 4450 4250
F 0 "R4" V 4254 4250 50  0000 C CNN
F 1 "220R" V 4345 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4450 4250 50  0001 C CNN
F 3 "~" H 4450 4250 50  0001 C CNN
	1    4450 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6109A53D
P 4700 4150
F 0 "R5" V 4504 4150 50  0000 C CNN
F 1 "220R" V 4595 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4700 4150 50  0001 C CNN
F 3 "~" H 4700 4150 50  0001 C CNN
	1    4700 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6109A581
P 4150 4350
F 0 "R3" V 3954 4350 50  0000 C CNN
F 1 "220R" V 4045 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4150 4350 50  0001 C CNN
F 3 "~" H 4150 4350 50  0001 C CNN
	1    4150 4350
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 PotSwitch1
U 1 1 6109CC3B
P 8600 3700
F 0 "PotSwitch1" H 8680 3692 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 8680 3601 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 8600 3700 50  0001 C CNN
F 3 "~" H 8600 3700 50  0001 C CNN
	1    8600 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 DirectionSwitch1
U 1 1 6109CCB6
P 8600 4150
F 0 "DirectionSwitch1" H 8680 4192 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 8680 4101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-3-5.08_1x03_P5.08mm_Horizontal" H 8600 4150 50  0001 C CNN
F 3 "~" H 8600 4150 50  0001 C CNN
	1    8600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4250 8050 4250
Wire Wire Line
	8050 4250 8050 4600
$Comp
L Connector:Screw_Terminal_01x02 Buttons1
U 1 1 6109DC5E
P 8600 2000
F 0 "Buttons1" H 8680 1992 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 8680 1901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 8600 2000 50  0001 C CNN
F 3 "~" H 8600 2000 50  0001 C CNN
	1    8600 2000
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U2
U 1 1 6109EA18
P 6400 1000
F 0 "U2" H 6400 1242 50  0000 C CNN
F 1 "L7805" H 6400 1151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6425 850 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6400 950 50  0001 C CNN
	1    6400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1000 6750 1000
$Comp
L Connector:Screw_Terminal_01x02 PowerIn1
U 1 1 610A005E
P 8600 1600
F 0 "PowerIn1" H 8680 1592 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 8680 1501 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 8600 1600 50  0001 C CNN
F 3 "~" H 8600 1600 50  0001 C CNN
	1    8600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1700 8200 1700
$Comp
L Device:R_Small R7
U 1 1 610A37EA
P 5200 5250
F 0 "R7" V 5004 5250 50  0000 C CNN
F 1 "10k" V 5095 5250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 5200 5250 50  0001 C CNN
F 3 "~" H 5200 5250 50  0001 C CNN
	1    5200 5250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 610A3883
P 4950 5000
F 0 "R6" V 4754 5000 50  0000 C CNN
F 1 "10k" V 4845 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4950 5000 50  0001 C CNN
F 3 "~" H 4950 5000 50  0001 C CNN
	1    4950 5000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 610A8925
P 4950 1250
F 0 "R1" V 4754 1250 50  0000 C CNN
F 1 "47k" V 4845 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4950 1250 50  0001 C CNN
F 3 "~" H 4950 1250 50  0001 C CNN
	1    4950 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 610A8980
P 5200 1600
F 0 "R2" V 5004 1600 50  0000 C CNN
F 1 "47k" V 5095 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 5200 1600 50  0001 C CNN
F 3 "~" H 5200 1600 50  0001 C CNN
	1    5200 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 4150 8200 4150
Connection ~ 8200 1700
Wire Wire Line
	8200 1700 7950 1700
$Comp
L Device:Crystal Y1
U 1 1 610A9ADE
P 6400 2950
F 0 "Y1" V 6354 3081 50  0000 L CNN
F 1 "Crystal" V 6445 3081 50  0000 L CNN
F 2 "Crystal:Crystal_HC18-U_Horizontal" H 6400 2950 50  0001 C CNN
F 3 "~" H 6400 2950 50  0001 C CNN
	1    6400 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 610B1B45
P 6650 3350
F 0 "C2" H 6742 3396 50  0000 L CNN
F 1 "C_Small" H 6742 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 6650 3350 50  0001 C CNN
F 3 "~" H 6650 3350 50  0001 C CNN
	1    6650 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 610B1BD5
P 6050 3350
F 0 "C1" H 6142 3396 50  0000 L CNN
F 1 "C_Small" H 6142 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 6050 3350 50  0001 C CNN
F 3 "~" H 6050 3350 50  0001 C CNN
	1    6050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2950 6050 2950
Wire Wire Line
	6650 2850 6650 2950
Wire Wire Line
	6050 3550 6050 3450
Wire Wire Line
	6650 3450 6650 3550
Wire Wire Line
	6650 3550 6050 3550
$Comp
L Transistor_FET:2N7000 Q4
U 1 1 6109D1E7
P 5650 4800
F 0 "Q4" H 5855 4846 50  0000 L CNN
F 1 "2N7000" H 5855 4755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5850 4725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 5650 4800 50  0001 L CNN
	1    5650 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1850 7600 2150
Wire Wire Line
	3000 1950 3000 1850
Wire Wire Line
	3000 1850 7000 1850
$Comp
L Device:R_Small R8
U 1 1 610B4317
P 3900 4450
F 0 "R8" V 3704 4450 50  0000 C CNN
F 1 "220R" V 3795 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 3900 4450 50  0001 C CNN
F 3 "~" H 3900 4450 50  0001 C CNN
	1    3900 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4450 3800 4450
$Comp
L Connector:Screw_Terminal_01x02 Speaker1
U 1 1 610CA1C8
P 8600 4400
F 0 "Speaker1" H 8680 4392 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 8680 4301 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 8600 4400 50  0001 C CNN
F 3 "~" H 8600 4400 50  0001 C CNN
	1    8600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4350 3600 4350
Wire Wire Line
	4350 4250 3600 4250
Wire Wire Line
	6000 4350 4250 4350
Wire Wire Line
	4550 4250 7750 4250
Wire Wire Line
	7750 4250 7750 4800
Wire Wire Line
	3600 4150 4600 4150
Wire Wire Line
	3000 5600 4550 5600
$Comp
L power:GND #PWR02
U 1 1 6115D715
P 4550 5850
F 0 "#PWR02" H 4550 5600 50  0001 C CNN
F 1 "GND" H 4555 5677 50  0000 C CNN
F 2 "" H 4550 5850 50  0001 C CNN
F 3 "" H 4550 5850 50  0001 C CNN
	1    4550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5850 4550 5600
Connection ~ 4550 5600
Wire Wire Line
	5200 2000 5200 1700
Wire Wire Line
	5200 1500 5200 1000
Connection ~ 5200 1000
Connection ~ 5200 2000
Wire Wire Line
	4800 4150 7100 4150
Wire Wire Line
	4950 4550 3600 4550
Wire Wire Line
	5200 4650 3600 4650
Wire Wire Line
	5200 2000 5200 4650
$Comp
L Device:C_Small C3
U 1 1 611D3737
P 6050 1350
F 0 "C3" V 5821 1350 50  0000 C CNN
F 1 "C_Small" V 5912 1350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 6050 1350 50  0001 C CNN
F 3 "~" H 6050 1350 50  0001 C CNN
	1    6050 1350
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 611D37CE
P 6750 1350
F 0 "C4" V 6521 1350 50  0000 C CNN
F 1 "C_Small" V 6612 1350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 6750 1350 50  0001 C CNN
F 3 "~" H 6750 1350 50  0001 C CNN
	1    6750 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2450 6850 2450
Wire Wire Line
	6850 2450 6850 2650
Wire Wire Line
	6850 2650 7200 2650
Wire Wire Line
	3000 4950 3000 5600
Wire Wire Line
	7100 4150 7100 4800
Wire Wire Line
	8400 4050 7400 4050
Wire Wire Line
	7400 4050 7400 4600
Wire Wire Line
	5750 5000 5750 5600
Connection ~ 5750 5600
Wire Wire Line
	8400 4400 8350 4400
Wire Wire Line
	8350 4400 8350 2200
Wire Wire Line
	8350 2200 7600 2200
Wire Wire Line
	7600 2200 7600 2150
Wire Wire Line
	8050 5600 8050 5000
Wire Wire Line
	7400 5000 7400 5600
Connection ~ 7400 5600
Wire Wire Line
	7400 5600 8050 5600
Wire Wire Line
	8200 4150 8200 5600
Wire Wire Line
	8200 5600 8050 5600
Connection ~ 8200 4150
Connection ~ 8050 5600
Wire Wire Line
	4950 1350 4950 2100
Wire Wire Line
	8400 2100 4950 2100
Connection ~ 4950 2100
Wire Wire Line
	4950 2100 4950 4550
Wire Wire Line
	4950 4550 4950 4900
Connection ~ 4950 4550
Wire Wire Line
	4950 5100 4950 5600
Wire Wire Line
	4550 5600 4950 5600
Connection ~ 4950 5600
Wire Wire Line
	4950 5600 5200 5600
Wire Wire Line
	5200 4650 5200 5150
Connection ~ 5200 4650
Wire Wire Line
	5200 5350 5200 5600
Connection ~ 5200 5600
Wire Wire Line
	5200 5600 5750 5600
Wire Wire Line
	5200 2000 8400 2000
Wire Wire Line
	8400 3800 8200 3800
Connection ~ 8200 3800
Wire Wire Line
	8200 3800 8200 4150
Connection ~ 7600 2150
Wire Wire Line
	3600 2550 7200 2550
Wire Wire Line
	8200 1700 8200 3550
Connection ~ 6650 3550
Connection ~ 8200 3550
Wire Wire Line
	8200 3550 8200 3800
Wire Wire Line
	7600 2950 7600 3550
Wire Wire Line
	6650 3550 7600 3550
Connection ~ 7600 3550
Wire Wire Line
	7600 3550 8200 3550
Wire Wire Line
	3600 2850 6650 2850
Wire Wire Line
	6550 2950 6650 2950
Connection ~ 6650 2950
Wire Wire Line
	6650 2950 6650 3250
Wire Wire Line
	6250 2950 6050 2950
Connection ~ 6050 2950
Wire Wire Line
	6050 2950 6050 3250
Text Label 6400 4150 0    50   ~ 0
WinchIn
Text Label 6200 4250 0    50   ~ 0
WinchOut
Text Label 5400 4350 0    50   ~ 0
WinchEnable
Text Label 4500 4450 0    50   ~ 0
Speaker
Text Label 4450 4550 0    50   ~ 0
Button1
Text Label 4700 4650 0    50   ~ 0
Button2
Text Label 4050 2450 0    50   ~ 0
Select
Text Label 4050 2550 0    50   ~ 0
MOSI
Text Label 4050 2750 0    50   ~ 0
SCK
Connection ~ 7000 1850
Wire Wire Line
	7000 1850 7600 1850
$Comp
L Regulator_Linear:L7812 U4
U 1 1 612981F2
P 7650 1000
F 0 "U4" H 7650 1242 50  0000 C CNN
F 1 "L7812" H 7650 1151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7675 850 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 7650 950 50  0001 C CNN
	1    7650 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1300 7650 1700
Connection ~ 7650 1700
Wire Wire Line
	7650 1700 7300 1700
Wire Wire Line
	5200 1000 5500 1000
Wire Wire Line
	6400 1300 6400 1700
Wire Wire Line
	7000 1000 7000 1850
Wire Wire Line
	6050 1250 6050 1000
Connection ~ 6050 1000
Wire Wire Line
	6050 1000 6100 1000
Wire Wire Line
	6750 1250 6750 1000
Connection ~ 6750 1000
Wire Wire Line
	6750 1000 7000 1000
Wire Wire Line
	6750 1450 6750 1700
Connection ~ 6750 1700
Wire Wire Line
	6750 1700 6400 1700
Wire Wire Line
	6400 1700 6050 1700
Wire Wire Line
	6050 1700 6050 1450
Connection ~ 6400 1700
$Comp
L Device:C_Small C6
U 1 1 612CD542
P 7950 1350
F 0 "C6" H 8042 1396 50  0000 L CNN
F 1 "C_Small" H 8042 1305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 7950 1350 50  0001 C CNN
F 3 "~" H 7950 1350 50  0001 C CNN
	1    7950 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 612CD5C6
P 7300 1350
F 0 "C5" H 7392 1396 50  0000 L CNN
F 1 "C_Small" H 7392 1305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 7300 1350 50  0001 C CNN
F 3 "~" H 7300 1350 50  0001 C CNN
	1    7300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1000 7950 1250
Wire Wire Line
	7950 1450 7950 1700
Connection ~ 7950 1700
Wire Wire Line
	7950 1700 7650 1700
Wire Wire Line
	7350 1000 7300 1000
Wire Wire Line
	7300 1000 7300 1250
Wire Wire Line
	7300 1450 7300 1700
Connection ~ 7300 1700
Wire Wire Line
	7300 1700 6750 1700
Wire Wire Line
	6050 700  6050 1000
Wire Wire Line
	7950 700  7950 1000
Wire Wire Line
	6050 700  7950 700 
Connection ~ 7950 1000
Wire Wire Line
	8400 1600 8400 1000
Wire Wire Line
	8400 600  7300 600 
Wire Wire Line
	7300 600  7300 1000
Connection ~ 7300 1000
$Comp
L power:+15V #PWR03
U 1 1 612F1A74
P 8400 1000
F 0 "#PWR03" H 8400 850 50  0001 C CNN
F 1 "+15V" V 8415 1128 50  0000 L CNN
F 2 "" H 8400 1000 50  0001 C CNN
F 3 "" H 8400 1000 50  0001 C CNN
	1    8400 1000
	0    1    1    0   
$EndComp
Connection ~ 8400 1000
Wire Wire Line
	8400 1000 8400 600 
Text Label 5550 950  0    50   ~ 0
12V
Text Label 5700 1850 0    50   ~ 0
5V
$Comp
L Device:R_Small R12
U 1 1 6110390D
P 4500 3150
F 0 "R12" V 4304 3150 50  0000 C CNN
F 1 "220R" V 4395 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4500 3150 50  0001 C CNN
F 3 "~" H 4500 3150 50  0001 C CNN
	1    4500 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 61103A1C
P 4350 3250
F 0 "R11" V 4154 3250 50  0000 C CNN
F 1 "220R" V 4245 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4350 3250 50  0001 C CNN
F 3 "~" H 4350 3250 50  0001 C CNN
	1    4350 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 61103AEB
P 4150 3350
F 0 "R10" V 3954 3350 50  0000 C CNN
F 1 "220R" V 4045 3350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4150 3350 50  0001 C CNN
F 3 "~" H 4150 3350 50  0001 C CNN
	1    4150 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 61103BC2
P 3950 3450
F 0 "R9" V 3754 3450 50  0000 C CNN
F 1 "220R" V 3845 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 3950 3450 50  0001 C CNN
F 3 "~" H 3950 3450 50  0001 C CNN
	1    3950 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 3450 3600 3450
Wire Wire Line
	3600 3350 4050 3350
Wire Wire Line
	3600 3250 4250 3250
Wire Wire Line
	3600 3150 4400 3150
$Comp
L Device:LED_Small D1
U 1 1 61120F9D
P 4100 3600
F 0 "D1" V 4146 3530 50  0000 R CNN
F 1 "LED_Small" V 4055 3530 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 4100 3600 50  0001 C CNN
F 3 "~" V 4100 3600 50  0001 C CNN
	1    4100 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 61124EF1
P 4300 3500
F 0 "D2" V 4346 3430 50  0000 R CNN
F 1 "Operating" V 4255 3430 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 4300 3500 50  0001 C CNN
F 3 "~" V 4300 3500 50  0001 C CNN
	1    4300 3500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 61125026
P 4500 3400
F 0 "D3" V 4546 3330 50  0000 R CNN
F 1 "Wind_out" V 4455 3330 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 4500 3400 50  0001 C CNN
F 3 "~" V 4500 3400 50  0001 C CNN
	1    4500 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 61125161
P 4650 3300
F 0 "D4" V 4696 3230 50  0000 R CNN
F 1 "Wind_in" V 4605 3230 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 4650 3300 50  0001 C CNN
F 3 "~" V 4650 3300 50  0001 C CNN
	1    4650 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 3450 4100 3450
Wire Wire Line
	4100 3450 4100 3500
Wire Wire Line
	4250 3350 4300 3350
Wire Wire Line
	4300 3350 4300 3400
Wire Wire Line
	4450 3250 4500 3250
Wire Wire Line
	4500 3250 4500 3300
Wire Wire Line
	4600 3150 4650 3150
Wire Wire Line
	4650 3150 4650 3200
Wire Wire Line
	4100 3700 4100 3750
Wire Wire Line
	4100 3750 4300 3750
Wire Wire Line
	4650 3750 4650 3400
Wire Wire Line
	4500 3500 4500 3750
Connection ~ 4500 3750
Wire Wire Line
	4500 3750 4650 3750
Wire Wire Line
	4300 3600 4300 3750
Connection ~ 4300 3750
Wire Wire Line
	4300 3750 4400 3750
$Comp
L power:GND #PWR01
U 1 1 61145154
P 4400 3800
F 0 "#PWR01" H 4400 3550 50  0001 C CNN
F 1 "GND" H 4405 3627 50  0000 C CNN
F 2 "" H 4400 3800 50  0001 C CNN
F 3 "" H 4400 3800 50  0001 C CNN
	1    4400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3800 4400 3750
Connection ~ 4400 3750
Wire Wire Line
	4400 3750 4500 3750
$Comp
L Transistor_FET:FDC6330L Q1
U 1 1 6116D0BC
P 6650 4950
F 0 "Q1" H 6650 5492 50  0000 C CNN
F 1 "FDC6330L" H 6650 5401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6_HandSoldering" H 6600 4375 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/FDC6330L-D.PDF" H 6550 4850 50  0001 C CNN
	1    6650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1000 5200 1000
Wire Wire Line
	4950 1000 4950 1150
Wire Wire Line
	4000 4450 5450 4450
Wire Wire Line
	5450 4800 5450 4450
Wire Wire Line
	5750 4500 8400 4500
Wire Wire Line
	5750 4500 5750 4600
Wire Wire Line
	7000 3700 8400 3700
Wire Wire Line
	7000 3700 7000 4650
Wire Wire Line
	7000 4650 6950 4650
Wire Wire Line
	5500 1000 5500 3700
Connection ~ 5500 1000
Wire Wire Line
	5500 1000 6050 1000
$Comp
L Device:R_Small R13
U 1 1 61222B3F
P 5750 3700
F 0 "R13" V 5554 3700 50  0000 C CNN
F 1 "R_Small" V 5645 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 5750 3700 50  0001 C CNN
F 3 "~" H 5750 3700 50  0001 C CNN
	1    5750 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61222C84
P 6450 3700
F 0 "C7" V 6221 3700 50  0000 C CNN
F 1 "C_Small" V 6312 3700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 6450 3700 50  0001 C CNN
F 3 "~" H 6450 3700 50  0001 C CNN
	1    6450 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 3700 7000 3700
Connection ~ 7000 3700
Wire Wire Line
	5850 3700 6150 3700
Wire Wire Line
	5650 3700 5500 3700
Connection ~ 5500 3700
Wire Wire Line
	5500 3700 5500 4050
Wire Wire Line
	6350 4850 6150 4850
Wire Wire Line
	6150 4850 6150 3700
Connection ~ 6150 3700
Wire Wire Line
	6150 3700 6350 3700
$Comp
L Device:R_Small R14
U 1 1 6123F8EC
P 6650 5400
F 0 "R14" H 6709 5446 50  0000 L CNN
F 1 "R_Small" H 6709 5355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 6650 5400 50  0001 C CNN
F 3 "~" H 6650 5400 50  0001 C CNN
	1    6650 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4350 6000 5050
Wire Wire Line
	6000 5050 6350 5050
Wire Wire Line
	6250 4050 6250 4650
Wire Wire Line
	6250 4650 6350 4650
Wire Wire Line
	5500 4050 6250 4050
Wire Wire Line
	5750 5600 6650 5600
Wire Wire Line
	6650 5250 6650 5300
Wire Wire Line
	6650 5500 6650 5600
Connection ~ 6650 5600
Wire Wire Line
	6650 5600 7400 5600
$EndSCHEMATC
