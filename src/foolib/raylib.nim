import os

const
    RaylibSrcPath = currentSourcePath().parentDir() / "raylib" / "src"

    Platform = "PLATFORM_DESKTOP"

    Graphics = "GRAPHICS_API_OPENGL_33"

{.passC:"-std=c99 -fno-strict-aliasing".}
{.passC:"-D" & Platform.}
{.passC:"-D" & Graphics.}
{.passC:"-I" & RaylibSrcPath.}
{.passC:"-I" & RaylibSrcPath / "external" / "glfw" / "include".}
{.passC:"-I" & RaylibSrcPath / "external" / "glfw" / "deps" / "mingw".}
{.passC:"-I" & currentSourcePath().parentDir() / "glad" / "include".}

{.compile: RaylibSrcPath / "core.c".}
{.compile: RaylibSrcPath / "shapes.c".}
{.compile: RaylibSrcPath / "textures.c".}
{.compile: RaylibSrcPath / "text.c".}
{.compile: RaylibSrcPath / "utils.c".}
{.compile: RaylibSrcPath / "rglfw.c".}
{.compile: RaylibSrcPath / "models.c".}
{.compile: RaylibSrcPath / "raudio.c".}

when defined(linux):
    {.passL:"-lX11 -lpthread".}




# Overriding MusicData Music
# Importing /home/oswjk/dev/foolib/src/foolib/raylib/src/raylib.h
# Generated at 2019-11-08T23:44:09+02:00
# Command line:
#   /home/oswjk/.nimble/pkgs/nimterop-0.3.1/nimterop/toast --preprocess --pnim --symOverride=MusicData,Music --nim:/home/oswjk/.choosenim/toolchains/nim-1.0.2/bin/nim --pluginSourcePath=/home/oswjk/.cache/nim/nimterop/cPlugins/nimterop_304125843.nim /home/oswjk/dev/foolib/src/foolib/raylib/src/raylib.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}


type
  va_list* {.importc, header:"<stdarg.h>".} = object

template enumOp*(op, typ, typout) =
  proc op*(x: typ, y: int): typout {.borrow.}
  proc op*(x: int, y: typ): typout {.borrow.}
  proc op*(x, y: typ): typout {.borrow.}

template defineEnum*(typ) =
  type
    typ* = distinct int

  enumOp(`+`,   typ, typ)
  enumOp(`-`,   typ, typ)
  enumOp(`*`,   typ, typ)
  enumOp(`<`,   typ, bool)
  enumOp(`<=`,  typ, bool)
  enumOp(`==`,  typ, bool)
  enumOp(`div`, typ, typ)
  enumOp(`mod`, typ, typ)

  proc `shl`*(x: typ, y: int): typ {.borrow.}
  proc `shl`*(x: int, y: typ): typ {.borrow.}
  proc `shl`*(x, y: typ): typ {.borrow.}

  proc `shr`*(x: typ, y: int): typ {.borrow.}
  proc `shr`*(x: int, y: typ): typ {.borrow.}
  proc `shr`*(x, y: typ): typ {.borrow.}

  proc `or`*(x: typ, y: int): typ {.borrow.}
  proc `or`*(x: int, y: typ): typ {.borrow.}
  proc `or`*(x, y: typ): typ {.borrow.}

  proc `and`*(x: typ, y: int): typ {.borrow.}
  proc `and`*(x: int, y: typ): typ {.borrow.}
  proc `and`*(x, y: typ): typ {.borrow.}

  proc `xor`*(x: typ, y: int): typ {.borrow.}
  proc `xor`*(x: int, y: typ): typ {.borrow.}
  proc `xor`*(x, y: typ): typ {.borrow.}

  proc `/`(x, y: typ): typ =
    return (x.float / y.float).int.typ
  proc `/`*(x: typ, y: int): typ = `/`(x, y.typ)
  proc `/`*(x: int, y: typ): typ = `/`(x.typ, y)

  proc `$` *(x: typ): string {.borrow.}




# ----------------------------------------------------------------------------------
#  Enumerators Definition
# ----------------------------------------------------------------------------------
#  System config flags
#  NOTE: Used for bit masks
defineEnum(ConfigFlag)

#  Trace log type
defineEnum(TraceLogType)

#  Keyboard keys
defineEnum(KeyboardKey)

#  Android buttons
defineEnum(AndroidButton)

#  Mouse buttons
defineEnum(MouseButton)

#  Gamepad number
defineEnum(GamepadNumber)

#  Gamepad Buttons
defineEnum(GamepadButton)
defineEnum(GamepadAxis)

#  Shader location point type
defineEnum(ShaderLocationIndex)

#  Shader uniform data types
defineEnum(ShaderUniformDataType)

#  Material map type
defineEnum(MaterialMapType)

#  Pixel formats
#  NOTE: Support depends on OpenGL version and platform
defineEnum(PixelFormat)

#  Texture parameters: filter mode
#  NOTE 1: Filtering considers mipmaps if available in the texture
#  NOTE 2: Filter is accordingly set for minification and magnification
defineEnum(TextureFilterMode)

#  Cubemap layout type
defineEnum(CubemapLayoutType)

#  Texture parameters: wrap mode
defineEnum(TextureWrapMode)

#  Font type, defines generation method
defineEnum(FontType)

#  Color blending modes (pre-defined)
defineEnum(BlendMode)

#  Gestures type
#  NOTE: It could be used as flags to enable only some gestures
defineEnum(GestureType)

#  Camera system modes
defineEnum(CameraMode)

#  Camera projection modes
defineEnum(CameraType)

#  Type of n-patch
defineEnum(NPatchType)

const
  headerraylib {.used.} = "raylib.h"

  # *********************************************************************************************
  # *
  # *   raylib - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
  # *
  # *   FEATURES:
  # *       - NO external dependencies, all required libraries included with raylib
  # *       - Multiplatform: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly, MacOS, UWP, Android, Raspberry Pi, HTML5.
  # *       - Written in plain C code (C99) in PascalCase/camelCase notation
  # *       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3 or ES2 - choose at compile)
  # *       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
  # *       - Powerful fonts module (XNA SpriteFonts, BMFonts, TTF)
  # *       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
  # *       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
  # *       - Flexible Materials system, supporting classic maps and PBR maps
  # *       - Skeletal Animation support (CPU bones-based animation)
  # *       - Shaders support, including Model shaders and Postprocessing shaders
  # *       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
  # *       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
  # *       - VR stereo rendering with configurable HMD device parameters
  # *       - Bindings to multiple programming languages available!
  # *
  # *   NOTES:
  # *       One custom font is loaded by default when InitWindow() [core]
  # *       If using OpenGL 3.3 or ES2, one default shader is loaded automatically (internally defined) [rlgl]
  # *       If using OpenGL 3.3 or ES2, several vertex buffers (VAO/VBO) are created to manage lines-triangles-quads
  # *
  # *   DEPENDENCIES (included):
  # *       [core] rglfw (github.com/glfw/glfw) for window/context management and input (only PLATFORM_DESKTOP)
  # *       [rlgl] glad (github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading (only PLATFORM_DESKTOP)
  # *       [raudio] miniaudio (github.com/dr-soft/miniaudio) for audio device/context management
  # *
  # *   OPTIONAL DEPENDENCIES (included):
  # *       [core] rgif (Charlie Tangora, Ramon Santamaria) for GIF recording
  # *       [textures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
  # *       [textures] stb_image_write (Sean Barret) for image writting (BMP, TGA, PNG, JPG)
  # *       [textures] stb_image_resize (Sean Barret) for image resizing algorythms
  # *       [textures] stb_perlin (Sean Barret) for Perlin noise image generation
  # *       [text] stb_truetype (Sean Barret) for ttf fonts loading
  # *       [text] stb_rect_pack (Sean Barret) for rectangles packing
  # *       [models] par_shapes (Philip Rideout) for parametric 3d shapes generation
  # *       [models] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
  # *       [models] cgltf (Johannes Kuhlmann) for models loading (glTF)
  # *       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
  # *       [raudio] dr_flac (David Reid) for FLAC audio file loading
  # *       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
  # *       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
  # *       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
  # *
  # *
  # *   LICENSE: zlib/libpng
  # *
  # *   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
  # *   BSD-like license that allows static linking with closed source software:
  # *
  # *   Copyright (c) 2013-2019 Ramon Santamaria (@raysan5)
  # *
  # *   This software is provided "as-is", without any express or implied warranty. In no event
  # *   will the authors be held liable for any damages arising from the use of this software.
  # *
  # *   Permission is granted to anyone to use this software for any purpose, including commercial
  # *   applications, and to alter it and redistribute it freely, subject to the following restrictions:
  # *
  # *     1. The origin of this software must not be misrepresented; you must not claim that you
  # *     wrote the original software. If you use this software in a product, an acknowledgment
  # *     in the product documentation would be appreciated but is not required.
  # *
  # *     2. Altered source versions must be plainly marked as such, and must not be misrepresented
  # *     as being the original software.
  # *
  # *     3. This notice may not be removed or altered from any source distribution.
  # *
  # *********************************************************************************************
  # ----------------------------------------------------------------------------------
  #  Some basic Defines
  # ----------------------------------------------------------------------------------
  MAX_TOUCH_POINTS* = 10

  #  Shader and material limits
  MAX_SHADER_LOCATIONS* = 32
  MAX_MATERIAL_MAPS* = 12
  FLAG_SHOW_LOGO* = (1).ConfigFlag
  FLAG_FULLSCREEN_MODE* = (2).ConfigFlag
  FLAG_WINDOW_RESIZABLE* = (4).ConfigFlag
  FLAG_WINDOW_UNDECORATED* = (8).ConfigFlag
  FLAG_WINDOW_TRANSPARENT* = (16).ConfigFlag
  FLAG_WINDOW_HIDDEN* = (128).ConfigFlag
  FLAG_MSAA_4X_HINT* = (32).ConfigFlag
  FLAG_VSYNC_HINT* = (64).ConfigFlag
  LOG_ALL* = (0).TraceLogType
  LOG_TRACE* = 1.TraceLogType
  LOG_DEBUG* = 2.TraceLogType
  LOG_INFO* = 3.TraceLogType
  LOG_WARNING* = 4.TraceLogType
  LOG_ERROR* = 5.TraceLogType
  LOG_FATAL* = 6.TraceLogType
  LOG_NONE* = 7.TraceLogType
  KEY_APOSTROPHE* = (39).KeyboardKey
  KEY_COMMA* = (44).KeyboardKey
  KEY_MINUS* = (45).KeyboardKey
  KEY_PERIOD* = (46).KeyboardKey
  KEY_SLASH* = (47).KeyboardKey
  KEY_ZERO* = (48).KeyboardKey
  KEY_ONE* = (49).KeyboardKey
  KEY_TWO* = (50).KeyboardKey
  KEY_THREE* = (51).KeyboardKey
  KEY_FOUR* = (52).KeyboardKey
  KEY_FIVE* = (53).KeyboardKey
  KEY_SIX* = (54).KeyboardKey
  KEY_SEVEN* = (55).KeyboardKey
  KEY_EIGHT* = (56).KeyboardKey
  KEY_NINE* = (57).KeyboardKey
  KEY_SEMICOLON* = (59).KeyboardKey
  KEY_EQUAL* = (61).KeyboardKey
  KEY_A* = (65).KeyboardKey
  KEY_B* = (66).KeyboardKey
  KEY_C* = (67).KeyboardKey
  KEY_D* = (68).KeyboardKey
  KEY_E* = (69).KeyboardKey
  KEY_F* = (70).KeyboardKey
  KEY_G* = (71).KeyboardKey
  KEY_H* = (72).KeyboardKey
  KEY_I* = (73).KeyboardKey
  KEY_J* = (74).KeyboardKey
  KEY_K* = (75).KeyboardKey
  KEY_L* = (76).KeyboardKey
  KEY_M* = (77).KeyboardKey
  KEY_N* = (78).KeyboardKey
  KEY_O* = (79).KeyboardKey
  KEY_P* = (80).KeyboardKey
  KEY_Q* = (81).KeyboardKey
  KEY_R* = (82).KeyboardKey
  KEY_S* = (83).KeyboardKey
  KEY_T* = (84).KeyboardKey
  KEY_U* = (85).KeyboardKey
  KEY_V* = (86).KeyboardKey
  KEY_W* = (87).KeyboardKey
  KEY_X* = (88).KeyboardKey
  KEY_Y* = (89).KeyboardKey
  KEY_Z* = (90).KeyboardKey
  KEY_SPACE* = (32).KeyboardKey
  KEY_ESCAPE* = (256).KeyboardKey
  KEY_ENTER* = (257).KeyboardKey
  KEY_TAB* = (258).KeyboardKey
  KEY_BACKSPACE* = (259).KeyboardKey
  KEY_INSERT* = (260).KeyboardKey
  KEY_DELETE* = (261).KeyboardKey
  KEY_RIGHT* = (262).KeyboardKey
  KEY_LEFT* = (263).KeyboardKey
  KEY_DOWN* = (264).KeyboardKey
  KEY_UP* = (265).KeyboardKey
  KEY_PAGE_UP* = (266).KeyboardKey
  KEY_PAGE_DOWN* = (267).KeyboardKey
  KEY_HOME* = (268).KeyboardKey
  KEY_END* = (269).KeyboardKey
  KEY_CAPS_LOCK* = (280).KeyboardKey
  KEY_SCROLL_LOCK* = (281).KeyboardKey
  KEY_NUM_LOCK* = (282).KeyboardKey
  KEY_PRINT_SCREEN* = (283).KeyboardKey
  KEY_PAUSE* = (284).KeyboardKey
  KEY_F1* = (290).KeyboardKey
  KEY_F2* = (291).KeyboardKey
  KEY_F3* = (292).KeyboardKey
  KEY_F4* = (293).KeyboardKey
  KEY_F5* = (294).KeyboardKey
  KEY_F6* = (295).KeyboardKey
  KEY_F7* = (296).KeyboardKey
  KEY_F8* = (297).KeyboardKey
  KEY_F9* = (298).KeyboardKey
  KEY_F10* = (299).KeyboardKey
  KEY_F11* = (300).KeyboardKey
  KEY_F12* = (301).KeyboardKey
  KEY_LEFT_SHIFT* = (340).KeyboardKey
  KEY_LEFT_CONTROL* = (341).KeyboardKey
  KEY_LEFT_ALT* = (342).KeyboardKey
  KEY_LEFT_SUPER* = (343).KeyboardKey
  KEY_RIGHT_SHIFT* = (344).KeyboardKey
  KEY_RIGHT_CONTROL* = (345).KeyboardKey
  KEY_RIGHT_ALT* = (346).KeyboardKey
  KEY_RIGHT_SUPER* = (347).KeyboardKey
  KEY_KB_MENU* = (348).KeyboardKey
  KEY_LEFT_BRACKET* = (91).KeyboardKey
  KEY_BACKSLASH* = (92).KeyboardKey
  KEY_RIGHT_BRACKET* = (93).KeyboardKey
  KEY_GRAVE* = (96).KeyboardKey
  KEY_KP_0* = (320).KeyboardKey
  KEY_KP_1* = (321).KeyboardKey
  KEY_KP_2* = (322).KeyboardKey
  KEY_KP_3* = (323).KeyboardKey
  KEY_KP_4* = (324).KeyboardKey
  KEY_KP_5* = (325).KeyboardKey
  KEY_KP_6* = (326).KeyboardKey
  KEY_KP_7* = (327).KeyboardKey
  KEY_KP_8* = (328).KeyboardKey
  KEY_KP_9* = (329).KeyboardKey
  KEY_KP_DECIMAL* = (330).KeyboardKey
  KEY_KP_DIVIDE* = (331).KeyboardKey
  KEY_KP_MULTIPLY* = (332).KeyboardKey
  KEY_KP_SUBTRACT* = (333).KeyboardKey
  KEY_KP_ADD* = (334).KeyboardKey
  KEY_KP_ENTER* = (335).KeyboardKey
  KEY_KP_EQUAL* = (336).KeyboardKey
  KEY_BACK* = (4).AndroidButton
  KEY_MENU* = (82).AndroidButton
  KEY_VOLUME_UP* = (24).AndroidButton
  KEY_VOLUME_DOWN* = (25).AndroidButton
  MOUSE_LEFT_BUTTON* = (0).MouseButton
  MOUSE_RIGHT_BUTTON* = (1).MouseButton
  MOUSE_MIDDLE_BUTTON* = (2).MouseButton
  GAMEPAD_PLAYER1* = (0).GamepadNumber
  GAMEPAD_PLAYER2* = (1).GamepadNumber
  GAMEPAD_PLAYER3* = (2).GamepadNumber
  GAMEPAD_PLAYER4* = (3).GamepadNumber
  GAMEPAD_BUTTON_UNKNOWN* = (0).GamepadButton
  GAMEPAD_BUTTON_LEFT_FACE_UP* = 1.GamepadButton
  GAMEPAD_BUTTON_LEFT_FACE_RIGHT* = 2.GamepadButton
  GAMEPAD_BUTTON_LEFT_FACE_DOWN* = 3.GamepadButton
  GAMEPAD_BUTTON_LEFT_FACE_LEFT* = 4.GamepadButton
  GAMEPAD_BUTTON_RIGHT_FACE_UP* = 5.GamepadButton
  GAMEPAD_BUTTON_RIGHT_FACE_RIGHT* = 6.GamepadButton
  GAMEPAD_BUTTON_RIGHT_FACE_DOWN* = 7.GamepadButton
  GAMEPAD_BUTTON_RIGHT_FACE_LEFT* = 8.GamepadButton
  GAMEPAD_BUTTON_LEFT_TRIGGER_1* = 9.GamepadButton
  GAMEPAD_BUTTON_LEFT_TRIGGER_2* = 10.GamepadButton
  GAMEPAD_BUTTON_RIGHT_TRIGGER_1* = 11.GamepadButton
  GAMEPAD_BUTTON_RIGHT_TRIGGER_2* = 12.GamepadButton
  GAMEPAD_BUTTON_MIDDLE_LEFT* = 13.GamepadButton
  GAMEPAD_BUTTON_MIDDLE* = 14.GamepadButton
  GAMEPAD_BUTTON_MIDDLE_RIGHT* = 15.GamepadButton
  GAMEPAD_BUTTON_LEFT_THUMB* = 16.GamepadButton
  GAMEPAD_BUTTON_RIGHT_THUMB* = 17.GamepadButton
  GAMEPAD_AXIS_UNKNOWN* = (0).GamepadAxis
  GAMEPAD_AXIS_LEFT_X* = 1.GamepadAxis
  GAMEPAD_AXIS_LEFT_Y* = 2.GamepadAxis
  GAMEPAD_AXIS_RIGHT_X* = 3.GamepadAxis
  GAMEPAD_AXIS_RIGHT_Y* = 4.GamepadAxis
  GAMEPAD_AXIS_LEFT_TRIGGER* = 5.GamepadAxis
  GAMEPAD_AXIS_RIGHT_TRIGGER* = 6.GamepadAxis
  LOC_VERTEX_POSITION* = (0).ShaderLocationIndex
  LOC_VERTEX_TEXCOORD01* = 1.ShaderLocationIndex
  LOC_VERTEX_TEXCOORD02* = 2.ShaderLocationIndex
  LOC_VERTEX_NORMAL* = 3.ShaderLocationIndex
  LOC_VERTEX_TANGENT* = 4.ShaderLocationIndex
  LOC_VERTEX_COLOR* = 5.ShaderLocationIndex
  LOC_MATRIX_MVP* = 6.ShaderLocationIndex
  LOC_MATRIX_MODEL* = 7.ShaderLocationIndex
  LOC_MATRIX_VIEW* = 8.ShaderLocationIndex
  LOC_MATRIX_PROJECTION* = 9.ShaderLocationIndex
  LOC_VECTOR_VIEW* = 10.ShaderLocationIndex
  LOC_COLOR_DIFFUSE* = 11.ShaderLocationIndex
  LOC_COLOR_SPECULAR* = 12.ShaderLocationIndex
  LOC_COLOR_AMBIENT* = 13.ShaderLocationIndex
  LOC_MAP_ALBEDO* = 14.ShaderLocationIndex
  LOC_MAP_METALNESS* = 15.ShaderLocationIndex
  LOC_MAP_NORMAL* = 16.ShaderLocationIndex
  LOC_MAP_ROUGHNESS* = 17.ShaderLocationIndex
  LOC_MAP_OCCLUSION* = 18.ShaderLocationIndex
  LOC_MAP_EMISSION* = 19.ShaderLocationIndex
  LOC_MAP_HEIGHT* = 20.ShaderLocationIndex
  LOC_MAP_CUBEMAP* = 21.ShaderLocationIndex
  LOC_MAP_IRRADIANCE* = 22.ShaderLocationIndex
  LOC_MAP_PREFILTER* = 23.ShaderLocationIndex
  LOC_MAP_BRDF* = 24.ShaderLocationIndex
  UNIFORM_FLOAT* = (0).ShaderUniformDataType
  UNIFORM_VEC2* = 1.ShaderUniformDataType
  UNIFORM_VEC3* = 2.ShaderUniformDataType
  UNIFORM_VEC4* = 3.ShaderUniformDataType
  UNIFORM_INT* = 4.ShaderUniformDataType
  UNIFORM_IVEC2* = 5.ShaderUniformDataType
  UNIFORM_IVEC3* = 6.ShaderUniformDataType
  UNIFORM_IVEC4* = 7.ShaderUniformDataType
  UNIFORM_SAMPLER2D* = 8.ShaderUniformDataType
  MAP_ALBEDO* = (0).MaterialMapType
  MAP_METALNESS* = (1).MaterialMapType
  MAP_NORMAL* = (2).MaterialMapType
  MAP_ROUGHNESS* = (3).MaterialMapType
  MAP_OCCLUSION* = 4.MaterialMapType
  MAP_EMISSION* = 5.MaterialMapType
  MAP_HEIGHT* = 6.MaterialMapType
  MAP_CUBEMAP* = 7.MaterialMapType
  MAP_IRRADIANCE* = 8.MaterialMapType
  MAP_PREFILTER* = 9.MaterialMapType
  MAP_BRDF* = 10.MaterialMapType
  UNCOMPRESSED_GRAYSCALE* = (1).PixelFormat
  UNCOMPRESSED_GRAY_ALPHA* = 2.PixelFormat
  UNCOMPRESSED_R5G6B5* = 3.PixelFormat
  UNCOMPRESSED_R8G8B8* = 4.PixelFormat
  UNCOMPRESSED_R5G5B5A1* = 5.PixelFormat
  UNCOMPRESSED_R4G4B4A4* = 6.PixelFormat
  UNCOMPRESSED_R8G8B8A8* = 7.PixelFormat
  UNCOMPRESSED_R32* = 8.PixelFormat
  UNCOMPRESSED_R32G32B32* = 9.PixelFormat
  UNCOMPRESSED_R32G32B32A32* = 10.PixelFormat
  COMPRESSED_DXT1_RGB* = 11.PixelFormat
  COMPRESSED_DXT1_RGBA* = 12.PixelFormat
  COMPRESSED_DXT3_RGBA* = 13.PixelFormat
  COMPRESSED_DXT5_RGBA* = 14.PixelFormat
  COMPRESSED_ETC1_RGB* = 15.PixelFormat
  COMPRESSED_ETC2_RGB* = 16.PixelFormat
  COMPRESSED_ETC2_EAC_RGBA* = 17.PixelFormat
  COMPRESSED_PVRT_RGB* = 18.PixelFormat
  COMPRESSED_PVRT_RGBA* = 19.PixelFormat
  COMPRESSED_ASTC_4x4_RGBA* = 20.PixelFormat
  COMPRESSED_ASTC_8x8_RGBA* = 21.PixelFormat
  FILTER_POINT* = (0).TextureFilterMode
  FILTER_BILINEAR* = 1.TextureFilterMode
  FILTER_TRILINEAR* = 2.TextureFilterMode
  FILTER_ANISOTROPIC_4X* = 3.TextureFilterMode
  FILTER_ANISOTROPIC_8X* = 4.TextureFilterMode
  FILTER_ANISOTROPIC_16X* = 5.TextureFilterMode
  CUBEMAP_AUTO_DETECT* = (0).CubemapLayoutType
  CUBEMAP_LINE_VERTICAL* = 1.CubemapLayoutType
  CUBEMAP_LINE_HORIZONTAL* = 2.CubemapLayoutType
  CUBEMAP_CROSS_THREE_BY_FOUR* = 3.CubemapLayoutType
  CUBEMAP_CROSS_FOUR_BY_THREE* = 4.CubemapLayoutType
  CUBEMAP_PANORAMA* = 5.CubemapLayoutType
  WRAP_REPEAT* = (0).TextureWrapMode
  WRAP_CLAMP* = 1.TextureWrapMode
  WRAP_MIRROR_REPEAT* = 2.TextureWrapMode
  WRAP_MIRROR_CLAMP* = 3.TextureWrapMode
  FONT_DEFAULT* = (0).FontType
  FONT_BITMAP* = 1.FontType
  FONT_SDF* = 2.FontType
  BLEND_ALPHA* = (0).BlendMode
  BLEND_ADDITIVE* = 1.BlendMode
  BLEND_MULTIPLIED* = 2.BlendMode
  GESTURE_NONE* = (0).GestureType
  GESTURE_TAP* = (1).GestureType
  GESTURE_DOUBLETAP* = (2).GestureType
  GESTURE_HOLD* = (4).GestureType
  GESTURE_DRAG* = (8).GestureType
  GESTURE_SWIPE_RIGHT* = (16).GestureType
  GESTURE_SWIPE_LEFT* = (32).GestureType
  GESTURE_SWIPE_UP* = (64).GestureType
  GESTURE_SWIPE_DOWN* = (128).GestureType
  GESTURE_PINCH_IN* = (256).GestureType
  GESTURE_PINCH_OUT* = (512).GestureType
  CAMERA_CUSTOM* = (0).CameraMode
  CAMERA_FREE* = 1.CameraMode
  CAMERA_ORBITAL* = 2.CameraMode
  CAMERA_FIRST_PERSON* = 3.CameraMode
  CAMERA_THIRD_PERSON* = 4.CameraMode
  CAMERA_PERSPECTIVE* = (0).CameraType
  CAMERA_ORTHOGRAPHIC* = 1.CameraType
  NPT_9PATCH* = (0).NPatchType
  NPT_3PATCH_VERTICAL* = 1.NPatchType
  NPT_3PATCH_HORIZONTAL* = 2.NPatchType

{.pragma: impraylib, importc, header: headerraylib.}
{.pragma: impraylibC, impraylib, cdecl.}

type
  MusicData = object

  #  Allow custom memory allocators
  #  NOTE: MSC C++ compiler does not support compound literals (C99 feature)
  #  Plain structures in C++ (without constructors) can be initialized from { } initializers.
  #  Some Basic Colors
  #  NOTE: Custom raylib color palette for amazing visuals on WHITE background
  #  Temporal hack to avoid breaking old codebases using
  #  deprecated raylib implementation of these functions
  # ----------------------------------------------------------------------------------
  #  Structures Definition
  # ----------------------------------------------------------------------------------
  #  Boolean type
  #  Vector2 type
  Vector2* {.importc: "struct Vector2", header: headerraylib, bycopy.} = object
    x*: cfloat
    y*: cfloat

  #  Vector3 type
  Vector3* {.importc: "struct Vector3", header: headerraylib, bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat

  #  Vector4 type
  Vector4* {.importc: "struct Vector4", header: headerraylib, bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

  #  Quaternion type, same as Vector4
  Quaternion* {.impraylib.} = Vector4

  #  Matrix type (OpenGL style 4x4 - right handed, column major)
  Matrix* {.importc: "struct Matrix", header: headerraylib, bycopy.} = object
    m0*: cfloat
    m4*: cfloat
    m8*: cfloat
    m12*: cfloat
    m1*: cfloat
    m5*: cfloat
    m9*: cfloat
    m13*: cfloat
    m2*: cfloat
    m6*: cfloat
    m10*: cfloat
    m14*: cfloat
    m3*: cfloat
    m7*: cfloat
    m11*: cfloat
    m15*: cfloat

  #  Color type, RGBA (32bit)
  Color* {.importc: "struct Color", header: headerraylib, bycopy.} = object
    r*: cuchar
    g*: cuchar
    b*: cuchar
    a*: cuchar

  #  Rectangle type
  Rectangle* {.importc: "struct Rectangle", header: headerraylib, bycopy.} = object
    x*: cfloat
    y*: cfloat
    width*: cfloat
    height*: cfloat

  #  Image type, bpp always RGBA (32bit)
  #  NOTE: Data stored in CPU memory (RAM)
  Image* {.importc: "struct Image", header: headerraylib, bycopy.} = object
    data*: pointer
    width*: cint
    height*: cint
    mipmaps*: cint
    format*: cint

  #  Texture2D type
  #  NOTE: Data stored in GPU memory
  Texture2D* {.importc: "struct Texture2D", header: headerraylib, bycopy.} = object
    id*: cuint
    width*: cint
    height*: cint
    mipmaps*: cint
    format*: cint

  #  Texture type, same as Texture2D
  Texture* {.impraylib.} = Texture2D

  #  TextureCubemap type, actually, same as Texture2D
  TextureCubemap* {.impraylib.} = Texture2D

  #  RenderTexture2D type, for texture rendering
  RenderTexture2D* {.importc: "struct RenderTexture2D", header: headerraylib, bycopy.} = object
    id*: cuint
    texture*: Texture2D
    depth*: Texture2D
    depthTexture*: bool

  #  RenderTexture type, same as RenderTexture2D
  RenderTexture* {.impraylib.} = RenderTexture2D

  #  N-Patch layout info
  NPatchInfo* {.importc: "struct NPatchInfo", header: headerraylib, bycopy.} = object
    sourceRec*: Rectangle
    left*: cint
    top*: cint
    right*: cint
    bottom*: cint
    `type`*: cint

  #  Font character info
  CharInfo* {.importc: "struct CharInfo", header: headerraylib, bycopy.} = object
    value*: cint
    rec*: Rectangle
    offsetX*: cint
    offsetY*: cint
    advanceX*: cint
    data*: ptr cuchar

  #  Font type, includes texture and charSet array data
  Font* {.importc: "struct Font", header: headerraylib, bycopy.} = object
    texture*: Texture2D
    baseSize*: cint
    charsCount*: cint
    chars*: ptr CharInfo

  #  Camera type, defines a camera position/orientation in 3d space
  Camera3D* {.importc: "struct Camera3D", header: headerraylib, bycopy.} = object
    position*: Vector3
    target*: Vector3
    up*: Vector3
    fovy*: cfloat
    `type`*: cint
  Camera* {.impraylib.} = Camera3D

  #  Camera type fallback, defaults to Camera3D
  #  Camera2D type, defines a 2d camera
  Camera2D* {.importc: "struct Camera2D", header: headerraylib, bycopy.} = object
    offset*: Vector2
    target*: Vector2
    rotation*: cfloat
    zoom*: cfloat

  #  Vertex data definning a mesh
  #  NOTE: Data stored in CPU memory (and GPU)
  Mesh* {.importc: "struct Mesh", header: headerraylib, bycopy.} = object
    vertexCount*: cint
    triangleCount*: cint
    vertices*: ptr cfloat
    texcoords*: ptr cfloat
    texcoords2*: ptr cfloat
    normals*: ptr cfloat
    tangents*: ptr cfloat
    colors*: ptr cuchar
    indices*: ptr cushort
    animVertices*: ptr cfloat
    animNormals*: ptr cfloat
    boneIds*: ptr cint
    boneWeights*: ptr cfloat
    vaoId*: cuint
    vboId*: array[7, cuint]

  #  Shader type (generic)
  Shader* {.importc: "struct Shader", header: headerraylib, bycopy.} = object
    id*: cuint
    locs*: array[32, cint]

  #  Material texture map
  MaterialMap* {.importc: "struct MaterialMap", header: headerraylib, bycopy.} = object
    texture*: Texture2D
    color*: Color
    value*: cfloat

  #  Material type (generic)
  Material* {.importc: "struct Material", header: headerraylib, bycopy.} = object
    shader*: Shader
    maps*: array[12, MaterialMap]
    params*: ptr cfloat

  #  Transformation properties
  Transform* {.importc: "struct Transform", header: headerraylib, bycopy.} = object
    translation*: Vector3
    rotation*: Quaternion
    scale*: Vector3

  #  Bone information
  BoneInfo* {.importc: "struct BoneInfo", header: headerraylib, bycopy.} = object
    name*: array[32, cchar]
    parent*: cint

  #  Model type
  Model* {.importc: "struct Model", header: headerraylib, bycopy.} = object
    transform*: Matrix
    meshCount*: cint
    meshes*: ptr Mesh
    materialCount*: cint
    materials*: ptr Material
    meshMaterial*: ptr cint
    boneCount*: cint
    bones*: ptr BoneInfo
    bindPose*: ptr Transform

  #  Model animation
  ModelAnimation* {.importc: "struct ModelAnimation", header: headerraylib, bycopy.} = object
    boneCount*: cint
    bones*: ptr BoneInfo
    frameCount*: cint
    framePoses*: ptr ptr Transform

  #  Ray type (useful for raycast)
  Ray* {.importc: "struct Ray", header: headerraylib, bycopy.} = object
    position*: Vector3
    direction*: Vector3

  #  Raycast hit information
  RayHitInfo* {.importc: "struct RayHitInfo", header: headerraylib, bycopy.} = object
    hit*: bool
    distance*: cfloat
    position*: Vector3
    normal*: Vector3

  #  Bounding box type
  BoundingBox* {.importc: "struct BoundingBox", header: headerraylib, bycopy.} = object
    min*: Vector3
    max*: Vector3

  #  Wave type, defines audio wave data
  Wave* {.importc: "struct Wave", header: headerraylib, bycopy.} = object
    sampleCount*: cuint
    sampleRate*: cuint
    sampleSize*: cuint
    channels*: cuint
    data*: pointer

  #  Sound source type
  Sound* {.importc: "struct Sound", header: headerraylib, bycopy.} = object
    audioBuffer*: pointer
    source*: cuint
    buffer*: cuint
    format*: cint

  #  Music type (file streaming from memory)
  #  NOTE: Anything longer than ~10 seconds should be streamed
  Music = ptr MusicData

  #  Audio stream type
  #  NOTE: Useful to create custom audio streams not bound to a specific file
  AudioStream* {.importc: "struct AudioStream", header: headerraylib, bycopy.} = object
    sampleRate*: cuint
    sampleSize*: cuint
    channels*: cuint
    audioBuffer*: pointer
    format*: cint
    source*: cuint
    buffers*: array[2, cuint]

  #  Head-Mounted-Display device parameters
  VrDeviceInfo* {.importc: "struct VrDeviceInfo", header: headerraylib, bycopy.} = object
    hResolution*: cint
    vResolution*: cint
    hScreenSize*: cfloat
    vScreenSize*: cfloat
    vScreenCenter*: cfloat
    eyeToScreenDistance*: cfloat
    lensSeparationDistance*: cfloat
    interpupillaryDistance*: cfloat
    lensDistortionValues*: array[4, cfloat]
    chromaAbCorrection*: array[4, cfloat]

  #  Callbacks to be implemented by users
  TraceLogCallback* {.impraylib.} = proc(logType: cint, text: cstring, args: va_list) {.cdecl.}



#  Prevents name mangling of functions
# ------------------------------------------------------------------------------------
#  Global Variables Definition
# ------------------------------------------------------------------------------------
#  It's lonely here...
# ------------------------------------------------------------------------------------
#  Window and Graphics Device Functions (Module: core)
# ------------------------------------------------------------------------------------
#  Window-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc InitWindow*(width: cint, height: cint, title: cstring) {.impraylibC.}

#  Initialize window and OpenGL context
#  We are building or using raylib as a static library (or Linux shared library)
proc WindowShouldClose*(): bool {.impraylibC.}

#  Check if KEY_ESCAPE pressed or Close icon pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc CloseWindow*() {.impraylibC.}

#  Close window and unload OpenGL context
#  We are building or using raylib as a static library (or Linux shared library)
proc IsWindowReady*(): bool {.impraylibC.}

#  Check if window has been initialized successfully
#  We are building or using raylib as a static library (or Linux shared library)
proc IsWindowMinimized*(): bool {.impraylibC.}

#  Check if window has been minimized (or lost focus)
#  We are building or using raylib as a static library (or Linux shared library)
proc IsWindowResized*(): bool {.impraylibC.}

#  Check if window has been resized
#  We are building or using raylib as a static library (or Linux shared library)
proc IsWindowHidden*(): bool {.impraylibC.}

#  Check if window is currently hidden
#  We are building or using raylib as a static library (or Linux shared library)
proc ToggleFullscreen*() {.impraylibC.}

#  Toggle fullscreen mode (only PLATFORM_DESKTOP)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnhideWindow*() {.impraylibC.}

#  Show the window
#  We are building or using raylib as a static library (or Linux shared library)
proc HideWindow*() {.impraylibC.}

#  Hide the window
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowIcon*(image: Image) {.impraylibC.}

#  Set icon for window (only PLATFORM_DESKTOP)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowTitle*(title: cstring) {.impraylibC.}

#  Set title for window (only PLATFORM_DESKTOP)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowPosition*(x: cint, y: cint) {.impraylibC.}

#  Set window position on screen (only PLATFORM_DESKTOP)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowMonitor*(monitor: cint) {.impraylibC.}

#  Set monitor for the current window (fullscreen mode)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowMinSize*(width: cint, height: cint) {.impraylibC.}

#  Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetWindowSize*(width: cint, height: cint) {.impraylibC.}

#  Set window dimensions
#  We are building or using raylib as a static library (or Linux shared library)
proc GetWindowHandle*(): pointer {.impraylibC.}

#  Get native window handle
#  We are building or using raylib as a static library (or Linux shared library)
proc GetScreenWidth*(): cint {.impraylibC.}

#  Get current screen width
#  We are building or using raylib as a static library (or Linux shared library)
proc GetScreenHeight*(): cint {.impraylibC.}

#  Get current screen height
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorCount*(): cint {.impraylibC.}

#  Get number of connected monitors
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorWidth*(monitor: cint): cint {.impraylibC.}

#  Get primary monitor width
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorHeight*(monitor: cint): cint {.impraylibC.}

#  Get primary monitor height
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorPhysicalWidth*(monitor: cint): cint {.impraylibC.}

#  Get primary monitor physical width in millimetres
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorPhysicalHeight*(monitor: cint): cint {.impraylibC.}

#  Get primary monitor physical height in millimetres
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMonitorName*(monitor: cint): cstring {.impraylibC.}

#  Get the human-readable, UTF-8 encoded name of the primary monitor
#  We are building or using raylib as a static library (or Linux shared library)
proc GetClipboardText*(): cstring {.impraylibC.}

#  Get clipboard text content
#  We are building or using raylib as a static library (or Linux shared library)
proc SetClipboardText*(text: cstring) {.impraylibC.}

#  Set clipboard text content
#  Cursor-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc ShowCursor*() {.impraylibC.}

#  Shows cursor
#  We are building or using raylib as a static library (or Linux shared library)
proc HideCursor*() {.impraylibC.}

#  Hides cursor
#  We are building or using raylib as a static library (or Linux shared library)
proc IsCursorHidden*(): bool {.impraylibC.}

#  Check if cursor is not visible
#  We are building or using raylib as a static library (or Linux shared library)
proc EnableCursor*() {.impraylibC.}

#  Enables cursor (unlock cursor)
#  We are building or using raylib as a static library (or Linux shared library)
proc DisableCursor*() {.impraylibC.}

#  Disables cursor (lock cursor)
#  Drawing-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc ClearBackground*(color: Color) {.impraylibC.}

#  Set background color (framebuffer clear color)
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginDrawing*() {.impraylibC.}

#  Setup canvas (framebuffer) to start drawing
#  We are building or using raylib as a static library (or Linux shared library)
proc EndDrawing*() {.impraylibC.}

#  End canvas drawing and swap buffers (double buffering)
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginMode2D*(camera: Camera2D) {.impraylibC.}

#  Initialize 2D mode with custom camera (2D)
#  We are building or using raylib as a static library (or Linux shared library)
proc EndMode2D*() {.impraylibC.}

#  Ends 2D mode with custom camera
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginMode3D*(camera: Camera3D) {.impraylibC.}

#  Initializes 3D mode with custom camera (3D)
#  We are building or using raylib as a static library (or Linux shared library)
proc EndMode3D*() {.impraylibC.}

#  Ends 3D mode and returns to default 2D orthographic mode
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginTextureMode*(target: RenderTexture2D) {.impraylibC.}

#  Initializes render texture for drawing
#  We are building or using raylib as a static library (or Linux shared library)
proc EndTextureMode*() {.impraylibC.}

#  Ends drawing to render texture
#  Screen-space-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMouseRay*(mousePosition: Vector2, camera: Camera): Ray {.impraylibC.}

#  Returns a ray trace from mouse position
#  We are building or using raylib as a static library (or Linux shared library)
proc GetWorldToScreen*(position: Vector3, camera: Camera): Vector2 {.impraylibC.}

#  Returns the screen space position for a 3d world space position
#  We are building or using raylib as a static library (or Linux shared library)
proc GetCameraMatrix*(camera: Camera): Matrix {.impraylibC.}

#  Returns camera transform matrix (view matrix)
#  Timing-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTargetFPS*(fps: cint) {.impraylibC.}

#  Set target FPS (maximum)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFPS*(): cint {.impraylibC.}

#  Returns current FPS
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFrameTime*(): cfloat {.impraylibC.}

#  Returns time in seconds for last frame drawn
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTime*(): cdouble {.impraylibC.}

#  Returns elapsed time in seconds since InitWindow()
#  Color-related functions
#  We are building or using raylib as a static library (or Linux shared library)
proc ColorToInt*(color: Color): cint {.impraylibC.}

#  Returns hexadecimal value for a Color
#  We are building or using raylib as a static library (or Linux shared library)
proc ColorNormalize*(color: Color): Vector4 {.impraylibC.}

#  Returns color normalized as float [0..1]
#  We are building or using raylib as a static library (or Linux shared library)
proc ColorToHSV*(color: Color): Vector3 {.impraylibC.}

#  Returns HSV values for a Color
#  We are building or using raylib as a static library (or Linux shared library)
proc ColorFromHSV*(hsv: Vector3): Color {.impraylibC.}

#  Returns a Color from HSV values
#  We are building or using raylib as a static library (or Linux shared library)
proc GetColor*(hexValue: cint): Color {.impraylibC.}

#  Returns a Color struct from hexadecimal value
#  We are building or using raylib as a static library (or Linux shared library)
proc Fade*(color: Color, alpha: cfloat): Color {.impraylibC.}

#  Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
#  Misc. functions
#  We are building or using raylib as a static library (or Linux shared library)
proc SetConfigFlags*(flags: cuchar) {.impraylibC.}

#  Setup window configuration flags (view FLAGS)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTraceLogLevel*(logType: cint) {.impraylibC.}

#  Set the current threshold (minimum) log level
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTraceLogExit*(logType: cint) {.impraylibC.}

#  Set the exit threshold (minimum) log level
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTraceLogCallback*(callback: TraceLogCallback) {.impraylibC.}

#  Set a trace log callback to enable custom logging
#  We are building or using raylib as a static library (or Linux shared library)
proc TraceLog*(logType: cint, text: cstring) {.impraylibC.}

#  Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
#  We are building or using raylib as a static library (or Linux shared library)
proc TakeScreenshot*(fileName: cstring) {.impraylibC.}

#  Takes a screenshot of current screen (saved a .png)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetRandomValue*(min: cint, max: cint): cint {.impraylibC.}

#  Returns a random value between min and max (both included)
#  Files management functions
#  We are building or using raylib as a static library (or Linux shared library)
proc FileExists*(fileName: cstring): bool {.impraylibC.}

#  Check if file exists
#  We are building or using raylib as a static library (or Linux shared library)
proc IsFileExtension*(fileName: cstring, ext: cstring): bool {.impraylibC.}

#  Check file extension
#  We are building or using raylib as a static library (or Linux shared library)
proc GetExtension*(fileName: cstring): cstring {.impraylibC.}

#  Get pointer to extension for a filename string
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFileName*(filePath: cstring): cstring {.impraylibC.}

#  Get pointer to filename for a path string
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFileNameWithoutExt*(filePath: cstring): cstring {.impraylibC.}

#  Get filename string without extension (memory should be freed)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetDirectoryPath*(fileName: cstring): cstring {.impraylibC.}

#  Get full path for a given fileName (uses static string)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetWorkingDirectory*(): cstring {.impraylibC.}

#  Get current working directory (uses static string)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetDirectoryFiles*(dirPath: cstring, count: ptr cint): ptr cstring {.impraylibC.}

#  Get filenames in a directory path (memory should be freed)
#  We are building or using raylib as a static library (or Linux shared library)
proc ClearDirectoryFiles*() {.impraylibC.}

#  Clear directory files paths buffers (free memory)
#  We are building or using raylib as a static library (or Linux shared library)
proc ChangeDirectory*(dir: cstring): bool {.impraylibC.}

#  Change working directory, returns true if success
#  We are building or using raylib as a static library (or Linux shared library)
proc IsFileDropped*(): bool {.impraylibC.}

#  Check if a file has been dropped into window
#  We are building or using raylib as a static library (or Linux shared library)
proc GetDroppedFiles*(count: ptr cint): ptr cstring {.impraylibC.}

#  Get dropped files names (memory should be freed)
#  We are building or using raylib as a static library (or Linux shared library)
proc ClearDroppedFiles*() {.impraylibC.}

#  Clear dropped files paths buffer (free memory)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFileModTime*(fileName: cstring): clong {.impraylibC.}

#  Get file modification time (last write time)
#  Persistent storage management
#  We are building or using raylib as a static library (or Linux shared library)
proc StorageSaveValue*(position: cint, value: cint) {.impraylibC.}

#  Save integer value to storage file (to defined position)
#  We are building or using raylib as a static library (or Linux shared library)
proc StorageLoadValue*(position: cint): cint {.impraylibC.}

#  Load integer value from storage file (from defined position)
#  We are building or using raylib as a static library (or Linux shared library)
proc OpenURL*(url: cstring) {.impraylibC.}

#  Open URL with default system browser (if available)
# ------------------------------------------------------------------------------------
#  Input Handling Functions (Module: core)
# ------------------------------------------------------------------------------------
#  Input-related functions: keyboard
#  We are building or using raylib as a static library (or Linux shared library)
proc IsKeyPressed*(key: cint): bool {.impraylibC.}

#  Detect if a key has been pressed once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsKeyDown*(key: cint): bool {.impraylibC.}

#  Detect if a key is being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc IsKeyReleased*(key: cint): bool {.impraylibC.}

#  Detect if a key has been released once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsKeyUp*(key: cint): bool {.impraylibC.}

#  Detect if a key is NOT being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc GetKeyPressed*(): cint {.impraylibC.}

#  Get latest key pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc SetExitKey*(key: cint) {.impraylibC.}

#  Set a custom key to exit program (default is ESC)
#  Input-related functions: gamepads
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadAvailable*(gamepad: cint): bool {.impraylibC.}

#  Detect if a gamepad is available
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadName*(gamepad: cint, name: cstring): bool {.impraylibC.}

#  Check gamepad name (if available)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGamepadName*(gamepad: cint): cstring {.impraylibC.}

#  Return gamepad internal name id
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadButtonPressed*(gamepad: cint, button: cint): bool {.impraylibC.}

#  Detect if a gamepad button has been pressed once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadButtonDown*(gamepad: cint, button: cint): bool {.impraylibC.}

#  Detect if a gamepad button is being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadButtonReleased*(gamepad: cint, button: cint): bool {.impraylibC.}

#  Detect if a gamepad button has been released once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGamepadButtonUp*(gamepad: cint, button: cint): bool {.impraylibC.}

#  Detect if a gamepad button is NOT being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGamepadButtonPressed*(): cint {.impraylibC.}

#  Get the last gamepad button pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGamepadAxisCount*(gamepad: cint): cint {.impraylibC.}

#  Return gamepad axis count for a gamepad
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGamepadAxisMovement*(gamepad: cint, axis: cint): cfloat {.impraylibC.}

#  Return axis movement value for a gamepad axis
#  Input-related functions: mouse
#  We are building or using raylib as a static library (or Linux shared library)
proc IsMouseButtonPressed*(button: cint): bool {.impraylibC.}

#  Detect if a mouse button has been pressed once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsMouseButtonDown*(button: cint): bool {.impraylibC.}

#  Detect if a mouse button is being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc IsMouseButtonReleased*(button: cint): bool {.impraylibC.}

#  Detect if a mouse button has been released once
#  We are building or using raylib as a static library (or Linux shared library)
proc IsMouseButtonUp*(button: cint): bool {.impraylibC.}

#  Detect if a mouse button is NOT being pressed
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMouseX*(): cint {.impraylibC.}

#  Returns mouse position X
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMouseY*(): cint {.impraylibC.}

#  Returns mouse position Y
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMousePosition*(): Vector2 {.impraylibC.}

#  Returns mouse position XY
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMousePosition*(x: cint, y: cint) {.impraylibC.}

#  Set mouse position XY
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMouseOffset*(offsetX: cint, offsetY: cint) {.impraylibC.}

#  Set mouse offset
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMouseScale*(scaleX: cfloat, scaleY: cfloat) {.impraylibC.}

#  Set mouse scaling
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMouseWheelMove*(): cint {.impraylibC.}

#  Returns mouse wheel movement Y
#  Input-related functions: touch
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTouchX*(): cint {.impraylibC.}

#  Returns touch position X for touch point 0 (relative to screen size)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTouchY*(): cint {.impraylibC.}

#  Returns touch position Y for touch point 0 (relative to screen size)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTouchPosition*(index: cint): Vector2 {.impraylibC.}

#  Returns touch position XY for a touch point index (relative to screen size)
# ------------------------------------------------------------------------------------
#  Gestures and Touch Handling Functions (Module: gestures)
# ------------------------------------------------------------------------------------
#  We are building or using raylib as a static library (or Linux shared library)
proc SetGesturesEnabled*(gestureFlags: cuint) {.impraylibC.}

#  Enable a set of gestures using flags
#  We are building or using raylib as a static library (or Linux shared library)
proc IsGestureDetected*(gesture: cint): bool {.impraylibC.}

#  Check if a gesture have been detected
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGestureDetected*(): cint {.impraylibC.}

#  Get latest detected gesture
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTouchPointsCount*(): cint {.impraylibC.}

#  Get touch points count
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGestureHoldDuration*(): cfloat {.impraylibC.}

#  Get gesture hold time in milliseconds
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGestureDragVector*(): Vector2 {.impraylibC.}

#  Get gesture drag vector
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGestureDragAngle*(): cfloat {.impraylibC.}

#  Get gesture drag angle
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGesturePinchVector*(): Vector2 {.impraylibC.}

#  Get gesture pinch delta
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGesturePinchAngle*(): cfloat {.impraylibC.}

#  Get gesture pinch angle
# ------------------------------------------------------------------------------------
#  Camera System Functions (Module: camera)
# ------------------------------------------------------------------------------------
#  We are building or using raylib as a static library (or Linux shared library)
proc SetCameraMode*(camera: Camera, mode: cint) {.impraylibC.}

#  Set camera mode (multiple camera modes available)
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateCamera*(camera: ptr Camera) {.impraylibC.}

#  Update camera position for selected mode
#  We are building or using raylib as a static library (or Linux shared library)
proc SetCameraPanControl*(panKey: cint) {.impraylibC.}

#  Set camera pan key to combine with mouse movement (free camera)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetCameraAltControl*(altKey: cint) {.impraylibC.}

#  Set camera alt key to combine with mouse movement (free camera)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetCameraSmoothZoomControl*(szKey: cint) {.impraylibC.}

#  Set camera smooth zoom key to combine with mouse (free camera)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetCameraMoveControls*(frontKey: cint, backKey: cint, rightKey: cint, leftKey: cint, upKey: cint, downKey: cint) {.impraylibC.}

#  Set camera move controls (1st person and 3rd person cameras)
# ------------------------------------------------------------------------------------
#  Basic Shapes Drawing Functions (Module: shapes)
# ------------------------------------------------------------------------------------
#  Basic shapes drawing functions
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawPixel*(posX: cint, posY: cint, color: Color) {.impraylibC.}

#  Draw a pixel
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawPixelV*(position: Vector2, color: Color) {.impraylibC.}

#  Draw a pixel (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLine*(startPosX: cint, startPosY: cint, endPosX: cint, endPosY: cint, color: Color) {.impraylibC.}

#  Draw a line
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLineV*(startPos: Vector2, endPos: Vector2, color: Color) {.impraylibC.}

#  Draw a line (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLineEx*(startPos: Vector2, endPos: Vector2, thick: cfloat, color: Color) {.impraylibC.}

#  Draw a line defining thickness
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLineBezier*(startPos: Vector2, endPos: Vector2, thick: cfloat, color: Color) {.impraylibC.}

#  Draw a line using cubic-bezier curves in-out
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLineStrip*(points: ptr Vector2, numPoints: cint, color: Color) {.impraylibC.}

#  Draw lines sequence
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircle*(centerX: cint, centerY: cint, radius: cfloat, color: Color) {.impraylibC.}

#  Draw a color-filled circle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircleSector*(center: Vector2, radius: cfloat, startAngle: cint, endAngle: cint, segments: cint, color: Color) {.impraylibC.}

#  Draw a piece of a circle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircleSectorLines*(center: Vector2, radius: cfloat, startAngle: cint, endAngle: cint, segments: cint, color: Color) {.impraylibC.}

#  Draw circle sector outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircleGradient*(centerX: cint, centerY: cint, radius: cfloat, color1: Color, color2: Color) {.impraylibC.}

#  Draw a gradient-filled circle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircleV*(center: Vector2, radius: cfloat, color: Color) {.impraylibC.}

#  Draw a color-filled circle (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircleLines*(centerX: cint, centerY: cint, radius: cfloat, color: Color) {.impraylibC.}

#  Draw circle outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRing*(center: Vector2, innerRadius: cfloat, outerRadius: cfloat, startAngle: cint, endAngle: cint, segments: cint, color: Color) {.impraylibC.}

#  Draw ring
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRingLines*(center: Vector2, innerRadius: cfloat, outerRadius: cfloat, startAngle: cint, endAngle: cint, segments: cint, color: Color) {.impraylibC.}

#  Draw ring outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangle*(posX: cint, posY: cint, width: cint, height: cint, color: Color) {.impraylibC.}

#  Draw a color-filled rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleV*(position: Vector2, size: Vector2, color: Color) {.impraylibC.}

#  Draw a color-filled rectangle (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleRec*(rec: Rectangle, color: Color) {.impraylibC.}

#  Draw a color-filled rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectanglePro*(rec: Rectangle, origin: Vector2, rotation: cfloat, color: Color) {.impraylibC.}

#  Draw a color-filled rectangle with pro parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleGradientV*(posX: cint, posY: cint, width: cint, height: cint, color1: Color, color2: Color) {.impraylibC.}

#  Draw a vertical-gradient-filled rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleGradientH*(posX: cint, posY: cint, width: cint, height: cint, color1: Color, color2: Color) {.impraylibC.}

#  Draw a horizontal-gradient-filled rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleGradientEx*(rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) {.impraylibC.}

#  Draw a gradient-filled rectangle with custom vertex colors
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleLines*(posX: cint, posY: cint, width: cint, height: cint, color: Color) {.impraylibC.}

#  Draw rectangle outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleLinesEx*(rec: Rectangle, lineThick: cint, color: Color) {.impraylibC.}

#  Draw rectangle outline with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleRounded*(rec: Rectangle, roundness: cfloat, segments: cint, color: Color) {.impraylibC.}

#  Draw rectangle with rounded edges
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRectangleRoundedLines*(rec: Rectangle, roundness: cfloat, segments: cint, lineThick: cint, color: Color) {.impraylibC.}

#  Draw rectangle with rounded edges outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTriangle*(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) {.impraylibC.}

#  Draw a color-filled triangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTriangleLines*(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) {.impraylibC.}

#  Draw triangle outline
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTriangleFan*(points: ptr Vector2, numPoints: cint, color: Color) {.impraylibC.}

#  Draw a triangle fan defined by points
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawPoly*(center: Vector2, sides: cint, radius: cfloat, rotation: cfloat, color: Color) {.impraylibC.}

#  Draw a regular polygon (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetShapesTexture*(texture: Texture2D, source: Rectangle) {.impraylibC.}

#  Define default texture used to draw shapes
#  Basic shapes collision detection functions
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionRecs*(rec1: Rectangle, rec2: Rectangle): bool {.impraylibC.}

#  Check collision between two rectangles
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionCircles*(center1: Vector2, radius1: cfloat, center2: Vector2, radius2: cfloat): bool {.impraylibC.}

#  Check collision between two circles
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionCircleRec*(center: Vector2, radius: cfloat, rec: Rectangle): bool {.impraylibC.}

#  Check collision between circle and rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc GetCollisionRec*(rec1: Rectangle, rec2: Rectangle): Rectangle {.impraylibC.}

#  Get collision rectangle for two rectangles collision
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionPointRec*(point: Vector2, rec: Rectangle): bool {.impraylibC.}

#  Check if point is inside rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionPointCircle*(point: Vector2, center: Vector2, radius: cfloat): bool {.impraylibC.}

#  Check if point is inside circle
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionPointTriangle*(point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2): bool {.impraylibC.}

#  Check if point is inside a triangle
# ------------------------------------------------------------------------------------
#  Texture Loading and Drawing Functions (Module: textures)
# ------------------------------------------------------------------------------------
#  Image/Texture2D data loading/unloading/saving functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadImage*(fileName: cstring): Image {.impraylibC.}

#  Load image from file into CPU memory (RAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadImageEx*(pixels: ptr Color, width: cint, height: cint): Image {.impraylibC.}

#  Load image from Color array data (RGBA - 32bit)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadImagePro*(data: pointer, width: cint, height: cint, format: cint): Image {.impraylibC.}

#  Load image from raw data with parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadImageRaw*(fileName: cstring, width: cint, height: cint, format: cint, headerSize: cint): Image {.impraylibC.}

#  Load image from RAW file data
#  We are building or using raylib as a static library (or Linux shared library)
proc ExportImage*(image: Image, fileName: cstring) {.impraylibC.}

#  Export image data to file
#  We are building or using raylib as a static library (or Linux shared library)
proc ExportImageAsCode*(image: Image, fileName: cstring) {.impraylibC.}

#  Export image as code file defining an array of bytes
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadTexture*(fileName: cstring): Texture2D {.impraylibC.}

#  Load texture from file into GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadTextureFromImage*(image: Image): Texture2D {.impraylibC.}

#  Load texture from image data
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadTextureCubemap*(image: Image, layoutType: cint): TextureCubemap {.impraylibC.}

#  Load cubemap from image, multiple image cubemap layouts supported
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadRenderTexture*(width: cint, height: cint): RenderTexture2D {.impraylibC.}

#  Load texture for rendering (framebuffer)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadImage*(image: Image) {.impraylibC.}

#  Unload image from CPU memory (RAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadTexture*(texture: Texture2D) {.impraylibC.}

#  Unload texture from GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadRenderTexture*(target: RenderTexture2D) {.impraylibC.}

#  Unload render texture from GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetImageData*(image: Image): ptr Color {.impraylibC.}

#  Get pixel data from image as a Color struct array
#  We are building or using raylib as a static library (or Linux shared library)
proc GetImageDataNormalized*(image: Image): ptr Vector4 {.impraylibC.}

#  Get pixel data from image as Vector4 array (float normalized)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetPixelDataSize*(width: cint, height: cint, format: cint): cint {.impraylibC.}

#  Get pixel data size in bytes (image or texture)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTextureData*(texture: Texture2D): Image {.impraylibC.}

#  Get pixel data from GPU texture and return an Image
#  We are building or using raylib as a static library (or Linux shared library)
proc GetScreenData*(): Image {.impraylibC.}

#  Get pixel data from screen buffer and return an Image (screenshot)
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateTexture*(texture: Texture2D, pixels: pointer) {.impraylibC.}

#  Update GPU texture with new data
#  Image manipulation functions
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageCopy*(image: Image): Image {.impraylibC.}

#  Create an image duplicate (useful for transformations)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageToPOT*(image: ptr Image, fillColor: Color) {.impraylibC.}

#  Convert image to POT (power-of-two)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageFormat*(image: ptr Image, newFormat: cint) {.impraylibC.}

#  Convert image data to desired format
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageAlphaMask*(image: ptr Image, alphaMask: Image) {.impraylibC.}

#  Apply alpha mask to image
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageAlphaClear*(image: ptr Image, color: Color, threshold: cfloat) {.impraylibC.}

#  Clear alpha channel to desired color
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageAlphaCrop*(image: ptr Image, threshold: cfloat) {.impraylibC.}

#  Crop image depending on alpha value
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageAlphaPremultiply*(image: ptr Image) {.impraylibC.}

#  Premultiply alpha channel
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageCrop*(image: ptr Image, crop: Rectangle) {.impraylibC.}

#  Crop an image to a defined rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageResize*(image: ptr Image, newWidth: cint, newHeight: cint) {.impraylibC.}

#  Resize image (Bicubic scaling algorithm)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageResizeNN*(image: ptr Image, newWidth: cint, newHeight: cint) {.impraylibC.}

#  Resize image (Nearest-Neighbor scaling algorithm)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageResizeCanvas*(image: ptr Image, newWidth: cint, newHeight: cint, offsetX: cint, offsetY: cint, color: Color) {.impraylibC.}

#  Resize canvas and fill with color
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageMipmaps*(image: ptr Image) {.impraylibC.}

#  Generate all mipmap levels for a provided image
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDither*(image: ptr Image, rBpp: cint, gBpp: cint, bBpp: cint, aBpp: cint) {.impraylibC.}

#  Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageExtractPalette*(image: Image, maxPaletteSize: cint, extractCount: ptr cint): ptr Color {.impraylibC.}

#  Extract color palette from image to maximum size (memory should be freed)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageText*(text: cstring, fontSize: cint, color: Color): Image {.impraylibC.}

#  Create an image from text (default font)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageTextEx*(font: Font, text: cstring, fontSize: cfloat, spacing: cfloat, tint: Color): Image {.impraylibC.}

#  Create an image from text (custom sprite font)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDraw*(dst: ptr Image, src: Image, srcRec: Rectangle, dstRec: Rectangle) {.impraylibC.}

#  Draw a source image within a destination image
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDrawRectangle*(dst: ptr Image, rec: Rectangle, color: Color) {.impraylibC.}

#  Draw rectangle within an image
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDrawRectangleLines*(dst: ptr Image, rec: Rectangle, thick: cint, color: Color) {.impraylibC.}

#  Draw rectangle lines within an image
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDrawText*(dst: ptr Image, position: Vector2, text: cstring, fontSize: cint, color: Color) {.impraylibC.}

#  Draw text (default font) within an image (destination)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageDrawTextEx*(dst: ptr Image, position: Vector2, font: Font, text: cstring, fontSize: cfloat, spacing: cfloat, color: Color) {.impraylibC.}

#  Draw text (custom sprite font) within an image (destination)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageFlipVertical*(image: ptr Image) {.impraylibC.}

#  Flip image vertically
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageFlipHorizontal*(image: ptr Image) {.impraylibC.}

#  Flip image horizontally
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageRotateCW*(image: ptr Image) {.impraylibC.}

#  Rotate image clockwise 90deg
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageRotateCCW*(image: ptr Image) {.impraylibC.}

#  Rotate image counter-clockwise 90deg
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorTint*(image: ptr Image, color: Color) {.impraylibC.}

#  Modify image color: tint
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorInvert*(image: ptr Image) {.impraylibC.}

#  Modify image color: invert
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorGrayscale*(image: ptr Image) {.impraylibC.}

#  Modify image color: grayscale
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorContrast*(image: ptr Image, contrast: cfloat) {.impraylibC.}

#  Modify image color: contrast (-100 to 100)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorBrightness*(image: ptr Image, brightness: cint) {.impraylibC.}

#  Modify image color: brightness (-255 to 255)
#  We are building or using raylib as a static library (or Linux shared library)
proc ImageColorReplace*(image: ptr Image, color: Color, replace: Color) {.impraylibC.}

#  Modify image color: replace color
#  Image generation functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageColor*(width: cint, height: cint, color: Color): Image {.impraylibC.}

#  Generate image: plain color
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageGradientV*(width: cint, height: cint, top: Color, bottom: Color): Image {.impraylibC.}

#  Generate image: vertical gradient
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageGradientH*(width: cint, height: cint, left: Color, right: Color): Image {.impraylibC.}

#  Generate image: horizontal gradient
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageGradientRadial*(width: cint, height: cint, density: cfloat, inner: Color, outer: Color): Image {.impraylibC.}

#  Generate image: radial gradient
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageChecked*(width: cint, height: cint, checksX: cint, checksY: cint, col1: Color, col2: Color): Image {.impraylibC.}

#  Generate image: checked
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageWhiteNoise*(width: cint, height: cint, factor: cfloat): Image {.impraylibC.}

#  Generate image: white noise
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImagePerlinNoise*(width: cint, height: cint, offsetX: cint, offsetY: cint, scale: cfloat): Image {.impraylibC.}

#  Generate image: perlin noise
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageCellular*(width: cint, height: cint, tileSize: cint): Image {.impraylibC.}

#  Generate image: cellular algorithm. Bigger tileSize means bigger cells
#  Texture2D configuration functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GenTextureMipmaps*(texture: ptr Texture2D) {.impraylibC.}

#  Generate GPU mipmaps for a texture
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTextureFilter*(texture: Texture2D, filterMode: cint) {.impraylibC.}

#  Set texture scaling filter mode
#  We are building or using raylib as a static library (or Linux shared library)
proc SetTextureWrap*(texture: Texture2D, wrapMode: cint) {.impraylibC.}

#  Set texture wrapping mode
#  Texture2D drawing functions
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTexture*(texture: Texture2D, posX: cint, posY: cint, tint: Color) {.impraylibC.}

#  Draw a Texture2D
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextureV*(texture: Texture2D, position: Vector2, tint: Color) {.impraylibC.}

#  Draw a Texture2D with position defined as Vector2
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextureEx*(texture: Texture2D, position: Vector2, rotation: cfloat, scale: cfloat, tint: Color) {.impraylibC.}

#  Draw a Texture2D with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextureRec*(texture: Texture2D, sourceRec: Rectangle, position: Vector2, tint: Color) {.impraylibC.}

#  Draw a part of a texture defined by a rectangle
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextureQuad*(texture: Texture2D, tiling: Vector2, offset: Vector2, quad: Rectangle, tint: Color) {.impraylibC.}

#  Draw texture quad with tiling and offset parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTexturePro*(texture: Texture2D, sourceRec: Rectangle, destRec: Rectangle, origin: Vector2, rotation: cfloat, tint: Color) {.impraylibC.}

#  Draw a part of a texture defined by a rectangle with 'pro' parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextureNPatch*(texture: Texture2D, nPatchInfo: NPatchInfo, destRec: Rectangle, origin: Vector2, rotation: cfloat, tint: Color) {.impraylibC.}

#  Draws a texture (or part of it) that stretches or shrinks nicely
# ------------------------------------------------------------------------------------
#  Font Loading and Text Drawing Functions (Module: text)
# ------------------------------------------------------------------------------------
#  Font loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GetFontDefault*(): Font {.impraylibC.}

#  Get the default Font
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadFont*(fileName: cstring): Font {.impraylibC.}

#  Load font from file into GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadFontEx*(fileName: cstring, fontSize: cint, fontChars: ptr cint, charsCount: cint): Font {.impraylibC.}

#  Load font from file with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadFontFromImage*(image: Image, key: Color, firstChar: cint): Font {.impraylibC.}

#  Load font from Image (XNA style)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadFontData*(fileName: cstring, fontSize: cint, fontChars: ptr cint, charsCount: cint, `type`: cint): ptr CharInfo {.impraylibC.}

#  Load font data for further use
#  We are building or using raylib as a static library (or Linux shared library)
proc GenImageFontAtlas*(chars: ptr CharInfo, charsCount: cint, fontSize: cint, padding: cint, packMethod: cint): Image {.impraylibC.}

#  Generate image font atlas using chars info
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadFont*(font: Font) {.impraylibC.}

#  Unload Font from GPU memory (VRAM)
#  Text drawing functions
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawFPS*(posX: cint, posY: cint) {.impraylibC.}

#  Shows current FPS
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawText*(text: cstring, posX: cint, posY: cint, fontSize: cint, color: Color) {.impraylibC.}

#  Draw text (using default font)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextEx*(font: Font, text: cstring, position: Vector2, fontSize: cfloat, spacing: cfloat, tint: Color) {.impraylibC.}

#  Draw text using font and additional parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextRec*(font: Font, text: cstring, rec: Rectangle, fontSize: cfloat, spacing: cfloat, wordWrap: bool, tint: Color) {.impraylibC.}

#  Draw text using font inside rectangle limits
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawTextRecEx*(font: Font, text: cstring, rec: Rectangle, fontSize: cfloat, spacing: cfloat, wordWrap: bool, tint: Color, selectStart: cint, selectLength: cint, selectText: Color, selectBack: Color) {.impraylibC.}

#  Draw text using font inside rectangle limits with support for text selection
#  Text misc. functions
#  We are building or using raylib as a static library (or Linux shared library)
proc MeasureText*(text: cstring, fontSize: cint): cint {.impraylibC.}

#  Measure string width for default font
#  We are building or using raylib as a static library (or Linux shared library)
proc MeasureTextEx*(font: Font, text: cstring, fontSize: cfloat, spacing: cfloat): Vector2 {.impraylibC.}

#  Measure string size for Font
#  We are building or using raylib as a static library (or Linux shared library)
proc GetGlyphIndex*(font: Font, character: cint): cint {.impraylibC.}

#  Get index position for a unicode character on font
#  We are building or using raylib as a static library (or Linux shared library)
proc GetNextCodepoint*(text: cstring, count: ptr cint): cint {.impraylibC.}

#  Returns next codepoint in a UTF8 encoded string
#  NOTE: 0x3f(`?`) is returned on failure, `count` will hold the total number of bytes processed
#  Text strings management functions
#  NOTE: Some strings allocate memory internally for returned strings, just be careful!
#  We are building or using raylib as a static library (or Linux shared library)
proc TextIsEqual*(text1: cstring, text2: cstring): bool {.impraylibC.}

#  Check if two text string are equal
#  We are building or using raylib as a static library (or Linux shared library)
proc TextLength*(text: cstring): cuint {.impraylibC.}

#  Get text length, checks for '\0' ending
#  We are building or using raylib as a static library (or Linux shared library)
proc TextCountCodepoints*(text: cstring): cuint {.impraylibC.}

#  Get total number of characters (codepoints) in a UTF8 encoded string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextFormat*(text: cstring): cstring {.impraylibC.}

#  Text formatting with variables (sprintf style)
#  We are building or using raylib as a static library (or Linux shared library)
proc TextSubtext*(text: cstring, position: cint, length: cint): cstring {.impraylibC.}

#  Get a piece of a text string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextReplace*(text: cstring, replace: cstring, by: cstring): cstring {.impraylibC.}

#  Replace text string (memory should be freed!)
#  We are building or using raylib as a static library (or Linux shared library)
proc TextInsert*(text: cstring, insert: cstring, position: cint): cstring {.impraylibC.}

#  Insert text in a position (memory should be freed!)
#  We are building or using raylib as a static library (or Linux shared library)
proc TextJoin*(textList: ptr cstring, count: cint, delimiter: cstring): cstring {.impraylibC.}

#  Join text strings with delimiter
#  We are building or using raylib as a static library (or Linux shared library)
proc TextSplit*(text: cstring, delimiter: cchar, count: ptr cint): ptr cstring {.impraylibC.}

#  Split text into multiple strings
#  We are building or using raylib as a static library (or Linux shared library)
proc TextAppend*(text: cstring, append: cstring, position: ptr cint) {.impraylibC.}

#  Append text at specific position and move cursor!
#  We are building or using raylib as a static library (or Linux shared library)
proc TextFindIndex*(text: cstring, find: cstring): cint {.impraylibC.}

#  Find first text occurrence within a string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextToUpper*(text: cstring): cstring {.impraylibC.}

#  Get upper case version of provided string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextToLower*(text: cstring): cstring {.impraylibC.}

#  Get lower case version of provided string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextToPascal*(text: cstring): cstring {.impraylibC.}

#  Get Pascal case notation version of provided string
#  We are building or using raylib as a static library (or Linux shared library)
proc TextToInteger*(text: cstring): cint {.impraylibC.}

#  Get integer value from text (negative values not supported)
# ------------------------------------------------------------------------------------
#  Basic 3d Shapes Drawing Functions (Module: models)
# ------------------------------------------------------------------------------------
#  Basic geometric 3D shapes drawing functions
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawLine3D*(startPos: Vector3, endPos: Vector3, color: Color) {.impraylibC.}

#  Draw a line in 3D world space
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCircle3D*(center: Vector3, radius: cfloat, rotationAxis: Vector3, rotationAngle: cfloat, color: Color) {.impraylibC.}

#  Draw a circle in 3D world space
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCube*(position: Vector3, width: cfloat, height: cfloat, length: cfloat, color: Color) {.impraylibC.}

#  Draw cube
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCubeV*(position: Vector3, size: Vector3, color: Color) {.impraylibC.}

#  Draw cube (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCubeWires*(position: Vector3, width: cfloat, height: cfloat, length: cfloat, color: Color) {.impraylibC.}

#  Draw cube wires
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCubeWiresV*(position: Vector3, size: Vector3, color: Color) {.impraylibC.}

#  Draw cube wires (Vector version)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCubeTexture*(texture: Texture2D, position: Vector3, width: cfloat, height: cfloat, length: cfloat, color: Color) {.impraylibC.}

#  Draw cube textured
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawSphere*(centerPos: Vector3, radius: cfloat, color: Color) {.impraylibC.}

#  Draw sphere
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawSphereEx*(centerPos: Vector3, radius: cfloat, rings: cint, slices: cint, color: Color) {.impraylibC.}

#  Draw sphere with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawSphereWires*(centerPos: Vector3, radius: cfloat, rings: cint, slices: cint, color: Color) {.impraylibC.}

#  Draw sphere wires
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCylinder*(position: Vector3, radiusTop: cfloat, radiusBottom: cfloat, height: cfloat, slices: cint, color: Color) {.impraylibC.}

#  Draw a cylinder/cone
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawCylinderWires*(position: Vector3, radiusTop: cfloat, radiusBottom: cfloat, height: cfloat, slices: cint, color: Color) {.impraylibC.}

#  Draw a cylinder/cone wires
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawPlane*(centerPos: Vector3, size: Vector2, color: Color) {.impraylibC.}

#  Draw a plane XZ
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawRay*(ray: Ray, color: Color) {.impraylibC.}

#  Draw a ray line
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawGrid*(slices: cint, spacing: cfloat) {.impraylibC.}

#  Draw a grid (centered at (0, 0, 0))
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawGizmo*(position: Vector3) {.impraylibC.}

#  Draw simple gizmo
# DrawTorus(), DrawTeapot() could be useful?
# ------------------------------------------------------------------------------------
#  Model 3d Loading and Drawing Functions (Module: models)
# ------------------------------------------------------------------------------------
#  Model loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadModel*(fileName: cstring): Model {.impraylibC.}

#  Load model from files (meshes and materials)
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadModelFromMesh*(mesh: Mesh): Model {.impraylibC.}

#  Load model from generated mesh (default material)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadModel*(model: Model) {.impraylibC.}

#  Unload model from memory (RAM and/or VRAM)
#  Mesh loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadMeshes*(fileName: cstring, meshCount: ptr cint): ptr Mesh {.impraylibC.}

#  Load meshes from model file
#  We are building or using raylib as a static library (or Linux shared library)
proc ExportMesh*(mesh: Mesh, fileName: cstring) {.impraylibC.}

#  Export mesh data to file
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadMesh*(mesh: ptr Mesh) {.impraylibC.}

#  Unload mesh from memory (RAM and/or VRAM)
#  Material loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadMaterials*(fileName: cstring, materialCount: ptr cint): ptr Material {.impraylibC.}

#  Load materials from model file
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadMaterialDefault*(): Material {.impraylibC.}

#  Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadMaterial*(material: Material) {.impraylibC.}

#  Unload material from GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMaterialTexture*(material: ptr Material, mapType: cint, texture: Texture2D) {.impraylibC.}

#  Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetModelMeshMaterial*(model: ptr Model, meshId: cint, materialId: cint) {.impraylibC.}

#  Set material for a mesh
#  Model animations loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadModelAnimations*(fileName: cstring, animsCount: ptr cint): ptr ModelAnimation {.impraylibC.}

#  Load model animations from file
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateModelAnimation*(model: Model, anim: ModelAnimation, frame: cint) {.impraylibC.}

#  Update model animation pose
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadModelAnimation*(anim: ModelAnimation) {.impraylibC.}

#  Unload animation data
#  We are building or using raylib as a static library (or Linux shared library)
proc IsModelAnimationValid*(model: Model, anim: ModelAnimation): bool {.impraylibC.}

#  Check model animation skeleton match
#  Mesh generation functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshPoly*(sides: cint, radius: cfloat): Mesh {.impraylibC.}

#  Generate polygonal mesh
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshPlane*(width: cfloat, length: cfloat, resX: cint, resZ: cint): Mesh {.impraylibC.}

#  Generate plane mesh (with subdivisions)
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshCube*(width: cfloat, height: cfloat, length: cfloat): Mesh {.impraylibC.}

#  Generate cuboid mesh
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshSphere*(radius: cfloat, rings: cint, slices: cint): Mesh {.impraylibC.}

#  Generate sphere mesh (standard sphere)
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshHemiSphere*(radius: cfloat, rings: cint, slices: cint): Mesh {.impraylibC.}

#  Generate half-sphere mesh (no bottom cap)
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshCylinder*(radius: cfloat, height: cfloat, slices: cint): Mesh {.impraylibC.}

#  Generate cylinder mesh
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshTorus*(radius: cfloat, size: cfloat, radSeg: cint, sides: cint): Mesh {.impraylibC.}

#  Generate torus mesh
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshKnot*(radius: cfloat, size: cfloat, radSeg: cint, sides: cint): Mesh {.impraylibC.}

#  Generate trefoil knot mesh
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshHeightmap*(heightmap: Image, size: Vector3): Mesh {.impraylibC.}

#  Generate heightmap mesh from image data
#  We are building or using raylib as a static library (or Linux shared library)
proc GenMeshCubicmap*(cubicmap: Image, cubeSize: Vector3): Mesh {.impraylibC.}

#  Generate cubes-based map mesh from image data
#  Mesh manipulation functions
#  We are building or using raylib as a static library (or Linux shared library)
proc MeshBoundingBox*(mesh: Mesh): BoundingBox {.impraylibC.}

#  Compute mesh bounding box limits
#  We are building or using raylib as a static library (or Linux shared library)
proc MeshTangents*(mesh: ptr Mesh) {.impraylibC.}

#  Compute mesh tangents
#  We are building or using raylib as a static library (or Linux shared library)
proc MeshBinormals*(mesh: ptr Mesh) {.impraylibC.}

#  Compute mesh binormals
#  Model drawing functions
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawModel*(model: Model, position: Vector3, scale: cfloat, tint: Color) {.impraylibC.}

#  Draw a model (with texture if set)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawModelEx*(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: cfloat, scale: Vector3, tint: Color) {.impraylibC.}

#  Draw a model with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawModelWires*(model: Model, position: Vector3, scale: cfloat, tint: Color) {.impraylibC.}

#  Draw a model wires (with texture if set)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawModelWiresEx*(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: cfloat, scale: Vector3, tint: Color) {.impraylibC.}

#  Draw a model wires (with texture if set) with extended parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawBoundingBox*(box: BoundingBox, color: Color) {.impraylibC.}

#  Draw bounding box (wires)
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawBillboard*(camera: Camera, texture: Texture2D, center: Vector3, size: cfloat, tint: Color) {.impraylibC.}

#  Draw a billboard texture
#  We are building or using raylib as a static library (or Linux shared library)
proc DrawBillboardRec*(camera: Camera, texture: Texture2D, sourceRec: Rectangle, center: Vector3, size: cfloat, tint: Color) {.impraylibC.}

#  Draw a billboard texture defined by sourceRec
#  Collision detection functions
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionSpheres*(centerA: Vector3, radiusA: cfloat, centerB: Vector3, radiusB: cfloat): bool {.impraylibC.}

#  Detect collision between two spheres
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionBoxes*(box1: BoundingBox, box2: BoundingBox): bool {.impraylibC.}

#  Detect collision between two bounding boxes
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionBoxSphere*(box: BoundingBox, centerSphere: Vector3, radiusSphere: cfloat): bool {.impraylibC.}

#  Detect collision between box and sphere
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionRaySphere*(ray: Ray, spherePosition: Vector3, sphereRadius: cfloat): bool {.impraylibC.}

#  Detect collision between ray and sphere
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionRaySphereEx*(ray: Ray, spherePosition: Vector3, sphereRadius: cfloat, collisionPoint: ptr Vector3): bool {.impraylibC.}

#  Detect collision between ray and sphere, returns collision point
#  We are building or using raylib as a static library (or Linux shared library)
proc CheckCollisionRayBox*(ray: Ray, box: BoundingBox): bool {.impraylibC.}

#  Detect collision between ray and box
#  We are building or using raylib as a static library (or Linux shared library)
proc GetCollisionRayModel*(ray: Ray, model: ptr Model): RayHitInfo {.impraylibC.}

#  Get collision info between ray and model
#  We are building or using raylib as a static library (or Linux shared library)
proc GetCollisionRayTriangle*(ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3): RayHitInfo {.impraylibC.}

#  Get collision info between ray and triangle
#  We are building or using raylib as a static library (or Linux shared library)
proc GetCollisionRayGround*(ray: Ray, groundHeight: cfloat): RayHitInfo {.impraylibC.}

#  Get collision info between ray and ground plane (Y-normal plane)
# ------------------------------------------------------------------------------------
#  Shaders System Functions (Module: rlgl)
#  NOTE: This functions are useless when using OpenGL 1.1
# ------------------------------------------------------------------------------------
#  Shader loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadText*(fileName: cstring): cstring {.impraylibC.}

#  Load chars array from text file
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadShader*(vsFileName: cstring, fsFileName: cstring): Shader {.impraylibC.}

#  Load shader from files and bind default locations
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadShaderCode*(vsCode: cstring, fsCode: cstring): Shader {.impraylibC.}

#  Load shader from code strings and bind default locations
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadShader*(shader: Shader) {.impraylibC.}

#  Unload shader from GPU memory (VRAM)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetShaderDefault*(): Shader {.impraylibC.}

#  Get default shader
#  We are building or using raylib as a static library (or Linux shared library)
proc GetTextureDefault*(): Texture2D {.impraylibC.}

#  Get default texture
#  Shader configuration functions
#  We are building or using raylib as a static library (or Linux shared library)
proc GetShaderLocation*(shader: Shader, uniformName: cstring): cint {.impraylibC.}

#  Get shader uniform location
#  We are building or using raylib as a static library (or Linux shared library)
proc SetShaderValue*(shader: Shader, uniformLoc: cint, value: pointer, uniformType: cint) {.impraylibC.}

#  Set shader uniform value
#  We are building or using raylib as a static library (or Linux shared library)
proc SetShaderValueV*(shader: Shader, uniformLoc: cint, value: pointer, uniformType: cint, count: cint) {.impraylibC.}

#  Set shader uniform value vector
#  We are building or using raylib as a static library (or Linux shared library)
proc SetShaderValueMatrix*(shader: Shader, uniformLoc: cint, mat: Matrix) {.impraylibC.}

#  Set shader uniform value (matrix 4x4)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetShaderValueTexture*(shader: Shader, uniformLoc: cint, texture: Texture2D) {.impraylibC.}

#  Set shader uniform value for texture
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMatrixProjection*(proj: Matrix) {.impraylibC.}

#  Set a custom projection matrix (replaces internal projection matrix)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMatrixModelview*(view: Matrix) {.impraylibC.}

#  Set a custom modelview matrix (replaces internal modelview matrix)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMatrixModelview*(): Matrix {.impraylibC.}

#  Get internal modelview matrix
#  Texture maps generation (PBR)
#  NOTE: Required shaders should be provided
#  We are building or using raylib as a static library (or Linux shared library)
proc GenTextureCubemap*(shader: Shader, skyHDR: Texture2D, size: cint): Texture2D {.impraylibC.}

#  Generate cubemap texture from HDR texture
#  We are building or using raylib as a static library (or Linux shared library)
proc GenTextureIrradiance*(shader: Shader, cubemap: Texture2D, size: cint): Texture2D {.impraylibC.}

#  Generate irradiance texture using cubemap data
#  We are building or using raylib as a static library (or Linux shared library)
proc GenTexturePrefilter*(shader: Shader, cubemap: Texture2D, size: cint): Texture2D {.impraylibC.}

#  Generate prefilter texture using cubemap data
#  We are building or using raylib as a static library (or Linux shared library)
proc GenTextureBRDF*(shader: Shader, size: cint): Texture2D {.impraylibC.}

#  Generate BRDF texture
#  Shading begin/end functions
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginShaderMode*(shader: Shader) {.impraylibC.}

#  Begin custom shader drawing
#  We are building or using raylib as a static library (or Linux shared library)
proc EndShaderMode*() {.impraylibC.}

#  End custom shader drawing (use default shader)
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginBlendMode*(mode: cint) {.impraylibC.}

#  Begin blending mode (alpha, additive, multiplied)
#  We are building or using raylib as a static library (or Linux shared library)
proc EndBlendMode*() {.impraylibC.}

#  End blending mode (reset to default: alpha blending)
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginScissorMode*(x: cint, y: cint, width: cint, height: cint) {.impraylibC.}

#  Begin scissor mode (define screen area for following drawing)
#  We are building or using raylib as a static library (or Linux shared library)
proc EndScissorMode*() {.impraylibC.}

#  End scissor mode
#  VR control functions
#  We are building or using raylib as a static library (or Linux shared library)
proc InitVrSimulator*() {.impraylibC.}

#  Init VR simulator for selected device parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc CloseVrSimulator*() {.impraylibC.}

#  Close VR simulator for current device
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateVrTracking*(camera: ptr Camera) {.impraylibC.}

#  Update VR tracking (position and orientation) and camera
#  We are building or using raylib as a static library (or Linux shared library)
proc SetVrConfiguration*(info: VrDeviceInfo, distortion: Shader) {.impraylibC.}

#  Set stereo rendering configuration parameters
#  We are building or using raylib as a static library (or Linux shared library)
proc IsVrSimulatorReady*(): bool {.impraylibC.}

#  Detect if VR simulator is ready
#  We are building or using raylib as a static library (or Linux shared library)
proc ToggleVrMode*() {.impraylibC.}

#  Enable/Disable VR experience
#  We are building or using raylib as a static library (or Linux shared library)
proc BeginVrDrawing*() {.impraylibC.}

#  Begin VR simulator stereo rendering
#  We are building or using raylib as a static library (or Linux shared library)
proc EndVrDrawing*() {.impraylibC.}

#  End VR simulator stereo rendering
# ------------------------------------------------------------------------------------
#  Audio Loading and Playing Functions (Module: audio)
# ------------------------------------------------------------------------------------
#  Audio device management functions
#  We are building or using raylib as a static library (or Linux shared library)
proc InitAudioDevice*() {.impraylibC.}

#  Initialize audio device and context
#  We are building or using raylib as a static library (or Linux shared library)
proc CloseAudioDevice*() {.impraylibC.}

#  Close the audio device and context
#  We are building or using raylib as a static library (or Linux shared library)
proc IsAudioDeviceReady*(): bool {.impraylibC.}

#  Check if audio device has been initialized successfully
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMasterVolume*(volume: cfloat) {.impraylibC.}

#  Set master volume (listener)
#  Wave/Sound loading/unloading functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadWave*(fileName: cstring): Wave {.impraylibC.}

#  Load wave data from file
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadWaveEx*(data: pointer, sampleCount: cint, sampleRate: cint, sampleSize: cint, channels: cint): Wave {.impraylibC.}

#  Load wave data from raw array data
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadSound*(fileName: cstring): Sound {.impraylibC.}

#  Load sound from file
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadSoundFromWave*(wave: Wave): Sound {.impraylibC.}

#  Load sound from wave data
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateSound*(sound: Sound, data: pointer, samplesCount: cint) {.impraylibC.}

#  Update sound buffer with new data
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadWave*(wave: Wave) {.impraylibC.}

#  Unload wave data
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadSound*(sound: Sound) {.impraylibC.}

#  Unload sound
#  We are building or using raylib as a static library (or Linux shared library)
proc ExportWave*(wave: Wave, fileName: cstring) {.impraylibC.}

#  Export wave data to file
#  We are building or using raylib as a static library (or Linux shared library)
proc ExportWaveAsCode*(wave: Wave, fileName: cstring) {.impraylibC.}

#  Export wave sample data to code (.h)
#  Wave/Sound management functions
#  We are building or using raylib as a static library (or Linux shared library)
proc PlaySound*(sound: Sound) {.impraylibC.}

#  Play a sound
#  We are building or using raylib as a static library (or Linux shared library)
proc PauseSound*(sound: Sound) {.impraylibC.}

#  Pause a sound
#  We are building or using raylib as a static library (or Linux shared library)
proc ResumeSound*(sound: Sound) {.impraylibC.}

#  Resume a paused sound
#  We are building or using raylib as a static library (or Linux shared library)
proc StopSound*(sound: Sound) {.impraylibC.}

#  Stop playing a sound
#  We are building or using raylib as a static library (or Linux shared library)
proc IsSoundPlaying*(sound: Sound): bool {.impraylibC.}

#  Check if a sound is currently playing
#  We are building or using raylib as a static library (or Linux shared library)
proc SetSoundVolume*(sound: Sound, volume: cfloat) {.impraylibC.}

#  Set volume for a sound (1.0 is max level)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetSoundPitch*(sound: Sound, pitch: cfloat) {.impraylibC.}

#  Set pitch for a sound (1.0 is base level)
#  We are building or using raylib as a static library (or Linux shared library)
proc WaveFormat*(wave: ptr Wave, sampleRate: cint, sampleSize: cint, channels: cint) {.impraylibC.}

#  Convert wave data to desired format
#  We are building or using raylib as a static library (or Linux shared library)
proc WaveCopy*(wave: Wave): Wave {.impraylibC.}

#  Copy a wave to a new wave
#  We are building or using raylib as a static library (or Linux shared library)
proc WaveCrop*(wave: ptr Wave, initSample: cint, finalSample: cint) {.impraylibC.}

#  Crop a wave to defined samples range
#  We are building or using raylib as a static library (or Linux shared library)
proc GetWaveData*(wave: Wave): ptr cfloat {.impraylibC.}

#  Get samples data from wave as a floats array
#  Music management functions
#  We are building or using raylib as a static library (or Linux shared library)
proc LoadMusicStream*(fileName: cstring): Music {.impraylibC.}

#  Load music stream from file
#  We are building or using raylib as a static library (or Linux shared library)
proc UnloadMusicStream*(music: Music) {.impraylibC.}

#  Unload music stream
#  We are building or using raylib as a static library (or Linux shared library)
proc PlayMusicStream*(music: Music) {.impraylibC.}

#  Start music playing
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateMusicStream*(music: Music) {.impraylibC.}

#  Updates buffers for music streaming
#  We are building or using raylib as a static library (or Linux shared library)
proc StopMusicStream*(music: Music) {.impraylibC.}

#  Stop music playing
#  We are building or using raylib as a static library (or Linux shared library)
proc PauseMusicStream*(music: Music) {.impraylibC.}

#  Pause music playing
#  We are building or using raylib as a static library (or Linux shared library)
proc ResumeMusicStream*(music: Music) {.impraylibC.}

#  Resume playing paused music
#  We are building or using raylib as a static library (or Linux shared library)
proc IsMusicPlaying*(music: Music): bool {.impraylibC.}

#  Check if music is playing
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMusicVolume*(music: Music, volume: cfloat) {.impraylibC.}

#  Set volume for music (1.0 is max level)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMusicPitch*(music: Music, pitch: cfloat) {.impraylibC.}

#  Set pitch for a music (1.0 is base level)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetMusicLoopCount*(music: Music, count: cint) {.impraylibC.}

#  Set music loop count (loop repeats)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMusicTimeLength*(music: Music): cfloat {.impraylibC.}

#  Get music time length (in seconds)
#  We are building or using raylib as a static library (or Linux shared library)
proc GetMusicTimePlayed*(music: Music): cfloat {.impraylibC.}

#  Get current music time played (in seconds)
#  AudioStream management functions
#  We are building or using raylib as a static library (or Linux shared library)
proc InitAudioStream*(sampleRate: cuint, sampleSize: cuint, channels: cuint): AudioStream {.impraylibC.}

#  Init audio stream (to stream raw audio pcm data)
#  We are building or using raylib as a static library (or Linux shared library)
proc UpdateAudioStream*(stream: AudioStream, data: pointer, samplesCount: cint) {.impraylibC.}

#  Update audio stream buffers with data
#  We are building or using raylib as a static library (or Linux shared library)
proc CloseAudioStream*(stream: AudioStream) {.impraylibC.}

#  Close audio stream and free memory
#  We are building or using raylib as a static library (or Linux shared library)
proc IsAudioBufferProcessed*(stream: AudioStream): bool {.impraylibC.}

#  Check if any audio stream buffers requires refill
#  We are building or using raylib as a static library (or Linux shared library)
proc PlayAudioStream*(stream: AudioStream) {.impraylibC.}

#  Play audio stream
#  We are building or using raylib as a static library (or Linux shared library)
proc PauseAudioStream*(stream: AudioStream) {.impraylibC.}

#  Pause audio stream
#  We are building or using raylib as a static library (or Linux shared library)
proc ResumeAudioStream*(stream: AudioStream) {.impraylibC.}

#  Resume audio stream
#  We are building or using raylib as a static library (or Linux shared library)
proc IsAudioStreamPlaying*(stream: AudioStream): bool {.impraylibC.}

#  Check if audio stream is playing
#  We are building or using raylib as a static library (or Linux shared library)
proc StopAudioStream*(stream: AudioStream) {.impraylibC.}

#  Stop audio stream
#  We are building or using raylib as a static library (or Linux shared library)
proc SetAudioStreamVolume*(stream: AudioStream, volume: cfloat) {.impraylibC.}

#  Set volume for audio stream (1.0 is max level)
#  We are building or using raylib as a static library (or Linux shared library)
proc SetAudioStreamPitch*(stream: AudioStream, pitch: cfloat) {.impraylibC.}


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
