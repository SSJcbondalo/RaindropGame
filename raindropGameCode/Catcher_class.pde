class Catcher {
  PVector loc;
  int diam;
  PImage basket;

  Catcher(int tdiam) {
    loc = new PVector();
    diam = tdiam;
    basket = loadImage("nba basket.jpg");
  }

  void display () {
    fill(0);
    image(basket, mouseX, mouseY);
    
  }

  void update() {
    loc.set(mouseX, mouseY);
  }
}