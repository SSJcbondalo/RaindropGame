PVector mouse;   //declare a PVector for mouse
ArrayList<Raindrop> keys = new ArrayList<Raindrop>();
Catcher c;        //declare catcher class
int score;        //declare score variable
int screen;    //declare screen variable
PImage bkgrnd;  //declare background variable
PImage LION;    //declare LION variable
PImage played;  //declare played vartiable


void setup() {
  size(1200, 800);    //make a canvas 1200 across and 800 down
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  c = new Catcher();  //initialize catcher class
  score = 0;    //set initial score to 0
  screen = 0;    //make a circumstance for a situation to be true and thus allow something to happen once that situation is true
  bkgrnd = loadImage("DJ Khaled.jpg");    //bring in DJ Khaled image 
  LION = loadImage("LION.jpg");    //bring in LION image
  played = loadImage("played.jpg");    //bring in "Congrats, You Played Yourself Image
}

void draw() {
  background(LION);      //make the background=DJ Khaled's LION
  fill(0);  //give the text black fill
  textSize(75);
  text("Ride With Me on The Path", 200, 150);  
  text("to More Success", 300, 400);
  text("*hold down any key", 300, 500);    //draw text on start screen
  keys.add(new Raindrop(random(width), 0));    //add more keys to the existing keys
  if (keyPressed) {    //if key is Pressed...
    background(LION);      //make background 
    textSize(75);
    text("Notice How I Said More", 200, 300);
    textSize(25);
    text("Click to Receive As Many Keys to Success You Need", 225, 400);    //more text that appears when any key is pressed
  }
  if (mousePressed) {   //if mouse Pressed, a certain condition exists that allows for the game to occur
    screen = 2;
  }
  if (screen == 2) {      //this condition is true, therefore sets everything in motion
    background(bkgrnd);    //use DJ Khaled background when mouse is Pressed
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    textSize(50);
    text(score, 1100, 300);    //display score (how many keys are in the catcher)
    for (int i = keys.size()-1; i >= 0; i--) {
      Raindrop k = keys.get(i);
      c.display();    //display catcher
      c.update();      
      k.fall();      //make the keys to success fall
      k.display();    //display te keys to success
      if (k.Touches(c.loc)) {    //if a key is touching the water bottle...
        keys.remove(i);      //remove the key touching the water bottle
        score ++;    //every time a key touches the water bottle, add 1 to the score
      }
    }
    if (score > 200) {    //if the score reaches 119, the game ends and a pic of Dj Khaled w/ his quote appears along with some text
      theend();      //use theend function
    }
  }
}
void theend () {
  background(played);    //make the background the DJ Khaled Vine scene
  textSize(35);
  fill(38, 255, 217);    //give the text a light blue color
  text("Don't EVER Play Yourself", 100, 50);      //end screen text
}