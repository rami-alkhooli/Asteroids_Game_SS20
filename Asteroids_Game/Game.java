import processing.sound.*;
import processing.core.*;
import java.util.*;

class Game
{
  private SpaceShip sh;
  private SpaceStation st;
  private Laser laser;
  private SoundFile file;
  private SoundFile laserShoot;
  private static Game myGame;
  private static PApplet myApp;
  
  private boolean end;
  public int highscore;
  public int hits;
  public int shoots;
  public int items;
  public String time_played;
  
  private ArrayList <Asteroid> listAsteroids;

  private Game(PApplet theApp)
  {
    myApp = theApp;
    highscore = 0;
    hits = 0;
    shoots = 0;
    items = 0;
    time_played = "0";
    listAsteroids = new ArrayList <Asteroid> ();
    end = false;
  }
  
  private Game(PApplet theApp,int hs,int hts,int shts,int itms,String tmeplyd)
  {
    myApp = theApp;
    highscore = hs;
    hits = hts;
    shoots = shts;
    items = itms;
    time_played = tmeplyd;
    listAsteroids = new ArrayList <Asteroid> ();
    end = false;
  }
  
  public void runGame()
  {
    detectCollisionsWithAsteroids(sh,listAsteroids);
    detectCollisionsWithSpacestation(sh,st);
    try
    {
      detectCollisionsWithLaser(laser,listAsteroids);
      if(laser.shoot() == false) {laser = null;}
    }
    catch(NullPointerException e) {}
    st.show();
    sh.show();
    myGame.drawAsteroids();
    myGame.statistics();
    if(end) {myApp.delay(1000); myApp.exit();}
  }
  
  public void setupGame(int amntBigAst, int amntSmlAst)
  {
    sh = SpaceShip.create(myApp,myApp.width/2,myApp.height/2);
    st = SpaceStation.create(myApp);
    file = new SoundFile(myApp, "thrust.mp3");
    laserShoot = new SoundFile(myApp,"laser.mp3");
    
    for(int aB = 0 ; aB < amntBigAst ; aB++)
    {
      Asteroid astBig = new Asteroid (myApp, myApp.random(20,myApp.width/4) , myApp.random(0,myApp.height),myApp.random(2,9),myApp.random(100,200),9);
      listAsteroids.add(astBig);
    }
    for(int aS = 0 ; aS < amntSmlAst ; aS++)
    {
      Asteroid astSml = new Asteroid (myApp, myApp.random(20,myApp.width/4) , myApp.random(0,myApp.height),myApp.random(2,9),myApp.random(50,100),5);
      listAsteroids.add(astSml);
    }
  }
  
  public void levelItUp(int amntBigAst, int amntSmlAst)
  {
    listAsteroids = new ArrayList <Asteroid> ();
    
    for(int aB = 0 ; aB < amntBigAst ; aB++)
    {
      Asteroid astBig = new Asteroid (myApp, myApp.random(20,myApp.width/4) , myApp.random(0,myApp.height),myApp.random(2,9),myApp.random(150,250),12);
      listAsteroids.add(astBig);
    }
    for(int aS = 0 ; aS < amntSmlAst ; aS++)
    {
      Asteroid astSml = new Asteroid (myApp, myApp.random(20,myApp.width/4) , myApp.random(0,myApp.height),myApp.random(2,9),myApp.random(100,150),8);
      listAsteroids.add(astSml);
    }
  }
  
  public void checkKeyPressed()
  {
    if(myApp.keyCode == myApp.UP) {sh.setAccState(new AccStateMoving()); file.loop();}
    if(myApp.keyCode == myApp.DOWN) sh.setAccState(new AccStateReturning());
    if(myApp.keyCode == myApp.RIGHT) sh.setRotState(new RotStateRight());
    if(myApp.keyCode == myApp.LEFT) sh.setRotState(new RotStateLeft());
    
    if(myApp.key == 'q') sh.setShieldState(new Full());
    if(myApp.key == 'f') end = true;
    if(myApp.key == 'w') sh.setShieldState(new Damaged());
    if(myApp.key == 'e') sh.setShieldState(new Destroyed());
    if(myApp.key == ' ') {
      if(laser == null ) {laser = new Laser(myApp, sh.getX(),sh.getY(),sh.getPhi()); laserShoot.play();}
    }
  }
  
  public void checkKeyReleased()
  {
    if(myApp.keyCode == myApp.UP) {sh.setAccState(new AccStateStoppedF()); file.stop();}
    if(myApp.keyCode == myApp.DOWN) sh.setAccState(new AccStateStoppedR());
    if(myApp.keyCode == myApp.RIGHT) sh.setRotState(new RotStateStoppedR());
    if(myApp.keyCode == myApp.LEFT) sh.setRotState(new RotStateStoppedL());
  }
  
  public static Game startGame(PApplet theApp)
  {
    if (myGame==null) {myGame = new Game(theApp);}
    
    return myGame;
  }
  
  public static Game startGame(PApplet theApp,int hs,int hts,int shts,int itms,String tmeplyd)
  {
    if (myGame==null) {myGame = new Game(theApp, hs, hts, shts, itms, tmeplyd);}
    
    return myGame;
  }
  
  private void drawAsteroids()
  {
    for(int i = 0 ; i<listAsteroids.size() ; i++)
    {
      Asteroid asteroid = listAsteroids.get(i);
      asteroid.show();
    }
  }
  
  private void statistics()
  {
    myApp.fill(255,255,255);
    myApp.textSize(30);
    myApp.textAlign(myApp.LEFT,myApp.TOP);
    myApp.text("x: " + (int)sh.getX(),10,10);
    myApp.text("y: " + (int)sh.getY(),140,10);
    myApp.text("v: " + (int)sh.getSpeed(),270,10);
    myApp.text("phi: " + (int)sh.getPhi(),360,10);
    myApp.text("Shield: " + sh.getShield()+"%",515,10);
    myApp.text("Lives: " + sh.getLives(),715,10);
    myApp.text("Items: " + sh.getItems(),835,10);
  }
  
  private void detectCollisionsWithAsteroids(SpaceShip ship, ArrayList<Asteroid> list)
  {
    for (int n=0 ; n<list.size() ; n++)
    {
      if ( myApp.dist( ship.getX() , ship.getY() , list.get(n).getX() , list.get(n).getY() ) < (ship.getRadius() + list.get(n).getRadius()) )
      {myApp.background(255,0,0);}
    }
  }
  
  private void detectCollisionsWithSpacestation(SpaceShip ship, SpaceStation station)
  {
    if ( myApp.dist( ship.getX() , ship.getY() , station.getX() , station.getY() ) < (ship.getRadius() + station.getRadius()) )
    {myApp.background(0,170,0);}
  }
  
  private void detectCollisionsWithLaser(Laser lasershot, ArrayList<Asteroid> list)
  {
    for (int n=0 ; n<list.size() ; n++)
    {
        if ( myApp.dist( lasershot.getX() , lasershot.getY() , list.get(n).getX() , list.get(n).getY() ) < (lasershot.getRadius() + list.get(n).getRadius()) )
        {myApp.background(0,0,170);}
    }
  }
  
   //... FEHLT!!!
}
