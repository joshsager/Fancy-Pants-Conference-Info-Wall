class DataWallScreen{
  int x=0;
  int y=0;
  color c;
 
  DataWallScreen(color cl, int xp, int yp){
   x = xp;
   y = yp;
   c = cl;
   println("Screen has been created" );
   smooth();
  
  }

  void drawScreen(){
   fill(c);
   rect(x,y,screenWidth,screenHeight); 
  }
  
  void draw(){
    translate(x,y);
  }
}
