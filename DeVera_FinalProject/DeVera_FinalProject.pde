Snake Hissy;
SnakeFood Grub;
SnakePoison Death;

void setup() {
  size(800,800);
  frameRate(15);
  Hissy = new Snake();
  Grub = new SnakeFood();
  Death = new SnakePoison();
  // need creation of scoreboard-type tracker
}


void draw() {
  background(0,0,255);
  Hissy.motion(); // make a snake motion function
  Hissy.displaySnake(); // make a snake display function
  Grub.design(); 
  Death.design();
  
  // Eating the grub for gains
  if(dist(Grub.yPos,Grub.xPos , (Hissy.yPos).get(0),(Hissy.xPos).get(0)) < Hissy.edge) {
    Hissy.grow();
    Grub.spawn();
  }
  // (Accidentally) eating the poison for death
  if(dist(Death.yPos,Death.xPos , (Hissy.yPos).get(0),(Hissy.xPos).get(0)) < Hissy.edge) {
   Hissy.foodPoison();
   Death.spawn();
  }

}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == UP) {
      Hissy.facing = "up";
    }
    if (keyCode == DOWN) {
      Hissy.facing = "down";
    }
    if (keyCode == RIGHT) {
      Hissy.facing = "right";
    }
    if (keyCode == LEFT) {
      Hissy.facing = "left";
    }
  }
}