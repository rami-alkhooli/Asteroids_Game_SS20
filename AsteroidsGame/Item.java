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
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theX holds the coordinate of the collison's position on the x axis. 
  * @param theY holds the coordinate of the collison's position on the y axis.
  **/
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
  
  /**
  * This method is called everytime during the game but it draws an explosion only when 2 objects collide.
  **/
  public void show()
  {
    myApp.fill(COLOR,TRANSPARENCE);
    myApp.circle(x,y,2*RADIUS);
    
    myApp.fill(COLOR);
    myApp.quad(x-(RADIUS/2),y,x,y-RADIUS,x+(RADIUS/2),y,x,y+RADIUS);
    myApp.noFill();
  }
  
  /**
  * This is a getter method.
  *
  * @returns the coordinate of the explosion's position on the x axis. 
  **/
  public float getX() {return x;}
  
  /**
  * This is a getter method.
  *
  * @returns the coordinate of the explosion's position on the y axis.
  **/
  public float getY() {return y;}
  
  /**
  * This is a getter method.
  *
  * @returns constant: the radius of the explosion. 
  **/
  public int getRadius() {return RADIUS;}
  
  /**
  * This is a getter method.
  *
  * @returns the type of enforcement the item holds: Shield strength / Live / Score.
  **/
  public short getValue() {return value;}
}
