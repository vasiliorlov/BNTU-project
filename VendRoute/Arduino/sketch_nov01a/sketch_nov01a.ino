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

  mySerial.println("AT");
}

void loop() {
  if (mySerial.available())
    Serial.write(mySerial.read());
  if (Serial.available())
    mySerial.write(Serial.read());
}
