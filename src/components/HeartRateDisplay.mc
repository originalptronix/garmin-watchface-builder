import Toybox.Graphics;
import Toybox.Activity;
import Toybox.Lang;

/**
 * HeartRateDisplay
 * Herzfrequenz mit theme-abhaengiger Farbgebung.
 * Pulszonen-Farben bleiben erhalten, werden aber am Theme gespiegelt.
 */
class HeartRateDisplay {

    private const POS_X = 80;
    private const POS_Y = 345;

    private var _loader as ThemeLoader;

    private const ZONE_COLORS = [
        0x4CAF50, 0x8BC34A, 0xFFC107, 0xFF9800, 0xF44336
    ];

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    function draw(dc as Graphics.Dc) as Void {
        var info  = Activity.getActivityInfo();
        var hrStr = "--";
        var color = _loader.getTheme().getMutedColor();

        if (info != null && info.currentHeartRate != null) {
            var hr = info.currentHeartRate;
            hrStr  = hr.toString();
            color  = getZoneColor(hr);
        }

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, Graphics.FONT_SMALL, "♥ " + hrStr, Graphics.TEXT_JUSTIFY_LEFT);
    }

    private function getZoneColor(hr as Number) as Number {
        if (hr < 115) { return ZONE_COLORS[0]; }
        if (hr < 135) { return ZONE_COLORS[1]; }
        if (hr < 155) { return ZONE_COLORS[2]; }
        if (hr < 175) { return ZONE_COLORS[3]; }
        return ZONE_COLORS[4];
    }

}
