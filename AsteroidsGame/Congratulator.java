public class Congratulator
{
  private boolean won;
  
  public Congratulator() {
    won = false;
  }

  public void winGame() {
    won = true;
  }
  
  public void restartGame() {
    won = false;
  }
  
  public boolean isGameWon() {
    return won;
  }
}
