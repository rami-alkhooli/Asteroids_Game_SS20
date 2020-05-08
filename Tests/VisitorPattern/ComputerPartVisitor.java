public interface ComputerPartVisitor {
  
  public void visit(Computer computer);
  public void visit(Mouse mouse);
  public void visit(Keyboard keyboard);
  public void visit(Monitor monitor);
  
}

class ComputerPartDisplayVisitor implements ComputerPartVisitor {

   public void visit(Computer computer) {
      System.out.println("Displaying Computer.");
   }

   public void visit(Mouse mouse) {
      System.out.println("Displaying Mouse.");
   }

   public void visit(Keyboard keyboard) {
      System.out.println("Displaying Keyboard.");
   }

   public void visit(Monitor monitor) {
      System.out.println("Displaying Monitor.");
   }
}
