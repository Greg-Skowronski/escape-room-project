String input="";
LevelController levelsController;
import java.lang.reflect.*;
void setup() {
  fullScreen();
  //size(1280,720);
  noCursor();
  frameRate(60);
  levelsController = new LevelController(this);
  levelsController.loadLevel(0);
}

void draw() {
  
  levelsController.update();

}

void keyPressed() {
  
  levelsController.onKeyPress(keyCode);
  
}
