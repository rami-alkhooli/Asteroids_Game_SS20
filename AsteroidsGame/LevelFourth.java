import processing.core.*;

public class LevelFourth implements Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in the fourth level.
  *
  * @returns the speed of the flying asteroids in the fourth level.
  **/
  public int determineSpeed() {return 3;}
  
  /**
  * This method is used to determine the amount of the asteroids to generate in the fourth level.
  *
  * @returns the amount of the generated asteroids in the fourth level.
  **/
  public int determineAmount() {return 7;}
  
  /**
  * This method is used to determine the number of items to generate in the fourth level.
  *
  * @returns the number of the items generated in the fourth level.
  **/
  public int determineItems() {return 5;}
}
