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
  
  public Thrust(float upSide, float downSide) {
    HEAD1 = downSide + upSide/2 + downSide/2 ;
    SIDE1 = downSide/cos(radians(45/2)) ;
    HEAD2 = downSide + upSide/4 + downSide/4 ;
    SIDE2 = downSide/cos(radians(45/4)) ;
    
  }
  public void show(float x, float y, float angle) {
    xb1 = x - SIDE1*cos(radians(angle-157.5));
    yb1 = y - SIDE1*sin(radians(angle-157.5));
    xb2 = x - HEAD1*cos(radians(angle-180));
    yb2 = y - HEAD1*sin(radians(angle-180));
    xb3 = x - SIDE1*cos(radians(angle+157.5));
    yb3 = y - SIDE1*sin(radians(angle+157.5));
    fill(#fff68a);
    triangle(xb1,yb1,xb2,yb2,xb3,yb3);
    
    xs1 = x - SIDE2*cos(radians(angle-168.75));
    ys1 = y - SIDE2*sin(radians(angle-168.75));
    xs2 = x - HEAD2*cos(radians(angle-180));
    ys2 = y - HEAD2*sin(radians(angle-180));
    xs3 = x - SIDE2*cos(radians(angle+168.75));
    ys3 = y - SIDE2*sin(radians(angle+168.75));
    fill(#ff5050);
    triangle(xs1,ys1,xs2,ys2,xs3,ys3);
  }
}
