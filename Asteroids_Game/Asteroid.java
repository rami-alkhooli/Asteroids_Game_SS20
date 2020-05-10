import processing.core.*;

public class Asteroid
{
  private static PApplet myApp;
  private static final int MAXSPEED = 2;
  private static final int COLOR = new PApplet().color(233,237,246);
  private static final int TRANSPARENCE = 100;
  private final float MINRADIUS;
  private final float MAXRADIUS;
  private final int MAXVERTICES;
  private short value;
  private float x;
  private float y;
  private float speedX;
  private float speedY;
  private float[] xPoint;
  private float[] yPoint;
  
  public Asteroid(PApplet theApp, float rageddness, int vertices) {
    
    myApp = theApp;
    
    MAXRADIUS = myApp.random((myApp.width/25),(myApp.width/13));
    MINRADIUS = MAXRADIUS/rageddness;
    MAXVERTICES = vertices ;
    value = (short) myApp.random(0,4);
    xPoint = new float[vertices];
    yPoint = new float[vertices];
    x = myApp.random(20,myApp.width/4) ;
    y = myApp.random(0,myApp.height) ;
    speedX = myApp.random(-MAXSPEED,MAXSPEED);
    speedY = myApp.random(-MAXSPEED,MAXSPEED);
    
    float angle = 0;
    float section = 360/vertices;
    
    for (int n=0 ; n<MAXVERTICES ; n++) {
    
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
    
  private void checkBorders() {
    
    if( x > myApp.width+MAXRADIUS ) {x-=(myApp.width+(2*MAXRADIUS)) ;}
    if( x < (-MAXRADIUS) ) {x+=(myApp.width+(2*MAXRADIUS)) ;}
    if( y > myApp.height+MAXRADIUS ) {y-=(myApp.height+(2*MAXRADIUS)) ;}
    if( y < (-MAXRADIUS) ) {y+=(myApp.height+(2*MAXRADIUS)) ;}
    
  }
  
  private void drawBoundary() {
    
    myApp.fill(COLOR,TRANSPARENCE);
    myApp.circle(x,y,2*MAXRADIUS);
    
  }
  
  private void drawShape() {
    
    myApp.fill(COLOR);
    myApp.beginShape();
    
    for(int n=0 ; n<MAXVERTICES ; n++) {
      myApp.vertex(x+xPoint[n],y+yPoint[n]);
    }
    
    myApp.endShape(myApp.CLOSE);
    myApp.noFill();
    
  }
  
  private void updateCoordinates() {

    x += speedX;
    y += speedY;
    
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getRadius() {return MAXRADIUS;}
}
