Starter starter;

void setup()
{
  size(1000,500);
  starter = Starter.launchStarter(this);
  starter.showClasses();
}

void draw()
{
  background(0,0,0);
  starter.drawClasses();
}
