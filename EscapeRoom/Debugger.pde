public static class Debugger
{
  public static final String TAG_WARN = "WARNING: ";
  public static final String TAG_ERROR = "ERROR: ";
  public static final String TAG_DEBUG = "DEBUG: ";
  public static void warn(String msg)
  {
    println(TAG_WARN + msg);
  }
  public static void error(String msg)
  {
    
    println(TAG_ERROR + msg);
  }
  public static void debug(String msg)
  {
    println(TAG_DEBUG + msg);
  }
}
