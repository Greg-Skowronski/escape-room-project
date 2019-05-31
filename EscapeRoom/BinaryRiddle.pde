public class BinaryRiddle extends GameLevel {
  public BinaryRiddle(EventListener levelController) 
  { 
    super(levelController);
  }
  int time = 1500;
  int correct = 0;
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
  }
  void display() {
    
    fill(0,255,0);
    textAlign(RIGHT);
    text(time,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    if(time%1500==0) {
      correct=0;
      input="";
    }
    text("ERROR: Intranet failure. Cannot establish connection with mainframe unit.",50,200);
    text("Cannot parse IP address [6/94]. Automatic reencoding failure.",50,220);
    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete. Arrow keys will move between entries. ",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
    //text("and you will need to start once again. Good luck and be careful!",50,320);
    
    switch(correct){
      case 0:{
          fill(255,0,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 1:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          fill(255,0,0);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/",50,520);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 2:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/ >>ET1001L.0010CTH.0111DZX",50,520);
          fill(255,0,0);
          text("H8KG.HT4Z.4XXC",50,600);
          text("C:/",50,620);
          break;
        }
        case 3:{
          background(0);
          break;
        }
      }
      text(input,80,420+correct*100);
  }
  
  boolean end() {
    if(correct==3) return true;
    return false;
  }
  
  void update() {
    time--;
    if(time==0) time=1500;
  }
  
  int getCorrect() {
    return correct;
  }
  
  void setCorrect(int number) {
    this.correct = number;
  }
}
