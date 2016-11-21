Snake Run;
SnakeFood Grub;


void setup() {
  size(800,800);
  Run = new Snake();
  Grub = new SnakeFood();
  // need creation of scoreboard-type tracker
}


void draw() {
  Run.motion(); // make a snake motion function
  Run.display(); // make a snake display function
  Grub.design(); 
  
}