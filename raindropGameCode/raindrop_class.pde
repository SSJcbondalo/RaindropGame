class Raindrop {
  float diam;
  PVector vel, accel, loc;

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    vel = new PVector(0, 5);    //assign velocity to each new Raindrop
    accel = new PVector(0, random(.02, .08));    //assign acceleration to each new Raindrop
    diam = 50;    //give each new Raindrop diameter of 50
  }

  void fall () {
    loc.add(vel);  //add velocity to the location of each Raindrop
    vel.add(accel);    //add acceleration to velocity of each Raindrop
  }

  void display () {
    noStroke();
    fill(225, 96, 232);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean Touches(bucket b) {
    boolean e;
    if (loc.dist(c.loc) < diam/2 + c.diam/2) {    //if the distance b/w PVector c and loc is less than half the diam of the circle,  boolean e is true
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