SpaceShip sh;

void setup()
{
  size(800,800);
  sh = new SpaceShip(400,400);
}

void draw()
{
  background(0,0,0);
  sh.show();
}

void keyPressed()
{
  if(key == 'w') sh.setState(new AccStateMoving());
  if(key == 's') sh.setState(new AccStateReturning());
}

void keyReleased()
{
  if(key == 'w') sh.setState(new AccStateStoppedF());
  if(key == 's') sh.setState(new AccStateStoppedR());
}
