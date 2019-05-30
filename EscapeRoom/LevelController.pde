public class LevelContorller {
  private GameLevel currentLevel;
  public void update()
  {
    if(currentLevel!=null)
      currentLevel.updateLevel();
  }
  public void loadNextLevel()
  {
   
  }
  

}
