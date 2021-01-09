#include <SoftwareSerial.h>
#define rxPin 10
#define txPin 11

SoftwareSerial mySerial = SoftwareSerial(rxPin, txPin);

void setup() {
    // задаем режим работы выводов tx, rx:
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  // устанавливаем скорость передачи данных последовательного порта
  mySerial.begin(9600);
  Serial.begin(9600);
  //установим peripheral
  sendPeripheral();
}

void loop() {
  readSerial();
  delay(500);
}

void writeToBLE(char value) {
  Serial.print("Writing hex :");
  Serial.println(value, HEX);
  mySerial.write(value);
}

void readSerial(){
  char reply[50];
  int i = 0;
  while (mySerial.available()) {
    reply[i] = mySerial.read();
    i += 1;
  }
  //end the string
  reply[i] = '\0';
  if(strlen(reply) > 0){
    Serial.println(reply);
    Serial.println("We have just read some data");

    writeToBLE(4);
  }
}

void sendCommand(const char * command){
  Serial.print("Command send :");
  Serial.println(command);
  mySerial.println(command);
  //wait some time
  delay(100);
  
  char reply[100];
  int i = 0;
  while (mySerial.available()) {
    reply[i] = mySerial.read();
    i += 1;
  }
  //end the string
  reply[i] = '\0';
  Serial.print(reply);
  Serial.println("Reply end");
}

void sendPeripheral() {
  sendCommand("AT");//Ожидание подтверждения OK. 
  sendCommand("AT+ROLE0");//Set the module as peripheral. Where 0 is for peripheral and 1 is for central.
  sendCommand("AT+UUID0xFFE0");//Set the service UUID. It ranges from 0x0001~0xFFFE and defaults to 0xFFE0
  sendCommand("AT+CHAR0xFFE1");//Set the characteristic UUID. It ranges from 0x0001~0xFFFE and defaults to 0xFFE1
  sendCommand("AT+NAMEbluino");//Set a nice name to the peripheral
}
