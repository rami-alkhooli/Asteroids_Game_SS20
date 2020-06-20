import processing.core.*;
import controlP5.*;

public class PageStatistics extends GUIstatistics
{
  private ControlP5 buttonBack;
  private PApplet myApp;
  private Game myGame;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  **/
  public PageStatistics(PApplet theApp, Game theGame) {
    myApp = theApp;
    myGame = theGame;
    buttonBack = new ControlP5(theApp);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    buttonBack.addButton("menu").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
  }
  
  /**
  * This method shows the buttons of the statistics page.
  **/
  public void showButtons() {
    buttonBack.show();
  }
  
  /**
  * This method shows statistics of the player.
  **/
  public void showStatistics() {
    textAlign(CENTER,CENTER);
    textSize(width/40);
    fill(250,250,250);
    text("Highscore: " + myGame.getHighscore() + "\nScore: " + myGame.getScore() + "\nItems: " + myGame.getItems() + "\n Shots: " + myGame.getShots() + "\nHits: " + myGame.getHits() + "\nSession Play Time: " + myGame.getPlayTime() + "\nTotal Play Time: " + myGame.getTotalPlayTime() ,width/2,height/2);
    noFill();
  }
  
  /**
  * This method shows the name of the game at the top while showing statistics.
  **/
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Statistics",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  /**
  * This method removes the layout of the statistics page when leaving it.
  **/
  public void removeLayout() {
    buttonBack.hide();
  }
}
