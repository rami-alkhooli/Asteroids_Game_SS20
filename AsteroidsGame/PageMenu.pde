import processing.core.*;
import controlP5.*;

public class PageMenu extends GUImenu
{
  private PApplet myApp;
  private ControlP5 buttonPlay;
  private ControlP5 buttonLout;
  private ControlP5 buttonStat;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  **/
  public PageMenu(PApplet theApp, Game theGame) {
    myApp = theApp;
    
    buttonStat = new ControlP5(theApp);
    buttonPlay = new ControlP5(theApp);
    buttonLout = new ControlP5(theApp);
    
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    
    buttonPlay.addButton("start").setValue(0).setPosition(3*sWidth,3*sHeight).setSize(2*sWidth,sHeight/2).setId(5).show();
    buttonStat.addButton("statistics").setValue(0).setPosition(3*sWidth,4*sHeight).setSize(2*sWidth,sHeight/2).setId(4).show();
    buttonLout.addButton("log out").setValue(0).setPosition(3*sWidth,5*sHeight).setSize(2*sWidth,sHeight/2).setId(1).show();
  }
  
  /**
  * This method shows the buttons of the game won page.
  **/
  public void showButtons() {
    buttonPlay.show();
    buttonStat.show();
    buttonLout.show();
  }
  
  /**
  * This method shows the name of the game at the top after successfully logging in.
  **/
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Menu",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  /**
  * This method removes the layout of the menu page after logging in successfully into the data base.
  **/
  public void removeLayout() {
    buttonPlay.hide();
    buttonStat.hide();
    buttonLout.hide();
  }
}
