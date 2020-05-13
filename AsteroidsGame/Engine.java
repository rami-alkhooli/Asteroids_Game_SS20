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
  public int highscore;
  public int score;
  public int shots;
  public int items;
  public String time_played;

  private ArrayList <Asteroid> listAsteroids;
  private ArrayList <Explosion> listExplosions;
  private ArrayList <Item> listItems;

  private Engine(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator) {

    myApp = theApp;
    terminator = theTerminator;
    congratulator = theCongratulator;
    myTimer = new Timer(theApp);
    score = 0;
    shots = 0;
    items = 0;
    time_played = "0";
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

  private Engine(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator, int scr, int shts, int itms, String tmeplyd) {

    myApp = theApp;
    terminator = theTerminator;
    congratulator = theCongratulator;
    myTimer = new Timer(theApp);
    score = scr;
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
    
    if(getNrAsteroids()==0) {go2NextLevel();}
  }
  
  public void stop() {
    sh.destroy();
    st.destroy();
    backgroundSound.stop();
    myTimer.stop();
    laser = null;
    myEngine = null;
  }

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

  public void checkKeyReleased() {

    if (myApp.keyCode == myApp.UP) {
      sh.setAccState(new AccStateStoppedF()); 
      thrustSound.stop();
    }
    if (myApp.keyCode == myApp.DOWN) sh.setAccState(new AccStateStoppedR());
    if (myApp.keyCode == myApp.RIGHT) sh.setRotState(new RotStateStoppedR());
    if (myApp.keyCode == myApp.LEFT) sh.setRotState(new RotStateStoppedL());
  }

  public static Engine start(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator) {

    if (myEngine==null) {
      myEngine = new Engine(theApp, theTerminator, theCongratulator);
    }
    return myEngine;
  }

  public static Engine start(PApplet theApp, Terminator theTerminator, Congratulator theCongratulator, int hts, int shts, int itms, String tmeplyd) {

    if (myEngine==null) {
      myEngine = new Engine(theApp, theTerminator, theCongratulator, hts, shts, itms, tmeplyd);
    }
    return myEngine;
  }

  public void setLevel(Level theLevel) {

    level = theLevel;
    allowedItems = level.determineItems();
    sh.recenter();
    generateAsteroids();
  }
  
  public void go2NextLevel() {
    String currentLevel = level.getClass().getName();
    if(currentLevel=="LevelFirst") {setLevel(new LevelSecond());}
    else if(currentLevel=="LevelSecond") {setLevel(new LevelThird());}
    else if(currentLevel=="LevelThird") {setLevel(new LevelFourth());}
    else if(currentLevel=="LevelFourth") {setLevel(new LevelFifth());}
    else if(currentLevel=="LevelFifth") {congratulator.winGame();}
  }

  private void generateAsteroids() {

    listAsteroids = new ArrayList<Asteroid>();

    for (int aB = 0; aB < level.determineAmount(); aB++) {

      Asteroid asteroid = new Asteroid (myApp, level, myApp.random(MINRAGGEDNESS, MAXRAGGEDNESS), (int)(myApp.random(MINVERTICES, MAXVERTICES)));
      listAsteroids.add(asteroid);
    }
  }

  private void drawAsteroids() {

    for (int i = 0; i<listAsteroids.size(); i++) {

      Asteroid asteroid = listAsteroids.get(i);
      asteroid.show();
    }
  }

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

  private void detectCollisionsWithSpacestation(SpaceShip ship, SpaceStation station) {

    if ( myApp.dist( ship.getX(), ship.getY(), station.getX(), station.getY() ) < (ship.getRadius() + station.getRadius()) ) {
      station.loadItems(ship, this);
    }
  }

  private boolean detectCollisionsWithLaser(Laser lasershot, ArrayList<Asteroid> list) {

    for (int n=0; n<list.size(); n++) {

      if ( myApp.dist( lasershot.getX(), lasershot.getY(), list.get(n).getX(), list.get(n).getY() ) < (lasershot.getRadius() + list.get(n).getRadius()) ) {

        listExplosions.add(new Explosion(myApp, list.get(n).getX(), list.get(n).getY()));
        if ((list.get(n).getRadius() > (myApp.width/20)) && (allowedItems>0)) {
          listItems.add(new Item(myApp, list.get(n).getX(), list.get(n).getY())); 
          allowedItems--;
        }
        score += list.get(n).getRadius();
        list.remove(n);
        return true;
      }
    }

    return false;
  }

  private void detectCollisionsWithItems(SpaceShip ship, ArrayList<Item> list) {

    for (int n=0; n<list.size(); n++) {

      if ( myApp.dist( ship.getX(), ship.getY(), list.get(n).getX(), list.get(n).getY() ) < (ship.getRadius() + list.get(n).getRadius()) ) {

        ship.collectItem(list.get(n));
        list.remove(n);
      }
    }
  }

  public int getScore() {
    return score;
  }
  public int getShots() {
    return shots;
  }
  public int getItems() {
    return st.getItems();
  }
  public int getShield() {
    return sh.getShield();
  }
  public String getTimePlayed() {
    return time_played;
  }
  public int getNrAsteroids() {
    return listAsteroids.size();
  }
  public int getNrExplosions() {
    return listExplosions.size();
  }
}
