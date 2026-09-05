import Toybox.Graphics;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Lang;

/**
 * DateDisplay
 * Zeigt das aktuelle Datum (Wochentag + Datum) an.
 */
class DateDisplay {

    private const COLOR_DATE = 0xAAAAAA; // Gedimmtes Grau
    private const POS_X = 208;
    private const POS_Y = 295;

    // Deutsche Wochentags-Abkürzungen
    private var _weekdays as Array<String> = [
        "So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"
    ];

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dayName = _weekdays[today.day_of_week];
        var dateString = dayName + ", " + today.day.format("%02d") + "." + today.month.format("%02d") + ".";

        dc.setColor(COLOR_DATE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            POS_X, POS_Y,
            Graphics.FONT_MEDIUM,
            dateString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

}
