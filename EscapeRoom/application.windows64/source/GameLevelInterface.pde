public interface EventListener {
  public void onEvent(GameEvent event);
}
public abstract class GameLevel implements EventListener {
  public GameLevel(EventListener levelController)
  {
    this.levelController = levelController;
  }
  EventListener levelController;
  public abstract void updateLevel();
  public abstract void loadLevel();
  public abstract void unloadLevel();
  //public abstract void onKeyPress();
  public void raiseEvent(GameEvent event)
  {
    levelController.onEvent(event);
  }
}

enum EventSource {
  PC,
  ARDUINO
}
enum EventType {
  LEVEL_COMPLETE,
  
}
public class GameEvent {
  //private EventSource eventSource;
  //private EventType eventType;
  Object args;
}
