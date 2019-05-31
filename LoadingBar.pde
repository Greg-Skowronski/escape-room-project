public class LoadingBar {
  
  int loadingTime = 0;
  PFont font;
  
  void display() {
    font = createFont("Courier New",16,true);
    textFont(font);
    if(loadingTime<=200) {
      background(0);
      fill(0,170,80);
      textAlign(CENTER);
      text("loading...",width/2,height/2-30);
      rect(width/2-200,height/2-20,loadingTime*2,40);
    }
    
  }
  
  boolean end() {
    if(loadingTime>200) return true;
    else return false;
  }
  
  void update() {
    loadingTime++;
  }
  
}
