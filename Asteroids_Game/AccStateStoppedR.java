import processing.core.*;

public class AccStateStoppedR implements AccelerationState
{
  public float accelerate(float speed) {
    
  if (speed<-ACCELERATING_CRITICAL)  {speed = speed + ACCELERATING_STEP;}
  if (speed>=-ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
    
  }
}
