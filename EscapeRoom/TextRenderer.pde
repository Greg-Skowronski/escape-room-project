class Rectangle {
  public Rectangle(int x, int y, int x1, int y1)
  {
    this.x = x;
    this.x1 = x1;
    this.y = y;
    this.y1 = y1;
    
  }
  int x, y, x1, y1;
}
public class TextRenderer {
  public void writeOverwrite(String text, int x, int y, int textSize, PFont font, int ARGBColor)
  {
    byte R = (byte)( (ARGBColor & 0x00ff0000) >> 16 );
    byte G = (byte)( (ARGBColor & 0x0000ff00) >> 8  );
    byte B = (byte)( (ARGBColor & 0x000000ff) >> 0  );
    byte A = (byte)( (ARGBColor & 0xff000000) >> 20 );
    int[] rectDimensions = getTextRectangleDimensions(text);
    fill(0);
    rect(x,y,rectDimensions[0],rectDimensions[1]);
    fill(R,G,B,A);
    textFont(font);
    textSize(textSize);
    text(text,x,y);
  }
  public void writeOverwrite(String text, int x, int y, int textSize, int RGBColor)
  {
    int R = (int)( (RGBColor & 0xff0000) >> 16 );
    int G = (int)( (RGBColor & 0x00ff00) >> 8  );
    int B = (int)( (RGBColor & 0x0000ff) >> 0  );
    int[] rectDimensions = getTextRectangleDimensions(text);
    fill(0);
    textSize(textSize);
    rect(x,y-rectDimensions[1]*textSize+textDescent(),textWidth(text),textDescent()+textAscent());
    fill(R,G,B);
    
    text(text,x,y);
  }
  private int[] getTextRectangleDimensions(String str)
  {
   String[] lines = str.split("\r\n|\r|\n");
   int longestLine = lines[0].length();
   for(String s : lines)
   {
     if(s.length()>longestLine)
       longestLine = s.length();
   }
   return new int[] {longestLine, lines.length};
  }
}
