import processing.core.*;

class Class2 
{
  private final int id = 2;
  
  private static Class2 myObject;
  private static PApplet myApp;
  
  private Class2(PApplet theApp)
  {
    myApp = theApp;
  }
  
  public static Class2 makeClass2(PApplet theApp)
  {
    if(myObject==null) myObject = new Class2(theApp);
    
    return myObject;
  }
  
  void show()
  {
    myApp.print("Hi, I'm Class 2!\n");
  }
}
