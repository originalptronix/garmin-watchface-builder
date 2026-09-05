# Watchface Anpassen

## Farben ändern

Passe `config/watchface.json` an:

```json
"theme": {
  "backgroundColor": "0x000000",
  "primaryColor": "0xFFFFFF",
  "accentColor": "0xFF6B35"
}
```

Farb-Codes im Garmin Connect IQ Format: `0xRRGGBB`

## Komponenten aktivieren/deaktivieren

```json
"components": {
  "weather": { "enabled": true }
}
```

## Pulszone konfigurieren

Passe die Zonengrenzen an deine maximale Herzfrequenz an:

```json
"heartRate": {
  "zones": [115, 135, 155, 175]
}
```
Faustregel: ca. 57%, 66%, 76%, 86% deiner HFmax.

## Neue Komponente hinzufügen

1. Neue Datei `src/components/MeineKomponente.mc` anlegen
2. Klasse mit `draw(dc)` Methode implementieren
3. In `WatchfaceView.mc` instanziieren und in `onUpdate()` aufrufen
