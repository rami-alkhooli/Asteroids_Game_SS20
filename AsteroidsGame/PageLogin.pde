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
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  **/
  public PageLogin(PApplet theApp, Game theGame) {
    myApp = theApp;
    
    buttonLogin = new ControlP5(theApp);
    buttonRegister = new ControlP5(theApp);
    buttonBack = new ControlP5(theApp);
    fieldUsername = new ControlP5(theApp);
    fieldPassword = new ControlP5(theApp);
    
    font = theApp.createFont("arial",40);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    
    buttonLogin.addButton("log in").setValue(0).setPosition(2.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(3).show();
    buttonRegister.addButton("register").setValue(0).setPosition(4.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(2).show();
    buttonBack.addButton("end").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(0).show();
    fieldUsername.addTextfield("").setPosition(4*sWidth,3*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).setId(10).show();
    fieldPassword.addTextfield("").setPosition(4*sWidth,4*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).setPasswordMode(true).setId(11).show();
  }
  
  /**
  * This method shows the buttons of the login page.
  **/
  public void showButtons() {
    buttonBack.show();
    buttonLogin.show();
    buttonRegister.show();
  }
  
  /**
  * This method shows Texts username and password of the input fields to login.
  **/
  public void showHints(){
    myApp.textAlign(myApp.RIGHT,myApp.BOTTOM);
    myApp.textSize(myApp.width/40);
    myApp.fill(250,250,250);
    myApp.text("Username:",3*sWidth,3.5*sHeight);
    myApp.text("Password:",3*sWidth,4.5*sHeight);
    myApp.noFill();
  }
  
  /**
  * This method shows input fields of username and password.
  **/
  public void showTextfields(){
    fieldUsername.show();
    fieldPassword.show();
  }
  
  /**
  * This method shows the name of the game at the top while logging in.
  **/
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Login",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  /**
  * This method removes the layout of the login page after logging in to the data base.
  **/
  public void removeLayout() {
    buttonBack.hide();
    buttonLogin.hide();
    buttonRegister.hide();
    fieldUsername.hide();
    fieldPassword.hide();
    fieldUsername = null;
    fieldPassword = null;
    buttonLogin = null;
    buttonRegister = null;
    buttonBack = null;
  }
}
