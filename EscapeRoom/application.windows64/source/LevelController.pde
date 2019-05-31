public class LevelController implements EventListener {
  int levelCount = 3;
  Class[] levelClasses = {LoadingScreen.class, BootScreen.class, BinaryRiddle.class};  
  private int currentGameLevelID = 0;
  private GameLevel currentLevel;
  public void update()
  {
    if(currentLevel!=null)
      currentLevel.updateLevel();
  }
  public void loadNextLevel()
  {
   loadLevel(currentGameLevelID++);
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
      currentLevel = (GameLevel)levelClasses[levelID].getConstructor().newInstance();
      currentLevel.loadLevel();
    }
    catch( Exception ex)
    {
      Debugger.error("Cannot create GameLevel object in LevelController. Undefined behaviour and crashing might occur.");
    }
  }
  public void onEvent(GameEvent event)
  {
    
  }
}
