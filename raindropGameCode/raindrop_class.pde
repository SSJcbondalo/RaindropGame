class Raindrop {
  float diam;
  PVector vel, accel, loc;

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    vel = new PVector(0, 7);
    accel = new PVector(0, random(.02, .08));
    diam = 20;
  }

  void fall () {
    loc.add(vel);
    vel.add(accel);
  }

  void display () {
    noStroke();
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(PVector c) {
    boolean e;
    if (loc.dist(c) < diam/2) {
      e = true;
    } else {
      e = false;
    };
    return e;
  }

  void reset() {
    loc.y = 0;
    vel.set(0, 7);
  }
}