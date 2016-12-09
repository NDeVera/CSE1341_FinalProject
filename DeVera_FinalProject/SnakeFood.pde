class SnakeFood {
  float xPos;
  float yPos;
  
  
  // Constrsuctor for the Snake Food
  SnakeFood() {
    xPos = random(200, width-200);
    yPos = random(200, height-200);
  }
  
  
  // Function for the Snake Food
  void design() {
    stroke(241,250,3);
    fill(255,0,0);
    ellipse(xPos,yPos, 18, 18);
    fill(241,250,3);
    ellipse(xPos,yPos,4,4);
  }
  
  void spawn() {
    xPos = random(200, width-200);
    yPos = random(200, height-200);
  }
  
}