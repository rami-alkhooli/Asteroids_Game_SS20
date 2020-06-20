import processing.core.*;

public interface Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in each level.
  **/
  public int determineSpeed();
  
  /**
  * This method is used to determine the amount of the asteroids to generate in each level.
  **/
  public int determineAmount();
  
  /**
  * This method is used to determine the number of items to generate in each level.
  **/
  public int determineItems();
}
