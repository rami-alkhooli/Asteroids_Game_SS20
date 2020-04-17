Context obj;

void setup()
{
  size(800,800);
  background(255,255,255);
  obj = new Context();
  obj.setState(new StateR());
}

void draw()
{
  obj.show();
}

void keyPressed()
{
  if(key == 'r')
  {obj.setState(new StateR());}
  if(key == 'g')
  {obj.setState(new StateG());}
  if(key == 'b')
  {obj.setState(new StateB());}
  if(key == 's')
  {obj.setState(new StateS());}
}
