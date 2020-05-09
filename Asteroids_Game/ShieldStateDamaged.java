import processing.core.*;

public class ShieldStateDamaged implements ShieldState
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(60,120,120,200);
    theApp.circle(x,y,2*radius);
    return 50;
  }
}
