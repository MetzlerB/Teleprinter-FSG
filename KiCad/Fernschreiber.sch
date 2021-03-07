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
L power:GND #PWR010
U 1 1 5EB4DFE1
P 10100 4650
F 0 "#PWR010" H 10100 4400 50  0001 C CNN
F 1 "GND" H 10105 4477 50  0000 C CNN
F 2 "" H 10100 4650 50  0001 C CNN
F 3 "" H 10100 4650 50  0001 C CNN
	1    10100 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 4250 10100 4650
$Comp
L Device:R R8
U 1 1 5EB55FC7
P 9500 3800
F 0 "R8" H 9570 3846 50  0000 L CNN
F 1 "10k" H 9570 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 9430 3800 50  0001 C CNN
F 3 "~" H 9500 3800 50  0001 C CNN
F 4 "LW" H 9500 3800 50  0000 C CNN "Kommentar"
	1    9500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5EBAA28E
P 10350 3800
F 0 "R9" H 10420 3846 50  0000 L CNN
F 1 "1k" H 10420 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 10280 3800 50  0001 C CNN
F 3 "~" H 10350 3800 50  0001 C CNN
	1    10350 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 3950 10350 4150
$Comp
L Relay:FINDER-40.41 K1
U 1 1 5EBBC4C4
P 1900 1600
F 0 "K1" H 2330 1646 50  0001 L CNN
F 1 "FINDER-40.41" H 2330 1555 50  0001 L CNN
F 2 "Fernschreiber:BPM1-SS-105L" H 3040 1560 50  0001 C CNN
F 3 "https://www.finder-relais.net/de/finder-relais-serie-40.pdf" H 1900 1600 50  0001 C CNN
	1    1900 1600
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5711 D1
U 1 1 5EBC4C53
P 1400 1600
F 0 "D1" H 1400 1816 50  0001 C CNN
F 1 "1N5711" H 1400 1725 50  0001 C CNN
F 2 "Diode_THT:D_DO-201AE_P15.24mm_Horizontal" H 1400 1425 50  0001 C CNN
F 3 "https://www.microsemi.com/document-portal/doc_download/8865-lds-0040-datasheet" H 1400 1600 50  0001 C CNN
	1    1400 1600
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5711 D3
U 1 1 5EBCC7F4
P 3000 4150
F 0 "D3" H 3000 4366 50  0001 C CNN
F 1 "1N5711" H 3000 4275 50  0001 C CNN
F 2 "Diode_THT:D_DO-201AE_P15.24mm_Horizontal" H 3000 3975 50  0001 C CNN
F 3 "https://www.microsemi.com/document-portal/doc_download/8865-lds-0040-datasheet" H 3000 4150 50  0001 C CNN
	1    3000 4150
	0    1    1    0   
$EndComp
$Comp
L Isolator:4N28 U1
U 1 1 5EBD80E8
P 1850 4150
F 0 "U1" H 1850 4475 50  0001 C CNN
F 1 "4N28" H 1850 4384 50  0000 C CNN
F 2 "Fernschreiber:IC-Fassung-6pol" H 1650 3950 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83725/4n25.pdf" H 1850 4150 50  0001 L CNN
	1    1850 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EBE1515
P 2400 3750
F 0 "R2" H 2470 3796 50  0000 L CNN
F 1 "1k" H 2470 3705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 2330 3750 50  0001 C CNN
F 3 "~" H 2400 3750 50  0001 C CNN
	1    2400 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5EBE5233
P 2700 4450
F 0 "#PWR03" H 2700 4200 50  0001 C CNN
F 1 "GND" H 2705 4277 50  0000 C CNN
F 2 "" H 2700 4450 50  0001 C CNN
F 3 "" H 2700 4450 50  0001 C CNN
	1    2700 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EBE6946
P 1550 3750
F 0 "R1" H 1620 3796 50  0000 L CNN
F 1 "220" H 1620 3705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 1480 3750 50  0001 C CNN
F 3 "~" H 1550 3750 50  0001 C CNN
	1    1550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5EBE8DAE
P 1550 4450
F 0 "#PWR01" H 1550 4200 50  0001 C CNN
F 1 "GND" H 1555 4277 50  0000 C CNN
F 2 "" H 1550 4450 50  0001 C CNN
F 3 "" H 1550 4450 50  0001 C CNN
	1    1550 4450
	1    0    0    -1  
$EndComp
Connection ~ 2700 4350
Wire Wire Line
	1550 3900 1550 4050
Wire Wire Line
	2400 3900 2400 4150
Wire Wire Line
	2150 4150 2400 4150
Wire Wire Line
	2400 4350 2700 4350
Wire Wire Line
	2700 4350 2700 4450
Wire Wire Line
	1550 4250 1550 4450
$Comp
L Relay:FINDER-40.41 K2
U 1 1 5EC1A60B
P 2750 1600
F 0 "K2" H 3180 1646 50  0001 L CNN
F 1 "FINDER-40.41" H 3180 1555 50  0001 L CNN
F 2 "Fernschreiber:BPM1-SS-105L" H 3890 1560 50  0001 C CNN
F 3 "https://www.finder-relais.net/de/finder-relais-serie-40.pdf" H 2750 1600 50  0001 C CNN
	1    2750 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 1200 2950 1300
Wire Wire Line
	2950 2000 2950 1900
Wire Wire Line
	2950 1200 2100 1200
Wire Wire Line
	2100 1200 2100 1300
Wire Wire Line
	2100 1900 2100 2000
Wire Wire Line
	2100 2000 2950 2000
Connection ~ 2100 1200
Connection ~ 2100 2000
Wire Wire Line
	1800 1900 1800 2100
Wire Wire Line
	2450 2100 2450 1900
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5ECAC5CC
P 2050 750
F 0 "J1" V 1988 562 50  0000 R CNN
F 1 "Teleprinter" V 1897 562 50  0000 R CNN
F 2 "Fernschreiber:DECA MB310-500M02 Schraubklemmblock" H 2050 750 50  0001 C CNN
F 3 "~" H 2050 750 50  0001 C CNN
	1    2050 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 1300 1700 950 
Wire Wire Line
	1700 950  2050 950 
Wire Wire Line
	2150 950  2550 950 
Wire Wire Line
	2550 950  2550 1300
Wire Wire Line
	1600 1900 1600 2200
Wire Wire Line
	1800 2100 2450 2100
Connection ~ 2450 2100
$Comp
L Connector:Conn_01x05_Female J3
U 1 1 5EE0130E
P 4950 1150
F 0 "J3" H 4978 1176 50  0000 L CNN
F 1 "18,19,23,3V3,GND" H 4978 1085 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4950 1150 50  0001 C CNN
F 3 "~" H 4950 1150 50  0001 C CNN
	1    4950 1150
	1    0    0    -1  
$EndComp
Text Label 1450 3450 2    50   ~ 0
Voltage_reversal_Relai
Wire Wire Line
	4750 1150 4650 1150
Wire Wire Line
	4750 1250 4650 1250
Text Label 4650 950  2    50   ~ 0
3V3
Wire Wire Line
	4650 1050 4750 1050
Text Label 4650 1050 2    50   ~ 0
GND
Wire Wire Line
	4650 950  4750 950 
Wire Wire Line
	2450 2100 3000 2100
$Comp
L Isolator:4N28 U3
U 1 1 5EB4B826
P 9800 4150
F 0 "U3" H 9800 4475 50  0001 C CNN
F 1 "4N28" H 9800 4384 50  0000 C CNN
F 2 "Fernschreiber:IC-Fassung-6pol" H 9600 3950 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83725/4n25.pdf" H 9800 4150 50  0001 L CNN
	1    9800 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3950 9500 4000
$Comp
L Device:R R3
U 1 1 5EB50A22
P 8850 3800
F 0 "R3" H 8920 3846 50  0000 L CNN
F 1 "3x1k" H 8920 3755 50  0000 L CNN
F 2 "Fernschreiber:3X1k_Parallel" V 8780 3800 50  0001 C CNN
F 3 "~" H 8850 3800 50  0001 C CNN
F 4 "LW" H 8850 3800 50  0000 C CNN "Kommentar"
	1    8850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5300 8750 5300
Wire Wire Line
	8900 5300 8900 5350
$Comp
L Device:R R7
U 1 1 5ED9DDF5
P 8900 5500
F 0 "R7" H 8970 5546 50  0000 L CNN
F 1 "1k" H 8970 5455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 8830 5500 50  0001 C CNN
F 3 "~" H 8900 5500 50  0001 C CNN
	1    8900 5500
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5711 D2
U 1 1 5ED9647B
P 1600 2350
F 0 "D2" H 1600 2566 50  0001 C CNN
F 1 "1N5711" H 1600 2475 50  0001 C CNN
F 2 "Diode_THT:D_DO-201AE_P15.24mm_Horizontal" H 1600 2175 50  0001 C CNN
F 3 "https://www.microsemi.com/document-portal/doc_download/8865-lds-0040-datasheet" H 1600 2350 50  0001 C CNN
	1    1600 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F32AB94
P 8850 4100
F 0 "R4" H 8920 4146 50  0000 L CNN
F 1 "3x1k" H 8920 4055 50  0000 L CNN
F 2 "Fernschreiber:3X1k_Parallel" V 8780 4100 50  0001 C CNN
F 3 "~" H 8850 4100 50  0001 C CNN
F 4 "LW" H 8850 4100 50  0000 C CNN "Kommentar"
	1    8850 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F32D89D
P 8850 4400
F 0 "R5" H 8920 4446 50  0000 L CNN
F 1 "3x1k" H 8920 4355 50  0000 L CNN
F 2 "Fernschreiber:3X1k_Parallel" V 8780 4400 50  0001 C CNN
F 3 "~" H 8850 4400 50  0001 C CNN
F 4 "LW" H 8850 4400 50  0000 C CNN "Kommentar"
	1    8850 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5F330702
P 8850 4700
F 0 "R6" H 8920 4746 50  0000 L CNN
F 1 "3x1k" H 8920 4655 50  0000 L CNN
F 2 "Fernschreiber:3X1k_Parallel" V 8780 4700 50  0001 C CNN
F 3 "~" H 8850 4700 50  0001 C CNN
F 4 "LW" H 8850 4700 50  0000 C CNN "Kommentar"
	1    8850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1900 2650 2200
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5F388884
P 9300 4000
F 0 "J11" H 9408 4181 50  0000 C CNN
F 1 "Test_Conn_Lesen_b_opto" H 9408 4090 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 9300 4000 50  0001 C CNN
F 3 "~" H 9300 4000 50  0001 C CNN
	1    9300 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5F394C7A
P 6350 1800
F 0 "J9" H 6458 1981 50  0000 C CNN
F 1 "Test_Conn_read" H 6458 1890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6350 1800 50  0001 C CNN
F 3 "~" H 6350 1800 50  0001 C CNN
	1    6350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2300 4750 2300
Wire Wire Line
	4650 2100 4750 2100
Text Label 4650 2200 2    50   ~ 0
GND
Wire Wire Line
	4650 2200 4750 2200
Text Label 4650 2100 2    50   ~ 0
3V3
Wire Wire Line
	4750 2400 4650 2400
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5EDFF05C
P 4950 2200
F 0 "J5" H 4978 2176 50  0000 L CNN
F 1 "TX,RX,3V3,GND" H 4978 2085 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4950 2200 50  0001 C CNN
F 3 "~" H 4950 2200 50  0001 C CNN
	1    4950 2200
	1    0    0    -1  
$EndComp
Text Label 4650 2400 2    50   ~ 0
TX0
Text Label 4650 2300 2    50   ~ 0
RX0
$Comp
L Connector:Conn_01x05_Female J4
U 1 1 5EDFA426
P 4950 1700
F 0 "J4" H 4978 1726 50  0000 L CNN
F 1 "12,13,14,3V3,GND" H 4978 1635 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4950 1700 50  0001 C CNN
F 3 "~" H 4950 1700 50  0001 C CNN
	1    4950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1700 4650 1700
Wire Wire Line
	4750 1800 4650 1800
Wire Wire Line
	4750 1900 4650 1900
Text Label 4650 1500 2    50   ~ 0
3V3
Wire Wire Line
	4650 1600 4750 1600
Text Label 4650 1600 2    50   ~ 0
GND
Wire Wire Line
	4650 1500 4750 1500
Text Label 4650 1700 2    50   ~ 0
D13
Text Label 4650 1900 2    50   ~ 0
D14
Text Label 4650 1800 2    50   ~ 0
D12
Text Label 4650 1150 2    50   ~ 0
D18
Text Label 4650 1250 2    50   ~ 0
D19
Text Label 4650 1350 2    50   ~ 0
D23
Wire Wire Line
	4650 1350 4750 1350
Text Label 7500 3300 2    50   ~ 0
GND
$Comp
L Connector:Conn_01x01_Male J10
U 1 1 5F391AEC
P 6350 2100
F 0 "J10" H 6458 2281 50  0000 C CNN
F 1 "Test_Conn_write" H 6458 2190 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6350 2100 50  0001 C CNN
F 3 "~" H 6350 2100 50  0001 C CNN
	1    6350 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5ECEBAF7
P 4500 3250
F 0 "J2" V 4346 3298 50  0000 L CNN
F 1 "Step-Up" V 4437 3298 50  0000 L CNN
F 2 "Fernschreiber:DECA MB310-500M02 Schraubklemmblock" H 4500 3250 50  0001 C CNN
F 3 "~" H 4500 3250 50  0001 C CNN
	1    4500 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FC87152
P 4500 3500
F 0 "#PWR04" H 4500 3250 50  0001 C CNN
F 1 "GND" H 4505 3327 50  0000 C CNN
F 2 "" H 4500 3500 50  0001 C CNN
F 3 "" H 4500 3500 50  0001 C CNN
	1    4500 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3450 4500 3500
Connection ~ 9500 4000
Wire Wire Line
	9500 4000 9500 4050
Wire Wire Line
	9500 4250 9500 4850
Wire Wire Line
	1600 2200 2650 2200
Wire Wire Line
	8850 4850 9200 4850
Text Label 8750 5300 2    50   ~ 0
write
$Comp
L power:GND #PWR02
U 1 1 6045EC7B
P 1600 2500
F 0 "#PWR02" H 1600 2250 50  0001 C CNN
F 1 "GND" H 1605 2327 50  0000 C CNN
F 2 "" H 1600 2500 50  0001 C CNN
F 3 "" H 1600 2500 50  0001 C CNN
	1    1600 2500
	1    0    0    -1  
$EndComp
Text Label 4600 3550 0    50   ~ 0
Step-up_input
Wire Wire Line
	4600 3450 4600 3550
Text Label 3000 2100 0    50   ~ 0
Step-up_input
Connection ~ 1600 2200
Text Label 10500 4150 0    50   ~ 0
read
Wire Wire Line
	10350 4150 10500 4150
Connection ~ 10350 4150
Wire Wire Line
	10100 4150 10350 4150
Wire Wire Line
	1400 1450 1400 1200
Wire Wire Line
	1400 1200 2100 1200
Wire Wire Line
	1400 1750 1400 2000
Wire Wire Line
	1400 2000 2100 2000
Text Label 10200 1900 0    50   ~ 0
write
Text Label 10200 2000 0    50   ~ 0
read
Wire Wire Line
	10150 1900 10200 1900
Wire Wire Line
	10150 2500 10200 2500
Wire Wire Line
	10150 2400 10200 2400
Text Label 10200 2400 0    50   ~ 0
GND
Text Label 10200 2500 0    50   ~ 0
3V3
Wire Wire Line
	10150 2000 10200 2000
Wire Wire Line
	8900 2400 8950 2400
Wire Wire Line
	10200 1700 10150 1700
Wire Wire Line
	10200 1600 10150 1600
Wire Wire Line
	10200 1100 10150 1100
Text Label 10200 1100 0    50   ~ 0
D23
Text Label 10200 1600 0    50   ~ 0
D19
Text Label 10200 1700 0    50   ~ 0
D18
Wire Wire Line
	8900 2300 8950 2300
Wire Wire Line
	8900 2100 8950 2100
Text Label 8900 2300 2    50   ~ 0
D13
Text Label 8900 2100 2    50   ~ 0
D14
Wire Wire Line
	8900 2200 8950 2200
Text Label 8900 2200 2    50   ~ 0
D12
Wire Wire Line
	10150 1400 10200 1400
Wire Wire Line
	10150 1300 10200 1300
Text Label 10200 1400 0    50   ~ 0
RX0
Text Label 10200 1300 0    50   ~ 0
TX0
Text Label 10200 2100 0    50   ~ 0
Voltage_reversal_Relai
$Comp
L Fernschreiber:ESP32_Joy-it U2
U 1 1 5F99E147
P 9550 1700
F 0 "U2" H 9550 2615 50  0000 C CNN
F 1 "ESP32_Joy-it" H 9550 2524 50  0000 C CNN
F 2 "Fernschreiber:ESP32_Joy-it" H 9550 2500 50  0001 C CNN
F 3 "" H 9550 2500 50  0001 C CNN
	1    9550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10150 2100
Text Label 8900 2400 2    50   ~ 0
GND
$Comp
L power:GND #PWR09
U 1 1 5EB46FB7
P 9200 5750
F 0 "#PWR09" H 9200 5500 50  0001 C CNN
F 1 "GND" H 9205 5577 50  0000 C CNN
F 2 "" H 9200 5750 50  0001 C CNN
F 3 "" H 9200 5750 50  0001 C CNN
	1    9200 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 6051B127
P 6050 3250
F 0 "J6" V 5988 3062 50  0000 R CNN
F 1 "5V" V 5897 3062 50  0000 R CNN
F 2 "Fernschreiber:DECA MB310-500M02 Schraubklemmblock" H 6050 3250 50  0001 C CNN
F 3 "~" H 6050 3250 50  0001 C CNN
	1    6050 3250
	0    -1   -1   0   
$EndComp
Text Label 6150 3600 0    50   ~ 0
5V
Wire Wire Line
	6150 3450 6150 3600
Text Label 1300 1200 2    50   ~ 0
5V
Connection ~ 1400 1200
$Comp
L power:GND #PWR05
U 1 1 60537F40
P 6050 3500
F 0 "#PWR05" H 6050 3250 50  0001 C CNN
F 1 "GND" H 6055 3327 50  0000 C CNN
F 2 "" H 6050 3500 50  0001 C CNN
F 3 "" H 6050 3500 50  0001 C CNN
	1    6050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3450 6050 3500
Wire Wire Line
	7500 3300 7500 3500
$Comp
L power:GND #PWR07
U 1 1 5EDCDA55
P 7500 3500
F 0 "#PWR07" H 7500 3250 50  0001 C CNN
F 1 "GND" H 7505 3327 50  0000 C CNN
F 2 "" H 7500 3500 50  0001 C CNN
F 3 "" H 7500 3500 50  0001 C CNN
	1    7500 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1200 1400 1200
Text Label 2300 3450 2    50   ~ 0
5V
Text Label 1300 2000 2    50   ~ 0
Relai_ground
Text Label 3150 3950 0    50   ~ 0
Relai_ground
Wire Wire Line
	1300 2000 1400 2000
Connection ~ 1400 2000
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5F38E59F
P 6350 1500
F 0 "J8" H 6458 1681 50  0000 C CNN
F 1 "Test_Conn_Voltage_reversal" H 6458 1590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6350 1500 50  0001 C CNN
F 3 "~" H 6350 1500 50  0001 C CNN
	1    6350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4250 2400 4350
Connection ~ 2400 4150
$Comp
L Device:Q_NMOS_SGD Q1
U 1 1 5EBCB27B
P 2600 4150
F 0 "Q1" H 2804 4196 50  0001 L CNN
F 1 "Q_NMOS_SGD" H 2804 4105 50  0001 L CNN
F 2 "Fernschreiber:FQP30N06L" H 2800 4250 50  0001 C CNN
F 3 "~" H 2600 4150 50  0001 C CNN
	1    2600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4250 2400 4250
Text Label 3000 2200 0    50   ~ 0
Teleprinter_output
Text Label 9250 3450 0    50   ~ 0
Teleprinter_output
Wire Wire Line
	8850 3650 9250 3650
Wire Wire Line
	2650 2200 3000 2200
Connection ~ 2650 2200
Wire Wire Line
	9250 3650 9250 3450
Connection ~ 9250 3650
Wire Wire Line
	9250 3650 9500 3650
Text Label 10500 3500 0    50   ~ 0
3V3
Wire Wire Line
	10350 3500 10350 3650
Wire Wire Line
	10350 3500 10500 3500
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5F3D7E24
P 6350 1050
F 0 "J7" H 6458 1231 50  0000 C CNN
F 1 "Test_Conn_3V3" H 6458 1140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6350 1050 50  0001 C CNN
F 3 "~" H 6350 1050 50  0001 C CNN
	1    6350 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3450 1550 3600
Text Label 7050 1500 0    50   ~ 0
Voltage_reversal_Relai
Wire Wire Line
	6550 1500 7050 1500
Wire Wire Line
	2300 3450 2400 3450
Wire Wire Line
	2400 3450 2400 3600
Wire Wire Line
	1550 3450 1450 3450
Wire Wire Line
	3000 4300 3000 4350
Wire Wire Line
	2700 4350 3000 4350
Wire Wire Line
	2700 3950 3000 3950
Wire Wire Line
	3000 4000 3000 3950
Connection ~ 3000 3950
Wire Wire Line
	3000 3950 3150 3950
Wire Wire Line
	9200 5100 9200 4850
Connection ~ 9200 4850
Wire Wire Line
	9200 4850 9500 4850
Text Label 7050 1800 0    50   ~ 0
read
Wire Wire Line
	6550 1800 7050 1800
Text Label 6850 1050 0    50   ~ 0
3V3
Wire Wire Line
	6550 1050 6850 1050
$Comp
L power:GND #PWR06
U 1 1 606EF49A
P 6750 1150
F 0 "#PWR06" H 6750 900 50  0001 C CNN
F 1 "GND" H 6755 977 50  0000 C CNN
F 2 "" H 6750 1150 50  0001 C CNN
F 3 "" H 6750 1150 50  0001 C CNN
	1    6750 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6550 1150 6750 1150
Text Label 7050 2100 0    50   ~ 0
write
Wire Wire Line
	6550 2100 7050 2100
Connection ~ 8900 5300
$Comp
L Device:Q_NMOS_SGD Q2
U 1 1 5EB597F0
P 9100 5300
F 0 "Q2" H 9304 5346 50  0001 L CNN
F 1 "Q_NMOS_SGD" H 9304 5255 50  0001 L CNN
F 2 "Fernschreiber:FQP30N06L" H 9300 5400 50  0001 C CNN
F 3 "~" H 9100 5300 50  0001 C CNN
	1    9100 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5500 9200 5750
$Comp
L power:GND #PWR08
U 1 1 6072322F
P 8900 5750
F 0 "#PWR08" H 8900 5500 50  0001 C CNN
F 1 "GND" H 8905 5577 50  0000 C CNN
F 2 "" H 8900 5750 50  0001 C CNN
F 3 "" H 8900 5750 50  0001 C CNN
	1    8900 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5650 8900 5750
Wire Notes Line
	11200 500  11200 6500
Wire Notes Line
	8000 6500 11200 6500
Wire Notes Line
	500  3000 11200 3000
Wire Notes Line
	4000 500  4000 5000
Wire Notes Line
	500  500  500  5000
Wire Notes Line
	500  500  11200 500 
Wire Notes Line
	8000 500  8000 6500
Wire Notes Line
	5900 500  5900 3000
Wire Notes Line
	4000 5000 500  5000
Wire Notes Line
	4000 4000 8000 4000
Text Label 8900 2500 2    50   ~ 0
5V
Wire Wire Line
	8900 2500 8950 2500
$EndSCHEMATC
