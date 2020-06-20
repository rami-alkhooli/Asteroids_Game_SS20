public interface GUI
{
  /**
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show();
  
  /**
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end();
  
  /**
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed();
  
  /**
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyReleased();
}

public abstract class GUIgameover implements GUI
{
  protected int sWidth;
  protected int sHeight;
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showGameover();
    showScore();
    showTitle();
    showButtons();
    makeTimer();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {

  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyReleased() {
  }
  
  abstract void makeTimer();
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showGameover();
    showScore();
    showTitle();
    showButtons();
    makeTimer();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {

  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyReleased() {
  }
  
  abstract void makeTimer();
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showButtons();
    showHints();
    showTextfields();
    showTitle();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {
    
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showTitle();
    showButtons();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {
    
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    runGame();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    endGame();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {
    playKeyPressed();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showButtons();
    showHints();
    showTextfields();
    showTitle();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {
    
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
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
  
  /**
  * overwritten (from the interface GUI)
  * This method will be called in every frame as long the gui is running.
  * It draws the components of each gui page.
  **/
  public void show() {
    showStatistics();
    showTitle();
    showButtons();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method is called when the gui page will change.
  * It deletes the components of the old page and the layout.
  **/
  public void end() {
    removeLayout();
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyPressed() {
    
  }
  
  /**
  * overwritten (from the interface GUI)
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing)
  **/
  public void checkKeyReleased() {
    
  }
  
  abstract void showButtons();
  abstract void removeLayout();
  abstract void showStatistics();
  abstract void showTitle();
  
}
