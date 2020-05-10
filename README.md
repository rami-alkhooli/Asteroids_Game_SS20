# Asteroids Game

## Version
0.11

## Stand
10.05.2020

## Komponenten

### GUI
- [ ] verschiedene Seiten realisiern > Stichwort: Strategy Pattern
- [x] Buttons, Eingabefelder etc. platzieren
- [x] Dummy: eine funktion im Zustand "spielen" aufrufen, die etwas zeichnet
- [x] Überlegen, wie man das Spiel sauber startet und die Komplexität des Engine verstecket > Stichwort: Facade Pattern

### Engine ![Github Shield](https://img.shields.io/static/v1?label=Version&message=1.1&color=informational)
- [x] SpaceShip bewegen und rotieren fehlerfrei und mit Hilfe von State Pattern
- [x] Shield realisiern auch mit State Pattern
- [x] Thrust anzeigen im Zustand "AcceleratingForwards"
- [x] Laser-Waffe mit Möglichkeit zum Abfeuern implementieren
- [x] Asteroiden automatisch generieren und bewegen
- [x] Kollisionen erkennen (Laser mit Asteroiden)
- [x] Kollisionen erkennen (Raumschiff mit Asteroiden)
- [x] Kollisionen erkennen (Raumschiff mit Raumstation)
- [x] Abladen der gesammelten Items nach Kollision mit Raumstation
- [x] Explosion nach Kollision mit Asteroiden generieren
- [x] Kollisionen erkennen (Raumschiff mit Items)
- [x] Items nach Explosion von Asteroiden generieren
- [x] Töne beim Fliegen und Abfeuern abspielen
- [x] Überwachung der Position von Raumschiff und Asteroiden und eine Schleife am Spielfeldrand einsetzen
- [x] Erstellung der SpaceStation
- [x] Level-Design mit 5 Levels implementieren
- [x] Automatische Anpassung der Größen an die Fenstergröße
- [ ] Automatische Anpassung der Beschleunigung und Rotation an die Fenstergröße

### Datenbank
- [x] erstellen
- [x] Datensätze machen
- [x] lokal ansprechen
- [x] von der Ferne ansprechen (über IPv6)
- [ ] Beispiel-Programm zum Auslesen und Einschreiben in die Datenbank
- [ ] Daten austauschen
- [ ] Eine Klasse, die alle Objekete zur Laufzeit aufzeichnet und den Status der Objekte hat, ob sie vorhanden oder zerstört sind > Stichwort: Strategy Pattern > am besten in der Klasse Game, weil wir dort alle Objekte haben

## Anmerkungen
- Für die Verwendung von Buttons der Klasse ControlP5 muss man die Bibliothek **ControlP5** zum Processing-Framework hinzufügen und mit "import" einbinden
- Für die Erstellung und Anbindung von Datenbanken muss man die Bibliothek **BezierSQLib** zum Processing-Framework hinzufügen und mit "import" einbinden
- Damit der Ton funktioniert, muss man die Bilbliothek **Sound** zum Processing-Framework hinzufügen und mit import "einbinden"
