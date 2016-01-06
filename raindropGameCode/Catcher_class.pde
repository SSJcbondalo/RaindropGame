class Catcher {
  PVector loc;    //declare PVector for location of the catcher
  PImage basket;    //declare PImage variable for basket (which is the water bottle)

  Catcher() {
    loc = new PVector();    //make the location of the updated catcher
    basket = loadImage("water#1.png");    //bring in the water bottle image
  }

  void display () {
    image(basket, mouseX-40, mouseY-40);    //make the water bottle image centered on the mouse
    
  }

  void update() {
    loc.set(mouseX, mouseY);    //when the catcher is updated, make its location the same as the mouse's 
  }
}