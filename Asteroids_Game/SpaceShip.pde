class SpaceShip
{
  private short m;
  private double phi;
  private double phiRot;
  private int x;
  private int y;
  private double v;
  private short collectedItems;
  private short lives;
  private short shieldStrength;
  // Hier muss noch ein Laser-Waffe kommen
  // Hier muss noch ein Schub kommen
  private AccelerationState accState;
  private RotationState rotState;
  
  // Hier muss eine Funktion zur Kollisionserkennung
  SpaceShip(int myX, int myY) {
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myX;
    y = myY;
    v = 0;
    collectedItems = 0;
    lives = 3;
    shieldStrength = 2;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
  }
  
  void show() {
    phiRot = rotState.rotate(phiRot);
    phi = (phi + phiRot)%360;
    fill(255,0,0);
    circle(x,y,100);
    fill(255,255,255);
    
    x = (int) (x -  v*cos(radians((float)phi)));
    y = (int) (y - v*sin(radians((float)phi)));    
    rotate(radians((float)phi-90));
    //triangle(x+70*cos((float)phi+135) , y-70*sin((float)phi+135) , x+100*cos((float)phi) , y-100*sin((float)phi) , x+70*cos((float)phi+225) , y-70*sin((float)phi+225));
    triangle(x-50,y+50,x,y-100,x+50,y+50);
    v = accState.accelerate(v);
    y = y - (int) v;
    
  }
  
  void setAccState(AccelerationState newState) {
  accState = newState;
  }
  
  void setRotState(RotationState newState) {
  rotState = newState;
  }
  
  public int getX() {return x;}
  public int getY() {return y;}
}
