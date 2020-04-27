interface Shield
{
  public short protect(float x,float y, float radius);
}

class Full implements Shield
{
  public short protect(float x,float y, float radius) {
    fill(80,160,160);
    circle(x,y,2*radius);
    return 100;
  }
}

class Damaged implements Shield
{
  public short protect(float x,float y, float radius) {
    fill(60,120,120);
    circle(x,y,2*radius);
    return 50;
  }
}

class Destroyed implements Shield
{
  public short protect(float x,float y, float radius) {
    return 0;
  }
  
}
