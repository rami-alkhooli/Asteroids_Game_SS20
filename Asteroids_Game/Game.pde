class Game
{
  ArrayList <AsteroidSmall> listeAsteroidSmall = new ArrayList <AsteroidSmall> ();
  ArrayList <AsteroidBig> listeAsteroidBig = new ArrayList <AsteroidBig> ();
    public Game()
    {
      highscore = 0;
      hits = 0;
      shoots = 0;
      items = 0;
      time_played = "0";
    }
    public Game(int hs,int hts,int shts,int itms,String tmeplyd)
    {
      highscore = hs;
      hits = hts;
      shoots = shts;
      items = itms;
      time_played = tmeplyd;
    }
    public void generateAsteroids(int amntBig, int amntSmall)
    {
      for(int aB = 0 ; aB <= amntBig ; aB++)
        {
          AsteroidBig astBig = new AsteroidBig (random(20,width-200) , random(20,height-200));
          listeAsteroidBig.add(astBig);
        }
        for(int aS = 0 ; aS <= amntSmall ; aS++)
        {
          AsteroidSmall astSmall = new AsteroidSmall (random(20,width-200) , random(20,height-200));
          listeAsteroidSmall.add(astSmall);
        }
    }
    public void drawAsteroids()
    {
        fill(#9a8576);
        for(int i = 1 ; i<listeAsteroidSmall.size() ; i++)
        {
          AsteroidSmall oS = listeAsteroidSmall.get(i);
          oS.displayAndMove();
        }
        for(int i = 1 ; i<listeAsteroidBig.size() ; i++)
        {
          AsteroidBig oB = listeAsteroidBig.get(i);
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
