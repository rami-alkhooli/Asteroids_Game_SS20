import processing.core.*;

class Thrust
{
  private final float HEAD1;
  private final float SIDE1;
  private final float HEAD2;
  private final float SIDE2;
  
  private float xb1;
  private float yb1;
  private float xb2;
  private float yb2;
  private float xb3;
  private float yb3;
  
  private float xs1;
  private float ys1;
  private float xs2;
  private float ys2;
  private float xs3;
  private float ys3;
  
  private static Thrust myThrust;
  private static PApplet myApp;
  
  private Thrust(PApplet theApp, float upSide, float downSide) {
    myApp = theApp;
    HEAD1 = downSide + upSide/2 + downSide/2 ;
    SIDE1 = downSide/myApp.cos(myApp.radians(45/2)) ;
    HEAD2 = downSide + upSide/4 + downSide/4 ;
    SIDE2 = downSide/myApp.cos(myApp.radians(45/4)) ;
  }
  
  public static Thrust generateThrust(PApplet theApp, float upSide, float downSide)
  {
    if(myThrust==null){
      myThrust = new Thrust(theApp,upSide,downSide);
    }
    
    return myThrust;
  }
  
  public void show(float x, float y, float angle) {
    xb1 = x - SIDE1*myApp.cos(myApp.radians((float)(angle-157.5)));
    yb1 = y - SIDE1*myApp.sin(myApp.radians((float)(angle-157.5)));
    xb2 = x - HEAD1*myApp.cos(myApp.radians((float)(angle-180)));
    yb2 = y - HEAD1*myApp.sin(myApp.radians((float)(angle-180)));
    xb3 = x - SIDE1*myApp.cos(myApp.radians((float)(angle+157.5)));
    yb3 = y - SIDE1*myApp.sin(myApp.radians((float)(angle+157.5)));
    myApp.fill(255,246,138,200);
    myApp.triangle(xb1,yb1,xb2,yb2,xb3,yb3);
    
    xs1 = x - SIDE2*myApp.cos(myApp.radians((float)(angle-168.75)));
    ys1 = y - SIDE2*myApp.sin(myApp.radians((float)(angle-168.75)));
    xs2 = x - HEAD2*myApp.cos(myApp.radians((float)(angle-180)));
    ys2 = y - HEAD2*myApp.sin(myApp.radians((float)(angle-180)));
    xs3 = x - SIDE2*myApp.cos(myApp.radians((float)(angle+168.75)));
    ys3 = y - SIDE2*myApp.sin(myApp.radians((float)(angle+168.75)));
    myApp.fill(255,80,80,200);
    myApp.triangle(xs1,ys1,xs2,ys2,xs3,ys3);
  }
}
