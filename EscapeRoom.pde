import processing.serial.*;

PFont f;
PImage scull;
int boot=0;
int time=0;
int programmingPart=0; //0-introduction; 1-binary_taks
String input="";
int correct=0;
Serial arduinoPort;


void setup() {
  //fullScreen();
  size(1280,720); //1280
  noCursor();
  frameRate(60);
  f = createFont("Courier New",16,true);
  scull = loadImage("scull.png");
  
  
  arduinoPort = new Serial(this, Serial.list()[0], 9600);
  thread("readPort");
  
}

void draw() {
  
  background(0);
  if(boot<=200){
    background(0);
    fill(0,255,0);
    textFont(f);
    textAlign(CENTER);
    text("loading...",width/2,height/2-30);
    rect(width/2-200,height/2-20,boot*2,40);
  }
  else{
    background(0);
    stroke(0,255,0);
    textFont(f);
    fill(0,255,0);
    textAlign(RIGHT);
    text(boot,width-50,100);
    textAlign(CENTER);
    text("<c> 2019 SciRun Corporation.",width/2,100);
    textAlign(LEFT);
    text(day()+"-"+month()+"-"+year(),50,100);
    
    //binary system
    if(programmingPart==0){
      textAlign(LEFT);
      if(boot<740){
        if(boot>=250)text("Username: admin",50,160);
        if(boot>=300)text("Password: ************",50,180);
        if(boot>=350)text("ACCESS TO SYSTEM",50,240);
        if(boot>=380)text("Version 3.2.6",50,280);
        if(boot>=400 && boot<450)text("Initializing.",50,300);
        if(boot>=450 && boot<500)text("Initializing..",50,300);
        if(boot>=500)text("Initializing...",50,300);
        fill(255,0,0);
        if(boot>=570)text("System error 5 has occurred.",50,340);
        if(boot>=600)text("Status: 0xc000000f",50,380);
        if(boot>=630)text("Error transferring execution.",50,420);
        if(boot>=660)text("Technical information:",50,460);
        if(boot>=670)text("013883B4: 56AD8E3070611832   FE333A6C5BFE0779",50,480);
        if(boot>=680)text("013883C4: 3C5CB0099FC36860   E63410CC52C1CCBE",50,500);
        if(boot>=690)text("013883D4: 2D5A1557A1CAD913   677E41BB27D586DE",50,520);
        if(boot>=700)text("013883E4: 24522C84A81872A5   4680B1738ZA5AD6E",50,540);
        if(boot>=710)text("013883F4: 9CAD6ADCCE092FEF   03123457F0704DC51",50,560);
        if(boot>=715)text("01388404: 8CF11582DZ27479E   15FDCC60B005658B0",50,580);
        if(boot>=720)text("01388414: E35725BB1FE2487A   1FZA78147D42FZ922",50,600);
        if(boot>=725)text("01388424: C6210004EC40ED42   6FF57C2FFDD40224C",50,620);
        if(boot>=730)text("01388434: 3B2451A4EB805542   97BC55C197A3BC33E",50,640);
        if(boot>=735)text("Access is denied",50,700);
      }else if(boot<=1000){
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
    
    if(programmingPart==1){
      time++;
      if(time%1500==0) { correct=0; input="";}
      text("To reconnect with the server you need to correct corrupted data information.",50,200);
      text("Software Development Team has left a note which explains how to convert ",50,220);
      text("decimal number to binary. Using this note and your knownledge rewrite ",50,240);
      text("following data and replace every decimal number by its binary number equivalent.",50,260);
      text("Use ENTER to confirm or BACKSPACE to delete. ",50,280);
      text("You have 2 minutes to answer all questions or the connection will be lost",50,300);
      text("and you will need to start once again. Good luck and be careful!",50,320);
      
      switch(correct){
        case 0:{
          fill(255,0,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 1:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          fill(255,0,0);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/",50,520);
          text("H8KG.HT4Z.4XXC",50,600);
          break;
        }
        case 2:{
          fill(0,255,0);
          text("ADE3.GHE1.11DA",50,400);
          text("C:/ >>ADE0011.GHE0001.1011DA",50,420);
          text("ET9L.2CTH.7DZX",50,500);
          text("C:/ >>ET1001L.0010CTH.0111DZX",50,520);
          fill(255,0,0);
          text("H8KG.HT4Z.4XXC",50,600);
          text("C:/",50,620);
          break;
        }
        case 3:{
          background(0);
          break;
        }
      }
      text(input,80,420+correct*100);
    }
    
  }
  boot++;
  
}

void keyPressed(){
  if(programmingPart==0){
    if(key == ENTER && boot>=1000) programmingPart=1;
  }else if(programmingPart==1){
    if (key == BACKSPACE) {
      if (input != null && input.length() > 0) {
        input = input.substring(0, input.length() - 1);
    }
  }else
    if (key == ENTER){
      if(input.equals("§") || (correct==0 && input.equals("ADE0011.GHE0001.1011DA")) || (correct==1 && input.equals("ET1001L.0010CTH.0111DZX")) || (correct==2 && input.equals("H1000KG.HT0100Z.0100XXC")))
        correct++;
        input="";
      }else if(keyCode!=SHIFT && keyCode!=CONTROL && keyCode!=ALT) input+=key;
  }
}


void readPort(){
  
  
  
  System.out.println("Work");
  while(true){
    while(arduinoPort.available() > 0){
      String res = arduinoPort.readString();
      System.out.print(res);
    }
    delay(1000);
    System.out.println("Work done");
  }
    
  
 
  
}
