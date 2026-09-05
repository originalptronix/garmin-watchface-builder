import Toybox.Graphics;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Lang;

/**
 * TimeDisplay
 * Zeigt die aktuelle Uhrzeit mittig auf dem Display an.
 * Epix Pro Gen 2: 416x416px AMOLED
 */
class TimeDisplay {

    // Farben
    private const COLOR_TIME    = Graphics.COLOR_WHITE;
    private const COLOR_COLON   = 0x00B4D8; // Akzentfarbe (Cyan)

    // Position: horizontale Mitte, leicht über der Mitte
    private const POS_X = 208;
    private const POS_Y = 190;

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        var clockTime = System.getClockTime();
        var hours   = clockTime.hour;
        var minutes = clockTime.min;

        // 24h Formatierung mit führender Null
        var timeString = hours.format("%02d") + ":" + minutes.format("%02d");

        dc.setColor(COLOR_TIME, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            POS_X, POS_Y,
            Graphics.FONT_NUMBER_THAI_HOT,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

}
