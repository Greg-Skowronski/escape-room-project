public class ScopePlotter {
  private ScopeBuffer buffer;
  private int sampleCount;
  private int max;
  private int min;
  private int plotWidth, x;
  private int plotHeight, y;
  private float xResolution;
  public ScopePlotter(int x, int y, int rectWidth, int rectHeight, int sampleCount, int max, int min)
  {
    buffer = new ScopeBuffer(sampleCount);
    this.max = max;
    this.min = min;
    this.sampleCount = sampleCount;
    plotWidth = rectWidth;
    plotHeight = rectHeight;
    this.x = x;
    this.y = y;
    xResolution = (float)rectWidth/sampleCount;
  }
  public void drawPlot(int lineColorRGB, int weight)
  {
    fill(0,255,0);
    rect(x,y,plotWidth,plotHeight);
    int R = (int)( (lineColorRGB & 0xff0000) >> 16 );
    int G = (int)( (lineColorRGB & 0x00ff00) >> 8  );
    int B = (int)( (lineColorRGB & 0x0000ff) >> 0  );
    stroke(R,G,B);
    strokeWeight(weight);
    for(int i = 0; i < sampleCount-1; i++)
    {
      line(
          x +  i    * xResolution, y + mapPoint((int)buffer.elements[(buffer.getPos()+ i    ) % buffer.getCapacity()]),
          x + (i+1) * xResolution, y + mapPoint((int)buffer.elements[(buffer.getPos()+ i + 1) % buffer.getCapacity()])
          );
    }
    noStroke();
    fill(0,255,0);
  }
  public void addPoint(int pnt)
  {
    buffer.put(pnt);
  }
  private float mapPoint(int point)
  {
    return (float)plotHeight*(point-min)/(max-min);
  }
}


public class ScopeBuffer {
  public int[] elements;
  private int pos = 0, capacity;
  public ScopeBuffer(int elementCount)
  {
    this.capacity = elementCount;
    elements = new int[elementCount];
  }
  public void put(int el)
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
