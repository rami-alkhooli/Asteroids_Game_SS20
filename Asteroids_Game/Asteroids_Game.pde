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
}

void keyReleased()
{
  if(key == 'w') sh.setState(new AccStateStopped());
}
