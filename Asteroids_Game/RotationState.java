package engine;

import processing.core.*;

public interface RotationState
{
  public float rotate(float angleRot);
  
  public static final float ROTATING_STEP = (float) 0.2;
  public static final float ROTATING_LIMIT = (float) 3.0;
  public static final float ROTATING_CRITICAL = (float) 0.5;
}
