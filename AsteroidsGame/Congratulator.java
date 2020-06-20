public class Congratulator
{
  private boolean won;
  
  /**
  * The constructor
  **/
  public Congratulator() {
    won = false;
  }

  /**
  * This method sets the state of the game to won
  **/
  public void winGame() {
    won = true;
  }
  
  /**
  * This method resets the state of the game
  **/
  public void restartGame() {
    won = false;
  }
  
  /**
  * This method is used to notify the game and change the gui
  **/
  public boolean isGameWon() {
    return won;
  }
}
