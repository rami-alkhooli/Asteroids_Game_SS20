import processing.core.*;

public class RotStateStoppedL implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot<-ROTATING_CRITICAL)  {angleRot = angleRot + ROTATING_STEP;}
    if(angleRot>=-ROTATING_CRITICAL) {angleRot = 0;}
    return angleRot;
  }
}
