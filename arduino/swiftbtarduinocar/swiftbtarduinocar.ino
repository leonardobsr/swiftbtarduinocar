
//PROJETO CARRO EM ARDUINO

int wheel = 7;
boolean start = false;
uint8_t byteRead = 0;
void setup() {
  //seta a roda na posição 7 como output
  pinMode(wheel, OUTPUT);
  //Começa a pegar o input do BT
  Serial.begin(115200);
}

void loop() {
  
  //Verifica se recebe comando via BT
  if( Serial.available() > 0 ) {
    byteRead = Serial.read();
    // Se o comando é A as rodas começam a se mover pra frente
    if( byteRead == 'A' ) {
      Serial.println("Go foward");
      start = !start;
    }
    // Demais condições para as outras rodas
    if(start){
      digitalWrite(wheel, HIGH);
      Serial.println("TRUE");
    } else {
      digitalWrite(wheel, LOW);
      Serial.println("FALSE");
    }
  } else {
    Serial.println("No command");
    delay(10);
  }
}
