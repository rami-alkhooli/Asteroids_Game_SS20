import processing.core.*;

public class ShieldStateDestroyed implements ShieldState
{
  private static final int STRENGTH = 0;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    return STRENGTH;
  }
  
}
