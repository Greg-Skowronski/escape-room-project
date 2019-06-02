public class Stream{

  private ArrayList<Character> chars;
  private int numChar;
  private int speed;
  
  
  Stream(int tempX){
  
    chars = new ArrayList<Character>();
    numChar = (int)round(random(10,30));
    
    int beginningY = height/Character.CHAR_SIZE;
    beginningY = round(random(0, beginningY))* Character.CHAR_SIZE;
    
    
    for(int i = 0, y = beginningY; i < numChar; i++, y+= Character.CHAR_SIZE){
      
      chars.add(new Character(tempX,y));
    }
    
    speed = round(random(2,10));
  }
  
  void update(){
      for(int i = 0; i < chars.size(); i++){
        
        float alpha = map(i, 0 , chars.size()-1, 100,255);
        fill(0,255,80, alpha);
        if(i == chars.size()-1)
        {
          fill(250,255,250, alpha);
        }
        
        chars.get(i).show();
        
        //move characters
        if(frameCount % speed == 0){
          chars.get(i).y += Character.CHAR_SIZE;
          
          //character stays, if size - 1 new char
          if(i == chars.size() - 1){
            chars.get(i).getRandomChar();
          }else{
            char tmp = chars.get(i+1).getTheChar();
            chars.get(i).setTheChar(tmp);
          }
          
        }
        
        
        // change characters randomly
        if(random(1) < 0.01){
          chars.get(i).getRandomChar();
        }
        
        
      }
      
       //this checks if the stream goes over
      if(chars.get(0).y > height){
        for(int i = 0; i < chars.size(); i++){
          chars.get(i).y = ((chars.size()-1)-i)*(-20);
        }
      }
  }
}
