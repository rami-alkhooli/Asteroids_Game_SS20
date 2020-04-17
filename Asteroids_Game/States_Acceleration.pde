interface AccelerationState
{
  public void accelerate();
}

class AccStateMoving implements AccelerationState
{
  public void accelerate() {
  fill(0,255,0);
  circle(400,400,100);
  }
}

class AccStateStopped implements AccelerationState
{
  public void accelerate() {
  fill(255,0,0);
  circle(400,400,100);
  }
}
