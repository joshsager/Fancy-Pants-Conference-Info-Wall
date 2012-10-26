DataWallScreen scheduleScreen, funFactScreen;
TwitterScreen twitterScreen;

// GOOGLE SPREADSHEET STUFFS
SimpleSpreadsheetManager sm;
String sUrl = "0AiYWOG29i_JhdFR0VTFGTHlxZEh2d0l2T2hwRHljZnc";
String googleUser = "";
String googlePass = "";
int totalEntries;
// END GOOGLE SPREADSHEET STUFFS

int[] states = new int[6];

int counter=0;
int mod=300;

int currentState;

void setup() {
  frameRate(30);
  size(1280, 800);
  background(0, 0, 0, 255);
  states[0] = 0; // start
  states[1] = 1; // twitter
  states[2] = 2; // schedule
  
  
  currentState = 1;
  
  // Create each Screen   
  if(currentState==1);
  twitterScreen = new TwitterScreen(color(0, 0, 0), 0, 0); 
  //scheduleScreen = new DataWallScreen(color(255, 0, 0), (-screenWidth+25), 0);
  //funFactScreen  = new DataWallScreen(color(0, 0, 255), (screenWidth-25), 0);



///////////////////////////////////
//This is the Google spreadsheet manager and the id of the spreadsheet that we want to populate, along with our Google username & password

  

 
//load in our super secret info from our super secret text file
String lines[] = loadStrings("supersecret.txt");
for (int i=0; i < lines.length; i++) {
  googleUser = lines[4];
  googlePass = lines[5];

};

 int[] numbers = getNumbers();




//////////////////////////////////

  

}


void mousePressed() {
int[] numbers = getNumbers();
if(currentState==1){
    counter =0;
  mod=25; 
   currentState=2; 
}else{
    counter =0;
  mod=300; 
    twitterScreen = new TwitterScreen(color(0, 0, 0), 0, 0); 
   currentState = 1; 
}

}

void outputSchedule(){
  
  PFont headline;
      fill(255);
      headline = createFont("SansSerif",255);
      textFont(headline,40);
      text("Web Design Day Schedule", 75, (10), 1200, 200);  // Text wraps within text box 
  
    for(int i=0; i<totalEntries; i++)
{  
  String startTime = sm.getCellValue("StartTime", i);
  String endTime = sm.getCellValue("EndTime", i);
  String session = sm.getCellValue("SessionInfo", i);
  String speaker = sm.getCellValue("Speaker", i);
  String complete = sm.getCellValue("complete", i);
  
  if(speaker==null){
    speaker ="";
  }else{
    session +=" by"; 
  }
  
  
  
  
 String message = startTime + "-" + endTime + " " + session + " " +speaker;
  
      PFont myFont;
      if(complete!=null){
        fill(255,50);
      }else{
        fill(255);
      }
      
      myFont = createFont("SansSerif",255);
      textFont(myFont,20);
      text(message, 75, (45*i)+70, 1200, 200);  // Text wraps within text box 
  
 }
}

void draw() {
  background(84,39,56);
  //twitterScreen.draw();
             
counter++;
println(counter);
if(counter%mod==0){
 

if(currentState==1){
    counter =0;
  mod=25; 
  int[] numbers = getNumbers();
   currentState=2; 
}else{
    counter =0;
  mod=300; 
    twitterScreen = new TwitterScreen(color(0, 0, 0), 0, 0); 
   currentState = 1; 
}
}
              
              
  
  if(currentState==1){
    
  twitterScreen.drawScreen();
  
   PFont twitterheadline;
      fill(255);
      twitterheadline = createFont("SansSerif",255);
      textFont(twitterheadline,60);
      text("Web Design Day Tweets #webDesignDay", 50, 50, 1200, 200);  // Text wraps within text box 

  
  }else if(currentState==2){
  outputSchedule();
  }
  //scheduleScreen.drawScreen();
  //funFactScreen.drawScreen();

  /*
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
    
  }*/
  
}

void mouseClicked(){
  /*if(mouseX<25){
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
  }*/
}

// 3 Modes are needed
/* Agenda mode
 Twitter mode
 fun fact mode */
