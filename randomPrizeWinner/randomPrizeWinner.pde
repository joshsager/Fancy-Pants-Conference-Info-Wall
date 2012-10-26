/*

Random Prize Winner
Based of of @blprnt's my random numbers tutorial

 */


//This is the Google spreadsheet manager and the id of the spreadsheet that we want to populate, along with our Google username & password
SimpleSpreadsheetManager sm;
String sUrl = "0As67s0KYSNnwdHRvWURDM0VyNi05bDlHNU94NmFua3c";
String googleUser = "";
String googlePass = "";
int totalEntries;
String message;
int counter;
int counter2;
int timer;
color bg;
ParticleSystem ps;
ParticleSystem ps2;
  
void setup() {
   //This code happens once, right when our sketch is launched
   size(1000,500);
   background(0);
   smooth();
   frameRate(90);
   bg=0; // sets background color to black
   counter = 0; // 0 means stop 1 means start
   counter2 =90; // 30 means 1 second of counting 
   timer = 3; // number of seconds to count down. 3 or 4 is a good starting place.
   ps = new ParticleSystem(new PVector(850,200));
   ps2 = new ParticleSystem(new PVector(150,200));
   message = "Click anywhere to find winner";
 
  //load in our super secret info from our super secret text file
  String lines[] = loadStrings("supersecret.txt");
  googleUser = lines[0];
  googlePass = lines[1];
 
  // initailizes/loads the spreadsheet 
  int[] numbers = getNumbers();
};

void draw() {
   background(bg);
   if(timer==0){
   ps.addParticle();
   ps.run();
   ps2.addParticle();
   ps2.run();
   }
  
  if(counter!=0){ // allow the random generator to cylce through names if counter is not 0
   
    if(counter%counter2==0&&counter!=1){ // every second remove one from the timer
      if(timer==1){ // when the timer has completed
        bg = color(139,188,173);
        counter=0;
        getRandomName("winner!!");
        
       
      }else{ 
        counter=1; // continue to cycle through random names
      }      
        timer--;
    }else{ // keep counting and keep getting random names
      counter++;
      getRandomName("");
     // println(timer);
    }
  }
        outputWinner();
        if(timer>0){
            outputTimer();
        }

};

void mousePressed() {
 counter=1; // start counter
 timer=3; // reset timer to 3 seconds
 bg=0; // set background to black;
}
void getRandomName(String m){
  float nf = random(1,totalEntries-1);
  int n = round(nf);
  
  String first = sm.getCellValue("First", n);
  String last = sm.getCellValue("Last", n);
 // println(n + " " + first + " "+ last );
  message = first + " " + last + " "+m;
}

void outputWinner(){
  
  PFont myFont;
      fill(255);
      myFont = createFont("SansSerif",40);
      textFont(myFont,40);
      text(message, 240, 200, 800, 800);  // Text wraps within text box  
}

void outputTimer(){
      fill(255);
      PFont myFont;
      myFont = createFont("SansSerif",40);
      textFont(myFont,40);
      String m = ""+timer;
      text(m, 240, 100, 800, 800);  // Text wraps within text box  
}



