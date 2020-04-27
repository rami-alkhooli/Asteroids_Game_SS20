class Game
{
  private ArrayList <AsteroidSmall> listAsteroidSmall;
  private ArrayList <AsteroidBig> listAsteroidBig;
  
    public Game()
    {
      highscore = 0;
      hits = 0;
      shoots = 0;
      items = 0;
      time_played = "0";
      listAsteroidBig = new ArrayList <AsteroidBig> ();
      listAsteroidSmall = new ArrayList <AsteroidSmall> ();
    }
    
    public Game(int hs,int hts,int shts,int itms,String tmeplyd)
    {
      highscore = hs;
      hits = hts;
      shoots = shts;
      items = itms;
      time_played = tmeplyd;
      listAsteroidBig = new ArrayList <AsteroidBig> ();
      listAsteroidSmall = new ArrayList <AsteroidSmall> ();
    }
    
    public void generateAsteroids(int amntBig, int amntSmall)
    {
      for(int aB = 0 ; aB <= amntBig ; aB++)
        {
          AsteroidBig astBig = new AsteroidBig (random(20,width-200) , random(20,height-200));
          listAsteroidBig.add(astBig);
        }
        for(int aS = 0 ; aS <= amntSmall ; aS++)
        {
          AsteroidSmall astSmall = new AsteroidSmall (random(20,width-200) , random(20,height-200));
          listAsteroidSmall.add(astSmall);
        }
    }
    
    public void drawAsteroids()
    {
        fill(#9a9692);
        for(int i = 1 ; i<listAsteroidSmall.size() ; i++)
        {
          AsteroidSmall oS = listAsteroidSmall.get(i);
          oS.displayAndMove();
        }
        for(int i = 1 ; i<listAsteroidBig.size() ; i++)
        {
          AsteroidBig oB = listAsteroidBig.get(i);
          oB.displayAndMove();
        }
        noFill();
    }
   int highscore;
   int hits;
   int shoots;
   int items;
   String time_played;
   
   //... FEHLT!!!
}
