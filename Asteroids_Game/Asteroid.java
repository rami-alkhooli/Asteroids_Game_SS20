import processing.core.*;

class Asteroid
{
  private final float MINRADIUS;
  private final float MAXRADIUS;
  private final int MAXVERTICES;
  private float x = 0;
  private float y = 0;
  private float speedX;
  private float speedY;
  private float[] xPoint;
  private float[] yPoint;
  private static PApplet myApp;
  
  public Asteroid(PApplet theApp, float theX, float theY, float rageddness, float radius, int maxVertices) {
    MAXVERTICES = maxVertices ;
    MAXRADIUS = radius;
    xPoint = new float[maxVertices];
    yPoint = new float[maxVertices];
    myApp = theApp;
    x = theX ;
    y = theY ;
    speedX = myApp.random(-2,2);
    speedY = myApp.random(-2,2);
    MINRADIUS = radius/rageddness;
    
    float angle = 0;
    float section = 360/maxVertices;
    
    for (int n=0 ; n<MAXVERTICES ; n++)
    {
      xPoint[n] = ( (int)(myApp.random(MINRADIUS,MAXRADIUS)) ) * (myApp.cos(myApp.radians(myApp.random(angle,angle+section))));
      yPoint[n] = ( (int)(myApp.random(MINRADIUS,MAXRADIUS)) ) * (myApp.sin(myApp.radians(myApp.random(angle,angle+section))));
      angle += section ;
    }
  }
  
  public void show() {
    updateCoordinates();
    drawBoundary();
    drawShape();
    checkBorders();
  }
    
  private void checkBorders()
  {
    if( x > myApp.width+MAXRADIUS ) {x-=(myApp.width+(2*MAXRADIUS)) ;}
    if( x < (-MAXRADIUS) ) {x+=(myApp.width+(2*MAXRADIUS)) ;}
    if( y > myApp.height+MAXRADIUS ) {y-=(myApp.height+(2*MAXRADIUS)) ;}
    if( y < (-MAXRADIUS) ) {y+=(myApp.height+(2*MAXRADIUS)) ;}
  }
  
  private void drawBoundary()
  {
    myApp.fill(150,150,150,100);
    myApp.circle(x,y,2*MAXRADIUS);
  }
  
  private void drawShape()
  {
    myApp.fill(154,150,146);
    myApp.beginShape();
    for(int n=0 ; n<MAXVERTICES ; n++)
    {
      myApp.vertex(x+xPoint[n],y+yPoint[n]);
    }
    myApp.endShape(myApp.CLOSE);
    myApp.noFill();
  }
  
  private void updateCoordinates()
  {
    x += speedX;
    y += speedY;
  }
}
