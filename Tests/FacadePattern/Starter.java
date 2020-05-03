import processing.core.*;

class Starter
{
  private static PApplet myApp;
  private static Starter myStarter;
  
  private Starter(PApplet theApp)
  {
    myApp = theApp;
    myApp.print("\nA Starter was just created\n");
  }
  
  public static Starter launchStarter(PApplet theApp)
  {
    if(myStarter==null) myStarter = new Starter(theApp);
    
    return myStarter;
  }
}
