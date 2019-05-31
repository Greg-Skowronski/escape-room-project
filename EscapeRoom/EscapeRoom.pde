LevelController levelsController;
import java.lang.reflect.*;

void setup() {
  fullScreen();
  //size(1280,720); //1280

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

void mousePressed(){

  levelsController.onMouseClick();
}
