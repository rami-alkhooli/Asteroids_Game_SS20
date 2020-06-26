import processing.sound.*;
import processing.core.*;
import java.util.*;

class Engine
{
  private static final int MAXVERTICES = 12;
  private static final int MINVERTICES = 5;
  private static final int MAXRAGGEDNESS = 9;
  private static final int MINRAGGEDNESS = 2;
  private static final int GAMEOVERDELAY = 1000;

  private Level level;
  private SpaceShip sh;
  private SpaceStation st;
  private Laser laser;
  private Terminator terminator;
  private Congratulator congratulator;
  private SoundFile laserShoot;
  private SoundFile thrustSound;
  private SoundFile backgroundSound;
  private static Timer myTimer;
  private static Engine myEngine;
  private static PApplet myApp;

  private int allowedItems;
  private int score;
  private int hits;
  private int shots;
  private int items;
  private String time_played;

  private ArrayList <Asteroid> listAsteroids;
  private ArrayList <Explosion> listExplosions;
  private ArrayList <Item> listItems;

  /**
  * The default constructor (private).
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theTerminator is an object to detect when the game is lost.
  * @param theCongratulator is an object to detect when the game is won.
  **/
  private Engine(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator) {

    myApp = theApp;
    terminator = theTerminator;
    congratulator = theCongratulator;
    myTimer = new Timer(theApp);
    score = 0;
    hits = 0;
    shots = 0;
    items = 0;
    time_played = "00:00";
    listItems = new ArrayList <Item> ();
    listAsteroids = new ArrayList <Asteroid> ();
    listExplosions = new ArrayList <Explosion> ();
    sh = SpaceShip.create(myApp);
    st = SpaceStation.create(myApp);
    setLevel(new LevelFirst());
    laserShoot = new SoundFile(myApp, "laser.mp3");
    thrustSound = new SoundFile(myApp, "thrust.mp3");
    backgroundSound = new SoundFile(myApp, "background.mp3");
    backgroundSound.loop();
  }

  /**
  * A special constructor (private), if a game stats (Highscore, Hits, etc.) already exists.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theTerminator is an object to detect when the game is lost.
  * @param theCongratulator is an object to detect when the game is won.
  * @param scr holds the highscore of the registered player.
  * @param hts holds the total hits of the registered player.
  * @param shts holds the total shoots of the registered player.
  * @param itms holds the total collected items of the registered player.
  * @param tmeplyd holds the total played time of the registered player.
  **/
  private Engine(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator, int scr, int hts, int shts, int itms, String tmeplyd) {

    myApp = theApp;
    terminator = theTerminator;
    congratulator = theCongratulator;
    myTimer = new Timer(theApp);
    score = scr;
    hits = hts;
    shots = shts;
    items = itms;
    time_played = tmeplyd;
    listItems = new ArrayList <Item> ();
    listAsteroids = new ArrayList <Asteroid> ();
    listExplosions = new ArrayList <Explosion> ();
    sh = SpaceShip.create(myApp);
    st = SpaceStation.create(myApp);
    setLevel(new LevelFirst());
    laserShoot = new SoundFile(myApp, "laser.mp3");
    thrustSound = new SoundFile(myApp, "thrust.mp3");
    backgroundSound = new SoundFile(myApp, "background.mp3");
    backgroundSound.loop();
  }

  /**
  * This method detects collisions and draws every thing.
  **/
  public void run() {

    detectCollisionsWithAsteroids(sh, listAsteroids);
    detectCollisionsWithSpacestation(sh, st);
    detectCollisionsWithItems(sh, listItems);

    try {
      if (detectCollisionsWithLaser(laser, listAsteroids)==true) {
        laser = null;
      }
    }
    catch(NullPointerException e) {
    }

    try {

      for (int n=0; n<listItems.size(); n++) {
        listItems.get(n).show();
      }
    }
    catch (NullPointerException e) {
    }

    try {
      if (laser.shoot() == false) {
        laser = null;
      }
    }
    catch(NullPointerException e) {
    }

    try {

      for (int n=0; n<listExplosions.size(); n++) {
        if (listExplosions.get(n).show()==true) {
          listExplosions.remove(n);
        }
      }
    }
    catch (NullPointerException e) {
    }

    st.show();
    sh.show();
    drawAsteroids();
    myTimer.run();
    
    if(getNrAsteroids()==0) {thrustSound.stop(); go2NextLevel();}
  }
  
  /**
  * This method is called when the game is lost or won.
  * It stops the sounds and destroy the objects.
  **/
  public void stop() {
    sh.destroy();
    st.destroy();
    
    backgroundSound.stop();
    thrustSound.stop();
    laserShoot.stop();
    myTimer.stop();
    
    laser = null;
    myEngine = null;
  }

  /**
  * This method will be called in the main file in this application and will check when keys are pressed and handles this events.
  **/
  public void checkKeyPressed() {

    if (myApp.keyCode == myApp.UP) {
      sh.setAccState(new AccStateMoving()); 
      thrustSound.loop();
    }
    if (myApp.keyCode == myApp.DOWN) {
      sh.setAccState(new AccStateReturning());
    }
    if (myApp.keyCode == myApp.RIGHT) sh.setRotState(new RotStateRight());
    if (myApp.keyCode == myApp.LEFT) sh.setRotState(new RotStateLeft());

    if (myApp.key == ' ') {
      if (laser == null ) {
        laser = new Laser(myApp, sh.getX(), sh.getY(), sh.getPhi()); 
        shots++; 
        laserShoot.play();
      }
    }
  }

  /**
  * This method will be called in the main file in this application and will check when keys are released and handles this events.
  **/
  public void checkKeyReleased() {

    if (myApp.keyCode == myApp.UP) {
      sh.setAccState(new AccStateStoppedF()); 
      thrustSound.stop();
    }
    if (myApp.keyCode == myApp.DOWN) sh.setAccState(new AccStateStoppedR());
    if (myApp.keyCode == myApp.RIGHT) sh.setRotState(new RotStateStoppedR());
    if (myApp.keyCode == myApp.LEFT) sh.setRotState(new RotStateStoppedL());
  }

  /**
  * This method implements the single ton pattern and creates one instance using the default constructor, thus it needs the same parameters.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theTerminator is an object to detect when the game is lost.
  * @param theCongratulator is an object to detect when the game is won.
  **/
  public static Engine start(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator) {

    if (myEngine==null) {
      myEngine = new Engine(theApp, theTerminator, theCongratulator);
    }
    return myEngine;
  }

  /**
  * This method implements the single ton pattern and creates one instance using the special constructor, thus it needs the same parameters.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theTerminator is an object to detect when the game is lost.
  * @param theCongratulator is an object to detect when the game is won.
  * @param scr holds the highscore of the registered player.
  * @param hts holds the total hits of the registered player.
  * @param shts holds the total shoots of the registered player.
  * @param itms holds the total collected items of the registered player.
  * @param tmeplyd holds the total played time of the registered player.
  **/
  public static Engine start(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator, int scr, int hts, int shts, int itms, String tmeplyd) {

    if (myEngine==null) {
      myEngine = new Engine(theApp, theTerminator, theCongratulator, scr, hts, shts, itms, tmeplyd);
    }
    return myEngine;
  }

  /**
  * This method gets a n object of the class Level and changes the current level of the game.
  *
  * @param theLevel holds the new level, which the game will change to.
  **/
  public void setLevel(Level theLevel) {

    level = theLevel;
    allowedItems = level.determineItems();
    sh.recenter();
    generateAsteroids();
  }
  
  /**
  * THis method is called after winning current level and it takes the game to next level.
  **/
  public void go2NextLevel() {
    String currentLevel = level.getClass().getName();
    if(currentLevel=="LevelFirst") {setLevel(new LevelSecond());}
    else if(currentLevel=="LevelSecond") {setLevel(new LevelThird());}
    else if(currentLevel=="LevelThird") {setLevel(new LevelFourth());}
    else if(currentLevel=="LevelFourth") {setLevel(new LevelFifth());}
    else if(currentLevel=="LevelFifth") {congratulator.winGame();}
  }

  /**
  * This method generates asteroids at the beginning.
  **/
  private void generateAsteroids() {

    listAsteroids = new ArrayList<Asteroid>();

    for (int aB = 0; aB < level.determineAmount(); aB++) {

      Asteroid asteroid = new Asteroid (myApp, level, myApp.random(MINRAGGEDNESS, MAXRAGGEDNESS), (int)(myApp.random(MINVERTICES, MAXVERTICES)));
      listAsteroids.add(asteroid);
    }
  }

  /**
  * This method draws all asteroids.
  **/
  private void drawAsteroids() {

    for (int i = 0; i<listAsteroids.size(); i++) {

      Asteroid asteroid = listAsteroids.get(i);
      asteroid.show();
    }
  }

  /**
  * This method shows statistics in runtime.
  **/
  public void statistics() {

    myApp.fill(255, 255, 255);
    myApp.textSize(30);
    myApp.textAlign(myApp.LEFT, myApp.TOP);
    myApp.text("x: " + myApp.nf((int)sh.getX(), 4), 10, 10);
    myApp.text("y: " + myApp.nf((int)sh.getY(), 4), 140, 10);
    myApp.text("v: " + myApp.nf((int)sh.getSpeed(), 2), 270, 10);
    myApp.text("Phi: " + myApp.nf((int)sh.getPhi(), 3), 360, 10);
    myApp.text("Shots: " + myApp.nf(shots, 2), 510, 10);
    myApp.text("Time: " + myTimer.getTime(),660,10);
    myApp.text("Shield: " + sh.getShield()+"%", 10, 50);
    myApp.text("Lives: " + sh.getLives(), 210, 50);
    myApp.text("Items: " + sh.getNumberItems(), 330, 50);
    myApp.text("Score: " + this.score, 470, 50);
    myApp.text("Asteroids: " + this.getNrAsteroids(), 650, 50);
  }

  /**
  * This method detects collisions between space ship and asteroids.
  *
  * @param ship holds the space ship of the player.
  * @param list holds a list of the current floating asteroids.
  **/
  private void detectCollisionsWithAsteroids(SpaceShip ship, ArrayList<Asteroid> list) {

    for (int n=0; n<list.size(); n++) {

      if ( myApp.dist( ship.getX(), ship.getY(), list.get(n).getX(), list.get(n).getY() ) < (ship.getRadius() + list.get(n).getRadius()) ) {

        listExplosions.add(new Explosion(myApp, list.get(n).getX(), list.get(n).getY()));

        switch(sh.getShield()) {

        case 100: 
          sh.setShieldState(new ShieldStateDamaged());
          break;
        case 50: 
          sh.setShieldState(new ShieldStateDestroyed());
          break;
        case 0: 
          if (sh.getLives()>0) {
            sh.loseLive();
          } else {
            laserShoot.stop();
            backgroundSound.stop();
            thrustSound.stop();
            terminator.terminateGame();
          }
          break;
        }

        list.remove(n);
      }
    }
  }

  /**
  * This method detects collisions between the space ship and space station. It is used to detect, whether the space ship delivered the collected items at the space station.
  *
  * @param ship holds the space ship of the player.
  * @param station holds the space station of the player.
  **/
  private void detectCollisionsWithSpacestation(SpaceShip ship, SpaceStation station) {

    if ( myApp.dist( ship.getX(), ship.getY(), station.getX(), station.getY() ) < (ship.getRadius() + station.getRadius()) ) {
      station.loadItems(ship, this);
    }
  }
  
  /**
  * This method detects collisions between asteroids and laser shots.
  *
  * @param lasershot holds the object of the fired laser shot.
  * @param list holds a list of the current floating asteroids.
  * @returns true if a collision was detected / false if a collision was not detected.
  **/
  private boolean detectCollisionsWithLaser(Laser lasershot, ArrayList<Asteroid> list) {

    for (int n=0; n<list.size(); n++) {

      if ( myApp.dist( lasershot.getX(), lasershot.getY(), list.get(n).getX(), list.get(n).getY() ) < (lasershot.getRadius() + list.get(n).getRadius()) ) {

        listExplosions.add(new Explosion(myApp, list.get(n).getX(), list.get(n).getY()));
        if ((list.get(n).getRadius() > (myApp.width/20)) && (allowedItems>0)) {
          listItems.add(new Item(myApp, list.get(n).getX(), list.get(n).getY())); 
          allowedItems--;
        }
        hits += 1;
        score += list.get(n).getRadius();
        list.remove(n);
        return true;
      }
    }

    return false;
  }

  /**
  * This method detects collisions between the space ship and items. It is used to indicate whether the space ship collected items.
  *
  * @param ship holds the space ship of the player.
  * @param list holds a list of items generated in the playground.
  **/
  private void detectCollisionsWithItems(SpaceShip ship, ArrayList<Item> list) {

    for (int n=0; n<list.size(); n++) {

      if ( myApp.dist( ship.getX(), ship.getY(), list.get(n).getX(), list.get(n).getY() ) < (ship.getRadius() + list.get(n).getRadius()) ) {
        items++;
        ship.collectItem(list.get(n));
        list.remove(n);
      }
    }
  }
  
  /**
  * This is a getter method.
  *
  * @returns the number of times an asteroid was hit by a laser shot.
  **/
  public int getHits() {return hits;}
  
  /**
  * This is a getter method.
  *
  * @returns the score of the space ship gained in the game.
  **/
  public int getScore() {return score;}
  
  /**
  * This is a setter method.
  *
  * @param sc holds the new score to be set.
  **/
  public void setScore(int sc) {score = sc;}
  
  /**
  * This is a getter method.
  *
  * @returns the total shots fired by the space ship.
  **/
  public int getShots() {return shots;}
  
  /**
  * This is a setter method.
  *
  * @param sh holds the new number of shots to be set.
  **/
  public void setShots(int sh) {shots = sh;}
  
  /**
  * This is a getter method.
  *
  * @returns the collected items.
  **/
  public int getItems() {return items;}
  
  /**
  * This is a setter method.
  *
  * @param it holds the new number of collected items to be set
  **/
  public void setItems(int it) {items = it;}
  
  /**
  * This is a getter method.
  *
  * @returns the total played time.
  **/
  public String getPlayTime() {return myTimer.getTime();}
  
  /**
  * This is a setter method.
  *
  * @param pt holds the total new played time to be set.
  **/
  public void setPlayTime(String pt) {time_played = pt;}
  
  /**
  * This is a getter method.
  *
  * @returns the strength of the shield (100 full / 50 damaged / 0 destroyed).
  **/
  public int getShield() {return sh.getShield();}
  
  /**
  * This is a getter method.
  *
  * @returns the number of the asteroids generated in play ground.
  **/
  public int getNrAsteroids() {return listAsteroids.size();}
  
  /**
  * This is a getter method.
  *
  * @returns the number of explosions generated after collisions.
  **/
  public int getNrExplosions() {return listExplosions.size();}
  
}
