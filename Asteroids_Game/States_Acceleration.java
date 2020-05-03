import processing.core.*;

interface AccelerationState
{
  public float accelerate(float speed);
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle);
  
  public static final float ACCELERATING_STEP = (float) 0.2;
  public static final float ACCELERATING_LIMIT = (float) 10.0;
  public static final float ACCELERATING_CRITICAL = (float) 0.5;
}

class AccStateMoving implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<ACCELERATING_LIMIT) {speed = speed + ACCELERATING_STEP;}
  return speed;
  }
  
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle) {
    Thrust myThrust = new Thrust(theApp,up,down);
    myThrust.show(x,y,angle);
    myThrust = null;
  }
}

class AccStateStoppedF implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>ACCELERATING_CRITICAL)  {speed = speed - ACCELERATING_STEP;}
  if (speed<=ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
  }
}

class AccStateReturning implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>-ACCELERATING_LIMIT) {speed = speed - ACCELERATING_STEP;}
  return speed;
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
  }
}

class AccStateStoppedR implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<-ACCELERATING_CRITICAL)  {speed = speed + ACCELERATING_STEP;}
  if (speed>=-ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
  }
}
