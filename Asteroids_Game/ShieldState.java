package engine;

import processing.core.*;

public interface ShieldState
{
  public short protect(PApplet theApp, float x,float y, float radius);
}
