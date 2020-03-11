
//PROJETO CARRO EM ARDUINO

//declaracao dos pinos utilizados para controlar a velocidade de rotacao
const int speedRight = 6; 
const int speedLeft = 5;

//declaracao dos pinos utilizados para controlar o sentido do motor
const int PINO_IN1 = 4; 
const int PINO_IN2 = 3;
const int PINO_IN3 = 2;
const int PINO_IN4 = 7;

int wheelSpeed = 0;

const int changeOfDirectionDelay = 1000; //declaracao do intervalo de 1 segundo entre os sentidos de rotacao do motor

const int changeInSpeedDelay = 30; //declaracao do intervalo de 30 ms para as rampas de aceleracao e desaceleracao

//valores temporarios
boolean startFoward = false;
boolean startBackward = false;

//valores definitivos
boolean movingFoward = false;
boolean movingBackwards = false;

//talvez remover
boolean directionChanged = false;

uint8_t byteRead = 0;

//FUNCOES

void stopAcceleration(){
  
  for (wheelSpeed = 255; wheelSpeed >= 0; wheelSpeed=wheelSpeed-10){ 
    analogWrite(speedRight, wheelSpeed);
    analogWrite(speedLeft, wheelSpeed);
    delay(changeInSpeedDelay);
  } 
  movingFoward = false;
  movingBackwards = false;
  delay(changeOfDirectionDelay);
}

void setGoFoward(){
  //configura os motores para o sentido horario
  digitalWrite(PINO_IN1, LOW); 
  digitalWrite(PINO_IN2, HIGH);
  digitalWrite(PINO_IN3, HIGH);
  digitalWrite(PINO_IN4, LOW);

  //acelera
  accelerate();
  
  movingFoward =  true;
  //movingBackwards = false;

}

void setGoBackwards(){
  //configura os motores para o sentido horario
  digitalWrite(PINO_IN1, HIGH); 
  digitalWrite(PINO_IN2, LOW);
  digitalWrite(PINO_IN3, LOW);
  digitalWrite(PINO_IN4, HIGH);
  
  accelerate();
  
  movingBackwards = true;
  //movingFoward = false;
}

void accelerate(){
  for (wheelSpeed = 0; wheelSpeed < 256; wheelSpeed=wheelSpeed+10){ 
    analogWrite(speedRight, wheelSpeed);
    analogWrite(speedLeft, wheelSpeed);
    delay(changeInSpeedDelay);
  } 
}

void checkStatus(){
  Serial.print("Started going foward? ");
  Serial.println(startFoward);
  Serial.print("Is going backward? ");
  Serial.println(startBackward);
}

void setup() {
  pinMode(speedRight, OUTPUT);
  pinMode(speedLeft, OUTPUT);
  pinMode(PINO_IN1, OUTPUT);
  pinMode(PINO_IN2, OUTPUT);
  pinMode(PINO_IN3, OUTPUT);
  pinMode(PINO_IN4, OUTPUT);

  digitalWrite(PINO_IN1, LOW);
  digitalWrite(PINO_IN2, LOW);
  digitalWrite(PINO_IN3, LOW);
  digitalWrite(PINO_IN4, LOW);
  digitalWrite(speedLeft, LOW);
  digitalWrite(speedRight, LOW);
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
      if(movingBackwards){
        stopAcceleration();
      }
      setGoFoward();
      checkStatus();
    } else if (byteRead == 'B') {
      Serial.println("Go backward pressed");
      if(movingFoward){
        stopAcceleration();
      }
      setGoBackwards();
      checkStatus();
    } else if (byteRead == 'C'){
      Serial.println("Stop");
      stopAcceleration();
    }
    // Demais condições para as girar eixo
      
 } else {
 //Serial.println("No command");
 delay(10);
  }
}
