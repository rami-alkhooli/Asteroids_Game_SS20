import Spacecrafts.*;

/**
 * This is an example class
 *
 * @author xy
 * @version 0.0
 */
public class Class_1
{
    /**
     * This field holds the x position
     */
    public int x1;
    
    /**
     * This is an object from class SpaceShip from the package Spacecrafts
     * @see SpaceShip
     */
    public SpaceShip myShip;

    /**
     * Constructor for objects of class Class_1
     */
    public Class_1()
    {
        // initialise instance variables
        x1 = 0;
    }

    /**
     * This Methode adds two numbers
     *
     * @param  y1  the number to add to x1
     * @return    the sum of x1 and y1
     */
    public int sampleMethod(int y1)
    {
        // put your code here
        return x1 + y1;
    }
}
