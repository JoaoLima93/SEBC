/* 
-------------------------------------------------------------------------------------
Sistema Embarcado de Baixo Custo para Simulação de Tarifas Din�micas: Tarifa Branca
-------------------------------------------------------------------------------------
Desenvolvimento:
Jo�o Pedro de Lima                               lima.joaopedro@live.com
-------------------------------------------------------------------------------------
Est� biblioteca foram utilizada pelos seguintes github:
<ESP8266WiFi.h> https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi
<NTPClient.h>   https://github.com/arduino-libraries/NTPClient
<WiFiUdp.h>     https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi  
------------------------------------------------------------------------------------- 
*/

#include <ESP8266WiFi.h>
#include <NTPClient.h>
#include <WiFiUdp.h> 
#include "EmonLib.h"         

EnergyMonitor Monitor_Corrente;
const char* ssid     = "ENERQ_S01";          // Nome do seu WIFI (SSID)
const char* password = "lab*03541807";       // Senha do WIFI

const int Led_Conexao   =  16;               // Led para verificar conex�o WiFi
const int Led_Energia   =   5;               // Led para verificar fornecimento de energia

const int Sensores      =  0;                // Porta de Entrada dos Sensores
const int Mux0          =  12;               // Porta de MUX 0
const int Mux1          =  13;               // Porta de MUX 1
const int Mux2          =  14;               // Porta de MUX 2

const char* host        = "192.168.1.198";
int   id_cliente        = 1;

double Irms_a            = 0;
double V_a               = 0;
double leitura_a         = 0;
double Irms_b            = 0;
double V_b               = 0;
double leitura_b         = 0;
double V_c               = 0;
double leitura_c         = 0;

// Configurando Servidor NTP Brasil
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "a.st1.ntp.br", -3 * 3600, 60000);

void setup() {
  // Configuracao de Sensores
  Monitor_Corrente.current(Sensores,37);
  pinMode(Mux0, OUTPUT);
  pinMode(Mux1, OUTPUT);
  pinMode(Mux2, OUTPUT);
  
  // Configuracao da Conexao WEB   
  Serial.begin(115200);
  delay(10);

  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Configuracao NTP   
  timeClient.begin();

}

void loop() {
  
   digitalWrite(Led_Energia, HIGH);
    
   timeClient.update();                                  // Atualiza o relogio
   digitalWrite(Mux0, LOW);
   digitalWrite(Mux1, LOW);  
    
   //   Sensor de Potencia A
   digitalWrite(Mux2, LOW);
   V_a = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_a = Monitor_Corrente.calcIrms(1480);
   Irms_a = Irms_a;
  
   leitura_a = (V_a*Irms_a/1000);
 
   delay(100);
   
   //   Sensor de Potencia B
   digitalWrite(Mux1, HIGH);  
   digitalWrite(Mux2, LOW);
   V_b = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_b = Monitor_Corrente.calcIrms(1480);
   Irms_b = Irms_b;
  
   leitura_b = (V_b*Irms_b/1000);
 
   delay(100);
   
   //   Sensor de Potencia C
   digitalWrite(Mux0, HIGH);
   digitalWrite(Mux1, LOW); 
   digitalWrite(Mux2, LOW);
   V_c = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_c = Monitor_Corrente.calcIrms(1480);
   Irms_c = Irms_c;
  
   leitura_c = (V_c*Irms_c/1000);
   
   delay(100);

// ======================================
 
  // Valida conexao com a Internet
  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    digitalWrite(Led_Conexao, LOW);     
    return;
  }
  digitalWrite(Led_Conexao, HIGH);
  
  // URL de chamda da API
  String url = "/sebc/IntegraSE/incluiConsumo.php?";
         url += "leitura_a=";
         url += leitura_a;
         url += "&leitura_b=";
         url += leitura_b;
         url += "&id_cliente=";
         url += id_cliente;
         url += "&hora_consumo=";
         url += timeClient.getFormattedTime();         
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");
               
  // Debug via conexao serial   
  unsigned long timeout = millis();
  while (client.available() == 0) {
    if (millis() - timeout > 5000) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      return;
    }
  }
  Serial.print("Requesting URL: ");
  Serial.println(url);
  Serial.println();
  Serial.print("Tensão A: ");
  Serial.println(V_a);
  Serial.print("Corrente A: ");
  Serial.println(Irms_a);
  Serial.print("Potencia A: ");
  Serial.println(leitura_a);
  Serial.print("Tensão B: ");
  Serial.println(V_b);
  Serial.print("Corrente C: ");
  Serial.println(Irms_b);
  Serial.print("Potencia C: ");
  Serial.println(leitura_b);
  
  while(client.available()){
    String line = client.readStringUntil('\r');
    Serial.print(line);
  }
  Serial.println("Leitura OK");
  delay(1000);
}
