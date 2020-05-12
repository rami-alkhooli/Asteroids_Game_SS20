import processing.core.*;
import controlP5.*;

public class PageRegister extends GUIregister
{
  private ControlP5 fieldAccount;
  private ControlP5 fieldEmail;
  private ControlP5 fieldPassword;
  private ControlP5 buttonRegister;
  private ControlP5 buttonBack;
  private PApplet myApp;
  
  private PFont font;
  
  public PageRegister(PApplet theApp, Game theGame) {
    myApp = theApp;
    
    buttonRegister = new ControlP5(theApp);
    buttonBack = new ControlP5(theApp);
    fieldAccount = new ControlP5(theApp);
    fieldEmail = new ControlP5(theApp);
    fieldPassword = new ControlP5(theApp);
    
    font = theApp.createFont("arial",40);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    
    buttonRegister.addButton("sign up").setValue(0).setPosition(3.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(3).show();
    buttonBack.addButton("go back").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
    fieldAccount.addTextfield("").setPosition(4*sWidth,2.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).show();
    fieldEmail.addTextfield("").setPosition(4*sWidth,3.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).show();
    fieldPassword.addTextfield("").setPosition(4*sWidth,4.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).show();
  }
  
  public void showButtons() {
    
  }
  
  public void showHints() {
    myApp.textAlign(myApp.CENTER,myApp.BOTTOM);
    myApp.textSize(40);
    myApp.fill(250,250,250);
    myApp.text("Account:",3*sWidth,3*sHeight);
    myApp.text("Email:",3*sWidth,4*sHeight);
    myApp.text("Password:",3*sWidth,5*sHeight);
    myApp.noFill();
  }
  
  public void showTextfields() {
    
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(60);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Register",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void removeLayout() {
    buttonBack.hide();
    buttonRegister.hide();
    fieldAccount.hide();
    fieldEmail.hide();
    fieldPassword.hide();
  }
}
