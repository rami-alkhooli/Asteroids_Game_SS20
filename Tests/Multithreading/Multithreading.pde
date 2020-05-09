ArrayList <Timer> list; //<>//
int idNumerator;
int radius;

void setup()
{
  size(1000,800);
  frameRate(60);
  idNumerator = 1;
  radius = 0;
  list = new ArrayList<Timer>();
}

void draw()
{
  background(0);
  if(radius<200) {circle(width/2,height/2,2*(radius++));}
  if(radius>=200) {radius = 0;}
}

void mousePressed()
{
  Timer newTimer;
  newTimer = new Timer(idNumerator++,3);
  list.add(newTimer);
  
  for(int n=0 ; n<list.size() ; n++) {
    list.get(n).start(this);
  }
}

void keyPressed()
{
  if(key == 'c') {circle(100,100,50);}
}

void bang()
{
  println("finish");
}
