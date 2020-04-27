abstract class Asteroid
{
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
  
  protected Asteroid() {
    speedX = random(-1,1); speedY = random(-1,1);
  }
  
  protected void displayAndMove() {
    x1 += speedX; x2 += speedX; x3 += speedX; x4 += speedX; x5 += speedX; x6 += speedX;
    y1 += speedY; y2 += speedY; y3 += speedY; y4 += speedY; y5 += speedY; y6 += speedY;
    
    beginShape();
    vertex(x1,y1);
    vertex(x2,y2);
    vertex(x3,y3);
    vertex(x4,y4);
    vertex(x5,y5);
    vertex(x6,y6);
    endShape(CLOSE);
    
    // Randbedingungen
    if((x1>width)||(x2>width)||(x3>width)||(x4>width)||(x5>width)||(x6>width))
    { speedX = -speedX; }
    else if((x1<0)||(x2<0)||(x3<0)||(x4<0)||(x5<0)||(x6<0))
    { speedX = -speedX; }
    else if((y1>height)||(y2>height)||(y3>height)||(y4>height)||(y5>height)||(y6>height))
    { speedY = -speedY; }
    else if((y1<0)||(y2<0)||(y3<0)||(y4<0)||(y5<0)||(y6<0))
    { speedY = -speedY; }
  }
}

class AsteroidSmall extends Asteroid
{ 
  AsteroidSmall(float inX, float inY) {
    xCor = inX ;
    yCor = inY ;
    
    x1 = random( xCor+00 , xCor+20 ); 
    y1 = random( yCor+00 , yCor+20 );
    
    x2 = random( xCor+20 , xCor+40 );
    y2 = random( yCor+00 , yCor+20 );
    
    x3 = random( xCor+40 , xCor+50 );
    y3 = random( yCor+20 , yCor+40 );
    
    x4 = random( xCor+20 , xCor+30 );
    y4 = random( yCor+40 , yCor+50 );
    
    x5 = random( xCor+10 , xCor+20 );
    y5 = random( yCor+30 , yCor+40 );
    
    x6 = random( xCor+00 , xCor+10 );
    y6 = random( yCor+20 , yCor+40 );
  } 
}

class AsteroidBig extends Asteroid
{
  AsteroidBig(float inX, float inY) {
    xCor = inX ;
    yCor = inY ;
    
    x1 = random( xCor+40 , xCor+120 ); 
    y1 = random( yCor+00 , yCor+20 );
    
    x2 = random( xCor+120 , xCor+180 );
    y2 = random( yCor+20 , yCor+60 );
    
    x3 = random( xCor+120 , xCor+180 );
    y3 = random( yCor+100 , yCor+140 );
    
    x4 = random( xCor+40 , xCor+120 ); 
    y4 = random( yCor+140 , yCor+160 );
    
    x5 = random( xCor-20 , xCor+40 );
    y5 = random( yCor+100 , yCor+140 );
    
    x6 = random( xCor+00 , xCor+40 );
    y6 = random( yCor+20 , yCor+60 );
  } 
}
