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
  if(keyCode == UP) sh.setAccState(new AccStateMoving());
  if(keyCode == DOWN) sh.setAccState(new AccStateReturning());
  if(keyCode == RIGHT) sh.setRotState(new RotStateRight());
  if(keyCode == LEFT) sh.setRotState(new RotStateLeft());
}

void keyReleased()
{
  if(keyCode == UP) sh.setAccState(new AccStateStoppedF());
  if(keyCode == DOWN) sh.setAccState(new AccStateStoppedR());
  if(keyCode == RIGHT) sh.setRotState(new RotStateStoppedR());
  if(keyCode == LEFT) sh.setRotState(new RotStateStoppedL());
}
