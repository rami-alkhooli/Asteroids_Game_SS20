import processing.core.*;

public class AccStateStoppedF implements AccelerationState
{
  /**
  * This function decreases the speed of the space ship while decelerating forwards
  * 
  * @param speed holds the value of the space ship
  * @param size holds the size of the space ship and indicates the mass of the it so that the deceleration is relative to the mass
  * @returns the new speed after decreasing it
  **/
  public float accelerate(float speed, float size) {
    
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed>ACCELERATING_CRITICAL)  {speed = speed - ACCELERATING_STEP;}
    if (speed<=ACCELERATING_CRITICAL) {speed = 0;}
    return speed;
  
  }
  
  /**
  * This function is overwritten and does nothing because when the space ship stops accelerating a thrust won't be generated
  *
  * @param theApp is a pointer on the processing object 
  * @param x holds the position of the midpoint of the space ship on the x axis
  * @param y holds the position of the midpoint of the space ship on the y axis
  * @param up holds the length of the space ship from the midpoint to the top
  * @param down holds the length of the space ship from the midpoint to the bottom
  * @param angle holds the current angle of the space ship
  **/
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
    
  }
}
