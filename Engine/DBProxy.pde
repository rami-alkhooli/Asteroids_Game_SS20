import de.bezier.data.sql.*;
import java.sql.Timestamp;
import java.util.Date;

public class DBProxy
{
  private String user     = "DBHandler";
  private String pass     = "1234";
  private String database = "asteroidsV1";
  private String ip_adress = "localhost";
  private String device = "unknowndevice";
  private int playerid=-1;

  MySQL dbconnection;
  
  
  public DBProxy() {
  
    
  }
  
  public DBProxy(MySQL dbcon) {
  
      dbconnection=dbcon;
      
  }
  
  public DBProxy(MySQL dbcon,String ip_adr,String dev) {
  
      dbconnection=dbcon;
      ip_adress=ip_adr;
      device=dev;
      
  }
  
  /**
  This method performs the login process.
  It checks whether the given login credentials are valid. And updates the tables "PlayerHasDevice" and "Device".
  uploads:
  -PlayerHasDevice:   logintime,ipadress,PlayerID
  -Device:            devicename/type,ipadress,PlayerID
  
  returns:
  -1  accountname/email not found 
  0   when the account has been found but the given password is wrong;
  1   account found and password correct
  (equal to varify Login)  
  **/
  public int login(String accountOrEmail, String password) {
  
    boolean deviceRegistered=false;
    String dev="unknown device";
    int i=varifyLogin(accountOrEmail,password);
    
    if(i==1) {
    
      dbconnection.query("select id from Player where account ='"+accountOrEmail+"'||email='"+accountOrEmail+"' && password='"+password+"';");
      
      while(dbconnection.next()) {
      
        playerid = dbconnection.getInt("id");
        
      }
      
      println(playerid);
      Date date = new Date();
      long time = date.getTime();
      Timestamp ts = new Timestamp(time);
      String loginTime = ts.toString();
      device= device.replaceAll(" ","");
      dbconnection.query("insert into PlayerHasDevice (id,ip,loginTime) values ('"+playerid+"','"+ip_adress+"','"+loginTime+"');");
      
      //checking PlayerHasDevice and updating it if necessary
      //GETTING Device name is missing !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      dbconnection.query("select device_type from Device where ip='"+ip_adress+"';");
      while(dbconnection.next()) {
      
        dev=dbconnection.getString("device_type");
        dev = dev.replaceAll(" ","");
        
        if(dev.equals(device)) {
        
          println("Device and ip allready registered");
          deviceRegistered=true;
        }
        
        else {
        
          println("ip found but new device-> registering it");
          
        }
      }
      
      if(!deviceRegistered) {
      
        println("updating Database (currently omitted!!! Remove commentation!!!)");
        dbconnection.query("insert into Device (ip,device_type) values('"+ip_adress+"','"+dev+"');");
        
      }
    }
    
    return i;
    
  }
  
  /**
  this method handles the logout process for a certain Player
  the given id has to be correct. There is no failsafe
  uploads:
  -PlayerHasDevice:    logoutTime
  returns:
  nothing
  **/
  public void logout(int id) {
  
    Date date = new Date();
    long time = date.getTime();
    Timestamp ts = new Timestamp(time);
    String logoutTime = ts.toString();
    dbconnection.query("update PlayerHasDevice set logoutTime='"+logoutTime+"' where id="+id+";");
    
  }
  
  /**
  this methods registers a new Player
  it returns:
  0    for Email,accountname are available and have been signed in to the database -> registration complete
  1    for email allready in use -> no registration
  2    for accountname allready in use -> no registration
  3    for Email and accountname are allready taken/not available -> no registration
  **/
  int register(String email,String name,String password) {
  
    int i=0;
    
    if(varifyLogin(email,"0000")>=0) {
    
      println("email allready in use");
      i=1;
      
    }
    
    if(varifyLogin(name,"0000")>=0) {
    
      println("accountname not available");
      i=i+2;
      
    }
    
    if(i==0) {
    
      dbconnection.query("insert into Player(account,email,password) values ('"+name+"','"+email+"','"+password+"');");
    }
    
    return i;
    
  }
  
  
 /**
  varifyLogin(name,password) 
  The Parameter name should have either the emailaddress or accoutname
  
  pulls PlayerID and saves it as a private parameter: playerid
  
  returns:
  -1  accountname/email not found 
  0   when the account has been found but the given password is wrong;
  1   account found and password correct
  
  **/
 private int varifyLogin(String nameOrEmail, String password) {
  
    int i=-1;
    dbconnection.query("select password from Player where account ='"+nameOrEmail+"'||email='"+nameOrEmail+"';");
    while(dbconnection.next()) {
    
      if(dbconnection.getString("password").contentEquals(password)) {
      
        i=1;
        println("correct login data!");
        dbconnection.query("select id from Player where account ='"+nameOrEmail+"'||email='"+nameOrEmail+"';");
        while(dbconnection.next()) {
        
          playerid=dbconnection.getInt("id");
        } 
        
      }
      
      else {
      
        i=0;
        println("account: "+nameOrEmail+" found; Password wrong");
        
      }
    }
    
    return i;
    
  }
  
  
  /**
  checks availability of accountname and email
  
  returns:
  0 accountname and email are available
  1 accountname taken email available
  2 email allready taken accontname available
  3 email and accountname not available or allready in use
  **/
  public int checkAvailability(String email,String name) {
  
    int i=0;
    dbconnection.query("select email from Player where account ='"+name+"';");
    
    while(dbconnection.next()) {
    
      println("ACCOUNTNAME NOT available");
      i=1;
      
    }
    
    dbconnection.query("select email from Player where email='"+email+"';");
    
    while(dbconnection.next()) {
    
      println("email allready taken");
      i=i+2;
    }
    
    if(i==0) {
    
      println("email and accountname available");
      
    }
    
    return i;
    
  }
  
  
  int getGameId(int PlayerID) {return 1;}
  
  int getGameforPlayerID(int idPlayer) {
  
    int idGame=-1;
    return idGame;
    
  }
  
  /**
  This method handles the updates to the database at gamestart.
  uploads:
  -Game:            logintime,gamestart
  -GameHasDevice:   PlayerID,GameID,ipadress
  returns:
  nothing
  **/
  public void gameStartUpdateStats() {
  
    int GameID=0;
    String logintime=null;
    
    dbconnection.query("select loginTime from PlayerHasDevice where id="+playerid+";");
    Date date = new Date();
    long time = date.getTime(); 
    Timestamp ts = new Timestamp(time);
    String gamestart = ts.toString();
    
    while(dbconnection.next()) {
    
      logintime = dbconnection.getString("loginTime");
    }
    
    dbconnection.query("insert into Game (login_timestamp,game_start) values('"+logintime+"','"+gamestart+"');");
    dbconnection.query("select idGame from Game where login_timestamp='"+logintime+"' && game_start='"+ts+"';");
    
    while(dbconnection.next()) {
    
      GameID = dbconnection.getInt("idGame");
    }
    
    dbconnection.query("insert into GameHasDevice (id,idGame,ip_address) values('"+playerid+"','"+GameID+"','"+ip_adress+"');");
  }
  
  /**
  This method handles the updates to the database at gameend.
  uploads:
  -Game:  hits,shoots,items,highscore,game_end,timeplayed,
  **/
  public void gameEndUpdateStats( int hits, int shoots, int items, int highscore) {
  
    int GameId=0;
    Date date = new Date();
    long time = date.getTime(); 
    Timestamp ts = new Timestamp(time);
    String gameend = ts.toString();
    String gamestart=null;
    dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
    
    while(dbconnection.next()) {
    
      GameId = dbconnection.getInt("idGame");
    }
    
    dbconnection.query("select game_start from Game where idGame="+GameId+";");
    
    while(dbconnection.next()) {
    
      gamestart = dbconnection.getString("game_start");
    }
    
    dbconnection.query("update Game set game_end='"+gameend+"',highscore="+highscore+",hits="+hits+",shoots="+shoots+",items="+items+", time_played=timediff('"+gameend+"','"+gamestart+"') where idGame="+GameId+";");
    
  }
  
  /**
  This method can be used to get the statistics of the last Game.
  returns:
  -Object "Game" which includes the statistics: highscore,hits,shoots,items,time_played
  
  all parameters of Game are 0 when the Player hasnt played a Game at all.
  **/
  public Game getStats(Game theGame) {
  
    int gameId=0;
     dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
     
    while(dbconnection.next()) {
    
      gameId = dbconnection.getInt("idGame");
    }
   
    try {
    
        dbconnection.query("select highscore,shoots,hits,items,time_played from Game where idGame="+gameId+";");
        while(dbconnection.next()) {
        
          theGame.shots = dbconnection.getInt("shoots");
          theGame.score = dbconnection.getInt("hits");
          theGame.items = dbconnection.getInt("items");
          theGame.time_played = dbconnection.getString("tifme_played");
        }
    }
    
    catch(Exception e) {
    
      throw e;
      
    }
    
    return theGame;
    
  }

}
