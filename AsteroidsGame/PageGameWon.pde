import processing.core.*;
import controlP5.*;

public class PageGameWon extends GUIgamewon
{
  private int ttl;
  private SoundFile wonSound;
  private ControlP5 buttonBack;
  private PApplet myApp;
  private Game myGame;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  **/
  public PageGameWon(PApplet theApp, Game theGame) {
    myApp = theApp;
    myGame = theGame;
    buttonBack = new ControlP5(theApp);
    wonSound = new SoundFile(theApp,"won.mp3");
    ttl = 180;
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    buttonBack.addButton("menu").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
    wonSound.play();
  }
  
  /**
  * This method shows the buttons of the game won page.
  **/
  public void showButtons() {
    buttonBack.show();
  }
  
  /**
  * This method shows the text "congratulations !" after winnig the game.
  **/
  public void showGameover() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/40);
    fill(255,0,0);
    text("Congratulations !", width/2, height/2);
    noFill();
  }
  
  /**
  * This method shows the score made after winnig the game.
  **/
  public void showScore() {
    textAlign(CENTER, CENTER);
    textSize(myApp.width/60);
    fill(255,255,255);
    text("Score: " + myGame.getScore(), width/2,3*(height/4));
    noFill();
  }
  
  /**
  * This method shows the name of the game at the top after winnig the game.
  **/
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("You won",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  /**
  * This method starts a timer after winnig the game and switches the gui to the menu page when the timer runs out.
  **/
  public void makeTimer() {
    if(ttl>0) {ttl--;}
    else {myGame.change2Menu();}
  }
  
  /**
  * This method removes the layout of the game won page after winnig the game.
  **/
  public void removeLayout() {
    buttonBack.hide();
  }
  
}
