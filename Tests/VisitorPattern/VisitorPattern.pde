

ComputerPart computer = new Computer();


void setup()
{
  size(800,800);
  background(0,0,0);
  computer.accept(new ComputerPartDisplayVisitor());
}
