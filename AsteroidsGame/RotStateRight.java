import processing.core.*;

public class RotStateRight implements RotationState
{
  /**
  * This method is used to rotate the space ship to the right. It increases the angle of the space ship.
  *
  * @param angleRot holds the angle to be added to the current angle of the space ship.
  * @returns the new angle (sum of the current angle and new added angle).
  **/
  public float rotate(float angleRot) {
    if(angleRot<ROTATING_LIMIT) {angleRot = angleRot + ROTATING_STEP;}
    return angleRot;
  }
}
