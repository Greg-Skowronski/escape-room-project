import processing.serial.*;
import java.util.concurrent.*;
public class SerialController {
  public static final String DEFAULT_PORTNAME = "COM19";
  public static final int DEFAULT_BAUDRATE = 9600;
  public static final int BUFFER_SIZE = 32;
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
    while(serial.available()>0 && serial.readChar() != MESSAGE_POSTAMBLE);
    while(true)
    {
      String buffer = "";
      
      while(serial.available()>0)
      {
        Debugger.debug("BUFFER:"+buffer);
        char readChar = serial.readChar();
        print(readChar);
        buffer += readChar;
        if(readChar == MESSAGE_POSTAMBLE && buffer.length() > MESSAGE_PREAMBLE.length())
        {
          Debugger.debug("MESSAGE BUILT");
          SerialMessage m = formMessageFromBuffer(buffer);
          if(m!=null)
            incomingQueue.add(m);
          buffer = "";
        }
        else if(buffer.length() >= BUFFER_SIZE)
          buffer = "";
      }
    }
  }
  private SerialMessage formMessageFromBuffer(String origBuffer)
  {
    String buffer = origBuffer;
    int startPoint = buffer.indexOf(MESSAGE_PREAMBLE);
    if(startPoint<0)
      return null;
    buffer = buffer.substring(startPoint,buffer.length());
    int endPoint = buffer.indexOf(MESSAGE_POSTAMBLE);
    if(endPoint<0)
      return null;
    buffer = buffer.substring(0,endPoint);
    int type = buffer.charAt(MESSAGE_PREAMBLE.length()) - 0x30; // shift from ascii to decimal for digits
    Object args = null;
    switch(SerialInputMessageTypeValues[type])
    {
      case ANALOG_READ:
        args = Integer.parseInt(buffer.substring(MESSAGE_PREAMBLE.length() + 1,buffer.length()-1));
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
public static final char MESSAGE_POSTAMBLE = '\n';
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
