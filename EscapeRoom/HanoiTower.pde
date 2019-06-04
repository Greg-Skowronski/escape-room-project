import java.util.*;

public class HanoiTower extends GameLevel{

  private final int nrStacks = 3;
  private final int stackSize = 4;
  private FixedStack[] stack;
  
  /* block */
  private final int MAX_BLOCK_WIDTH = width * 15/100;
  
  private int[] allowedXCoordinates = {width/5, width/2 - MAX_BLOCK_WIDTH/2,  width*8/10- MAX_BLOCK_WIDTH};
  
  /* base */
  private int baseWidth = width*6/10;
  private int baseHeigth = 5*height/100;
  private color baseColor = color(0, 128 , 0);
  
  
  /* vertical bar */
  public static final int barWidth = 20;
  private int barHeight = height/3;
  private final color barColor = color(0, 128 ,0);
  
  public HanoiTower(EventListener levelController) 
  { 
    super(levelController);
    frameRate(60);
    Debugger.debug("Hanoi created.");
    
    stack = new FixedStack[nrStacks];
    
    initStacks();
  }
  
  private void initStacks(){
  
    for(int i = 0; i < nrStacks; i++){
      stack[i] = new FixedStack(stackSize);
    }
    
    for(int i = 0; i < stackSize; i++){
      stack[0].push(new Block(allowedXCoordinates[0], height - baseHeigth- (i+1)*Block.blockHeight, stackSize-i, MAX_BLOCK_WIDTH, i));
    }
     //<>//
  }
  
  
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
  public void onKeyPress(int keycode)
  {
    if(keycode==ENTER) raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
  }
  public void onMouseClick(){}

  public void display(){
 
      fill(0,0,0);
      background(0);
      drawBase();
      drawBars();
      
      
      for(FixedStack st: stack){
        st.display();
      }
  }
  
  
  private void drawBase(){
  
    fill(baseColor);
    rect(width/5, 95*height/100, baseWidth, baseHeigth, 10);
  }
  
  
  private void drawBars(){
  
    fill(barColor);
      
      
    for(int i = 0; i < nrStacks; i++)
      rect( allowedXCoordinates[i] + MAX_BLOCK_WIDTH/2 - barWidth/2, 95*height/100-barHeight , barWidth , barHeight, 5);
    
  }
    
}
