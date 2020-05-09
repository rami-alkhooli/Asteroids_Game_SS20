import engine.*;
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
  private ArrayList <Explosion> listExplosions;

  private Game(PApplet theApp)
  {
    myApp = theApp;
    highscore = 0;
    hits = 0;
    shoots = 0;
    items = 0;
    time_played = "0";
    listAsteroids = new ArrayList <Asteroid> ();
    listExplosions = new ArrayList <Explosion> ();
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
    listExplosions = new ArrayList <Explosion> ();
    end = false;
  }
  
  public void runGame()
  {
    detectCollisionsWithAsteroids(sh,listAsteroids);
    detectCollisionsWithSpacestation(sh,st);
    try
    {
      if(detectCollisionsWithLaser(laser,listAsteroids)==true) {laser = null;}
    }
    catch(NullPointerException e) {}
    try
    {
      if(laser.shoot() == false) {laser = null;}
    }
    catch(NullPointerException e) {}
    
    try
    {
      for(int n=0 ; n<listExplosions.size() ; n++) {
        if(listExplosions.get(n).show()==true) {listExplosions.remove(n);}
      }
    }
    catch (NullPointerException e) {}
    st.show();
    sh.show();
    myGame.drawAsteroids();
    myGame.statistics();
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
    
    if(myApp.key=='1') {levelItUp(4,6);}
    if(myApp.key=='2') {levelItUp(6,8);}
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
      {
        switch(sh.getShield())
        {
          case 100: sh.setShieldState(new ShieldStateDamaged());
          break;
          case 50: sh.setShieldState(new ShieldStateDestroyed());
          break;
          case 0: myApp.delay(1000); myApp.exit();
          break;
        }
        list.remove(n);
      }
    }
  }
  
  private void detectCollisionsWithSpacestation(SpaceShip ship, SpaceStation station)
  {
    if ( myApp.dist( ship.getX() , ship.getY() , station.getX() , station.getY() ) < (ship.getRadius() + station.getRadius()) )
    {myApp.background(0,170,0);}
  }
  
  private boolean detectCollisionsWithLaser(Laser lasershot, ArrayList<Asteroid> list)
  {
    for (int n=0 ; n<list.size() ; n++)
    {
        if ( myApp.dist( lasershot.getX() , lasershot.getY() , list.get(n).getX() , list.get(n).getY() ) < (lasershot.getRadius() + list.get(n).getRadius()) )
        {
          listExplosions.add(new Explosion(myApp,lasershot.getX(),lasershot.getY()));
          list.remove(n);
          return true;
        }
    }
    return false;
  }
  
   //... FEHLT!!!
}
