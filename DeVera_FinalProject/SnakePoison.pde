// Child class that is extension of Snake Food

class SnakePoison extends SnakeFood {

  // Constrsuctor for the Snake Poison
  SnakePoison() {
    super();
    // add functionality to make sure snake food is not spawned in front of snake
  }

  // Function for the Snake Poison
  void design() {
    fill(0, 255, 0);
    ellipse(xPos, yPos, 30, 30);
  }
  
}