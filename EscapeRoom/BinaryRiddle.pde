public class BinaryRiddle extends GameLevel {
  public BinaryRiddle(EventListener levelController) 
  { 
    super(levelController);
  }
  int timeRemain = 3000;
  PFont fontMain;
  PFont fontForState;
  PFont fontForValue;
  int[] stateTable = {0,0,0,0,0,0,0,0};
  int currentQuestion = 0;
  int[] questionTable = {5,12,19,31,45,87};
  int[][] answerTable = { {0,0,0,0,0,1,0,1}, {0,0,0,0,1,1,0,0}, {0,0,0,1,0,0,1,1}, {0,0,0,1,1,1,1,1}, {0,0,1,0,1,1,0,1}, {0,1,0,1,0,1,1,1} };
  int xFirstButton=40, yFirstButton=400;
  int digitValue = 128;
  int spaceBetweenButtons = 140;
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
    timeRemain--;
    if(timeRemain==0) 
    {
      timeRemain=3000; 
      currentQuestion=0;
      for(int i=0; i<8; i++) stateTable[i] = 0;
    }
  }
  public void onEvent(GameEvent event)
  {
  }
  public void onKeyPress(int keycode)
  {
    if(end==true && keycode==ENTER) raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
  }
  public void onMouseClick()
  {
    int xFirstButton=40, yFirstButton=400;
    if(end==false)
    for(int i=0; i<8; i++)
    {
      if(mouseX>=xFirstButton && mouseX<=xFirstButton+100 && mouseY>=yFirstButton && mouseY<=yFirstButton+150)
      {
        if(stateTable[i]==0) stateTable[i]=1;
        else stateTable[i]=0;
        break;
      }
      else xFirstButton=xFirstButton+spaceBetweenButtons;
    }
  }
  
  void display() {
    background(0);
    fontMain = createFont("Courier New",16,true);
    fontForState = createFont("Courier New",160,true);
    fontForValue = createFont("Courier New",40,true);
    textFont(fontMain);
    fill(0,170,80);
    textAlign(RIGHT);
    text(timeRemain,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    if(end==false)
      {
      textFont(fontForValue);
      textAlign(CENTER);
      xFirstButton=50+spaceBetweenButtons-100;
      digitValue=128;
      rectMode(CORNER);
      for(int i=0; i<8; i++)
      {
        fill(70);
        text(digitValue,xFirstButton,yFirstButton-10);
        if(i<7) text("+",xFirstButton+spaceBetweenButtons/2,yFirstButton-10);
        xFirstButton=xFirstButton+spaceBetweenButtons;
        digitValue=digitValue/2;
      }
      
      stroke(0);
      xFirstButton=40;
      textAlign(LEFT);
      textFont(fontForState);
      for(int i=0; i<8; i++)
      {
        if(stateTable[i]==0) 
        {
          fill(50,50,50);
          rect(xFirstButton,yFirstButton,100,150);
          fill(255);
          text("0",xFirstButton+3,yFirstButton+124);
        }
        else 
        {
          fill(0,200,250);
          rect(xFirstButton,yFirstButton,100,150);
          fill(255);
          text("1",xFirstButton+3,yFirstButton+124);
        }
       xFirstButton=xFirstButton+spaceBetweenButtons;
       digitValue=digitValue/2;
      }
      fill(100);
      text("="+questionTable[currentQuestion],1135,yFirstButton+124);
      
      if(checkIfCorrectAnswer(currentQuestion)==true)
      {
        for(int i=0; i<8; i++) stateTable[i] = 0;
        if(currentQuestion<5) currentQuestion++;
        else end=true;
      }
    }
    rectMode(CENTER);
    fill(0,200,250);
    stroke(0,200,250);
    textAlign(CENTER);
    textFont(fontMain);
    if(end==false) text("Repairing corrupted data...",width/2, height-195);
    else 
    {
      text("Data repaired successfully!",width/2, height-195);
      text("Press ENTER to continue.",width/2, height-105);
    }
    noFill();
    rect(width/2,height-150,400,50);
    fill(0,200,250);
    for(int i=0; i<6; i++)
    {
      if(i<currentQuestion || end==true)
      rect(width/2-162+65*i,height-150,50,40);
    }
    
  }
  
  boolean checkIfCorrectAnswer(int currentQuestion) {
    for(int i=0; i<8; i++)
    {
      if(stateTable[i]!=answerTable[currentQuestion][i]) return false;
    }
    return true;
  }
  
  boolean end() {
    return false;
  }
}
