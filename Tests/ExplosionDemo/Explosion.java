import processing.core.*;

public class Explosion
{
  private static PApplet myApp;
  private int ttl;
  private float x;
  private float y;
  
  public Explosion(PApplet theApp, float theX, float theY) {
    myApp = theApp;
    x = theX;
    y = theY;
    ttl = 60;
  }
  
  public boolean show(){
    if(ttl>0) {
      myApp.fill(250,0,0);
      myApp.circle(x,y,(120-2*(ttl--)));
      myApp.noFill();
      
      if(ttl<30) {
        myApp.fill(250,250,250);
        myApp.circle(x,y,(110-4*(ttl--)));
        myApp.noFill();
      }
      return false;
    }
    else {
      return true;
    }
  }
}
