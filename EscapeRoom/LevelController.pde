public class LevelController implements EventListener {
  
  int levelCount = 4;
  Class[] levelClasses = {LoginForm.class ,LoadingScreen.class, BootScreen.class, BinaryRiddle.class};  
  private int currentGameLevelID = 0;
  private GameLevel currentLevel;
  private EscapeRoom er;
  public void onKeyPress(int keycode)
  {
    if(currentLevel!=null)
    {
      currentLevel.onKeyPress(keycode);
    }
  }
  
  public void onMouseClick(){
    
    if(currentLevel!=null)
    {
      currentLevel.onMouseClick();
    }
  }
  
  public LevelController(EscapeRoom er)
  {
    this.er = er;
  }
  public void update()
  {
    if(currentLevel!=null)
    {
      currentLevel.updateLevel();
    }
    else
    {
      Debugger.debug("currentLevel is null");
    }
  }
  public void loadNextLevel()
  {
   loadLevel(currentGameLevelID+1);
  }
  public void loadLevel(int levelID)
  {
    if(levelID>=levelCount)
    {
      Debugger.error(String.format("levelID({0}) cannot be greater than levelCount({1}). Levels not changed.",levelID,levelCount));
      return;
    }
    if(currentLevel != null)
      currentLevel.unloadLevel();
    currentGameLevelID = levelID;
    try 
    {
      Constructor<?> constructor = levelClasses[levelID].getConstructor(EscapeRoom.class, EventListener.class);
      currentLevel = (GameLevel)constructor.newInstance(er,this);
      Debugger.debug(currentLevel.toString());
      currentLevel.loadLevel();
    }
    catch(Exception ex)
    {
      Debugger.error("Cannot create GameLevel object in LevelController. Undefined behaviour and crashing might occur.\n"
      + ex.toString());
      
    }
  }
  public void onEvent(GameEvent event)
  {
    if(event.eventType == EventType.LEVEL_COMPLETE)
    {
      loadNextLevel();
    }
  }
}
