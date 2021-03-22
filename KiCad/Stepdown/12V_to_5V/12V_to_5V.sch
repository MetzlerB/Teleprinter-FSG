EESchema Schematic File Version 4
EELAYER 30 0
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
L Regulator_Switching:LM2596S-5 U1
U 1 1 604DF49A
P 2600 1350
F 0 "U1" H 2600 1807 50  0000 C CNN
F 1 "LM2596S-5" H 2600 1716 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 2600 1625 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 2600 1350 50  0001 C CNN
F 4 "C77782" H 2600 1350 50  0001 C CNN "LCSC"
	1    2600 1350
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C1
U 1 1 604DF5FF
P 1650 1500
F 0 "C1" H 1828 1546 50  0000 L CNN
F 1 "680uF" H 1828 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 1650 1500 50  0001 C CNN
F 3 "~" H 1650 1500 50  0001 C CNN
F 4 "C47868" H 1650 1500 50  0001 C CNN "LCSC"
	1    1650 1500
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C2
U 1 1 604E1A82
P 4400 1500
F 0 "C2" H 4578 1546 50  0000 L CNN
F 1 "220uF" H 4578 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4400 1500 50  0001 C CNN
F 3 "~" H 4400 1500 50  0001 C CNN
F 4 "C160620" H 4400 1500 50  0001 C CNN "LCSC"
	1    4400 1500
	1    0    0    -1  
$EndComp
$Comp
L pspice:INDUCTOR L1
U 1 1 604E2A7E
P 3600 1250
F 0 "L1" H 3600 1465 50  0000 C CNN
F 1 "33uH" H 3600 1374 50  0000 C CNN
F 2 "12V_to_5V:Spule33uH" H 3600 1250 50  0001 C CNN
F 3 "~" H 3600 1250 50  0001 C CNN
F 4 "C181844" H 3600 1250 50  0001 C CNN "LCSC"
	1    3600 1250
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C3
U 1 1 604E452D
P 6000 1500
F 0 "C3" H 6178 1546 50  0000 L CNN
F 1 "180uF" H 6178 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6000 1500 50  0001 C CNN
F 3 "~" H 6000 1500 50  0001 C CNN
F 4 "C442571" H 6000 1500 50  0001 C CNN "LCSC"
	1    6000 1500
	1    0    0    -1  
$EndComp
$Comp
L pspice:INDUCTOR L2
U 1 1 604E4533
P 5650 1250
F 0 "L2" H 5650 1465 50  0000 C CNN
F 1 "3uH" H 5650 1374 50  0000 C CNN
F 2 "12V_to_5V:Spule3uH" H 5650 1250 50  0001 C CNN
F 3 "~" H 5650 1250 50  0001 C CNN
F 4 "C486575" H 5650 1250 50  0001 C CNN "LCSC"
	1    5650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1250 1650 1250
Wire Wire Line
	1650 1250 1400 1250
Connection ~ 1650 1250
Wire Wire Line
	3100 1250 3250 1250
Connection ~ 3250 1250
Wire Wire Line
	3250 1250 3350 1250
$Comp
L power:GND #PWR0101
U 1 1 604ECC61
P 1650 1850
F 0 "#PWR0101" H 1650 1600 50  0001 C CNN
F 1 "GND" H 1655 1677 50  0000 C CNN
F 2 "" H 1650 1850 50  0001 C CNN
F 3 "" H 1650 1850 50  0001 C CNN
	1    1650 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 604ED26E
P 4400 1850
F 0 "#PWR0102" H 4400 1600 50  0001 C CNN
F 1 "GND" H 4405 1677 50  0000 C CNN
F 2 "" H 4400 1850 50  0001 C CNN
F 3 "" H 4400 1850 50  0001 C CNN
	1    4400 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 604EDB52
P 2100 1850
F 0 "#PWR0103" H 2100 1600 50  0001 C CNN
F 1 "GND" H 2105 1677 50  0000 C CNN
F 2 "" H 2100 1850 50  0001 C CNN
F 3 "" H 2100 1850 50  0001 C CNN
	1    2100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1450 2100 1850
Wire Wire Line
	2600 1850 2600 1650
Wire Wire Line
	3950 1450 3950 1250
Wire Wire Line
	3850 1250 3950 1250
$Comp
L power:GND #PWR0104
U 1 1 604F04F4
P 2600 1850
F 0 "#PWR0104" H 2600 1600 50  0001 C CNN
F 1 "GND" H 2605 1677 50  0000 C CNN
F 2 "" H 2600 1850 50  0001 C CNN
F 3 "" H 2600 1850 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
Connection ~ 3950 1250
Wire Wire Line
	3950 1250 4400 1250
Wire Notes Line
	500  500  500  2500
Wire Notes Line
	5000 2500 5000 500 
Text Label 4700 1250 0    50   ~ 0
Filter
Wire Wire Line
	4400 1250 4700 1250
Connection ~ 4400 1250
Wire Wire Line
	5900 1250 6000 1250
$Comp
L power:GND #PWR0105
U 1 1 605127E8
P 6000 1850
F 0 "#PWR0105" H 6000 1600 50  0001 C CNN
F 1 "GND" H 6005 1677 50  0000 C CNN
F 2 "" H 6000 1850 50  0001 C CNN
F 3 "" H 6000 1850 50  0001 C CNN
	1    6000 1850
	1    0    0    -1  
$EndComp
Wire Notes Line
	7000 500  7000 2500
Text Label 5300 1250 2    50   ~ 0
Filter
Wire Wire Line
	5400 1250 5300 1250
Wire Wire Line
	6000 1250 6450 1250
Connection ~ 6000 1250
Wire Wire Line
	3100 1450 3950 1450
$Comp
L power:GND #PWR0106
U 1 1 6051A0EE
P 3250 1850
F 0 "#PWR0106" H 3250 1600 50  0001 C CNN
F 1 "GND" H 3255 1677 50  0000 C CNN
F 2 "" H 3250 1850 50  0001 C CNN
F 3 "" H 3250 1850 50  0001 C CNN
	1    3250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1550 3250 1250
$Comp
L Diode:1N5817 D1
U 1 1 604E02FC
P 3250 1700
F 0 "D1" V 3204 1779 50  0000 L CNN
F 1 "1N5822" V 3295 1779 50  0000 L CNN
F 2 "Diode_THT:D_DO-27_P15.24mm_Horizontal" H 3250 1525 50  0001 C CNN
F 3 "" H 3250 1700 50  0001 C CNN
F 4 "C402220" V 3250 1700 50  0001 C CNN "LCSC"
	1    3250 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 1750 1650 1850
Wire Wire Line
	6000 1850 6000 1750
Wire Wire Line
	4400 1850 4400 1750
Text Notes 5050 600  0    50   ~ 0
Post Ripple Filter
Text Notes 600  650  0    50   ~ 0
Typical Application LM2596-5.0 (Fixed Output Voltage Versions 5V)
$Comp
L power:GND #PWR0107
U 1 1 60525CE6
P 1200 1500
F 0 "#PWR0107" H 1200 1250 50  0001 C CNN
F 1 "GND" H 1205 1327 50  0000 C CNN
F 2 "" H 1200 1500 50  0001 C CNN
F 3 "" H 1200 1500 50  0001 C CNN
	1    1200 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 6052ABAC
P 900 1950
F 0 "J3" H 1008 2131 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1008 2040 50  0000 C CNN
F 2 "12V_to_5V:DECA MB310-500M02 Schraubklemmblock" H 900 1950 50  0001 C CNN
F 3 "~" H 900 1950 50  0001 C CNN
	1    900  1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 6052BFE6
P 1100 2050
F 0 "#PWR0108" H 1100 1800 50  0001 C CNN
F 1 "GND" H 1105 1877 50  0000 C CNN
F 2 "" H 1100 2050 50  0001 C CNN
F 3 "" H 1100 2050 50  0001 C CNN
	1    1100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1950 1400 1950
Wire Wire Line
	1400 1950 1400 1250
Connection ~ 1400 1250
Wire Wire Line
	1400 1250 1100 1250
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 6052D5B0
P 6750 1600
F 0 "J4" H 6858 1781 50  0000 C CNN
F 1 "Conn_01x02_Male" H 6858 1690 50  0000 C CNN
F 2 "12V_to_5V:DECA MB310-500M02 Schraubklemmblock" H 6750 1600 50  0001 C CNN
F 3 "~" H 6750 1600 50  0001 C CNN
	1    6750 1600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6052D5B6
P 6550 1500
F 0 "#PWR0109" H 6550 1250 50  0001 C CNN
F 1 "GND" H 6555 1327 50  0000 C CNN
F 2 "" H 6550 1500 50  0001 C CNN
F 3 "" H 6550 1500 50  0001 C CNN
	1    6550 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 1250 6450 1600
Wire Wire Line
	6450 1600 6550 1600
Connection ~ 6450 1250
Wire Wire Line
	6450 1250 6550 1250
Text Label 6550 1250 0    50   ~ 0
Vout
Wire Wire Line
	1100 1350 1200 1350
Text Label 1200 1350 0    50   ~ 0
Vout
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 6048C284
P 900 1500
F 0 "J2" H 1008 1681 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1008 1590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 900 1500 50  0001 C CNN
F 3 "~" H 900 1500 50  0001 C CNN
	1    900  1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1500 1200 1500
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 6048419F
P 900 1250
F 0 "J1" H 1008 1431 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1008 1340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 900 1250 50  0001 C CNN
F 3 "~" H 900 1250 50  0001 C CNN
	1    900  1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6049AADF
P 7450 2200
F 0 "H2" V 7687 2203 50  0000 C CNN
F 1 "MountingHole_Pad" V 7596 2203 50  0000 C CNN
F 2 "12V_to_5V:M3" H 7450 2200 50  0001 C CNN
F 3 "~" H 7450 2200 50  0001 C CNN
	1    7450 2200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6049C65E
P 7550 2200
F 0 "#PWR0110" H 7550 1950 50  0001 C CNN
F 1 "GND" H 7555 2027 50  0000 C CNN
F 2 "" H 7550 2200 50  0001 C CNN
F 3 "" H 7550 2200 50  0001 C CNN
	1    7550 2200
	0    -1   -1   0   
$EndComp
Wire Notes Line
	8000 500  8000 2500
Wire Notes Line
	500  2500 8000 2500
Wire Notes Line
	500  500  8000 500 
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 604A2821
P 7450 1300
F 0 "H1" V 7687 1303 50  0000 C CNN
F 1 "MountingHole_Pad" V 7596 1303 50  0000 C CNN
F 2 "12V_to_5V:M3" H 7450 1300 50  0001 C CNN
F 3 "~" H 7450 1300 50  0001 C CNN
	1    7450 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 604A2827
P 7550 1300
F 0 "#PWR0111" H 7550 1050 50  0001 C CNN
F 1 "GND" H 7555 1127 50  0000 C CNN
F 2 "" H 7550 1300 50  0001 C CNN
F 3 "" H 7550 1300 50  0001 C CNN
	1    7550 1300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
