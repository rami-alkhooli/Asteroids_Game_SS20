// Tutorial: https://forum.processing.org/two/discussion/18060/singleton-pattern-with-my-project

import processing.core.*;

public class Typer
{
  private static PApplet app;
  private static Typer myTyper;
  private int myID;
  
  private Typer(int id) {
    myID = id;
    app.print("A Constructor with the ID " + id + " was just called\n");
  }
  
  public static Typer getTyper(PApplet theApp, int theID) {
    if(myTyper==null) {
      myTyper = new Typer(theID);
      app = theApp;
    }
    return myTyper;
  }
  
  public void say()
  {
    app.print("Hello, my ID is " + myID + "\n");
  }
}
