public class Terminator
{
  private boolean terminated;
  
  public Terminator() {
    terminated = false;
  }
  
  public void terminateGame() {
    terminated = true;
  }
  
  public void restartGame() {
    terminated = false;
  }
  
  public boolean isGameTerminated() {
    return terminated;
  }
}
