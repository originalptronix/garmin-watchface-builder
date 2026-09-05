import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;

/**
 * BatteryDisplay
 * Batteriestatus mit theme-bewusster Farbgebung.
 */
class BatteryDisplay {

    private const POS_X = 370;
    private const POS_Y = 20;

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    function draw(dc as Graphics.Dc) as Void {
        var stats   = System.getSystemStats();
        var battery = stats.battery.toNumber();
        var batStr  = battery.toString() + "%";

        var color;
        if (battery > 50)      { color = 0x4CAF50; }
        else if (battery > 20) { color = 0xFFC107; }
        else                   { color = 0xF44336; }

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, Graphics.FONT_XTINY, batStr, Graphics.TEXT_JUSTIFY_RIGHT);
    }

}
