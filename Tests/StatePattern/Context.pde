class Context
{
  private State objState;
  
  public Context()
  {
    objState = null;
  }
  public void setState (State newState)
  {
    this.objState = newState;
  }
  
  public void show()
  {
    objState.show();
  }
}
