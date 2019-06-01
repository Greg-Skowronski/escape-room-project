public class LoadingScreen extends GameLevel  {
  public LoadingScreen(EventListener levelController) 
  { 
    super(levelController);
    
    frameRate(60);
  }
  int loadingTime = 0;
  PFont font;
  public void updateLevel()
  {
    display();
    loadingTime++;
  }
  public void loadLevel() 
  {
    
  }
  public void onKeyPress(int keycode)
  {
    
  }
  public void onMouseClick(){}
  
  void display() {
    noStroke();
    strokeWeight(1);
    font = createFont("Courier New",16,true);
    textFont(font);
    if(loadingTime<=200) {
      background(0);
      fill(0,170,80);
      textAlign(CENTER);
      text("loading...",width/2,height/2-30);
      rect(width/2-200,height/2-20,loadingTime*2,40);
    }
    else
      raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
