import processing.core.*;

public class ShieldStateDamaged implements ShieldState
{
  private static final int COLOR = new PApplet().color(170,255,170);
  private static final int TRANSPARENCE = 200;
  private static final int STRENGTH = 50;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
}
