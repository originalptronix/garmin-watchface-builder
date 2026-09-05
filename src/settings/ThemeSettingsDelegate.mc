import Toybox.WatchUi;
import Toybox.Lang;

/**
 * ThemeSettingsDelegate
 * Input-Delegate fuer das Watchface-Settings-Menue.
 * Ermoeglicht Theme-Wechsel per Swipe/Tap auf der Uhr.
 *
 * Verwendung:
 *   - Langer Druck auf das Watchface oeffnet das Garmin-Settings-Menue
 *   - Alternativ: onTap() ermoeglicht direktes Durchschalten
 */
class ThemeSettingsDelegate extends WatchUi.WatchFaceDelegate {

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        WatchFaceDelegate.initialize();
        _loader = loader;
    }

    // Tap: Theme zyklisch wechseln
    function onTap(tapEvent as WatchUi.ClickEvent) as Boolean {
        // Nur im vorderen Bereich (obere Haelfte) auf Tap reagieren
        var coords = tapEvent.getCoordinates();
        if (coords[1] < 100) {
            _loader.cycleNextTheme();
            WatchUi.requestUpdate();
            return true;
        }
        return false;
    }

    // Garmin-Settings-Seite aufrufen (Connect IQ Settings)
    function onSettingsChanged() as Void {
        // Wird aufgerufen wenn Nutzer Settings ueber Garmin Connect aendert
        // ThemeLoader laedt dann den neuen Wert aus Application.Storage
        var savedId = Application.Storage.getValue("activeThemeId");
        if (savedId != null) {
            _loader.setTheme(savedId);
        }
        WatchUi.requestUpdate();
    }

}
