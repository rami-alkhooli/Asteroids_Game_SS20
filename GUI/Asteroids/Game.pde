import processing.core.*;

public class Game
{
  private GUI gui;
  private PApplet myApp;
  
  private Game (PApplet theApp) {

    myApp = theApp;
    gui = new PageLogin(myApp);
    
  }
  
  
  public void run() {
    gui.show();
  }
  
  public void change2Login () {gui.end(); gui = new PageLogin(myApp);}
  public void change2Register () {gui.end(); gui = new PageRegister(myApp);}
  public void change2Menu () {gui.end(); gui = new PageMenu(myApp);}
  public void change2Play () {gui.end(); gui = new PagePlay(myApp);}
  public void change2Gameover () {gui.end(); gui = new PageGameover(myApp);}
  public void change2Statistics () {gui.end(); gui = new PageStatistics(myApp);}
}
