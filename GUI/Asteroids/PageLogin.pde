import processing.core.*;
import controlP5.*;

public class PageLogin extends GUIlogin
{
  private ControlP5 fieldUsername;
  private ControlP5 fieldPassword;
  private ControlP5 buttonLogin;
  private ControlP5 buttonRegister;
  private ControlP5 buttonBack;
  private PApplet myApp;
  
  private PFont font;
  
  public PageLogin(PApplet theApp) {
    myApp = theApp;
    
    buttonLogin = new ControlP5(theApp);
    buttonRegister = new ControlP5(theApp);
    buttonBack = new ControlP5(theApp);
    fieldUsername = new ControlP5(theApp);
    fieldPassword = new ControlP5(theApp);
    
    font = theApp.createFont("arial",40);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    
    buttonLogin.addButton("log in").setValue(0).setPosition(2.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(1).show();
    buttonRegister.addButton("register").setValue(0).setPosition(4.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(2).show();
    buttonBack.addButton("end").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(3).show();
    fieldUsername.addTextfield("").setPosition(4*sWidth,3*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).show();
    fieldPassword.addTextfield("").setPosition(4*sWidth,4*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).show();
  }
  
  public void showButtons() {
    buttonBack.show();
    buttonLogin.show();
    buttonRegister.show();
    fieldUsername.show();
    fieldPassword.show();
  }
  
  public void showHints(){
    myApp.textAlign(myApp.CENTER,myApp.BOTTOM);
    myApp.textSize(40);
    myApp.fill(250,250,250);
    myApp.text("Username:",3*sWidth,3.5*sHeight);
    myApp.text("Password:",3*sWidth,4.5*sHeight);
    myApp.noFill();
  }
  
  public void showTextfields(){
    
  }
  
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(60);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Login",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  public void removeLayout() {
    buttonBack.hide();
    buttonLogin.hide();
    buttonRegister.hide();
    fieldUsername.hide();
    fieldPassword.hide();
  }
}
