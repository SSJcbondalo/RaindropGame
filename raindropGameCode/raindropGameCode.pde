int count = 100;
PVector mouse;   //declare a P
Raindrop[] r = new Raindrop [count];     //declare a new Raindrop called r
Catcher c;        //declare catcher class
int score;        //declare score variable
int screen;    //declare screen variable
PImage bkgrnd;  //declare background variable
PImage LION;    //declare LION variable
PImage played;  //declare played vartiable

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);  
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i = 0; i < count; i++) {
    r[i] = new Raindrop(random(width), random(-height, 0));   //Initialize r. The parameters used are the initial x and y positions
  }
  c = new Catcher();  //initialize catcher class
  score = 0;    //set initial score to 0
  screen = 0;    //make a circumstance for a situation to be true and thus allow something to happen once that situation is true
  bkgrnd = loadImage("DJ Khaled.jpg");    //bring in DJ Khaled image 
  LION = loadImage("LION.jpg");    //bring in LION image
  played = loadImage("played.jpg");    //bring in "Congrats, You Played Yourself Image
}

void draw() {
    background(LION);      //make the background DJ Khaled's LION
    fill(0);
    textSize(75);
    text("Ride With Me on The Path", 200, 150);  
    text("to More Success", 300, 400);
    text("*hold down space", 300, 500);    //draw text on start screen
  
  if (keyPressed) {
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
  background(bkgrnd);    //use steph curry background when mouse is Pressed
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  text(score, 700, 300);    //display score (how many baskets are in the catcher)
  textSize(100);
    for (int i = 0; i < count; i++) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset traindrop
    }
    if (r[i].Touches(c)) {      //if the raindrop is touching the catcher (water bottle) reset the raindrop and add 1 to the current score
      score = score + 1;
      r[i].reset();
    }
  }
  c.display();      //display the catcher
  c.update();      //update the catcher
  }
  if (score == 99) {    //if the score reaches 99, the game ends and a pic of Dj Khaled w/ his quote appears along with some text
    background(played);
    textSize(35);
    fill(38, 255, 217);
    text("Don't EVER Play Yourself", 100, 100);
    count = 0;    //set count to 0 so that the game ends
  }
}