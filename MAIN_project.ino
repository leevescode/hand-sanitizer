#include <Servo.h>
#include <AP_Sync.h>
AP_Sync streamer(Serial);

Servo myservo;
long int stepCount = 0;

int trigPin = 3;
int echoPin = 2;
int servo = 9;
int pos = 0; 
String stringOne, stringTwo, stringThree, stringFour, stringFive;

long duration;
int distance;

void setup() {
  myservo.attach(9);
  myservo.write(0);
  delay(1000);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
  
  stringOne =  String("% of sanitizer left");
  stringFour =  String("cm away");

}

//referenced this: https://howtomechatronics.com/tutorials/arduino/ultrasonic-sensor-hc-sr04/
void loop() {
  digitalWrite(trigPin, LOW);
  
  digitalWrite(trigPin, HIGH);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = duration*0.034/2;

  Serial.print("distance = ");
  Serial.println(distance);
  stringFive =  distance + stringFour;
  streamer.sync("distance", stringFive);

  myservo.write(0);

  //dispenses if less than 8cm away
  if (distance <= 8) {
   Serial.println("270");
   myservo.write(180);
   //270 degree motor but want the delay to be quicker so it only spins about 180 degrees
   delay(1200);
   Serial.println("0");
   myservo.write(0);
   delay(1000);

  
  //changes text
  Serial.println("Dispensing in progress...");
  streamer.sync("dispenseGif", 1);
  streamer.sync("lastPercent", stringTwo);
  delay(1800);
  
  //counting rotations
  stepCount = stepCount + 1;
  float percent = 181-stepCount;
  int percentage = (percent / 180)*100;
  int prevPercentage = (percentage+1);
  stringTwo =  percentage + stringOne;
  stringThree =  prevPercentage + stringOne;
  Serial.println(stringTwo);
  streamer.sync("dispenseGif", 0);
  streamer.sync("lastPercent", stringTwo);
  delay(1400);
  }
  
  //does not dispense if greater than 8cm away
  else if (distance > 8) {
  Serial.println("Place hand under dispenser");
  streamer.sync("dispenseGif", 0);
  streamer.sync("lastPercent", stringTwo);
  delay(20);
  //streamer.sync("distance", stringFive);
  }
  
  else {
  //Serial.print("Step count = ");
  //Serial.println(stepCount);
  Serial.print("distance = ");
  Serial.println(distance);
  }
  
  //sets a delay so person can't take a ton of sanitizer
  delay(250);
}
