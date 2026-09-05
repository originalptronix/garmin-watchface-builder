import Toybox.Application;
import Toybox.Lang;

/**
 * SettingsLoader
 * Liest Connect IQ Properties (aus settings.xml/properties.xml)
 * und stellt sie der App als typisierte Werte bereit.
 * Wird von ThemeLoader und Komponenten genutzt.
 */
class SettingsLoader {

    // Theme-ID aus Connect IQ Properties lesen
    static function getActiveThemeId() as Number {
        var val = Application.Properties.getValue("activeThemeId");
        return (val instanceof Number) ? val : 0;
    }

    // Anzeige-Flags
    static function getShowHeartRate() as Boolean {
        var val = Application.Properties.getValue("showHeartRate");
        return (val instanceof Boolean) ? val : true;
    }

    static function getShowSteps() as Boolean {
        var val = Application.Properties.getValue("showSteps");
        return (val instanceof Boolean) ? val : true;
    }

    static function getShowBattery() as Boolean {
        var val = Application.Properties.getValue("showBattery");
        return (val instanceof Boolean) ? val : true;
    }

    static function getShowThemeLabel() as Boolean {
        var val = Application.Properties.getValue("showThemeLabel");
        return (val instanceof Boolean) ? val : true;
    }

    static function getUse24h() as Boolean {
        var val = Application.Properties.getValue("use24hFormat");
        return (val instanceof Boolean) ? val : true;
    }

    // Custom-Theme Farben
    static function getCustomBg() as Number {
        var val = Application.Properties.getValue("customBg");
        return (val instanceof Number) ? val : 0x000000;
    }

    static function getCustomPrimary() as Number {
        var val = Application.Properties.getValue("customPrimary");
        return (val instanceof Number) ? val : 0xFFFFFF;
    }

    static function getCustomAccent() as Number {
        var val = Application.Properties.getValue("customAccent");
        return (val instanceof Number) ? val : 0x00B4D8;
    }

}
