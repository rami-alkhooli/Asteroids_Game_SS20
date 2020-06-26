import processing.core.*;

public class ShieldStateFull implements ShieldState
{
  private static final int COLOR = new PApplet().color(170,255,170);
  private static final int TRANSPARENCE = 200;
  private static final int STRENGTH = 100;
  
  /**
  * This method draws a round shield around the space ship and indicates the shield strength.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param x holds the current coordinate of the space ship on the x axis.
  * @param y holds the current coordinate of the space ship on the y axis.
  * @param radius holds the radius of the round shield.
  * @returns the shield strength.
  **/
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
}
