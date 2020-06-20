import processing.core.*;

public class LevelSecond implements Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in the second level.
  *
  * @returns the speed of the flying asteroids in the second level.
  **/
  public int determineSpeed() {return 2;}
  
  /**
  * This method is used to determine the amount of the asteroids to generate in the second level.
  *
  * @returns the amount of the generated asteroids in the second level.
  **/
  public int determineAmount() {return 5;}
  
  /**
  * This method is used to determine the number of items to generate in the second level.
  *
  * @returns the number of the items generated in the second level.
  **/
  public int determineItems() {return 1;}
}
