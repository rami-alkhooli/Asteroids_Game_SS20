import processing.core.*;
import controlP5.*;

public class PageMenu extends GUImenu
{
  private PApplet myApp;
  private ControlP5 buttonPlay;
  private ControlP5 buttonLout;
  private ControlP5 buttonStat;
  private ControlP5 buttonBack;
  
  public PageMenu(PApplet theApp) {
    myApp = theApp;
    
    buttonBack = new ControlP5(theApp);
    buttonStat = new ControlP5(theApp);
    buttonPlay = new ControlP5(theApp);
    buttonLout = new ControlP5(theApp);
    
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    
    buttonBack.addButton("go back").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(4).show();
    buttonPlay.addButton("start").setValue(0).setPosition(3*sWidth,3*sHeight).setSize(2*sWidth,sHeight/2).setId(5).show();
    buttonStat.addButton("statistics").setValue(0).setPosition(3*sWidth,4*sHeight).setSize(2*sWidth,sHeight/2).setId(6).show();
    buttonLout.addButton("log out").setValue(0).setPosition(3*sWidth,5*sHeight).setSize(2*sWidth,sHeight/2).show();
  }
  
  public void showButtons() {
    buttonBack.show();
    buttonPlay.show();
    buttonStat.show();
    buttonLout.show();
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(60);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Menu",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void removeLayout() {
    buttonBack.hide();
    buttonPlay.hide();
    buttonStat.hide();
    buttonLout.hide();
  }
}
