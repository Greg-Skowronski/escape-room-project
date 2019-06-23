public class PowerPuzzle extends GameLevel {
  final char[] loadingSigns = {'/', '-', '\\', '|' };
  final String[] ipAdresses = {"11:420:69", "88:911:42", "88:911:42", "88:911:42"};
  int time = 0;
  ScopePlotter plotter;
  public PowerPuzzle(EventListener levelController) 
  { 
    super(levelController);
  }  
  public void updateLevel()
  {
    time++;
    plotter.drawPlot(0xffffff,2);
    if(time<60*5)
    {
      //background(0);
      text(String.format("Routing complete."), 50, 200);
      text(String.format("Establishing mainframe connection: [%s] ", (time>60*3.25)?"OK":loadingSigns[(time/5)%4] ), 50, 220);
      for(int i = 0; i< 4; i++)  
      {
        text(String.format("Connecting to %s [%s]", ipAdresses[i], (time<i*60)?loadingSigns[(time/5)%4]:"OK" ), 50, 240+i*20);
      }
    }
    else if(time < 60 * 8)
    {
      textRenderer.writeOverwrite("Nodes activated [4/4]",50,320,16, 0x00ff00);
    }
    else if (time < 60 * 10)
    {
      textRenderer.writeOverwrite(String.format("Recursive BCD look-up table activated: [%s] ", (time<60*9.5)?loadingSigns[(time/5)%4]:"OK" ), 50, 340, 16, 0x00ff00);
    }
    else
    {
      int subTime = 25;
      textRenderer.writeOverwrite("Attempting basic boot: ",50, 360, 16, 0x00ff00);
      String result = (time<60*subTime) ? ("["+loadingSigns[(time/5)%4]+"]") : "[FAILED]";
      textRenderer.writeOverwrite(result, (int)(50 + textWidth("Attempting basic boot: ")), 360, 16, (time<60*subTime) ? 0x00ff00 : 0xff0000);
      //if(time<60 * subTime)
      {
        int yPos = 380;
        textRenderer.writeOverwrite("Checking power supply: ",50, yPos, 16, 0x00ff00);
        String opCode = (time<60*subTime) ? ("["+ String.format("%.2f", 5*Math.sin((double)time/FRAMERATE*0.5*2*Math.PI)) +" V] ") : "[AC DETECTED]";
        textRenderer.writeOverwrite(opCode, (int)(50 + textWidth("Checking power supply: ")), yPos, 16, (time<60*subTime) ? 0x00ff00 : 0xff0000);
      }
      
    }
  }
  public void loadLevel() 
  {
    background(0);
    fill(0,255,0);
    textFont(f);
    plotter = new ScopePlotter(600, 500, 100, 100, 4, 1023, 0);

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
      plotter.addPoint((int)((SerialMessage)event.args).args);
    }
  }
}
