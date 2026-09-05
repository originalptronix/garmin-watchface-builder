# Garmin Watchface Builder

> Ein Framework zum Erstellen und Wechseln eigener Watchfaces fuer die **Garmin Epix Pro Gen 2** mit Monkey C / Connect IQ SDK.

[![CI](https://github.com/originalptronix/garmin-watchface-builder/actions/workflows/ci.yml/badge.svg)](https://github.com/originalptronix/garmin-watchface-builder/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Connect IQ SDK](https://img.shields.io/badge/Connect_IQ-SDK_7.x-blue)](https://developer.garmin.com/connect-iq/overview/)
![Garmin Device](https://img.shields.io/badge/Device-Epix_Pro_Gen_2-green)

---

## Ziel

Dieses Projekt stellt ein vollstaendiges Framework bereit, mit dem **mehrere unterschiedliche Watchface-Themes** erstellt, konfiguriert und per Tap oder Garmin Connect App gewechselt werden koennen.

---

## Themes

| ID | Name | Stil |
|----|------|------|
| 0 | Minimal Sport | Schwarz/Weiss, Cyan-Akzent, sportlich |
| 1 | Cartoon Retro | Gelb/Rot, fett, verspielt |
| 2 | Nuclear Terminal | Gruen monochrom, Scanlines, Terminal-Look |
| 3 | Neon City | Dunkel, Neon-Cyan, Nacht-Grid |
| 4 | Custom | Frei definierbar ueber Garmin Connect App |

**Theme wechseln:** Tap auf das obere Display-Drittel oder in der Garmin Connect App unter Einstellungen.

---

## Voraussetzungen

| Tool | Version | Link |
|------|---------|------|
| Connect IQ SDK | 7.x | [Download](https://developer.garmin.com/connect-iq/sdk/) |
| Visual Studio Code | beliebig | [Download](https://code.visualstudio.com/) |
| Monkey C Extension | aktuell | [Marketplace](https://marketplace.visualstudio.com/items?itemName=garmin.monkey-c) |
| Java JDK | 17+ | Fuer den Simulator benoetigt |

---

## Schnellstart

```bash
git clone https://github.com/originalptronix/garmin-watchface-builder.git
cd garmin-watchface-builder
code .
# Ctrl+Shift+P -> Monkey C: Build and Run -> epixpro2
```

---

## Projektstruktur

```
garmin-watchface-builder/
+-- src/
|   +-- WatchfaceApp.mc
|   +-- WatchfaceView.mc
|   +-- theme/
|   |   +-- ThemeLoader.mc        # Theme laden, wechseln, persistieren
|   |   +-- ThemeDefinition.mc    # Value-Object: Farben + Stile
|   |   +-- ThemeRenderer.mc      # Hintergrunddrawing
|   +-- components/
|   |   +-- TimeDisplay.mc
|   |   +-- DateDisplay.mc
|   |   +-- HeartRateDisplay.mc
|   |   +-- StepsDisplay.mc
|   |   +-- BatteryDisplay.mc
|   |   +-- WeatherDisplay.mc
|   +-- settings/
|       +-- SettingsLoader.mc     # Connect IQ Properties lesen
|       +-- ThemeSettingsDelegate.mc
+-- resources/
|   +-- settings/
|   |   +-- settings.xml          # Garmin Connect Einstellungsseite
|   |   +-- properties.xml        # Property-Defaults
|   +-- strings/strings.xml
|   +-- layouts/layout.xml
+-- themes/                       # JSON-Referenzdateien
+-- config/watchface.json
+-- .github/
|   +-- workflows/
|   |   +-- ci.yml                # Build + Lint bei jedem Push
|   |   +-- release.yml           # Release bei git tag
|   +-- SECRETS.md
+-- docs/
|   +-- SETUP.md
|   +-- CUSTOMIZATION.md
|   +-- THEMES.md
|   +-- CI_CD.md
+-- manifest.xml
+-- monkey.jungle
+-- LICENSE
```

---

## CI/CD

- **Push auf `main`**: Automatischer Build + Typecheck
- **`git tag v1.x.x`**: Automatischer Release mit `.prg` und `.iq` Datei

Details: [docs/CI_CD.md](docs/CI_CD.md)

---

## Eigenes Theme erstellen

Details: [docs/THEMES.md](docs/THEMES.md)

---

## Lizenz

MIT License
