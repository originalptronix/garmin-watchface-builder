import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;

/**
 * TimeDisplay
 * Rendert die Uhrzeit basierend auf dem aktiven Theme.
 * Zeitstil (Font, Farbe) wird vom ThemeLoader abgefragt.
 */
class TimeDisplay {

    private const POS_X = 208;
    private const POS_Y = 185;

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    function draw(dc as Graphics.Dc) as Void {
        var clockTime  = System.getClockTime();
        var timeString = clockTime.hour.format("%02d") + ":" + clockTime.min.format("%02d");

        var theme = _loader.getTheme();
        var font  = getFont(theme.getTimeStyle());

        // Nuclear Terminal: Blinking-Colon Effekt (Sekunden gerade = Doppelpunkt sichtbar)
        if (theme.getTimeStyle() == ThemeDefinition.STYLE_TERMINAL) {
            var colon = (clockTime.sec % 2 == 0) ? ":" : " ";
            timeString = clockTime.hour.format("%02d") + colon + clockTime.min.format("%02d");
        }

        dc.setColor(theme.getPrimaryColor(), Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, font, timeString, Graphics.TEXT_JUSTIFY_CENTER);

        // Neon City: Glow-Effekt durch doppeltes Zeichnen mit Offset
        if (theme.getTimeStyle() == ThemeDefinition.STYLE_DIGITAL_WIDE) {
            dc.setColor(theme.getAccentColor(), Graphics.COLOR_TRANSPARENT);
            dc.drawText(POS_X + 1, POS_Y + 1, Graphics.FONT_XTINY, timeString, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function getFont(style as Number) as Graphics.FontType {
        if (style == ThemeDefinition.STYLE_TERMINAL) {
            return Graphics.FONT_NUMBER_MILD;
        } else if (style == ThemeDefinition.STYLE_BOLD_ROUNDED) {
            return Graphics.FONT_NUMBER_THAI_HOT;
        } else if (style == ThemeDefinition.STYLE_DIGITAL_WIDE) {
            return Graphics.FONT_NUMBER_HOT;
        }
        return Graphics.FONT_NUMBER_THAI_HOT;
    }

}
