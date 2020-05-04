import processing.core.*;

class Starter
{
  private static PApplet myApp;
  private static Starter myStarter;
  
  private Class1 c1;
  private Class2 c2;
  private Class3 c3;
  
  private Starter(PApplet theApp)
  {
    myApp = theApp;
    myApp.print("\nA Starter was just created\n");
    c1 = Class1.makeClass1(theApp);
    c2 = Class2.makeClass2(theApp);
    c3 = Class3.makeClass3(theApp);
  }
  
  public static Starter launchStarter(PApplet theApp)
  {
    if(myStarter==null) myStarter = new Starter(theApp);
    
    return myStarter;
  }
  
  void showClasses()
  {
    c1.show();
    c2.show();
    c3.show();
  }
  
  void drawClasses()
  {
    c1.drawMe();
    c2.drawMe();
    c3.drawMe();
  }
}
