/**
 * ControlP5 Button
 * this example shows how to create buttons with controlP5.
 * 
 * find a list of public methods available for the Button Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 
import controlP5.*;

ControlP5 cp5;

int myColor = color(255);
int x;

int c1,c2;

float n,n1;


void setup() {
  size(400,600);
  noStroke();
  cp5 = new ControlP5(this);
  
  // create a new button with name 'blue'
  cp5.addButton("colorblue")
     .setValue(0)
     .setPosition(100,100)
     .setSize(200,19)
     ;
  
  // and add another 2 buttons
  cp5.addButton("grey")
     .setValue(100)
     .setPosition(100,120)
     .setSize(200,19)
     ;
     
  cp5.addButton("black")
     .setPosition(100,140)
     .setSize(200,19)
     .setValue(0)
     ;

  

}

void draw() {
  background(myColor);
  myColor = x;
   
}

public void controlEvent(ControlEvent theEvent) {
  print("Event: ");
  println(theEvent.getController().getName());
  
}

// function colorA will receive changes from 
// controller with name blue
public void colorblue(int theValue) {
  println("a button event from colorA: "+theValue);
  x = color(400);
}

// function colorB will receive changes from 
// controller with name grey
public void grey(int theValue) {
  println("a button event from colorB: "+theValue);
  x = color(150);
}

// function colorC will receive changes from 
// controller with name black
public void black(int theValue) {
  println("a button event from colorC: "+theValue);
  x = color(0);
}


/*
a list of all methods available for the Button Controller
use ControlP5.printPublicMethodsFor(Button.class);
to print the following list into the console.

You can find further details about class Button in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


controlP5.Button : Button activateBy(int) 
controlP5.Button : Button setOff() 
controlP5.Button : Button setOn() 
controlP5.Button : Button setSwitch(boolean) 
controlP5.Button : Button setValue(float) 
controlP5.Button : Button update() 
controlP5.Button : String getInfo() 
controlP5.Button : String toString() 
controlP5.Button : boolean getBooleanValue() 
controlP5.Button : boolean isOn() 
controlP5.Button : boolean isPressed() 
controlP5.Button : boolean isSwitch() 
controlP5.Controller : Button addCallback(CallbackListener) 
controlP5.Controller : Button addListener(ControlListener) 
controlP5.Controller : Button addListenerFor(int, CallbackListener) 
controlP5.Controller : Button align(int, int, int, int) 
controlP5.Controller : Button bringToFront() 
controlP5.Controller : Button bringToFront(ControllerInterface) 
controlP5.Controller : Button hide() 
controlP5.Controller : Button linebreak() 
controlP5.Controller : Button listen(boolean) 
controlP5.Controller : Button lock() 
controlP5.Controller : Button onChange(CallbackListener) 
controlP5.Controller : Button onClick(CallbackListener) 
controlP5.Controller : Button onDoublePress(CallbackListener) 
controlP5.Controller : Button onDrag(CallbackListener) 
controlP5.Controller : Button onDraw(ControllerView) 
controlP5.Controller : Button onEndDrag(CallbackListener) 
controlP5.Controller : Button onEnter(CallbackListener) 
controlP5.Controller : Button onLeave(CallbackListener) 
controlP5.Controller : Button onMove(CallbackListener) 
controlP5.Controller : Button onPress(CallbackListener) 
controlP5.Controller : Button onRelease(CallbackListener) 
controlP5.Controller : Button onReleaseOutside(CallbackListener) 
controlP5.Controller : Button onStartDrag(CallbackListener) 
controlP5.Controller : Button onWheel(CallbackListener) 
controlP5.Controller : Button plugTo(Object) 
controlP5.Controller : Button plugTo(Object, String) 
controlP5.Controller : Button plugTo(Object[]) 
controlP5.Controller : Button plugTo(Object[], String) 
controlP5.Controller : Button registerProperty(String) 
controlP5.Controller : Button registerProperty(String, String) 
controlP5.Controller : Button registerTooltip(String) 
controlP5.Controller : Button removeBehavior() 
controlP5.Controller : Button removeCallback() 
controlP5.Controller : Button removeCallback(CallbackListener) 
controlP5.Controller : Button removeListener(ControlListener) 
controlP5.Controller : Button removeListenerFor(int, CallbackListener) 
controlP5.Controller : Button removeListenersFor(int) 
controlP5.Controller : Button removeProperty(String) 
controlP5.Controller : Button removeProperty(String, String) 
controlP5.Controller : Button setArrayValue(float[]) 
controlP5.Controller : Button setArrayValue(int, float) 
controlP5.Controller : Button setBehavior(ControlBehavior) 
controlP5.Controller : Button setBroadcast(boolean) 
controlP5.Controller : Button setCaptionLabel(String) 
controlP5.Controller : Button setColor(CColor) 
controlP5.Controller : Button setColorActive(int) 
controlP5.Controller : Button setColorBackground(int) 
controlP5.Controller : Button setColorCaptionLabel(int) 
controlP5.Controller : Button setColorForeground(int) 
controlP5.Controller : Button setColorLabel(int) 
controlP5.Controller : Button setColorValue(int) 
controlP5.Controller : Button setColorValueLabel(int) 
controlP5.Controller : Button setDecimalPrecision(int) 
controlP5.Controller : Button setDefaultValue(float) 
controlP5.Controller : Button setHeight(int) 
controlP5.Controller : Button setId(int) 
controlP5.Controller : Button setImage(PImage) 
controlP5.Controller : Button setImage(PImage, int) 
controlP5.Controller : Button setImages(PImage, PImage, PImage) 
controlP5.Controller : Button setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Button setLabel(String) 
controlP5.Controller : Button setLabelVisible(boolean) 
controlP5.Controller : Button setLock(boolean) 
controlP5.Controller : Button setMax(float) 
controlP5.Controller : Button setMin(float) 
controlP5.Controller : Button setMouseOver(boolean) 
controlP5.Controller : Button setMoveable(boolean) 
controlP5.Controller : Button setPosition(float, float) 
controlP5.Controller : Button setPosition(float[]) 
controlP5.Controller : Button setSize(PImage) 
controlP5.Controller : Button setSize(int, int) 
controlP5.Controller : Button setStringValue(String) 
controlP5.Controller : Button setUpdate(boolean) 
controlP5.Controller : Button setValue(float) 
controlP5.Controller : Button setValueLabel(String) 
controlP5.Controller : Button setValueSelf(float) 
controlP5.Controller : Button setView(ControllerView) 
controlP5.Controller : Button setVisible(boolean) 
controlP5.Controller : Button setWidth(int) 
controlP5.Controller : Button show() 
controlP5.Controller : Button unlock() 
controlP5.Controller : Button unplugFrom(Object) 
controlP5.Controller : Button unplugFrom(Object[]) 
controlP5.Controller : Button unregisterTooltip() 
controlP5.Controller : Button update() 
controlP5.Controller : Button updateSize() 
controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : ControllerView getView() 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : Pointer getPointer() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getAbsolutePosition() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : float[] getPosition() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:20:49

*/
