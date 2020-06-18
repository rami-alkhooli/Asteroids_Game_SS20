import processing.core.*;

public interface AccelerationState
{
  /**
  * This function changes the acceleration and increases or decreases the speed of the space ship
  * 
  * @param speed holds the value of the space ship
  * @param size holds the size of the space ship and indicates the mass of the it so that the acceleration is relative to the mass
  * @returns the new speed after increasing or decreasing it
  **/
  public float accelerate(float speed ,float size);

  /**
  * This function is used to generate thrust while accelerating
  *
  * @param theApp is a pointer on the processing object 
  * @param x holds the position of the midpoint of the space ship on the x axis
  * @param y holds the position of the midpoint of the space ship on the y axis
  * @param up holds the length of the space ship from the midpoint to the top
  * @param down holds the length of the space ship from the midpoint to the bottom
  * @param angle holds the current angle of the space ship
  **/
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle);
}
