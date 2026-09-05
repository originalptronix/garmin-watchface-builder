import Toybox.Graphics;
import Toybox.Lang;

/**
 * ThemeDefinition
 * Value-Object: Kapselt alle visuellen Parameter eines Themes.
 * Wird von ThemeLoader erstellt und von allen Komponenten genutzt.
 */
class ThemeDefinition {

    // -------------------------------------------------------
    // Konstanten: Zeitstile
    // -------------------------------------------------------
    static const STYLE_DIGITAL_LARGE  = 0; // Große digitale Uhr
    static const STYLE_DIGITAL_WIDE   = 1; // Breite digitale Uhr mit Sekunden
    static const STYLE_BOLD_ROUNDED   = 2; // Fett & abgerundet (Cartoon)
    static const STYLE_TERMINAL       = 3; // Monospace-Terminal-Look
    static const STYLE_ANALOG         = 4; // Analogzeiger (future)

    // -------------------------------------------------------
    // Konstanten: Hintergrundstile
    // -------------------------------------------------------
    static const BG_SOLID             = 0; // Einfarbig
    static const BG_FLAT_CARTOON      = 1; // Flach mit farbiger Umrandung
    static const BG_SCANLINE          = 2; // Terminal-Scanlines
    static const BG_GRID_NIGHT        = 3; // Perspektivisches Nacht-Grid

    // -------------------------------------------------------
    // Eigenschaften
    // -------------------------------------------------------
    private var _name          as String;
    private var _bgColor       as Number;
    private var _primaryColor  as Number;
    private var _accentColor   as Number;
    private var _mutedColor    as Number;
    private var _timeStyle     as Number;
    private var _bgStyle       as Number;

    function initialize(name as String) {
        _name         = name;
        _bgColor      = Graphics.COLOR_BLACK;
        _primaryColor = Graphics.COLOR_WHITE;
        _accentColor  = 0x00B4D8;
        _mutedColor   = 0xAAAAAA;
        _timeStyle    = STYLE_DIGITAL_LARGE;
        _bgStyle      = BG_SOLID;
    }

    // --- Setter ---
    function setBackground(color as Number)   as Void { _bgColor      = color; }
    function setPrimaryColor(color as Number) as Void { _primaryColor = color; }
    function setAccentColor(color as Number)  as Void { _accentColor  = color; }
    function setMutedColor(color as Number)   as Void { _mutedColor   = color; }
    function setTimeStyle(style as Number)    as Void { _timeStyle    = style; }
    function setBackgroundStyle(s as Number)  as Void { _bgStyle      = s;     }

    // --- Getter ---
    function getName()         as String { return _name;         }
    function getBackground()   as Number { return _bgColor;      }
    function getPrimaryColor() as Number { return _primaryColor; }
    function getAccentColor()  as Number { return _accentColor;  }
    function getMutedColor()   as Number { return _mutedColor;   }
    function getTimeStyle()    as Number { return _timeStyle;    }
    function getBackgroundStyle() as Number { return _bgStyle;   }

}
