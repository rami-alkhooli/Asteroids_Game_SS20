import processing.core.*;

class SpaceShip
{
  private static final float UPSIDE = 60;
  private static final float DOWNSIDE = 40;
  private final float HEAD;
  private final float SIDE;
  private final short m;
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
  private AccelerationState accState;
  private RotationState rotState;
  private Shield shield;
  private static PApplet myApp;
  
  // Hier muss eine Funktion zur Kollisionserkennung
  public SpaceShip(PApplet theApp, int myX, int myY) {
    myApp = theApp;
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myX;
    y = myY;
    HEAD = UPSIDE*myApp.sin(myApp.radians(90));
    SIDE = DOWNSIDE/myApp.sin(myApp.radians(45));
    v = 0;
    collectedItems = 0;
    lives = 3;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
    shield = new Full();
  }
  
  public void show() {
    // updating the angle
    phiRot = rotState.rotate(phiRot);
    phi = (phi + phiRot)%360;

    // updating the speed v
    v = accState.accelerate(v);

    // updating coodinates
    updateCoordinatesCenter();
    updateCoordinatesTriangle();
    boundingConditions();
    
    // drawing shield
    shieldStrength = shield.protect(myApp,x,y,UPSIDE);
    
    // drawing space ship
    myApp.fill(255,255,255);
    myApp.triangle(x1,y1,x2,y2,x3,y3);
    
    // drawing thrust
    accState.generateThrust(myApp,x,y,UPSIDE,DOWNSIDE,phi);
  }
  
  public void setAccState(AccelerationState newState) {
    accState = newState;
  }
  
  public void setRotState(RotationState newState) {
    rotState = newState;
  }
  
  public void setShieldState(Shield newShield) {
    shield = newShield;
  }
  
  private void updateCoordinatesCenter() {
    x = x - v*myApp.cos(myApp.radians(phi));
    y = y - v*myApp.sin(myApp.radians(phi));
  }
  
  private void updateCoordinatesTriangle() {
    x1 = x - SIDE*myApp.cos(myApp.radians(phi-135));
    y1 = y - SIDE*myApp.sin(myApp.radians(phi-135));
    x2 = x - HEAD*myApp.cos(myApp.radians(phi));
    y2 = y - HEAD*myApp.sin(myApp.radians(phi));
    x3 = x - SIDE*myApp.cos(myApp.radians(phi+135));
    y3 = y - SIDE*myApp.sin(myApp.radians(phi+135));
  }
  
  private void boundingConditions() {
    if(x<(0-UPSIDE)) {x = myApp.width+UPSIDE;}
    if(x>(myApp.width+UPSIDE)) {x = 0-UPSIDE;}
    if(y<(0-UPSIDE)) {y = myApp.height+UPSIDE;}
    if(y>(myApp.height+UPSIDE)) {y = 0-UPSIDE;}
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public short getMass() {return m;}
  public float getPhi() {return phi;}
  public float getSpeed() {return v;}
  public short getLives() {return lives;}
  public short getItems() {return collectedItems;}
  public short getShield() {return shieldStrength;}
}
