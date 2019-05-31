public class Matrix{

  private PFont theFont;
  private ArrayList<Stream> streams;
  
  public Matrix(){
    theFont = createFont("Arial Unicode MS" , Character.CHAR_SIZE);
    textAlign(CENTER , TOP);
    textFont(theFont);
    streams = new ArrayList<Stream>();
  
    for(int x = 10; x < width; x+= 20){
      streams.add(new Stream(x));
    }
  }
  
  void display(){
    background(0);
    for(Stream s: streams){
      s.update();
    }
  }
  
}
