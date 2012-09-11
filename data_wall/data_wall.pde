PImage b;
Tweet t;
int x;
int y;

void setup() {
  //Set the size of the stage, and the background to black.
  background(0);
  size(550,500);
  
  // LOADS IN SECRET CREDENTIALS
  String creds[] = loadStrings("data/supersecret.txt");
    println("there are " + creds.length + " lines");
    for (int i=0; i < creds.length; i++) {
      println(creds[i]);
    }

ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey(creds[0]);
cb.setOAuthConsumerSecret(creds[1]);
cb.setOAuthAccessToken(creds[2]);
cb.setOAuthAccessTokenSecret(creds[3]);

//Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  
  
 
  
  Query query = new Query("joshsager");
  query.setRpp(100);
  
  
   //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
 
    // Total Number of tweets
    println(tweets.size());
 
    for (int i = 0; i < tweets.size(); i++) {
      
      t = (Tweet) tweets.get(i);
      //println(t);
      println(width);
      b = loadImage(t.getProfileImageUrl(),"jpg","png");
      
      
      if(x>width){
        x=0;
        y+=50;
      }
      
      try{
      image(b, x, y);
      }catch(Error e){
        println(e);
      } 
      x += 50;
      
      
      
      /*String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
 
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);*/
      }
    //};
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
  
}

void draw(){
 
}
