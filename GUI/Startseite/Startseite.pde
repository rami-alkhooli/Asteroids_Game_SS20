// ControlP5 Example 1 : Basic UI elements
 
import controlP5.*;
ControlP5 controlP5;
controlP5.Button Button1;
controlP5.Button Button2;
controlP5.Button Button3;

void setup() {
 size(2000 ,1500);
 
 controlP5 = new ControlP5(this);
 
 // description : a button executes after release
 // parameters : name, value (float), x, y, width, height
 Button1 = controlP5.addButton("Button1",1,0,10,500,200);
 Button2 = controlP5.addButton("Button2",1,600,10,500,200);
 Button3 = controlP5.addButton("Button3",1,1200,10,500,200);
}
 
void draw() { 
 background(0); // background black
}



void controlEvent(ControlEvent theEvent) {
 /* events triggered by controllers are automatically forwarded to 
 the controlEvent method. by checking the name of a controller one can 
 distinguish which of the controllers has been changed.
 */ 
 
 /* check if the event is from a controller otherwise you'll get an error
 when clicking other interface elements like Radiobutton that don't support
 the controller() methods
 */
 
 if(theEvent.isController()) { 
 
 print("control event from : "+theEvent.getController().getName());
 println(", value : "+theEvent.getController().getValue());
 
 if(theEvent.getController().getName()=="Button3") {
   Button1.hide();
   Button2.show();
 }
 
 if(theEvent.getController().getName()=="Button2") {
   Button3.hide();
   Button1.show();
 }
 
 if(theEvent.getController().getName()=="Button1") {
   Button2.hide();
   Button3.show();
 }
 
 } 
}
