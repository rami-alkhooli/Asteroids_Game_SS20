import processing.core.*;

class Class1 
{
  private final int id = 1;
  
  private static Class1 myObject;
  private static PApplet myApp;
  
  private Class1(PApplet theApp)
  {
    myApp = theApp;
  }
  
  public static Class1 makeClass1(PApplet theApp)
  {
    if(myObject==null) myObject = new Class1(theApp);
    
    return myObject;
  }
  
  void show()
  {
    myApp.print("Hi, I'm Class 1!\n");
  }
  
  void drawMe()
  {
    myApp.fill(255,0,0);
    myApp.circle(250,250,100);
  }
}
