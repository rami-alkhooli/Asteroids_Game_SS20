interface AccelerationState
{
  public float accelerate(float speed);
  public void generateThrust(float x, float y, float up, float down, float angle);
  
  public static final float ACCELERATING_STEP = 0.2;
  public static final float ACCELERATING_LIMIT = 10;
  public static final float ACCELERATING_CRITICAL = 0.5;
}

class AccStateMoving implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<ACCELERATING_LIMIT) {speed = speed + ACCELERATING_STEP;}
  return speed;
  }
  
  public void generateThrust(float x, float y, float up, float down, float angle) {
    Thrust myThrust = new Thrust(up,down);
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
  
  public void generateThrust(float x, float y, float up, float down, float angle) {
  }
}

class AccStateReturning implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>-ACCELERATING_LIMIT) {speed = speed - ACCELERATING_STEP;}
  return speed;
  }
  
  public void generateThrust(float x, float y, float up, float down, float angle) {
  }
}

class AccStateStoppedR implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<-ACCELERATING_CRITICAL)  {speed = speed + ACCELERATING_STEP;}
  if (speed>=-ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  }
  
  public void generateThrust(float x, float y, float up, float down, float angle) {
  }
}
