import processing.core.*;

public class LevelFirst implements Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in the first level.
  *
  * @returns the speed of the flying asteroids in the first level.
  **/
  public int determineSpeed() {return 1;}
  
  /**
  * This method is used to determine the amount of the asteroids to generate in the first level.
  *
  * @returns the amount of the generated asteroids in the first level.
  **/
  public int determineAmount() {return 4;}
  
  /**
  * This method is used to determine the number of items to generate in the first level.
  *
  * @returns the number of the items generated in the first level.
  **/
  public int determineItems() {return 0;}
}
