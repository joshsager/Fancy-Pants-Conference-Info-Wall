/*

myRandomKitten
barely changed version of @blprnt's my random numbers tutorial

 */


//This is the Google spreadsheet manager and the id of the spreadsheet that we want to populate, along with our Google username & password
SimpleSpreadsheetManager sm;
String sUrl = "0AiYWOG29i_JhdE1uYjAwMVRSZnVqR1NqWF82S2ZBeGc";
String googleUser = "";
String googlePass = "";
  
void setup() {
  //This code happens once, right when our sketch is launched
 size(1000,500);
 background(0);
 smooth();
 
//load in our super secret info from our super secret text file
String lines[] = loadStrings("supersecret.txt");
for (int i=0; i < lines.length; i++) {
}
 
googleUser = lines[0];
googlePass = lines[1];
 
 int[] numbers = getNumbers();
fill(255,40);
noStroke();
for (int i = 0; i < numbers.length; i++) {
  ellipse(numbers[i] * 8, width/2, 8,8);
};

};

void draw() {
  //This code happens once every frame.
};

void mousePressed() {
  float nf =random(1,6);
  int n = round(nf);
  println(n);
  String source = sm.getCellValue("Text", n);
  PImage b;
  background(100);
  b = loadImage(source);
  image(b, 0, 0);
  

}



