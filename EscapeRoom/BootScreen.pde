public class BootScreen extends GameLevel {
  public BootScreen(EventListener levelController) 
  { 
    super(levelController);
    Debugger.debug("BootScreen created.");
  }
  int runningAppTime = 0;
  boolean end = false;
  PFont font;
  PImage scull;
  DrawDecorations Decor = new DrawDecorations();
  public void loadLevel()
  {
    
  }
  public void unloadLevel()
  {
    
  }
  public void updateLevel()
  {
    runningAppTime++;
    display();
  }
  public void onEvent(GameEvent event)
  {
    
  }
  public void onKeyPress(int keycode)
  {
    if(keycode==ENTER) raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
  }
  public void onMouseClick(){}
  void display() {
    
    font = createFont("Courier New",16,true);
    textFont(font);
    background(0);
    fill(0,170,80);
    textAlign(RIGHT);
    text(runningAppTime,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    textAlign(LEFT);
    if(runningAppTime<540)
    {
      if(keyPressed && key==' ') runningAppTime=800;
      if(runningAppTime>=50)text("Username: admin",50,160);
      if(runningAppTime>=100)text("Password: ************",50,180);
      if(runningAppTime>=150)text("ACCESS TO SYSTEM",50,240);
      if(runningAppTime>=180)text("Version 3.2.6",50,280);
      if(runningAppTime>=200 && runningAppTime<250)text("Initializing.",50,300);
      if(runningAppTime>=250 && runningAppTime<300)text("Initializing..",50,300);
      if(runningAppTime>=300)text("Initializing...",50,300);
      fill(255,0,70);
      if(runningAppTime>=370)text("System error 5 has occurred.",50,340);
      if(runningAppTime>=400)text("Status: 0xc000000f",50,380);
      if(runningAppTime>=430)text("Error transferring execution.",50,420);
      if(runningAppTime>=460)text("Technical information:",50,460);
      if(runningAppTime>=470)text("013883B4: 56AD8E3070611832   FE333A6C5BFE0779",50,480);
      if(runningAppTime>=480)text("013883C4: 3C5CB0099FC36860   E63410CC52C1CCBE",50,500);
      if(runningAppTime>=490)text("013883D4: 2D5A1557A1CAD913   677E41BB27D586DE",50,520);
      if(runningAppTime>=500)text("013883E4: 24522C84A81872A5   4680B1738ZA5AD6E",50,540);
      if(runningAppTime>=510)text("013883F4: 9CAD6ADCCE092FEF   03123457F0704DC51",50,560);
      if(runningAppTime>=515)text("01388404: 8CF11582DZ27479E   15FDCC60B005658B0",50,580);
      if(runningAppTime>=520)text("01388414: E35725BB1FE2487A   1FZA78147D42FZ922",50,600);
      if(runningAppTime>=525)text("01388424: C6210004EC40ED42   6FF57C2FFDD40224C",50,620);
      if(runningAppTime>=530)text("01388434: 3B2451A4EB805542   97BC55C197A3BC33E",50,640);
      if(runningAppTime>=535)text("Access is denied",50,700);
    }else 
    if(runningAppTime<=800) 
    {
      background(0,0,255);
      fill(255);
      text("A problem has been detected and system has been shut down to prevent damage to your computer.",50,100);
      text("If this is the first time you've seen this stop error screen, restart your computer.",50,140);
      text("If this screen appears again, follow these steps:",50,160);
      text("Check to make sure any new hardware or software is properly installed. I this is a new installation,",50,200);
      text("ask your hardware or software manufacturer for and system updates you might need.",50,220);
      text("If problems continue, disable or remove any newly installed hardware or software. Disable BIOS",50,260);
      text("memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable",50,280);
      text("components, restart your computer, press F8 to select Advanced Startup Options,",50,300);
      text("and then select Safe Mode.",50,320);
      text("Technical information:",50,360);
      text("*** STOP: 0x000000FE (0x00000008, 0x000000006, 0x00000009, 0x847075cc)",50,400);
    }else
    {
      text("Oh no! Our motherboard has been damaged. Our system can no longer compute any data.",50,150);
      text("To repair this we need your help. Using binary code you need to fix the problems.",50,170);
      text("Binary code is a system where a number is expressed in the base-2 numeral system.",50,190);
      text("It uses only zeros and ones to represent any number in the world.",50,210);
      text("Press ENTER when you will be ready to start first task.",50,230); 
      imageMode(CENTER);
      scull = loadImage("scull.png");
      scull.resize(400,400);
      image(scull, width/2+400, height/2-150);
      Decor.display();
      Decor.update();
    }
  }  
}

class DrawDecorations {
  float sinAngle=0, sinMoved=0, sinYcoord, sinFreq=1, sinRadius=100;
  float radius=100, angle=0;
  void display() {
    stroke(0,170,80);
    for (int i = 0; i<500; i++)
    {
      sinYcoord = 75 + sin(radians(sinAngle))*(sinRadius);
      if(i%10==0)line(100+i, sinYcoord+350,100+i,530);
      sinAngle -= sinFreq;
    }
    line(100,320,100,530);
    line(100,530,600,530);
    sinAngle=sinMoved;
    noFill();
    circle(width/2+150,700,radius*2);
    line(width/2+150,700,width/2+150+cos(radians(angle))*(radius),700+sin(radians(angle))*(radius));
    circle(width/2-150,700,radius*2);
    line(width/2-150,700,width/2-150+cos(radians(-angle*3/2))*(radius),700+sin(radians(-angle*3/2))*(radius));
  }
  void update() {
    sinMoved=sinMoved+5;
    angle++;
  }
}
