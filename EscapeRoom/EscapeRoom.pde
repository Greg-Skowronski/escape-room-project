
PFont f;
PImage scull;
String input="";
LevelController levelsController;
import java.lang.reflect.*;
public static TextRenderer textRenderer;
ConcurrentLinkedQueue<SerialMessage> incomingQueue;
SerialController serial;
public static final int FRAMERATE = 60;
void setup() {
  textRenderer = new TextRenderer();
  //fullScreen();
  size(1280,720); //1280
  noCursor();
  frameRate(FRAMERATE);
  f = createFont("Courier New",16,true);
  incomingQueue = new ConcurrentLinkedQueue<SerialMessage>();
  serial = new SerialController(this, incomingQueue, SerialController.DEFAULT_PORTNAME, SerialController.DEFAULT_BAUDRATE);
  scull = loadImage("scull.png");
  levelsController = new LevelController(this);
  levelsController.loadLevel(3);
}

void draw() {
  SerialMessage msg = serial.getMessage();
  if(msg != null)
    levelsController.onEvent(new GameEvent(EventSource.ARDUINO,EventType.SERIAL_INPUT,msg));
  levelsController.update();
}

void keyPressed() {
  levelsController.onKeyPress(keyCode);
  
}
