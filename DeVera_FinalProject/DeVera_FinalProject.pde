import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim m;
AudioPlayer p;     // for eating (burp)
AudioPlayer p2;    // for the poison (sickness)
AudioPlayer p3;    // for hitting itself (dying)


Snake hissy;
SnakeFood grub;
SnakePoison sick;
int time = 30;
int bestScore = 0;

void setup() {
  size(700, 700);
  frameRate(15);  
  hissy = new Snake();
  grub = new SnakeFood();
  sick = new SnakePoison();
  m = new Minim(this);            // sound files
  p = m.loadFile("burp.wav");
  p2 = m.loadFile("cough.wav");
  p3 = m.loadFile("fatality.mp3");
}


void draw() {
  // Draws a message to the player if game is lost
  if (hissy.hahaGameOver() == true) {
    background(0);
    fill(255);
    textSize(30);
    text("Booooooooo you lost & Hissy has died!", 50, 300);
    fill(255, 0, 0);
    textSize(35);
    text("[Press any key to restart Hissy's gains]", 25, 400);
  } else {
    // Plays the game
    background(0, 0, 255);
    score();
    if (millis() > time) {
      hissy.motion(); 
      hissy.drawSnake(); 
      time = time + 30;
    } 
    grub.design(); 
    sick.design();

    // Eating the grub for gains
    if (dist(grub.yPos, grub.xPos, (hissy.yPos).get(0), (hissy.xPos).get(0)) < hissy.edge) {
      p.rewind();
      p.play();
      hissy.grow(); 
      moveFood(grub);
      p3.rewind();
    }

    // (Accidentally) eating the poison for sickness
    if (dist(sick.yPos, sick.xPos, (hissy.yPos).get(0), (hissy.xPos).get(0)) < hissy.edge) {
      p2.rewind();
      p2.play();
      hissy.sickness(); 
      sick.spawn();
    }

    // Tracks the gains 
    if (hissy.lngth > bestScore) {
      bestScore = hissy.lngth;
    }
  }
}

// Function to show the number of gains in the top right hand corner
void score() {
  stroke(0, 255, 0);
  fill(0);
  rect(width-170, 0, 170, 50);
  strokeWeight(2);
  fill(0, 255, 0);
  textSize(22);
  text( "Top Gains: " + bestScore, width-155, 25);
  textSize(12);
  text( "Current Gains: " + hissy.lngth, width-130, 40);
}


// Function to ensure that the food does not spawn on the snake
void moveFood(SnakeFood grub) {
  boolean ok = true;
  int i = 0;
  while (i<hissy.lngth && ok) {  
    if (dist(grub.yPos, grub.xPos, (hissy.yPos).get(0), (hissy.xPos).get(0)) < hissy.edge) {
      ok = true;
    }
    i++;
  }
  if (ok) {
    grub.spawn();
  } else {
    moveFood(grub);
  }
}


void keyPressed() {
  // Key interaction to move Hissy
  if (key == CODED) {
    if (keyCode == UP) {
      hissy.facing = "up";
    }
    if (keyCode == DOWN) {
      hissy.facing = "down";
    }
    if (keyCode == RIGHT) {
      hissy.facing = "right";
    }
    if (keyCode == LEFT) {
      hissy.facing = "left";
    }
  }
  // Press any key to make the game restart and for Hissy to be reborn
  if (hissy.hahaGameOver() == true) {
    hissy.rebirth();
  }
}