Snake Run;
SnakeFood Grub;


void setup() {
  size(800,800);
  frameRate(15);
  Run = new Snake();
  Grub = new SnakeFood();
  // need creation of scoreboard-type tracker
}


void draw() {
  background(0,0,255);
  Run.motion(); // make a snake motion function
  Run.displaySnake(); // make a snake display function
  Grub.designFood(); 
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == UP) {
      Run.facing = "up";
    }
    if (keyCode == DOWN) {
      Run.facing = "down";
    }
    if (keyCode == RIGHT) {
      Run.facing = "right";
    }
    if (keyCode == LEFT) {
      Run.facing = "left";
    }
  }
}