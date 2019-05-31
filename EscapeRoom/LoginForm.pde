public class LoginForm extends GameLevel{

    private ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
    private boolean logged = false; // DEMO
    private Matrix matrix;
    
    
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
      
     // USERNAME TEXTBOX
     TEXTBOX userTB = new TEXTBOX(width/2 , height/2-100);
     
     // PASSWORD TEXTBOX
     TEXTBOX passTB = new TEXTBOX(width/2, height/2 + 20);
     
     textboxes.add(userTB);
     textboxes.add(passTB);
     
     matrix = new Matrix();
    }


    public void display(){
    
       background(0);
       matrix.display();
       
       fill(0,255,0);
       
       // LABELS
       fill(0, 255, 0);
       textSize(30);
       text("LOGIN FORM", (width - textWidth("LOGIN FORM")) / 2, 60);
       
       
       text("Username: ", width/4, height/2 - 70);
       text("Password: ", width/4 + 5, height/2 + 50);
   
       // DRAW THE TEXTBOXES
       for (TEXTBOX t : textboxes) {
          t.DRAW();
       }
       
       // JUST FOR DEMO (DO NOT EVER DO THAT!)
       if (logged) {
          fill(250, 250, 250);
          text("YOU ARE LOGGED IN!", (width - textWidth("YOU ARE LOGGED IN")) / 2, 230);
       }
       
       fill(255,255,255);
       textSize(45);
       text("Press Enter to Login", (width - textWidth("Press Enter to Login")) / 2, 120);
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
