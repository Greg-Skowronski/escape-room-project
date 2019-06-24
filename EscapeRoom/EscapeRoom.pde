
PFont f;
PImage scull;
String input="";
LevelController levelsController;
import java.lang.reflect.*;
public static TextRenderer textRenderer;
ConcurrentLinkedQueue<SerialMessage> incomingQueue;
public static final int FRAMERATE = 60;
private Serial serial;
void setup() {
  textRenderer = new TextRenderer();
  fullScreen();
  //size(1280,720); //1280
  noCursor();
  frameRate(FRAMERATE);
  f = createFont("Courier New",16,true);
  incomingQueue = new ConcurrentLinkedQueue<SerialMessage>();
  scull = loadImage("scull.png");
  levelsController = new LevelController(this);
  levelsController.loadLevel(3);
  try 
  {
    serial = new Serial(this, "COM14", 9600);
  }
  catch(RuntimeException e)
  {
    Debugger.error("Cannot open serial port. " + e.toString());
  }
}

void draw() {
  if(serial.available()>0)
  {
    char msg = serial.readChar();
    print(msg);
    levelsController.onEvent(new GameEvent(EventSource.ARDUINO,EventType.SERIAL_INPUT,msg));
  }
  levelsController.update();
}

void keyPressed() {
  levelsController.onKeyPress(keyCode);
  
}
