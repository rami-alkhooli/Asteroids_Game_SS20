Data data;

void setup()
{
  size(1200,600);
  data = new Data();
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
