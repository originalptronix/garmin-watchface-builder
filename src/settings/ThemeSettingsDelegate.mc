import Toybox.Application;
import Toybox.WatchUi;
import Toybox.Lang;

/**
 * ThemeSettingsDelegate
 * Verarbeitet Tap-Events auf dem Watchface und Settings-Aenderungen
 * aus der Garmin Connect App.
 */
class ThemeSettingsDelegate extends WatchUi.WatchFaceDelegate {

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        WatchFaceDelegate.initialize();
        _loader = loader;
    }

    // Tap oben auf dem Display -> naechstes Theme
    function onTap(tapEvent as WatchUi.ClickEvent) as Boolean {
        var coords = tapEvent.getCoordinates();
        if (coords[1] < 100) {
            _loader.cycleNextTheme();
            WatchUi.requestUpdate();
            return true;
        }
        return false;
    }

    // Wird aufgerufen wenn Nutzer Settings in Garmin Connect aendert
    function onSettingsChanged() as Void {
        _loader.reloadFromProperties();
        WatchUi.requestUpdate();
    }

}
