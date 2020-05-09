package engine;

import processing.core.*;

public class Explosion extends Thread
{
  private static PApplet myApp;
  private int ttl;
  private float x;
  private float y;
  
  public Explosion(PApplet theApp, float theX, float theY) {
    myApp = theApp;
    x = theX;
    y = theY;
    ttl = 30;
  }
  
  public boolean show(){
    if(ttl>0) {
      myApp.fill(250,0,0);
      myApp.circle(x,y,(120-4*(ttl--)));
      myApp.noFill();
      
      if(ttl<15) {
        myApp.fill(250,250,250);
        myApp.circle(x,y,(110-8*(ttl--)));
        myApp.noFill();
      }
      return false;
    }
    return true;
  }
}
