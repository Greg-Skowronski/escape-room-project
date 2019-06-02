public class TEXTBOX {
   
   PFont textFont;
    //private final int ID;
   public static final int password = 1;
   public static final int username = 0;
   private final int ID;
   private String hiddenPassword = "";
  
   private final int H = 65, W = 300;
   private final int X, Y;
   private final int TEXTSIZE = 60;
   
   // COLORS
   private final color Background = color(0,0,0);
   private final color Foreground = color(255, 255, 255);
   private final color BackgroundSelected = color(45,45,45);
   private final color Border = color(255, 255, 255);
   
   private boolean BorderEnable = true;
   private final int BorderWeight = 1; //3;
   
   public String Text = "";
   public int TextLength = 0;

   private boolean selected = false;
   
   TEXTBOX(int x, int y, int id){
     this.X = x;
     this.Y = y;
     this.ID = id;
     textFont = createFont("Courier New", 45 ,true);
   }
   
   void DRAW() {
      // DRAWING THE BACKGROUND
      if (selected) {
         fill(BackgroundSelected);
      } else {
         fill(Background);
      }
      
      if (BorderEnable) {
         strokeWeight(BorderWeight);
         stroke(Border);
      } else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      // DRAWING THE TEXT ITSELF
      textFont(textFont);
      fill(Foreground);
      textSize(TEXTSIZE);
      textAlign(LEFT, TOP);
      
      if(ID == password){
        text(hiddenPassword, X, Y);
      }else{
        text(Text, X, Y);
      }
      
   }
   
   // IF THE KEYCODE IS ENTER RETURN 1
   // ELSE RETURN 0
   boolean KEYPRESSED(char KEY, int KEYCODE) {
      if (selected) {
         if (KEYCODE == (int)BACKSPACE) {
            BACKSPACE();
         } else if (KEYCODE == 32) {
            // SPACE
            addText(' ');
         } else if (KEYCODE == (int)ENTER) {
            return true;
         } else {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(KEY);
            }
         }
      }
      
      return false;
   }
   
   private void addText(char text) {
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      final int maxTextLength = 9; // for this length all the characters are inside the box, must be changed if the width changes
      if( (TextLength+1) < maxTextLength){
        Text += text;
        if(ID == password){
          hiddenPassword += "*";
        }
        TextLength++;
      }
      
   }
   
   private void BACKSPACE() {
     
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         println(Text);
         if(ID == password){
          hiddenPassword = hiddenPassword.substring(0, TextLength - 1);
         }
         TextLength--;
      }
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE TEXTBOX
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
