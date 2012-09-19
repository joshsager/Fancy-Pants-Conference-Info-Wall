import twitter4j.Query;

class TwitterHook{
  Tweet t;
  ArrayList tweets;
  
  TwitterHook(String searchBy, int numberOfResults){
    // LOADS IN SECRET CREDENTIALS
  String creds[] = loadStrings("data/supersecret.txt");
    // println("there are " + creds.length + " lines"); 
    for (int i=0; i < creds.length; i++) {
      //println(creds[i]); //output contents 
    }

    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey(creds[0]);
    cb.setOAuthConsumerSecret(creds[1]);
    cb.setOAuthAccessToken(creds[2]);
    cb.setOAuthAccessTokenSecret(creds[3]);
    
    //Make the twitter object and prepare the query
    Twitter twitter = new TwitterFactory(cb.build()).getInstance();
    // SEARCH BY
    twitter4j.Query query = new Query(searchBy);
    query.setRpp(numberOfResults);
  
     //Try making the query request.
    try {
      QueryResult result = twitter.search(query);
      tweets = (ArrayList) result.getTweets();
 
      // Total Number of tweets
      // println(tweets.size() +"WHAT!!!");
 


      /*String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
 
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);*/
      //}
    //};
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
    
  }
}
