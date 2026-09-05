# Garmin Watchface Builder

> Ein Tool zum Erstellen eigener Watchfaces für die **Garmin Epix Pro Gen 2** mit Monkey C / Connect IQ SDK.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Connect IQ SDK](https://img.shields.io/badge/Connect_IQ-SDK_7.x-blue)](https://developer.garmin.com/connect-iq/overview/)
![Garmin Device](https://img.shields.io/badge/Device-Epix_Pro_Gen_2-green)

---

## 🎯 Ziel

Dieses Projekt stellt ein Framework und Builder-Tool bereit, mit dem eigene Watchfaces für die Garmin Epix Pro Gen 2 erstellt, konfiguriert und auf die Uhr gespielt werden können. Unterstützt werden sowohl Anfänger (WYSIWYG-Konfiguration via JSON) als auch Fortgeschrittene (direktes Monkey C Coding).

---

## 🧠 Theme-System

Die Software unterstützt **mehrere Watchface-Stile** über ein Template-System statt fester urheberrechtlich problematischer Franchise-Vorlagen.

### Mitgelieferte Beispiel-Themes

| Theme-ID | Stilrichtung |
|----------|--------------|
| `cartoon-retro` | Bunt, verspielt, cartoonartig |
| `nuclear-terminal` | Monochromer Retro-HUD / Terminal-Look |
| `neon-city` | Dunkel, neonartig, urbaner HUD-Stil |
| `minimal-sport` | Sportlich und datenfokussiert |
| `custom` | Vollständig benutzerdefiniert |

Weitere Details: siehe `docs/THEMES.md`

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
├── src/
├── resources/
├── config/
├── themes/                       # Theme-Vorlagen als JSON
├── docs/
│   ├── SETUP.md
│   ├── CUSTOMIZATION.md
│   └── THEMES.md
├── manifest.xml
├── monkey.jungle
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

Installiere den Connect IQ SDK Manager und lade das SDK für die **Epix Pro Gen 2** herunter.

### 3. In VSCode öffnen

```bash
code .
```

### 4. Simulator starten

In VSCode: `Ctrl+Shift+P` → **Monkey C: Build and Run** → Gerät **epixpro2** wählen.
