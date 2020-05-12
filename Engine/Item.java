import processing.core.*;

public class Item
{
  private int COLOR;
  private static final int TRANSPARENCE = 100;
  
  private int RADIUS;
  private float x;
  private float y;
  private short value;
  private static PApplet myApp;
  
  public Item(PApplet theApp, float theX, float theY)
  {
    myApp = theApp;
    RADIUS = myApp.width/60;
    x = theX;
    y = theY;
    value = (short)(myApp.random(0,6));
    
    if(value<=2) {COLOR = myApp.color(150,150,0);}
      else if((value>2) && (value<=4)) {COLOR = myApp.color(0,150,150);}
      else if (value>4) {COLOR = myApp.color(0,150,0);}
    
  }
  
  public void show()
  {
    myApp.fill(COLOR,TRANSPARENCE);
    myApp.circle(x,y,2*RADIUS);
    
    myApp.fill(COLOR);
    myApp.quad(x-(RADIUS/2),y,x,y-RADIUS,x+(RADIUS/2),y,x,y+RADIUS);
    myApp.noFill();
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public int getRadius() {return RADIUS;}
  public short getValue() {return value;}
}
