class Game
{
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
   int highscore;
   int hits;
   int shoots;
   int items;
   String time_played;
   TimePlayedAsteroids timeplayed;
   //... FEHLT!!!
}
