class Snake {
  int lngth;
  float edge;
  String facing;
  ArrayList <Float> xPos, yPos; // ArrayList was the easiest way to track, add, and remove links of the snake

  // Constructor for snake class
  Snake() {
    lngth = 1;
    edge = 24;
    facing = "up";
    xPos = new ArrayList();
    yPos = new ArrayList();
    xPos.add(random(width));
    yPos.add(random(height));
  }


  // Functions for snake class
  void drawSnake() {
    fill(255);
    for (int i = 0; i < lngth; i++) {
      stroke(0);
      rect(xPos.get(i), yPos.get(i), edge, edge);
    }
  }

  void motion() {
    for (int i=lngth-1; i > 0; i=i-1) {      
      xPos.set(i, xPos.get(i-1));
      yPos.set(i, yPos.get(i-1));
    }
    xPos.set(0, (xPos.get(0) + width) % width);    // using % modulus for remainders to set snake on other side of screen when it "goes off the edge"
    yPos.set(0, (yPos.get(0) + height) % height);
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
      xPos.set(0, xPos.get(0) - edge);
    }
  }

  void grow() {
    yPos.add(yPos.get(lngth-1) + edge);
    xPos.add(xPos.get(lngth-1) + edge);
    lngth = lngth + 1;
  }

  void sickness() {               // If the snake eats the Poison, it loses its link
    float tempX = xPos.get(0);
    float tempY = yPos.get(0);
    xPos.clear();
    yPos.clear();
    xPos.add(tempX);
    yPos.add(tempY);
    lngth = 1;
  }

  void rebirth() {
    xPos.clear();
    yPos.clear();
    xPos.add(random(300, width-300));
    yPos.add(random(300, height-300));
    lngth = 1;
  }

  boolean hahaGameOver() {
    for (int i=1; i < lngth; i++) {
      if (dist(xPos.get(0), yPos.get(0), xPos.get(i), yPos.get(i)) < edge) {
        p3.play();
        return true;
      }
    }
    return false;
  }
}