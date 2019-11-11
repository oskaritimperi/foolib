import os
import strformat

import nimterop/[cimport, build]

static:
    cDebug()
    cDisableCaching()

cOverride:
    type
        MusicData = object
        Music = ptr MusicData

cImport(currentSourcePath().parentDir().parentDir() / "src" / "foolib" / "raylib" / "src" / "raylib.h")

proc initColor*(r, g, b, a: int): Color =
    Color(r: r.cuchar, g: g.cuchar, b: b.cuchar, a: a.cuchar)

const LIGHTGRAY*  = initColor(200, 200, 200, 255)    # Light Gray
const GRAY*       = initColor(130, 130, 130, 255)    # Gray
const DARKGRAY*   = initColor(80, 80, 80, 255)       # Dark Gray
const YELLOW*     = initColor(253, 249, 0, 255)      # Yellow
const GOLD*       = initColor(255, 203, 0, 255)      # Gold
const ORANGE*     = initColor(255, 161, 0, 255)      # Orange
const PINK*       = initColor(255, 109, 194, 255)    # Pink
const RED*        = initColor(230, 41, 55, 255)      # Red
const MAROON*     = initColor(190, 33, 55, 255)      # Maroon
const GREEN*      = initColor(0, 228, 48, 255)       # Green
const LIME*       = initColor(0, 158, 47, 255)       # Lime
const DARKGREEN*  = initColor(0, 117, 44, 255)       # Dark Green
const SKYBLUE*    = initColor(102, 191, 255, 255)    # Sky Blue
const BLUE*       = initColor(0, 121, 241, 255)      # Blue
const DARKBLUE*   = initColor(0, 82, 172, 255)       # Dark Blue
const PURPLE*     = initColor(200, 122, 255, 255)    # Purple
const VIOLET*     = initColor(135, 60, 190, 255)     # Violet
const DARKPURPLE* = initColor(112, 31, 126, 255)     # Dark Purple
const BEIGE*      = initColor(211, 176, 131, 255)    # Beige
const BROWN*      = initColor(127, 106, 79, 255)     # Brown
const DARKBROWN*  = initColor(76, 63, 47, 255)       # Dark Brown

const WHITE*      = initColor(255, 255, 255, 255)    # White
const BLACK*      = initColor(0, 0, 0, 255)          # Black
const BLANK*      = initColor(0, 0, 0, 0)            # Blank (Transparent)
const MAGENTA*    = initColor(255, 0, 255, 255)      # Magenta
const RAYWHITE*   = initColor(245, 245, 245, 255)    # My own White (raylib logo)
