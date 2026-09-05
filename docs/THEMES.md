# Theme-System: Architektur & Anleitung

## Architekturübersicht

```
ThemeLoader          ← Wählt und speichert das aktive Theme
    │
    ├── ThemeDefinition   ← Value-Object mit allen visuellen Parametern
    └── ThemeRenderer     ← Zeichnet Hintergrundstile auf den dc

WatchfaceView
    ├── ThemeLoader  (instanziiert, hält Referenz)
    ├── ThemeRenderer
    └── Komponenten (TimeDisplay, DateDisplay, ...)
            └── alle erhalten ThemeLoader-Referenz

ThemeSettingsDelegate
    └── ThemeLoader.cycleNextTheme()  auf Tap
```

---

## Verfügbare Themes

| ID | Name | Stil |
|----|------|------|
| 0 | Minimal Sport | Schwarz/Weiß, Cyan-Akzent, sportlich |
| 1 | Cartoon Retro | Gelb/Rot, fett, verspielt |
| 2 | Nuclear Terminal | Grün monochrom, Scanlines, Terminal-Look |
| 3 | Neon City | Dunkel, Neon-Cyan, Nacht-Grid |
| 4 | Custom | Frei definierbar via Application.Storage |

---

## Theme wechseln

### Auf der Uhr
- **Tap oben auf das Watchface** → nächstes Theme
- **Long-Press** → Garmin-Settings → Theme-ID manuell setzen

### Via Garmin Connect App
Settings → Watchface → Theme-ID (0-4) eingeben.

---

## Neues Theme erstellen

1. In `ThemeLoader.mc` eine neue `buildXxx()`-Funktion hinzufügen:

```monkey-c
private static function buildMyTheme() as ThemeDefinition {
    var t = new ThemeDefinition("My Theme");
    t.setBackground(0x0D0D0D);
    t.setPrimaryColor(0xFF6B35);
    t.setAccentColor(0xFFD700);
    t.setMutedColor(0x888888);
    t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_LARGE);
    t.setBackgroundStyle(ThemeDefinition.BG_SOLID);
    return t;
}
```

2. Funktion in `buildRegistry()` eintragen:

```monkey-c
private static function buildRegistry() as Array<ThemeDefinition> {
    return [
        ThemeLoader.buildMinimalSport(),
        ThemeLoader.buildCartoonRetro(),
        ThemeLoader.buildNuclearTerminal(),
        ThemeLoader.buildNeonCity(),
        ThemeLoader.buildCustom(),
        ThemeLoader.buildMyTheme()  // <-- neu
    ];
}
```

3. Build & Test im Simulator.

---

## Custom-Theme via Storage

```monkey-c
// Farben programmatisch setzen (z.B. aus Settings-Page)
Application.Storage.setValue("customBg",      0x1A0000);
Application.Storage.setValue("customPrimary",  0xFF4444);
Application.Storage.setValue("customAccent",   0xFFAA00);
Application.Storage.setValue("activeThemeId", 4); // Custom
```
