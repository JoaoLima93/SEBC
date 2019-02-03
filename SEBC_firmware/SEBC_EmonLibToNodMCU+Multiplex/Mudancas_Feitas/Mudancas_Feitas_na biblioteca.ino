
//Arquivo EmonLib.H
void voltage(unsigned int _inPinV, double _VCAL, double _PHASECAL, unsigned int _multiplex);
void current(unsigned int _inPinI, double _ICAL, unsigned int _multiplex);

unsigned int multiplex;

//Arquivo EmonLib.CPP
  ///Adicionado Antes de leituras de Corrente
  if (multiplex ==1){
      digitalWrite(12, LOW);
        digitalWrite(13, LOW); 
    }
    if (multiplex ==2){
      digitalWrite(12, LOW);  
             digitalWrite(13, HIGH);
    }
    if (multiplex ==3){
      digitalWrite(12, HIGH);
      digitalWrite(13, LOW); 
    }
       digitalWrite(14, HIGH);
  
  
  //Adicionado Antes de leituras de Tensão
  if (multiplex ==1){
      digitalWrite(12, LOW);
        digitalWrite(13, LOW); 
    }
    if (multiplex ==2){
      digitalWrite(12, LOW);  
             digitalWrite(13, HIGH);
    }
    if (multiplex ==3){
      digitalWrite(12, HIGH);
      digitalWrite(13, LOW); 
    }
       digitalWrite(14, HIGH);

