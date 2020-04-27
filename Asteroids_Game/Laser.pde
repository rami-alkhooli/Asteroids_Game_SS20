class Laser
{    
  private final float x;
  private final float y;
  private final float phi;  
  private int born;
  private float i;
  private int ttl;
  private Laser thisLaser;
  
  public Laser() {
    x=0;
    y=0;
    phi=0;
  }
  
  private Laser(float myX, float myY, float myPhi) {
    x = myX;
    y = myY;
    phi = myPhi;
    ttl=30;
    i=0;
    born = second();
    //print("\nconstructor");
  }
  
  public boolean shoot() {
      if(ttl>0) {
        ttl--;
        i+=20;
        float movingX = x - i*cos(radians(phi));
        float movingY = y - i*sin(radians(phi));
        fill(255,0,0,195+(2*ttl));
        circle(movingX,movingY,20);
        
        return true;
    }
    else return false;
  }
  
  public Laser create(float myX, float myY, float myPhi) {
    if(thisLaser==null) {return new Laser(myX,myY,myPhi);}
    else return thisLaser;
  }
  
  public void finalize() {
    //print("\ndestructor");
  }
}
