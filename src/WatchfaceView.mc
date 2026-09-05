import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;

/**
 * WatchfaceView
 * Haupt-View: Steuert das Rendering aller Watchface-Komponenten.
 * Unterstützte Geräte: Garmin Epix Pro Gen 2 (47mm / 51mm)
 * Displayauflösung: 416 x 416 px (AMOLED)
 */
class WatchfaceView extends WatchUi.WatchFace {

    private var _timeDisplay as TimeDisplay;
    private var _dateDisplay as DateDisplay;
    private var _heartRateDisplay as HeartRateDisplay;
    private var _stepsDisplay as StepsDisplay;
    private var _batteryDisplay as BatteryDisplay;

    function initialize() {
        WatchFace.initialize();
        _timeDisplay    = new TimeDisplay();
        _dateDisplay    = new DateDisplay();
        _heartRateDisplay = new HeartRateDisplay();
        _stepsDisplay   = new StepsDisplay();
        _batteryDisplay = new BatteryDisplay();
    }

    // Layout bei Größenänderung / Initialisierung
    function onLayout(dc as Graphics.Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Sichtbarkeit: Watchface wird angezeigt
    function onShow() as Void {
    }

    // Hauptrender-Methode (wird jede Minute aufgerufen)
    function onUpdate(dc as Graphics.Dc) as Void {
        // Hintergrund schwarz (optimiert für AMOLED)
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Alle Komponenten zeichnen
        _timeDisplay.draw(dc);
        _dateDisplay.draw(dc);
        _heartRateDisplay.draw(dc);
        _stepsDisplay.draw(dc);
        _batteryDisplay.draw(dc);
    }

    // Inaktivitäts-Modus (always-on display)
    function onPartialUpdate(dc as Graphics.Dc) as Void {
        _timeDisplay.draw(dc);
    }

    // Watchface wird verborgen
    function onHide() as Void {
    }

    // Hintergrundaktualisierung (außerhalb des Watchface-Modus)
    function onExitSleep() as Void {
    }

    function onEnterSleep() as Void {
    }

}
