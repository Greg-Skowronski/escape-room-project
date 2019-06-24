public class ScopePlotter {
  public ScopeBuffer buffer;
  private int sampleCount;
  private float magnitude, threshold;
  private int plotWidth, x;
  private int plotHeight, y;
  private float xResolution;
  private TextRenderer tr;
  public ScopePlotter(int x, int y, int rectWidth, int rectHeight, int sampleCount, float magnitude, float threshold)
  {
    buffer = new ScopeBuffer(sampleCount);
    this.sampleCount = sampleCount;
    plotWidth = rectWidth;
    plotHeight = rectHeight;
    this.x = x;
    this.y = y;
    this.threshold = threshold;
    this.magnitude = magnitude;
    tr = new TextRenderer();
    xResolution = (float)rectWidth/sampleCount;
  }
  public void drawPlot(int lineColorRGBWrong, int lineColorRGBCorrect, int weight)
  {
    fill(0,0,0);
    rect(x-2,y-plotHeight-2,plotWidth+2,2*plotHeight+4);
    
    tr.writeOverwrite("0.00 [V]",x+plotWidth+8,y+6, 16, 0xffffff);
    int Rw = (int)( (lineColorRGBWrong & 0xff0000) >> 16 );
    int Gw = (int)( (lineColorRGBWrong & 0x00ff00) >> 8  );
    int Bw = (int)( (lineColorRGBWrong & 0x0000ff) >> 0  );
    int Rc = (int)( (lineColorRGBCorrect & 0xff0000) >> 16 );
    int Gc = (int)( (lineColorRGBCorrect & 0x00ff00) >> 8  );
    int Bc = (int)( (lineColorRGBCorrect & 0x0000ff) >> 0  );

    strokeWeight(weight);
    stroke(255,255,255);
    line (x,y,x+plotWidth,y);
    for(int i = 1; i < sampleCount-1; i++)
    {
      if(buffer.elements[(buffer.getPos()+ i    ) % buffer.getCapacity()]< -threshold && buffer.elements[(buffer.getPos()+ i + 1) % buffer.getCapacity()] < - threshold)
          stroke(Rc,Gc,Bc);
      else
          stroke(Rw,Gw,Bw);
      line(
          x +  i    * xResolution, y + mapPoint(buffer.elements[(buffer.getPos()+ i    ) % buffer.getCapacity()]),
          x + (i+1) * xResolution, y + mapPoint(buffer.elements[(buffer.getPos()+ i + 1) % buffer.getCapacity()])
          );
    }
    noStroke();
    fill(0,255,0);
  }
  public void addPoint(float pnt)
  {
    buffer.put(pnt);
  }
  private float mapPoint(float point)
  {
    return (float)plotHeight*point;
  }
}


public class ScopeBuffer {
  public float[] elements;
  private int pos = 0, capacity;
  public ScopeBuffer(int elementCount)
  {
    this.capacity = elementCount;
    elements = new float[elementCount];
  }
  public void put(float el)
  {
    pos = (pos+1)%capacity;
    elements[pos] = el;
  }
  public int getPos()
  {
    return pos;
  }
  public int getCapacity()
  {
    return capacity;
  }
  
}
