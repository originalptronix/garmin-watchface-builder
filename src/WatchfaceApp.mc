import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

/**
 * WatchfaceApp
 * Einstiegspunkt der Applikation.
 * Registriert View + Theme-Settings-Delegate.
 */
class WatchfaceApp extends Application.AppBase {

    private var _themeLoader as ThemeLoader or Null;

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Lang.Dictionary?) as Void {
    }

    function onStop(state as Lang.Dictionary?) as Void {
    }

    function getInitialView() as [ WatchUi.Views ] or [ WatchUi.Views, WatchUi.InputDelegates ] {
        var view     = new WatchfaceView();
        // ThemeLoader aus der View holen fuer den Delegate
        // (oder separat instanziieren – Storage sorgt fuer Konsistenz)
        var delegate = new ThemeSettingsDelegate(new ThemeLoader());
        return [ view, delegate ];
    }

}

function getApp() as WatchfaceApp {
    return Application.getApp() as WatchfaceApp;
}
