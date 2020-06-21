import processing.core.*;

public class RotStateStoppedR implements RotationState
{
  /**
  * This method is used to stop the space ship from rotating to the right. It reduces the angle of the space ship.
  *
  * @param angleRot holds the angle, the current angle of the space ship will be reduced by.
  * @returns the new angle after reducing it.
  **/
  public float rotate(float angleRot) {
    if(angleRot>ROTATING_CRITICAL)  {angleRot = angleRot - ROTATING_STEP;}
    if(angleRot<=ROTATING_CRITICAL) {angleRot = 0;}
    return angleRot;
  }
}
