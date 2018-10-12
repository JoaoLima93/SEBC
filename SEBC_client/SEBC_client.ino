/* 
-------------------------------------------------------------------------------------
Sistema Embarcado de Baixo Custo para Simula��o de Tarifas Din�micas: Tarifa Branca
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

const char* ssid     = "Net Lima";           // Nome do seu WIFI (SSID)
const char* password = "#anaJOAO2009#";      // Senha do WIFI

const int Led_Conexao   =  16;               // Led para verificar conex�o WiFi
const int Led_Energia   =   5;               // Led para verificar fornecimento de energia

const int Mux0          =  12;               // Porta de MUX 0
const int Mux1          =  13;               // Porta de MUX 1
const int Mux2          =  14;               // Porta de MUX 2

const char* host        = "192.168.10.106";
int   id_cliente        = 1;
float leitura_a         = 10;
float hora_consumo      = 0;

// Configurando Servidor NTP Brasil
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "gps.ntp.br", -3 * 3600, 60000);

void setup() {
  // Configura��o de Sensores 
  pinMode(Mux0, OUTPUT);
  pinMode(Mux1, OUTPUT);
  pinMode(Mux2, OUTPUT);
  
  // Configura��o da Conex�o WEB   
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
}

void loop() {
  // ====================================
  timeClient.update();                              // Atualiza o relogio
  digitalWrite(Mux0, LOW);
  digitalWrite(Mux1, LOW);  
  
  //   Sensor de Tens�o A
  digitalWrite(Mux2, LOW);  
    
  //   Sensor de Corrente A
  digitalWrite(Mux2, HIGH);

  leitura_a += 10;
  
  digitalWrite(Mux1, HIGH);  
  
  //   Sensor de Tens�o B
  digitalWrite(Mux2, LOW);  
    
  //   Sensor de Corrente B
  digitalWrite(Mux2, HIGH);

  leitura_b += 10;

  // ======================================
  
  Serial.print("connecting to ");
  Serial.println(host);
  
  // Use WiFiClient class to create TCP connections
  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    digitalWrite(Led_Conexao, LOW);     
    return;
  }
  digitalWrite(Led_Conexao, HIGH);
  
  // URL de chamda da API
  String url = "/sebc/incluiConsumo.php?";
         url += "leitura_a=";
         url += leitura_a;
         url += "leitura_b=";
         url += leitura_b;
         url += "&id_cliente=";
         url += id_cliente;
         url += "&hora_consumo=";
         url += timeClient.getFormattedTime();         
  
  Serial.print("Requesting URL: ");
  Serial.println(url);
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");
  unsigned long timeout = millis();
  while (client.available() == 0) {
    if (millis() - timeout > 5000) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      return;
    }
  }
  
  // Resposta na serial para debug do servi�o
  while(client.available()){
    String line = client.readStringUntil('\r');
    Serial.print(line);
  }
  
  Serial.println();
  Serial.println("closing connection");
 
  delay(1);
}