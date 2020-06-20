import processing.core.*;
import processing.sound.*;

public class Explosion extends Thread
{
  private static PApplet myApp;
  private static final String explosionFile = "explosion.mp3";
  private final int MAXRADIUS;
  private final int REDGROWTHRATE;
  private final int WHITEGROWTHRATE;
  private static final int OUTCOLOR = new PApplet().color(255,0,0);
  private static final int INCOLOR = new PApplet().color(250,250,250);
  private SoundFile explosionSound;
  private int ttl;
  private float x;
  private float y;
  
  /**
  * The default constructor
  *
  * @param theApp is an object to access and use processing functions in the current application
  * @param theX holds the coordinate of the collison's position on the x axis 
  * @param theY holds the coordinate of the collison's position on the y axis 
  **/
  public Explosion(PApplet theApp, float theX, float theY) {
    
    myApp = theApp;
    MAXRADIUS = myApp.width/22;
    REDGROWTHRATE = myApp.width/700;
    WHITEGROWTHRATE = myApp.width/350;
    x = theX;
    y = theY;
    ttl = 30;
    explosionSound = new SoundFile(myApp,explosionFile);
    explosionSound.play();
    
  }
  
  /**
  * This method draws an explosion where two objects collide for a half second
  *
  * @returns bool value if finished: false if still drawing / true if finished drawing
  **/
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
