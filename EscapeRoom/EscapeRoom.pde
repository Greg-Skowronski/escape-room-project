PFont f;
PImage scull;
String input="";
LevelController levelsController;
import java.lang.reflect.*;
void setup() {
  //fullScreen();
  size(1280,720); //1280
  noCursor();
  frameRate(60);
  f = createFont("Courier New",16,true);
  scull = loadImage("scull.png");
  levelsController = new LevelController(this);
  levelsController.loadLevel(0);
}

void draw() {
  
  levelsController.update();

}

void keyPressed() {
  /*
  if(booting.end()==true){
    if (key == BACKSPACE && input != null && input.length() > 0) {
      input = input.substring(0, input.length() - 1);
    }else if (key == ENTER){
      if(input.equals("§") || (riddle01.getCorrect()==0 && input.equals("ADE0011.GHE0001.1011DA")) || (riddle01.getCorrect()==1 && input.equals("ET1001L.0010CTH.0111DZX")) || (riddle01.getCorrect()==2 && input.equals("H1000KG.HT0100Z.0100XXC")))
      riddle01.setCorrect(riddle01.getCorrect()+1);
      input="";
    }else if(keyCode!=SHIFT && keyCode!=CONTROL && keyCode!=ALT && keyCode!=20 && keyCode!=9) input+=key;
  }
  */
  
}
