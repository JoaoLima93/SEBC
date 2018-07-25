EESchema Schematic File Version 4
LIBS:SEBC_Hardware-cache
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
P 2600 3100
F 0 "U?" H 2600 4187 60  0000 C CNN
F 1 "NodeMCU1.0(ESP-12E)" H 2600 4081 60  0000 C CNN
F 2 "" H 2000 2250 60  0000 C CNN
F 3 "" H 2000 2250 60  0000 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_Ground J?
U 1 1 5B568116
P 6650 4200
F 0 "J?" H 6417 4179 50  0000 R CNN
F 1 "AudioJack2_Ground" H 6417 4270 50  0000 R CNN
F 2 "" H 6650 4200 50  0001 C CNN
F 3 "~" H 6650 4200 50  0001 C CNN
	1    6650 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5B568250
P 5600 3750
F 0 "R?" V 5393 3750 50  0000 C CNN
F 1 "10 k" V 5484 3750 50  0000 C CNN
F 2 "" V 5530 3750 50  0001 C CNN
F 3 "~" H 5600 3750 50  0001 C CNN
	1    5600 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5B56831A
P 6050 3750
F 0 "R?" V 5843 3750 50  0000 C CNN
F 1 "10 k" V 5934 3750 50  0000 C CNN
F 2 "" V 5980 3750 50  0001 C CNN
F 3 "~" H 6050 3750 50  0001 C CNN
	1    6050 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3750 5800 3750
Connection ~ 5800 3750
Wire Wire Line
	5800 3750 5900 3750
$Comp
L power:+5V #PWR?
U 1 1 5B57CA0E
P 5400 3500
F 0 "#PWR?" H 5400 3350 50  0001 C CNN
F 1 "+5V" H 5415 3673 50  0000 C CNN
F 2 "" H 5400 3500 50  0001 C CNN
F 3 "" H 5400 3500 50  0001 C CNN
	1    5400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3750 5400 3750
Wire Wire Line
	5400 3750 5400 3500
$Comp
L power:+5V #PWR?
U 1 1 5B57CA5F
P 1650 3800
F 0 "#PWR?" H 1650 3650 50  0001 C CNN
F 1 "+5V" H 1665 3973 50  0000 C CNN
F 2 "" H 1650 3800 50  0001 C CNN
F 3 "" H 1650 3800 50  0001 C CNN
	1    1650 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 3800 1650 3800
$Comp
L Device:CP C?
U 1 1 5B57CC54
P 6050 3400
F 0 "C?" V 6305 3400 50  0000 C CNN
F 1 "100 uF" V 6214 3400 50  0000 C CNN
F 2 "" H 6088 3250 50  0001 C CNN
F 3 "~" H 6050 3400 50  0001 C CNN
	1    6050 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 3750 5800 3400
Wire Wire Line
	5800 3400 5900 3400
Wire Wire Line
	6200 3750 6400 3750
Wire Wire Line
	6400 3400 6200 3400
$Comp
L power:GND #PWR?
U 1 1 5B57CEAD
P 6400 3850
F 0 "#PWR?" H 6400 3600 50  0001 C CNN
F 1 "GND" H 6405 3677 50  0000 C CNN
F 2 "" H 6400 3850 50  0001 C CNN
F 3 "" H 6400 3850 50  0001 C CNN
	1    6400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3750 6400 3850
Wire Wire Line
	6400 3400 6400 3750
Connection ~ 6400 3750
Wire Wire Line
	5800 3750 5800 4200
Wire Wire Line
	5800 4200 6450 4200
Wire Wire Line
	6450 4300 5800 4300
Text Label 5800 4300 0    50   ~ 0
SENSOR_C_A
$Comp
L power:GND #PWR?
U 1 1 5B57DD15
P 1500 3700
F 0 "#PWR?" H 1500 3450 50  0001 C CNN
F 1 "GND" V 1505 3572 50  0000 R CNN
F 2 "" H 1500 3700 50  0001 C CNN
F 3 "" H 1500 3700 50  0001 C CNN
	1    1500 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 3600 1800 3600
Wire Wire Line
	1500 3700 1800 3700
Text Label 1500 3600 0    50   ~ 0
Reset
$Comp
L Device:R R?
U 1 1 5B57EC06
P 5900 1100
F 0 "R?" V 5693 1100 50  0000 C CNN
F 1 "10 k" V 5784 1100 50  0000 C CNN
F 2 "" V 5830 1100 50  0001 C CNN
F 3 "~" H 5900 1100 50  0001 C CNN
	1    5900 1100
	0    1    1    0   
$EndComp
$Comp
L pspice:DIODE D?
U 1 1 5B57EC79
P 5900 1500
F 0 "D?" H 5900 1235 50  0000 C CNN
F 1 "DIODE" H 5900 1326 50  0000 C CNN
F 2 "" H 5900 1500 50  0001 C CNN
F 3 "" H 5900 1500 50  0001 C CNN
	1    5900 1500
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5B57F01E
P 6550 1300
F 0 "SW?" H 6550 1585 50  0000 C CNN
F 1 "SW_Push" H 6550 1494 50  0000 C CNN
F 2 "" H 6550 1500 50  0001 C CNN
F 3 "" H 6550 1500 50  0001 C CNN
	1    6550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1100 6350 1100
Wire Wire Line
	6350 1100 6350 1300
Wire Wire Line
	6100 1500 6350 1500
Wire Wire Line
	6350 1500 6350 1300
Connection ~ 6350 1300
Wire Wire Line
	5700 1500 5600 1500
Wire Wire Line
	5600 1500 5600 1300
Wire Wire Line
	5600 1100 5750 1100
$Comp
L power:GND #PWR?
U 1 1 5B57F5C1
P 6900 1350
F 0 "#PWR?" H 6900 1100 50  0001 C CNN
F 1 "GND" H 6905 1177 50  0000 C CNN
F 2 "" H 6900 1350 50  0001 C CNN
F 3 "" H 6900 1350 50  0001 C CNN
	1    6900 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1300 6900 1300
Wire Wire Line
	6900 1300 6900 1350
$Comp
L power:+5V #PWR?
U 1 1 5B580063
P 5400 1200
F 0 "#PWR?" H 5400 1050 50  0001 C CNN
F 1 "+5V" H 5415 1373 50  0000 C CNN
F 2 "" H 5400 1200 50  0001 C CNN
F 3 "" H 5400 1200 50  0001 C CNN
	1    5400 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1200 5400 1300
Wire Wire Line
	5400 1300 5600 1300
Connection ~ 5600 1300
Wire Wire Line
	5600 1300 5600 1100
$Comp
L Device:LED_ALT D?
U 1 1 5B580E1F
P 8500 1500
F 0 "D?" H 8492 1245 50  0000 C CNN
F 1 "LED_ALT" H 8492 1336 50  0000 C CNN
F 2 "" H 8500 1500 50  0001 C CNN
F 3 "~" H 8500 1500 50  0001 C CNN
	1    8500 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5B581209
P 8500 1100
F 0 "D?" H 8492 845 50  0000 C CNN
F 1 "LED_ALT" H 8492 936 50  0000 C CNN
F 2 "" H 8500 1100 50  0001 C CNN
F 3 "~" H 8500 1100 50  0001 C CNN
	1    8500 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5B581274
P 7950 1100
F 0 "R?" V 7743 1100 50  0000 C CNN
F 1 "1 k" V 7834 1100 50  0000 C CNN
F 2 "" V 7880 1100 50  0001 C CNN
F 3 "~" H 7950 1100 50  0001 C CNN
	1    7950 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5B5812CA
P 7950 1500
F 0 "R?" V 7743 1500 50  0000 C CNN
F 1 "1 k" V 7834 1500 50  0000 C CNN
F 2 "" V 7880 1500 50  0001 C CNN
F 3 "~" H 7950 1500 50  0001 C CNN
	1    7950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 2400 3750 2400
Wire Wire Line
	3400 2500 3750 2500
Text Label 3750 2400 0    50   ~ 0
LED_01
Text Label 3750 2500 0    50   ~ 0
LED_02
Wire Wire Line
	8100 1100 8350 1100
Wire Wire Line
	7800 1100 7550 1100
$Comp
L power:GND #PWR?
U 1 1 5B583158
P 8950 1100
F 0 "#PWR?" H 8950 850 50  0001 C CNN
F 1 "GND" V 8955 972 50  0000 R CNN
F 2 "" H 8950 1100 50  0001 C CNN
F 3 "" H 8950 1100 50  0001 C CNN
	1    8950 1100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B5831B6
P 8950 1500
F 0 "#PWR?" H 8950 1250 50  0001 C CNN
F 1 "GND" V 8955 1372 50  0000 R CNN
F 2 "" H 8950 1500 50  0001 C CNN
F 3 "" H 8950 1500 50  0001 C CNN
	1    8950 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 1100 8950 1100
Wire Wire Line
	8650 1500 8950 1500
Wire Wire Line
	8100 1500 8350 1500
Wire Wire Line
	7800 1500 7550 1500
Text Label 7550 1100 2    50   ~ 0
LED_01
Text Label 7550 1500 2    50   ~ 0
LED_02
$Comp
L Device:R R?
U 1 1 5B585F52
P 5850 2400
F 0 "R?" V 5643 2400 50  0000 C CNN
F 1 "R" V 5734 2400 50  0000 C CNN
F 2 "" V 5780 2400 50  0001 C CNN
F 3 "~" H 5850 2400 50  0001 C CNN
	1    5850 2400
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5B585FB9
P 6600 2400
F 0 "C?" V 6348 2400 50  0000 C CNN
F 1 "C" V 6439 2400 50  0000 C CNN
F 2 "" H 6638 2250 50  0001 C CNN
F 3 "~" H 6600 2400 50  0001 C CNN
	1    6600 2400
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5B586069
P 6600 2850
F 0 "SW?" H 6600 3135 50  0000 C CNN
F 1 "SW_Push" H 6600 3044 50  0000 C CNN
F 2 "" H 6600 3050 50  0001 C CNN
F 3 "" H 6600 3050 50  0001 C CNN
	1    6600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2400 6200 2400
Wire Wire Line
	6400 2850 6200 2850
Wire Wire Line
	6200 2850 6200 2400
Connection ~ 6200 2400
Wire Wire Line
	6200 2400 6450 2400
$Comp
L power:GND #PWR?
U 1 1 5B586D8B
P 7100 2400
F 0 "#PWR?" H 7100 2150 50  0001 C CNN
F 1 "GND" V 7105 2272 50  0000 R CNN
F 2 "" H 7100 2400 50  0001 C CNN
F 3 "" H 7100 2400 50  0001 C CNN
	1    7100 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 2400 6900 2400
Wire Wire Line
	6800 2850 6900 2850
Wire Wire Line
	6900 2850 6900 2400
Connection ~ 6900 2400
Wire Wire Line
	6900 2400 6750 2400
$Comp
L power:+5V #PWR?
U 1 1 5B587DB2
P 5400 2300
F 0 "#PWR?" H 5400 2150 50  0001 C CNN
F 1 "+5V" H 5415 2473 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2300 5400 2400
Wire Wire Line
	5400 2400 5700 2400
$Comp
L Connector:AudioJack2_Ground J?
U 1 1 5B58A98C
P 9000 4200
F 0 "J?" H 8767 4179 50  0000 R CNN
F 1 "AudioJack2_Ground" H 8767 4270 50  0000 R CNN
F 2 "" H 9000 4200 50  0001 C CNN
F 3 "~" H 9000 4200 50  0001 C CNN
	1    9000 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5B58A993
P 7950 3750
F 0 "R?" V 7743 3750 50  0000 C CNN
F 1 "10 k" V 7834 3750 50  0000 C CNN
F 2 "" V 7880 3750 50  0001 C CNN
F 3 "~" H 7950 3750 50  0001 C CNN
	1    7950 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5B58A99A
P 8400 3750
F 0 "R?" V 8193 3750 50  0000 C CNN
F 1 "10 k" V 8284 3750 50  0000 C CNN
F 2 "" V 8330 3750 50  0001 C CNN
F 3 "~" H 8400 3750 50  0001 C CNN
	1    8400 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 3750 8150 3750
Connection ~ 8150 3750
Wire Wire Line
	8150 3750 8250 3750
$Comp
L power:+5V #PWR?
U 1 1 5B58A9A4
P 7750 3500
F 0 "#PWR?" H 7750 3350 50  0001 C CNN
F 1 "+5V" H 7765 3673 50  0000 C CNN
F 2 "" H 7750 3500 50  0001 C CNN
F 3 "" H 7750 3500 50  0001 C CNN
	1    7750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3750 7750 3750
Wire Wire Line
	7750 3750 7750 3500
$Comp
L Device:CP C?
U 1 1 5B58A9AC
P 8400 3400
F 0 "C?" V 8655 3400 50  0000 C CNN
F 1 "100 uF" V 8564 3400 50  0000 C CNN
F 2 "" H 8438 3250 50  0001 C CNN
F 3 "~" H 8400 3400 50  0001 C CNN
	1    8400 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 3750 8150 3400
Wire Wire Line
	8150 3400 8250 3400
Wire Wire Line
	8550 3750 8750 3750
Wire Wire Line
	8750 3400 8550 3400
$Comp
L power:GND #PWR?
U 1 1 5B58A9B7
P 8750 3850
F 0 "#PWR?" H 8750 3600 50  0001 C CNN
F 1 "GND" H 8755 3677 50  0000 C CNN
F 2 "" H 8750 3850 50  0001 C CNN
F 3 "" H 8750 3850 50  0001 C CNN
	1    8750 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3750 8750 3850
Wire Wire Line
	8750 3400 8750 3750
Connection ~ 8750 3750
Wire Wire Line
	8150 3750 8150 4200
Wire Wire Line
	8150 4200 8800 4200
Wire Wire Line
	8800 4300 8150 4300
Text Label 8150 4300 0    50   ~ 0
SENSOR_C_B
Wire Wire Line
	6200 2400 6200 2150
Text Label 6200 2150 3    50   ~ 0
Boot
Wire Wire Line
	3400 2600 3750 2600
Text Label 3750 2600 0    50   ~ 0
Boot
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 5B590F31
P 1350 1050
F 0 "J?" H 1405 1367 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1405 1276 50  0000 C CNN
F 2 "" H 1400 1010 50  0001 C CNN
F 3 "~" H 1400 1010 50  0001 C CNN
	1    1350 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_ALT D?
U 1 1 5B5914B5
P 2100 950
F 0 "D?" H 2100 734 50  0000 C CNN
F 1 "D_Zener_ALT" H 2100 825 50  0000 C CNN
F 2 "" H 2100 950 50  0001 C CNN
F 3 "~" H 2100 950 50  0001 C CNN
	1    2100 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 950  1950 950 
$Comp
L Regulator_Linear:L7805 U?
U 1 1 5B5925A7
P 2750 950
F 0 "U?" H 2750 1192 50  0000 C CNN
F 1 "L7805" H 2750 1101 50  0000 C CNN
F 2 "" H 2775 800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2750 900 50  0001 C CNN
	1    2750 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 950  2300 950 
Wire Wire Line
	1650 1050 1650 1150
$Comp
L Device:CP1 C?
U 1 1 5B594967
P 2300 1250
F 0 "C?" H 2415 1296 50  0000 L CNN
F 1 "10uF" H 2415 1205 50  0000 L CNN
F 2 "" H 2300 1250 50  0001 C CNN
F 3 "~" H 2300 1250 50  0001 C CNN
	1    2300 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C?
U 1 1 5B5949EB
P 3300 1250
F 0 "C?" H 3415 1296 50  0000 L CNN
F 1 "10uF" H 3415 1205 50  0000 L CNN
F 2 "" H 3300 1250 50  0001 C CNN
F 3 "~" H 3300 1250 50  0001 C CNN
	1    3300 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 950  2300 1100
Connection ~ 2300 950 
Wire Wire Line
	2300 950  2450 950 
Wire Wire Line
	2300 1400 2300 1550
Wire Wire Line
	2300 1550 2750 1550
Wire Wire Line
	2750 1550 2750 1250
Wire Wire Line
	3300 1400 3300 1550
Wire Wire Line
	3300 1550 2750 1550
Connection ~ 2750 1550
Wire Wire Line
	3300 1100 3300 950 
Wire Wire Line
	3300 950  3050 950 
Wire Wire Line
	1650 1150 1650 1550
Wire Wire Line
	1650 1550 2300 1550
Connection ~ 1650 1150
Connection ~ 2300 1550
$Comp
L power:+5V #PWR?
U 1 1 5B59BE61
P 3500 850
F 0 "#PWR?" H 3500 700 50  0001 C CNN
F 1 "+5V" H 3515 1023 50  0000 C CNN
F 2 "" H 3500 850 50  0001 C CNN
F 3 "" H 3500 850 50  0001 C CNN
	1    3500 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 850  3500 950 
Wire Wire Line
	3500 950  3300 950 
Connection ~ 3300 950 
$Comp
L power:GND #PWR?
U 1 1 5B59DA03
P 3500 1600
F 0 "#PWR?" H 3500 1350 50  0001 C CNN
F 1 "GND" H 3505 1427 50  0000 C CNN
F 2 "" H 3500 1600 50  0001 C CNN
F 3 "" H 3500 1600 50  0001 C CNN
	1    3500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1550 3500 1550
Wire Wire Line
	3500 1550 3500 1600
Connection ~ 3300 1550
$Comp
L Connector:Micro_SD_Card J?
U 1 1 5B59FDFB
P 9700 2400
F 0 "J?" H 9650 3117 50  0000 C CNN
F 1 "Micro_SD_Card" H 9650 3026 50  0000 C CNN
F 2 "" H 10850 2700 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 9700 2400 50  0001 C CNN
	1    9700 2400
	1    0    0    -1  
$EndComp
NoConn ~ 8800 2100
Wire Wire Line
	8800 2200 8450 2200
Text Label 8450 2200 2    50   ~ 0
SD1
Wire Wire Line
	8800 2300 8450 2300
Wire Wire Line
	8800 2500 8450 2500
Text Label 8450 2300 2    50   ~ 0
SD2
Text Label 8450 2500 2    50   ~ 0
CLK
Wire Wire Line
	8800 2700 8450 2700
NoConn ~ 8800 2800
Text Label 8450 2700 2    50   ~ 0
DAT0
$Comp
L power:GND #PWR?
U 1 1 5B5BA51A
P 8150 2600
F 0 "#PWR?" H 8150 2350 50  0001 C CNN
F 1 "GND" V 8155 2472 50  0000 R CNN
F 2 "" H 8150 2600 50  0001 C CNN
F 3 "" H 8150 2600 50  0001 C CNN
	1    8150 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 2600 8800 2600
$Comp
L power:+3.3V #PWR?
U 1 1 5B5BE855
P 8150 2400
F 0 "#PWR?" H 8150 2250 50  0001 C CNN
F 1 "+3.3V" V 8165 2528 50  0000 L CNN
F 2 "" H 8150 2400 50  0001 C CNN
F 3 "" H 8150 2400 50  0001 C CNN
	1    8150 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 2400 8800 2400
$EndSCHEMATC
