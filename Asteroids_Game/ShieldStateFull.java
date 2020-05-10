import processing.core.*;

public class ShieldStateFull implements ShieldState
{
  private static final int COLOR = new PApplet().color(80,160,160);
  private static final int TRANSPARENCE = 255;
  private static final int STRENGTH = 100;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
}
