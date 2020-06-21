import processing.core.*;

public interface RotationState
{
  /**
  * This method is used to rotate the space ship and stop it from rotating.
  *
  * @param angleRot holds the angle, the current angle of the space ship will be increased or decreased by.
  * @returns the new angle after changing it.
  **/
  public float rotate(float angleRot);
  
  public static final float ROTATING_STEP = (float) 0.2;
  public static final float ROTATING_LIMIT = (float) 3.0;
  public static final float ROTATING_CRITICAL = (float) 0.5;
}
