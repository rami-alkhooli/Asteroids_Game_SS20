import processing.sound.*;

SpaceShip sh;
Laser laser;
SoundFile file;
SoundFile laserShoot;
Game myGame;
boolean end;

void statistics()
{
  fill(255,255,255);
  textSize(30);
  text("x: " + (int)sh.getX(),10,30);
  text("y: " + (int)sh.getY(),190,30);
  text("v: " + (int)sh.getSpeed(), 360,30);
  text("phi: " + (int)sh.getPhi(),480,30);
  text("Shield: " + sh.getShield()+"%",630,30);
}

void setup()
{
  //size(1000,618);
  fullScreen();
  sh = new SpaceShip(width/2,height/2);
  file = new SoundFile(this, "thrust.mp3");
  laserShoot = new SoundFile(this,"laser.mp3");
  myGame = new Game();
  myGame.generateAsteroids(8,18);
  end = false;
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
  myGame.drawAsteroids();
  statistics();
  if(end) {delay(1000); exit();}
}

void keyPressed()
{
  if(keyCode == UP) {sh.setAccState(new AccStateMoving()); file.loop();}
  if(keyCode == DOWN) sh.setAccState(new AccStateReturning());
  if(keyCode == RIGHT) sh.setRotState(new RotStateRight());
  if(keyCode == LEFT) sh.setRotState(new RotStateLeft());
  
  if(key == 'q') sh.setShieldState(new Full());
  if(key == 'f') end = true;
  if(key == 'w') sh.setShieldState(new Damaged());
  if(key == 'e') sh.setShieldState(new Destroyed());
  if(key == ' ') {
    if(laser == null ) {laser = new Laser (sh.getX(),sh.getY(),sh.getPhi()); laserShoot.play();}
  }
}

void keyReleased()
{
  if(keyCode == UP) {sh.setAccState(new AccStateStoppedF()); file.stop();}
  if(keyCode == DOWN) sh.setAccState(new AccStateStoppedR());
  if(keyCode == RIGHT) sh.setRotState(new RotStateStoppedR());
  if(keyCode == LEFT) sh.setRotState(new RotStateStoppedL());
}
