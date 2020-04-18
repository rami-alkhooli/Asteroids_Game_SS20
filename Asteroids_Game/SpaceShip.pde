class SpaceShip
{
  private PImage body;
  private PImage thrust;
  private final float bodyHeight = 80;
  private final float bodyWidth = 80;
  private short m;
  private float phi;
  private float phiRot;
  private float x;
  private float y;
  private float x1;
  private float y1;
  private float x2;
  private float y2;
  private float x3;
  private float y3;
  private float v;
  private short collectedItems;
  private short lives;
  private short shieldStrength;
  // Hier muss noch ein Laser-Waffe kommen
  // Hier muss noch ein Schub kommen
  private AccelerationState accState;
  private RotationState rotState;
  
  // Hier muss eine Funktion zur Kollisionserkennung
  SpaceShip(int myX, int myY) {
    m = 20;
    phi = 90;
    phiRot = 0;
    x = myX;
    y = myY;
    //body = createShape(TRIANGLE,x-50,y+50,x,y-100,x+50,y+50);
    v = 0;
    collectedItems = 0;
    lives = 3;
    shieldStrength = 2;
    accState = new AccStateStoppedF();
    rotState = new RotStateStoppedR();
  }
  
  void show() {
    // updating the angle
    phiRot = rotState.rotate(phiRot);
    phi += phiRot;

    // updating the speed v
    v = accState.accelerate(v);

    // updating coodinates
    updateCoordinatesCenter();
    updateCoordinatesTriangle();
    
    // drawing
    fill(255,255,255);
    triangle(x1,y1,x2,y2,x3,y3);
  }
  
  void setAccState(AccelerationState newState) {
  accState = newState;
  }
  
  void setRotState(RotationState newState) {
  rotState = newState;
  }
  
  void updateCoordinatesCenter() {
    x = x - v*cos(radians(phi));
    y = y - v*sin(radians(phi));
  }
  
  void updateCoordinatesTriangle() {
    x1 = x - 70.7*cos(radians(phi-135));
    y1 = y - 70.7*sin(radians(phi-135));
    x2 = x - 100*cos(radians(phi));
    y2 = y - 100*sin(radians(phi));
    x3 = x - 70.7*cos(radians(phi+135));
    y3 = y - 70.7*sin(radians(phi+135));
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
}
