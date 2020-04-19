SpaceShip sh;
Laser laser;

void setup()
{
  size(800,800);
  sh = new SpaceShip(400,400);
}

void draw()
{
  background(0,0,0);
  if(laser!=null) {
    if(laser.shoot() == true) {
    }
    else{
      laser.finalize();
      laser = null;
  }
  }
  else {}
  sh.show();
}

void keyPressed()
{
  if(keyCode == UP) sh.setAccState(new AccStateMoving());
  if(keyCode == DOWN) sh.setAccState(new AccStateReturning());
  if(keyCode == RIGHT) sh.setRotState(new RotStateRight());
  if(keyCode == LEFT) sh.setRotState(new RotStateLeft());
  
  if(key == 'q') sh.setShieldState(new Full());
  if(key == 'w') sh.setShieldState(new Damaged());
  if(key == 'e') sh.setShieldState(new Critical());
  if(key == 'r') sh.setShieldState(new Destroyed());
  if(key == ' ') {
    if(laser == null ) laser = new Laser (sh.getX(),sh.getY(),sh.getPhi());
  }
}

void keyReleased()
{
  if(keyCode == UP) sh.setAccState(new AccStateStoppedF());
  if(keyCode == DOWN) sh.setAccState(new AccStateStoppedR());
  if(keyCode == RIGHT) sh.setRotState(new RotStateStoppedR());
  if(keyCode == LEFT) sh.setRotState(new RotStateStoppedL());
}
