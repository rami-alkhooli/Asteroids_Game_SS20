interface AccelerationState
{
  public double accelerate(double speed);
}

class AccStateMoving implements AccelerationState
{
  public double accelerate(double speed) {
  //fill(0,255,0);
  //circle(400,400,100);
  if (speed<10) speed = speed + 0.5;
  return speed;
  }
}

class AccStateStoppedF implements AccelerationState
{
  public double accelerate(double speed) {
  //fill(255,0,0);
  //circle(400,400,100);
  if (speed>0.5) speed = speed - 0.25;
  if (speed<0.5) speed = 0;
  return speed;
  }
}

class AccStateReturning implements AccelerationState
{
  public double accelerate(double speed) {
  //fill(0,255,0);
  //circle(400,400,100);
  if (speed>-10) speed = speed - 0.5;
  return speed;
  }
}

class AccStateStoppedR implements AccelerationState
{
  public double accelerate(double speed) {
  //fill(255,0,0);
  //circle(400,400,100);
  if (speed<-0.5) speed = speed + 0.25;
  if (speed>-0.5) speed = 0;
  return speed;
  }
}
