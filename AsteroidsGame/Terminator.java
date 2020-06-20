public class Terminator
{
  private boolean terminated;
  
  /**
  * The constructor
  **/
  public Terminator() {
    terminated = false;
  }
  
  /**
  * This function sets the state of the game to lost
  **/
  public void terminateGame() {
    terminated = true;
  }
  
  /**
  * This function resets the state of the game
  **/
  public void restartGame() {
    terminated = false;
  }
  
  /**
  * This function is used to notify the game and change the gui
  **/
  public boolean isGameTerminated() {
    return terminated;
  }
}
