
void generatePolygon(int xCenter, int yCenter, int radius, int rag, int anz)
{
  background(0,0,0);
  int ang = 0;
  float sec = 360/anz;
  
  beginShape();
  
  for (int z=0 ; z<anz ; z++)
  {
    vertex( xCenter + ((int)(random(radius/rag,radius))) * cos(radians(random(ang,ang+sec))) , yCenter + ((int)(random(radius/rag,radius))) * sin(radians(random(ang,ang+sec))) );
    ang += sec;
  }
  
  endShape(CLOSE);
}

void setup()
{
  background(0,0,0);
  size(800,800);
}

void draw()
{
  
}

void keyPressed()
{
  if(key == 's') generatePolygon(400,400,200,2,10);
  if(key == 'r') generatePolygon(400,400,200,8,10);
}
