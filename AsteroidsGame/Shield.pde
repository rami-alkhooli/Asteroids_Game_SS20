import processing.core.*;

public interface ShieldState
{
  public short protect(PApplet theApp, float x,float y, float radius);
}

public class ShieldStateFull implements ShieldState
{
  private static final int COLOR = new PApplet().color(170,255,170);
  private static final int TRANSPARENCE = 200;
  private static final int STRENGTH = 100;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
}

public class ShieldStateDamaged implements ShieldState
{
  private static final int COLOR = new PApplet().color(170,255,170);
  private static final int TRANSPARENCE = 150;
  private static final int STRENGTH = 50;
  
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(COLOR,TRANSPARENCE);
    theApp.circle(x,y,2*radius);
    return STRENGTH;
  }
}

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
