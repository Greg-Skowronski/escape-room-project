class Character{

  public static final int CHAR_SIZE = 15;
  private char theChar;
  private int x, y;

  private final int normalRangeBeg = 48; // 0 in unicode
  private final int normalRangeEnd = 90; // Z in unicode


  public Character(int tempX, int tempY){
  
    x = tempX;
    y = tempY;
    
    getRandomChar();
  }
  
  
  public char getTheChar(){
    return theChar;
  }
  
  public void setTheChar(char ch){
    theChar = ch;
  }
  
  public void show(){
    textSize(CHAR_SIZE);
    text(theChar, x , y);
  }
  
  public void getRandomChar(){
    int charType = round(random(1));
    if(charType == 0)
    {
      int rndChar = round(random(normalRangeBeg, normalRangeEnd));
      theChar = (char)rndChar;
    }
    else if(charType == 1)
    {
     // int rndChar = round(random(hirakanaRangeBeginning, hirakanaRangeEnd));
      int rndChar = round(random(normalRangeBeg, normalRangeEnd));
      theChar = (char)rndChar;
    }
  }
  
}
