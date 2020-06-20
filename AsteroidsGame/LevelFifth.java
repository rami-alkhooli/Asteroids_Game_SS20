import processing.core.*;

public class LevelFifth implements Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in the fifth level.
  *
  * @returns the speed of the flying asteroids in the fifth level.
  **/
  public int determineSpeed() {return 4;}
  
  /**
  * This method is used to determine the amount of the asteroids to generate in the fifth level.
  *
  * @returns the amount of the generated asteroids in the fifth level.
  **/
  public int determineAmount() {return 7;}
  
  /**
  * This method is used to determine the number of items to generate in the fifth level.
  *
  * @returns the number of the items generated in the fifth level.
  **/
  public int determineItems() {return 7;}
}
