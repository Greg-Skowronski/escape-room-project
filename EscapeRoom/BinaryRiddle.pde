public class BinaryRiddle extends GameLevel {
  public BinaryRiddle(EventListener levelController) 
  { 
    super(levelController);
  }
  int timeRemain = 1500;
  int answeredQuestions = 0;
  PFont font;
  String[] correctAnswers = {"0010","0110","0101","0001","0011","0101"};
  int selectedQuestion = 2;
  int cursorColor = 1;
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
    if(timeRemain==0) timeRemain=1500;
  }
  public void onEvent(GameEvent event)
  {
    
  }
  public void onKeyPress(int keycode)
  {
    if(keycode==ENTER) answeredQuestions++;
    if(keycode==DOWN) 
    {
      if(selectedQuestion==6) selectedQuestion=1;
      else selectedQuestion++;
    }
    if(keycode==UP) 
    {
      if(selectedQuestion==1) selectedQuestion=6;
      else selectedQuestion--;
    }
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
    
    if(timeRemain%1500==0) 
    {
      answeredQuestions=0;
      input="";
    }
    text("ERROR: Intranet failure. Cannot establish connection with mainframe unit.",50,200);
    text("Cannot parse IP address [6/94]. Automatic reencoding failure.",50,220);
    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete.",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
    text("You have 120 seconds to correct the data or your progress will be lost.",50,320);
    
    switch(answeredQuestions)
    {
      case 0:
      {
        
        fill(255,0,70);
        text("192.0.2.1",50,400);
        text("000110010010.0000.[####].0001",50,420);
        text("172.16.254.1",50,500);
        text("000101110010.0001[####].0010[####]0100.0001",50,520);
        text("144.36.255.0",50,600);
        text("[####]01000100.[####]0110.00100101[####].0000",50,620);
        
        break;
      }
      case 1:
      {
        fill(0,170,80);
        text("192.0.2.1",50,400);
        text("000110010010.0000.[####].0001",50,420);
        fill(255,0,70);
        text("172.16.254.1",50,500);
        text("000101110010.0001[####].0010[####]0100.0001",50,520);
        text("144.36.255.0",50,600);
        text("[####]01000100.[####]0110.00100101[####].0000",50,620);
        break;
      }
      case 2:
      {
        fill(0,170,80);
        text("192.0.2.1",50,400);
        text("000110010010.0000.[####].0001",50,420);
        text("172.16.254.1",50,500);
        text("000101110010.0001[####].0010[####]0100.0001",50,520);
        fill(255,0,70);
        text("144.36.255.0",50,600);
        text("[####]01000100.[####]0110.00100101[####].0000",50,620);
        break;
      }
      case 3:
      {
        background(255,0,0);
        break;
      }
    }
    text(input,80,420+answeredQuestions*100);
    
    if(timeRemain%40==0) cursorColor=0;
    else if(timeRemain%20==0) cursorColor=1;
    if(cursorColor==1) fill(0,255,0);
    else fill(0);
    
    switch(selectedQuestion) {
      case 1: {
        rect(226,408,50,14);
        break;
      }
      case 2: {
        rect(216,508,50,14);
        break;
      }
      case 3: {
        rect(321,508,50,14);
        break;
      }
      case 4: {
        rect(53,608,50,14);
        break;
      }
      case 5: {
        rect(196,608,50,14);
        break;
      }
      case 6: {
        rect(380,608,50,14);
        break;
      }
    }
    
  }
  
  boolean end() {
    if(answeredQuestions==3) return true;
    return false;
  }
  
  int getAnsweredQuestions() {
    return answeredQuestions;
  }
  
  void setAnsweredQuestions(int number) {
    this.answeredQuestions = number;
  }
}
