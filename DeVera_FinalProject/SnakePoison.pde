// Child class that is extension of Snake Food

class SnakePoison extends SnakeFood {

  
  // Constructor for the Snake Poison
  SnakePoison() {
    super();
  }
  
  // Function for the Snake Poison
  void design() {
    stroke(0);
    fill(56, 255, 3);
    ellipse(xPos, yPos, 40, 40);
    line(xPos-10,yPos-10 , xPos+10,yPos+10);
    line(xPos-10,yPos+10 , xPos+10,yPos-10);
  }
  
  void spawn() {
    super.spawn();
  }
  
}