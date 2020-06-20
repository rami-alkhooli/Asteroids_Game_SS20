import processing.core.*;

public class LevelThird implements Level
{
  /**
  * This method is used to determine the speed of the flying asteroids in the third level.
  *
  * @returns the speed of the flying asteroids in the third level.
  **/
  public int determineSpeed() {return 3;}
  
  /**
  * This method is used to determine the amount of the asteroids to generate in the third level.
  *
  * @returns the amount of the generated asteroids in the third level.
  **/
  public int determineAmount() {return 5;}
  
  /**
  * This method is used to determine the number of items to generate in the third level.
  *
  * @returns the number of the items generated in the third level.
  **/
  public int determineItems() {return 2;}
}
