# Beispiel-Programm für Singleton Pattern

## Konzept
Das Problem bei Processing ist, dass die Klassen, die in den Reitern definiert werden, eine innere Klasse von PApplet sind.
Das führt dazu, dass innerhalb nicht-statischer Klassen keine statischen Attribute oder Methoden deklariert werden dürfen.
Die Lösung ist daher, eine Java-Datei anzulegen und die Processing-Klasse PApplet zu importieren wie folgt:
```
ìmport processing.core.*;
```
und dann ein privates statisches Objekt der Klasse PApplet zu definieren:
```
private static PApplet app;
```
Dieses Objekt kann die bekannten Funktionen von Processing wie `print(String)` oder `rect(int,int,int,int)` aufrufen. Daher ist es wichtig, das erstellte und vorhandene Objekt der Klasse PApplet (nämlich `this`) der Pseudo-Constructor-Methode `getTyper(PApplet,int)` zu übergeben
Das bedeutet, man muss die Processing-Funktionen innerhalb der Singleton-Klasse wie folgt aufrufen:
```
app.print("Hello\n");
app.fill(255,0,0);
app.rect(0,0,100,100);
app.noFill();
```
Das Ermitteln der Fensterbreite sowie -höhe erfolgt ebenso über das Objekt `app`:
```
// Draw a circle in the middle of the window with a diameter of 200 px
app.circle(app.width/2,app.height/2,200);
```
## Quelle
[Link zum Tutorial](https://forum.processing.org/two/discussion/18060/singleton-pattern-with-my-project)
