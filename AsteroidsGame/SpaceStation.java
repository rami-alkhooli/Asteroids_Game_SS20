import processing.core.*;
import java.util.*;

public class SpaceStation
{
  private static final int BODY = new PApplet().color(151,151,151);
  private static final int HEAD = new PApplet().color(255,255,255);
  
  private final int BREITE;
  private final float x;
  private final float y;
  private short collectedItems;
  
  private static SpaceStation mySpaceStation;
  private static PApplet myApp;
  
  /**
  * This constructor (private).
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  private SpaceStation(PApplet theApp) {
  
    myApp = theApp ;
    BREITE = myApp.width/10;
    x = BREITE/2 ;
    y = myApp.height - (BREITE/2) ;
    collectedItems = 0;
    
  }
  
  /**
  * This method implements the single ton pattern and is used to create one instance of the space station.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  public static SpaceStation create(PApplet theApp) {
  
    if(mySpaceStation == null) {mySpaceStation = new SpaceStation(theApp);}
    return mySpaceStation;
    
  }
  
  /**
  * This method is used to destroy the space station object whe finishing the game.
  **/
  public void destroy() {
    mySpaceStation=null;
  }
  
  /**
  * This method is used to daw the space station.
  **/
  public void show() {
  
    myApp.fill(BODY);
    myApp.circle(x,y,BREITE);
    myApp.fill(HEAD);
    myApp.circle(x,y,BREITE/2);
    myApp.noFill();
    
  }
  
  /**
  * This method is called when the space ship delivers items at the space station.
  *
  * @param theShip holds the space ship object. This enables editing it.
  * @param theEngine holds the engine of the current game. This enables editing properties and objects in the game.
  **/
  public void loadItems(SpaceShip theShip, Engine theEngine) {
    
    ArrayList <Item> theItems = theShip.getItems();
    
    for (int n=0 ; n<theItems.size() ; n++) {
      
      short val = theItems.get(n).getValue();
      if(val<=2) {theEngine.setScore(theShip.getItemScore()+theEngine.getScore());}
      else if((val>2) && (val<=4)) {theShip.increaseShield();}
      else if (val>4) {theShip.increaseLives();}
      
    }
    
    theShip.clearItemsList();
    
  }
  
  /**
  * This is a getter  method.
  *
  * @returns the coordinate on the x axis of the space station.
  **/
  public float getX() {return x;}
  
  /**
  * This is a getter  method.
  *
  * @returns the coordinate on the y axis of the space station.
  **/
  public float getY() {return y;}
  
  /**
  * This is a getter  method.
  *
  * @returns the radius of the round space station.
  **/
  public float getRadius() {return (float)(BREITE/2);}
  
  /**
  * This is a getter  method.
  *
  * @returns the number of the delivered items in the space station.
  **/
  public short getItems() {return collectedItems;}
}
