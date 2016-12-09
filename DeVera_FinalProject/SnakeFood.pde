class SnakeFood {
  float xPos;
  float yPos;
  
  
  // COnstructor for the Snake Food
  SnakeFood() {
    xPos = random(50, width-50);
    yPos = random(50, height-50);
  }
  
  
  // Function for the Snake Food
  void design() {
    stroke(241,250,3);
    fill(255,0,0);
    ellipse(xPos,yPos, 15, 15);
    fill(241,250,3);
    ellipse(xPos,yPos,3,3);
  }
  
  void spawn() {
    xPos = random(50, width-50);
    yPos = random(50, height-50);
  }
  
}