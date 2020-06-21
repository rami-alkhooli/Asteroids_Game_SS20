import processing.core.*;

public class RotStateLeft implements RotationState
{
  /**
  * This method is used to rotate the space ship to the left. It decreases the angle of the space ship.
  *
  * @param angleRot holds the angle to be subtracted from the current angle of the space ship.
  * @returns the new angle (difference bewtween the current angle and the subtracted angle).
  **/
  public float rotate(float angleRot) {
    if(angleRot>-ROTATING_LIMIT) {angleRot = angleRot - ROTATING_STEP;}
    return angleRot;
  }
}
