float angle,r;
int x,y;
PShape body;
boolean stoppingR;
boolean stoppingL;

float rotateR(float r)
{
  if(r>=0.2) {r-=0.1;}
  if(r<0.2) {r=0;}
  return r;
}

float rotateL(float r)
{
  if(r<=-0.2) {r+=0.1;}
  if(r>-0.2) {r=0;}
  return r;
}

void setup()
{
  size(800,800);
  angle = 0.0;
  r = 0.0;
  x=400;y=400;
  body = createShape(RECT,-50,-50,100,100);
  stoppingR=false;
  stoppingL=false;
}

void draw()
{
  background(0,0,0);
  fill(255,0,0);
  
  translate(x,y);
  circle(100,100,50);
  shape(body);
  if(stoppingR) {r=rotateR(r);}
  if(stoppingL) {r=rotateL(r);}
  //if(r==0) {stoppingR=false;stoppingL=false;}
  body.rotate(radians(r));
  print("\n"+r);
}

void keyPressed()
{
  if(key == 'd') {
    if(r<3) r+=0.1;
    if(r>=3) r=3;
    stoppingR=false;
}
  if(key == 's') {
    if(r>-3) r-=0.1;
    if(r<=-3) r=-3;
    stoppingL=true;
  }
}

void keyReleased()
{
  if(key == 'd') { stoppingR=true; }
  if(key == 's') { stoppingL=true; }
}
