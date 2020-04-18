SpaceShip sh;

void setup()
{
  size(800,800);
  sh = new SpaceShip(400,400);
}

void draw()
{
  background(0,0,0);
  translate(sh.getX(),sh.getY());
  sh.show();
}

void keyPressed()
{
  if(key == 'w') sh.setAccState(new AccStateMoving());
  if(key == 's') sh.setAccState(new AccStateReturning());
  if(key == 'd') sh.setRotState(new RotStateRight());
  if(key == 'a') sh.setRotState(new RotStateLeft());
}

void keyReleased()
{
  if(key == 'w') sh.setAccState(new AccStateStoppedF());
  if(key == 's') sh.setAccState(new AccStateStoppedR());
  if(key == 'd') sh.setRotState(new RotStateStoppedR());
  if(key == 'a') sh.setRotState(new RotStateStoppedL());
}
