import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;

/**
 * ThemeLoader
 * Laedt das aktive Theme aus Connect IQ Properties (settings.xml)
 * oder aus Application.Storage (Tap-Wechsel auf der Uhr).
 * Properties haben Vorrang (Garmin Connect App Setting).
 *
 * Theme-IDs:
 *   0 = Minimal Sport
 *   1 = Cartoon Retro
 *   2 = Nuclear Terminal
 *   3 = Neon City
 *   4 = Custom
 */
class ThemeLoader {

    private var _activeThemeId as Number;
    private var _theme         as ThemeDefinition;
    private var _registry      as Array<ThemeDefinition>;

    function initialize() {
        _registry = buildRegistry();

        // Properties (Garmin Connect) haben Vorrang vor lokalem Storage
        var propId = SettingsLoader.getActiveThemeId();
        _activeThemeId = propId;
        _theme = _registry[_activeThemeId];
    }

    function getTheme() as ThemeDefinition {
        return _theme;
    }

    function setTheme(themeId as Number) as Void {
        if (themeId < 0 || themeId >= _registry.size()) { return; }
        _activeThemeId = themeId;
        _theme = _registry[themeId];
        // In Storage persistieren (fuer Tap-Wechsel)
        Application.Storage.setValue("activeThemeId", themeId);
    }

    function cycleNextTheme() as Void {
        setTheme((_activeThemeId + 1) % _registry.size());
    }

    function getThemeCount()    as Number { return _registry.size(); }
    function getActiveThemeId() as Number { return _activeThemeId; }
    function getActiveThemeName() as String { return _theme.getName(); }

    // Neuaufbau wenn Settings sich aendern (onSettingsChanged)
    function reloadFromProperties() as Void {
        _registry = buildRegistry(); // Custom-Farben neu lesen
        var propId = SettingsLoader.getActiveThemeId();
        _activeThemeId = propId;
        _theme = _registry[propId];
    }

    // -------------------------------------------------------
    private function buildRegistry() as Array<ThemeDefinition> {
        return [
            buildMinimalSport(),
            buildCartoonRetro(),
            buildNuclearTerminal(),
            buildNeonCity(),
            buildCustom()
        ];
    }

    private function buildMinimalSport() as ThemeDefinition {
        var t = new ThemeDefinition("Minimal Sport");
        t.setBackground(Graphics.COLOR_BLACK);
        t.setPrimaryColor(Graphics.COLOR_WHITE);
        t.setAccentColor(0x00B4D8);
        t.setMutedColor(0xAAAAAA);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_LARGE);
        t.setBackgroundStyle(ThemeDefinition.BG_SOLID);
        return t;
    }

    private function buildCartoonRetro() as ThemeDefinition {
        var t = new ThemeDefinition("Cartoon Retro");
        t.setBackground(0xFFD54F);
        t.setPrimaryColor(0x1A1A1A);
        t.setAccentColor(0xE53935);
        t.setMutedColor(0x5D4037);
        t.setTimeStyle(ThemeDefinition.STYLE_BOLD_ROUNDED);
        t.setBackgroundStyle(ThemeDefinition.BG_FLAT_CARTOON);
        return t;
    }

    private function buildNuclearTerminal() as ThemeDefinition {
        var t = new ThemeDefinition("Nuclear Terminal");
        t.setBackground(Graphics.COLOR_BLACK);
        t.setPrimaryColor(0x7CFF7C);
        t.setAccentColor(0x3CB043);
        t.setMutedColor(0x4E9A51);
        t.setTimeStyle(ThemeDefinition.STYLE_TERMINAL);
        t.setBackgroundStyle(ThemeDefinition.BG_SCANLINE);
        return t;
    }

    private function buildNeonCity() as ThemeDefinition {
        var t = new ThemeDefinition("Neon City");
        t.setBackground(0x05070D);
        t.setPrimaryColor(0xF5F7FF);
        t.setAccentColor(0x00E5FF);
        t.setMutedColor(0x7B8AA0);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_WIDE);
        t.setBackgroundStyle(ThemeDefinition.BG_GRID_NIGHT);
        return t;
    }

    private function buildCustom() as ThemeDefinition {
        var t = new ThemeDefinition("Custom");
        // Farben direkt aus Connect IQ Properties lesen
        t.setBackground(SettingsLoader.getCustomBg());
        t.setPrimaryColor(SettingsLoader.getCustomPrimary());
        t.setAccentColor(SettingsLoader.getCustomAccent());
        t.setMutedColor(0x888888);
        t.setTimeStyle(ThemeDefinition.STYLE_DIGITAL_LARGE);
        t.setBackgroundStyle(ThemeDefinition.BG_SOLID);
        return t;
    }

}
