import controlP5.*;
import java.awt.*; 

Context obj;
ControlP5 cp5;

void setup()
{
  fullScreen();
  background(0,0,0);
  obj = new Context();
  obj.setState(new StateAsteroids());
  cp5 = new ControlP5(this);
  
  
}

void draw()
{
  obj.show();
}

void keyPressed()
{
  if(key == 'r')
  {obj.setState(new StateAsteroids());}
  if(key == 'g')
  {obj.setState(new StateG());}
  if(key == 'b')
  {obj.setState(new StateB());}
  if(key == 's')
  {obj.setState(new StateS());}
}

public void signup (){
  obj.setState(new StateAsteroids());
}
