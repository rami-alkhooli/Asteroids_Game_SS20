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
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  **/
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
    
    buttonRegister.addButton("sign up").setValue(0).setPosition(3.5*sWidth,6*sHeight).setSize(sWidth,sHeight/2).setId(6).show();
    buttonBack.addButton("go back").setValue(0).setPosition(7*sWidth,0.5*sHeight).setSize(sWidth/2,sHeight/4).setId(999).show();
    fieldAccount.addTextfield("").setPosition(4*sWidth,2.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).setId(12).show();
    fieldEmail.addTextfield("").setPosition(4*sWidth,3.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).setId(13).show();
    fieldPassword.addTextfield("").setPosition(4*sWidth,4.5*sHeight).setSize(2*sWidth,sHeight/2).setFocus(false).setFont(font).setColor(color(255,255,255)).setPasswordMode(true).setId(14).show();
  }
  
  /**
  * This method shows the buttons of the register page.
  **/
  public void showButtons() {
    
  }
  
  /**
  * This method shows Texts account, email and password of the input fields to login.
  **/
  public void showHints() {
    myApp.textAlign(myApp.RIGHT,myApp.BOTTOM);
    myApp.textSize(myApp.width/40);
    myApp.fill(250,250,250);
    myApp.text("Account:",3*sWidth,3*sHeight);
    myApp.text("Email:",3*sWidth,4*sHeight);
    myApp.text("Password:",3*sWidth,5*sHeight);
    myApp.noFill();
  }
  
  /**
  * This method shows input fields of account, email and password.
  **/
  public void showTextfields() {
    
  }
  
  /**
  * This method shows the name of the game at the top while registration.
  **/
  public void showTitle() {
    textAlign(CENTER,CENTER);
    textSize(myApp.width/20);
    fill(250,250,250);
    text("Asteroids Game",4*sWidth,sHeight);
    textSize(20);
    text("Register",4*sWidth,1.75*sHeight);
    noFill();
  }
  
  /**
  * This method removes the layout of the register page after successfully registering in the data base.
  **/
  public void removeLayout() {
    buttonBack.hide();
    buttonRegister.hide();
    fieldAccount.hide();
    fieldEmail.hide();
    fieldPassword.hide();
    fieldAccount = null;
    fieldEmail = null;
    fieldPassword = null;
    buttonRegister = null;
    buttonBack = null;
  }
}
