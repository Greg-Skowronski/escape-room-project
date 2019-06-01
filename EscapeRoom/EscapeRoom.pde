PFont f;
PImage scull;
String input="";
LevelController levelsController;
import java.lang.reflect.*;
public static TextRenderer textRenderer;
void setup() {
  textRenderer = new TextRenderer();
  //fullScreen();
  size(1280,720); //1280
  noCursor();
  frameRate(60);
  f = createFont("Courier New",16,true);
  scull = loadImage("scull.png");
  levelsController = new LevelController(this);
  levelsController.loadLevel(3);
}

void draw() {
  
  levelsController.update();

}

void keyPressed() {
  levelsController.onKeyPress(keyCode);
  
}
