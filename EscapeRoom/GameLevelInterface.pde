public interface EventListener {
  public void onEvent(GameEvent event);
  public void onKeyPress(int keycode);
  public void onMouseClick();
  
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
  public GameEvent(EventSource source, EventType type, Object args)
  {
    this.eventSource = source;
    this.eventType = type;
    this.args = args;
  }
  private EventSource eventSource;
  private EventType eventType;
  Object args;
}
