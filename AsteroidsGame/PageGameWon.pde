import processing.core.*;
import controlP5.*;

public class PageGameWon extends GUIgamewon
{
  private ControlP5 buttonBack;
  private PApplet myApp;
  
  public PageGameWon(PApplet theApp, Game theGame) {
    myApp = theApp;
    buttonBack = new ControlP5(theApp);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    buttonBack.addButton("go back").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
  }
  
  public void showButtons() {
    buttonBack.show();
  }
  
  public void showGameover() {
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(255,0,0);
    text("Congratulations !", width/2, height/2);
    noFill();
  }
  
  public void showScore() {
    textAlign( CENTER, CENTER);
    textSize(20);
    fill(255,255,255);
    text("Score: 0", width/2,3*(height/4));
    noFill();
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(60);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("You won",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void removeLayout() {
    buttonBack.hide();
  }
  
}
