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
  void display() {
    
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
  
  boolean end() {
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
