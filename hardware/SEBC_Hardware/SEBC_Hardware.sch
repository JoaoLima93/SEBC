EESchema Schematic File Version 4
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
L ESP8266:NodeMCU1.0(ESP-12E) U?
U 1 1 5B567D05
P 2750 2550
F 0 "U?" H 2750 3637 60  0000 C CNN
F 1 "NodeMCU1.0(ESP-12E)" H 2750 3531 60  0000 C CNN
F 2 "" H 2150 1700 60  0000 C CNN
F 3 "" H 2150 1700 60  0000 C CNN
	1    2750 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_Ground J?
U 1 1 5B568116
P 6200 1700
F 0 "J?" H 5967 1679 50  0000 R CNN
F 1 "AudioJack2_Ground" H 5967 1770 50  0000 R CNN
F 2 "" H 6200 1700 50  0001 C CNN
F 3 "~" H 6200 1700 50  0001 C CNN
	1    6200 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5B568250
P 5200 1400
F 0 "R?" V 4993 1400 50  0000 C CNN
F 1 "10 k" V 5084 1400 50  0000 C CNN
F 2 "" V 5130 1400 50  0001 C CNN
F 3 "~" H 5200 1400 50  0001 C CNN
	1    5200 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5B56831A
P 5650 1400
F 0 "R?" V 5443 1400 50  0000 C CNN
F 1 "10 k" V 5534 1400 50  0000 C CNN
F 2 "" V 5580 1400 50  0001 C CNN
F 3 "~" H 5650 1400 50  0001 C CNN
	1    5650 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1400 5400 1400
Wire Wire Line
	6000 1700 5400 1700
Wire Wire Line
	5400 1700 5400 1400
Connection ~ 5400 1400
Wire Wire Line
	5400 1400 5500 1400
$EndSCHEMATC
