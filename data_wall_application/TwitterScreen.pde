class TwitterScreen extends DataWallScreen{
 TwitterHook twitter;
 int counter;
 int numberOfTweets = 100;
 int holdTime = 100;
 int rand;
 PImage avatarImage;
 String message;
 int imgx;
 int imgy;
  
   TwitterScreen(color cl, int xp, int yp){

    super(cl,xp,yp);
    twitter = new TwitterHook("refreshpitt",numberOfTweets);
    smooth();
    fill(c);
    rect(x,y,screenWidth,screenHeight); 
    getRandomTweet();
    drawAvatars();
    //outputTweet();
   }
 
    
  void setup(){
    println("Twitter Screen has been created");
  }
  
  void drawScreen(){
   counter++;
    
   // for (int i = 0; i < tweets.size(); i++) {// }

     
     if(counter%holdTime==0){
        background(counter);
        getRandomTweet();
        //drawAvatars();
        outputTweet();
         
      }
        
  }
  
    void outputTweet(){
      fill(255,255,255);
      PFont myFont;
      myFont = createFont("SansSerif",40);
      textFont(myFont,40);
      message = twitter.t.getText();
      text(message, 240, 200, 800, 800);  // Text wraps within text box 
    }
    void getRandomTweet(){
        rand = floor(random(numberOfTweets));
        twitter.t = (Tweet) twitter.tweets.get(rand);
        println(rand +"    "+twitter.t.getText()); 
    }
    void drawAvatars(){
      //Tweet t;
      //t = twitter.t
      imgx=100;
      imgy=600;
     for (int i = 0; i < twitter.tweets.size(); i++) {
      twitter.t = (Tweet) twitter.tweets.get(i);
      //println(t);
      //println(width);
      avatarImage = loadImage(twitter.t.getProfileImageUrl(),"jpg","png");
      
      if(imgx>width){
        imgx=100;
        imgy+=50;
      }
      
      try{
      image(avatarImage, imgx, imgy);
      }catch(Error e){
        println(e);
      } 
      imgx += 50;
      } 
    }
   void draw(){
     drawScreen();
    }
 
}
