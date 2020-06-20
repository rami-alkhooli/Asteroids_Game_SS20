import processing.core.*;

public class AccStateMoving implements AccelerationState
{
  /**
  * This method increases the speed of the space ship while accelerating forwards
  * 
  * @param speed holds the value of the space ship
  * @param size holds the size of the space ship and indicates the mass of the it so that the acceleration is relative to the mass
  * @returns the new speed after increasing it
  **/
  public float accelerate(float speed, float size) {
  
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed<ACCELERATING_LIMIT) {speed = speed + ACCELERATING_STEP;}
    return speed;

  }
  
  /**
  * This method is overwritten and is used to generate thrust while accelerating forwards
  *
  * @param theApp is an object to access and use processing functions in the current application
  * @param x holds the position of the midpoint of the space ship on the x axis
  * @param y holds the position of the midpoint of the space ship on the y axis
  * @param up holds the length of the space ship from the midpoint to the top
  * @param down holds the length of the space ship from the midpoint to the bottom
  * @param angle holds the current angle of the space ship
  **/
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle) {
    
    Thrust myThrust = Thrust.generateThrust(theApp,up,down);
    myThrust.show(x,y,angle);
    myThrust = null;
    
  }
}
