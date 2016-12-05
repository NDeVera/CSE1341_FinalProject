import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Minim.m;
// AudioPlayer p;     // for the eating noise
// AudioPlayer p2;    // for the poison (sickness)
// AudioPlayer p3;    // for hitting itself


Snake Hissy;
SnakeFood Grub;
SnakePoison Sick;
int time = 30;

void setup() {
  size(800, 800);
  frameRate(15);  
  Hissy = new Snake();
  Grub = new SnakeFood();
  Sick = new SnakePoison();
  // need creation of scoreboard-type tracker
}


void draw() {
  // Draws a message to the player if game is lost
  if (Hissy.hahaGameOver() == true) {
    background(0);
    fill(255);
    textSize(30);
    text("Booooo you lost!", 50, 50);
  } else {
    background(0, 0, 255);
    if (millis() > time) {
      Hissy.motion(); 
      Hissy.displaySnake(); 
      time = time + 30;
    } 
    Grub.design(); 
    Sick.design();

    // Eating the grub for gains
    if (dist(Grub.yPos, Grub.xPos, (Hissy.yPos).get(0), (Hissy.xPos).get(0)) < Hissy.edge) {
      Hissy.grow();
      Grub.spawn();
    }
    // (Accidentally) eating the poison for death
    if (dist(Sick.yPos, Sick.xPos, (Hissy.yPos).get(0), (Hissy.xPos).get(0)) < Hissy.edge) {
      Hissy.rebirth();
      Sick.spawn();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
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
  // Press any key to make the game restart and for Hissy to be reborn
  if (Hissy.hahaGameOver() == true) {
    Hissy.rebirth();
  }
}