import java.io.*;

public class MaxValueInArray extends GameLevel{
  
  private String finalMessage = "";
  int counter = 0;
  
  public MaxValueInArray(EventListener levelController) 
  { 
    super(levelController);
    frameRate(60);
    loadGreetingMessage();
  }
  
  public void updateLevel()
  {
    display();
  }
  public void loadLevel() 
  {
    
  }
  public void onKeyPress(int keycode)
  {
    
  }
  public void onMouseClick(){}
  
  void display() {
    
    background(0);
    textSize(20);
    textAlign(CENTER,TOP);
    if(counter < finalMessage.length()){
      text(finalMessage.substring(0, counter++), width/2,20);
    }else if(counter >= finalMessage.length() && counter <= 2*finalMessage.length()){
      text(finalMessage, width/2,20);
      counter++;
    }else{
      counter = 2*finalMessage.length()+1;
    }
    
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
    
  }
  
  
  private void loadGreetingMessage(){
  
    String fileName = "GreetingMessage_MaxValue.txt";
    String[] lines = loadStrings(fileName);
    println("there are " + lines.length + " lines");
    for (int i = 0 ; i < lines.length; i++) {
      finalMessage += (lines[i] + "\n");
      print(finalMessage);
    }
    
  }
  
}
