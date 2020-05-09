import processing.core.*;

class Timer extends Thread
{
  private int ttl;
  private int id;
  private static PApplet myApp;
  
  public Timer (int theID, int time)
  {
    id = theID;
    ttl = time;
  }
  
  public void start(PApplet theApp)
  {
    try {
    myApp = theApp;
    super.start();
    }
    catch (IllegalThreadStateException e) {}
  }
     
   public void run()
   {
     while(ttl>0) {myApp.println("ID: " + id + " has " + ttl-- + " seconds to live."); myApp.delay(1000);}
     if(ttl==0) {myApp.println("ID: " + id + " is dead!");}
   }
}
