import processing.core.*;

public interface AccelerationState
{
  public float accelerate(float speed ,float size);
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle);
}

public class AccStateMoving implements AccelerationState
{
  public float accelerate(float speed, float size) {
  
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed<ACCELERATING_LIMIT) {speed = speed + ACCELERATING_STEP;}
    return speed;

  }
  
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle) {
    
    Thrust myThrust = Thrust.generateThrust(theApp,up,down);
    myThrust.show(x,y,angle);
    myThrust = null;
    
  }
}

public class AccStateReturning implements AccelerationState
{
  public float accelerate(float speed, float size) {
     
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed>-ACCELERATING_LIMIT) {speed = speed - ACCELERATING_STEP;}
    return speed;
  
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
    
  }
}

public class AccStateStoppedF implements AccelerationState
{
  public float accelerate(float speed, float size) {
    
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed>ACCELERATING_CRITICAL)  {speed = speed - ACCELERATING_STEP;}
    if (speed<=ACCELERATING_CRITICAL) {speed = 0;}
    return speed;
  
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
    
  }
}

public class AccStateStoppedR implements AccelerationState
{
  public float accelerate(float speed, float size) {
    
    float ACCELERATING_STEP = (float) (size/300);
    float ACCELERATING_LIMIT = (float) (size/6);
    float ACCELERATING_CRITICAL = (float) (size/120);
    
    if (speed<-ACCELERATING_CRITICAL)  {speed = speed + ACCELERATING_STEP;}
    if (speed>=-ACCELERATING_CRITICAL) {speed = 0;}
    return speed;
  
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
    
  }
}
