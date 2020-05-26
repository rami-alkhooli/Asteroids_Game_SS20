public class Data
{
  private Game receivedData;
  private String user     = "DBHandler";
  private String pass     = "1234";
  private String database = "asteroidsV1";
  private String ip_adress = "localhost";
  private String device = "unknowndevice";
  private int playerid=-1;
  
  private int localHighscore;
  private int localscore;//Bei mit gibts keinen Unterschied zwischen dem highscore und localscore
  private int localShots;
  private int localItems;
  private String localTimePlayed;//Die gespielte Zeit wird von dem DBProxy selber berechnet.
  
  private int storedHighscore;
  private int storedScore;
  private int storedShots;
  private int storedItems;
  private String storedTimePlayed;
  private MySQL dbhand;
  private DBProxy dbprox;
  
  public Data (MySQL dbcon,String ip,String dev) {
    dbhand = dbcon;
    dbprox = new DBProxy(dbcon,ip,dev);
    dbprox.login("testPlayer2","1234");
    
    localHighscore = 0;
    localscore = 0;
    localShots = 0;
    localItems = 0;
    localTimePlayed = "0";
    
    storedHighscore = 0;
    storedScore = 0;
    storedShots = 0;
    storedItems = 0;
    storedTimePlayed = "0";
    
  }
  public Data (MySQL dbcon) {
    dbhand = dbcon;
    dbprox = new DBProxy(dbcon);
    dbprox.login("testPlayer","1234");
    
    localHighscore = 0;
    localscore = 0;
    localShots = 0;
    localItems = 0;
    localTimePlayed = "0";
    
    storedHighscore = 0;
    storedScore = 0;
    storedShots = 0;
    storedItems = 0;
    storedTimePlayed = "0";
    
  }
  
  public Data (int _highscore, int _score , int _shots, int _items, String _time) {
    
    localHighscore = 0;
    localscore = 0;
    localShots = 0;
    localItems = 0;
    localTimePlayed = "0";
    
    try {storedHighscore = _highscore;} catch (Exception e) {}
    try {storedScore = _score;}         catch (Exception e) {}
    try {storedShots = _shots;}         catch (Exception e) {}
    try {storedItems = _items;}         catch (Exception e) {}
    try {storedTimePlayed = _time;}     catch (Exception e) {}
    
  }
  
  public void showLocalData() {
    
    text("local highscore:"+localHighscore,50,100);
    text("local score:"+localscore,50,200);
    text("local shots:"+localShots,50,300);
    text("local items:"+localItems,50,400);
    text("local time:"+localTimePlayed,50,500);
    
  }
  
    public void showStoredData() {
    
    text("stored highscore:"+storedHighscore,650,100);
    text("stored score:"+storedScore,650,200);
    text("stored shots:"+storedShots,650,300);
    text("stored items:"+storedItems,650,400);
    text("stored time:"+storedTimePlayed,650,500);
    
  }
  
  public void setupData() {
    
    textAlign(LEFT, BOTTOM);
    textSize(50);
    fill(0,250,250);
    
  }
  
  public void sendData() {
    
    // send localHighscore
    // send localscore
    // send localShots
    // send localItems
    // send localTimePlayed
    dbprox.gameStartUpdateStats();
    delay(5000);
    dbprox.gameEndUpdateStats(42,localShots,localItems,localHighscore);
    text("sent !",450,550);
    
    localHighscore = 0;
    localscore = 0;
    localShots = 0;
    localItems = 0;
    localTimePlayed = "0";
    
  }
  
  public void receiveData() {
    dbprox.playerid = 1;
    TimePlayedAsteroids tp;
    receivedData = dbprox.getStats();
    storedHighscore = dbprox.getHighscore();
    /*******++letzte Score?!**********/
    storedScore = receivedData.highscore;    
    /*********************************************************************/
    storedShots = receivedData.shoots;
    storedItems = receivedData.items;
    storedTimePlayed = receivedData.time_played;
    tp=dbprox.getTotalPlayedTime();
    storedTimePlayed = ""+tp.hours+ ":"+tp.minutes+":"+tp.seconds;
    
    text("received !",400,550);
 
  }
  
  public void increaseLocalHighscore () {localHighscore++;}
  public void increaseLocalScore () {localscore++;}
  public void increaseLocalShots () {localShots++;}
  public void increaseLocalItems () {localItems++;}
  public void increaseLocalTime () {localTimePlayed = str(Integer.parseInt(localTimePlayed)+1);}
  
}
