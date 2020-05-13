import processing.core.*;
import controlP5.*;

public class PageStatistics extends GUIstatistics
{
  private ControlP5 buttonBack;
  private PApplet myApp;
  
  public PageStatistics(PApplet theApp, Game theGame) {
    myApp = theApp;
    buttonBack = new ControlP5(theApp);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    buttonBack.addButton("go back").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
  }
  
  public void showButtons() {
    buttonBack.show();
  }
  
  public void showStatistics() {
    textAlign(CENTER,CENTER);
    textSize(width/40);
    fill(250,250,250);
    text("Score: 0\nItems: 0\n Shots: 0",width/2,height/2);
    noFill();
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Statistics",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void removeLayout() {
    buttonBack.hide();
  }
}
