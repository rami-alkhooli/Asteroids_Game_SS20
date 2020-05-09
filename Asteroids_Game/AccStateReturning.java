package engine;

import processing.core.*;

public class AccStateReturning implements AccelerationState
{
  public float accelerate(float speed) {
  if (speed>-ACCELERATING_LIMIT) {speed = speed - ACCELERATING_STEP;}
  return speed;
  }
  
  public void generateThrust(PApplet app, float x, float y, float up, float down, float angle) {
  }
}
