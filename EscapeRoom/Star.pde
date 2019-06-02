public class Star{

  private float x,y,z;
  
  
  Star(){
  
    x = random(-width, width);
    y = random(-height, height);
    z = width;
  }
  
  void update(){
    z -= 1;
  }
  
  void show(){
    fill(0, 255 ,0);
    noStroke();
    
    float sx = map(x/z , 0 , 1 , 0 , width);
    float sy = map(y/z , 0 , 1 , 0 , width);
    
    
    ellipse(sx, sy , 8 , 8);
  }
}
