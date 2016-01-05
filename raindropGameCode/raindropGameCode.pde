int count = 100;
PVector mouse;   //declare a P
Raindrop[] r = new Raindrop [count];     //declare a new Raindrop called r
Catcher c;        //declare catcher class
int score;        //declare score variable
int screen;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);  
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i = 0; i < count; i++) {
    r[i] = new Raindrop(random(width), random(-height, 0));   //Initialize r. The parameters used are the initial x and y positions
  }
  c = new Catcher(60);
  score = 0;
  screen = 1;
}

void draw() {
  if (screen == 1) {
    background(255);
    fill(200, 120, 50);
    textSize(100);
    text("Click to Start", 200, height/2);
  }
  if (mousePressed) {
    screen = 2;
  }
  if (screen == 2) {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  text(score, 700, 300);
  textSize(100);
  for (int i = 0; i < count; i++) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].loc.y > height) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();      //if it is, reset the raindrop
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset traindrop
    }
    if (r[i].Touches(c)) {
      score = score + 1;
    }
  }
  c.display();
  c.update();
  }
}