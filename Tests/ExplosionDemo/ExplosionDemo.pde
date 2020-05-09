ArrayList <Explosion> list;

void setup()
{
  size(1000,620);
  frameRate(60);
  list = new ArrayList <Explosion> ();
}

void draw()
{
  background(0,0,0);
  try {
    for(int n=0 ; n<list.size() ; n++) {list.get(n).show();}
    
  }
  catch(NullPointerException e) {}
}

void mousePressed()
{
  list.add(new Explosion(this,mouseX,mouseY));
}
