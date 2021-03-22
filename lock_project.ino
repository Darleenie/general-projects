//notice: if lock is locked by hand or by key, the servo should be acknowledged
#include <Servo.h>

int lock; // 1 = lock; -1 = unlock
int blue_LED = 2;
int white_LED = 3;
int pin_switch = 13;

// Declare the Servo pin 
int servoPin = 13; 
// Create a servo object 
Servo servo;
void setup() { 
   // We need to attach the servo to the used pin number 
   servo.attach(servoPin); 
   Serial.begin(9600);
}
void loop(){ 
   // Make servo go to 0 degrees 
   servo.write(0); 
   Serial.println("0");
   delay(1000); 
   // Make servo go to 90 degrees 
   servo.write(90); 
   Serial.println("90");
   delay(1000); 
   // Make servo go to 180 degrees 
   servo.write(180); 
   Serial.println("180");
   delay(1000); 
}
/*
void setup() {

//servo.attach(13);
lock = -1; //unlock
pinMode(blue_LED, OUTPUT);
digitalWrite(blue_LED, LOW);

pinMode(pin_switch, INPUT);

}

void loop() {
  /*
if(digitalRead(pin_switch) == HIGH){
  digitalWrite(blue_LED, LOW);
  digitalWrite(white_LED, HIGH);
  delay(2000);
  if(digitalRead(pin_switch) == HIGH){
    digitalWrite(blue_LED, HIGH);//unlock
    digitalWrite(white_LED, LOW);
    delay(2000);
  }
  */
//lock *= -1;
//delay(2000);
