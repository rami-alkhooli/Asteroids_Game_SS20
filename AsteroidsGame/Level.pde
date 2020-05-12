import processing.core.*;

public interface Level
{
  public int determineSpeed();
  public int determineAmount();
  public int determineItems();
}

public class LevelFirst implements Level
{
  public int determineSpeed() {return 1;}
  public int determineAmount() {return 4;}
  public int determineItems() {return 0;}
}

public class LevelSecond implements Level
{
  public int determineSpeed() {return 2;}
  public int determineAmount() {return 5;}
  public int determineItems() {return 1;}
}

public class LevelThird implements Level
{
  public int determineSpeed() {return 3;}
  public int determineAmount() {return 5;}
  public int determineItems() {return 2;}
}

public class LevelFourth implements Level
{
  public int determineSpeed() {return 3;}
  public int determineAmount() {return 7;}
  public int determineItems() {return 5;}
}

public class LevelFifth implements Level
{
  public int determineSpeed() {return 4;}
  public int determineAmount() {return 7;}
  public int determineItems() {return 7;}
}
