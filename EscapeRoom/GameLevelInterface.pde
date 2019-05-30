public interface GameLevel {
  public void updateLevel();
  public void loadLevel();
  public void unloadLevel();
  public void onEvent(GameEvent event);
}
enum EventSource {
  PC,
  ARDUINO
}
public class GameEvent {
  private EventSource eventSource;
  
  Object args;
}
