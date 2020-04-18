interface AccelerationState
{
  public float accelerate(float speed);
  
  public static final float ACCELERATING_STEP = 0.5;
  public static final float ACCELERATING_LIMIT = 10;
  public static final float ACCELERATING_CRITICAL = 0.5;
}

class AccStateMoving implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<ACCELERATING_LIMIT) {speed = speed + ACCELERATING_STEP;}
  return speed;
  }
}

class AccStateStoppedF implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>ACCELERATING_CRITICAL)  {speed = speed - ACCELERATING_STEP;}
  if (speed<=ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  }
}

class AccStateReturning implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>-ACCELERATING_LIMIT) {speed = speed - ACCELERATING_STEP;}
  return speed;
  }
}

class AccStateStoppedR implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed<-ACCELERATING_CRITICAL)  {speed = speed + ACCELERATING_STEP;}
  if (speed>=-ACCELERATING_CRITICAL) {speed = 0;}
  return speed;
  }
}
