import Toybox.Graphics;
import Toybox.Lang;

/**
 * ThemeRenderer
 * Kapselt das theme-abhängige Zeichnen von Hintergründen und
 * stellt Hilfsfunktionen für alle Komponenten bereit.
 * Singleton: wird in WatchfaceView gehalten und an Komponenten übergeben.
 */
class ThemeRenderer {

    private var _loader as ThemeLoader;

    function initialize(loader as ThemeLoader) {
        _loader = loader;
    }

    // Hintergrund je nach Theme-Stil rendern
    function drawBackground(dc as Graphics.Dc) as Void {
        var theme = _loader.getTheme();
        var style = theme.getBackgroundStyle();

        // Basis-Hintergrundfarbe immer zuerst
        dc.setColor(theme.getBackground(), theme.getBackground());
        dc.clear();

        if (style == ThemeDefinition.BG_FLAT_CARTOON) {
            drawCartoonBorder(dc, theme);
        } else if (style == ThemeDefinition.BG_SCANLINE) {
            drawScanlines(dc, theme);
        } else if (style == ThemeDefinition.BG_GRID_NIGHT) {
            drawNightGrid(dc, theme);
        }
        // BG_SOLID: nichts weiter zeichnen
    }

    // Cartoon: dicker farbiger Rahmen
    private function drawCartoonBorder(dc as Graphics.Dc, theme as ThemeDefinition) as Void {
        dc.setColor(theme.getAccentColor(), Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(8);
        dc.drawCircle(208, 208, 200); // Epix Pro Gen 2: 416x416
        dc.setPenWidth(1);
    }

    // Nuclear Terminal: horizontale Scanlines
    private function drawScanlines(dc as Graphics.Dc, theme as ThemeDefinition) as Void {
        // Subtile Scanlines alle 4 Pixel
        var lineColor = Graphics.createColor(20, 0, 20, 0); // 20% Transparenz auf Grün
        dc.setColor(lineColor, Graphics.COLOR_TRANSPARENT);
        var y = 0;
        while (y < 416) {
            dc.drawLine(0, y, 416, y);
            y += 4;
        }
    }

    // Neon City: perspektivisches Gitter
    private function drawNightGrid(dc as Graphics.Dc, theme as ThemeDefinition) as Void {
        dc.setColor(theme.getAccentColor(), Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(1);
        // Horizontale Linien (gedimmt)
        var alpha = Graphics.createColor(30, 0, 229, 255); // Gedimmtes Neon-Cyan
        dc.setColor(alpha, Graphics.COLOR_TRANSPARENT);
        var step = 40;
        var y = 200;
        while (y < 416) {
            dc.drawLine(0, y, 416, y);
            y += step;
        }
        // Vertikale Linien
        var x = 0;
        while (x < 416) {
            dc.drawLine(x, 200, x, 416);
            x += step;
        }
    }

    // Gibt die korrekte Schriftgröße für den Zeit-Stil zurück
    function getTimeFont(style as Number) as Graphics.FontType {
        if (style == ThemeDefinition.STYLE_TERMINAL) {
            return Graphics.FONT_NUMBER_MILD;
        } else if (style == ThemeDefinition.STYLE_BOLD_ROUNDED) {
            return Graphics.FONT_NUMBER_THAI_HOT;
        } else if (style == ThemeDefinition.STYLE_DIGITAL_WIDE) {
            return Graphics.FONT_NUMBER_HOT;
        }
        return Graphics.FONT_NUMBER_THAI_HOT; // Default: STYLE_DIGITAL_LARGE
    }

}
