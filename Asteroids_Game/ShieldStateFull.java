import processing.core.*;

public class ShieldStateFull implements ShieldState
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(80,160,160,255);
    theApp.circle(x,y,2*radius);
    return 100;
  }
}
