import processing.core.*;

interface RotationState
{
  public float rotate(float angleRot);
  
  public static final float ROTATING_STEP = (float) 0.2;
  public static final float ROTATING_LIMIT = (float) 3.0;
  public static final float ROTATING_CRITICAL = (float) 0.5;
}

class RotStateRight implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot<ROTATING_LIMIT) {angleRot = angleRot + ROTATING_STEP;}
    return angleRot;
  }
}

class RotStateStoppedR implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot>ROTATING_CRITICAL)  {angleRot = angleRot - ROTATING_STEP;}
    if(angleRot<=ROTATING_CRITICAL) {angleRot = 0;}
    return angleRot;
  }
}

class RotStateLeft implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot>-ROTATING_LIMIT) {angleRot = angleRot - ROTATING_STEP;}
    return angleRot;
  }
}

class RotStateStoppedL implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot<-ROTATING_CRITICAL)  {angleRot = angleRot + ROTATING_STEP;}
    if(angleRot>=-ROTATING_CRITICAL) {angleRot = 0;}
    return angleRot;
  }
}
