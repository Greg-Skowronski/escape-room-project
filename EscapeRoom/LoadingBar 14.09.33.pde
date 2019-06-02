public class LoadingScreen extends GameLevel  {
  
  private int loadingTime = 0;
  private final int maxLoadTime = 400;
  
  private PFont font;
  private Starfield starfield;
  
  public LoadingScreen(EventListener levelController) 
  { 
    super(levelController);
    frameRate(60);
    starfield = new Starfield();
  }
  
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
    
    if(loadingTime > maxLoadTime){
      raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    }
    
    
    background(0);
    starfield.display();
    
    noStroke();
    strokeWeight(1);
    font = createFont("Courier New",16,true);
    textFont(font);
    
    fill(0,0,0);
    rect(width/2-200,height/2-20,420,60);
      
    fill(0,170,80);
    textAlign(CENTER);
    text("loading...",width/2,height/2-30);
    rect(width/2-200,height/2-20,loadingTime,40);
  
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
