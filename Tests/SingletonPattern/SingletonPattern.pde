Typer theTyper1;
Typer theTyper2;

void setup()
{
  size(400,400);
}

void draw()
{
  background(0);
}

void keyPressed()
{
  if(key == 'g') {theTyper1 = Typer.getTyper(this,1);}
  if(key == 'h') {theTyper2 = Typer.getTyper(this,2);}
  if(key == 'b') {theTyper1.say();}
  if(key == 'n') {theTyper2.say();}
}
