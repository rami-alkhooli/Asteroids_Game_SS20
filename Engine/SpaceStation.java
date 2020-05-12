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
  
  private SpaceStation(PApplet theApp) {
  
    myApp = theApp ;
    BREITE = myApp.width/10;
    x = BREITE/2 ;
    y = myApp.height - (BREITE/2) ;
    collectedItems = 0;
    
  }
  
  public static SpaceStation create(PApplet theApp) {
  
    if(mySpaceStation == null) {mySpaceStation = new SpaceStation(theApp);}
    return mySpaceStation;
    
  }
  
  public void show() {
  
    myApp.fill(BODY);
    myApp.circle(x,y,BREITE);
    myApp.fill(HEAD);
    myApp.circle(x,y,BREITE/2);
    myApp.noFill();
    
  }
  
  public void loadItems(SpaceShip theShip, Game theGame) {
    
    ArrayList <Item> theItems = theShip.getItems();
    
    for (int n=0 ; n<theItems.size() ; n++) {
      
      short val = theItems.get(n).getValue();
      if(val<=2) {theGame.score += theShip.getItemScore();}
      else if((val>2) && (val<=4)) {theShip.increaseShield();}
      else if (val>4) {theShip.increaseLives();}
      
    }
    
    theShip.clearItemsList();
    
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getRadius() {return (float)(BREITE/2);}
  public short getItems() {return collectedItems;}
}
