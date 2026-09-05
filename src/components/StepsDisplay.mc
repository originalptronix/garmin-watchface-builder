import Toybox.Graphics;
import Toybox.ActivityMonitor;
import Toybox.Lang;

/**
 * StepsDisplay
 * Zeigt den Schrittzähler des Tages an.
 */
class StepsDisplay {

    // Position: unten rechts
    private const POS_X = 336;
    private const POS_Y = 340;

    private const COLOR_STEPS = 0x00B4D8; // Cyan-Akzent

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        var steps = "--";

        if (ActivityMonitor.getInfo() != null) {
            var info = ActivityMonitor.getInfo();
            if (info.steps != null) {
                steps = info.steps.toString();
            }
        }

        dc.setColor(COLOR_STEPS, Graphics.COLOR_TRANSPARENT);
        // Schuh-Icon
        dc.drawText(POS_X - 28, POS_Y, Graphics.FONT_SMALL, "👟", Graphics.TEXT_JUSTIFY_CENTER);
        // Schrittzahl
        dc.drawText(POS_X - 8, POS_Y, Graphics.FONT_MEDIUM, steps, Graphics.TEXT_JUSTIFY_LEFT);
    }

}
