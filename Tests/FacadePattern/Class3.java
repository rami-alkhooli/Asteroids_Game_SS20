import processing.core.*;

class Class3 
{
  private final int id = 3;
  
  private static Class3 myObject;
  private static PApplet myApp;
  
  private Class3(PApplet theApp)
  {
    myApp = theApp;
  }
  
  public static Class3 makeClass3(PApplet theApp)
  {
    if(myObject==null) myObject = new Class3(theApp);
    
    return myObject;
  }
  
  void show()
  {
    myApp.print("Hi, I'm Class 3!\n");
  }
  
  void drawMe()
  {
    myApp.fill(0,0,255);
    myApp.circle(750,250,100);
  }
}
