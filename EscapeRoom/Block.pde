public class Block{

    private int blockWidth;
    public final static int MAX_VALUE = 100;
    public static final int blockHeight = 70;
    private int value;
    private color blockColor;
    private final int radius = 7; // arbitrary value for rounding corners of rectangle
    private int x,y;
    private int index;
    private int xOffset;
    private final int basicOffset = 15;
    
    private boolean currentlyActive = false;
    
    public Block(int x, int y, int value, int blockWidth, int index){
    
      this.value = value;
      this.x = x;
      this.y = y;
      blockColor = color(0,0,0);//color( random(50,255) ,random(50,255), random(50,255));
      this.blockWidth = blockWidth;
      this.index = index;
      this.xOffset = index * basicOffset;
    }
    
    public void setCoordinates(int x, int y){
        this.x = x;
        this.y = y;
    }
    
    public void setValue(int v){
      value = v;
    }
    
    
    public int getValue(){
      return value;
    }
    
    
    public void setColor(color c){
      blockColor = c;
    }
    
    
    public void display(){
        
        if(value == 0){
          return;
        }
        fill(blockColor);
        stroke(255,255,255);
        rect(x + xOffset,y, blockWidth - 2*xOffset, blockHeight, radius);
        
        if(currentlyActive){
          fill(0,255,0);
          rect(x + xOffset,y, blockWidth - 2*xOffset, blockHeight, radius);
        }
        
        
        fill(255,255,255);
        textSize(20);
        text(value, x + blockWidth/2 - 5,y + blockHeight/2);
    }
    
    public void setActive(boolean active){
      currentlyActive = active;
    }
    
    public void updateCoordinates(){
    
    
    }
    
}
