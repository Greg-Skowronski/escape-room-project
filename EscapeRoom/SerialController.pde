import processing.serial.*;
import java.util.concurrent.*;
public class SerialController {
  public static final String DEFAULT_PORTNAME = "COM19";
  public static final int DEFAULT_BAUDRATE = 9600;
  Serial serial;
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
      int messageType = 0;
      String preambleBuffer = "";
      String argumentBuffer = "";
      boolean recievingMessage = false;
      while(serial.available()>0)
      {
        if(!recievingMessage)
        {
          if(preambleBuffer == MESSAGE_PREAMBLE)
          {
            recievingMessage = false;
            messageType = serial.read();
          }
          else if (preambleBuffer.length()>=3)
            preambleBuffer = "";
          else
            preambleBuffer += serial.readChar();
        }
        else
        {
          char readChar = serial.readChar();
          if(readChar == MESSAGE_ENDING_CHAR)
          {
            incomingQueue.add(formMessageFromBuffer(messageType, argumentBuffer));
            argumentBuffer = "";
            preambleBuffer = "";
            recievingMessage = false;
          }
          else
            argumentBuffer += readChar;
        }
      }
    }
  }
  private SerialMessage formMessageFromBuffer(int type, String buffer)
  {
    Object args = null;
    switch(SerialInputMessageTypeValues[type])
    {
      case ANALOG_READ:
        args = Integer.parseInt(buffer);
      break;
      default:
      case NO_MESSAGE:
        return null;
    //break;
    }
    return new SerialMessage(true, type, args);
  }
}
public static final SerialInputMessageType[] SerialInputMessageTypeValues = SerialInputMessageType.values();
public enum SerialInputMessageType 
{
  NO_MESSAGE,
  ANALOG_READ, 
}
public static final char MESSAGE_ENDING_CHAR = '\n';
public static final String MESSAGE_PREAMBLE = "msg";
public class SerialMessage 
{
  public SerialMessage(boolean fromSerial, int type, Object args)
  {
    this.isFromSerial = fromSerial;
    this.messageType = type;
    this.args = args;
  }
  boolean isFromSerial;
  int messageType;
  Object args;
}
