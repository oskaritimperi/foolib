import os

{.passC:"-I" & currentSourcePath().parentDir() / "imgui".}
{.passC:"-I" & currentSourcePath().parentDir() / "imgui" / "examples".}

{.passC:"-DIMGUI_IMPL_OPENGL_LOADER_GLAD".}

{.compile:"imgui/imgui.cpp".}
{.compile:"imgui/imgui_demo.cpp".}
{.compile:"imgui/imgui_draw.cpp".}
{.compile:"imgui/imgui_widgets.cpp".}
{.compile:"imgui/examples/imgui_impl_opengl3.cpp".}
{.compile:"imgui/examples/imgui_impl_raylib.cpp".}

const
  imguiHeader = "<imgui.h>"


  ImDrawCornerFlags_None* = (0).cint
  ImDrawCornerFlags_TopLeft* = (1  shl  0).cint
  ImDrawCornerFlags_TopRight* = (1  shl  1).cint
  ImDrawCornerFlags_BotLeft* = (1  shl  2).cint
  ImDrawCornerFlags_BotRight* = (1  shl  3).cint
  ImDrawCornerFlags_Top* = (ImDrawCornerFlags_TopLeft  or  ImDrawCornerFlags_TopRight).cint
  ImDrawCornerFlags_Bot* = (ImDrawCornerFlags_BotLeft  or  ImDrawCornerFlags_BotRight).cint
  ImDrawCornerFlags_Left* = (ImDrawCornerFlags_TopLeft  or  ImDrawCornerFlags_BotLeft).cint
  ImDrawCornerFlags_Right* = (ImDrawCornerFlags_TopRight  or  ImDrawCornerFlags_BotRight).cint
  ImDrawCornerFlags_All* = (0xF).cint

  ImDrawListFlags_None* = (0).cint
  ImDrawListFlags_AntiAliasedLines* = (1  shl  0).cint
  ImDrawListFlags_AntiAliasedFill* = (1  shl  1).cint
  ImDrawListFlags_AllowVtxOffset* = (1  shl  2).cint

  ImFontAtlasFlags_None* = (0).cint
  ImFontAtlasFlags_NoPowerOfTwoHeight* = (1  shl  0).cint
  ImFontAtlasFlags_NoMouseCursors* = (1  shl  1).cint

  ImGuiBackendFlags_None* = (0).cint
  ImGuiBackendFlags_HasGamepad* = (1  shl  0).cint
  ImGuiBackendFlags_HasMouseCursors* = (1  shl  1).cint
  ImGuiBackendFlags_HasSetMousePos* = (1  shl  2).cint
  ImGuiBackendFlags_RendererHasVtxOffset* = (1  shl  3).cint

  ImGuiCol_Text* = (0).cint
  ImGuiCol_TextDisabled* = (1).cint
  ImGuiCol_WindowBg* = (2).cint
  ImGuiCol_ChildBg* = (3).cint
  ImGuiCol_PopupBg* = (4).cint
  ImGuiCol_Border* = (5).cint
  ImGuiCol_BorderShadow* = (6).cint
  ImGuiCol_FrameBg* = (7).cint
  ImGuiCol_FrameBgHovered* = (8).cint
  ImGuiCol_FrameBgActive* = (9).cint
  ImGuiCol_TitleBg* = (10).cint
  ImGuiCol_TitleBgActive* = (11).cint
  ImGuiCol_TitleBgCollapsed* = (12).cint
  ImGuiCol_MenuBarBg* = (13).cint
  ImGuiCol_ScrollbarBg* = (14).cint
  ImGuiCol_ScrollbarGrab* = (15).cint
  ImGuiCol_ScrollbarGrabHovered* = (16).cint
  ImGuiCol_ScrollbarGrabActive* = (17).cint
  ImGuiCol_CheckMark* = (18).cint
  ImGuiCol_SliderGrab* = (19).cint
  ImGuiCol_SliderGrabActive* = (20).cint
  ImGuiCol_Button* = (21).cint
  ImGuiCol_ButtonHovered* = (22).cint
  ImGuiCol_ButtonActive* = (23).cint
  ImGuiCol_Header* = (24).cint
  ImGuiCol_HeaderHovered* = (25).cint
  ImGuiCol_HeaderActive* = (26).cint
  ImGuiCol_Separator* = (27).cint
  ImGuiCol_SeparatorHovered* = (28).cint
  ImGuiCol_SeparatorActive* = (29).cint
  ImGuiCol_ResizeGrip* = (30).cint
  ImGuiCol_ResizeGripHovered* = (31).cint
  ImGuiCol_ResizeGripActive* = (32).cint
  ImGuiCol_Tab* = (33).cint
  ImGuiCol_TabHovered* = (34).cint
  ImGuiCol_TabActive* = (35).cint
  ImGuiCol_TabUnfocused* = (36).cint
  ImGuiCol_TabUnfocusedActive* = (37).cint
  ImGuiCol_PlotLines* = (38).cint
  ImGuiCol_PlotLinesHovered* = (39).cint
  ImGuiCol_PlotHistogram* = (40).cint
  ImGuiCol_PlotHistogramHovered* = (41).cint
  ImGuiCol_TextSelectedBg* = (42).cint
  ImGuiCol_DragDropTarget* = (43).cint
  ImGuiCol_NavHighlight* = (44).cint
  ImGuiCol_NavWindowingHighlight* = (45).cint
  ImGuiCol_NavWindowingDimBg* = (46).cint
  ImGuiCol_ModalWindowDimBg* = (47).cint
  ImGuiCol_COUNT* = (48).cint

  ImGuiColorEditFlags_None* = (0).cint
  ImGuiColorEditFlags_NoAlpha* = (1  shl  1).cint
  ImGuiColorEditFlags_NoPicker* = (1  shl  2).cint
  ImGuiColorEditFlags_NoOptions* = (1  shl  3).cint
  ImGuiColorEditFlags_NoSmallPreview* = (1  shl  4).cint
  ImGuiColorEditFlags_NoInputs* = (1  shl  5).cint
  ImGuiColorEditFlags_NoTooltip* = (1  shl  6).cint
  ImGuiColorEditFlags_NoLabel* = (1  shl  7).cint
  ImGuiColorEditFlags_NoSidePreview* = (1  shl  8).cint
  ImGuiColorEditFlags_NoDragDrop* = (1  shl  9).cint
  ImGuiColorEditFlags_AlphaBar* = (1  shl  16).cint
  ImGuiColorEditFlags_AlphaPreview* = (1  shl  17).cint
  ImGuiColorEditFlags_AlphaPreviewHalf* = (1  shl  18).cint
  ImGuiColorEditFlags_HDR* = (1  shl  19).cint
  ImGuiColorEditFlags_DisplayRGB* = (1  shl  20).cint
  ImGuiColorEditFlags_DisplayHSV* = (1  shl  21).cint
  ImGuiColorEditFlags_DisplayHex* = (1  shl  22).cint
  ImGuiColorEditFlags_Uint8* = (1  shl  23).cint
  ImGuiColorEditFlags_Float* = (1  shl  24).cint
  ImGuiColorEditFlags_PickerHueBar* = (1  shl  25).cint
  ImGuiColorEditFlags_PickerHueWheel* = (1  shl  26).cint
  ImGuiColorEditFlags_InputRGB* = (1  shl  27).cint
  ImGuiColorEditFlags_InputHSV* = (1  shl  28).cint

  ImGuiComboFlags_None* = (0).cint
  ImGuiComboFlags_PopupAlignLeft* = (1  shl  0).cint
  ImGuiComboFlags_HeightSmall* = (1  shl  1).cint
  ImGuiComboFlags_HeightRegular* = (1  shl  2).cint
  ImGuiComboFlags_HeightLarge* = (1  shl  3).cint
  ImGuiComboFlags_HeightLargest* = (1  shl  4).cint
  ImGuiComboFlags_NoArrowButton* = (1  shl  5).cint
  ImGuiComboFlags_NoPreview* = (1  shl  6).cint

  ImGuiCond_Always* = (1  shl  0).cint
  ImGuiCond_Once* = (1  shl  1).cint
  ImGuiCond_FirstUseEver* = (1  shl  2).cint
  ImGuiCond_Appearing* = (1  shl  3).cint

  ImGuiConfigFlags_None* = (0).cint
  ImGuiConfigFlags_NavEnableKeyboard* = (1  shl  0).cint
  ImGuiConfigFlags_NavEnableGamepad* = (1  shl  1).cint
  ImGuiConfigFlags_NavEnableSetMousePos* = (1  shl  2).cint
  ImGuiConfigFlags_NavNoCaptureKeyboard* = (1  shl  3).cint
  ImGuiConfigFlags_NoMouse* = (1  shl  4).cint
  ImGuiConfigFlags_NoMouseCursorChange* = (1  shl  5).cint
  ImGuiConfigFlags_IsSRGB* = (1  shl  20).cint
  ImGuiConfigFlags_IsTouchScreen* = (1  shl  21).cint

  ImGuiDataType_S8* = (0).cint
  ImGuiDataType_U8* = (1).cint
  ImGuiDataType_S16* = (2).cint
  ImGuiDataType_U16* = (3).cint
  ImGuiDataType_S32* = (4).cint
  ImGuiDataType_U32* = (5).cint
  ImGuiDataType_S64* = (6).cint
  ImGuiDataType_U64* = (7).cint
  ImGuiDataType_Float* = (8).cint
  ImGuiDataType_Double* = (9).cint
  ImGuiDataType_COUNT* = (10).cint

  ImGuiDir_None* = (-1).cint
  ImGuiDir_Left* = (0).cint
  ImGuiDir_Right* = (1).cint
  ImGuiDir_Up* = (2).cint
  ImGuiDir_Down* = (3).cint
  ImGuiDir_COUNT* = (4).cint

  ImGuiDragDropFlags_None* = (0).cint
  ImGuiDragDropFlags_SourceNoPreviewTooltip* = (1  shl  0).cint
  ImGuiDragDropFlags_SourceNoDisableHover* = (1  shl  1).cint
  ImGuiDragDropFlags_SourceNoHoldToOpenOthers* = (1  shl  2).cint
  ImGuiDragDropFlags_SourceAllowNullID* = (1  shl  3).cint
  ImGuiDragDropFlags_SourceExtern* = (1  shl  4).cint
  ImGuiDragDropFlags_SourceAutoExpirePayload* = (1  shl  5).cint
  ImGuiDragDropFlags_AcceptBeforeDelivery* = (1  shl  10).cint
  ImGuiDragDropFlags_AcceptNoDrawDefaultRect* = (1  shl  11).cint
  ImGuiDragDropFlags_AcceptNoPreviewTooltip* = (1  shl  12).cint
  ImGuiDragDropFlags_AcceptPeekOnly* = (ImGuiDragDropFlags_AcceptBeforeDelivery  or  ImGuiDragDropFlags_AcceptNoDrawDefaultRect).cint

  ImGuiFocusedFlags_None* = (0).cint
  ImGuiFocusedFlags_ChildWindows* = (1  shl  0).cint
  ImGuiFocusedFlags_RootWindow* = (1  shl  1).cint
  ImGuiFocusedFlags_AnyWindow* = (1  shl  2).cint
  ImGuiFocusedFlags_RootAndChildWindows* = (ImGuiFocusedFlags_RootWindow  or  ImGuiFocusedFlags_ChildWindows).cint

  ImGuiHoveredFlags_None* = (0).cint
  ImGuiHoveredFlags_ChildWindows* = (1  shl  0).cint
  ImGuiHoveredFlags_RootWindow* = (1  shl  1).cint
  ImGuiHoveredFlags_AnyWindow* = (1  shl  2).cint
  ImGuiHoveredFlags_AllowWhenBlockedByPopup* = (1  shl  3).cint
  ImGuiHoveredFlags_AllowWhenBlockedByActiveItem* = (1  shl  5).cint
  ImGuiHoveredFlags_AllowWhenOverlapped* = (1  shl  6).cint
  ImGuiHoveredFlags_AllowWhenDisabled* = (1  shl  7).cint
  ImGuiHoveredFlags_RectOnly* = (ImGuiHoveredFlags_AllowWhenBlockedByPopup  or  ImGuiHoveredFlags_AllowWhenBlockedByActiveItem  or  ImGuiHoveredFlags_AllowWhenOverlapped).cint
  ImGuiHoveredFlags_RootAndChildWindows* = (ImGuiHoveredFlags_RootWindow  or  ImGuiHoveredFlags_ChildWindows).cint

  ImGuiInputTextFlags_None* = (0).cint
  ImGuiInputTextFlags_CharsDecimal* = (1  shl  0).cint
  ImGuiInputTextFlags_CharsHexadecimal* = (1  shl  1).cint
  ImGuiInputTextFlags_CharsUppercase* = (1  shl  2).cint
  ImGuiInputTextFlags_CharsNoBlank* = (1  shl  3).cint
  ImGuiInputTextFlags_AutoSelectAll* = (1  shl  4).cint
  ImGuiInputTextFlags_EnterReturnsTrue* = (1  shl  5).cint
  ImGuiInputTextFlags_CallbackCompletion* = (1  shl  6).cint
  ImGuiInputTextFlags_CallbackHistory* = (1  shl  7).cint
  ImGuiInputTextFlags_CallbackAlways* = (1  shl  8).cint
  ImGuiInputTextFlags_CallbackCharFilter* = (1  shl  9).cint
  ImGuiInputTextFlags_AllowTabInput* = (1  shl  10).cint
  ImGuiInputTextFlags_CtrlEnterForNewLine* = (1  shl  11).cint
  ImGuiInputTextFlags_NoHorizontalScroll* = (1  shl  12).cint
  ImGuiInputTextFlags_AlwaysInsertMode* = (1  shl  13).cint
  ImGuiInputTextFlags_ReadOnly* = (1  shl  14).cint
  ImGuiInputTextFlags_Password* = (1  shl  15).cint
  ImGuiInputTextFlags_NoUndoRedo* = (1  shl  16).cint
  ImGuiInputTextFlags_CharsScientific* = (1  shl  17).cint
  ImGuiInputTextFlags_CallbackResize* = (1  shl  18).cint
  ImGuiInputTextFlags_Multiline* = (1  shl  20).cint
  ImGuiInputTextFlags_NoMarkEdited* = (1  shl  21).cint

  ImGuiKey_Tab* = (0).cint
  ImGuiKey_LeftArrow* = (1).cint
  ImGuiKey_RightArrow* = (2).cint
  ImGuiKey_UpArrow* = (3).cint
  ImGuiKey_DownArrow* = (4).cint
  ImGuiKey_PageUp* = (5).cint
  ImGuiKey_PageDown* = (6).cint
  ImGuiKey_Home* = (7).cint
  ImGuiKey_End* = (8).cint
  ImGuiKey_Insert* = (9).cint
  ImGuiKey_Delete* = (10).cint
  ImGuiKey_Backspace* = (11).cint
  ImGuiKey_Space* = (12).cint
  ImGuiKey_Enter* = (13).cint
  ImGuiKey_Escape* = (14).cint
  ImGuiKey_KeyPadEnter* = (15).cint
  ImGuiKey_A* = (16).cint
  ImGuiKey_C* = (17).cint
  ImGuiKey_V* = (18).cint
  ImGuiKey_X* = (19).cint
  ImGuiKey_Y* = (20).cint
  ImGuiKey_Z* = (21).cint
  ImGuiKey_COUNT* = (22).cint

  ImGuiMouseCursor_None* = (-1).cint
  ImGuiMouseCursor_Arrow* = (0).cint
  ImGuiMouseCursor_TextInput* = (1).cint
  ImGuiMouseCursor_ResizeAll* = (2).cint
  ImGuiMouseCursor_ResizeNS* = (3).cint
  ImGuiMouseCursor_ResizeEW* = (4).cint
  ImGuiMouseCursor_ResizeNESW* = (5).cint
  ImGuiMouseCursor_ResizeNWSE* = (6).cint
  ImGuiMouseCursor_Hand* = (7).cint
  ImGuiMouseCursor_COUNT* = (8).cint

  ImGuiNavInput_Activate* = (0).cint
  ImGuiNavInput_Cancel* = (1).cint
  ImGuiNavInput_Input* = (2).cint
  ImGuiNavInput_Menu* = (3).cint
  ImGuiNavInput_DpadLeft* = (4).cint
  ImGuiNavInput_DpadRight* = (5).cint
  ImGuiNavInput_DpadUp* = (6).cint
  ImGuiNavInput_DpadDown* = (7).cint
  ImGuiNavInput_LStickLeft* = (8).cint
  ImGuiNavInput_LStickRight* = (9).cint
  ImGuiNavInput_LStickUp* = (10).cint
  ImGuiNavInput_LStickDown* = (11).cint
  ImGuiNavInput_FocusPrev* = (12).cint
  ImGuiNavInput_FocusNext* = (13).cint
  ImGuiNavInput_TweakSlow* = (14).cint
  ImGuiNavInput_TweakFast* = (15).cint
  ImGuiNavInput_COUNT* = (22).cint

  ImGuiSelectableFlags_None* = (0).cint
  ImGuiSelectableFlags_DontClosePopups* = (1  shl  0).cint
  ImGuiSelectableFlags_SpanAllColumns* = (1  shl  1).cint
  ImGuiSelectableFlags_AllowDoubleClick* = (1  shl  2).cint
  ImGuiSelectableFlags_Disabled* = (1  shl  3).cint
  ImGuiSelectableFlags_AllowItemOverlap* = (1  shl  4).cint

  ImGuiStyleVar_Alpha* = (0).cint
  ImGuiStyleVar_WindowPadding* = (1).cint
  ImGuiStyleVar_WindowRounding* = (2).cint
  ImGuiStyleVar_WindowBorderSize* = (3).cint
  ImGuiStyleVar_WindowMinSize* = (4).cint
  ImGuiStyleVar_WindowTitleAlign* = (5).cint
  ImGuiStyleVar_ChildRounding* = (6).cint
  ImGuiStyleVar_ChildBorderSize* = (7).cint
  ImGuiStyleVar_PopupRounding* = (8).cint
  ImGuiStyleVar_PopupBorderSize* = (9).cint
  ImGuiStyleVar_FramePadding* = (10).cint
  ImGuiStyleVar_FrameRounding* = (11).cint
  ImGuiStyleVar_FrameBorderSize* = (12).cint
  ImGuiStyleVar_ItemSpacing* = (13).cint
  ImGuiStyleVar_ItemInnerSpacing* = (14).cint
  ImGuiStyleVar_IndentSpacing* = (15).cint
  ImGuiStyleVar_ScrollbarSize* = (16).cint
  ImGuiStyleVar_ScrollbarRounding* = (17).cint
  ImGuiStyleVar_GrabMinSize* = (18).cint
  ImGuiStyleVar_GrabRounding* = (19).cint
  ImGuiStyleVar_TabRounding* = (20).cint
  ImGuiStyleVar_ButtonTextAlign* = (21).cint
  ImGuiStyleVar_SelectableTextAlign* = (22).cint
  ImGuiStyleVar_COUNT* = (23).cint

  ImGuiTabBarFlags_None* = (0).cint
  ImGuiTabBarFlags_Reorderable* = (1  shl  0).cint
  ImGuiTabBarFlags_AutoSelectNewTabs* = (1  shl  1).cint
  ImGuiTabBarFlags_TabListPopupButton* = (1  shl  2).cint
  ImGuiTabBarFlags_NoCloseWithMiddleMouseButton* = (1  shl  3).cint
  ImGuiTabBarFlags_NoTabListScrollingButtons* = (1  shl  4).cint
  ImGuiTabBarFlags_NoTooltip* = (1  shl  5).cint
  ImGuiTabBarFlags_FittingPolicyResizeDown* = (1  shl  6).cint
  ImGuiTabBarFlags_FittingPolicyScroll* = (1  shl  7).cint

  ImGuiTabItemFlags_None* = (0).cint
  ImGuiTabItemFlags_UnsavedDocument* = (1  shl  0).cint
  ImGuiTabItemFlags_SetSelected* = (1  shl  1).cint
  ImGuiTabItemFlags_NoCloseWithMiddleMouseButton* = (1  shl  2).cint
  ImGuiTabItemFlags_NoPushId* = (1  shl  3).cint

  ImGuiTreeNodeFlags_None* = (0).cint
  ImGuiTreeNodeFlags_Selected* = (1  shl  0).cint
  ImGuiTreeNodeFlags_Framed* = (1  shl  1).cint
  ImGuiTreeNodeFlags_AllowItemOverlap* = (1  shl  2).cint
  ImGuiTreeNodeFlags_NoTreePushOnOpen* = (1  shl  3).cint
  ImGuiTreeNodeFlags_NoAutoOpenOnLog* = (1  shl  4).cint
  ImGuiTreeNodeFlags_DefaultOpen* = (1  shl  5).cint
  ImGuiTreeNodeFlags_OpenOnDoubleClick* = (1  shl  6).cint
  ImGuiTreeNodeFlags_OpenOnArrow* = (1  shl  7).cint
  ImGuiTreeNodeFlags_Leaf* = (1  shl  8).cint
  ImGuiTreeNodeFlags_Bullet* = (1  shl  9).cint
  ImGuiTreeNodeFlags_FramePadding* = (1  shl  10).cint
  ImGuiTreeNodeFlags_SpanAvailWidth* = (1  shl  11).cint
  ImGuiTreeNodeFlags_SpanFullWidth* = (1  shl  12).cint
  ImGuiTreeNodeFlags_NavLeftJumpsBackHere* = (1  shl  13).cint
  ImGuiTreeNodeFlags_CollapsingHeader* = (ImGuiTreeNodeFlags_Framed  or  ImGuiTreeNodeFlags_NoTreePushOnOpen  or  ImGuiTreeNodeFlags_NoAutoOpenOnLog).cint

  ImGuiWindowFlags_None* = (0).cint
  ImGuiWindowFlags_NoTitleBar* = (1  shl  0).cint
  ImGuiWindowFlags_NoResize* = (1  shl  1).cint
  ImGuiWindowFlags_NoMove* = (1  shl  2).cint
  ImGuiWindowFlags_NoScrollbar* = (1  shl  3).cint
  ImGuiWindowFlags_NoScrollWithMouse* = (1  shl  4).cint
  ImGuiWindowFlags_NoCollapse* = (1  shl  5).cint
  ImGuiWindowFlags_AlwaysAutoResize* = (1  shl  6).cint
  ImGuiWindowFlags_NoBackground* = (1  shl  7).cint
  ImGuiWindowFlags_NoSavedSettings* = (1  shl  8).cint
  ImGuiWindowFlags_NoMouseInputs* = (1  shl  9).cint
  ImGuiWindowFlags_MenuBar* = (1  shl  10).cint
  ImGuiWindowFlags_HorizontalScrollbar* = (1  shl  11).cint
  ImGuiWindowFlags_NoFocusOnAppearing* = (1  shl  12).cint
  ImGuiWindowFlags_NoBringToFrontOnFocus* = (1  shl  13).cint
  ImGuiWindowFlags_AlwaysVerticalScrollbar* = (1  shl  14).cint
  ImGuiWindowFlags_AlwaysHorizontalScrollbar* = (1 shl  15).cint
  ImGuiWindowFlags_AlwaysUseWindowPadding* = (1  shl  16).cint
  ImGuiWindowFlags_NoNavInputs* = (1  shl  18).cint
  ImGuiWindowFlags_NoNavFocus* = (1  shl  19).cint
  ImGuiWindowFlags_UnsavedDocument* = (1  shl  20).cint
  ImGuiWindowFlags_NoNav* = (ImGuiWindowFlags_NoNavInputs  or  ImGuiWindowFlags_NoNavFocus).cint
  ImGuiWindowFlags_NoDecoration* = (ImGuiWindowFlags_NoTitleBar  or  ImGuiWindowFlags_NoResize  or  ImGuiWindowFlags_NoScrollbar  or  ImGuiWindowFlags_NoCollapse).cint
  ImGuiWindowFlags_NoInputs* = (ImGuiWindowFlags_NoMouseInputs  or  ImGuiWindowFlags_NoNavInputs  or  ImGuiWindowFlags_NoNavFocus).cint
  ImGuiWindowFlags_NavFlattened* = (1  shl  23).cint
  ImGuiWindowFlags_ChildWindow* = (1  shl  24).cint
  ImGuiWindowFlags_Tooltip* = (1  shl  25).cint
  ImGuiWindowFlags_Popup* = (1  shl  26).cint
  ImGuiWindowFlags_Modal* = (1  shl  27).cint
  ImGuiWindowFlags_ChildMenu* = (1  shl  28).cint

type
  ImVector*[T] {.importcpp, header: imguiHeader.} = object
    Size*: cint
    Capacity*: cint
    Data*: ptr T

  ImDrawListSharedData* {.importcpp, header: imguiHeader.} = object

  ImGuiContext* {.importcpp, header: imguiHeader.} = object

  va_list* {.importc, header:"<stdarg.h>".} = object


  ImDrawCallback* = proc (parent_list: ptr ImDrawList, cmd: ptr ImDrawCmd) {.cdecl.}
  ImDrawCornerFlags* = cint
  ImDrawIdx* = cushort
  ImDrawListFlags* = cint
  ImFontAtlasFlags* = cint
  ImGuiBackendFlags* = cint
  ImGuiCol* = cint
  ImGuiColorEditFlags* = cint
  ImGuiComboFlags* = cint
  ImGuiCond* = cint
  ImGuiConfigFlags* = cint
  ImGuiDataType* = cint
  ImGuiDir* = cint
  ImGuiDragDropFlags* = cint
  ImGuiFocusedFlags* = cint
  ImGuiHoveredFlags* = cint
  ImGuiID* = cuint
  ImGuiInputTextCallback* = proc (data: ptr ImGuiInputTextCallbackData): cint {.cdecl.}
  ImGuiInputTextFlags* = cint
  ImGuiKey* = cint
  ImGuiMouseCursor* = cint
  ImGuiNavInput* = cint
  ImGuiSelectableFlags* = cint
  ImGuiSizeCallback* = proc (data: ptr ImGuiSizeCallbackData) {.cdecl.}
  ImGuiStyleVar* = cint
  ImGuiTabBarFlags* = cint
  ImGuiTabItemFlags* = cint
  ImGuiTreeNodeFlags* = cint
  ImGuiWindowFlags* = cint
  ImS16* = cshort
  ImS32* = cint
  ImS64* = int64
  ImS8* = cchar
  ImTextureID* = pointer
  ImU16* = cushort
  ImU32* = cuint
  ImU64* = uint64
  ImU8* = cuchar
  ImWchar* = cushort

  ImColor* {.importcpp, header: imguiHeader.} = object
    Value*: ImVec4

  ImDrawChannel* {.importcpp, header: imguiHeader.} = object

  ImDrawCmd* {.importcpp, header: imguiHeader.} = object
    ElemCount*: cuint
    ClipRect*: ImVec4
    TextureId*: ImTextureID
    VtxOffset*: cuint
    IdxOffset*: cuint
    UserCallback*: ImDrawCallback
    UserCallbackData*: pointer

  ImDrawData* {.importcpp, header: imguiHeader.} = object
    Valid*: bool
    CmdLists*: ptr ptr ImDrawList
    CmdListsCount*: cint
    TotalIdxCount*: cint
    TotalVtxCount*: cint
    DisplayPos*: ImVec2
    DisplaySize*: ImVec2
    FramebufferScale*: ImVec2

  ImDrawList* {.importcpp, header: imguiHeader.} = object
    CmdBuffer*: ImVector[ImDrawCmd]
    IdxBuffer*: ImVector[ImDrawIdx]
    VtxBuffer*: ImVector[ImDrawVert]
    Flags*: ImDrawListFlags

  ImDrawListSplitter* {.importcpp, header: imguiHeader.} = object

  ImDrawVert* {.importcpp, header: imguiHeader.} = object
    pos*: ImVec2
    uv*: ImVec2
    col*: ImU32

  ImFont* {.importcpp, header: imguiHeader.} = object
    IndexAdvanceX*: ImVector[cfloat]
    FallbackAdvanceX*: cfloat
    FontSize*: cfloat
    IndexLookup*: ImVector[ImWchar]
    Glyphs*: ImVector[ImFontGlyph]
    FallbackGlyph*: ptr ImFontGlyph
    DisplayOffset*: ImVec2
    ContainerAtlas*: ptr ImFontAtlas
    ConfigData*: ptr ImFontConfig
    ConfigDataCount*: cshort
    FallbackChar*: ImWchar
    EllipsisChar*: ImWchar
    Scale*: cfloat
    Ascent*: cfloat
    Descent*: cfloat
    MetricsTotalSurface*: cint
    DirtyLookupTables*: bool

  ImFontAtlas* {.importcpp, header: imguiHeader.} = object
    Locked*: bool
    Flags*: ImFontAtlasFlags
    TexID*: ImTextureID
    TexDesiredWidth*: cint
    TexGlyphPadding*: cint
    TexPixelsAlpha8*: ptr cuchar
    TexPixelsRGBA32*: ptr cuint
    TexWidth*: cint
    TexHeight*: cint
    TexUvScale*: ImVec2
    TexUvWhitePixel*: ImVec2
    Fonts*: ImVector[ptr ImFont]
    CustomRects*: ImVector[ImFontAtlasCustomRect]
    ConfigData*: ImVector[ImFontConfig]
    CustomRectIds*: array[1, cint]

  ImFontAtlasCustomRect* {.importcpp, header: imguiHeader.} = object
    ID*: cuint
    Width*: cushort
    Height*: cushort
    X*: cushort
    Y*: cushort
    GlyphAdvanceX*: cfloat
    GlyphOffset*: ImVec2
    Font*: ptr ImFont

  ImFontConfig* {.importcpp, header: imguiHeader.} = object
    FontData*: pointer
    FontDataSize*: cint
    FontDataOwnedByAtlas*: bool
    FontNo*: cint
    SizePixels*: cfloat
    OversampleH*: cint
    OversampleV*: cint
    PixelSnapH*: bool
    GlyphExtraSpacing*: ImVec2
    GlyphOffset*: ImVec2
    GlyphRanges*: ptr ImWchar
    GlyphMinAdvanceX*: cfloat
    GlyphMaxAdvanceX*: cfloat
    MergeMode*: bool
    RasterizerFlags*: cuint
    RasterizerMultiply*: cfloat
    EllipsisChar*: ImWchar
    Name*: array[40, cchar]
    DstFont*: ptr ImFont

  ImFontGlyph* {.importcpp, header: imguiHeader.} = object
    Codepoint*: ImWchar
    AdvanceX*: cfloat
    X0*: cfloat
    Y0*: cfloat
    X1*: cfloat
    Y1*: cfloat
    U0*: cfloat
    V0*: cfloat
    U1*: cfloat
    V1*: cfloat

  ImFontGlyphRangesBuilder* {.importcpp, header: imguiHeader.} = object
    UsedChars*: ImVector[ImU32]

  ImGuiIO* {.importcpp, header: imguiHeader.} = object
    ConfigFlags*: ImGuiConfigFlags
    BackendFlags*: ImGuiBackendFlags
    DisplaySize*: ImVec2
    DeltaTime*: cfloat
    IniSavingRate*: cfloat
    IniFilename*: cstring
    LogFilename*: cstring
    MouseDoubleClickTime*: cfloat
    MouseDoubleClickMaxDist*: cfloat
    MouseDragThreshold*: cfloat
    KeyMap*: array[ImGuiKey_COUNT, cint]
    KeyRepeatDelay*: cfloat
    KeyRepeatRate*: cfloat
    UserData*: pointer
    Fonts*: ptr ImFontAtlas
    FontGlobalScale*: cfloat
    FontAllowUserScaling*: bool
    FontDefault*: ptr ImFont
    DisplayFramebufferScale*: ImVec2
    MouseDrawCursor*: bool
    ConfigMacOSXBehaviors*: bool
    ConfigInputTextCursorBlink*: bool
    ConfigWindowsResizeFromEdges*: bool
    ConfigWindowsMoveFromTitleBarOnly*: bool
    ConfigWindowsMemoryCompactTimer*: cfloat
    BackendPlatformName*: cstring
    BackendRendererName*: cstring
    BackendPlatformUserData*: pointer
    BackendRendererUserData*: pointer
    BackendLanguageUserData*: pointer
    GetClipboardTextFn*: proc (user_data: pointer): cstring {.cdecl.}
    SetClipboardTextFn*: proc (user_data: pointer, text: cstring) {.cdecl.}
    ClipboardUserData*: pointer
    ImeSetInputScreenPosFn*: proc (x: cint, y: cint) {.cdecl.}
    ImeWindowHandle*: pointer
    RenderDrawListsFnUnused*: pointer
    MousePos*: ImVec2
    MouseDown*: array[5, bool]
    MouseWheel*: cfloat
    MouseWheelH*: cfloat
    KeyCtrl*: bool
    KeyShift*: bool
    KeyAlt*: bool
    KeySuper*: bool
    KeysDown*: array[512, bool]
    NavInputs*: array[ImGuiNavInput_COUNT, cfloat]
    WantCaptureMouse*: bool
    WantCaptureKeyboard*: bool
    WantTextInput*: bool
    WantSetMousePos*: bool
    WantSaveIniSettings*: bool
    NavActive*: bool
    NavVisible*: bool
    Framerate*: cfloat
    MetricsRenderVertices*: cint
    MetricsRenderIndices*: cint
    MetricsRenderWindows*: cint
    MetricsActiveWindows*: cint
    MetricsActiveAllocations*: cint
    MouseDelta*: ImVec2
    MousePosPrev*: ImVec2
    MouseClickedPos*: array[5, ImVec2]
    MouseClickedTime*: array[5, cdouble]
    MouseClicked*: array[5, bool]
    MouseDoubleClicked*: array[5, bool]
    MouseReleased*: array[5, bool]
    MouseDownOwned*: array[5, bool]
    MouseDownWasDoubleClick*: array[5, bool]
    MouseDownDuration*: array[5, cfloat]
    MouseDownDurationPrev*: array[5, cfloat]
    MouseDragMaxDistanceAbs*: array[5, ImVec2]
    MouseDragMaxDistanceSqr*: array[5, cfloat]
    KeysDownDuration*: array[512, cfloat]
    KeysDownDurationPrev*: array[512, cfloat]
    NavInputsDownDuration*: array[ImGuiNavInput_COUNT, cfloat]
    NavInputsDownDurationPrev*: array[ImGuiNavInput_COUNT, cfloat]
    InputQueueCharacters*: ImVector[ImWchar]

  ImGuiInputTextCallbackData* {.importcpp, header: imguiHeader.} = object
    EventFlag*: ImGuiInputTextFlags
    Flags*: ImGuiInputTextFlags
    UserData*: pointer
    EventChar*: ImWchar
    EventKey*: ImGuiKey
    Buf*: ptr cchar
    BufTextLen*: cint
    BufSize*: cint
    BufDirty*: bool
    CursorPos*: cint
    SelectionStart*: cint
    SelectionEnd*: cint

  ImGuiListClipper* {.importcpp, header: imguiHeader.} = object
    StartPosY*: cfloat
    ItemsHeight*: cfloat
    ItemsCount*: cint
    StepNo*: cint
    DisplayStart*: cint
    DisplayEnd*: cint

  ImGuiOnceUponAFrame* {.importcpp, header: imguiHeader.} = object
    RefFrame*: cint

  ImGuiPayload* {.importcpp, header: imguiHeader.} = object
    Data*: pointer
    DataSize*: cint
    SourceId*: ImGuiID
    SourceParentId*: ImGuiID
    DataFrameCount*: cint
    DataType*: array[32+1, cchar]
    Preview*: bool
    Delivery*: bool

  ImGuiSizeCallbackData* {.importcpp, header: imguiHeader.} = object
    UserData*: pointer
    Pos*: ImVec2
    CurrentSize*: ImVec2
    DesiredSize*: ImVec2

  ImGuiStorage* {.importcpp, header: imguiHeader.} = object
    Data*: ImVector[ImGuiStoragePair]

  ImGuiStoragePair* {.importcpp, header: imguiHeader.} = object

  ImGuiStyle* {.importcpp, header: imguiHeader.} = object
    Alpha*: cfloat
    WindowPadding*: ImVec2
    WindowRounding*: cfloat
    WindowBorderSize*: cfloat
    WindowMinSize*: ImVec2
    WindowTitleAlign*: ImVec2
    WindowMenuButtonPosition*: ImGuiDir
    ChildRounding*: cfloat
    ChildBorderSize*: cfloat
    PopupRounding*: cfloat
    PopupBorderSize*: cfloat
    FramePadding*: ImVec2
    FrameRounding*: cfloat
    FrameBorderSize*: cfloat
    ItemSpacing*: ImVec2
    ItemInnerSpacing*: ImVec2
    TouchExtraPadding*: ImVec2
    IndentSpacing*: cfloat
    ColumnsMinSpacing*: cfloat
    ScrollbarSize*: cfloat
    ScrollbarRounding*: cfloat
    GrabMinSize*: cfloat
    GrabRounding*: cfloat
    TabRounding*: cfloat
    TabBorderSize*: cfloat
    ColorButtonPosition*: ImGuiDir
    ButtonTextAlign*: ImVec2
    SelectableTextAlign*: ImVec2
    DisplayWindowPadding*: ImVec2
    DisplaySafeAreaPadding*: ImVec2
    MouseCursorScale*: cfloat
    AntiAliasedLines*: bool
    AntiAliasedFill*: bool
    CurveTessellationTol*: cfloat
    Colors*: array[ImGuiCol_COUNT, ImVec4]

  ImGuiTextBuffer* {.importcpp, header: imguiHeader.} = object
    Buf*: ImVector[cchar]

  ImGuiTextFilter* {.importcpp, header: imguiHeader.} = object
    InputBuf*: array[256, cchar]
    Filters*: ImVector[ImGuiTextRange]
    CountGrep*: cint

  ImGuiTextRange* {.importcpp, header: imguiHeader.} = object
    b*: cstring
    e*: cstring

  ImVec2* {.importcpp, header: imguiHeader.} = object
    x*: cfloat
    y*: cfloat

  ImVec4* {.importcpp, header: imguiHeader.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

proc initImColor*(): ImColor {.header: imguiHeader, importcpp: "ImColor(@)".}
proc initImColor*(r: cint, g: cint, b: cint, a: cint = 255): ImColor {.header: imguiHeader, importcpp: "ImColor(@)".}
proc initImColor*(rgba: ImU32): ImColor {.header: imguiHeader, importcpp: "ImColor(@)".}
proc initImColor*(r: cfloat, g: cfloat, b: cfloat, a: cfloat = 1.0f): ImColor {.header: imguiHeader, importcpp: "ImColor(@)".}
proc initImColor*(col: ImVec4): ImColor {.header: imguiHeader, importcpp: "ImColor(@)".}
proc initImDrawCmd*(): ImDrawCmd {.header: imguiHeader, importcpp: "ImDrawCmd(@)".}
proc initImDrawData*(): ImDrawData {.header: imguiHeader, importcpp: "ImDrawData(@)".}
proc initImDrawListSplitter*(): ImDrawListSplitter {.header: imguiHeader, importcpp: "ImDrawListSplitter(@)".}
proc initImDrawList*(shared_data: ptr ImDrawListSharedData): ImDrawList {.header: imguiHeader, importcpp: "ImDrawList(@)".}
proc initImFontAtlasCustomRect*(): ImFontAtlasCustomRect {.header: imguiHeader, importcpp: "ImFontAtlasCustomRect(@)".}
proc initImFontAtlas*(): ImFontAtlas {.header: imguiHeader, importcpp: "ImFontAtlas(@)".}
proc initImFontConfig*(): ImFontConfig {.header: imguiHeader, importcpp: "ImFontConfig(@)".}
proc initImFontGlyphRangesBuilder*(): ImFontGlyphRangesBuilder {.header: imguiHeader, importcpp: "ImFontGlyphRangesBuilder(@)".}
proc initImFont*(): ImFont {.header: imguiHeader, importcpp: "ImFont(@)".}
proc initImGuiIO*(): ImGuiIO {.header: imguiHeader, importcpp: "ImGuiIO(@)".}
proc initImGuiInputTextCallbackData*(): ImGuiInputTextCallbackData {.header: imguiHeader, importcpp: "ImGuiInputTextCallbackData(@)".}
proc initImGuiListClipper*(items_count: cint = -1, items_height: cfloat = -1.0f): ImGuiListClipper {.header: imguiHeader, importcpp: "ImGuiListClipper(@)".}
proc initImGuiOnceUponAFrame*(): ImGuiOnceUponAFrame {.header: imguiHeader, importcpp: "ImGuiOnceUponAFrame(@)".}
proc initImGuiPayload*(): ImGuiPayload {.header: imguiHeader, importcpp: "ImGuiPayload(@)".}
proc initImGuiStyle*(): ImGuiStyle {.header: imguiHeader, importcpp: "ImGuiStyle(@)".}
proc initImGuiTextFilter*(default_filter: cstring = ""): ImGuiTextFilter {.header: imguiHeader, importcpp: "ImGuiTextFilter(@)".}
proc initImVec2*(): ImVec2 {.header: imguiHeader, importcpp: "ImVec2(@)".}
proc initImVec2*(x: cfloat, y: cfloat): ImVec2 {.header: imguiHeader, importcpp: "ImVec2(@)".}
proc initImVec4*(): ImVec4 {.header: imguiHeader, importcpp: "ImVec4(@)".}
proc initImVec4*(x: cfloat, y: cfloat, z: cfloat, w: cfloat): ImVec4 {.header: imguiHeader, importcpp: "ImVec4(@)".}
proc initImVector*(): ImVector {.header: imguiHeader, importcpp: "ImVector(@)".}
proc initImVector*(src: ImVector): ImVector {.header: imguiHeader, importcpp: "ImVector(@)".}
proc HSV*(h: cfloat, s: cfloat, v: cfloat, a: cfloat = 1.0f): ImColor {.header: imguiHeader, importcpp: "#.HSV(@)".}
proc SetHSV*(self: var ImColor, h: cfloat, s: cfloat, v: cfloat, a: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.SetHSV(@)".}
proc Clear*(self: var ImDrawData) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc DeIndexAllBuffers*(self: var ImDrawData) {.header: imguiHeader, importcpp: "#.DeIndexAllBuffers(@)".}
proc ScaleClipRects*(self: var ImDrawData, fb_scale: ImVec2) {.header: imguiHeader, importcpp: "#.ScaleClipRects(@)".}
proc Clear*(self: var ImDrawListSplitter) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc ClearFreeMemory*(self: var ImDrawListSplitter) {.header: imguiHeader, importcpp: "#.ClearFreeMemory(@)".}
proc Merge*(self: var ImDrawListSplitter, draw_list: ptr ImDrawList) {.header: imguiHeader, importcpp: "#.Merge(@)".}
proc SetCurrentChannel*(self: var ImDrawListSplitter, draw_list: ptr ImDrawList, channel_idx: cint) {.header: imguiHeader, importcpp: "#.SetCurrentChannel(@)".}
proc Split*(self: var ImDrawListSplitter, draw_list: ptr ImDrawList, count: cint) {.header: imguiHeader, importcpp: "#.Split(@)".}
proc AddBezierCurve*(self: var ImDrawList, pos0: ImVec2, cp0: ImVec2, cp1: ImVec2, pos1: ImVec2, col: ImU32, thickness: cfloat, num_segments: cint = 0) {.header: imguiHeader, importcpp: "#.AddBezierCurve(@)".}
proc AddCallback*(self: var ImDrawList, callback: ImDrawCallback, callback_data: pointer) {.header: imguiHeader, importcpp: "#.AddCallback(@)".}
proc AddCircle*(self: var ImDrawList, center: ImVec2, radius: cfloat, col: ImU32, num_segments: cint = 12, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.AddCircle(@)".}
proc AddCircleFilled*(self: var ImDrawList, center: ImVec2, radius: cfloat, col: ImU32, num_segments: cint = 12) {.header: imguiHeader, importcpp: "#.AddCircleFilled(@)".}
proc AddConvexPolyFilled*(self: var ImDrawList, points: ptr ImVec2, num_points: cint, col: ImU32) {.header: imguiHeader, importcpp: "#.AddConvexPolyFilled(@)".}
proc AddDrawCmd*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.AddDrawCmd(@)".}
proc AddImage*(self: var ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2 = initImVec2(0,0), uv_max: ImVec2 = initImVec2(1,1), col: ImU32 = (((ImU32)(255) shl 24) or ((ImU32)(255) shl 16) or ((ImU32)(255) shl 8) or ((ImU32)(255) shl 0))) {.header: imguiHeader, importcpp: "#.AddImage(@)".}
proc AddImageQuad*(self: var ImDrawList, user_texture_id: ImTextureID, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, uv1: ImVec2 = initImVec2(0,0), uv2: ImVec2 = initImVec2(1,0), uv3: ImVec2 = initImVec2(1,1), uv4: ImVec2 = initImVec2(0,1), col: ImU32 = (((ImU32)(255) shl 24) or ((ImU32)(255) shl 16) or ((ImU32)(255) shl 8) or ((ImU32)(255) shl 0))) {.header: imguiHeader, importcpp: "#.AddImageQuad(@)".}
proc AddImageRounded*(self: var ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2, uv_max: ImVec2, col: ImU32, rounding: cfloat, rounding_corners: ImDrawCornerFlags = ImDrawCornerFlags_All) {.header: imguiHeader, importcpp: "#.AddImageRounded(@)".}
proc AddLine*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, col: ImU32, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.AddLine(@)".}
proc AddPolyline*(self: var ImDrawList, points: ptr ImVec2, num_points: cint, col: ImU32, closed: bool, thickness: cfloat) {.header: imguiHeader, importcpp: "#.AddPolyline(@)".}
proc AddQuad*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.AddQuad(@)".}
proc AddQuadFilled*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.AddQuadFilled(@)".}
proc AddRect*(self: var ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: cfloat = 0.0f, rounding_corners: ImDrawCornerFlags = ImDrawCornerFlags_All, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.AddRect(@)".}
proc AddRectFilled*(self: var ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: cfloat = 0.0f, rounding_corners: ImDrawCornerFlags = ImDrawCornerFlags_All) {.header: imguiHeader, importcpp: "#.AddRectFilled(@)".}
proc AddRectFilledMultiColor*(self: var ImDrawList, p_min: ImVec2, p_max: ImVec2, col_upr_left: ImU32, col_upr_right: ImU32, col_bot_right: ImU32, col_bot_left: ImU32) {.header: imguiHeader, importcpp: "#.AddRectFilledMultiColor(@)".}
proc AddText*(self: var ImDrawList, pos: ImVec2, col: ImU32, text_begin: cstring, text_end: cstring = nil) {.header: imguiHeader, importcpp: "#.AddText(@)".}
proc AddText*(self: var ImDrawList, font: ptr ImFont, font_size: cfloat, pos: ImVec2, col: ImU32, text_begin: cstring, text_end: cstring = nil, wrap_width: cfloat = 0.0f, cpu_fine_clip_rect: ptr ImVec4 = nil) {.header: imguiHeader, importcpp: "#.AddText(@)".}
proc AddTriangle*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.AddTriangle(@)".}
proc AddTriangleFilled*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.AddTriangleFilled(@)".}
proc ChannelsMerge*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.ChannelsMerge(@)".}
proc ChannelsSetCurrent*(self: var ImDrawList, n: cint) {.header: imguiHeader, importcpp: "#.ChannelsSetCurrent(@)".}
proc ChannelsSplit*(self: var ImDrawList, count: cint) {.header: imguiHeader, importcpp: "#.ChannelsSplit(@)".}
proc Clear*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc ClearFreeMemory*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.ClearFreeMemory(@)".}
proc CloneOutput*(self: var ImDrawList): ptr ImDrawList {.header: imguiHeader, importcpp: "#.CloneOutput(@)".}
proc GetClipRectMax*(self: var ImDrawList): ImVec2 {.header: imguiHeader, importcpp: "#.GetClipRectMax(@)".}
proc GetClipRectMin*(self: var ImDrawList): ImVec2 {.header: imguiHeader, importcpp: "#.GetClipRectMin(@)".}
proc PathArcTo*(self: var ImDrawList, center: ImVec2, radius: cfloat, a_min: cfloat, a_max: cfloat, num_segments: cint = 10) {.header: imguiHeader, importcpp: "#.PathArcTo(@)".}
proc PathArcToFast*(self: var ImDrawList, center: ImVec2, radius: cfloat, a_min_of_12: cint, a_max_of_12: cint) {.header: imguiHeader, importcpp: "#.PathArcToFast(@)".}
proc PathBezierCurveTo*(self: var ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, num_segments: cint = 0) {.header: imguiHeader, importcpp: "#.PathBezierCurveTo(@)".}
proc PathClear*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.PathClear(@)".}
proc PathFillConvex*(self: var ImDrawList, col: ImU32) {.header: imguiHeader, importcpp: "#.PathFillConvex(@)".}
proc PathLineTo*(self: var ImDrawList, pos: ImVec2) {.header: imguiHeader, importcpp: "#.PathLineTo(@)".}
proc PathLineToMergeDuplicate*(self: var ImDrawList, pos: ImVec2) {.header: imguiHeader, importcpp: "#.PathLineToMergeDuplicate(@)".}
proc PathRect*(self: var ImDrawList, rect_min: ImVec2, rect_max: ImVec2, rounding: cfloat = 0.0f, rounding_corners: ImDrawCornerFlags = ImDrawCornerFlags_All) {.header: imguiHeader, importcpp: "#.PathRect(@)".}
proc PathStroke*(self: var ImDrawList, col: ImU32, closed: bool, thickness: cfloat = 1.0f) {.header: imguiHeader, importcpp: "#.PathStroke(@)".}
proc PopClipRect*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.PopClipRect(@)".}
proc PopTextureID*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.PopTextureID(@)".}
proc PrimQuadUV*(self: var ImDrawList, a: ImVec2, b: ImVec2, c: ImVec2, d: ImVec2, uv_a: ImVec2, uv_b: ImVec2, uv_c: ImVec2, uv_d: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.PrimQuadUV(@)".}
proc PrimRect*(self: var ImDrawList, a: ImVec2, b: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.PrimRect(@)".}
proc PrimRectUV*(self: var ImDrawList, a: ImVec2, b: ImVec2, uv_a: ImVec2, uv_b: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.PrimRectUV(@)".}
proc PrimReserve*(self: var ImDrawList, idx_count: cint, vtx_count: cint) {.header: imguiHeader, importcpp: "#.PrimReserve(@)".}
proc PrimVtx*(self: var ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.PrimVtx(@)".}
proc PrimWriteIdx*(self: var ImDrawList, idx: ImDrawIdx) {.header: imguiHeader, importcpp: "#.PrimWriteIdx(@)".}
proc PrimWriteVtx*(self: var ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) {.header: imguiHeader, importcpp: "#.PrimWriteVtx(@)".}
proc PushClipRect*(self: var ImDrawList, clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool = false) {.header: imguiHeader, importcpp: "#.PushClipRect(@)".}
proc PushClipRectFullScreen*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.PushClipRectFullScreen(@)".}
proc PushTextureID*(self: var ImDrawList, texture_id: ImTextureID) {.header: imguiHeader, importcpp: "#.PushTextureID(@)".}
proc UpdateClipRect*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.UpdateClipRect(@)".}
proc UpdateTextureID*(self: var ImDrawList) {.header: imguiHeader, importcpp: "#.UpdateTextureID(@)".}
proc IsPacked*(self: var ImFontAtlasCustomRect): bool {.header: imguiHeader, importcpp: "#.IsPacked(@)".}
proc AddCustomRectFontGlyph*(self: var ImFontAtlas, font: ptr ImFont, id: ImWchar, width: cint, height: cint, advance_x: cfloat, offset: ImVec2 = initImVec2(0,0)): cint {.header: imguiHeader, importcpp: "#.AddCustomRectFontGlyph(@)".}
proc AddCustomRectRegular*(self: var ImFontAtlas, id: cuint, width: cint, height: cint): cint {.header: imguiHeader, importcpp: "#.AddCustomRectRegular(@)".}
proc AddFont*(self: var ImFontAtlas, font_cfg: ptr ImFontConfig): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFont(@)".}
proc AddFontDefault*(self: var ImFontAtlas, font_cfg: ptr ImFontConfig = nil): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFontDefault(@)".}
proc AddFontFromFileTTF*(self: var ImFontAtlas, filename: cstring, size_pixels: cfloat, font_cfg: ptr ImFontConfig = nil, glyph_ranges: ptr ImWchar = nil): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFontFromFileTTF(@)".}
proc AddFontFromMemoryCompressedBase85TTF*(self: var ImFontAtlas, compressed_font_data_base85: cstring, size_pixels: cfloat, font_cfg: ptr ImFontConfig = nil, glyph_ranges: ptr ImWchar = nil): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFontFromMemoryCompressedBase85TTF(@)".}
proc AddFontFromMemoryCompressedTTF*(self: var ImFontAtlas, compressed_font_data: pointer, compressed_font_size: cint, size_pixels: cfloat, font_cfg: ptr ImFontConfig = nil, glyph_ranges: ptr ImWchar = nil): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFontFromMemoryCompressedTTF(@)".}
proc AddFontFromMemoryTTF*(self: var ImFontAtlas, font_data: pointer, font_size: cint, size_pixels: cfloat, font_cfg: ptr ImFontConfig = nil, glyph_ranges: ptr ImWchar = nil): ptr ImFont {.header: imguiHeader, importcpp: "#.AddFontFromMemoryTTF(@)".}
proc Build*(self: var ImFontAtlas): bool {.header: imguiHeader, importcpp: "#.Build(@)".}
proc CalcCustomRectUV*(self: var ImFontAtlas, rect: ptr ImFontAtlasCustomRect, out_uv_min: ptr ImVec2, out_uv_max: ptr ImVec2) {.header: imguiHeader, importcpp: "#.CalcCustomRectUV(@)".}
proc Clear*(self: var ImFontAtlas) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc ClearFonts*(self: var ImFontAtlas) {.header: imguiHeader, importcpp: "#.ClearFonts(@)".}
proc ClearInputData*(self: var ImFontAtlas) {.header: imguiHeader, importcpp: "#.ClearInputData(@)".}
proc ClearTexData*(self: var ImFontAtlas) {.header: imguiHeader, importcpp: "#.ClearTexData(@)".}
proc GetCustomRectByIndex*(self: var ImFontAtlas, index: cint): ptr ImFontAtlasCustomRect {.header: imguiHeader, importcpp: "#.GetCustomRectByIndex(@)".}
proc GetGlyphRangesChineseFull*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesChineseFull(@)".}
proc GetGlyphRangesChineseSimplifiedCommon*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesChineseSimplifiedCommon(@)".}
proc GetGlyphRangesCyrillic*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesCyrillic(@)".}
proc GetGlyphRangesDefault*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesDefault(@)".}
proc GetGlyphRangesJapanese*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesJapanese(@)".}
proc GetGlyphRangesKorean*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesKorean(@)".}
proc GetGlyphRangesThai*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesThai(@)".}
proc GetGlyphRangesVietnamese*(self: var ImFontAtlas): ptr ImWchar {.header: imguiHeader, importcpp: "#.GetGlyphRangesVietnamese(@)".}
proc GetMouseCursorTexData*(self: var ImFontAtlas, cursor: ImGuiMouseCursor, out_offset: ptr ImVec2, out_size: ptr ImVec2, out_uv_border: array[2, ImVec2], out_uv_fill: array[2, ImVec2]): bool {.header: imguiHeader, importcpp: "#.GetMouseCursorTexData(@)".}
proc GetTexDataAsAlpha8*(self: var ImFontAtlas, out_pixels: ptr ptr cuchar, out_width: ptr cint, out_height: ptr cint, out_bytes_per_pixel: ptr cint = nil) {.header: imguiHeader, importcpp: "#.GetTexDataAsAlpha8(@)".}
proc GetTexDataAsRGBA32*(self: var ImFontAtlas, out_pixels: ptr ptr cuchar, out_width: ptr cint, out_height: ptr cint, out_bytes_per_pixel: ptr cint = nil) {.header: imguiHeader, importcpp: "#.GetTexDataAsRGBA32(@)".}
proc IsBuilt*(self: var ImFontAtlas): bool {.header: imguiHeader, importcpp: "#.IsBuilt(@)".}
proc SetTexID*(self: var ImFontAtlas, id: ImTextureID) {.header: imguiHeader, importcpp: "#.SetTexID(@)".}
proc AddChar*(self: var ImFontGlyphRangesBuilder, c: ImWchar) {.header: imguiHeader, importcpp: "#.AddChar(@)".}
proc AddRanges*(self: var ImFontGlyphRangesBuilder, ranges: ptr ImWchar) {.header: imguiHeader, importcpp: "#.AddRanges(@)".}
proc AddText*(self: var ImFontGlyphRangesBuilder, text: cstring, text_end: cstring = nil) {.header: imguiHeader, importcpp: "#.AddText(@)".}
proc BuildRanges*(self: var ImFontGlyphRangesBuilder, out_ranges: ptr ImVector[ImWchar]) {.header: imguiHeader, importcpp: "#.BuildRanges(@)".}
proc Clear*(self: var ImFontGlyphRangesBuilder) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc GetBit*(self: var ImFontGlyphRangesBuilder, n: cint): bool {.header: imguiHeader, importcpp: "#.GetBit(@)".}
proc SetBit*(self: var ImFontGlyphRangesBuilder, n: cint) {.header: imguiHeader, importcpp: "#.SetBit(@)".}
proc AddGlyph*(self: var ImFont, c: ImWchar, x0: cfloat, y0: cfloat, x1: cfloat, y1: cfloat, u0: cfloat, v0: cfloat, u1: cfloat, v1: cfloat, advance_x: cfloat) {.header: imguiHeader, importcpp: "#.AddGlyph(@)".}
proc AddRemapChar*(self: var ImFont, dst: ImWchar, src: ImWchar, overwrite_dst: bool = true) {.header: imguiHeader, importcpp: "#.AddRemapChar(@)".}
proc BuildLookupTable*(self: var ImFont) {.header: imguiHeader, importcpp: "#.BuildLookupTable(@)".}
proc CalcTextSizeA*(self: var ImFont, size: cfloat, max_width: cfloat, wrap_width: cfloat, text_begin: cstring, text_end: cstring = nil, remaining: ptr ptr cchar = nil): ImVec2 {.header: imguiHeader, importcpp: "#.CalcTextSizeA(@)".}
proc CalcWordWrapPositionA*(self: var ImFont, scale: cfloat, text: cstring, text_end: cstring, wrap_width: cfloat): cstring {.header: imguiHeader, importcpp: "#.CalcWordWrapPositionA(@)".}
proc ClearOutputData*(self: var ImFont) {.header: imguiHeader, importcpp: "#.ClearOutputData(@)".}
proc FindGlyph*(self: var ImFont, c: ImWchar): ptr ImFontGlyph {.header: imguiHeader, importcpp: "#.FindGlyph(@)".}
proc FindGlyphNoFallback*(self: var ImFont, c: ImWchar): ptr ImFontGlyph {.header: imguiHeader, importcpp: "#.FindGlyphNoFallback(@)".}
proc GetCharAdvance*(self: var ImFont, c: ImWchar): cfloat {.header: imguiHeader, importcpp: "#.GetCharAdvance(@)".}
proc GetDebugName*(self: var ImFont): cstring {.header: imguiHeader, importcpp: "#.GetDebugName(@)".}
proc GrowIndex*(self: var ImFont, new_size: cint) {.header: imguiHeader, importcpp: "#.GrowIndex(@)".}
proc IsLoaded*(self: var ImFont): bool {.header: imguiHeader, importcpp: "#.IsLoaded(@)".}
proc RenderChar*(self: var ImFont, draw_list: ptr ImDrawList, size: cfloat, pos: ImVec2, col: ImU32, c: ImWchar) {.header: imguiHeader, importcpp: "#.RenderChar(@)".}
proc RenderText*(self: var ImFont, draw_list: ptr ImDrawList, size: cfloat, pos: ImVec2, col: ImU32, clip_rect: ImVec4, text_begin: cstring, text_end: cstring, wrap_width: cfloat = 0.0f, cpu_fine_clip: bool = false) {.header: imguiHeader, importcpp: "#.RenderText(@)".}
proc SetFallbackChar*(self: var ImFont, c: ImWchar) {.header: imguiHeader, importcpp: "#.SetFallbackChar(@)".}
proc AddInputCharacter*(self: var ImGuiIO, c: cuint) {.header: imguiHeader, importcpp: "#.AddInputCharacter(@)".}
proc AddInputCharactersUTF8*(self: var ImGuiIO, str: cstring) {.header: imguiHeader, importcpp: "#.AddInputCharactersUTF8(@)".}
proc ClearInputCharacters*(self: var ImGuiIO) {.header: imguiHeader, importcpp: "#.ClearInputCharacters(@)".}
proc DeleteChars*(self: var ImGuiInputTextCallbackData, pos: cint, bytes_count: cint) {.header: imguiHeader, importcpp: "#.DeleteChars(@)".}
proc HasSelection*(self: var ImGuiInputTextCallbackData): bool {.header: imguiHeader, importcpp: "#.HasSelection(@)".}
proc InsertChars*(self: var ImGuiInputTextCallbackData, pos: cint, text: cstring, text_end: cstring = nil) {.header: imguiHeader, importcpp: "#.InsertChars(@)".}
proc Begin*(self: var ImGuiListClipper, items_count: cint, items_height: cfloat = -1.0f) {.header: imguiHeader, importcpp: "#.Begin(@)".}
proc End*(self: var ImGuiListClipper) {.header: imguiHeader, importcpp: "#.End(@)".}
proc Step*(self: var ImGuiListClipper): bool {.header: imguiHeader, importcpp: "#.Step(@)".}
proc Clear*(self: var ImGuiPayload) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc IsDataType*(self: var ImGuiPayload, `type`: cstring): bool {.header: imguiHeader, importcpp: "#.IsDataType(@)".}
proc IsDelivery*(self: var ImGuiPayload): bool {.header: imguiHeader, importcpp: "#.IsDelivery(@)".}
proc IsPreview*(self: var ImGuiPayload): bool {.header: imguiHeader, importcpp: "#.IsPreview(@)".}
proc BuildSortByKey*(self: var ImGuiStorage) {.header: imguiHeader, importcpp: "#.BuildSortByKey(@)".}
proc Clear*(self: var ImGuiStorage) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc GetBool*(self: var ImGuiStorage, key: ImGuiID, default_val: bool = false): bool {.header: imguiHeader, importcpp: "#.GetBool(@)".}
proc GetBoolRef*(self: var ImGuiStorage, key: ImGuiID, default_val: bool = false): ptr bool {.header: imguiHeader, importcpp: "#.GetBoolRef(@)".}
proc GetFloat*(self: var ImGuiStorage, key: ImGuiID, default_val: cfloat = 0.0f): cfloat {.header: imguiHeader, importcpp: "#.GetFloat(@)".}
proc GetFloatRef*(self: var ImGuiStorage, key: ImGuiID, default_val: cfloat = 0.0f): ptr cfloat {.header: imguiHeader, importcpp: "#.GetFloatRef(@)".}
proc GetInt*(self: var ImGuiStorage, key: ImGuiID, default_val: cint = 0): cint {.header: imguiHeader, importcpp: "#.GetInt(@)".}
proc GetIntRef*(self: var ImGuiStorage, key: ImGuiID, default_val: cint = 0): ptr cint {.header: imguiHeader, importcpp: "#.GetIntRef(@)".}
proc GetVoidPtr*(self: var ImGuiStorage, key: ImGuiID): pointer {.header: imguiHeader, importcpp: "#.GetVoidPtr(@)".}
proc GetVoidPtrRef*(self: var ImGuiStorage, key: ImGuiID, default_val: pointer = nil): pointer {.header: imguiHeader, importcpp: "#.GetVoidPtrRef(@)".}
proc SetAllInt*(self: var ImGuiStorage, val: cint) {.header: imguiHeader, importcpp: "#.SetAllInt(@)".}
proc SetBool*(self: var ImGuiStorage, key: ImGuiID, val: bool) {.header: imguiHeader, importcpp: "#.SetBool(@)".}
proc SetFloat*(self: var ImGuiStorage, key: ImGuiID, val: cfloat) {.header: imguiHeader, importcpp: "#.SetFloat(@)".}
proc SetInt*(self: var ImGuiStorage, key: ImGuiID, val: cint) {.header: imguiHeader, importcpp: "#.SetInt(@)".}
proc SetVoidPtr*(self: var ImGuiStorage, key: ImGuiID, val: pointer) {.header: imguiHeader, importcpp: "#.SetVoidPtr(@)".}
proc ScaleAllSizes*(self: var ImGuiStyle, scale_factor: cfloat) {.header: imguiHeader, importcpp: "#.ScaleAllSizes(@)".}
proc Build*(self: var ImGuiTextFilter) {.header: imguiHeader, importcpp: "#.Build(@)".}
proc Clear*(self: var ImGuiTextFilter) {.header: imguiHeader, importcpp: "#.Clear(@)".}
proc Draw*(self: var ImGuiTextFilter, label: cstring = "Filter(inc,-exc)", width: cfloat = 0.0f): bool {.header: imguiHeader, importcpp: "#.Draw(@)".}
proc IsActive*(self: var ImGuiTextFilter): bool {.header: imguiHeader, importcpp: "#.IsActive(@)".}
proc PassFilter*(self: var ImGuiTextFilter, text: cstring, text_end: cstring = nil): bool {.header: imguiHeader, importcpp: "#.PassFilter(@)".}
proc back*[T](self: var ImVector[T]): var T {.header: imguiHeader, importcpp: "#.back(@)".}
proc begin*[T](self: var ImVector[T]): ptr T {.header: imguiHeader, importcpp: "#.begin(@)".}
proc capacity*[T](self: var ImVector[T]): cint {.header: imguiHeader, importcpp: "#.capacity(@)".}
proc clear*[T](self: var ImVector[T]) {.header: imguiHeader, importcpp: "#.clear(@)".}
proc contains*[T](self: var ImVector[T], v: T): bool {.header: imguiHeader, importcpp: "#.contains(@)".}
proc empty*[T](self: var ImVector[T]): bool {.header: imguiHeader, importcpp: "#.empty(@)".}
proc `end`*[T](self: var ImVector[T]): ptr T {.header: imguiHeader, importcpp: "#.end(@)".}
proc erase*[T](self: var ImVector[T], it: ptr T): ptr T {.header: imguiHeader, importcpp: "#.erase(@)".}
proc erase*[T](self: var ImVector[T], it: ptr T, it_last: ptr T): ptr T {.header: imguiHeader, importcpp: "#.erase(@)".}
proc erase_unsorted*[T](self: var ImVector[T], it: ptr T): ptr T {.header: imguiHeader, importcpp: "#.erase_unsorted(@)".}
proc find*[T](self: var ImVector[T], v: T): ptr T {.header: imguiHeader, importcpp: "#.find(@)".}
proc find_erase*[T](self: var ImVector[T], v: T): bool {.header: imguiHeader, importcpp: "#.find_erase(@)".}
proc find_erase_unsorted*[T](self: var ImVector[T], v: T): bool {.header: imguiHeader, importcpp: "#.find_erase_unsorted(@)".}
proc front*[T](self: var ImVector[T]): var T {.header: imguiHeader, importcpp: "#.front(@)".}
proc index_from_ptr*[T](self: var ImVector[T], it: ptr T): cint {.header: imguiHeader, importcpp: "#.index_from_ptr(@)".}
proc insert*[T](self: var ImVector[T], it: ptr T, v: T): ptr T {.header: imguiHeader, importcpp: "#.insert(@)".}
proc pop_back*[T](self: var ImVector[T]) {.header: imguiHeader, importcpp: "#.pop_back(@)".}
proc push_back*[T](self: var ImVector[T], v: T) {.header: imguiHeader, importcpp: "#.push_back(@)".}
proc push_front*[T](self: var ImVector[T], v: T) {.header: imguiHeader, importcpp: "#.push_front(@)".}
proc reserve*[T](self: var ImVector[T], new_capacity: cint) {.header: imguiHeader, importcpp: "#.reserve(@)".}
proc resize*[T](self: var ImVector[T], new_size: cint) {.header: imguiHeader, importcpp: "#.resize(@)".}
proc resize*[T](self: var ImVector[T], new_size: cint, v: T) {.header: imguiHeader, importcpp: "#.resize(@)".}
proc size*[T](self: var ImVector[T]): cint {.header: imguiHeader, importcpp: "#.size(@)".}
proc size_in_bytes*[T](self: var ImVector[T]): cint {.header: imguiHeader, importcpp: "#.size_in_bytes(@)".}
proc swap*[T](self: var ImVector[T], rhs: var ImVector) {.header: imguiHeader, importcpp: "#.swap(@)".}
proc AcceptDragDropPayload*(`type`: cstring, flags: ImGuiDragDropFlags = 0): ptr ImGuiPayload {.header: imguiHeader, importcpp: "ImGui::AcceptDragDropPayload(@)".}
proc AlignTextToFramePadding*() {.header: imguiHeader, importcpp: "ImGui::AlignTextToFramePadding(@)".}
proc ArrowButton*(str_id: cstring, dir: ImGuiDir): bool {.header: imguiHeader, importcpp: "ImGui::ArrowButton(@)".}
proc Begin*(name: cstring, p_open: ptr bool = nil, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::Begin(@)".}
proc BeginChild*(str_id: cstring, size: ImVec2 = initImVec2(0,0), border: bool = false, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginChild(@)".}
proc BeginChild*(id: ImGuiID, size: ImVec2 = initImVec2(0,0), border: bool = false, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginChild(@)".}
proc BeginChildFrame*(id: ImGuiID, size: ImVec2, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginChildFrame(@)".}
proc BeginCombo*(label: cstring, preview_value: cstring, flags: ImGuiComboFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginCombo(@)".}
proc BeginDragDropSource*(flags: ImGuiDragDropFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginDragDropSource(@)".}
proc BeginDragDropTarget*(): bool {.header: imguiHeader, importcpp: "ImGui::BeginDragDropTarget(@)".}
proc BeginGroup*() {.header: imguiHeader, importcpp: "ImGui::BeginGroup(@)".}
proc BeginMainMenuBar*(): bool {.header: imguiHeader, importcpp: "ImGui::BeginMainMenuBar(@)".}
proc BeginMenu*(label: cstring, enabled: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::BeginMenu(@)".}
proc BeginMenuBar*(): bool {.header: imguiHeader, importcpp: "ImGui::BeginMenuBar(@)".}
proc BeginPopup*(str_id: cstring, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginPopup(@)".}
proc BeginPopupContextItem*(str_id: cstring = nil, mouse_button: cint = 1): bool {.header: imguiHeader, importcpp: "ImGui::BeginPopupContextItem(@)".}
proc BeginPopupContextVoid*(str_id: cstring = nil, mouse_button: cint = 1): bool {.header: imguiHeader, importcpp: "ImGui::BeginPopupContextVoid(@)".}
proc BeginPopupContextWindow*(str_id: cstring = nil, mouse_button: cint = 1, also_over_items: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::BeginPopupContextWindow(@)".}
proc BeginPopupModal*(name: cstring, p_open: ptr bool = nil, flags: ImGuiWindowFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginPopupModal(@)".}
proc BeginTabBar*(str_id: cstring, flags: ImGuiTabBarFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginTabBar(@)".}
proc BeginTabItem*(label: cstring, p_open: ptr bool = nil, flags: ImGuiTabItemFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::BeginTabItem(@)".}
proc BeginTooltip*() {.header: imguiHeader, importcpp: "ImGui::BeginTooltip(@)".}
proc Bullet*() {.header: imguiHeader, importcpp: "ImGui::Bullet(@)".}
proc BulletText*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::BulletText(@)", varargs.}
proc BulletTextV*(fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::BulletTextV(@)".}
proc Button*(label: cstring, size: ImVec2 = initImVec2(0,0)): bool {.header: imguiHeader, importcpp: "ImGui::Button(@)".}
proc CalcItemWidth*(): cfloat {.header: imguiHeader, importcpp: "ImGui::CalcItemWidth(@)".}
proc CalcListClipping*(items_count: cint, items_height: cfloat, out_items_display_start: ptr cint, out_items_display_end: ptr cint) {.header: imguiHeader, importcpp: "ImGui::CalcListClipping(@)".}
proc CalcTextSize*(text: cstring, text_end: cstring = nil, hide_text_after_double_hash: bool = false, wrap_width: cfloat = -1.0f): ImVec2 {.header: imguiHeader, importcpp: "ImGui::CalcTextSize(@)".}
proc CaptureKeyboardFromApp*(want_capture_keyboard_value: bool = true) {.header: imguiHeader, importcpp: "ImGui::CaptureKeyboardFromApp(@)".}
proc CaptureMouseFromApp*(want_capture_mouse_value: bool = true) {.header: imguiHeader, importcpp: "ImGui::CaptureMouseFromApp(@)".}
proc Checkbox*(label: cstring, v: ptr bool): bool {.header: imguiHeader, importcpp: "ImGui::Checkbox(@)".}
proc CheckboxFlags*(label: cstring, flags: ptr cuint, flags_value: cuint): bool {.header: imguiHeader, importcpp: "ImGui::CheckboxFlags(@)".}
proc CloseCurrentPopup*() {.header: imguiHeader, importcpp: "ImGui::CloseCurrentPopup(@)".}
proc CollapsingHeader*(label: cstring, flags: ImGuiTreeNodeFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::CollapsingHeader(@)".}
proc CollapsingHeader*(label: cstring, p_open: ptr bool, flags: ImGuiTreeNodeFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::CollapsingHeader(@)".}
proc ColorButton*(desc_id: cstring, col: ImVec4, flags: ImGuiColorEditFlags = 0, size: ImVec2 = initImVec2(0,0)): bool {.header: imguiHeader, importcpp: "ImGui::ColorButton(@)".}
proc ColorConvertFloat4ToU32*(`in`: ImVec4): ImU32 {.header: imguiHeader, importcpp: "ImGui::ColorConvertFloat4ToU32(@)".}
proc ColorConvertHSVtoRGB*(h: cfloat, s: cfloat, v: cfloat, out_r: var cfloat, out_g: var cfloat, out_b: var cfloat) {.header: imguiHeader, importcpp: "ImGui::ColorConvertHSVtoRGB(@)".}
proc ColorConvertRGBtoHSV*(r: cfloat, g: cfloat, b: cfloat, out_h: var cfloat, out_s: var cfloat, out_v: var cfloat) {.header: imguiHeader, importcpp: "ImGui::ColorConvertRGBtoHSV(@)".}
proc ColorConvertU32ToFloat4*(`in`: ImU32): ImVec4 {.header: imguiHeader, importcpp: "ImGui::ColorConvertU32ToFloat4(@)".}
proc ColorEdit3*(label: cstring, col: array[3, cfloat], flags: ImGuiColorEditFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::ColorEdit3(@)".}
proc ColorEdit4*(label: cstring, col: array[4, cfloat], flags: ImGuiColorEditFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::ColorEdit4(@)".}
proc ColorPicker3*(label: cstring, col: array[3, cfloat], flags: ImGuiColorEditFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::ColorPicker3(@)".}
proc ColorPicker4*(label: cstring, col: array[4, cfloat], flags: ImGuiColorEditFlags = 0, ref_col: ptr cfloat = nil): bool {.header: imguiHeader, importcpp: "ImGui::ColorPicker4(@)".}
proc Columns*(count: cint = 1, id: cstring = nil, border: bool = true) {.header: imguiHeader, importcpp: "ImGui::Columns(@)".}
proc Combo*(label: cstring, current_item: ptr cint, items: ptr ptr cchar, items_count: cint, popup_max_height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::Combo(@)".}
proc Combo*(label: cstring, current_item: ptr cint, items_separated_by_zeros: cstring, popup_max_height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::Combo(@)".}
proc Combo*(label: cstring, current_item: ptr cint, items_getter: proc (data: pointer, idx: cint, out_text: ptr ptr cchar): bool {.cdecl.}, data: pointer, items_count: cint, popup_max_height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::Combo(@)".}
proc CreateContext*(shared_font_atlas: ptr ImFontAtlas = nil): ptr ImGuiContext {.header: imguiHeader, importcpp: "ImGui::CreateContext(@)".}
proc DebugCheckVersionAndDataLayout*(version_str: cstring, sz_io: csize, sz_style: csize, sz_vec2: csize, sz_vec4: csize, sz_drawvert: csize, sz_drawidx: csize): bool {.header: imguiHeader, importcpp: "ImGui::DebugCheckVersionAndDataLayout(@)".}
proc DestroyContext*(ctx: ptr ImGuiContext = nil) {.header: imguiHeader, importcpp: "ImGui::DestroyContext(@)".}
proc DragFloat*(label: cstring, v: ptr cfloat, v_speed: cfloat = 1.0f, v_min: cfloat = 0.0f, v_max: cfloat = 0.0f, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragFloat(@)".}
proc DragFloat2*(label: cstring, v: array[2, cfloat], v_speed: cfloat = 1.0f, v_min: cfloat = 0.0f, v_max: cfloat = 0.0f, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragFloat2(@)".}
proc DragFloat3*(label: cstring, v: array[3, cfloat], v_speed: cfloat = 1.0f, v_min: cfloat = 0.0f, v_max: cfloat = 0.0f, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragFloat3(@)".}
proc DragFloat4*(label: cstring, v: array[4, cfloat], v_speed: cfloat = 1.0f, v_min: cfloat = 0.0f, v_max: cfloat = 0.0f, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragFloat4(@)".}
proc DragFloatRange2*(label: cstring, v_current_min: ptr cfloat, v_current_max: ptr cfloat, v_speed: cfloat = 1.0f, v_min: cfloat = 0.0f, v_max: cfloat = 0.0f, format: cstring = "%.3f", format_max: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragFloatRange2(@)".}
proc DragInt*(label: cstring, v: ptr cint, v_speed: cfloat = 1.0f, v_min: cint = 0, v_max: cint = 0, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::DragInt(@)".}
proc DragInt2*(label: cstring, v: array[2, cint], v_speed: cfloat = 1.0f, v_min: cint = 0, v_max: cint = 0, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::DragInt2(@)".}
proc DragInt3*(label: cstring, v: array[3, cint], v_speed: cfloat = 1.0f, v_min: cint = 0, v_max: cint = 0, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::DragInt3(@)".}
proc DragInt4*(label: cstring, v: array[4, cint], v_speed: cfloat = 1.0f, v_min: cint = 0, v_max: cint = 0, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::DragInt4(@)".}
proc DragIntRange2*(label: cstring, v_current_min: ptr cint, v_current_max: ptr cint, v_speed: cfloat = 1.0f, v_min: cint = 0, v_max: cint = 0, format: cstring = "%d", format_max: cstring = nil): bool {.header: imguiHeader, importcpp: "ImGui::DragIntRange2(@)".}
proc DragScalar*(label: cstring, data_type: ImGuiDataType, v: pointer, v_speed: cfloat, v_min: pointer = nil, v_max: pointer = nil, format: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragScalar(@)".}
proc DragScalarN*(label: cstring, data_type: ImGuiDataType, v: pointer, components: cint, v_speed: cfloat, v_min: pointer = nil, v_max: pointer = nil, format: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::DragScalarN(@)".}
proc Dummy*(size: ImVec2) {.header: imguiHeader, importcpp: "ImGui::Dummy(@)".}
proc End*() {.header: imguiHeader, importcpp: "ImGui::End(@)".}
proc EndChild*() {.header: imguiHeader, importcpp: "ImGui::EndChild(@)".}
proc EndChildFrame*() {.header: imguiHeader, importcpp: "ImGui::EndChildFrame(@)".}
proc EndCombo*() {.header: imguiHeader, importcpp: "ImGui::EndCombo(@)".}
proc EndDragDropSource*() {.header: imguiHeader, importcpp: "ImGui::EndDragDropSource(@)".}
proc EndDragDropTarget*() {.header: imguiHeader, importcpp: "ImGui::EndDragDropTarget(@)".}
proc EndFrame*() {.header: imguiHeader, importcpp: "ImGui::EndFrame(@)".}
proc EndGroup*() {.header: imguiHeader, importcpp: "ImGui::EndGroup(@)".}
proc EndMainMenuBar*() {.header: imguiHeader, importcpp: "ImGui::EndMainMenuBar(@)".}
proc EndMenu*() {.header: imguiHeader, importcpp: "ImGui::EndMenu(@)".}
proc EndMenuBar*() {.header: imguiHeader, importcpp: "ImGui::EndMenuBar(@)".}
proc EndPopup*() {.header: imguiHeader, importcpp: "ImGui::EndPopup(@)".}
proc EndTabBar*() {.header: imguiHeader, importcpp: "ImGui::EndTabBar(@)".}
proc EndTabItem*() {.header: imguiHeader, importcpp: "ImGui::EndTabItem(@)".}
proc EndTooltip*() {.header: imguiHeader, importcpp: "ImGui::EndTooltip(@)".}
proc GetBackgroundDrawList*(): ptr ImDrawList {.header: imguiHeader, importcpp: "ImGui::GetBackgroundDrawList(@)".}
proc GetClipboardText*(): cstring {.header: imguiHeader, importcpp: "ImGui::GetClipboardText(@)".}
proc GetColorU32*(idx: ImGuiCol, alpha_mul: cfloat = 1.0f): ImU32 {.header: imguiHeader, importcpp: "ImGui::GetColorU32(@)".}
proc GetColorU32*(col: ImVec4): ImU32 {.header: imguiHeader, importcpp: "ImGui::GetColorU32(@)".}
proc GetColorU32*(col: ImU32): ImU32 {.header: imguiHeader, importcpp: "ImGui::GetColorU32(@)".}
proc GetColumnIndex*(): cint {.header: imguiHeader, importcpp: "ImGui::GetColumnIndex(@)".}
proc GetColumnOffset*(column_index: cint = -1): cfloat {.header: imguiHeader, importcpp: "ImGui::GetColumnOffset(@)".}
proc GetColumnWidth*(column_index: cint = -1): cfloat {.header: imguiHeader, importcpp: "ImGui::GetColumnWidth(@)".}
proc GetColumnsCount*(): cint {.header: imguiHeader, importcpp: "ImGui::GetColumnsCount(@)".}
proc GetContentRegionAvail*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetContentRegionAvail(@)".}
proc GetContentRegionMax*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetContentRegionMax(@)".}
proc GetCurrentContext*(): ptr ImGuiContext {.header: imguiHeader, importcpp: "ImGui::GetCurrentContext(@)".}
proc GetCursorPos*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetCursorPos(@)".}
proc GetCursorPosX*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetCursorPosX(@)".}
proc GetCursorPosY*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetCursorPosY(@)".}
proc GetCursorScreenPos*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetCursorScreenPos(@)".}
proc GetCursorStartPos*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetCursorStartPos(@)".}
proc GetDragDropPayload*(): ptr ImGuiPayload {.header: imguiHeader, importcpp: "ImGui::GetDragDropPayload(@)".}
proc GetDrawData*(): ptr ImDrawData {.header: imguiHeader, importcpp: "ImGui::GetDrawData(@)".}
proc GetDrawListSharedData*(): ptr ImDrawListSharedData {.header: imguiHeader, importcpp: "ImGui::GetDrawListSharedData(@)".}
proc GetFont*(): ptr ImFont {.header: imguiHeader, importcpp: "ImGui::GetFont(@)".}
proc GetFontSize*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetFontSize(@)".}
proc GetFontTexUvWhitePixel*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetFontTexUvWhitePixel(@)".}
proc GetForegroundDrawList*(): ptr ImDrawList {.header: imguiHeader, importcpp: "ImGui::GetForegroundDrawList(@)".}
proc GetFrameCount*(): cint {.header: imguiHeader, importcpp: "ImGui::GetFrameCount(@)".}
proc GetFrameHeight*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetFrameHeight(@)".}
proc GetFrameHeightWithSpacing*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetFrameHeightWithSpacing(@)".}
proc GetID*(str_id: cstring): ImGuiID {.header: imguiHeader, importcpp: "ImGui::GetID(@)".}
proc GetID*(str_id_begin: cstring, str_id_end: cstring): ImGuiID {.header: imguiHeader, importcpp: "ImGui::GetID(@)".}
proc GetID*(ptr_id: pointer): ImGuiID {.header: imguiHeader, importcpp: "ImGui::GetID(@)".}
proc GetIO*(): var ImGuiIO {.header: imguiHeader, importcpp: "ImGui::GetIO(@)".}
proc GetItemRectMax*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetItemRectMax(@)".}
proc GetItemRectMin*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetItemRectMin(@)".}
proc GetItemRectSize*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetItemRectSize(@)".}
proc GetKeyIndex*(imgui_key: ImGuiKey): cint {.header: imguiHeader, importcpp: "ImGui::GetKeyIndex(@)".}
proc GetKeyPressedAmount*(key_index: cint, repeat_delay: cfloat, rate: cfloat): cint {.header: imguiHeader, importcpp: "ImGui::GetKeyPressedAmount(@)".}
proc GetMouseCursor*(): ImGuiMouseCursor {.header: imguiHeader, importcpp: "ImGui::GetMouseCursor(@)".}
proc GetMouseDragDelta*(button: cint = 0, lock_threshold: cfloat = -1.0f): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetMouseDragDelta(@)".}
proc GetMousePos*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetMousePos(@)".}
proc GetMousePosOnOpeningCurrentPopup*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetMousePosOnOpeningCurrentPopup(@)".}
proc GetScrollMaxX*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetScrollMaxX(@)".}
proc GetScrollMaxY*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetScrollMaxY(@)".}
proc GetScrollX*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetScrollX(@)".}
proc GetScrollY*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetScrollY(@)".}
proc GetStateStorage*(): ptr ImGuiStorage {.header: imguiHeader, importcpp: "ImGui::GetStateStorage(@)".}
proc GetStyle*(): var ImGuiStyle {.header: imguiHeader, importcpp: "ImGui::GetStyle(@)".}
proc GetStyleColorName*(idx: ImGuiCol): cstring {.header: imguiHeader, importcpp: "ImGui::GetStyleColorName(@)".}
proc GetStyleColorVec4*(idx: ImGuiCol): var ImVec4 {.header: imguiHeader, importcpp: "ImGui::GetStyleColorVec4(@)".}
proc GetTextLineHeight*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetTextLineHeight(@)".}
proc GetTextLineHeightWithSpacing*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetTextLineHeightWithSpacing(@)".}
proc GetTime*(): cdouble {.header: imguiHeader, importcpp: "ImGui::GetTime(@)".}
proc GetTreeNodeToLabelSpacing*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetTreeNodeToLabelSpacing(@)".}
proc GetVersion*(): cstring {.header: imguiHeader, importcpp: "ImGui::GetVersion(@)".}
proc GetWindowContentRegionMax*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetWindowContentRegionMax(@)".}
proc GetWindowContentRegionMin*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetWindowContentRegionMin(@)".}
proc GetWindowContentRegionWidth*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetWindowContentRegionWidth(@)".}
proc GetWindowDrawList*(): ptr ImDrawList {.header: imguiHeader, importcpp: "ImGui::GetWindowDrawList(@)".}
proc GetWindowHeight*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetWindowHeight(@)".}
proc GetWindowPos*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetWindowPos(@)".}
proc GetWindowSize*(): ImVec2 {.header: imguiHeader, importcpp: "ImGui::GetWindowSize(@)".}
proc GetWindowWidth*(): cfloat {.header: imguiHeader, importcpp: "ImGui::GetWindowWidth(@)".}
proc Image*(user_texture_id: ImTextureID, size: ImVec2, uv0: ImVec2 = initImVec2(0,0), uv1: ImVec2 = initImVec2(1,1), tint_col: ImVec4 = initImVec4(1,1,1,1), border_col: ImVec4 = initImVec4(0,0,0,0)) {.header: imguiHeader, importcpp: "ImGui::Image(@)".}
proc ImageButton*(user_texture_id: ImTextureID, size: ImVec2, uv0: ImVec2 = initImVec2(0,0), uv1: ImVec2 = initImVec2(1,1), frame_padding: cint = -1, bg_col: ImVec4 = initImVec4(0,0,0,0), tint_col: ImVec4 = initImVec4(1,1,1,1)): bool {.header: imguiHeader, importcpp: "ImGui::ImageButton(@)".}
proc Indent*(indent_w: cfloat = 0.0f) {.header: imguiHeader, importcpp: "ImGui::Indent(@)".}
proc InputDouble*(label: cstring, v: ptr cdouble, step: cdouble = 0.0, step_fast: cdouble = 0.0, format: cstring = "%.6f", flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputDouble(@)".}
proc InputFloat*(label: cstring, v: ptr cfloat, step: cfloat = 0.0f, step_fast: cfloat = 0.0f, format: cstring = "%.3f", flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputFloat(@)".}
proc InputFloat2*(label: cstring, v: array[2, cfloat], format: cstring = "%.3f", flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputFloat2(@)".}
proc InputFloat3*(label: cstring, v: array[3, cfloat], format: cstring = "%.3f", flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputFloat3(@)".}
proc InputFloat4*(label: cstring, v: array[4, cfloat], format: cstring = "%.3f", flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputFloat4(@)".}
proc InputInt*(label: cstring, v: ptr cint, step: cint = 1, step_fast: cint = 100, flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputInt(@)".}
proc InputInt2*(label: cstring, v: array[2, cint], flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputInt2(@)".}
proc InputInt3*(label: cstring, v: array[3, cint], flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputInt3(@)".}
proc InputInt4*(label: cstring, v: array[4, cint], flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputInt4(@)".}
proc InputScalar*(label: cstring, data_type: ImGuiDataType, v: pointer, step: pointer = nil, step_fast: pointer = nil, format: cstring = nil, flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputScalar(@)".}
proc InputScalarN*(label: cstring, data_type: ImGuiDataType, v: pointer, components: cint, step: pointer = nil, step_fast: pointer = nil, format: cstring = nil, flags: ImGuiInputTextFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::InputScalarN(@)".}
proc InputText*(label: cstring, buf: ptr cchar, buf_size: csize, flags: ImGuiInputTextFlags = 0, callback: ImGuiInputTextCallback = nil, user_data: pointer = nil): bool {.header: imguiHeader, importcpp: "ImGui::InputText(@)".}
proc InputTextMultiline*(label: cstring, buf: ptr cchar, buf_size: csize, size: ImVec2 = initImVec2(0,0), flags: ImGuiInputTextFlags = 0, callback: ImGuiInputTextCallback = nil, user_data: pointer = nil): bool {.header: imguiHeader, importcpp: "ImGui::InputTextMultiline(@)".}
proc InputTextWithHint*(label: cstring, hint: cstring, buf: ptr cchar, buf_size: csize, flags: ImGuiInputTextFlags = 0, callback: ImGuiInputTextCallback = nil, user_data: pointer = nil): bool {.header: imguiHeader, importcpp: "ImGui::InputTextWithHint(@)".}
proc InvisibleButton*(str_id: cstring, size: ImVec2): bool {.header: imguiHeader, importcpp: "ImGui::InvisibleButton(@)".}
proc IsAnyItemActive*(): bool {.header: imguiHeader, importcpp: "ImGui::IsAnyItemActive(@)".}
proc IsAnyItemFocused*(): bool {.header: imguiHeader, importcpp: "ImGui::IsAnyItemFocused(@)".}
proc IsAnyItemHovered*(): bool {.header: imguiHeader, importcpp: "ImGui::IsAnyItemHovered(@)".}
proc IsAnyMouseDown*(): bool {.header: imguiHeader, importcpp: "ImGui::IsAnyMouseDown(@)".}
proc IsItemActivated*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemActivated(@)".}
proc IsItemActive*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemActive(@)".}
proc IsItemClicked*(mouse_button: cint = 0): bool {.header: imguiHeader, importcpp: "ImGui::IsItemClicked(@)".}
proc IsItemDeactivated*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemDeactivated(@)".}
proc IsItemDeactivatedAfterEdit*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemDeactivatedAfterEdit(@)".}
proc IsItemEdited*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemEdited(@)".}
proc IsItemFocused*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemFocused(@)".}
proc IsItemHovered*(flags: ImGuiHoveredFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::IsItemHovered(@)".}
proc IsItemVisible*(): bool {.header: imguiHeader, importcpp: "ImGui::IsItemVisible(@)".}
proc IsKeyDown*(user_key_index: cint): bool {.header: imguiHeader, importcpp: "ImGui::IsKeyDown(@)".}
proc IsKeyPressed*(user_key_index: cint, repeat: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::IsKeyPressed(@)".}
proc IsKeyReleased*(user_key_index: cint): bool {.header: imguiHeader, importcpp: "ImGui::IsKeyReleased(@)".}
proc IsMouseClicked*(button: cint, repeat: bool = false): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseClicked(@)".}
proc IsMouseDoubleClicked*(button: cint): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseDoubleClicked(@)".}
proc IsMouseDown*(button: cint): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseDown(@)".}
proc IsMouseDragging*(button: cint = 0, lock_threshold: cfloat = -1.0f): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseDragging(@)".}
proc IsMouseHoveringRect*(r_min: ImVec2, r_max: ImVec2, clip: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseHoveringRect(@)".}
proc IsMousePosValid*(mouse_pos: ptr ImVec2 = nil): bool {.header: imguiHeader, importcpp: "ImGui::IsMousePosValid(@)".}
proc IsMouseReleased*(button: cint): bool {.header: imguiHeader, importcpp: "ImGui::IsMouseReleased(@)".}
proc IsPopupOpen*(str_id: cstring): bool {.header: imguiHeader, importcpp: "ImGui::IsPopupOpen(@)".}
proc IsRectVisible*(size: ImVec2): bool {.header: imguiHeader, importcpp: "ImGui::IsRectVisible(@)".}
proc IsRectVisible*(rect_min: ImVec2, rect_max: ImVec2): bool {.header: imguiHeader, importcpp: "ImGui::IsRectVisible(@)".}
proc IsWindowAppearing*(): bool {.header: imguiHeader, importcpp: "ImGui::IsWindowAppearing(@)".}
proc IsWindowCollapsed*(): bool {.header: imguiHeader, importcpp: "ImGui::IsWindowCollapsed(@)".}
proc IsWindowFocused*(flags: ImGuiFocusedFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::IsWindowFocused(@)".}
proc IsWindowHovered*(flags: ImGuiHoveredFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::IsWindowHovered(@)".}
proc LabelText*(label: cstring, fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::LabelText(@)", varargs.}
proc LabelTextV*(label: cstring, fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::LabelTextV(@)".}
proc ListBox*(label: cstring, current_item: ptr cint, items: ptr ptr cchar, items_count: cint, height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::ListBox(@)".}
proc ListBox*(label: cstring, current_item: ptr cint, items_getter: proc (data: pointer, idx: cint, out_text: ptr ptr cchar): bool {.cdecl.}, data: pointer, items_count: cint, height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::ListBox(@)".}
proc ListBoxFooter*() {.header: imguiHeader, importcpp: "ImGui::ListBoxFooter(@)".}
proc ListBoxHeader*(label: cstring, size: ImVec2 = initImVec2(0,0)): bool {.header: imguiHeader, importcpp: "ImGui::ListBoxHeader(@)".}
proc ListBoxHeader*(label: cstring, items_count: cint, height_in_items: cint = -1): bool {.header: imguiHeader, importcpp: "ImGui::ListBoxHeader(@)".}
proc LoadIniSettingsFromDisk*(ini_filename: cstring) {.header: imguiHeader, importcpp: "ImGui::LoadIniSettingsFromDisk(@)".}
proc LoadIniSettingsFromMemory*(ini_data: cstring, ini_size: csize = 0) {.header: imguiHeader, importcpp: "ImGui::LoadIniSettingsFromMemory(@)".}
proc LogButtons*() {.header: imguiHeader, importcpp: "ImGui::LogButtons(@)".}
proc LogFinish*() {.header: imguiHeader, importcpp: "ImGui::LogFinish(@)".}
proc LogText*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::LogText(@)", varargs.}
proc LogToClipboard*(auto_open_depth: cint = -1) {.header: imguiHeader, importcpp: "ImGui::LogToClipboard(@)".}
proc LogToFile*(auto_open_depth: cint = -1, filename: cstring = nil) {.header: imguiHeader, importcpp: "ImGui::LogToFile(@)".}
proc LogToTTY*(auto_open_depth: cint = -1) {.header: imguiHeader, importcpp: "ImGui::LogToTTY(@)".}
proc MemAlloc*(size: csize): pointer {.header: imguiHeader, importcpp: "ImGui::MemAlloc(@)".}
proc MemFree*(`ptr`: pointer) {.header: imguiHeader, importcpp: "ImGui::MemFree(@)".}
proc MenuItem*(label: cstring, shortcut: cstring = nil, selected: bool = false, enabled: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::MenuItem(@)".}
proc MenuItem*(label: cstring, shortcut: cstring, p_selected: ptr bool, enabled: bool = true): bool {.header: imguiHeader, importcpp: "ImGui::MenuItem(@)".}
proc NewFrame*() {.header: imguiHeader, importcpp: "ImGui::NewFrame(@)".}
proc NewLine*() {.header: imguiHeader, importcpp: "ImGui::NewLine(@)".}
proc NextColumn*() {.header: imguiHeader, importcpp: "ImGui::NextColumn(@)".}
proc OpenPopup*(str_id: cstring) {.header: imguiHeader, importcpp: "ImGui::OpenPopup(@)".}
proc OpenPopupOnItemClick*(str_id: cstring = nil, mouse_button: cint = 1): bool {.header: imguiHeader, importcpp: "ImGui::OpenPopupOnItemClick(@)".}
proc PlotHistogram*(label: cstring, values: ptr cfloat, values_count: cint, values_offset: cint = 0, overlay_text: cstring = nil, scale_min: cfloat = high(cfloat), scale_max: cfloat = high(cfloat), graph_size: ImVec2 = initImVec2(0,0), stride: cint = sizeof(cfloat).cint) {.header: imguiHeader, importcpp: "ImGui::PlotHistogram(@)".}
proc PlotHistogram*(label: cstring, values_getter: proc (data: pointer, idx: cint): cfloat {.cdecl.}, data: pointer, values_count: cint, values_offset: cint = 0, overlay_text: cstring = nil, scale_min: cfloat = high(cfloat), scale_max: cfloat = high(cfloat), graph_size: ImVec2 = initImVec2(0,0)) {.header: imguiHeader, importcpp: "ImGui::PlotHistogram(@)".}
proc PlotLines*(label: cstring, values: ptr cfloat, values_count: cint, values_offset: cint = 0, overlay_text: cstring = nil, scale_min: cfloat = high(cfloat), scale_max: cfloat = high(cfloat), graph_size: ImVec2 = initImVec2(0,0), stride: cint = sizeof(cfloat).cint) {.header: imguiHeader, importcpp: "ImGui::PlotLines(@)".}
proc PlotLines*(label: cstring, values_getter: proc (data: pointer, idx: cint): cfloat {.cdecl.}, data: pointer, values_count: cint, values_offset: cint = 0, overlay_text: cstring = nil, scale_min: cfloat = high(cfloat), scale_max: cfloat = high(cfloat), graph_size: ImVec2 = initImVec2(0,0)) {.header: imguiHeader, importcpp: "ImGui::PlotLines(@)".}
proc PopAllowKeyboardFocus*() {.header: imguiHeader, importcpp: "ImGui::PopAllowKeyboardFocus(@)".}
proc PopButtonRepeat*() {.header: imguiHeader, importcpp: "ImGui::PopButtonRepeat(@)".}
proc PopClipRect*() {.header: imguiHeader, importcpp: "ImGui::PopClipRect(@)".}
proc PopFont*() {.header: imguiHeader, importcpp: "ImGui::PopFont(@)".}
proc PopID*() {.header: imguiHeader, importcpp: "ImGui::PopID(@)".}
proc PopItemWidth*() {.header: imguiHeader, importcpp: "ImGui::PopItemWidth(@)".}
proc PopStyleColor*(count: cint = 1) {.header: imguiHeader, importcpp: "ImGui::PopStyleColor(@)".}
proc PopStyleVar*(count: cint = 1) {.header: imguiHeader, importcpp: "ImGui::PopStyleVar(@)".}
proc PopTextWrapPos*() {.header: imguiHeader, importcpp: "ImGui::PopTextWrapPos(@)".}
proc ProgressBar*(fraction: cfloat, size_arg: ImVec2 = initImVec2(-1,0), overlay: cstring = nil) {.header: imguiHeader, importcpp: "ImGui::ProgressBar(@)".}
proc PushAllowKeyboardFocus*(allow_keyboard_focus: bool) {.header: imguiHeader, importcpp: "ImGui::PushAllowKeyboardFocus(@)".}
proc PushButtonRepeat*(repeat: bool) {.header: imguiHeader, importcpp: "ImGui::PushButtonRepeat(@)".}
proc PushClipRect*(clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool) {.header: imguiHeader, importcpp: "ImGui::PushClipRect(@)".}
proc PushFont*(font: ptr ImFont) {.header: imguiHeader, importcpp: "ImGui::PushFont(@)".}
proc PushID*(str_id: cstring) {.header: imguiHeader, importcpp: "ImGui::PushID(@)".}
proc PushID*(str_id_begin: cstring, str_id_end: cstring) {.header: imguiHeader, importcpp: "ImGui::PushID(@)".}
proc PushID*(ptr_id: pointer) {.header: imguiHeader, importcpp: "ImGui::PushID(@)".}
proc PushID*(int_id: cint) {.header: imguiHeader, importcpp: "ImGui::PushID(@)".}
proc PushItemWidth*(item_width: cfloat) {.header: imguiHeader, importcpp: "ImGui::PushItemWidth(@)".}
proc PushStyleColor*(idx: ImGuiCol, col: ImU32) {.header: imguiHeader, importcpp: "ImGui::PushStyleColor(@)".}
proc PushStyleColor*(idx: ImGuiCol, col: ImVec4) {.header: imguiHeader, importcpp: "ImGui::PushStyleColor(@)".}
proc PushStyleVar*(idx: ImGuiStyleVar, val: cfloat) {.header: imguiHeader, importcpp: "ImGui::PushStyleVar(@)".}
proc PushStyleVar*(idx: ImGuiStyleVar, val: ImVec2) {.header: imguiHeader, importcpp: "ImGui::PushStyleVar(@)".}
proc PushTextWrapPos*(wrap_local_pos_x: cfloat = 0.0f) {.header: imguiHeader, importcpp: "ImGui::PushTextWrapPos(@)".}
proc RadioButton*(label: cstring, active: bool): bool {.header: imguiHeader, importcpp: "ImGui::RadioButton(@)".}
proc RadioButton*(label: cstring, v: ptr cint, v_button: cint): bool {.header: imguiHeader, importcpp: "ImGui::RadioButton(@)".}
proc Render*() {.header: imguiHeader, importcpp: "ImGui::Render(@)".}
proc ResetMouseDragDelta*(button: cint = 0) {.header: imguiHeader, importcpp: "ImGui::ResetMouseDragDelta(@)".}
proc SameLine*(offset_from_start_x: cfloat = 0.0f, spacing: cfloat = -1.0f) {.header: imguiHeader, importcpp: "ImGui::SameLine(@)".}
proc SaveIniSettingsToDisk*(ini_filename: cstring) {.header: imguiHeader, importcpp: "ImGui::SaveIniSettingsToDisk(@)".}
proc SaveIniSettingsToMemory*(out_ini_size: ptr csize = nil): cstring {.header: imguiHeader, importcpp: "ImGui::SaveIniSettingsToMemory(@)".}
proc Selectable*(label: cstring, selected: bool = false, flags: ImGuiSelectableFlags = 0, size: ImVec2 = initImVec2(0,0)): bool {.header: imguiHeader, importcpp: "ImGui::Selectable(@)".}
proc Selectable*(label: cstring, p_selected: ptr bool, flags: ImGuiSelectableFlags = 0, size: ImVec2 = initImVec2(0,0)): bool {.header: imguiHeader, importcpp: "ImGui::Selectable(@)".}
proc Separator*() {.header: imguiHeader, importcpp: "ImGui::Separator(@)".}
proc SetAllocatorFunctions*(alloc_func: proc (sz: csize, user_data: pointer): pointer {.cdecl.}, free_func: proc (`ptr`: pointer, user_data: pointer) {.cdecl.}, user_data: pointer = nil) {.header: imguiHeader, importcpp: "ImGui::SetAllocatorFunctions(@)".}
proc SetClipboardText*(text: cstring) {.header: imguiHeader, importcpp: "ImGui::SetClipboardText(@)".}
proc SetColorEditOptions*(flags: ImGuiColorEditFlags) {.header: imguiHeader, importcpp: "ImGui::SetColorEditOptions(@)".}
proc SetColumnOffset*(column_index: cint, offset_x: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetColumnOffset(@)".}
proc SetColumnWidth*(column_index: cint, width: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetColumnWidth(@)".}
proc SetCurrentContext*(ctx: ptr ImGuiContext) {.header: imguiHeader, importcpp: "ImGui::SetCurrentContext(@)".}
proc SetCursorPos*(local_pos: ImVec2) {.header: imguiHeader, importcpp: "ImGui::SetCursorPos(@)".}
proc SetCursorPosX*(local_x: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetCursorPosX(@)".}
proc SetCursorPosY*(local_y: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetCursorPosY(@)".}
proc SetCursorScreenPos*(pos: ImVec2) {.header: imguiHeader, importcpp: "ImGui::SetCursorScreenPos(@)".}
proc SetDragDropPayload*(`type`: cstring, data: pointer, sz: csize, cond: ImGuiCond = 0): bool {.header: imguiHeader, importcpp: "ImGui::SetDragDropPayload(@)".}
proc SetItemAllowOverlap*() {.header: imguiHeader, importcpp: "ImGui::SetItemAllowOverlap(@)".}
proc SetItemDefaultFocus*() {.header: imguiHeader, importcpp: "ImGui::SetItemDefaultFocus(@)".}
proc SetKeyboardFocusHere*(offset: cint = 0) {.header: imguiHeader, importcpp: "ImGui::SetKeyboardFocusHere(@)".}
proc SetMouseCursor*(`type`: ImGuiMouseCursor) {.header: imguiHeader, importcpp: "ImGui::SetMouseCursor(@)".}
proc SetNextItemOpen*(is_open: bool, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetNextItemOpen(@)".}
proc SetNextItemWidth*(item_width: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetNextItemWidth(@)".}
proc SetNextWindowBgAlpha*(alpha: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowBgAlpha(@)".}
proc SetNextWindowCollapsed*(collapsed: bool, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowCollapsed(@)".}
proc SetNextWindowContentSize*(size: ImVec2) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowContentSize(@)".}
proc SetNextWindowFocus*() {.header: imguiHeader, importcpp: "ImGui::SetNextWindowFocus(@)".}
proc SetNextWindowPos*(pos: ImVec2, cond: ImGuiCond = 0, pivot: ImVec2 = initImVec2(0,0)) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowPos(@)".}
proc SetNextWindowSize*(size: ImVec2, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowSize(@)".}
proc SetNextWindowSizeConstraints*(size_min: ImVec2, size_max: ImVec2, custom_callback: ImGuiSizeCallback = nil, custom_callback_data: pointer = nil) {.header: imguiHeader, importcpp: "ImGui::SetNextWindowSizeConstraints(@)".}
proc SetScrollFromPosX*(local_x: cfloat, center_x_ratio: cfloat = 0.5f) {.header: imguiHeader, importcpp: "ImGui::SetScrollFromPosX(@)".}
proc SetScrollFromPosY*(local_y: cfloat, center_y_ratio: cfloat = 0.5f) {.header: imguiHeader, importcpp: "ImGui::SetScrollFromPosY(@)".}
proc SetScrollHereX*(center_x_ratio: cfloat = 0.5f) {.header: imguiHeader, importcpp: "ImGui::SetScrollHereX(@)".}
proc SetScrollHereY*(center_y_ratio: cfloat = 0.5f) {.header: imguiHeader, importcpp: "ImGui::SetScrollHereY(@)".}
proc SetScrollX*(scroll_x: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetScrollX(@)".}
proc SetScrollY*(scroll_y: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetScrollY(@)".}
proc SetStateStorage*(storage: ptr ImGuiStorage) {.header: imguiHeader, importcpp: "ImGui::SetStateStorage(@)".}
proc SetTabItemClosed*(tab_or_docked_window_label: cstring) {.header: imguiHeader, importcpp: "ImGui::SetTabItemClosed(@)".}
proc SetTooltip*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::SetTooltip(@)", varargs.}
proc SetTooltipV*(fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::SetTooltipV(@)".}
proc SetWindowCollapsed*(collapsed: bool, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowCollapsed(@)".}
proc SetWindowCollapsed*(name: cstring, collapsed: bool, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowCollapsed(@)".}
proc SetWindowFocus*() {.header: imguiHeader, importcpp: "ImGui::SetWindowFocus(@)".}
proc SetWindowFocus*(name: cstring) {.header: imguiHeader, importcpp: "ImGui::SetWindowFocus(@)".}
proc SetWindowFontScale*(scale: cfloat) {.header: imguiHeader, importcpp: "ImGui::SetWindowFontScale(@)".}
proc SetWindowPos*(pos: ImVec2, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowPos(@)".}
proc SetWindowPos*(name: cstring, pos: ImVec2, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowPos(@)".}
proc SetWindowSize*(size: ImVec2, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowSize(@)".}
proc SetWindowSize*(name: cstring, size: ImVec2, cond: ImGuiCond = 0) {.header: imguiHeader, importcpp: "ImGui::SetWindowSize(@)".}
proc ShowAboutWindow*(p_open: ptr bool = nil) {.header: imguiHeader, importcpp: "ImGui::ShowAboutWindow(@)".}
proc ShowDemoWindow*(p_open: ptr bool = nil) {.header: imguiHeader, importcpp: "ImGui::ShowDemoWindow(@)".}
proc ShowFontSelector*(label: cstring) {.header: imguiHeader, importcpp: "ImGui::ShowFontSelector(@)".}
proc ShowMetricsWindow*(p_open: ptr bool = nil) {.header: imguiHeader, importcpp: "ImGui::ShowMetricsWindow(@)".}
proc ShowStyleEditor*(`ref`: ptr ImGuiStyle = nil) {.header: imguiHeader, importcpp: "ImGui::ShowStyleEditor(@)".}
proc ShowStyleSelector*(label: cstring): bool {.header: imguiHeader, importcpp: "ImGui::ShowStyleSelector(@)".}
proc ShowUserGuide*() {.header: imguiHeader, importcpp: "ImGui::ShowUserGuide(@)".}
proc SliderAngle*(label: cstring, v_rad: ptr cfloat, v_degrees_min: cfloat = -360.0f, v_degrees_max: cfloat = +360.0f, format: cstring = "%.0f deg"): bool {.header: imguiHeader, importcpp: "ImGui::SliderAngle(@)".}
proc SliderFloat*(label: cstring, v: ptr cfloat, v_min: cfloat, v_max: cfloat, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderFloat(@)".}
proc SliderFloat2*(label: cstring, v: array[2, cfloat], v_min: cfloat, v_max: cfloat, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderFloat2(@)".}
proc SliderFloat3*(label: cstring, v: array[3, cfloat], v_min: cfloat, v_max: cfloat, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderFloat3(@)".}
proc SliderFloat4*(label: cstring, v: array[4, cfloat], v_min: cfloat, v_max: cfloat, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderFloat4(@)".}
proc SliderInt*(label: cstring, v: ptr cint, v_min: cint, v_max: cint, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::SliderInt(@)".}
proc SliderInt2*(label: cstring, v: array[2, cint], v_min: cint, v_max: cint, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::SliderInt2(@)".}
proc SliderInt3*(label: cstring, v: array[3, cint], v_min: cint, v_max: cint, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::SliderInt3(@)".}
proc SliderInt4*(label: cstring, v: array[4, cint], v_min: cint, v_max: cint, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::SliderInt4(@)".}
proc SliderScalar*(label: cstring, data_type: ImGuiDataType, v: pointer, v_min: pointer, v_max: pointer, format: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderScalar(@)".}
proc SliderScalarN*(label: cstring, data_type: ImGuiDataType, v: pointer, components: cint, v_min: pointer, v_max: pointer, format: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::SliderScalarN(@)".}
proc SmallButton*(label: cstring): bool {.header: imguiHeader, importcpp: "ImGui::SmallButton(@)".}
proc Spacing*() {.header: imguiHeader, importcpp: "ImGui::Spacing(@)".}
proc StyleColorsClassic*(dst: ptr ImGuiStyle = nil) {.header: imguiHeader, importcpp: "ImGui::StyleColorsClassic(@)".}
proc StyleColorsDark*(dst: ptr ImGuiStyle = nil) {.header: imguiHeader, importcpp: "ImGui::StyleColorsDark(@)".}
proc StyleColorsLight*(dst: ptr ImGuiStyle = nil) {.header: imguiHeader, importcpp: "ImGui::StyleColorsLight(@)".}
proc Text*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::Text(@)", varargs.}
proc TextColored*(col: ImVec4, fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::TextColored(@)", varargs.}
proc TextColoredV*(col: ImVec4, fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::TextColoredV(@)".}
proc TextDisabled*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::TextDisabled(@)", varargs.}
proc TextDisabledV*(fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::TextDisabledV(@)".}
proc TextUnformatted*(text: cstring, text_end: cstring = nil) {.header: imguiHeader, importcpp: "ImGui::TextUnformatted(@)".}
proc TextV*(fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::TextV(@)".}
proc TextWrapped*(fmt: cstring) {.header: imguiHeader, importcpp: "ImGui::TextWrapped(@)", varargs.}
proc TextWrappedV*(fmt: cstring, args: va_list) {.header: imguiHeader, importcpp: "ImGui::TextWrappedV(@)".}
proc TreeNode*(label: cstring): bool {.header: imguiHeader, importcpp: "ImGui::TreeNode(@)".}
proc TreeNode*(str_id: cstring, fmt: cstring): bool {.header: imguiHeader, importcpp: "ImGui::TreeNode(@)", varargs.}
proc TreeNode*(ptr_id: pointer, fmt: cstring): bool {.header: imguiHeader, importcpp: "ImGui::TreeNode(@)", varargs.}
proc TreeNodeEx*(label: cstring, flags: ImGuiTreeNodeFlags = 0): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeEx(@)".}
proc TreeNodeEx*(str_id: cstring, flags: ImGuiTreeNodeFlags, fmt: cstring): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeEx(@)", varargs.}
proc TreeNodeEx*(ptr_id: pointer, flags: ImGuiTreeNodeFlags, fmt: cstring): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeEx(@)", varargs.}
proc TreeNodeExV*(str_id: cstring, flags: ImGuiTreeNodeFlags, fmt: cstring, args: va_list): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeExV(@)".}
proc TreeNodeExV*(ptr_id: pointer, flags: ImGuiTreeNodeFlags, fmt: cstring, args: va_list): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeExV(@)".}
proc TreeNodeV*(str_id: cstring, fmt: cstring, args: va_list): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeV(@)".}
proc TreeNodeV*(ptr_id: pointer, fmt: cstring, args: va_list): bool {.header: imguiHeader, importcpp: "ImGui::TreeNodeV(@)".}
proc TreePop*() {.header: imguiHeader, importcpp: "ImGui::TreePop(@)".}
proc TreePush*(str_id: cstring) {.header: imguiHeader, importcpp: "ImGui::TreePush(@)".}
proc TreePush*(ptr_id: pointer = nil) {.header: imguiHeader, importcpp: "ImGui::TreePush(@)".}
proc Unindent*(indent_w: cfloat = 0.0f) {.header: imguiHeader, importcpp: "ImGui::Unindent(@)".}
proc VSliderFloat*(label: cstring, size: ImVec2, v: ptr cfloat, v_min: cfloat, v_max: cfloat, format: cstring = "%.3f", power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::VSliderFloat(@)".}
proc VSliderInt*(label: cstring, size: ImVec2, v: ptr cint, v_min: cint, v_max: cint, format: cstring = "%d"): bool {.header: imguiHeader, importcpp: "ImGui::VSliderInt(@)".}
proc VSliderScalar*(label: cstring, size: ImVec2, data_type: ImGuiDataType, v: pointer, v_min: pointer, v_max: pointer, format: cstring = nil, power: cfloat = 1.0f): bool {.header: imguiHeader, importcpp: "ImGui::VSliderScalar(@)".}
proc Value*(prefix: cstring, b: bool) {.header: imguiHeader, importcpp: "ImGui::Value(@)".}
proc Value*(prefix: cstring, v: cint) {.header: imguiHeader, importcpp: "ImGui::Value(@)".}
proc Value*(prefix: cstring, v: cuint) {.header: imguiHeader, importcpp: "ImGui::Value(@)".}
proc Value*(prefix: cstring, v: cfloat, float_format: cstring = nil) {.header: imguiHeader, importcpp: "ImGui::Value(@)".}

const
    ImGuiImplOpengl3Header = "<imgui_impl_opengl3.h>"
    ImGuiImplRaylibHeader = "<imgui_impl_raylib.h>"

proc ImGui_ImplOpenGL3_Init*(glsl_version: cstring = nil): bool {.importcpp:"ImGui_ImplOpenGL3_Init(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_Shutdown*() {.importcpp:"ImGui_ImplOpenGL3_Shutdown(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_NewFrame*() {.importcpp:"ImGui_ImplOpenGL3_NewFrame(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_RenderDrawData*(draw_data: ptr ImDrawData) {.importcpp:"ImGui_ImplOpenGL3_RenderDrawData(@)", header:ImGuiImplOpengl3Header.}

proc ImGui_ImplOpenGL3_CreateFontsTexture*(): bool {.importcpp:"ImGui_ImplOpenGL3_CreateFontsTexture(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_DestroyFontsTexture*() {.importcpp:"ImGui_ImplOpenGL3_DestroyFontsTexture(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_CreateDeviceObjects*(): bool {.importcpp:"ImGui_ImplOpenGL3_CreateDeviceObjects(@)", header:ImGuiImplOpengl3Header.}
proc ImGui_ImplOpenGL3_DestroyDeviceObjects*() {.importcpp:"ImGui_ImplOpenGL3_DestroyDeviceObjects(@)", header:ImGuiImplOpengl3Header.}

proc ImGui_ImplRaylib_Init*(): bool {.importcpp:"ImGui_ImplRaylib_Init(@)", header:ImGuiImplRaylibHeader.}
proc ImGui_ImplRaylib_Shutdown*() {.importcpp:"ImGui_ImplRaylib_Shutdown(@)", header:ImGuiImplRaylibHeader.}
proc ImGui_ImplRaylib_NewFrame*() {.importcpp:"ImGui_ImplRaylib_NewFrame(@)", header:ImGuiImplRaylibHeader.}
proc ImGui_ImplRaylib_ProcessEvent*(): bool {.importcpp:"ImGui_ImplRaylib_ProcessEvent(@)", header:ImGuiImplRaylibHeader.}


