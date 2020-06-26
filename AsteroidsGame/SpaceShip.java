import processing.core.*;
import java.util.*;

public class SpaceShip
{
  private static final int COLOR = new PApplet().color(151,151,151);
  private final float UPSIDE;
  private final float DOWNSIDE;
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
  private ArrayList <Item> collectedItems;
  private short lives;
  private short shieldStrength;

  private static SpaceShip mySpaceShip;
  private AccelerationState accState;
  private RotationState rotState;
  private ShieldState shield;
  private static PApplet myApp;
  
  /**
  * This constructor (private).
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  private SpaceShip(PApplet theApp) {
    
    myApp = theApp;
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myApp.width/2;
    y = myApp.height/2;
    xPoint = new float[3];
    yPoint = new float[3];
    UPSIDE = (myApp.width/30);
    DOWNSIDE = (myApp.width/60);
    HEAD = UPSIDE*myApp.sin(myApp.radians(90));
    SIDE = DOWNSIDE/myApp.sin(myApp.radians(45));
    v = 0;
    collectedItems = new ArrayList <Item> ();
    lives = 1;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
    shield = new ShieldStateFull();
    
  }
  
  /**
  * This method implements the single ton pattern and is used to create one instance of the space ship.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  public static SpaceShip create(PApplet theApp) {
  
    if (mySpaceShip==null) {mySpaceShip = new SpaceShip(theApp);}
    return mySpaceShip;
    
  }
  
  /**
  * This method is used as a destructor to destroy the instance of the space ship.
  **/
  public void destroy() {
    mySpaceShip=null;
  }
  
  /**
  * This method updates the angle, speed and shield of the space ship and draws it.
  **/
  public void show() {
    
    // updating the angle
    phiRot = rotState.rotate(phiRot);
    phi = (phi + phiRot)%360;

    // updating the speed v
    v = accState.accelerate(v,UPSIDE);

    // updating coodinates
    updateCoordinatesCenter();
    updateCoordinatesTriangle();
    checkBorders();
    
    // drawing shield
    shieldStrength = shield.protect(myApp,x,y,UPSIDE);
    
    // drawing space ship
    myApp.fill(COLOR);
    myApp.triangle(xPoint[0],yPoint[0],xPoint[1],yPoint[1],xPoint[2],yPoint[2]);
    
    // drawing thrust
    accState.generateThrust(myApp,x,y,UPSIDE,DOWNSIDE,phi);
    
  }
  
  /**
  * This method checks if the space ship has gone beyond the screen borders and draws it in the oppsite side.
  **/
  private void checkBorders() {
    if(x<(0-UPSIDE)) {x = myApp.width+UPSIDE;}
    if(x>(myApp.width+UPSIDE)) {x = 0-UPSIDE;}
    if(y<(0-UPSIDE)) {y = myApp.height+UPSIDE;}
    if(y>(myApp.height+UPSIDE)) {y = 0-UPSIDE;}
  }
  
  /**
  * This Method sets the acceleration state of the space ship.
  *
  * @param newState holds the new acceleration state to be set.
  **/
  public void setAccState(AccelerationState newState) {
    accState = newState;
  }
  
  /**
  * This Method sets the rotation state of the space ship.
  *
  * @param newState holds the new rotation state to be set.
  **/
  public void setRotState(RotationState newState) {
    rotState = newState;
  }
  
  /**
  * This Method sets the shield state (damage) of the space ship.
  *
  * @param newState holds the new shield state (damage) to be set.
  **/
  public void setShieldState(ShieldState newShield) {
    shield = newShield;
  }
  
  /**
  * This method updates the coordinate on x and y axis regarding the speed of the space ship.
  **/
  private void updateCoordinatesCenter() {
    x = x - v*myApp.cos(myApp.radians(phi));
    y = y - v*myApp.sin(myApp.radians(phi));
  }
  
  /**
  * This method updates the three points which is used to draw the triangle space ship.
  **/
  private void updateCoordinatesTriangle() {
    xPoint[0] = x - SIDE*myApp.cos(myApp.radians(phi-135));
    yPoint[0] = y - SIDE*myApp.sin(myApp.radians(phi-135));
    xPoint[1] = x - HEAD*myApp.cos(myApp.radians(phi));
    yPoint[1] = y - HEAD*myApp.sin(myApp.radians(phi));
    xPoint[2] = x - SIDE*myApp.cos(myApp.radians(phi+135));
    yPoint[2] = y - SIDE*myApp.sin(myApp.radians(phi+135));
  }
  
  /**
  * This method is called when the space ship collids with an item and collects the item.
  *
  * @param theItem holds the new item to be collected.
  **/
  public void collectItem (Item theItem) {
    collectedItems.add(theItem);
  }
  /**
  * This is a getter method.
  *
  * @returns a list of the collected items when the space ship delivers them at the space station.
  **/
  public ArrayList <Item> getItems() {return collectedItems;}
  
  /**
  * This method is called when the space ship collids with an asteroid.
  **/
  public void loseLive()
  {
    lives--;
  }
  
  /**
  * This method is called when the space ship collects an item, that holds a live inside it.
  **/
  public void increaseLives() {lives++;}
  
  /**
  * This method is called when the space ship collects an item, that holds a shield boost inside it.
  **/
  public void increaseShield() {
    
    switch(shieldStrength) {
      
      case 50:
        shield = new ShieldStateFull();
        shieldStrength = 100;
      break;
      
      case 0:
        shield = new ShieldStateDamaged();
        shieldStrength = 50;
      break;
      
    }
    
  }
  
  /**
  * This method is called after the space ship delivers the collected item at the space station.
  **/
  public void clearItemsList() {collectedItems = new ArrayList <Item> ();}
  
  /**
  * This method is uesr to draw the space ship in the center when starting the game or a new level.
  **/
  public void recenter() {
    x = myApp.width/2;
    y = myApp.height/2;
    v = 0;
    phi = 90;
    phiRot = 0;
  }
  
  /**
  * ! NOT USED ANYMORE ! This is a getter  method.
  *
  * @returns the score the collected item holds.
  **/
  public int getItemScore() {return 200;}
  
  /**
  * This is a getter  method.
  *
  * @returns the number of the collected items.
  **/
  public int getNumberItems() {return collectedItems.size();}
  
  /**
  * This is a getter  method.
  *
  * @returns the coordinate on the x axis of the space ship.
  **/
  public float getX() {return x;}
  
  /**
  * This is a getter  method.
  *
  * @returns the coordinate on the y axis of the space ship.
  **/
  public float getY() {return y;}
  
  /**
  * This is a getter  method.
  *
  * @returns the radius of the round shield to be drawn.
  **/
  public float getRadius() {return UPSIDE;}
  
  /**
  * This is a getter  method.
  *
  * @returns the mass of the space ship (it affects the speed).
  **/
  public short getMass() {return m;}
  
  /**
  * This is a getter  method.
  *
  * @returns the angle of the space ship.
  **/
  public float getPhi() {return phi;}
  
  /**
  * This is a getter  method.
  *
  * @returns the speed of the space ship.
  **/
  public float getSpeed() {return v;}
  
  /**
  * This is a getter  method.
  *
  * @returns the remaining lives of the space ship.
  **/
  public short getLives() {return lives;}
  
  /**
  * This is a getter  method.
  *
  * @returns the shield strength of the space ship.
  **/
  public short getShield() {return shieldStrength;}
}
