public class StateAsteroids implements State
{    
  public void show() {    
    fill(255,0,0);
    circle(400,400,200);
    
    //create Button login
  cp5.addButton("blau")
    .setValue(0)
    .setPosition(900,900)
    .setSize(200,100);
    
    //create Button sign up
  cp5.addButton("signup")
    .setValue(0)
    .setPosition(900,700)
    .setSize(200,100);
  }
  public void blau (){
  obj.setState(new StateB());
}
}
