import processing.core.*;

public class SpaceStation
{
  private static final int BREITE = 200;
  private static float x;
  private static float y;
  
  private static SpaceStation mySpaceStation;
  private static PApplet myApp;
  
  private SpaceStation()
  {
  }
  
  public static SpaceStation create(PApplet theApp)
  {
    if(mySpaceStation == null)
    {
      myApp = theApp ;
      x = BREITE/2 ;
      y = myApp.height - (BREITE/2) ;
      mySpaceStation = new SpaceStation();
    }
    return mySpaceStation;
  }
  
  public void show()
  {
    myApp.fill(250,250,250);
    myApp.circle(x,y,BREITE);
    myApp.fill(170,185,185);
    myApp.circle(x,y,BREITE/2);
    myApp.noFill();
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  public float getRadius() {return (float)(BREITE/2);}
}
