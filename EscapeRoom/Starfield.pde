public class Starfield{

  private Star[] stars;
  
  public Starfield(){
    stars = new Star[400];
    
    for(int i = 0; i < stars.length; i++){
      stars[i] = new Star();
    }
  }



  public void display(){
  
    background(0);
    translate(width/2, height/2);
    for(int i = 0; i < stars.length; i++){
    
      stars[i].update();
      stars[i].show();
      
    }
    
    translate(-width/2, -height/2);
  }
}
