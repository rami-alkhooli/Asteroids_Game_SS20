package engine;

import processing.core.*;

public interface AccelerationState
{
  public float accelerate(float speed);
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle);
  
  public static final float ACCELERATING_STEP = (float) 0.2;
  public static final float ACCELERATING_LIMIT = (float) 10.0;
  public static final float ACCELERATING_CRITICAL = (float) 0.5;
}
