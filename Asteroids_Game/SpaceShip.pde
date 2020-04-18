class SpaceShip
{
  private PImage body;
  private PImage thrust;
  private static final float UPSIDE = 50;
  private static final float DOWNSIDE = 25;
  private final float HEAD;
  private final float SIDE;
  private short m;
  private float phi;
  private float phiRot;
  private float x;
  private float y;
  private float x1;
  private float y1;
  private float x2;
  private float y2;
  private float x3;
  private float y3;
  private float v;
  private short collectedItems;
  private short lives;
  private short shieldStrength;
  // Hier muss noch ein Laser-Waffe kommen
  // Hier muss noch ein Schub kommen
  private AccelerationState accState;
  private RotationState rotState;
  private Shield shield;
  
  // Hier muss eine Funktion zur Kollisionserkennung
  SpaceShip(int myX, int myY) {
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myX;
    y = myY;
    HEAD = UPSIDE*sin(radians(90));
    SIDE = DOWNSIDE/sin(radians(45));
    v = 0;
    collectedItems = 0;
    lives = 3;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
    shield = new Full();
  }
  
  void show() {
    // updating the angle
    phiRot = rotState.rotate(phiRot);
    phi += phiRot;

    // updating the speed v
    v = accState.accelerate(v);

    // updating coodinates
    updateCoordinatesCenter();
    updateCoordinatesTriangle();
    
    // drawing shield
    shieldStrength = shield.protect(x,y,UPSIDE);
    
    // drawing space ship
    fill(255,255,255);
    triangle(x1,y1,x2,y2,x3,y3);
    
    // drawing thrust
    accState.thrust(x,y);
  }
  
  void setAccState(AccelerationState newState) {
    accState = newState;
  }
  
  void setRotState(RotationState newState) {
    rotState = newState;
  }
  
  void setShieldState(Shield newShield) {
    shield = newShield;
  }
  
  void updateCoordinatesCenter() {
    x = x - v*cos(radians(phi));
    y = y - v*sin(radians(phi));
  }
  
  void updateCoordinatesTriangle() {
    x1 = x - SIDE*cos(radians(phi-135));
    y1 = y - SIDE*sin(radians(phi-135));
    x2 = x - HEAD*cos(radians(phi));
    y2 = y - HEAD*sin(radians(phi));
    x3 = x - SIDE*cos(radians(phi+135));
    y3 = y - SIDE*sin(radians(phi+135));
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
}
