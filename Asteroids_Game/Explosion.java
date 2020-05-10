import processing.core.*;
import processing.sound.*;

public class Explosion extends Thread
{
  private static PApplet myApp;
  private static final String explosionFile = "explosion.mp3";
  private static final int MAXRADIUS = 120;
  private static final int REDGROWTHRATE = 4;
  private static final int WHITEGROWTHRATE = 8;
  private static final int OUTCOLOR = new PApplet().color(255,0,0);
  private static final int INCOLOR = new PApplet().color(250,250,250);
  private SoundFile explosionSound;
  private int ttl;
  private float x;
  private float y;
  
  public Explosion(PApplet theApp, float theX, float theY) {
    
    myApp = theApp;
    x = theX;
    y = theY;
    ttl = 30;
    explosionSound = new SoundFile(myApp,explosionFile);
    explosionSound.play();
    
  }
  
  public boolean show() {
    
    if(ttl>0) {
      
      myApp.fill(OUTCOLOR);
      myApp.circle(x,y,(MAXRADIUS-REDGROWTHRATE*(ttl--)));
      myApp.noFill();
      
      if(ttl<(MAXRADIUS/WHITEGROWTHRATE)) {
        
        myApp.fill(INCOLOR);
        myApp.circle(x,y,(MAXRADIUS-WHITEGROWTHRATE*(ttl--)));
        myApp.noFill();
        
      }
      
      return false;
      
    }
    
    return true;
    
  }
}
