import java.util.*;

public class HanoiTower extends GameLevel{

  private final int nrStacks = 3;
  private final int stackSize = 4;
  private FixedStack[] stack;
  
  /* block */
  private final int MAX_BLOCK_WIDTH = width * 15/100;
  
  /* base */
  private int baseWidth = width*6/10;
  private int baseHeigth = 5*height/100;
  private color baseColor = color(0, 128 , 0);
  
  
  private int[] allowedXCoordinates = {width/5, width/2 - MAX_BLOCK_WIDTH/2,  width*8/10- MAX_BLOCK_WIDTH};
  private int[] allowedYCoordinates = {height - baseHeigth-Block.blockHeight, height - baseHeigth- 2*Block.blockHeight, height - baseHeigth- 3*Block.blockHeight, height - baseHeigth- 4*Block.blockHeight};
  
  
  /* vertical bar */
  public static final int barWidth = 20;
  private int barHeight = height/3;
  private final color barColor = color(0, 128 ,0);
  
  
  /*Control and display*/
  private Block tmpBlock; // will be used to animate blocks
  DIRECTION currentDirection = DIRECTION.FROM;
  private int takenFrom;
  private boolean animationTime = false;
  private final int FPS = 60;
  private BlockTransition animationBlock;
  
  
  public HanoiTower(EventListener levelController) 
  { 
    super(levelController);
    frameRate(FPS);
    Debugger.debug("Hanoi created.");
    
    stack = new FixedStack[nrStacks];
    
    initStacks();
  }
  
  private void initStacks(){
  
    for(int i = 0; i < nrStacks; i++){
      stack[i] = new FixedStack(stackSize);
    }
    
    for(int i = 0; i < stackSize; i++){
      stack[0].push(new Block(allowedXCoordinates[0], allowedYCoordinates[i], stackSize-i, MAX_BLOCK_WIDTH, i));
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
    //if(keycode==ENTER) raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    
    if(currentDirection == DIRECTION.FROM){
    
      if(keycode >= '1' && keycode <= '3'){
        tmpBlock = stack[(keycode -'1')].pop();
        if(tmpBlock == null){
          return;
        }
        
        currentDirection = DIRECTION.TO;
        takenFrom = (keycode -'1');
       
      }
    }
    else if(currentDirection == DIRECTION.TO){
    
      if(tmpBlock == null){
        return;
      }
      
      if(keycode >= '1' && keycode <= '3'){
        
        currentDirection = DIRECTION.FROM;
        
         if(tmpBlock.getValue() > stack[(keycode-'1')].getTopBlockValue()){
            stack[takenFrom].push(tmpBlock);
            tmpBlock = null;
            return;
         }
        
        int tmp = stack[(keycode-'1')].elements();
        tmpBlock.setCoordinates(allowedXCoordinates[(keycode-'1')],  allowedYCoordinates[tmp]);
        stack[(keycode -'1')].push(tmpBlock);
        
        tmpBlock = null;
      }
    }
    
    
  }
  public void onMouseClick(){}

  public void display(){
 
      fill(0,0,0);
      background(0);
      drawBase();
      drawBars();
      drawStackNumbers();
      
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
  
  
  private void drawStackNumbers(){
  
    fill(0);
    textSize(25);
    text("1",  allowedXCoordinates[0] + MAX_BLOCK_WIDTH/2 - barWidth/2, 99*height/100 );
    text("2",  allowedXCoordinates[1] + MAX_BLOCK_WIDTH/2 - barWidth/2, 99*height/100 );
    text("3",  allowedXCoordinates[2] + MAX_BLOCK_WIDTH/2 - barWidth/2, 99*height/100 );
  }
  
  
  private class BlockTransition{
  
    private Block bl;
    private int animationCounter = 0;
    private final int animationLength = 3;
    private final int ySpeed = -20;
    
    public BlockTransition(Block tmp){
      bl = tmp;
    }
    
    public void update(){
      
      if(bl.y >= height/2){
        bl.y += ySpeed;  
      }
      
      bl.display();
    }
  }
  
}


enum DIRECTION{FROM, TO};
