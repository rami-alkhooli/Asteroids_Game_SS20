Timer myTimer;
boolean runTime;

void setup()
{
  size(800,800);
  myTimer = new Timer(this);
  runTime = true;
}

void draw()
{
  background(0,0,0);
  fill(0,255,255);
  if(runTime) {myTimer.run();}
  textSize(40);
  textAlign(CENTER,CENTER);
  text(myTimer.getTime(),400,400);
}

void keyPressed()
{
  if(key=='s') {runTime = true;}
  if(key=='e') {myTimer.stop(); runTime = false;}
}
