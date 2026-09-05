import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;

/**
 * WatchfaceView
 * Haupt-View: Orchestriert ThemeLoader, ThemeRenderer und alle Komponenten.
 * Epix Pro Gen 2: 416x416 AMOLED
 */
class WatchfaceView extends WatchUi.WatchFace {

    // Theme-System
    private var _themeLoader   as ThemeLoader;
    private var _themeRenderer as ThemeRenderer;

    // Anzeigekomponenten
    private var _timeDisplay      as TimeDisplay;
    private var _dateDisplay      as DateDisplay;
    private var _heartRateDisplay as HeartRateDisplay;
    private var _stepsDisplay     as StepsDisplay;
    private var _batteryDisplay   as BatteryDisplay;

    function initialize() {
        WatchFace.initialize();

        // Theme-System initialisieren
        _themeLoader   = new ThemeLoader();
        _themeRenderer = new ThemeRenderer(_themeLoader);

        // Komponenten mit Theme-Zugriff initialisieren
        _timeDisplay      = new TimeDisplay(_themeLoader);
        _dateDisplay      = new DateDisplay(_themeLoader);
        _heartRateDisplay = new HeartRateDisplay(_themeLoader);
        _stepsDisplay     = new StepsDisplay(_themeLoader);
        _batteryDisplay   = new BatteryDisplay(_themeLoader);
    }

    function onLayout(dc as Graphics.Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {}

    // Haupt-Render (jede Minute)
    function onUpdate(dc as Graphics.Dc) as Void {
        // 1. Theme-Hintergrund zeichnen
        _themeRenderer.drawBackground(dc);

        // 2. Alle Komponenten rendern
        _timeDisplay.draw(dc);
        _dateDisplay.draw(dc);
        _heartRateDisplay.draw(dc);
        _stepsDisplay.draw(dc);
        _batteryDisplay.draw(dc);

        // 3. Theme-Name einblenden (optional, nur kurz nach Wechsel)
        drawThemeLabel(dc);
    }

    // Always-On Display
    function onPartialUpdate(dc as Graphics.Dc) as Void {
        _timeDisplay.draw(dc);
    }

    // Theme-Name kurz einblenden (nur wenn kein Sport-Theme aktiv)
    private function drawThemeLabel(dc as Graphics.Dc) as Void {
        var theme = _themeLoader.getTheme();
        dc.setColor(theme.getMutedColor(), Graphics.COLOR_TRANSPARENT);
        dc.drawText(208, 380, Graphics.FONT_XTINY, theme.getName(), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function onHide()       as Void {}
    function onExitSleep()  as Void {}
    function onEnterSleep() as Void {}

}
