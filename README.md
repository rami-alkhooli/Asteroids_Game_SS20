﻿# Asteroids Game

## Version
0.6

## Stand
04.05.2020

## Komponenten

### GUI
- [ ] verschiedene Seiten realisiern
- [x] Buttons, Eingabefelder etc. platzieren
- [x] Dummy: eine funktion im Zustand "spielen" aufrufen, die etwas zeichnet
- [x] Überlegen, wie man das Spiel sauber startet und die Komplexität des Engine verstecket > Stichwort: Facade Pattern

### Engine
- [x] SpaceShip bewegen und rotieren fehlerfrei und mit Hilfe von State Pattern
- [x] Shield realisiern auch mit State Pattern
- [x] Thrust anzeigen im Zustand "AcceleratingForwards"
- [x] Laser-Waffe mit Möglichkeit zum Abfeuern implementieren
- [x] Asteroiden automatisch generieren und bewegen
- [ ] Kollisionen erkennen (Laser mit Asteroiden - Raumschiff mit Asteroiden - Raumschiff mit Items - Raumschiff mit Raumstation)
- [ ] Explosion nach Kollision mit Asteroiden generieren
- [ ] Items nach Explosion von Asteroiden generieren
- [x] Töne beim Fliegen und Abfeuern abspielen
- [x] Überwachung der Position von Raumschiff und Asteroiden und eine Schleife am Spielfeldrand einsetzen
- [x] Erstellung der SpaceStation

### Datenbank
- [x] erstellen
- [x] Datensätze machen
- [x] lokal ansprechen
- [x] von der Ferne ansprechen
- [ ] Daten austauschen
- [ ] Eine Klasse, die alle Objekete zur Laufzeit aufzeichnet und den Status der Objekte hat, ob sie vorhanden oder zerstört sind > Stichwort: Strategy Pattern > am besten in der Klasse Game, weil wir dort alle Objekte haben

## Anmerkungen
- Für die Verwendung von Buttons der Klasse ControlP5 muss man die Bibliothek **ControlP5** zum Processing-Framework hinzufügen und mit "import" einbinden
- Für die Erstellung und Anbindung von Datenbanken muss man die Bibliothek **BezierSQLib** zum Processing-Framework hinzufügen und mit "import" einbinden
- Damit der Ton funktioniert, muss man die Bilbliothek **Sound** zum Processing-Framework hinzufügen und mit import "einbinden"
