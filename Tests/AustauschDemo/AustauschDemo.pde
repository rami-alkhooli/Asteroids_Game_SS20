import de.bezier.data.sql.*;

Data data;
/* NEU*/
MySQL dbconnection;
/******/
void setup()
{
   dbconnection = new MySQL( this, "localhost", "asteroidsV1", "DBHandler", "1234" );
   if(dbconnection.connect())
   {
      if (args != null && args.length==2) {
        data = new Data(dbconnection,args[0],args[1]);///neu
      } else {
        println("args == null");
        data = new Data(dbconnection);///neu
      }
  }
   
  /* NEU*/
 
  /******/
  size(1200,600);
  
  data.setupData();
}

void draw()
{
  background(0,0,0);
  data.showLocalData();
  data.showStoredData();
}

void keyPressed()
{
  if(key == '1') {data.increaseLocalHighscore();}
  if(key == '2') {data.increaseLocalScore();}
  if(key == '3') {data.increaseLocalShots();}
  if(key == '4') {data.increaseLocalItems();}
  if(key == '5') {data.increaseLocalTime();}
  
  if(key == 's') {data.sendData();}
  if(key == 'r') {data.receiveData();}
}
