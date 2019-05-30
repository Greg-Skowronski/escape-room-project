import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class EscapeRoom extends PApplet {

PFont f;
PImage scull;
String input="";
LoadingScreen loading; 
BootScreen booting;
BinaryRiddle riddle01;

public void setup() {
  //fullScreen();
   //1280
  noCursor();
  frameRate(60);
  f = createFont("Courier New",16,true);
  scull = loadImage("scull.png");
}

public void draw() {
  
  background(0);
  
  if(loading.end()==false){
    loading.display();
    loading.updateLevel();
  }
  
  if(loading.end()==true && booting.end()==false){
    booting.display();
    booting.update();
  }
  
  if(booting.end()==true && riddle01.end()==false){
    riddle01.display();
    riddle01.update();
  }

}

public void keyPressed() {
  
  if(booting.end()==true){
    if (key == BACKSPACE && input != null && input.length() > 0) {
      input = input.substring(0, input.length() - 1);
    }else if (key == ENTER){
      if(input.equals("§") || (riddle01.getCorrect()==0 && input.equals("ADE0011.GHE0001.1011DA")) || (riddle01.getCorrect()==1 && input.equals("ET1001L.0010CTH.0111DZX")) || (riddle01.getCorrect()==2 && input.equals("H1000KG.HT0100Z.0100XXC")))
      riddle01.setCorrect(riddle01.getCorrect()+1);
      input="";
    }else if(keyCode!=SHIFT && keyCode!=CONTROL && keyCode!=ALT && keyCode!=20 && keyCode!=9) input+=key;
  }
  
}
public class BinaryRiddle extends GameLevel {
  public BinaryRiddle(EventListener levelController) 
  { 
    super(levelController);
  }
  int time = 1500;
  int correct = 0;
  public void loadLevel()
  {
  }
  public void unloadLevel()
  {
  }
  public void updateLevel()
  {
    display();
  }
  public void onEvent(GameEvent event)
  {
    
  }
  public void display() {
    
    fill(0,255,0);
    textAlign(RIGHT);
    text(time,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    if(time%1500==0) {
      correct=0;
      input="";
    }
    text("ERROR: Intranet failure. Cannot establish connection with mainframe unit.",50,200);
    text("Cannot parse IP address [6/94]. Automatic reencoding failure.",50,220);
    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete. Arrow keys will move between entries. ",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
    //text("and you will need to start once again. Good luck and be careful!",50,320);
    
    switch(correct){
      case 0:{
          fill(255,0,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 1:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          fill(255,0,0);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/",50,520);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 2:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/ >>ET1001L.0010CTH.0111DZX",50,520);
          fill(255,0,0);
          text("H8KG.HT4Z.4XXC",50,600);
          text("C:/",50,620);
          break;
        }
        case 3:{
          background(0);
          break;
        }
      }
      text(input,80,420+correct*100);
  }
  
  public boolean end() {
    if(correct==3) return true;
    return false;
  }
  
  public void update() {
    time--;
    if(time==0) time=1500;
  }
  
  public int getCorrect() {
    return correct;
  }
  
  public void setCorrect(int number) {
    this.correct = number;
  }
}
public class BootScreen extends GameLevel {
  public BootScreen(EventListener levelController) 
  { 
    super(levelController);
  }
  int time = 0;
  boolean end = false;
  public void loadLevel()
  {
    
  }
  public void unloadLevel()
  {
    
  }
  public void updateLevel()
  {
    display();
  }
  public void onEvent(GameEvent event)
  {
    
  }
  public void display() {
    
    background(0);
    stroke(0,255,0);
    textFont(f);
    fill(0,255,0);
    textAlign(RIGHT);
    text(time,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    textAlign(LEFT);
    if(time<540){
      if(time>=50)text("Username: admin",50,160);
      if(time>=100)text("Password: ************",50,180);
      if(time>=150)text("ACCESS TO SYSTEM",50,240);
      if(time>=180)text("Version 3.2.6",50,280);
      if(time>=200 && time<250)text("Initializing.",50,300);
      if(time>=250 && time<300)text("Initializing..",50,300);
      if(time>=300)text("Initializing...",50,300);
      fill(255,0,0);
      if(time>=370)text("System error 5 has occurred.",50,340);
      if(time>=400)text("Status: 0xc000000f",50,380);
      if(time>=430)text("Error transferring execution.",50,420);
      if(time>=460)text("Technical information:",50,460);
      if(time>=470)text("013883B4: 56AD8E3070611832   FE333A6C5BFE0779",50,480);
      if(time>=480)text("013883C4: 3C5CB0099FC36860   E63410CC52C1CCBE",50,500);
      if(time>=490)text("013883D4: 2D5A1557A1CAD913   677E41BB27D586DE",50,520);
      if(time>=500)text("013883E4: 24522C84A81872A5   4680B1738ZA5AD6E",50,540);
      if(time>=510)text("013883F4: 9CAD6ADCCE092FEF   03123457F0704DC51",50,560);
      if(time>=515)text("01388404: 8CF11582DZ27479E   15FDCC60B005658B0",50,580);
      if(time>=520)text("01388414: E35725BB1FE2487A   1FZA78147D42FZ922",50,600);
      if(time>=525)text("01388424: C6210004EC40ED42   6FF57C2FFDD40224C",50,620);
      if(time>=530)text("01388434: 3B2451A4EB805542   97BC55C197A3BC33E",50,640);
      if(time>=535)text("Access is denied",50,700);
    }else if(time<=800) {
      background(0,0,255);
      fill(255);
      text("A problem has been detected and system has been shut down to prevent damage to your computer." 
      ,50,100);
      text("If this is the first time you've seen this stop error screen, restart your computer.",50,140);
      text("If this screen appears again, follow these steps:",50,160);
      text("Check to make sure any new hardware or software is properly installed. I this is a new installation,",50,200);
      text("ask your hardware or software manufacturer for and system updates you might need.",50,220);
      text("If problems continue, disable or remove any newly installed hardware or software. Disable BIOS",50,260);
      text("memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable",50,280);
      text("components, restart your computer, press F8 to select Advanced Startup Options,",50,300);
      text("and then select Safe Mode.",50,320);
      text("Technical information:",50,360);
      text("*** STOP: 0x000000FE (0x00000008, 0x000000006, 0x00000009, 0x847075cc)",50,400);
    }else{
      text("Oh no! Our motherboard has been damaged. Our system can no longer compute any data.",50,150);
      text("To repair this we need your help. Using binary code you need to enter server IP address.",50,170);
      text("Binary code is a system where a number is expressed in the base-2 numeral system.",50,190);
      text("It uses only zeros and ones to represent any number in the world.",50,210);
      text("Press ENTER when you will be ready to start first task.",50,250); 
      imageMode(CENTER);
      scull.resize(400,400);
      image(scull, width/2+400, height/2-150);
    }
    
  }
  
  public boolean end() {
    if(keyPressed) {
      if(key==ENTER && time>800) end=true;
    }
    return end;
  }
  
  public void update() {
    time++;
  }
  
}
public static class Debugger
{
  public static final String TAG_WARN = "WARNING: ";
  public static final String TAG_ERROR = "ERROR: ";
  public static final String TAG_DEBUG = "DEBUG: ";
  public static void warn(String msg)
  {
    println(TAG_WARN + msg);
  }
  public static void error(String msg)
  {
    println(TAG_ERROR + msg);
  }
  public static void debug(String msg)
  {
    println(TAG_DEBUG + msg);
  }
}
public interface EventListener {
  public void onEvent(GameEvent event);
}
public abstract class GameLevel implements EventListener {
  public GameLevel(EventListener levelController)
  {
    this.levelController = levelController;
  }
  EventListener levelController;
  public abstract void updateLevel();
  public abstract void loadLevel();
  public abstract void unloadLevel();
  //public abstract void onKeyPress();
  public void raiseEvent(GameEvent event)
  {
    levelController.onEvent(event);
  }
}

enum EventSource {
  PC,
  ARDUINO
}
enum EventType {
  LEVEL_COMPLETE,
  
}
public class GameEvent {
  //private EventSource eventSource;
  //private EventType eventType;
  Object args;
}
public class LevelController implements EventListener {
  int levelCount = 3;
  Class[] levelClasses = {LoadingScreen.class, BootScreen.class, BinaryRiddle.class};  
  private int currentGameLevelID = 0;
  private GameLevel currentLevel;
  public void update()
  {
    if(currentLevel!=null)
      currentLevel.updateLevel();
  }
  public void loadNextLevel()
  {
   loadLevel(currentGameLevelID++);
  }
  public void loadLevel(int levelID)
  {
    if(levelID>=levelCount)
    {
      Debugger.error(String.format("levelID({0}) cannot be greater than levelCount({1}). Levels not changed.",levelID,levelCount));
      return;
    }
    if(currentLevel != null)
      currentLevel.unloadLevel();
    currentGameLevelID = levelID;
    try 
    {
      currentLevel = (GameLevel)levelClasses[levelID].getConstructor().newInstance();
      currentLevel.loadLevel();
    }
    catch( Exception ex)
    {
      Debugger.error("Cannot create GameLevel object in LevelController. Undefined behaviour and crashing might occur.");
    }
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
public class LoadingScreen extends GameLevel  {
  public LoadingScreen(EventListener levelController) 
  { 
    super(levelController);
  }
  int time = 0;
  public void updateLevel()
  {
     time++;
  }
  public void loadLevel() 
  {
  }
  public void display() {
    
    if(time<=200) 
    {
      background(0);
      fill(0,255,0);
      textFont(f);
      textAlign(CENTER);
      text("loading...",width/2,height/2-30);
      rect(width/2-200,height/2-20,time*2,40);
    }
    
  }
  
  public boolean end() {
    if(time>200) return true;
    else return false;
  }  
  public void unloadLevel()
  {
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
  public void settings() {  size(1280,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "EscapeRoom" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
