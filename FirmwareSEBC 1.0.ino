/*  
This libraries are in the public domain:
<ESP8266WiFi.h> https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi
<NTPClient.h>   https://github.com/arduino-libraries/NTPClient
<WiFiUdp.h>     https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi  
*/
    
#include <ESP8266WiFi.h>    
#include <NTPClient.h>          
#include <WiFiUdp.h> 

const char *ssid     = "Net Virtua 24";       // nome do seu roteador WIFI (SSID)
const char *password = "";       // senha do roteador WIFI

// Configurando IP Fixo
IPAddress ip(192,168,0,175); 
IPAddress gateway(192,168,0,1);
IPAddress subnet(255,255,255,0);

//Configurando a Porta
WiFiServer server(80); 

// Configurando Servidor NTP Brasil
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "gps.ntp.br", -3 * 3600, 60000);

void setup()
{
  Serial.begin(115200);                     // print no Serial Monitor da IDE
  WiFi.begin(ssid, password);               // acessando a rede WIFI
  Serial.print ( "Conectado a rede " );
  WiFi.config(ip, gateway, subnet);
  while ( WiFi.status() != WL_CONNECTED )   // aguardando a conexão WEB
  {
    delay ( 500 );                          // aguarda 0,5 segundos
    Serial.print ( "." );
  }
  Serial.print ( "Conectado a rede " );
  Serial.println (ssid);
  server.begin();                                   // Inicia o servidor
  Serial.print("IP para se conectar ao NodeMCU: "); //ESCREVE O TEXTO NA SERIAL
  Serial.print("http://");
  Serial.println(WiFi.localIP());
  timeClient.begin();
}

void loop()
{
  timeClient.update();                              // Atualiza o relogio
  WiFiClient client = server.available();           // Verifica se tem cliente conectado
  if (!client) { 
    return;
  }
  while(!client.available()){ 
        delay(1);
  }
  String request = client.readStringUntil('\r'); 
  Serial.println(request);
  client.flush();
  // HTML  da Pagina 
  client.println("HTTP/1.1 200 OK"); 
  client.println("Content-Type: text/html");
  client.println("");
  client.println("<!DOCTYPE HTML>"); 
  client.println("<html>"); 
  client.println("<h1><center>Consegui!</center></h1>"); 
  client.println("<center><font size='5'>Para de Gastar energie CaRaLhO s2!</center>");
  client.println(timeClient.getFormattedTime());    
  client.println("</html>");
  delay(1); //INTERVALO DE 1 MILISEGUNDO
  
  Serial.println(timeClient.getFormattedTime());    // print do relogio da WEB
  delay(1000);                                      // atraso de um segundo
}
