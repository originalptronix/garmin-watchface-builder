import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;

/**
 * ThemeLoader
 * Zentrale Klasse zum Laden und Bereitstellen von Theme-Definitionen.
 * Themes werden als Application-Properties gespeichert und geladen.
 *
 * Verfügbare Theme-IDs:
 *   0 = minimal-sport      (Standard)
 *   1 = cartoon-retro
 *   2 = nuclear-terminal
 *   3 = neon-city
 *   4 = custom
 */
class ThemeLoader {

    // Theme-Index der aktuell aktiven Definition
    private var _activeThemeId as Number;
    private var _theme as ThemeDefinition;

    // Statische Registry aller verfügbaren Themes
    private static var _themeRegistry as Array<ThemeDefinition>;

    function initialize() {
        _themeRegistry = ThemeLoader.buildRegistry();

        // Gespeichertes Theme aus den App-Properties laden (bleibt nach Neustart)
        var saved = Application.Storage.getValue("activeThemeId");
        _activeThemeId = (saved != null) ? saved : 0;
        _theme = _themeRegistry[_activeThemeId];
    }

    // Aktuell aktives Theme-Objekt zurückgeben
    function getTheme() as ThemeDefinition {
        return _theme;
    }

    // Theme wechseln und persistent speichern
    function setTheme(themeId as Number) as Void {
        if (themeId < 0 || themeId >= _themeRegistry.size()) {
            return; // Ungültige ID ignorieren
        }
        _activeThemeId = themeId;
        _theme = _themeRegistry[themeId];
        Application.Storage.setValue("activeThemeId", themeId);
    }

    // Zum nächsten Theme rotieren (für Tap-to-Switch)
    function cycleNextTheme() as Void {
        var next = (_activeThemeId + 1) % _themeRegistry.size();
        setTheme(next);
    }

    // Anzahl verfügbarer Themes
    function getThemeCount() as Number {
        return _themeRegistry.size();
    }

    // ID des aktiven Themes
    function getActiveThemeId() as Number {
        return _activeThemeId;
    }

    // Name des aktiven Themes (für Settings-Anzeige)
    function getActiveThemeName() as String {
        return _theme.getName();
    }

    // -------------------------------------------------------
    // Registry: Alle Theme-Definitionen registrieren
    // -------------------------------------------------------
    private static function buildRegistry() as Array<ThemeDefinition> {
        return [
            ThemeLoader.buildMinimalSport(),
            ThemeLoader.buildCartoonRetro(),
            ThemeLoader.buildNuclearTerminal(),
            ThemeLoader.buildNeonCity(),
            ThemeLoader.buildCustom()
        ];
    }

    // --- Theme-Definitionen ---

    private static function buildMinimalSport() as ThemeDefinition {
        var t = new ThemeDefinition("Minimal Sport");
        t.setBackground(Graphics.COLOR_BLACK);
        t.setPrimaryColor(Graphics.COLOR_WHITE);
        t.setAccentColor(0x00B4D8);   // Cyan
        t.setMutedColor(0xAAAAAA);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_LARGE);
        t.setBackgroundStyle(ThemeDefinition.BG_SOLID);
        return t;
    }

    private static function buildCartoonRetro() as ThemeDefinition {
        var t = new ThemeDefinition("Cartoon Retro");
        t.setBackground(0xFFD54F);     // Gelb
        t.setPrimaryColor(0x1A1A1A);  // Fast schwarz
        t.setAccentColor(0xE53935);   // Kräftiges Rot
        t.setMutedColor(0x5D4037);    // Braun
        t.setTimeStyle(ThemeDefinition.STYLE_BOLD_ROUNDED);
        t.setBackgroundStyle(ThemeDefinition.BG_FLAT_CARTOON);
        return t;
    }

    private static function buildNuclearTerminal() as ThemeDefinition {
        var t = new ThemeDefinition("Nuclear Terminal");
        t.setBackground(Graphics.COLOR_BLACK);
        t.setPrimaryColor(0x7CFF7C);  // Terminal-Grün
        t.setAccentColor(0x3CB043);
        t.setMutedColor(0x4E9A51);
        t.setTimeStyle(ThemeDefinition.STYLE_TERMINAL);
        t.setBackgroundStyle(ThemeDefinition.BG_SCANLINE);
        return t;
    }

    private static function buildNeonCity() as ThemeDefinition {
        var t = new ThemeDefinition("Neon City");
        t.setBackground(0x05070D);    // Fast schwarz
        t.setPrimaryColor(0xF5F7FF);
        t.setAccentColor(0x00E5FF);   // Neon Cyan
        t.setMutedColor(0x7B8AA0);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_WIDE);
        t.setBackgroundStyle(ThemeDefinition.BG_GRID_NIGHT);
        return t;
    }

    private static function buildCustom() as ThemeDefinition {
        var t = new ThemeDefinition("Custom");
        // Custom-Werte aus Application.Storage laden
        var bg  = Application.Storage.getValue("customBg");
        var pri = Application.Storage.getValue("customPrimary");
        var acc = Application.Storage.getValue("customAccent");
        t.setBackground(bg  != null ? bg  : Graphics.COLOR_BLACK);
        t.setPrimaryColor(pri != null ? pri : Graphics.COLOR_WHITE);
        t.setAccentColor(acc != null ? acc : 0xFF8C00); // Orange als Default
        t.setMutedColor(0x888888);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_LARGE);
        t.setBackgroundStyle(ThemeDefinition.BG_SOLID);
        return t;
    }

}
