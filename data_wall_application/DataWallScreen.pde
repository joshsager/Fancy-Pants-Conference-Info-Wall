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
   if(c!=0){ 
   fill(0);
   rect(x,y,screenWidth,screenHeight); 
   }
  }
  
  void draw(){
    translate(x,y);
  }
}
