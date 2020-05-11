public class Data
{
  
  private String user     = "DBHandler";
  private String pass     = "1234";
  private String database = "asteroidsV1";
  private String ip_adress = "localhost";
  private String device = "unknowndevice";
  private int playerid=-1;
  
  private int localHighscore;
  private int localscore;
  private int localShots;
  private int localItems;
  private String localTimePlayed;
  
  private int storedHighscore;
  private int storedScore;
  private int storedShots;
  private int storedItems;
  private String storedTimePlayed;
  
  public Data () {
    
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
    
    text("sent !",450,550);
    
    localHighscore = 0;
    localscore = 0;
    localShots = 0;
    localItems = 0;
    localTimePlayed = "0";
    
  }
  
  public void receiveData() {
    
    //storedHighscore = ..
    //storedScore = ..
    //storedShots = ..
    //storedItems = ..
    //storedTimePlayed = ..
    
    text("received !",400,550);
 
  }
  
  public void increaseLocalHighscore () {localHighscore++;}
  public void increaseLocalScore () {localscore++;}
  public void increaseLocalShots () {localShots++;}
  public void increaseLocalItems () {localItems++;}
  public void increaseLocalTime () {localTimePlayed = str(Integer.parseInt(localTimePlayed)+1);}
  
}
