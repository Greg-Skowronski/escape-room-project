public class LoginForm extends GameLevel{

    private ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
    private boolean logged = false; // DEMO
    private Matrix matrix;
    private PFont theFont;
    
     public void updateLevel()
     {
      
         display();
     }
     public void loadLevel()
     {
       
     }
      
     public void unloadLevel()
     {
    
     }
    
     public void onEvent(GameEvent event)
     {
     
     }
     public void onKeyPress(int keycode)
     {
         for (TEXTBOX t : textboxes) {
          if (t.KEYPRESSED(key, (int)keyCode)) {
             Submit();
          }
       }
     }
     public void onMouseClick(){
       
       for (TEXTBOX t : textboxes) {
          t.PRESSED(mouseX, mouseY);
       }
     }
    
    public LoginForm(EventListener levelController) {
      
      super(levelController);
      
      frameRate(120);      
      theFont = createFont("Courier New",60,true);
      
      
     // USERNAME TEXTBOX
     TEXTBOX userTB = new TEXTBOX(width/2 , height/2-100, TEXTBOX.username);
     
     // PASSWORD TEXTBOX
     TEXTBOX passTB = new TEXTBOX(width/2, height/2 + 20, TEXTBOX.password);
     
     textboxes.add(userTB);
     textboxes.add(passTB);
     
     matrix = new Matrix();
    }


    public void display(){
    
       background(0);
       matrix.display();
       
       // LABELS
       fill(255, 255, 255);
       textSize(60);
       textFont(theFont);
       
       
       textAlign(TOP, CENTER);
       text("LOGIN FORM", (width - textWidth("LOGIN FORM")) / 2, 60);
       //text("LOGIN FORM" , width/2 , 60);
       
       
       text("Username: ", width/4, height/2 - 70);
       text("Password: ", width/4 + 5, height/2 + 50);
   
       // DRAW THE TEXTBOXES
       for (TEXTBOX t : textboxes) {
          t.DRAW();
       }
       
       fill(255,255,255);
       textSize(45);
       text("Press Enter to Login", (width - textWidth("Press Enter to Login")) / 2, 120);
       //text("Press Enter to Login", width/ 2, 120);
    }
    
    // JUST FOR DEMO
    public void Submit() {
       if (textboxes.get(0).Text.equals("BADF00D")) {
          if (textboxes.get(1).Text.equals("1234")) {
             logged = true;
             raiseEvent(new GameEvent(EventSource.PC,EventType.LEVEL_COMPLETE,null));
          } else {
             logged = false;
          }
       } else {
          logged = false;
       }
    }
    
}
