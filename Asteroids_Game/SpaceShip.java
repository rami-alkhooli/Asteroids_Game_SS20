import processing.core.*;

public class SpaceShip
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
  private float[] xPoint;
  private float[] yPoint;
  private float v;
  private short collectedItems;
  private short lives;
  private short shieldStrength;

  private static SpaceShip mySpaceShip;
  private AccelerationState accState;
  private RotationState rotState;
  private ShieldState shield;
  private static PApplet myApp;
  
  private SpaceShip(PApplet theApp, int myX, int myY) {
    myApp = theApp;
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myX;
    y = myY;
    xPoint = new float[3];
    yPoint = new float[3];
    HEAD = UPSIDE*myApp.sin(myApp.radians(90));
    SIDE = DOWNSIDE/myApp.sin(myApp.radians(45));
    v = 0;
    collectedItems = 0;
    lives = 3;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
    shield = new ShieldStateFull();
  }
  
  public static SpaceShip create(PApplet theApp, int myX, int myY)
  {
    if (mySpaceShip==null) {mySpaceShip = new SpaceShip(theApp,myX,myY);}
    
    return mySpaceShip;
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
    checkBorders();
    
    // drawing shield
    shieldStrength = shield.protect(myApp,x,y,UPSIDE);
    
    // drawing space ship
    myApp.fill(255,255,255);
    myApp.triangle(xPoint[0],yPoint[0],xPoint[1],yPoint[1],xPoint[2],yPoint[2]);
    
    // drawing thrust
    accState.generateThrust(myApp,x,y,UPSIDE,DOWNSIDE,phi);
  }
  
  private void checkBorders() {
    if(x<(0-UPSIDE)) {x = myApp.width+UPSIDE;}
    if(x>(myApp.width+UPSIDE)) {x = 0-UPSIDE;}
    if(y<(0-UPSIDE)) {y = myApp.height+UPSIDE;}
    if(y>(myApp.height+UPSIDE)) {y = 0-UPSIDE;}
  }
  
  public void setAccState(AccelerationState newState) {
    accState = newState;
  }
  
  public void setRotState(RotationState newState) {
    rotState = newState;
  }
  
  public void setShieldState(ShieldState newShield) {
    shield = newShield;
  }
  
  private void updateCoordinatesCenter() {
    x = x - v*myApp.cos(myApp.radians(phi));
    y = y - v*myApp.sin(myApp.radians(phi));
  }
  
  private void updateCoordinatesTriangle() {
    xPoint[0] = x - SIDE*myApp.cos(myApp.radians(phi-135));
    yPoint[0] = y - SIDE*myApp.sin(myApp.radians(phi-135));
    xPoint[1] = x - HEAD*myApp.cos(myApp.radians(phi));
    yPoint[1] = y - HEAD*myApp.sin(myApp.radians(phi));
    xPoint[2] = x - SIDE*myApp.cos(myApp.radians(phi+135));
    yPoint[2] = y - SIDE*myApp.sin(myApp.radians(phi+135));
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getRadius() {return UPSIDE;}
  public short getMass() {return m;}
  public float getPhi() {return phi;}
  public float getSpeed() {return v;}
  public short getLives() {return lives;}
  public void collectItem (short theItem) {collectedItems += theItem;}
  public short getItems() {return collectedItems;}
  public short getShield() {return shieldStrength;}
}
