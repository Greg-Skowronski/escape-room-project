public class PowerPuzzle extends GameLevel {
  public PowerPuzzle(EventListener levelController) 
  { 
    super(levelController);
  }  
  PFont font;
  public void updateLevel()
  {
    
  }
  public void loadLevel() 
  {
    background(0);
    fill(0,255,0);
    font = createFont("Courier New",16,true);
    textFont(font);
    text("Routing complete. Automatically rebuilding look-up tables.",50,200);
    text("Cannot parse IP address [6/94]. Automatic reencoding failure.",50,220);
    text("Binary Coded Decimal lookup tables corruption detected [84% instability].",50,240);
    text("Manual encoding required. Refer to the Operations Manual, pages 219-221.",50,260);
    text("Use ENTER to confirm or BACKSPACE to delete. Arrow keys will move between entries. ",50,280);
    text("Corrupt entries have been marked with [####].",50,300);
  }
  public void onKeyPress(int keycode)
  {
    
  }
  public void onMouseClick()
  {
  
  }
  public void unloadLevel()
  {
    
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
