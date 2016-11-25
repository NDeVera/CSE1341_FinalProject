class SnakeFood {
  float xPos;
  float yPos;
  
  // Constrsuctor for the Snake Food
  SnakeFood() {
    xPos = random(200, width-200);
    yPos = random(200, height-200);
    // add functionality to make sure snake food is not spawned in front of snake
  }
  
  // Function for the Snake Food
  void designFood() {
    fill(255,0,0);
    ellipse(xPos,yPos, 20, 20);
  }
  
  void spawnFood() {
    xPos = random(200, width-200);
    yPos = random(200, height-200);
  }
  
  
}