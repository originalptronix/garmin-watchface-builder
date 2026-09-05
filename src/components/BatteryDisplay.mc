import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;

/**
 * BatteryDisplay
 * Zeigt den Akkustand in Prozent an.
 * Farbcodierung: Grün > 50%, Gelb > 20%, Rot <= 20%
 */
class BatteryDisplay {

    // Position: oben rechts
    private const POS_X = 370;
    private const POS_Y = 20;

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        var stats = System.getSystemStats();
        var battery = stats.battery.toNumber();
        var batteryString = battery.toString() + "%";

        var color;
        if (battery > 50) {
            color = 0x4CAF50; // Grün
        } else if (battery > 20) {
            color = 0xFFC107; // Gelb
        } else {
            color = 0xF44336; // Rot (kritisch)
        }

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, Graphics.FONT_XTINY, batteryString, Graphics.TEXT_JUSTIFY_RIGHT);
    }

}
