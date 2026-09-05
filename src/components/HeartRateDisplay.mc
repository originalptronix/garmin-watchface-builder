import Toybox.Graphics;
import Toybox.Activity;
import Toybox.Lang;

/**
 * HeartRateDisplay
 * Zeigt die aktuelle Herzfrequenz an.
 * Farbcodierung nach Pulszonen (optional konfigurierbar).
 */
class HeartRateDisplay {

    // Position: unten links
    private const POS_X = 80;
    private const POS_Y = 340;

    // Pulszonen-Farben
    private const ZONE_COLORS = [
        0x4CAF50, // Zone 1: Grün  (< 115)
        0x8BC34A, // Zone 2: Hellgrün (115-135)
        0xFFC107, // Zone 3: Gelb  (135-155)
        0xFF9800, // Zone 4: Orange (155-175)
        0xF44336  // Zone 5: Rot   (> 175)
    ];

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        var activityInfo = Activity.getActivityInfo();
        var hrValue = "--";
        var color = 0xAAAAAA;

        if (activityInfo != null && activityInfo.currentHeartRate != null) {
            var hr = activityInfo.currentHeartRate;
            hrValue = hr.toString();
            color = getZoneColor(hr);
        }

        // Herzfrequenz-Icon (♥)
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X - 18, POS_Y, Graphics.FONT_SMALL, "♥", Graphics.TEXT_JUSTIFY_CENTER);

        // Wert
        dc.drawText(POS_X + 10, POS_Y, Graphics.FONT_MEDIUM, hrValue, Graphics.TEXT_JUSTIFY_LEFT);
    }

    private function getZoneColor(hr as Number) as Number {
        if (hr < 115) { return ZONE_COLORS[0]; }
        if (hr < 135) { return ZONE_COLORS[1]; }
        if (hr < 155) { return ZONE_COLORS[2]; }
        if (hr < 175) { return ZONE_COLORS[3]; }
        return ZONE_COLORS[4];
    }

}
