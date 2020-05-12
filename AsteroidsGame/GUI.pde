public interface GUI
{
  public void show();
  public void end();
  public void checkKeyPressed();
  public void checkKeyReleased();
}

public abstract class GUIgameover implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showGameover();
    showScore();
    showTitle();
    showButtons();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {

  }
  
  public void checkKeyReleased() {
  }
  
  abstract void removeLayout();
  abstract void showButtons();
  abstract void showGameover();
  abstract void showScore();
  abstract void showTitle();
  
}

public abstract class GUIgamewon implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showGameover();
    showScore();
    showTitle();
    showButtons();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {

  }
  
  public void checkKeyReleased() {
  }
  
  abstract void removeLayout();
  abstract void showButtons();
  abstract void showGameover();
  abstract void showScore();
  abstract void showTitle();
  
}

public abstract class GUIlogin implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showButtons();
    showHints();
    showTextfields();
    showTitle();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {
    
  }
  
  public void checkKeyReleased() {
    
  }
  
  abstract void removeLayout();
  abstract void showButtons();
  abstract void showHints();
  abstract void showTextfields();
  abstract void showTitle();
  
}

public abstract class GUImenu implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showTitle();
    showButtons();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {
    
  }
  
  public void checkKeyReleased() {
    
  }
  
  abstract void removeLayout();
  abstract void showButtons();
  abstract void showTitle();
  
}

public abstract class GUIplay implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    runGame();
  }
  
  public void end() {
    endGame();
  }
  
  public void checkKeyPressed() {
    playKeyPressed();
  }
  
  public void checkKeyReleased() {
    playKeyReleased();
  }
  
  abstract void playKeyPressed();
  abstract void playKeyReleased();
  abstract void runGame();
  abstract void endGame();
}

public abstract class GUIregister implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showButtons();
    showHints();
    showTextfields();
    showTitle();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {
    
  }
  
  public void checkKeyReleased() {
    
  }
  
  abstract void removeLayout();
  abstract void showButtons();
  abstract void showHints();
  abstract void showTextfields();
  abstract void showTitle();
  
}

public abstract class GUIstatistics implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  public void show() {
    showStatistics();
    showTitle();
    showButtons();
  }
  
  public void end() {
    removeLayout();
  }
  
  public void checkKeyPressed() {
    
  }
  
  public void checkKeyReleased() {
    
  }
  
  abstract void showButtons();
  abstract void removeLayout();
  abstract void showStatistics();
  abstract void showTitle();
  
}
