/* 
-------------------------------------------------------------------------------------
Sistema Embarcado de Baixo Custo para Simulação de Tarifas Din�micas: Tarifa Branca
-------------------------------------------------------------------------------------
Desenvolvimento:
Joao Pedro de Lima                               lima.joaopedro@live.com
-------------------------------------------------------------------------------------
As bibliotecas biblioteca foram utilizada pelos seguintes github:
<ESP8266WiFi.h> https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi
<NTPClient.h>   https://github.com/arduino-libraries/NTPClient
<WiFiUdp.h>     https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi  
------------------------------------------------------------------------------------- 
*/
#include <ESP8266WiFi.h>
#include <NTPClient.h>
#include <WiFiUdp.h> 
#include <SPI.h>
#include <SD.h>
#include "EmonLib.h"         

EnergyMonitor Monitor_Corrente;
File leituraSD;
File leituraNaoIntegradaSD;
const char* ssid     = "Net Lima";           // Nome do seu WIFI (SSID)
const char* password = "#anaJOAO2009#";      // Senha do WIFI

const int Led_Conexao   =  16;               // Led para verificar conex�o WiFi
const int Led_Energia   =   5;               // Led para verificar fornecimento de energia

const int Sensores      =  0;                // Porta de Entrada dos Sensores
const int Mux0          =  12;               // Porta de MUX 0
const int Mux1          =  13;               // Porta de MUX 1
const int Mux2          =  14;               // Porta de MUX 2
const int bootloader    =  4;                // Botão de Bootloader

const char* host        = "192.168.0.15";

String num_medidor     = "22051993";        // Numero do equipamento prédefinido
String inString = "";
int    id_cliente;

double Irms_a            = 0;
double V_a               = 0;
double leitura_a         = 0;
double Irms_b            = 0;
double V_b               = 0;
double leitura_b         = 0;
double Irms_c            = 0;
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

  // Configurando Botão de Loader
  pinMode(bootloader, INPUT);

  // Configurando Cliente
  id_cliente =0;
  
}

void loop() {

   digitalWrite(Led_Energia, HIGH);
    
   timeClient.update();                                 
   digitalWrite(Mux0, LOW);
   digitalWrite(Mux1, LOW);  
    
   //   Sensor de Potencia A
   digitalWrite(Mux2, LOW);
   V_a = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_a = Monitor_Corrente.calcIrms(1480);
     
   leitura_a = (V_a*Irms_a/1000);
 
   delay(100);
   
   //   Sensor de Potencia B
   digitalWrite(Mux1, HIGH);  
   digitalWrite(Mux2, LOW);
   V_b = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_b = Monitor_Corrente.calcIrms(1480);
  
   leitura_b = (V_b*Irms_b/1000);
 
   delay(100);
   
   //   Sensor de Potencia C
   digitalWrite(Mux0, HIGH);
   digitalWrite(Mux1, LOW); 
   digitalWrite(Mux2, LOW);
   V_c = analogRead(Sensores)*1000/16764;
   
   digitalWrite(Mux2, HIGH);
   Irms_c = Monitor_Corrente.calcIrms(1480);
  
   leitura_c = (V_c*Irms_c/1000);
   
   delay(100);

  // Valida conexao com a Internet
  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    digitalWrite(Led_Conexao, LOW);     
    return;
  }
  digitalWrite(Led_Conexao, HIGH);

  //Botão de bootloader
     byte carregaCliente = digitalRead(bootloader); 
   if((inString == "")) {
        Serial.print("Atualizando Cliente ..... ");
        String url1 = "/sebc/IntegraSE/vinculaCliente.php?";
               url1 += "num_medidor=";
               url1 += num_medidor;
        client.print(String("GET ") + url1 + " HTTP/1.1\r\n" +
                     "Host: " + host + "\r\n" + 
                     "Connection: close\r\n\r\n");
        unsigned long timeout2 = millis();
        while (client.available() == 0) {
          if (millis() - timeout2 > 5000) {
            Serial.println(">>> Client Timeout !");
            client.stop();
            return;
          }
        } 
        delay(1000);
        char status[32] = {0};
        client.readBytesUntil('\r', status, sizeof(status));
      if (strcmp(status, "HTTP/1.1 200 OK") != 0) {
        return;
      } 
      // Skip HTTP headers
      char endOfHeaders[] = "\r\n\r\n";
      if (!client.find(endOfHeaders)) {
        return;
      }
      while (client.available()) {
        char c = client.read();
        inString += c;
      }
      Serial.println(inString);
   } 
  id_cliente = inString.toInt();
  
  // URL de chamda da API
  String url = "/sebc/IntegraSE/incluiConsumo.php?";
         url += "leitura_a=";
         url += leitura_a;
         url += "&leitura_b=";
         url += leitura_b;
         url += "&leitura_c=";
         url += leitura_c;
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
  Serial.print("inString: ");
  Serial.println(inString);
  Serial.print("Id_cliente: ");
  Serial.println(id_cliente);
  Serial.print("Tensão A: ");
  Serial.println(V_a);
  Serial.print("Corrente A: ");
  Serial.println(Irms_a);
  Serial.print("Potencia A: ");
  Serial.println(leitura_a);
  Serial.print("Tensão B: ");
  Serial.println(V_b);
  Serial.print("Corrente B: ");
  Serial.println(Irms_b);
  Serial.print("Potencia B: ");
  Serial.println(leitura_b);
  Serial.println("Leitura OK");
  Serial.print("Tensão C: ");
  Serial.println(V_c);
  Serial.print("Corrente C: ");
  Serial.println(Irms_c);
  Serial.print("Potencia C: ");
  Serial.println(leitura_c);
  Serial.println("Leitura OK");
  delay(1000);
}
