class Snake {
  int lngth;
  float edge;
  String facing;
  ArrayList <Float> xPos, yPos;
  
  // Constructor for snake class
  Snake() {
    lngth = 1;
    edge = 30;
   facing = "left";
   xPos = new ArrayList();
   yPos = new ArrayList();
   xPos.add(random(width));
   yPos.add(random(height));
  }
  
  // Functions for snake class
  
  void display() {
    for (int i = 0; i < lngth; i++) {
      stroke(0);
      rect(xPos.get(i), yPos.get(i), edge, edge);
    }
  }
  
  void motion() {
    
    
  }
  
  
  
  
}