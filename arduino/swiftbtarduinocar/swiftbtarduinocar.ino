
//PROJETO CARRO EM ARDUINO

int rightFrontWheel = 7;
int leftFrontWheel = 6;
int rightBackWheel = 5;
int leftBackWheel = 4;
boolean startFoward = false;
boolean startBackward = false;
uint8_t byteRead = 0;
void setup() {
  //seta a roda na posição 7 como output
  pinMode(rightFrontWheel, OUTPUT);
  pinMode(leftFrontWheel, OUTPUT);
 pinMode(rightBackWheel, OUTPUT);
 pinMode(leftBackWheel, OUTPUT);
  //Começa a pegar o input do BT
  Serial.begin(115200);
}

void loop() {
  
  //Verifica se recebe comando via BT
  if( Serial.available() > 0 ) {
    byteRead = Serial.read();
    // Se o comando é A as rodas começam a se mover pra frente
    if( byteRead == 'A' ) {
      Serial.println("Go foward pressed");
      startFoward = !startFoward;
      startBackward = false;
    } else if (byteRead == 'B') {
      Serial.println("Go backward pressed");
      startBackward = !startBackward;
      startFoward = false;
    }
    // Demais condições para as outras rodas
    if(startFoward){
      digitalWrite(rightFrontWheel, HIGH);
       digitalWrite(leftFrontWheel, HIGH);
       digitalWrite(rightBackWheel, LOW);
      digitalWrite(leftBackWheel, LOW);
      Serial.println("Going foward");
    } else if (startBackward){
      digitalWrite(rightFrontWheel, LOW);
       digitalWrite(leftFrontWheel, LOW);
       digitalWrite(rightBackWheel, HIGH);
      digitalWrite(leftBackWheel, HIGH);
      Serial.println("Going backwards");
    } else {
      digitalWrite(rightFrontWheel, LOW);
       digitalWrite(leftFrontWheel, LOW);
       digitalWrite(rightBackWheel, LOW);
      digitalWrite(leftBackWheel, LOW);
      Serial.println("FALSE");
    }
    Serial.print("Is going foward? ");
    Serial.println(startFoward);
    Serial.print("Is going backward? ");
    Serial.println(startBackward);
  } else {
    //Serial.println("No command");
    delay(10);
  }
}
