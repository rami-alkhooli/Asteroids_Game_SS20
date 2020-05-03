import processing.core.*;

class Laser
{    
  private final float x;
  private final float y;
  private final float phi;  
  private int born;
  private float i;
  private int ttl;
  private Laser thisLaser;
  private static PApplet myApp;
  
  public Laser(PApplet theApp) {
    myApp = theApp;
    x=0;
    y=0;
    phi=0;
  }
  
  public Laser(PApplet theApp, float myX, float myY, float myPhi) {
    myApp = theApp;
    x = myX;
    y = myY;
    phi = myPhi;
    ttl=30;
    i=0;
    born = myApp.second();
    //print("\nconstructor");
  }
  
  public boolean shoot() {
      if(ttl>0) {
        ttl--;
        i+=20;
        float movingX = x - i*myApp.cos(myApp.radians(phi));
        float movingY = y - i*myApp.sin(myApp.radians(phi));
        myApp.fill(255,0,0,195+(2*ttl));
        myApp.circle(movingX,movingY,20);
        
        return true;
    }
    else return false;
  }
  
  //public Laser create(float myX, float myY, float myPhi) {
  //  if(thisLaser==null) {return new Laser(this,myX,myY,myPhi);}
  //  else return thisLaser;
  //}
  
  public void finalize() {
    //print("\ndestructor");
  }
}
