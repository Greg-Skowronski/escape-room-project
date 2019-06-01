public class PowerPuzzle extends GameLevel {
  final char[] loadingSigns = {'/', '-', '\\', '|' };
  final String[] ipAdresses = {"11:420:69", "88:911:42", "88:911:42", "88:911:42"};
  int time = 0;
  public PowerPuzzle(EventListener levelController) 
  { 
    super(levelController);
  }  
  public void updateLevel()
  {
    time++;
    if(time<60*5)
    {
      background(0);
      text(String.format("Routing complete."), 50, 200);
      text(String.format("Establishing mainframe connection: [%s] ", (time>60*3)?"OK":loadingSigns[(time/5)%4] ), 50, 220);
      for(int i = 0; i< 4; i++)  
      {
        text(String.format("Connecting to %s [%s]", ipAdresses[i], (time<i*60)?loadingSigns[(time/5)%4]:"OK" ), 50, 240+i*20);
      }
    }
    else if(time < 60*10)
    {
      textRenderer.writeOverwrite("Nodes active [4/4]. Starting automatic system restore.",50,320,16, 0x00ff00);
    }
    else
    {
      textRenderer.writeOverwrite(String.format("Automatic BCD look-up table restoration: [%s] ", (time<60*13)?loadingSigns[(time/5)%4]:"OK" ),50, 340, 16, 0x00ff00);
    }
  }
  public void loadLevel() 
  {
    background(0);
    fill(0,255,0);
    textFont(f);

    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete. Arrow keys will move between entries. ",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
  }
  public void onKeyPress(int keycode)
  {
    
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
