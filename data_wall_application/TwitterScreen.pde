class TwitterScreen extends DataWallScreen{
 TwitterHook twitter;
 int counter;
 int numberOfTweets = 100;
 int holdTime = 200;
 int rand;
 PImage avatarImage;
 String message;
 int imgx;
 int imgy;
  
   TwitterScreen(color cl, int xp, int yp){

    super(cl,xp,yp);
    twitter = new TwitterHook("webdesignday",numberOfTweets);
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
        //background(counter);
       // c= color(random(255),random(255),random(255));
       c = 0;
              twitter = new TwitterHook("webdesignday",numberOfTweets);

        getRandomTweet();
        //drawAvatars();
      }
       outputTweet();
       drawAvatars();
  }
  
    void outputTweet(){
      fill(139,188,173,255);
      rect(x,y,screenWidth,screenHeight); 
      fill(255,255,255);
      PFont myFont;
      myFont = createFont("SansSerif",40);
      textFont(myFont,40);
      message = twitter.t.getText();
      text(message, 300, 200, 800, 800);  // Text wraps within text box 
    }
    void getRandomTweet(){
        rand = floor(random(numberOfTweets));
        twitter.t = (Tweet) twitter.tweets.get(rand);
        //println(rand +"    "+twitter.t.getText()); 
    }
    void drawAvatars(){
      //Tweet t;
      //t = twitter.t
      imgx=200;
      imgy=210;
      twitter.t = (Tweet) twitter.tweets.get(rand);
      //println(t);
      //println(twitter.t);
      avatarImage = loadImage(twitter.t.getProfileImageUrl(),"jpg","png");
      try{
        image(avatarImage, imgx, imgy,75,75);
      }catch(Error e){
        println(e);
      } 
    }
   void draw(){
     drawScreen();
    }
}
