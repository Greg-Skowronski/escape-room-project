public class BinaryRiddle extends GameLevel {
  public BinaryRiddle(EventListener levelController) 
  { 
    super(levelController);
  }
  int timeRemain = 3000;
  PFont font;
  String[] correctAnswers = {"0010","0110","0101","0001","0011","0101"};
  boolean[] questionAnswered = {false, false, false, false, false, false};
  int selectedQuestion = 0;
  int cursorColor = 1;
  String[] input = {"","","","","",""};
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
    if(timeRemain==0) timeRemain=3000;
  }
  public void onEvent(GameEvent event)
  {
    
  }
  public void onKeyPress(int keycode)
  {
    if(keycode==DOWN) 
    {
      if(selectedQuestion==5) selectedQuestion=0;
      else selectedQuestion++;
    }
    if(keycode==UP) 
    {
      if(selectedQuestion==0) selectedQuestion=5;
      else selectedQuestion--;
    }
    if (keycode == BACKSPACE && input[selectedQuestion] != null && input[selectedQuestion].length() > 0) 
    {
      input[selectedQuestion] = input[selectedQuestion].substring(0, input[selectedQuestion].length() - 1);
    } else
    if(keycode == ENTER)
    {
      if(input[selectedQuestion].equals(correctAnswers[selectedQuestion])==true) 
      {
        questionAnswered[selectedQuestion]=true;
        if(selectedQuestion==5) selectedQuestion=0;
        else selectedQuestion++;
      } else input[selectedQuestion]="";
    } else
    if(keycode>=48 && keycode<=57 && input[selectedQuestion].length()<4 && questionAnswered[selectedQuestion]==false) input[selectedQuestion]+=char(keycode);
  }
  public void onMouseClick(){}
  
  
  void display() {
    background(0);
    font = createFont("Courier New",16,true);
    textFont(font);
    fill(0,170,80);
    textAlign(RIGHT);
    text(timeRemain,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    if(timeRemain%3000==0) 
    {
      for(int i=0; i<6; i++)
      {
        input[i]="";
        questionAnswered[i]=false;
      }
    }
    text("ERROR: Intranet failure. Cannot establish connection with mainframe unit.",50,200);
    text("Cannot parse IP address [6/94]. Automatic reencoding failure.",50,220);
    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete.",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
    text("You have 60 seconds to correct the data or your progress will be lost.",50,320);
    
    if(questionAnswered[0]==true) fill(0,170,80); else fill(255,0,70);
    text("192.0.2.1",50,400);
    text("000110010010.0000.[####].0001",50,420);
    if(questionAnswered[1]==true && questionAnswered[2]==true) fill(0,170,80); else fill(255,0,70);
    text("172.16.254.1",50,500);
    text("000101110010.0001[####].0010[####]0100.0001",50,520);
    if(questionAnswered[3]==true && questionAnswered[4]==true && questionAnswered[5]==true) fill(0,170,80); else fill(255,0,70);
    text("144.36.255.0",50,600);
    text("[####]01000100.[####]0110.00100101[####].0000",50,620);
    
    if(timeRemain%40==0) cursorColor=0;
    else if(timeRemain%20==0) cursorColor=1;
    if(cursorColor==1) { fill(0); stroke(0); }
    else { fill(0); stroke(255,0,70); }
    
    switch(selectedQuestion) {
      case 0: {
        rect(232,408,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],233,420);
        break;
      }
      case 1: {
        rect(222,508,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],223,520);
        break;
      }
      case 2: {
        rect(328,508,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],329,520);
        break;
      }
      case 3: {
        rect(59,608,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],60,620);
        break;
      }
      case 4: {
        rect(203,608,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],204,620);
        break;
      }
      case 5: {
        rect(386,608,input[selectedQuestion].length()*10,14);
        if(questionAnswered[selectedQuestion]==false) fill(0,220,250); else fill(0,170,80);
        text(input[selectedQuestion],387,620);
        break;
      }
    }
    
    if(end()==true) raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    
  }
  
  boolean end() {
    for(int i=0; i<6; i++)
    {
      if(questionAnswered[i]==false) return false;
    }
    return true;
  }
}
