class Snake {
  int lngth;
  float edge;
  String facing;
  ArrayList <Float> xPos, yPos;
  
  // Constructor for snake class
  Snake() {
   lngth = 1;
   edge = 30;
   facing = "up";
   xPos = new ArrayList();
   yPos = new ArrayList();
   xPos.add(random(width));
   yPos.add(random(height));
  }
  
  // Functions for snake class
  
  void displaySnake() {
    for (int i = 0; i < lngth; i++) {
      stroke(0);
      rect(xPos.get(i), yPos.get(i), edge, edge);
    }
  }
  
  void motion() {
    for (int i=lngth-1; i > 0; i=i-1) {      // stylistic additon
      xPos.set(i, xPos.get(i-1));
      yPos.set(i, yPos.get(i-1));
    }
    if (facing == "up") {
      yPos.set(0, yPos.get(0) - edge);
    }
    if (facing == "down") {
      yPos.set(0, yPos.get(0) + edge);
    }
    if (facing == "right") {
      xPos.set(0, xPos.get(0) + edge);
    }
    if (facing == "left") {
      xPos.set(0, xPos.get(0) + edge);
    }
  }
  
  
  
  
}