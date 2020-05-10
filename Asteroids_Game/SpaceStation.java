import processing.core.*;

public class SpaceStation
{
  private static final int BODY = new PApplet().color(250,250,250);
  private static final int HEAD = new PApplet().color(170,185,185);
  
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
  
  public void loadItems(short theItems) {
    collectedItems += theItems;
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getRadius() {return (float)(BREITE/2);}
  public short getItems() {return collectedItems;}
}
