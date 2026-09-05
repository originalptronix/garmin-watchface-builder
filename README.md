# Garmin Watchface Builder

> Ein Tool zum Erstellen eigener Watchfaces für die **Garmin Epix Pro Gen 2** mit Monkey C / Connect IQ SDK.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Connect IQ SDK](https://img.shields.io/badge/Connect_IQ-SDK_7.x-blue)](https://developer.garmin.com/connect-iq/overview/)
![Garmin Device](https://img.shields.io/badge/Device-Epix_Pro_Gen_2-green)

---

## 🎯 Ziel

Dieses Projekt stellt ein Framework und Builder-Tool bereit, mit dem eigene Watchfaces für die Garmin Epix Pro Gen 2 erstellt, konfiguriert und auf die Uhr gespielt werden können. Unterstützt werden sowohl Anfänger (WYSIWYG-Konfiguration via JSON) als auch Fortgeschrittene (direktes Monkey C Coding).

---

## 🛠 Voraussetzungen

| Tool | Version | Link |
|------|---------|------|
| Connect IQ SDK | 7.x | [Download](https://developer.garmin.com/connect-iq/sdk/) |
| Visual Studio Code | beliebig | [Download](https://code.visualstudio.com/) |
| Monkey C Extension (VSCode) | aktuell | [Marketplace](https://marketplace.visualstudio.com/items?itemName=garmin.monkey-c) |
| Java JDK | 11+ | Für den Simulator benötigt |

---

## 📁 Projektstruktur

```
garmin-watchface-builder/
├── src/                          # Monkey C Quellcode
│   ├── WatchfaceApp.mc           # App-Einstiegspunkt
│   ├── WatchfaceView.mc          # Haupt-View (Render-Logik)
│   ├── components/
│   │   ├── TimeDisplay.mc        # Uhrzeit-Komponente
│   │   ├── DateDisplay.mc        # Datum-Komponente
│   │   ├── HeartRateDisplay.mc   # Herzfrequenz-Komponente
│   │   ├── StepsDisplay.mc       # Schrittzähler-Komponente
│   │   ├── BatteryDisplay.mc     # Batterie-Komponente
│   │   └── WeatherDisplay.mc     # Wetter-Komponente
│   └── config/
│       └── Config.mc             # Konfigurationslogik
├── resources/
│   ├── layouts/
│   │   └── layout.xml            # XML Layout-Datei
│   ├── drawables/
│   │   └── drawables.xml
│   ├── fonts/
│   │   └── fonts.xml
│   └── strings/
│       └── strings.xml
├── config/
│   └── watchface.json            # Benutzer-Konfigurationsdatei (JSON)
├── docs/
│   ├── SETUP.md                  # Einrichtungsanleitung
│   ├── CUSTOMIZATION.md          # Anpassungsguide
│   └── API.md                    # Komponenten-API-Dokumentation
├── manifest.xml                  # Connect IQ Manifest
├── monkey.jungle                 # Build-Konfiguration
└── README.md
```

---

## 🚀 Schnellstart

### 1. Repository klonen

```bash
git clone https://github.com/originalptronix/garmin-watchface-builder.git
cd garmin-watchface-builder
```

### 2. Connect IQ SDK einrichten

Installiere den Connect IQ SDK Manager und lade das SDK für die **Epix Pro Gen 2** herunter:

```bash
# Im SDK Manager: Gerät "epixpro2" und SDK 7.x auswählen
```

### 3. In VSCode öffnen

```bash
code .
```

Die Monkey C Extension erkennt `monkey.jungle` automatisch.

### 4. Simulator starten

In VSCode: `Ctrl+Shift+P` → **Monkey C: Build and Run** → Gerät **epixpro2** wählen.

---

## ⚙️ Konfiguration via `config/watchface.json`

Das Watchface lässt sich über eine zentrale JSON-Datei anpassen, ohne Monkey C Code zu schreiben:

```json
{
  "layout": "sport",
  "theme": {
    "backgroundColor": "0x000000",
    "primaryColor": "0xFFFFFF",
    "accentColor": "0x00B4D8"
  },
  "components": {
    "time": { "enabled": true, "format": "HH:MM", "position": "center" },
    "date": { "enabled": true, "position": "top" },
    "heartRate": { "enabled": true, "position": "bottom-left" },
    "steps": { "enabled": true, "position": "bottom-right" },
    "battery": { "enabled": true, "showPercentage": true },
    "weather": { "enabled": false }
  },
  "dataFields": ["heartRate", "steps", "battery", "calories"]
}
```

### Verfügbare Layouts

| Layout | Beschreibung |
|--------|--------------|
| `sport` | Optimiert für Training – große Herzfrequenz & Schritte im Fokus |
| `minimal` | Nur Zeit & Datum, sehr clean |
| `dashboard` | Viele Datenfelder sichtbar |
| `analog` | Analoges Zifferblatt mit digitalen Zusatzinfos |

---

## 🧩 Komponenten-Übersicht

### TimeDisplay
Zeigt die aktuelle Uhrzeit an. Unterstützt 12h/24h-Format und verschiedene Schriftgrößen.

### HeartRateDisplay
Liest die aktuelle Herzfrequenz aus dem Sensor aus und zeigt sie mit optionaler Farbcodierung (Pulszonen) an.

### StepsDisplay
Zeigt den Tagesfortschritt der Schritte als Zahl oder Fortschrittsbalken.

### BatteryDisplay
Batteriestatus als Prozentzahl oder Icon.

### WeatherDisplay
Aktuelle Wetterdaten (Temperatur, Icon) über die Garmin Connect IQ Weather API.

---

## 📦 Build & Deploy

### Build

```bash
# Über die VSCode Monkey C Extension:
# Ctrl+Shift+P → "Monkey C: Build Current Project"
# Erzeugt: bin/WatchfaceBuilder.prg
```

### Auf die Uhr laden

```bash
# 1. Garmin Epix Pro Gen 2 per USB verbinden
# 2. .prg Datei nach GARMIN/APPS/ kopieren
# Oder: Über Garmin Express / Garmin Connect App sideloaden
```

---

## 🗺 Roadmap

- [x] Grundstruktur & Manifest
- [x] Zeit- und Datumsanzeige
- [x] Herzfrequenz-Komponente
- [x] Schrittzähler-Komponente
- [x] Batterie-Komponente
- [ ] Wetter-Komponente
- [ ] Analoges Layout
- [ ] Web-basierter visueller Editor (Drag & Drop)
- [ ] CI/CD Pipeline (GitHub Actions)
- [ ] Connect IQ Store Veröffentlichung

---

## 🤝 Beitragen

Pull Requests sind willkommen! Bitte lies zuerst [CONTRIBUTING.md](docs/SETUP.md).

---

## 📄 Lizenz

MIT License – siehe [LICENSE](LICENSE)
