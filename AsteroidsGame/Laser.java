import processing.core.*;

public class Laser
{
  private static final int COLOR = new PApplet().color(255,0,0);
  private static final int INITTRANSPARENCE = 195;
  
  private final float x;
  private final float y;
  private float movingX;
  private float movingY;
  private final float phi;  
  private int born;
  private float i;
  private int ttl;
  private static PApplet myApp;
  private static Laser myLaser;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param myX holds the current coordinate of the space ship on the x axis in the moment of firing the laser shot.
  * @param myY holds the current coordinate of the space ship on the y axis in the moment of firing the laser shot.
  * @param myPhi holds the current rotation angle of the space ship in the moment of firing the laser shot.
  **/
  public Laser(PApplet theApp, float myX, float myY, float myPhi) {
    myApp = theApp;
    x = myX;
    y = myY;
    phi = myPhi;
    ttl=30;
    i=0;
    born = myApp.second();
  }
  
  /**
  * This method is called in every frame but it draws only a laser shot when the space ship fires.
  *
  * @returns bool value: true if firing a laser shot / false if no laser shot was shot.
  **/
  public boolean shoot() {
      if(ttl>0) {
        ttl--;
        i+=(myApp.width/100);
        movingX = x - i*myApp.cos(myApp.radians(phi));
        movingY = y - i*myApp.sin(myApp.radians(phi));
        myApp.fill(COLOR,INITTRANSPARENCE+(2*ttl));
        myApp.circle(movingX,movingY,myApp.width/140);
        
        return true;
    }
    else return false;
  }
  
  /**
  * This is a getter method.
  *
  * @returns the coordinate of the current coordinate of the laser shot on the x axis.
  **/
  public float getX() {return movingX;}
  
  /**
  * This is a getter method.
  *
  * @returns the coordinate of the current coordinate of the laser shot on the y axis.
  **/
  public float getY() {return movingY;}
  
  /**
  * This is a getter method.
  *
  * @returns the coordinate of the constant radius of the laser shot. 
  **/
  public float getRadius() {return 10;}
}
