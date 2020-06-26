import processing.core.*;

public interface ShieldState
{
  /**
  * This method draws a round shield around the space ship and indicates the shield strength.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param x holds the current coordinate of the space ship on the x axis.
  * @param y holds the current coordinate of the space ship on the y axis.
  * @param radius holds the radius of the round shield.
  * @returns the shield strength.
  **/
  public short protect(PApplet theApp, float x,float y, float radius);
}
