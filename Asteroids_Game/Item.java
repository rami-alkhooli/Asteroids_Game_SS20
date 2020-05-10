import processing.core.*;

public class Item
{
  private int RADIUS;
  private float x;
  private float y;
  private short value;
  private static PApplet myApp;
  
  public Item(PApplet theApp, float theX, float theY)
  {
    RADIUS = 40;
    x = theX;
    y = theY;
    myApp = theApp;
    value = (short)(myApp.random(1,6));
  }
  
  public void show()
  {
    myApp.fill(150,250,250,100);
    myApp.circle(x,y,2*RADIUS);
    
    myApp.fill(150,250,250);
    myApp.quad(x-(RADIUS/2),y,x,y-RADIUS,x+(RADIUS/2),y,x,y+RADIUS);
    myApp.noFill();
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public int getRadius() {return RADIUS;}
  public short getValue() {return value;}
}
