import processing.core.*;

interface Shield
{
  public short protect(PApplet theApp, float x,float y, float radius);
}

class Full implements Shield
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(80,160,160);
    theApp.circle(x,y,2*radius);
    return 100;
  }
}

class Damaged implements Shield
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    theApp.fill(60,120,120);
    theApp.circle(x,y,2*radius);
    return 50;
  }
}

class Destroyed implements Shield
{
  public short protect(PApplet theApp, float x,float y, float radius) {
    return 0;
  }
  
}
