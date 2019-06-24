int PIN_VSUPP = 8;
int PIN_POS0 = A0;
int PIN_POS1 = A1;
const int VOLTAGE_IN = 5;
float voltageOut = 0;
float REF_RESISTOR = 1000;// ohms
float POS_0 = 0;
float POS_1 = 0;
char state = 0;
const float TOLERANCE = 0.2f;

enum ELEMENTS {
  DIODE_BLOCKING,
  DIODE,
  CAPACITOR,
  SHORT_CIRCUIT,
  OPEN_CIRCUIT,
};
const int RESISTANCES_COUNT = 4;
const int RESISTOR_VALUES[] = {
  4851,
  48,
  10377,
  2,
  0,
};
const char 
    NO_MESSAGE = '0',
    NO_SIG = '1',
    FULL_SIN = '2',
    HALF_SIN = '3',
    HALF_SIN_STABLE = '4',
    ABS_SIN = '5',
    ABS_SIN_STABLE = '6';
ELEMENTS getElement(float resistance, float tolerance);
void setup()
{
  pinMode(PIN_VSUPP, INPUT_PULLUP);
  Serial.begin(9600);
}
int element0, element1; 
void loop()
{
  if(digitalRead(PIN_VSUPP) == HIGH)
    return;
  int rawInput;
  rawInput = analogRead(PIN_POS0);
  if(rawInput) 
  {
    float buffer = rawInput * VOLTAGE_IN;
    voltageOut= (buffer)/1024.0;
    buffer= (VOLTAGE_IN/voltageOut) -1;
    POS_0 = REF_RESISTOR * buffer;
    element0 = getElement(POS_0,TOLERANCE);
  }
  else
    element0 = OPEN_CIRCUIT;
  rawInput = analogRead(PIN_POS1);
  if(rawInput) 
  {
    float buffer = rawInput * VOLTAGE_IN;
    voltageOut= (buffer)/1024.0;
    buffer= (VOLTAGE_IN/voltageOut) -1;
    POS_1 = REF_RESISTOR * buffer;
    element1 = getElement(POS_1,TOLERANCE);
  }
  else
    element1 = OPEN_CIRCUIT;
  
  
  if(element0 == DIODE && element1 == CAPACITOR)
    state = HALF_SIN_STABLE;
  else if(element0 == DIODE && (element1 == OPEN_CIRCUIT || element1 == DIODE_BLOCKING) )
    state = HALF_SIN;
  else if((element0 == SHORT_CIRCUIT || element0 == DIODE) && (element1 == OPEN_CIRCUIT || element1 == DIODE_BLOCKING))
    state = FULL_SIN;
  else if(element0 == DIODE_BLOCKING || element0 == OPEN_CIRCUIT || element0 == CAPACITOR )
    state = NO_SIG;
  Serial.print(state);
  delay(100);
}

ELEMENTS getElement(float resistance, float tolerance)
{
   for(int i = 0; i < RESISTANCES_COUNT; i++)
   {
     float currentResistance = RESISTOR_VALUES[i];
     float max = currentResistance*(1+tolerance);
     float min = currentResistance*(1-tolerance);
     if(resistance<max && resistance > min)
      return i;
   }
}
