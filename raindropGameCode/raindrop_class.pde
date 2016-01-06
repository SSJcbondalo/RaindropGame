class Raindrop {
  float diam;    //declare diam 
  PVector vel, accel, loc;    //declare PVector's for velocity, acceleration, and location of each key to success
  PImage key;      //declare PImage variable for the keys to success

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    vel = new PVector(0, 5);    //assign velocity to each new Raindrop
    accel = new PVector(0, random(.02, .08));    //assign acceleration to each new Raindrop
    diam = 50;    //give each new Raindrop diameter of 50
    key = loadImage("key to success.png");    //bring in the key to success image
  }

  void fall () {
    loc.add(vel);  //add velocity to the location of each Raindrop
    vel.add(accel);    //add acceleration to velocity of each Raindrop
  }

  void display () {
    image(key, loc.x, loc.y);    //give the key to success image position

  }

  boolean Touches(Catcher c) {    //set up true/false generator for conditions to be used in the main raindrop code
    boolean e;
    if (loc.dist(mouse) < diam/2) {    //if the distance b/w PVector c and loc is less than half the diam of the circle,  boolean e is true
      e = true;
    } else {    //else if not, boolean e is false
      e = false;
    };
    return e;
  }

  void reset() {
    loc.y = 0;  //reset location of y to 0 and set a initial velocity b/w 0 and 7
    vel.set(0, 7);
  }
}