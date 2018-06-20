/* 
-------------------------------------------------------------------------------------
Sistema Embarcado de Baixo Custo para Simulação de Tarifas Dinâmicas: Tarifa Branca
-------------------------------------------------------------------------------------
Desenvolvimento:
João Pedro de Lima                               lima.joaopedro@live.com
-------------------------------------------------------------------------------------
Está biblioteca foram retiradas dos seguintes dominios:
<ESP8266WiFi.h> https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi
<NTPClient.h>   https://github.com/arduino-libraries/NTPClient
<WiFiUdp.h>     https://github.com/esp8266/Arduino/tree/master/libraries/ESP8266WiFi  
-------------------------------------------------------------------------------------
*/
    
#include <ESP8266WiFi.h>    
#include <NTPClient.h>          
#include <WiFiUdp.h> 

const char *ssid     = "Net Virtua 24";                    // Nome do seu roteador WIFI (SSID)
const char *password = "#anaJOAO2009#";                    // Senha do roteador WIFI
String     html;                                           // HTML do Cadastro do Medidor

// Configurando IP Fixo
IPAddress ip(192,168,0,175); 
IPAddress gateway(192,168,0,1);
IPAddress subnet(255,255,255,0);

//Configurando a Porta
WiFiServer server(80); 

// Configurando Servidor NTP Brasil
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "gps.ntp.br", -3 * 3600, 60000);

WiFiServer servidor(80);//Cria um objeto "servidor" na porta 80 (http).
WiFiClient cliente;//Cria um objeto "cliente".

String html;//String que armazena o corpo do site.


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
  
  //Configurando as Saídas
  pinMode(D4, OUTPUT);

  timeClient.begin();

}

void loop()
{
  /*
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
  */
  http();
 // delay(1); //INTERVALO DE 1 MILISEGUNDO
  
  
 // Serial.println(timeClient.getFormattedTime());    // print do relogio da WEB
 // delay(1000);                                      // atraso de um segundo
}


void http()//Sub rotina que verifica novos clientes e se sim, envia o HTML.
{
   cliente = servidor.available();//Diz ao cliente que há um servidor disponivel.

   if (cliente == true)//Se houver clientes conectados, ira enviar o HTML.
   {
      String req = cliente.readStringUntil('\r');//Faz a leitura do Cliente.
      Serial.println(req);//Printa o pedido no Serial monitor.

      if (req.indexOf("/LED") > -1)//Caso o pedido houver led, inverter o seu estado.
      {
         digitalWrite(D4, !digitalRead(D4));//Inverte o estado do led.
      }

      html = "";//Reseta a string.
      html += "HTTP/1.1 Content-Type: text/html\n\n";//Identificaçao do HTML.
      html += "<!DOCTYPE html><html><head><title>ESP8266 WEB</title>";//Identificaçao e Titulo.
      html += "<meta name='viewport' content='user-scalable=no'>";//Desabilita o Zoom.
      html += "<style>h1{font-size:2vw;color:black;}</style></head>";//Cria uma nova fonte de tamanho e cor X.
      html += "<body bgcolor='ffffff'><center><h1>";//Cor do Background

      //Estas linhas acima sao parte essencial do codigo, só altere se souber o que esta fazendo!
      
      html += "<form action='/LED' method='get'>";//Cria um botao GET para o link /LED
      html += "<input type='submit' value='LED' id='frm1_submit'/></form>";

      html += "</h1></center></body></html>";//Termino e fechamento de TAG`s do HTML. Nao altere nada sem saber!
      cliente.print(html);//Finalmente, enviamos o HTML para o cliente.
      cliente.stop();//Encerra a conexao.
   }
}
