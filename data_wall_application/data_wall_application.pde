DataWallScreen scheduleScreen, funFactScreen;
TwitterScreen twitterScreen;

int[] states = new int[6];

int currentState;

void setup() {
  frameRate(30);
  size(1280, 800);
  background(0, 0, 0, 255);
  states[0] = 0; // start
  states[1] = 1; // twitter
  states[2] = 2; // schedule-in
  states[3] = 3; // schedule-out
  states[4] = 4; // fun fact-in
  states[5] = 5; // fun fact-out
  
  // Create each Screen  
  twitterScreen = new TwitterScreen(color(0, 255, 0), 0, 0); 
  scheduleScreen = new DataWallScreen(color(255, 0, 0), (-screenWidth+25), 0);
  funFactScreen  = new DataWallScreen(color(0, 0, 255), (screenWidth-25), 0);
  twitterScreen.drawScreen();
  scheduleScreen.drawScreen();
  funFactScreen.drawScreen();

  

}

void draw() {
  //background(0);
  twitterScreen.draw();


  
  switch(currentState){
    case 1:
    //twitterScreen.x+=(screenWidth-twitterScreen.x)*.2;
    scheduleScreen.x+=((-screenWidth+25)-scheduleScreen.x)*.2;
    break;
    
    case 2: // schedule-in
    scheduleScreen.x+=(0-scheduleScreen.x)*.2;
    break;
    
    case 3: // schedule-out
    scheduleScreen.x+=((-screenWidth+25)-scheduleScreen.x)*.2;
    break;
    
    case 4: // fun fact-in
    funFactScreen.x+=(0-funFactScreen.x)*.2;
    break;
    
    case 5: // fun fact-out
    funFactScreen.x+=((screenWidth-25)-funFactScreen.x)*.2;
    break;
    
  }
  
}

void mouseClicked(){
  if(mouseX<25){
    if(currentState!=2){
     currentState = 2;
    }else{
     currentState = 3;
    }  
  }
  
  if(mouseX>(screenWidth-25)){
    if(currentState!=4){
      currentState = 4;  
    }else{
      currentState = 5;
    }
  }
}

// 3 Modes are needed
/* Agenda mode
 Twitter mode
 fun fact mode */
