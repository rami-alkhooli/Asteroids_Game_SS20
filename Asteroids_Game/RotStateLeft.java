package engine;

import processing.core.*;

public class RotStateLeft implements RotationState
{
  public float rotate(float angleRot) {
    if(angleRot>-ROTATING_LIMIT) {angleRot = angleRot - ROTATING_STEP;}
    return angleRot;
  }
}
