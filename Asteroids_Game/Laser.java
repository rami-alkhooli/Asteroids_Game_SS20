import processing.core.*;

public class Laser
{    
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
  
  public Laser(PApplet theApp, float myX, float myY, float myPhi) {
    myApp = theApp;
    x = myX;
    y = myY;
    phi = myPhi;
    ttl=30;
    i=0;
    born = myApp.second();
  }
  
  public boolean shoot() {
      if(ttl>0) {
        ttl--;
        i+=20;
        movingX = x - i*myApp.cos(myApp.radians(phi));
        movingY = y - i*myApp.sin(myApp.radians(phi));
        myApp.fill(255,0,0,195+(2*ttl));
        myApp.circle(movingX,movingY,20);
        
        return true;
    }
    else return false;
  }
  
  public float getX() {return movingX;}
  public float getY() {return movingY;}
  public float getRadius() {return 10;}
}
