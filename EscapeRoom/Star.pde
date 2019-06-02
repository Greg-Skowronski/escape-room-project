public class Star{

  private float x,y,z;
  private float speed;
  
  // I create an other variable to store the previous value of the z variable.
  // (the value of the z variable at the previous frame).
  float pz;
  
  Star(){
  
    initCoordinates();
  }
  
  private void initCoordinates(){
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    
    // I set the previous position of "z" in the same position of "z",
    // which it's like to say that the stars are not moving during the first frame.
    pz = z;
  }
  
  void update(){
    z -= speed;
    if(z < 1){
      initCoordinates();
      z = width/2;
    }
  }
  
  void show(){
    speed = map(mouseX , 0 , width , 5 , 30);
    fill(255);
    noStroke();
    
    float sx = map(x/z , 0 , 1 , 0 , width/2);
    float sy = map(y/z , 0 , 1 , 0 , height/2);
    
    float r = map(z, 0 , width , 5 , 0);
    ellipse(sx, sy , r , r);
    
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(50);
    line(px, py, sx, sy);
    
  }
}
