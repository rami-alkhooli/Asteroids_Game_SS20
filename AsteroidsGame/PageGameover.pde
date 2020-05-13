import processing.sound.*;
import processing.core.*;
import controlP5.*;

public class PageGameover extends GUIgameover
{
  private int ttl;
  private SoundFile lostSound;
  private ControlP5 buttonBack;
  private PApplet myApp;
  private Game myGame;
  
  public PageGameover(PApplet theApp, Game theGame) {
    myApp = theApp;
    myGame = theGame;
    buttonBack = new ControlP5(theApp);
    lostSound = new SoundFile(theApp,"lost.mp3");
    ttl = 180;
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    buttonBack.addButton("menu").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
    lostSound.play();
  }
  
  public void showButtons() {
    buttonBack.show();
  }
  
  public void showGameover() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/40);
    fill(255,0,0);
    text("You have lost", width/2, height/2);
    noFill();
  }
  
  public void showScore() {
    textAlign( CENTER, CENTER);
    textSize(myApp.width/60);
    fill(255,255,255);
    text("Score: " + myGame.getScore(), width/2,3*(height/4));
    noFill();
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Game Over",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void makeTimer() {
    if(ttl>0) {ttl--;}
    else {myGame.change2Menu();}
  }
  
  public void removeLayout() {
    buttonBack.hide();
  }
  
}
