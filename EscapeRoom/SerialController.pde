import processing.serial.*;
import java.util.concurrent.*;
import java.util.HashMap;
import java.util.*;
public class SerialController {
  public static final String DEFAULT_PORTNAME = "COM14";
  public static final int DEFAULT_BAUDRATE = 9600;
  public static final int BUFFER_SIZE = 32;
  Serial serial;
  char lastChar = 0;
  ConcurrentLinkedQueue<SerialMessage> incomingQueue;
  public SerialController(PApplet app, ConcurrentLinkedQueue<SerialMessage> incomingQueue, String portName, int baudrate)
  {
    try 
    {
      serial = new Serial(app, portName, baudrate);
    }
    catch(RuntimeException e)
    {
      Debugger.error("Cannot open serial port. " + e.toString());
    }
    this.incomingQueue = incomingQueue;
  }
  public SerialMessage getMessage()
  {
    return incomingQueue.poll();
  }
  public void readContinous()
  {
    while(true)
    {
      if(serial.available()>0)
      {
          char readChar = serial.readChar();
          print(readChar);
          if(readChar>= '0' && readChar <= '6')
          {
            
            if(lastChar != readChar)
            {
              lastChar = readChar;
              SerialMessage m = new SerialMessage(readChar);
              incomingQueue.add(m);
            }
          }
      }
    }
  }
}



public class SerialMessage 
{
  public final char 
    NO_MESSAGE = '0',
    NO_SIG = '1',
    FULL_SIN = '2',
    HALF_SIN = '3',
    HALF_SIN_STABLE = '4',
    ABS_SIN = '5',
    ABS_SIN_STABLE = '6';
  public SerialMessage(char type)
  {
    this.messageType = type;
  }
  char messageType;
}
