# Einrichtungsanleitung

## 1. Connect IQ SDK installieren

1. Öffne [developer.garmin.com/connect-iq/sdk/](https://developer.garmin.com/connect-iq/sdk/)
2. Lade den **SDK Manager** herunter
3. Starte den SDK Manager und installiere:
   - SDK Version **7.x**
   - Gerät: **epixpro2** (und optional epixpro2size47, epixpro2size51)

## 2. VSCode Monkey C Extension

```
Erweiterungen → Suche nach "Monkey C" → Installieren
Herausgeber: Garmin
```

## 3. Repository klonen & öffnen

```bash
git clone https://github.com/originalptronix/garmin-watchface-builder.git
code garmin-watchface-builder
```

## 4. Ersten Build starten

- `Ctrl+Shift+P` → **Monkey C: Build and Run**
- Gerät **epixpro2** auswählen
- Simulator öffnet sich automatisch

## 5. Auf die Uhr laden

- Epix Pro Gen 2 per USB-C verbinden
- Build erzeugt `bin/WatchfaceBuilder.prg`
- Datei nach `GARMIN/APPS/` auf der Uhr kopieren
- Über Garmin Connect App als Watchface auswählen
