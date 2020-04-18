interface RotationState
{
  public double rotate(double angleRot);
}

class RotStateRight implements RotationState
{
  public double rotate(double angleRot) {
    if(angleRot<5) angleRot = angleRot + 0.05;
    return angleRot;
  }
}

class RotStateStoppedR implements RotationState
{
  public double rotate(double angleRot) {
    if(angleRot>0.5) angleRot = angleRot - 0.025;
    if(angleRot<=0.5) angleRot = 0;
    return angleRot;
  }
}

class RotStateLeft implements RotationState
{
  public double rotate(double angleRot) {
    if(angleRot>-5) angleRot = angleRot - 0.05;
    return angleRot;
  }
}

class RotStateStoppedL implements RotationState
{
  public double rotate(double angleRot) {
    if(angleRot<-0.5) angleRot = angleRot + 0.025;
    if(angleRot>=-0.5) angleRot = 0;
    return angleRot;
  }
}
