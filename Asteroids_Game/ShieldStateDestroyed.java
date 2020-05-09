import processing.core.*;

public class ShieldStateDestroyed implements ShieldState
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    return 0;
  }
  
}
