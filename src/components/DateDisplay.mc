import Toybox.Graphics;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Lang;

/**
 * DateDisplay
 * Zeigt das Datum theme-abhaengig an.
 */
class DateDisplay {

    private const POS_X = 208;
    private const POS_Y = 298;

    private var _loader as ThemeLoader;
    private var _weekdays as Array<String> = ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"];

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    function draw(dc as Graphics.Dc) as Void {
        var today  = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var day    = _weekdays[today.day_of_week];
        var style  = _loader.getTheme().getTimeStyle();

        var dateStr;
        if (style == ThemeDefinition.STYLE_TERMINAL) {
            // Terminal: ISO-Datum
            dateStr = today.year.toString() + "-" + today.month.format("%02d") + "-" + today.day.format("%02d");
        } else {
            dateStr = day + ", " + today.day.format("%02d") + "." + today.month.format("%02d") + ".";
        }

        dc.setColor(_loader.getTheme().getMutedColor(), Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, Graphics.FONT_MEDIUM, dateStr, Graphics.TEXT_JUSTIFY_CENTER);
    }

}
