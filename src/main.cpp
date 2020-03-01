#include "Arduino.h"


#define RX_PIN 16
#define TX_PIN 17
#define RELAI_PIN 4


#define LED 2

//SETTINGS
unsigned int delayWaitForCallSignal(5000);
//the minimum amount of numbers a phonenumber has
uint8_t phoneNumberMinimumNumbers = 5;  
//after this time the teletyper will call the entered number (assert entered number is bigger than phoneNumberMinimumNumbers)
unsigned int maxTimeSinceLastEnteredNumber = 5000; 
//the time the esp32 waits until it read for the low signal when dialing the number (1 pule is 100ms 60ms high 40ms low (the first half of the low is often distoreted))
//the delay starts from the middle of the high signal (eg. lowReadDelayGetNumber = 50 would be in the middle of the low signal (bad idea because of the distorted signal))
uint8_t lowReadDelayGetNumber = 65; 
//the time the system runs until it switchs off again (called party is not available)
unsigned int waitTimeIfReceivingSystemIsOccupied = 1000;
//wait time until system goes on when calling number (FS-Motor (client avaiable)) (FS Motor on then wait waitTimeUntilReaderIsActivated the activate reader)
unsigned int waitTimeUntilReaderIsActivated = 1000;
//wait time until data is sent to the FS 
unsigned int waitTimeUntilDataIsSentToFS = 3000;
//wait time after data is sent to the FS 
unsigned int waitTimeAfterDataIsSentToFS = 2000;
//enable automatic setting to letters + newline + carriage return  (used when transforming ASCII to baudot) at the start and the end
bool automaticLetterSetupWhenReceivingText = true;
//carriage return time delay (wait a bit longer when carriage return due to errors (is an offset to the 30ms stopbit))
int carriageReturnTimeDelay = 100;
//set the maximum the the uarts waits until it sents the enterd text
unsigned int maxInputTimeForUARTTextInput = 5000;


int DEBUG_LEVEL = 3;


//VARS
bool callSignal = false;
bool sending = false;
bool baudotLetters = true;
String dataString = ""; //temp solution


void setup(){

  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);

  Serial.begin(115200);
  //wait a little bit and then start the service
  delay(5000);
  Serial.println("\n\n");
  Serial.println("Starting Service");

  //setup pins
  pinMode(TX_PIN, OUTPUT);
  pinMode(RELAI_PIN, OUTPUT);
  pinMode(RX_PIN, INPUT);

  digitalWrite(TX_PIN, HIGH);
  digitalWrite(RELAI_PIN, LOW);

  Serial.println("Pin setup complete");

}


char bautdotToASCII(uint8_t data){
  switch (data){
    case 0b00111:
        if(baudotLetters){
        return 'A';
      }else{
        return '-';
      }
      break;
    case 0b01100:
      if(baudotLetters){
        return 'B';
      }else{
        return '?';
      }
      break;
    case 0b10001:
      if(baudotLetters){
        return 'C';
      }else{
        return ':';
      }
      break;
    case 0b01101:
      if(baudotLetters){
        return 'D';
      }else{
        return 5; //enquire / wer da
      }
      break;
    case 0b01111:
      if(baudotLetters){
        return 'E';
      }else{
        return '3';
      }
      break;
    case 0b01001:
      if(baudotLetters){
        return 'F';
      }else{
        return 0;
      }
      break;
    case 0b10100:
      if(baudotLetters){
        return 'G';
      }else{
        return 0;
      }
      break;
    case 0b11010:
      if(baudotLetters){
        return 'H';
      }else{
        return 0;
      }
      break;
    case 0b10011:
      if(baudotLetters){
        return 'I';
      }else{
        return '8';
      }
      break;
    case 0b00101:
      if(baudotLetters){
        return 'J';
      }else{
        return 7; //BELL
      }
      break;
    case 0b00001:
      if(baudotLetters){
        return 'K';
      }else{
        return '(';
      }
      break;
    case 0b10110:
      if(baudotLetters){
        return 'L';
      }else{
        return ')';
      }
      break;
    case 0b11000:
      if(baudotLetters){
        return 'M';
      }else{
        return '.'; 
      }
      break;
    case 0b11001:
      if(baudotLetters){
        return 'N';
      }else{
        return ',';
      }
      break;
    case 0b11100:
      if(baudotLetters){
        return 'O';
      }else{
        return '9';
      }
      break;
    case 0b10010:
      if(baudotLetters){
        return 'P';
      }else{
        return '0';
      }
      break;
    case 0b00010:
      if(baudotLetters){
        return 'Q';
      }else{
        return '1';
      }
      break;
    case 0b10101:
      if(baudotLetters){
        return 'R';
      }else{
        return '4';
      }
      break;
    case 0b01011:
      if(baudotLetters){
        return 'S';
      }else{
        return 39; //'
      }
        break;
    case 0b11110:
      if(baudotLetters){
        return 'T';
      }else{
        return '5';
      }
      break;
    case 0b00011:
      if(baudotLetters){
        return 'U';
      }else{
        return '7';
      }
      break;
    case 0b10000:
      if(baudotLetters){
        return 'V';
      }else{
        return '=';
      }
      break;
    case 0b000110:
      if(baudotLetters){
        return 'W';
      }else{
        return '2';
      }
      break;
    case 0b01000:
      if(baudotLetters){
        return 'X';
      }else{
        return '/';
      }
      break;
    case 0b01010:
      if(baudotLetters){
        return 'Y';
      }else{
        return '6';
      }
      break;
    case 0b01110:
      if(baudotLetters){
        return 'Z';
      }else{
        return '+';
      }
      break;
    case 0b11101:
      return 13; // carriage return
      break;
    case 0b10111:
      return 10; //new line
      break;
    case 0b00000:
      baudotLetters = true;
      return 18;
      break;
    case 0b00100:
      baudotLetters = false;
      return 19;
      break;
    case 0b11011:
      return ' ';
      break;
  }
  return 0;
}


uint8_t ASCIIToBaudot(char character){
  switch (character){
    case 'A':
    case '-':
      return 0b00111;
      break;
    case 'B':
    case '?':
      return 0b01100;
      break;
    case 'C':
    case ':':
      return 0b10001;
      break;
    case 'D':
    case 5:  //enquire / wer da
      return 0b01101;
      break;
    case 'E':
    case '3':
      return 0b01111;
      break;
    case 'F':
      return 0b01001;
      break;
    case 'G':
      return 0b10100;
      break;
    case 'H':
      return 0b11010;
      break;
    case 'I':
    case '8':
      return 0b10011;
      break;
    case 'J':
    case 7: //BELL
      return 0b00101;
      break;
    case 'K':
    case '(':
      return 0b00001;
      break;
    case 'L':
    case ')':
      return 0b10110;
      break;
    case 'M':
    case '.':
      return 0b11000;
      break;
    case 'N':
    case ',':
      return 0b11001;
      break;
    case 'O':
    case '9':
      return 0b11100;
      break;
    case 'P':
    case '0':
      return 0b10010;
      break;
    case 'Q':
    case '1':
      return 0b00010;
      break;
    case 'R':
    case '4':
      return 0b10101;
      break;
    case 'S':
    case 39: //'
      return 0b01011;
        break;
    case 'T':
    case '5':
      return 0b11110;
      break;
    case 'U':
    case '7':
      return 0b00011;
      break;
    case 'V':
    case '=':
      return 0b10000;
      break;
    case 'W':
    case '2':
      return 0b000110;
      break;
    case 'X':
    case '/':
      return 0b01000;
      break;
    case 'Y':
    case '6':
      return 0b01010;
      break;
    case 'Z':
    case '+':
      return 0b01110;
      break;
    case 13: // carriage return
      return 0b11101;
      break;
    case 10: // new line
      return 0b10111;
      break;
    case 18:
      return 0b00000;
      break;
    case 19:
      return 0b00100;
      break;
    case ' ':
      return 0b11011;
      break;
  }
  return 0;
}


String StringtoBautdot(String ASCIIString){

  ASCIIString.toUpperCase();

  String baudotString = "";

  if(automaticLetterSetupWhenReceivingText){
    baudotString += (char) 0b00000; //TO LETTER
    baudotString += (char) 0b10111; //NEW LINE
    baudotString += (char) 0b11101; //carriage return
  }

  char baudotLetterSwitch = 0b00000;
  char baudotDigitSwitch = 0b00100;

  bool baudotLetters = true;

  for(int i = 0; i < ASCIIString.length(); i++){

    char baudotChar = ASCIIToBaudot(ASCIIString[i]);

    if(baudotChar != 0){

      if(ASCIIString[i] >= 'A' && ASCIIString[i] <= 'Z'){

        if(baudotLetters){
          baudotString += baudotChar;
        }else{
          baudotString += baudotLetterSwitch;
          baudotString += baudotChar;
          baudotLetters = true;
        }
      }else{
        //plus some exceptions
        if(!baudotLetters || ASCIIString[i] == 13 || ASCIIString[i] == 10 || ASCIIString[i] == ' '){
          baudotString += baudotChar;
        }else{
          baudotString += baudotDigitSwitch;
          baudotString += baudotChar;
          baudotLetters = false;;
        }
      }
    }
  }

  if(automaticLetterSetupWhenReceivingText){
    baudotString += (char) 0b00000; //TO LETTER
    baudotString += (char) 0b10111; //NEW LINE
    baudotString += (char) 0b11101; //carriage return
  }

  return baudotString;
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



void waitForCallSignal(){

  unsigned long start = millis();

  while(true){

    //break the loop if commands are incomming
    if(Serial.available() > 0){
      if(DEBUG_LEVEL >= 3){
        Serial.println("Serialdata / Commands detected (waitForCallSignal())");
      }
      break;
    }

    if(getMillisDifference(start, millis()) > delayWaitForCallSignal){
      start = millis();

      if(DEBUG_LEVEL >= 4){
        Serial.println("Checking Pin for CallSignal (waitForCallSignal())");
      }

      if(digitalRead(RX_PIN) == LOW){
        //call is indicated

        if(DEBUG_LEVEL >= 2){
          Serial.println("CallSignal detected (waitForCallSignal())");
        }

        callSignal = true;
        break;
      }
    }
  }
}



String getNumber(){

  uint8_t detectedNumbers = 0;
  String phonenumber = "";
  unsigned long startLastNumber = millis();

  if(DEBUG_LEVEL >= 3){
    Serial.println("Starting phone number detection! (getNumber())");
  }

  while(detectedNumbers < phoneNumberMinimumNumbers || getMillisDifference(startLastNumber, millis()) < maxTimeSinceLastEnteredNumber){
    //detect rising signal edge
    unsigned long startTimeRisingEdge = millis();
    if(digitalRead(RX_PIN) == HIGH){
      //rising edge detected

      //wait the setup time
      while(getMillisDifference(startTimeRisingEdge, millis()) < 30){
        __asm__("nop");
      }
      startTimeRisingEdge += 30;

      bool firstHalfState = true;
      bool secondHalfState = false;
      uint8_t pulses = 0;
      do{
        
        firstHalfState = digitalRead(RX_PIN);


        //wait for the low part
        while(getMillisDifference(startTimeRisingEdge, millis()) < 50){
          __asm__("nop");
        }

        secondHalfState = digitalRead(RX_PIN);

        startTimeRisingEdge += lowReadDelayGetNumber;

        //check the signal
        if(firstHalfState == HIGH && secondHalfState == LOW){
          pulses++;
        }

        //wait for the high part
        while(getMillisDifference(startTimeRisingEdge, millis()) < 50){
          __asm__("nop");
        }

        startTimeRisingEdge += 100 - lowReadDelayGetNumber;

      }while(firstHalfState == true && secondHalfState == false);

      //both states are high (ST button is was pressed)
      if(firstHalfState == true && secondHalfState == true){
        //cancel the call statement
        if(DEBUG_LEVEL >= 2){
          Serial.println("ST Button was pressed -> exiting number entering sequence (getNumber())");
        }
        return "";
      }

      //increase the detected numbers 
      detectedNumbers++;

      //for the number 0 (10 pulses)
      if(pulses == 10){
        pulses = 0;
      }

      if(DEBUG_LEVEL >= 3){
        Serial.print("Number detected: ");
        Serial.println(pulses);
      }

      phonenumber += pulses;
      startLastNumber = millis();
    }else{
      __asm__("nop");
    }
  }

  if(DEBUG_LEVEL >= 2){
    Serial.print("Detected Phonenumber: ");
    Serial.println(phonenumber);
  }

  return phonenumber;
}


bool initializeCall(String number){

  if(DEBUG_LEVEL >= 2){
    Serial.print("Initializing call with phonenumber: ");
    Serial.println(number);
    Serial.println("Waiting for for called party to get the availability");
  }

  //this will initialize the number 
  //wait 5sec and so simulate the call 
  //TODO add code here later
  //temporary solution press "y" to init call, any other button to end it  
  delay(5000);

  while(!Serial.available()){
    __asm__("nop");
  }

  if(Serial.read() == 'y'){
    return true;
  }

  return false;
}


void activatePhoneLine(){

  //interrupt the phone line for 25ms to indicate a free phoneline
  if(DEBUG_LEVEL >= 3){
    Serial.println("Interrupt phoneline for (25ms) to indecate a free phoneline (getNumber())");
  }
  unsigned long start = millis();
  digitalWrite(TX_PIN, LOW);
  //wait for 25ms 
  while(getMillisDifference(start, millis()) < 25){
    __asm__("nop");
  }

  digitalWrite(TX_PIN, HIGH);
  callSignal = false;

  String number = getNumber();

  //ST button was pressed
  if(number == ""){
    return;
  }

  if(initializeCall(number)){
    digitalWrite(RELAI_PIN, HIGH);
    delay(waitTimeUntilReaderIsActivated);
    sending = true;
  }else{
      //switch on and off (FS-Motor) if it called party is not available
      digitalWrite(RELAI_PIN, HIGH);
      delay(waitTimeIfReceivingSystemIsOccupied);
      digitalWrite(RELAI_PIN, LOW);
      sending = false;
  }

}

void resetDataString(){
  dataString = "";
}

void sendCharacter(char character){
  dataString += character;
}



void getSendingData(){
  //get the data the the FS sends the the ESP32
  bool ST_Button = false;
  resetDataString();
  uint8_t data = 0;
  unsigned long start = millis();

  while(!ST_Button){
    data = 0;

    //wait for high signal
    while(digitalRead(RX_PIN) == LOW){
      start = millis();
    }

    while(getMillisDifference(start, millis()) < 10){
      __asm__("nop");
    }

    data = digitalRead(RX_PIN);

    start += 10;

    if(DEBUG_LEVEL >= 3 && data == 0){
      //should not happen start bit must always be one
      Serial.println("ERROR Start bit is 0 must always be 1 (getSendingData())");
    }


    for(int i = 0; i < 6; i++){
      
      while(getMillisDifference(start, millis()) < 20){
        __asm__("nop");
      }

      data = data << 1;
      data += digitalRead(RX_PIN);


      start += 20;
    }

    if(data == 0b1111111){
      if(DEBUG_LEVEL >= 2){
        Serial.println("ST-Button was pressed -> Exiting sending! (getSendingData())");
      }
      ST_Button = true;
    }

    uint8_t baudotdata = (data & 0b111110) >> 1;
    char character = bautdotToASCII(baudotdata);

    if(DEBUG_LEVEL >= 3){
      Serial.print("Received Data from FS (BIN): ");
      Serial.println(data, BIN);
      Serial.print("Received Data from FS (ASCII): ");
      Serial.println(character);
    }

    sendCharacter(character);

  }

  digitalWrite(RELAI_PIN, LOW);
  sending = false;
}



void sendBaudot(uint8_t data){

    bool TXstatus = false;

    if(DEBUG_LEVEL >= 4){
      Serial.print("Send Data (sendBaudot) in BIN: ");
      Serial.println(data, BIN);
    }
    

    digitalWrite(TX_PIN, LOW);
    delay(20);
    for(int i = 0; i < 5; i++){
      byte bit = (data >> (4 - i)) & 0b1;
      if(bit == 1){
        if(TXstatus){
          digitalWrite(TX_PIN, LOW);
          TXstatus = false;
        }
        delay(20);
      }else{
        if(!TXstatus){
          digitalWrite(TX_PIN, HIGH);
          TXstatus = true;
        }
        delay(20);
      }
    }

    digitalWrite(TX_PIN, HIGH);

    //added delay for carriage return
    if(data == 0b11101){
      delay(carriageReturnTimeDelay);
    }
    
    delay(30);
    
}

void sendReceivingDataBaudot(String data){

  digitalWrite(RELAI_PIN, HIGH);

  if(DEBUG_LEVEL >= 3){
    Serial.println("Activating FS (sendReceivingDataBaudot())");
  }

  delay(waitTimeUntilDataIsSentToFS);

  if(DEBUG_LEVEL >= 2){
    Serial.println("Sending Data to FS (sendReceivingDataBaudot())");
  }

  for(int i = 0; i < data.length(); i++){
    sendBaudot(data[i]);
  }

  if(DEBUG_LEVEL >= 2){
    Serial.println("Sending Data to FS is finished (sendReceivingDataBaudot())");
  }

  delay(waitTimeAfterDataIsSentToFS);

  if(DEBUG_LEVEL >= 3){
    Serial.println("Deactivating FS (sendReceivingDataBaudot())");
  }

  digitalWrite(RELAI_PIN, LOW);
}

void sendReceivingDataASCII(String data){
  String newData = StringtoBautdot(data);
  sendReceivingDataBaudot(newData);
}

void getTextUART(){
  Serial.setTimeout(5000);

  if(DEBUG_LEVEL >= 1){
    Serial.println("You can now enter your Text: (After timeout the text will be sent)\n\n");
  }

  unsigned long start = millis();
  String text = "";

  int charCount = 0;

  while(getMillisDifference(start, millis()) < maxInputTimeForUARTTextInput){
    if(Serial.available()){
      char receivedChar = Serial.read();
      text += receivedChar;
      Serial.print(receivedChar);
      charCount++;

      if(receivedChar == '\n'){
        text += '\r';
        charCount = 0;
      }

      //auto new line
      if(charCount == 69){
        text += '\n';
        text += '\r';
        charCount = 0;
        Serial.print('\n');
        Serial.print('\r');
      }
      start = millis();
    }
  }

  if(DEBUG_LEVEL >= 2){
    Serial.println("Text will now be sent (getTextUART())");
  }

  sendReceivingDataASCII(text);

  Serial.setTimeout(1000);
}

void enableDirectDataTransmission(){
  digitalWrite(RELAI_PIN, HIGH);

  if(DEBUG_LEVEL >= 3){
    Serial.println("Activating FS (enableDirectDataTransmission())");
  }

  delay(waitTimeUntilDataIsSentToFS);

  if(DEBUG_LEVEL >= 1){
    Serial.println("You can exit this mode by entering a ! (enableDirectDataTransmission())");
  }

  String baudotString = "";

  if(automaticLetterSetupWhenReceivingText){
    baudotString += (char) 0b00000; //TO LETTER
    baudotString += (char) 0b10111; //NEW LINE
    baudotString += (char) 0b11101; //carriage return
  }

  for(int i = 0; i < baudotString.length(); i++){
    sendBaudot(baudotString[i]);
  }

  baudotString = "";

  
  char baudotLetterSwitch = 0b00000;
  char baudotDigitSwitch = 0b00100;

  int charCount = 0;

  while(true){

    if(Serial.available()){
      char UARTChar = Serial.read();

      if(UARTChar >= 'a' && UARTChar <= 'z'){
        UARTChar -= 32;
      }

      char baudotChar = ASCIIToBaudot(UARTChar);

      //auto char limiter
      if(baudotChar > 0){
        charCount++;
      }
      //auto char limiter
      if(UARTChar == '\n'){
        charCount = 0;
      }

      if(UARTChar == '!'){
        if(DEBUG_LEVEL >= 1){
        Serial.println("Exiting Direct Mode (enableDirectDataTransmission())");
        }
        break;
      }
      

      if(baudotChar != 0){

        if(UARTChar >= 'A' && UARTChar <= 'Z'){

          if(baudotLetters){
            baudotString += baudotChar;
          }else{
            baudotString += baudotLetterSwitch;
            baudotString += baudotChar;
            baudotLetters = true;
          }
        }else{
          //plus some exceptions
          if(!baudotLetters || UARTChar == 13 || UARTChar == 10 || UARTChar == ' '){
            baudotString += baudotChar;
            if(baudotChar == '\n'){
              baudotString += '\r';
            }
          }else{
            baudotString += baudotDigitSwitch;
            baudotString += baudotChar;
            baudotLetters = false;;
          }
        }
      }

      //auto char limiter
      if(charCount >= 69){
        baudotString += (char) 0b10111; //NEW LINE
        baudotString += (char) 0b11101; //carriage return
        charCount = 0;
      }

      for(int i = 0; i < baudotString.length(); i++){
        if(DEBUG_LEVEL >= 4){
          Serial.print("Send ASCII Character: ");
          Serial.println(bautdotToASCII(baudotString[i]));
        }else{
          Serial.print(bautdotToASCII(baudotString[i]));
        }
        sendBaudot(baudotString[i]);
      }

      baudotString = "";
    }
  }


  delay(waitTimeAfterDataIsSentToFS);

  if(DEBUG_LEVEL >= 3){
    Serial.println("Deactivating FS (enableDirectDataTransmission())");
  }

  digitalWrite(RELAI_PIN, LOW);
}

void getCommands(){

  char command = Serial.read();

  if(command == 'h'){
    Serial.println("l = print the htr logo");
    Serial.println("e = enables the FS");
    Serial.println("s = stops the FS");
    Serial.println("t = enables text mode (write text then send it to the FS)");
    Serial.println("d = direct mode (send chars directly to the FS)");
    Serial.println("x = sending data mode (print the char sent by the FS)");
  }

  //print HTR (for Hackertreff Reutte) 
  if(command == 'l'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Sending Example LOGO / ASCII ART! (command = l) getCommands())");
    }
    sendReceivingDataASCII("HH      HH   TTTTTTTTTT   RRRRRRRRR\n\rHH      HH       TT       RR      RR\n\rHH      HH       TT       RR      RR\n\rHHHHHHHHHH       TT       RRRRRRRRR\n\rHH      HH       TT       RR  RR\n\rHH      HH       TT       RR    RR\n\rHH      HH       TT       RR      RR\n\r\n\nHackertreff Reutte am Fernschreiber\n\r\a\a\a\n\r");
  }

  //enables the TTY
  if(command == 'e'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Enabling FS (switch a and b / relai = high) (command = e) (getCommands())");
    }
    digitalWrite(RELAI_PIN, HIGH);
  }

  //stops TTY
  if(command == 's'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Disabling FS (switch a and b / relai = low) (command = s) (getCommands())");
    }
    digitalWrite(RELAI_PIN, LOW);
  }

  //write some text to the tty
  if(command == 't'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Enabling Text input per UART (command = t) (getCommands())");
    }
    getTextUART();
  }

  //instant put through / direct access to the FS
  if(command == 'd'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Enabling direct data transmission to the FS (command = d) (getCommands())");
    }
    enableDirectDataTransmission();
  }

  //enable sending data mode
  if(command == 'x'){
    if(DEBUG_LEVEL >= 1){
      Serial.println("Enabling sending Data Mode (command = x) (getCommands())");
    }

    digitalWrite(RELAI_PIN, HIGH);

    delay(waitTimeUntilDataIsSentToFS);

    getSendingData();

    if(DEBUG_LEVEL >= 1){
      Serial.println("Text that was sent: \n");
      Serial.println(dataString);
    }
  }
    

  Serial.readString();
}

void loop(){
  
  if(Serial.available()){
    //get the commands
    if(DEBUG_LEVEL >= 2){
      Serial.println("Entering getCommands (loop())");
    }
    
    getCommands();
    
  }else if(callSignal){
    if(DEBUG_LEVEL >= 2){
      Serial.println("Entering activate PhoneLine Routine (loop())");
    }

    activatePhoneLine();
    
  }else if(sending){

    if(DEBUG_LEVEL >= 2){
      Serial.println("Entering sendingData Mode (loop())");
    }

    getSendingData();

    if(DEBUG_LEVEL >= 2){
      Serial.println("\nSending following content: ");
      Serial.println(dataString);
      Serial.println(" \n");
    }
  }else{
    //idle state
    if(DEBUG_LEVEL >= 2){
      Serial.println("Entering IDLE state / waitForCallSignal (loop())");
    }
    waitForCallSignal();
  }
  
}