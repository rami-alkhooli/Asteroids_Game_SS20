class SpaceShip
{
  private short m;
  private int x;
  private int y;
  private double vx;
  private double vy;
  private short collectedItems;
  private short lives;
  private short shieldStrength;
  // Hier muss noch ein Laser-Waffe kommen
  // Hier muss noch ein Schub kommen
  
  // Hier muss eine Funktion zur Kollisionserkennung
  SpaceShip(int myX, int myY) {
    m = 20;
    x = myX;
    y = myY;
    vx = 0;
    vy = 0;
    collectedItems = 0;
    lives = 3;
    shieldStrength = 2;
  }
  
  void show() {
    triangle(x-50,y+50,x,y-100,x+50,y+50);
  }
  
  void accelerate() {
    y= y - 20;
  }
}
