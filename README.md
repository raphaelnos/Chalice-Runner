# Chalice Runner

## Kurzbeschreibung
**Chalice Runner** ist ein düsterer 2D-Platformer-Prototyp in Godot. Der Spieler steuert einen Jäger durch eine kleine Dungeon-/Katakomben-Szene, sammelt ein Kelch-Relikt ein und muss vermeiden, aus dem Level zu fallen. Der aktuelle Prototyp bildet bewusst eine reduzierte, aber spielbare Iteration der ursprünglichen Spielidee ab.

Die ursprüngliche Idee war ein größerer 2D-Roguelike-Dungeon-Crawler mit Ritualdungeons, Opfergaben, Hunter Weapons, Feuerwaffen, Ausweichrolle, Relikten, Fallen und Bossgegnern. Für die Studienleistung wurde der Umfang reduziert, damit ein stabiler spielbarer Kern umgesetzt werden konnte.

## Aktueller Stand des Prototyps
Der aktuelle Godot-Prototyp enthält:

- eine spielbare 2D-Hauptszene
- eine steuerbare Spielerfigur
- eigene Pixelart-Spielerfigur mit einfacher Animation
- Bewegung nach links und rechts
- Sprungmechanik mit Gravitation
- Kamera, die dem Spieler folgt
- Boden-/Plattformstruktur
- ein sichtbares Kelch-Relikt als Sammelobjekt
- Score-Anzeige mit `Relikte: 0`
- Erhöhung des Scores beim Einsammeln des Relikts
- Killzone unterhalb des Levels
- automatischer Neustart der Szene beim Herunterfallen
- Git-Versionierung mit mehreren Commits
- Dokumentation über diese README

## Steuerung
- **Pfeil links / A:** nach links laufen
- **Pfeil rechts / D:** nach rechts laufen
- **Leertaste:** springen

## Spielziel
Der Spieler soll sich durch die kleine Levelszene bewegen, das Kelch-Relikt erreichen und einsammeln. Beim Einsammeln verschwindet das Relikt und die Score-Anzeige wird erhöht. Fällt der Spieler aus dem Level, berührt er die Killzone und die Szene wird neu gestartet.

## Technische Umsetzung
Das Projekt wurde mit **Godot 4** als 2D-Projekt umgesetzt.

Verwendete Godot-Nodes:

- `Node2D` als Root-Node der Hauptszene
- `CharacterBody2D` für den Spieler
- `AnimatedSprite2D` für die animierte Spielerfigur
- `CollisionShape2D` für Spieler-, Boden-, Relikt- und Killzone-Kollision
- `StaticBody2D` für den Boden
- `ColorRect` als sichtbare Bodenfläche
- `Camera2D` als Spieler-Kamera
- `CanvasLayer` und `Label` für die Score-Anzeige
- `Area2D` für Sammelobjekt und Killzone
- `Node` als GameManager für den Score

## Szenenstruktur
Die Hauptszene ist ungefähr wie folgt aufgebaut:


Main (Node2D)
├── Player (CharacterBody2D)
│   ├── AnimatedSprite2D
│   ├── CollisionShape2D
│   └── Camera2D
├── Ground (StaticBody2D)
│   ├── CollisionShape2D
│   └── ColorRect
├── UI (CanvasLayer)
│   └── ScoreLabel (Label)
├── GameManager (Node)
├── Relic (Area2D)
│   ├── Sprite2D
│   └── CollisionShape2D
└── Killzone (Area2D)
    └── CollisionShape2D


### Player Movement
Der Spieler wird über ein GDScript auf dem `CharacterBody2D` gesteuert. Das Skript verarbeitet horizontale Eingaben, Sprung, Gravitation und das Abspielen der passenden Animationen.

### Score-System
Der `GameManager` verwaltet den aktuellen Relikt-Score. Beim Start wird die Anzeige auf `Relikte: 0` gesetzt. Wenn das Relikt eingesammelt wird, ruft das Relikt-Skript die Funktion `add_score()` im GameManager auf.

### Relikt
Das Relikt ist als `Area2D` umgesetzt. Wenn der Spieler das Relikt berührt, wird der Score erhöht und das Relikt wird mit `queue_free()` aus der Szene entfernt.

### Killzone
Unterhalb des Levels befindet sich eine unsichtbare Killzone. Sobald der Spieler diese berührt, wird die aktuelle Szene mit `reload_current_scene()` neu geladen. Dadurch entsteht ein einfaches Game-Over-/Restart-System.

## Vereinfachungen gegenüber dem ursprünglichen Konzept
Folgende ursprünglich geplante Features wurden aus Zeitgründen nicht vollständig umgesetzt:

- prozedural generierte Dungeons
- mehrere Räume
- Ritualauswahl vor dem Run
- Opfergaben mit Risiko-Belohnungs-System
- Nahkampfangriffe
- Feuerwaffen
- Ausweichrolle
- Gegner-KI
- Bossgegner
- Inventarsystem
- permanente Roguelike-Progression
- Soundeffekte und Musik

Diese Elemente bleiben als Konzept und mögliche Erweiterungen erhalten. Der aktuelle Fokus liegt auf einem stabilen Grundprototyp mit Bewegung, Plattform, Sammelobjekt, Score und Neustart.

## Bezug zur ursprünglichen Spielidee
Der Prototyp verwendet zentrale Motive aus dem ursprünglichen Konzept:

- düstere Dungeon-/Katakomben-Atmosphäre
- Jäger als Spielfigur
- Kelch/Relikt als zentrales Sammelobjekt
- Run-basierte Struktur durch Neustart nach Fehlern
- reduzierte Umsetzung eines später größeren Dungeon-Crawler-Konzepts

Damit ist der Prototyp keine vollständige Umsetzung des gesamten Designs, sondern eine erste digitale Iteration des Spielkerns.

## Playtesting
Für einen kurzen internen Playtest wurden folgende Fragen betrachtet:

1. Ist die Spielfigur direkt steuerbar?
2. Funktioniert die Sprungmechanik zuverlässig?
3. Ist das Relikt als Ziel erkennbar?
4. Wird der Score beim Einsammeln korrekt erhöht?
5. Funktioniert der Neustart beim Herunterfallen?
6. Ist die Kamera verständlich positioniert?

### Beobachtungen
- Die Grundsteuerung funktioniert.
- Die Kamera folgt dem Spieler zuverlässig.
- Das Relikt ist als Sammelobjekt erkennbar.
- Die Score-Anzeige ist sichtbar und reagiert auf das Einsammeln.
- Die Killzone lädt die Szene korrekt neu.
- Das Level ist noch sehr kurz und sollte in einer späteren Iteration erweitert werden.

## Bekannte Einschränkungen
- Der Prototyp besitzt nur eine kleine Levelszene.
- Es gibt bisher nur ein Relikt.
- Es gibt noch keine Gegner-KI.
- Das Kampfsystem ist noch nicht umgesetzt.
- Es gibt noch keinen Bosskampf.
- Der visuelle Stil ist erst teilweise ausgearbeitet.
- Das Spiel ist eher ein technischer Prototyp als ein vollständiges Spiel.

## Nächste Entwicklungsschritte
Bei weiterer Bearbeitung wären folgende Schritte sinnvoll:

1. Level mit mehreren Plattformen erweitern
2. einfache Gegner oder Fallen ergänzen
3. mehrere Relikte platzieren
4. Soundeffekte für Sprung, Schaden und Sammeln einbauen
5. einfache Lebensanzeige ergänzen
6. Ritualauswahl vor dem Levelstart implementieren
7. Risiko-Belohnungs-System über Opfergaben umsetzen
8. Bossraum am Ende des Levels ergänzen
9. Export für Windows/Web erstellen
10. umfangreicheres Playtesting durchführen

## Quellen und Inspiration
- Eigene Spielidee aus Studienleistung 1: **Chalice Runner**
- Inspiration durch düstere Gothic-Horror-Dungeons,Bloodborne, Kelchrituale und actionorientiertes Roguelike-Gameplay
