class SpaceShip
{
  private short m;
  private double phi;
  private int x;
  private int y;
  private double v;
  private short collectedItems;
  private short lives;
  private short shieldStrength;
  // Hier muss noch ein Laser-Waffe kommen
  // Hier muss noch ein Schub kommen
  private AccelerationState accState;
  
  // Hier muss eine Funktion zur Kollisionserkennung
  SpaceShip(int myX, int myY) {
    m = 20;
    x = myX;
    y = myY;
    v = 0;
    collectedItems = 0;
    lives = 3;
    shieldStrength = 2;
    accState = new AccStateStoppedF();
  }
  
  void show() {
    triangle(x-50,y+50,x,y-100,x+50,y+50);
    v = accState.accelerate(v);
    y = y - (int) v;
  }
  
  void setState(AccelerationState newState) {
  accState = newState;
  }
}
