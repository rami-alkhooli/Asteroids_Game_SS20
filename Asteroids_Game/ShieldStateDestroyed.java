import processing.core.*;

public class ShieldStateDestroyed implements ShieldState
{
  private static final int COLOR = new PApplet().color(151,151,151);
  private static final int TRANSPARENCE = 100;
  private static final int STRENGTH = 0;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
  
}
