import processing.core.*;

class Asteroid
{
  protected int SIZE;
  protected float xCor = 0;
  protected float yCor = 0;
  protected float speedX;
  protected float speedY;
  protected float x1;
  protected float y1;
  protected float x2;
  protected float y2;
  protected float x3;
  protected float y3;
  protected float x4;
  protected float y4;
  protected float x5;
  protected float y5;
  protected float x6;
  protected float y6;
  
  private static PApplet myApp;
  
  public Asteroid(PApplet theApp, float inX, float inY, int size) {
    myApp = theApp;
    xCor = inX ;
    yCor = inY ;
    speedX = myApp.random(-2,2); speedY = myApp.random(-2,2);
    SIZE = size;
    
    x1 = myApp.random( (float)(xCor+(0.0*SIZE)) , (float)(xCor+(0.4*SIZE)) ); 
    y1 = myApp.random( (float)(yCor+(0.0*SIZE)) , (float)(yCor+(0.4*SIZE)) );
    
    x2 = myApp.random( (float)(xCor+(0.4*SIZE)) , (float)(xCor+(0.8*SIZE)) );
    y2 = myApp.random( (float)(yCor+(0.0*SIZE)) , (float)(yCor+(0.4*SIZE)) );
    
    x3 = myApp.random( (float)(xCor+(0.8*SIZE)) , (float)(xCor+(1.0*SIZE)) );
    y3 = myApp.random( (float)(yCor+(0.4*SIZE)) , (float)(yCor+(0.8*SIZE)) );
    
    x4 = myApp.random( (float)(xCor+(0.4*SIZE)) , (float)(xCor+(0.6*SIZE)) );
    y4 = myApp.random( (float)(yCor+(0.8*SIZE)) , (float)(yCor+(1.0*SIZE)) );
    
    x5 = myApp.random( (float)(xCor+(0.2*SIZE)) , (float)(xCor+(0.4*SIZE)) );
    y5 = myApp.random( (float)(yCor+(0.6*SIZE)) , (float)(yCor+(0.8*SIZE)) );
    
    x6 = myApp.random( (float)(xCor+(0.0*SIZE)) , (float)(xCor+(0.2*SIZE)) );
    y6 = myApp.random( (float)(yCor+(0.4*SIZE)) , (float)(yCor+(0.8*SIZE)) );
  }
  
  public void displayAndMove() {
    x1 += speedX; x2 += speedX; x3 += speedX; x4 += speedX; x5 += speedX; x6 += speedX;
    y1 += speedY; y2 += speedY; y3 += speedY; y4 += speedY; y5 += speedY; y6 += speedY;
    
    myApp.beginShape();
    myApp.vertex(x1,y1);
    myApp.vertex(x2,y2);
    myApp.vertex(x3,y3);
    myApp.vertex(x4,y4);
    myApp.vertex(x5,y5);
    myApp.vertex(x6,y6);
    myApp.endShape(myApp.CLOSE);
    
    // Randbedingungen
    if((x1>myApp.width)&&(x2>myApp.width)&&(x3>myApp.width)&&(x4>myApp.width)&&(x5>myApp.width)&&(x6>myApp.width))
    { x1-=(myApp.width+SIZE); x2-=(myApp.width+SIZE); x3-=(myApp.width+SIZE); x4-=(myApp.width+SIZE); x5-=(myApp.width+SIZE); x6-=(myApp.width+SIZE); }
    
    if((x1<0)&&(x2<0)&&(x3<0)&&(x4<0)&&(x5<0)&&(x6<0))
    { x1+=(myApp.width+SIZE); x2+=(myApp.width+SIZE); x3+=(myApp.width+SIZE); x4+=(myApp.width+SIZE); x5+=(myApp.width+SIZE); x6+=(myApp.width+SIZE); }
    
    if((y1>myApp.height)&&(y2>myApp.height)&&(y3>myApp.height)&&(y4>myApp.height)&&(y5>myApp.height)&&(y6>myApp.height))
    { y1-=(myApp.height+SIZE); y2-=(myApp.height+SIZE); y3-=(myApp.height+SIZE); y4-=(myApp.height+SIZE); y5-=(myApp.height+SIZE); y6-=(myApp.height+SIZE); }
    
    if((y1<0)&&(y2<0)&&(y3<0)&&(y4<0)&&(y5<0)&&(y6<0))
    { y1+=(myApp.height+SIZE); y2+=(myApp.height+SIZE); y3+=(myApp.height+SIZE); y4+=(myApp.height+SIZE); y5+=(myApp.height+SIZE); y6+=(myApp.height+SIZE); }
  }
}
