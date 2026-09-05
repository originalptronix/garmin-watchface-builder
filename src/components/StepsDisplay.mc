import Toybox.Graphics;
import Toybox.ActivityMonitor;
import Toybox.Lang;

/**
 * StepsDisplay
 * Schrittzaehler mit Akzentfarbe aus dem aktiven Theme.
 */
class StepsDisplay {

    private const POS_X = 336;
    private const POS_Y = 345;

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    function draw(dc as Graphics.Dc) as Void {
        var steps = "--";
        var info  = ActivityMonitor.getInfo();
        if (info != null && info.steps != null) {
            steps = info.steps.toString();
        }

        dc.setColor(_loader.getTheme().getAccentColor(), Graphics.COLOR_TRANSPARENT);
        dc.drawText(POS_X, POS_Y, Graphics.FONT_MEDIUM, steps, Graphics.TEXT_JUSTIFY_RIGHT);
    }

}
