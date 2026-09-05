import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

/**
 * WatchfaceApp
 * Einstiegspunkt der Watchface-Applikation.
 * Garmin Epix Pro Gen 2
 */
class WatchfaceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // Initialisierung der App – wird einmalig beim Start aufgerufen
    function onStart(state as Lang.Dictionary?) as Void {
    }

    // Aufräumen beim Beenden
    function onStop(state as Lang.Dictionary?) as Void {
    }

    // Gibt die initiale View zurück
    function getInitialView() as [ WatchUi.Views ] or [ WatchUi.Views, WatchUi.InputDelegates ] {
        return [ new WatchfaceView() ];
    }

}

// Applikations-Factory
function getApp() as WatchfaceApp {
    return Application.getApp() as WatchfaceApp;
}
