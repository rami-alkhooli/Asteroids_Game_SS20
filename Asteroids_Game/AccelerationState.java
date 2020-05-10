import processing.core.*;

public interface AccelerationState
{
  public float accelerate(float speed ,float size);
  public void generateThrust(PApplet theApp, float x, float y, float up, float down, float angle);
}
