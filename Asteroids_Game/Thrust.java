package engine;

import processing.core.*;

public class Thrust
{
  private final float HEAD1;
  private final float SIDE1;
  private final float HEAD2;
  private final float SIDE2;
  
  private float[] xb;
  private float[] yb;
  private float[] xs;
  private float[] ys;
  
  private static Thrust myThrust;
  private static PApplet myApp;
  
  private Thrust(PApplet theApp, float upSide, float downSide) {
    myApp = theApp;
    xb = new float[3];
    yb = new float[3];
    xs = new float[3];
    ys = new float[3];
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
    xb[0] = x - SIDE1*myApp.cos(myApp.radians((float)(angle-157.5)));
    yb[0] = y - SIDE1*myApp.sin(myApp.radians((float)(angle-157.5)));
    xb[1] = x - HEAD1*myApp.cos(myApp.radians((float)(angle-180)));
    yb[1] = y - HEAD1*myApp.sin(myApp.radians((float)(angle-180)));
    xb[2] = x - SIDE1*myApp.cos(myApp.radians((float)(angle+157.5)));
    yb[2] = y - SIDE1*myApp.sin(myApp.radians((float)(angle+157.5)));
    myApp.fill(255,246,138,200);
    myApp.triangle(xb[0],yb[0],xb[1],yb[1],xb[2],yb[2]);
    
    xs[0] = x - SIDE2*myApp.cos(myApp.radians((float)(angle-168.75)));
    ys[0] = y - SIDE2*myApp.sin(myApp.radians((float)(angle-168.75)));
    xs[1] = x - HEAD2*myApp.cos(myApp.radians((float)(angle-180)));
    ys[1] = y - HEAD2*myApp.sin(myApp.radians((float)(angle-180)));
    xs[2] = x - SIDE2*myApp.cos(myApp.radians((float)(angle+168.75)));
    ys[2] = y - SIDE2*myApp.sin(myApp.radians((float)(angle+168.75)));
    myApp.fill(255,80,80,200);
    myApp.triangle(xs[0],ys[0],xs[1],ys[1],xs[2],ys[2]);
  }
}
