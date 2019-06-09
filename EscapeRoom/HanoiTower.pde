import java.util.*;
import java.io.*;

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
  private final int FPS = 60;
  
  
  private String greetingMessage = "";
  private String[] tmp;
  private boolean greetingMessageFinished = false;
  private String controlMessage = "";
  private boolean displayMessage = true;
  private boolean displayGreetingMessage = true;
  private boolean displayControlMessage = false;
  private boolean controlMessageFinished = false;
  private int messageCounter = 0;
  private int timerCounter = 0;
  private boolean gameFinished = false;
  private long elapsedTime;
  private long start;
  private long stop;
  
  public HanoiTower(EventListener levelController) 
  { 
    super(levelController);
    readFile();
    
    frameRate(FPS);
    Debugger.debug("Hanoi created.");
    
    stack = new FixedStack[nrStacks];
    
    initStacks();
  }
  
  private void readFile(){
    
    tmp = loadStrings("HanoiInstruction.txt");
    for(int i = 0; i < tmp.length;i++){
      greetingMessage += (tmp[i] + '\n');
    }
    
    tmp = loadStrings("HanoiControl.txt");
    for(int i = 0; i < tmp.length;i++){
      controlMessage += (tmp[i] + '\n');
    }
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
    if(displayGreetingMessage && greetingMessageFinished &&keycode == ' '){
      displayGreetingMessage = false;
      displayControlMessage = true;
      messageCounter = 0;
      start = System.currentTimeMillis();
    }
    
    if(controlMessageFinished && displayControlMessage && keycode == ' '){
    
      displayControlMessage = false;
      displayMessage = false;
    }
    
    
    if(displayMessage){
      return;
    }
    
    if(gameFinished && keycode == ' '){
      raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    }
    
    
    if(gameFinished){
      return;
    }
    
    if(currentDirection == DIRECTION.FROM){
    
      if(keycode >= '1' && keycode <= '3'){
        tmpBlock = stack[(keycode -'1')].pop();
        if(tmpBlock == null){
          return;
        }
        
        tmpBlock.setActive(true);
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
        tmpBlock.setActive(false);
        
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
      
      if(tmpBlock != null){
        tmpBlock.display();
      }
      
      if(displayMessage){
        drawMessage();
      }
      
      if(isGameWon()){
        displayGameFinished();
      }
  }
  
  private void drawMessage(){
  
    textSize(20);
    textAlign(CENTER);
    
    if(displayGreetingMessage){
         if(messageCounter < greetingMessage.length()){
        text(greetingMessage.substring(0, messageCounter), width/2, 30.0);
        messageCounter++;
      }else{
        text(greetingMessage, width/2, 30.0);
        greetingMessageFinished = true;
      } 
    }
    else if(displayControlMessage){
    
        stop = System.currentTimeMillis();
       elapsedTime = (stop - start);
       if(elapsedTime > 1500){
         
        if(messageCounter < controlMessage.length()){
          text(controlMessage.substring(0, messageCounter), width/2, 30.0);
          messageCounter++;
          
        }else{
          text(controlMessage, width/2, 30.0);
          controlMessageFinished = true;
        } 
         
       }
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
    text("2",  allowedXCoordinates[1] + MAX_BLOCK_WIDTH/2 - barWidth/2 + 10, 99*height/100 );
    text("3",  allowedXCoordinates[2] + MAX_BLOCK_WIDTH/2 - barWidth/2 + 10, 99*height/100 );
  }
  
  
  private boolean isGameWon(){
  
    if(stack[2].allInRightOrder()){
      gameFinished = true;
      return true;
    }
    
    return false;
  }
  
  private void displayGameFinished(){
  
    fill(255,255,255);
    textSize(30);
    text("You did it! Well Done!\nPress Space to continue", width/2, 200);
    
  }
  
}


enum DIRECTION{FROM, TO};
