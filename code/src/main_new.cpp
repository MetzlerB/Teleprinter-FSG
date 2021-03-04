#include "Arduino.h"

void setup(){
pinMode(2, OUTPUT);
} 

unsigned long getMillisDifference(unsigned long start, unsigned stop){
  if(start > ULONG_MAX / 2 && stop < ULONG_MAX / 2){
    //overflow detected
    return ULONG_MAX - start + stop;
  }

  if(stop - start > ULONG_MAX / 2){
    //prevent underflow
    return start - stop;
  }

  return stop - start;
}


unsigned long start = 0;
byte c = 0;


void loop(){


unsigned long x = getMillisDifference(start , millis());


if (x >= 3000){
  c++;
  c = c%2;
  start = millis();

  if (c == 1){
    digitalWrite(2, HIGH);
    delay(100);
    digitalWrite(2, LOW);
    delay(100);
    digitalWrite(2, HIGH);
  }else{
    digitalWrite(2, LOW);
    delay(100);
    digitalWrite(2, HIGH);
    delay(100);
    digitalWrite(2, LOW);
  }

}












}