public class BootScreen {
  
  int time = 0;
  boolean end = false;
  
  void display() {
    
    background(0);
    stroke(0,255,0);
    textFont(f);
    fill(0,255,0);
    textAlign(RIGHT);
    text(time,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    textAlign(LEFT);
    if(time<540){
      if(time>=50)text("Username: admin",50,160);
      if(time>=100)text("Password: ************",50,180);
      if(time>=150)text("ACCESS TO SYSTEM",50,240);
      if(time>=180)text("Version 3.2.6",50,280);
      if(time>=200 && time<250)text("Initializing.",50,300);
      if(time>=250 && time<300)text("Initializing..",50,300);
      if(time>=300)text("Initializing...",50,300);
      fill(255,0,0);
      if(time>=370)text("System error 5 has occurred.",50,340);
      if(time>=400)text("Status: 0xc000000f",50,380);
      if(time>=430)text("Error transferring execution.",50,420);
      if(time>=460)text("Technical information:",50,460);
      if(time>=470)text("013883B4: 56AD8E3070611832   FE333A6C5BFE0779",50,480);
      if(time>=480)text("013883C4: 3C5CB0099FC36860   E63410CC52C1CCBE",50,500);
      if(time>=490)text("013883D4: 2D5A1557A1CAD913   677E41BB27D586DE",50,520);
      if(time>=500)text("013883E4: 24522C84A81872A5   4680B1738ZA5AD6E",50,540);
      if(time>=510)text("013883F4: 9CAD6ADCCE092FEF   03123457F0704DC51",50,560);
      if(time>=515)text("01388404: 8CF11582DZ27479E   15FDCC60B005658B0",50,580);
      if(time>=520)text("01388414: E35725BB1FE2487A   1FZA78147D42FZ922",50,600);
      if(time>=525)text("01388424: C6210004EC40ED42   6FF57C2FFDD40224C",50,620);
      if(time>=530)text("01388434: 3B2451A4EB805542   97BC55C197A3BC33E",50,640);
      if(time>=535)text("Access is denied",50,700);
    }else if(time<=800) {
      background(0,0,255);
      fill(255);
      text("A problem has been detected and system has been shut down to prevent damage to your computer." 
      ,50,100);
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
    }else{
      text("Oh no! Our motherboard has been damaged. Our system can no longer compute any data.",50,150);
      text("To repair this we need your help. Using binary code you need to enter server IP address.",50,170);
      text("Binary code is a system where a number is expressed in the base-2 numeral system.",50,190);
      text("It uses only zeros and ones to represent any number in the world.",50,210);
      text("Press ENTER when you will be ready to start first task.",50,250); 
      imageMode(CENTER);
      scull.resize(400,400);
      image(scull, width/2+400, height/2-150);
    }
    
  }
  
  boolean end() {
    if(keyPressed) {
      if(key==ENTER && time>800) end=true;
    }
    return end;
  }
  
  void update() {
    time++;
  }
  
}
