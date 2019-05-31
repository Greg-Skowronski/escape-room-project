public class LoginForm extends GameLevel{

    ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
    boolean logged = false; // DEMO
    
    public void updateLevel(){
    
       display();
    }
    public void loadLevel(){
     
    }
    
    public void unloadLevel(){
  
    }
    
     public void onEvent(GameEvent event){
     
     }
     public void onKeyPress(int keycode){
      
     }
     public void onMouseClick(){
       
     }
    
    public LoginForm(EventListener levelController) {
      
      super(levelController);
      
     // USERNAME TEXTBOX
     TEXTBOX userTB = new TEXTBOX(width/2 , height/2-100);
     
     // PASSWORD TEXTBOX
     TEXTBOX passTB = new TEXTBOX(width/2, height/2 + 20);
     
     textboxes.add(userTB);
     textboxes.add(passTB);
    }


    public void display(){
    
       background(0);
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
    
    
    public void mousePressed() {
       for (TEXTBOX t : textboxes) {
          t.PRESSED(mouseX, mouseY);
       }
    }

    // JUST FOR DEMO
    public void Submit() {
       if (textboxes.get(0).Text.equals("BADF00D")) {
          if (textboxes.get(1).Text.equals("1234")) {
             logged = true;
          } else {
             logged = false;
          }
       } else {
          logged = false;
       }
    }

    public void keyPressed() {
       for (TEXTBOX t : textboxes) {
          if (t.KEYPRESSED(key, (int)keyCode)) {
             Submit();
          }
       }
    }
}