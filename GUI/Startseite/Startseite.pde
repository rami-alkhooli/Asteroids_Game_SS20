// ControlP5 Example 1 : Basic UI elements
 
import controlP5.*;
ControlP5 controlP5;
controlP5.Button Button1;
controlP5.Button Button2;
controlP5.Button Button3;
controlP5.Button Button4;

Textlabel AsteroidsText;
 

void setup() {
 size(1500 ,1000);
 
 controlP5 = new ControlP5(this);
 
 // description : a button executes after release
 // parameters : name, value (float), x, y, width, height
 
 AsteroidsText = controlP5.addTextlabel("AsteroidsGame")
                           .setText("Asteroids Game")
                           .setPosition(250, 10)
                           .setColorValue(255)
                           .setFont(createFont("Georgia",50));
                           
 
 Button1 = controlP5.addButton("Button1")
   .setValue(100)
   .setPosition(0,100)
   .setSize(200,100)
   .setId(1);
   
 Button2 = controlP5.addButton("Button2")
   .setValue(100)
   .setPosition(250,100)
   .setSize(200,100)
   .setId(2);
   
 Button3 = controlP5.addButton("Button3")
   .setValue(100)
   .setPosition(500,100)
   .setSize(200,100)
   .setId(3);
   
 controlP5.addTextfield("n3")
   .setPosition(10, 500)
   .setSize(400, 100)
   .setId(4);
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
 
 print("control event from : "+theEvent.getController().getId());
 println(", value : "+theEvent.getController().getValue());
 
 switch(theEvent.getController().getId()) {
    case(1):
    Button2.hide();
    Button3.show();
    AsteroidsText.hide();
    break;
    case(2):
    Button3.hide();
    Button1.show();
    break;
    case(3):
    Button1.hide();
    Button2.show();
    AsteroidsText.show();
    break;
    case(4):
    String textinput = theEvent.getController().getStringValue();
    println(textinput);
    break;
 } 
}
}
