import processing.core.*;

public class Asteroid
{
  private static PApplet myApp;
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
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theLevel is an object of the class Level, that holds the current level of the game.
  * @param ragedness holds the rageddness of the generated asteroid in a float number (the distance between midpoint and surface).
  * @param vertices holds the number of edges of the generated asteroid.
  **/
  public Asteroid(PApplet theApp, Level theLevel, float rageddness, int vertices) {
    
    myApp = theApp;
    
    MAXRADIUS = myApp.random((myApp.width/26),(myApp.width/13));
    MINRADIUS = MAXRADIUS/rageddness;
    MAXVERTICES = vertices ;
    value = (short) myApp.random(0,4);
    xPoint = new float[vertices];
    yPoint = new float[vertices];
    x = myApp.random(20,myApp.width/4) ;
    y = myApp.random(0,myApp.height) ;
    speedX = myApp.random(-theLevel.determineSpeed(),theLevel.determineSpeed());
    speedY = myApp.random(-theLevel.determineSpeed(),theLevel.determineSpeed());
    
    float angle = 0;
    float section = 360/vertices;
    
    for (int n=0 ; n<MAXVERTICES ; n++) {
    
      xPoint[n] = ( (int)(myApp.random(MINRADIUS,MAXRADIUS)) ) * (myApp.cos(myApp.radians(myApp.random(angle,angle+section))));
      yPoint[n] = ( (int)(myApp.random(MINRADIUS,MAXRADIUS)) ) * (myApp.sin(myApp.radians(myApp.random(angle,angle+section))));
      angle += section ;
      
    }
    
  }
  
  /**
  * This method updates the properties of the asteroid and draws it.
  **/
  public void show() {
    
    updateCoordinates();
    drawBoundary();
    drawShape();
    checkBorders();
    
  }
  
  /**
  * This method checks if the asteroid has passed the corners and reverses it from the other corner.
  **/
  private void checkBorders() {
    
    if( x > myApp.width+MAXRADIUS ) {x-=(myApp.width+(2*MAXRADIUS)) ;}
    if( x < (-MAXRADIUS) ) {x+=(myApp.width+(2*MAXRADIUS)) ;}
    if( y > myApp.height+MAXRADIUS ) {y-=(myApp.height+(2*MAXRADIUS)) ;}
    if( y < (-MAXRADIUS) ) {y+=(myApp.height+(2*MAXRADIUS)) ;}
    
  }
  
  /**
  * This method draws a circle around the asteroid so that a collision can be easily detected.
  **/
  private void drawBoundary() {
    
    myApp.fill(COLOR,TRANSPARENCE);
    myApp.circle(x,y,2*MAXRADIUS);
    
  }
  
  /**
  * This method draws the asteroid of the current level.
  **/
  private void drawShape() {
    
    myApp.fill(COLOR);
    myApp.beginShape();
    
    for(int n=0 ; n<MAXVERTICES ; n++) {
      myApp.vertex(x+xPoint[n],y+yPoint[n]);
    }
    
    myApp.endShape(myApp.CLOSE);
    myApp.noFill();
    
  }
  
  /**
  * This method updates the coordinates of the asteroid on the x and y axis.
  **/
  private void updateCoordinates() {
    
    x += speedX;
    y += speedY;
    
  }
  
  /**
  * This is a getter method.
  * 
  * @returns the coordinate on the x axis.
  **/
  public float getX() {return x;}
  
  /**
  * This is a getter method 
  * 
  * @returns the coordinate on the y axis.
  **/
  public float getY() {return y;}
  
  /**
  * This is a getter method 
  * 
  * @returns the longest radius of the asteroid (the radius of the bounding circle).
  **/
  public float getRadius() {return MAXRADIUS;}
}
