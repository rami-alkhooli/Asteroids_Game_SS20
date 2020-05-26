import de.bezier.data.sql.*;
import java.sql.Timestamp;
import java.util.Date;
import java.sql.Time;

public class DBProxy
{
  private String user     = "DBHandler";
  private String pass     = "1234";
  private String database = "asteroidsV1";
  private String ip_adress = "192.168.43.14";
  private String device = "unknowndevice";
  public int playerid=-1;

  MySQL dbconnection;
  
  
  public DBProxy()
  {
    
  }
  public DBProxy(MySQL dbcon)
  {
      dbconnection=dbcon;
  }
  public DBProxy(MySQL dbcon,String ip_adr,String dev)
  {
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
  public int login(String accountOrEmail, String password)
  {
    boolean deviceRegistered=false;
    String dev="unknown device";
    int i=varifyLogin(accountOrEmail,password);
    
    if(i==1)
    {
      dbconnection.query("select id from Player where account ='"+accountOrEmail+"'||email='"+accountOrEmail+"' && password='"+password+"';");
      while(dbconnection.next())
      {
        playerid = dbconnection.getInt("id");
      }
      println(playerid);
      Date date = new Date();
      long time = date.getTime();
      Timestamp ts = new Timestamp(time);
      String loginTime = ts.toString();
      println("login at :" + loginTime);
      device= device.replaceAll(" ","");
      dbconnection.query("insert into PlayerHasDevice (id,ip,loginTime) values ('"+playerid+"','"+ip_adress+"','"+loginTime+"');");
      
      //checking PlayerHasDevice and updating it if necessary
      //GETTING Device name is missing !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      dbconnection.query("select device_type from Device where ip='"+ip_adress+"';");
      while(dbconnection.next())
      {
        dev=dbconnection.getString("device_type");
        dev = dev.replaceAll(" ","");
        if(dev.equals(device))
        {
          println("Device and ip allready registered");
          deviceRegistered=true;
        }
        else
        {
          println("ip found but new device-> registering it");
        }
      }
      if(!deviceRegistered)
      {
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
  public void logout()
  {
    Date date = new Date();
    long time = date.getTime();
    Timestamp ts = new Timestamp(time);
    String logoutTime = ts.toString();
    println("logout at :" + logoutTime);
    dbconnection.query("update PlayerHasDevice set logoutTime='"+logoutTime+"' where id="+playerid+";");
    println("logut erfolgreich");
  }
  
  /**
  this methods registers a new Player
  it returns:
  0    for Email,accountname are available and have been signed in to the database -> registration complete
  1    for email allready in use -> no registration
  2    for accountname allready in use -> no registration
  3    for Email and accountname are allready taken/not available -> no registration
  **/
  int register(String email,String name,String password)
  {
    int i=0;
    if(varifyLogin(email,"0000")>=0)
    {
      println("email allready in use");
      i=1;
    }
    if(varifyLogin(name,"0000")>=0)
    {
      println("accountname not available");
      i=i+2;
    }
    if(i==0)
    {
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
 private int varifyLogin(String nameOrEmail, String password)
  {
    int i=-1;
    dbconnection.query("select password from Player where account ='"+nameOrEmail+"'||email='"+nameOrEmail+"';");
    while(dbconnection.next())
    {
      if(dbconnection.getString("password").contentEquals(password))
      {
        i=1;
        println("correct login data!");
        dbconnection.query("select id from Player where account ='"+nameOrEmail+"'||email='"+nameOrEmail+"';");
        while(dbconnection.next())
        {
          playerid=dbconnection.getInt("id");
        }      
      }
      else
      {
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
  public int checkAvailability(String email,String name)
  {
    int i=0;
    dbconnection.query("select email from Player where account ='"+name+"';");
    while(dbconnection.next())
    {
      println("ACCOUNTNAME NOT available");
      i=1;
    }
    dbconnection.query("select email from Player where email='"+email+"';");
    while(dbconnection.next())
    {
      println("email allready taken");
      i=i+2;
    }
    if(i==0)
    {
      println("email and accountname available");
    }
    return i;
  }
  
  
  int getGameId(int PlayerID)
  {
    return 1;
  }
  
  int getGameforPlayerID(int idPlayer)
  {
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
  public void gameStartUpdateStats()
  {
    int GameID=0;
    String logintime=null;
   
    Date date = new Date();
    long time = date.getTime(); 
    Timestamp ts = new Timestamp(time);
    String gamestart = ts.toString();
    println("gamestart at :" + gamestart);
    dbconnection.query("select loginTime from PlayerHasDevice where id="+playerid+";");
    while(dbconnection.next())
    {
      logintime = dbconnection.getString("loginTime");
    }
    dbconnection.query("insert into Game (login_timestamp,game_start) values('"+logintime+"','"+gamestart+"');");
    dbconnection.query("select idGame from Game where login_timestamp='"+logintime+"' && game_start='"+ts+"';");
    while(dbconnection.next())
    {
      GameID = dbconnection.getInt("idGame");
    }
    dbconnection.query("insert into GameHasDevice (id,idGame,ip_address) values('"+playerid+"','"+GameID+"','"+ip_adress+"');");
  }
  
  /**
  This method handles the updates to the database at gameend.
  uploads:
  -Game:  hits,shoots,items,highscore,game_end,timeplayed,
  **/
  public void gameEndUpdateStats( int hits, int shoots, int items, int highscore)
  {
    int GameId=0;
    Date date = new Date();
    long time = date.getTime(); 
    Timestamp ts = new Timestamp(time);
    String gameend = ts.toString();
    println("gameEnd at :" + gameend);
    String gamestart=null;
    dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
    while(dbconnection.next())
    {
      GameId = dbconnection.getInt("idGame");
    }
    dbconnection.query("select game_start from Game where idGame="+GameId+";");
    while(dbconnection.next())
    {
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
  public boolean getStats(Game gamestats)
  {
    
    int gameId=0;
     dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
    while(dbconnection.next())
    {
      gameId = dbconnection.getInt("idGame");
    }
   println("gameId: "+gameId);
    try
    {
        dbconnection.query("select highscore,shoots,hits,items,time_played from Game where idGame="+gameId+";");
        while(dbconnection.next())
        {
          gamestats.addHighscore(dbconnection.getInt("highscore"));
          //gamestats.addShots(dbconnection.getInt("shoots"));
          //gamestats.setHits(dbconnection.getInt("hits"));
          //gamestats.addItems(dbconnection.getInt("items"));
          gamestats.setTotalPlayTime(dbconnection.getString("time_played"));
        }
        return true;
    }
    catch(Exception e)
    {
     //throw e;      
      return false;

    }

  }
  
  
  
  public int getHighscore()
  {
    int highscore = 0;
    int tmp;
    int i = 0;
    int[] gameId = new int[9999];
     dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
    while(dbconnection.next())
    {
      gameId[i] = dbconnection.getInt("idGame");
      i++;
    }
    gameId[i]=-1;
    for(int z=0;gameId[z]>=0;z++)
    {
      dbconnection.query("select highscore from Game where idGame="+gameId[z]+";");
      while(dbconnection.next())
      {
        tmp = dbconnection.getInt("highscore");
        if(tmp>=highscore)
        {
          highscore=tmp;
        }
      }
    }
      println(highscore);
    
    return highscore;
  }
  
  
   public String getTotalPlayedTime()
  {
    String time = "0.0.0 | 0:0:0";
    int year,month,day,hours,min,sec;
    Timestamp tmp;
    Timestamp calctime = new Timestamp(0);
    
    int i = 0;
    int[] gameId = new int[9999];
     dbconnection.query("select idGame from GameHasDevice where id='"+playerid+"';");
    while(dbconnection.next())
    {
      gameId[i] = dbconnection.getInt("idGame");
      i++;
    }
    gameId[i]=-1;
    println(i);
    for(int z=0;gameId[z]>=0;z++)
    {
      //println(gameId[z]);
      dbconnection.query("select time_played from Game where idGame="+gameId[z]+";");
      while(dbconnection.next())
      {
        println("test");
        tmp = dbconnection.getTimestamp("time_played");
        //println("gettime test: "+tmp.toString());
        calctime.setTime(((calctime.getHours()-1)*3600+calctime.getMinutes()*60+calctime.getSeconds()+tmp.getSeconds()+tmp.getMinutes()*60+tmp.getHours()*3600)*1000);
        //calctime.setTime((calctime.getMinutes()*60+calctime.getHours()*3600+calctime.getSeconds()+tmp.getSeconds()+tmp.getMinutes()*60+tmp.getHours()*3600)*1000);
        println(tmp.getHours()+":"+tmp.getMinutes()+":"+tmp.getSeconds());
      }
    }
    //calctime.setTime(highscore*1000);
    calctime.setHours(calctime.getHours()-1);
    
    println( "| time: "+calctime+" | test: "+calctime.getDate());
    year =calctime.getYear()-70;
    month = calctime.getMonth();
    day = calctime.getDate()-1;
    hours = calctime.getHours();
    min = calctime.getMinutes();
    sec =  calctime.getSeconds();
    time = ""+year+"."+month+"."+day+" | "+hours+":"+min+":"+sec+"";
    return time;
  }
}

  
