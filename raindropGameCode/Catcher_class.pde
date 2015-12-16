class Catcher {
  float diam;
  bucket(float a, float b) {
    diam = 70;
    loc = new PVector(a, b);
    ellipse(mouseX, mouseY, diam, diam)
  
  boolean Touches(Catcher c) {
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