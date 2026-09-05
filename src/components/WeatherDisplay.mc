import Toybox.Graphics;
import Toybox.Lang;
// import Toybox.Weather; // Aktivieren wenn Connect IQ Weather API verfügbar

/**
 * WeatherDisplay
 * Zeigt aktuelle Wetterdaten an.
 * Hinweis: Erfordert Connect IQ 3.2+ und Kommunikations-Berechtigung.
 *
 * Aktuell: Platzhalter – Implementierung in Roadmap
 */
class WeatherDisplay {

    private const POS_X = 208;
    private const POS_Y = 60;
    private const COLOR_WEATHER = 0xAAAAAA;

    function initialize() {
    }

    function draw(dc as Graphics.Dc) as Void {
        // TODO: Implementierung mit Toybox.Weather API
        // Aktuell: Platzhalter
        dc.setColor(COLOR_WEATHER, Graphics.COLOR_TRANSPARENT);
        // dc.drawText(POS_X, POS_Y, Graphics.FONT_SMALL, "☀ 22°C", Graphics.TEXT_JUSTIFY_CENTER);
    }

}
