class Raindrop {
  float diam;    //declare diam 
  PVector vel, accel, loc;    //declare PVector's for velocity, acceleration, and location of each key to success
  PImage key;      //declare PImage variable for the keys to success

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    vel = new PVector(0, 3);    //assign velocity to each new Raindrop
    accel = new PVector(0, random(.02, .08));    //assign acceleration to each new Raindrop
    key = loadImage("key to success.png");    //bring in the key to success image
  }

  void fall () {
    loc.add(vel);  //add velocity to the location of each Raindrop
    vel.add(accel);    //add acceleration to velocity of each Raindrop
  }

  void display () {
    image(key, loc.x, loc.y);    //give the key to success image position
  }

  boolean Touches(PVector z) {    //set up true/false generator for conditions to be used in the main raindrop code
    if (loc.dist(z) < 30) {    //if the distance b/w PVector c and loc is less than 30,  boolean e is true
      return true;
    } else {    //else if not, boolean e is false
      return false;
    }
  }

  void reset() {
    loc.y = 0;  //reset location of y to 0 and set a initial velocity b/w 0 and 7
    vel.set(0, 7);
  }
}