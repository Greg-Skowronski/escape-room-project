public class PowerPuzzle extends GameLevel {
  final int sampleCount = 64;
  final float threshold = 0.0f;
  final int period = 1000;
  final float magnitude = 5.0f;
  PImage plug;
  final char[] loadingSigns = {'/', '-', '\\', '|' };
  final String[] ipAdresses = {"11:420:69", "88:911:42", "88:911:42", "88:911:42"};
  int time = 0;
  ScopePlotter plotter;
  int signalState = -1;
  FunctionGenerator[] generators = new FunctionGenerator[] {
    new NoiseGenerator(period,0.05f), 
    new NoiseGenerator(period,0.05f), 
    new SineGenerator(period),
    new HalfRectSineGenerator(period,0.02f), 
    new StableHalfRectSineGenerator (period,0.02f,0.0001f),
    new FullRectSineGenerator(period,0.04f),
    new StableFullRectSineGenerator (period,0.04f,1.01f), 
  };
  public PowerPuzzle(EventListener levelController) 
  { 
     super(levelController);
     plug = loadImage("plug-in.png");
    imageMode(CENTER);
    plug.resize(256,256);
  }  
  public void updateLevel()
  {
    boolean areAllSamplesAboveThreshold = true;
    for(int i = 0; i < sampleCount; i++)
    {
      if(plotter.buffer.elements[i]<threshold)
      {
        areAllSamplesAboveThreshold = false;
        break;
      }
    }
    if(areAllSamplesAboveThreshold)
    {
      raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
    }
    time++;
    if(signalState<0)
    {
      background(0);
      image(plug, width/2, height/2);
      return;
    }
    
    float pnt = -(float)generators[signalState].Generate((double)time/FRAMERATE*1000);
    //print("\r"+pnt);
    plotter.addPoint(pnt);
    plotter.drawPlot(0xff0000,0x00ff00,2);
    textSize(32);
    textRenderer.writeOverwrite("INPUT VOLTAGE UNSTABLE", (int)(width/2-textWidth("INPUT VOLTAGE UNSTABLE")/2), 40,32, 0x00ff00);
    textRenderer.writeOverwrite("BOOT IMPOSSIBLE", (int)(width/2-textWidth("BOOT IMPOSSIBLE")/2), 80,32, 0x00ff00);
   
  }
  public void loadLevel() 
  {
    background(0);
    fill(0,255,0);
    textFont(f);
    int scWidth = 3*width/4;
    int scHeight = height/4;
    plotter = new ScopePlotter(width/2-scWidth/2, height/2, scWidth, scHeight, sampleCount, magnitude, threshold);

  }
  public void onKeyPress(int keycode)
  {
    
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
   if(event.eventType == EventType.SERIAL_INPUT)
   {
     signalState = (char)event.args - 0x30;
   }
  }
}
