import json
import os
import osproc
import parseutils
import sequtils
import sets
import strformat
import strscans
import strtabs
import strutils
import tables
import unittest

let nativeToNimType = newStringTable(
    ("void*", "pointer"),
    ("void**", "pointer"),

    ("char", "cchar"),
    ("signed char", "cchar"),
    ("unsigned char", "cuchar"),
    ("const char*", "cstring"),
    ("const char *", "cstring"),

    ("unsigned int", "cuint"),
    ("signed int", "cint"),
    ("int", "cint"),

    ("float", "cfloat"),
    ("double", "cdouble"),

    ("short", "cshort"),
    ("unsigned short", "cushort"),
    ("signed short", "cshort"),

    # ("unsigned char*", "ptr byte"),
    # ("unsigned char**", "ptr ptr byte"),
    # ("unsigned int*", "ptr cuint"),
    # ("const char*", "cstring"),
    # ("char*", "cstring"),

    ("int64_t", "int64"),
    ("uint64_t", "uint64"),

    ("ImVector_ImWchar*", "ptr ImVector[ImWchar]"),

    ("size_t", "csize"),

    modeCaseSensitive
)

proc parseFunctionPointerDecl(decl: string): string

proc parseTypeDecl(decl: string): string =
    result = decl.strip()

    if "(*)" in result:
        return parseFunctionPointerDecl(result)

    if result in nativeToNimType:
        return nativeToNimType[result]

    result = decl.replace("const", "").strip()

    if result in nativeToNimType:
        return nativeToNimType[result]

    # simple array, e.g. float[3]
    var n = ""
    var s = ""
    if scanf(decl, "$w[$*]", n, s):
        n = parseTypeDecl(n)
        return &"array[{s}, {n}]"

    if result.endsWith("*") or result.endsWith("[]"):
        var ptrs: seq[string] = @[]
        result = result.replace("[]", "*")
        while result.endsWith("*"):
            ptrs.add("ptr")
            result = result[0..^2]
        return ptrs.join(" ") & " " & parseTypeDecl(result)

when defined(test):
    test "simple types":
        check parseTypeDecl("float") == "cfloat"
        check parseTypeDecl("double") == "cdouble"

    test "simple types with spaces":
        check parseTypeDecl("float ") == "cfloat"
        check parseTypeDecl(" double") == "cdouble"

    test "array":
        check parseTypeDecl("float[3]") == "array[3, cfloat]"

    test "pointer":
        check parseTypeDecl("float*") == "ptr cfloat"
        check parseTypeDecl("float *") == "ptr cfloat"
        check parseTypeDecl("unsigned char*") == "ptr cuchar"
        check parseTypeDecl("unsigned char *") == "ptr cuchar"
        check parseTypeDecl("const char* const[]") == "ptr ptr cchar"
        check parseTypeDecl("const void*") == "pointer"
        check parseTypeDecl("unsigned char**") == "ptr ptr cuchar"

proc processParamName(name: string): string =
    result = name.strip(chars=Whitespace + {'_'})
    if result in ["type", "in", "ptr", "ref"]:
        result = "`" & result & "`"

proc parseFunctionPointerDecl(decl: string): string =
    var returnType: string

    var pos = parseUntil(decl, returnType, '(')

    returnType = parseTypeDecl(returnType)

    pos = pos + skipUntil(decl, '(', pos+1) + 2

    var params: string

    discard parseUntil(decl, params, ')', pos)

    proc parseParamDecl(paramDecl: string): (string, string) =
        var i = len(paramDecl)
        while paramDecl[i-1] in IdentChars:
            dec(i)
        return (paramDecl[0 ..< i], paramDecl[i .. ^1])

    let paramsList =
        if params.len == 0:
            ""
        else:
            params.split(",")
                .mapIt(it.strip())
                .mapIt(parseParamDecl(it))
                .mapIt((parseTypeDecl(it[0]), processParamName(it[1])))
                .mapIt(it[1] & ": " & it[0])
                .join(", ")

    result = &"proc ({paramsList})"

    if returnType != "void":
        result &= ": " & returnType

    result &= " {.cdecl.}"

when defined(test):
    test "function type decl":
        let cdecl = "void(*)(const ImDrawList* parent_list,const ImDrawCmd* cmd);"
        let ndecl = "proc (parent_list: ptr ImDrawList, cmd: ptr ImDrawCmd) {.cdecl.}"
        check parseFunctionPointerDecl(cdecl) == ndecl

        let cdecl2 = "void(*)(const ImDrawList * parent_list,const ImDrawCmd *cmd);"
        let ndecl2 = "proc (parent_list: ptr ImDrawList, cmd: ptr ImDrawCmd) {.cdecl.}"
        check parseFunctionPointerDecl(cdecl2) == ndecl2

        let cdecl3 = "const char *(*)();"
        let ndecl3 = "proc (): cstring {.cdecl.}"
        check parseFunctionPointerDecl(cdecl3) == ndecl3

template withDir(dir: string, body: untyped): untyped =
    var curdir = getCurrentDir()
    try:
        setCurrentDir(dir)
        body
    finally:
        setCurrentDir(curdir)

if not existsDir("cimgui"):
    assert execCmd("git clone git@github.com:cimgui/cimgui.git") == 0

    withDir("cimgui"):
        assert execCmd("git checkout 1.73") == 0
        assert execCmd("git submodule update --init") == 0

let structsAndEnums = parseJson(readFile("cimgui/generator/output/structs_and_enums.json"))
let typedefsDict = parseJson(readFile("cimgui/generator/output/typedefs_dict.json"))
let functions = parseJson(readFile("cimgui/generator/output/definitions.json"))

let file = open("imgui.nim", fmWrite)

file.writeLine("""
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

""")

for enumName, value in structsAndEnums["enums"]:
    for item in value:
        var itemName = item["name"].getStr()

        if itemName.startsWith("_") or itemName.endsWith("_") or itemName.contains("__"):
            continue

        var itemValue =
            if item["value"].kind == JString:
                item["value"].getStr()
                    .replace("<<", " shl ")
                    .replace("|", " or ")
            else:
                $item["value"].getInt()

        file.writeLine(&"  {itemName}* = ({itemValue}).cint")

    file.writeLine("")

file.writeLine("type")


let typeOverride = newStringTable()
typeOverride["ImGuiStoragePair"] = """
  ImGuiStoragePair* {.importcpp, header: imguiHeader.} = object
"""

file.writeLine("""
  ImVector*[T] {.importcpp, header: imguiHeader.} = object
    Size*: cint
    Capacity*: cint
    Data*: ptr T

  ImDrawListSharedData* {.importcpp, header: imguiHeader.} = object

  ImGuiContext* {.importcpp, header: imguiHeader.} = object

  va_list* {.importc, header:"<stdarg.h>".} = object

""")

for alias, value in typedefsDict:
    var value = value.getStr()

    if value == &"struct {alias}":
        continue

    if alias in ["const_iterator", "iterator", "value_type"]:
        continue

    if "(" in value:
        file.writeLine(&"  {alias}* = {parseFunctionPointerDecl(value)}")
    else:
        file.writeLine(&"  {alias}* = {parseTypeDecl(value)}")

file.writeLine("")

for structName, fields in structsAndEnums["structs"]:
    if structName in typeOverride:
        file.writeLine(typeOverride[structName])
        continue

    file.writeLine(&"  {structName}* {{.importcpp, header: imguiHeader.}} = object")

    for item in fields:
        var itemName = item["name"].getStr()

        if itemName.startsWith("_"):
            continue

        var itemType = item["type"].getStr()

        if "template_type" in item:
            let p = itemType.split("_")
            let container = p[0]
            itemType = item["template_type"].getStr()
            itemType = parseTypeDecl(itemType)
            itemType = &"{container}[{itemType}]"
        else:
            if "(" in itemType:
                itemType = parseFunctionPointerDecl(itemType)
            else:
                itemType = parseTypeDecl(itemType)

            var n = ""
            var s = ""
            if scanf(itemName, "$w[$*]", n, s):
                itemName = n
                s = s[0..^1]
                itemType = &"array[{s}, {itemType}]"

        file.writeLine(&"    {itemName}*: {itemType}")

    file.writeLine("")

type
    Function = ref object
        isConstructor: bool
        isDestructor: bool
        structName: string
        namespace: string
        name: string
        overloads: seq[Overload]

    Overload = ref object
        isVararg: bool
        paramList: string
        pragmas: string
        isTemplated: bool
        returnType: string
        signature: string

iterator items(t: OrderedTable[string, JsonNode]): (string, JsonNode) =
    for k, v in t:
        yield (k, v)

proc newOverload(f: Function, j: JsonNode): Overload =
    new(result)

    result.isVararg = "isvararg" in j

    result.isTemplated = "templated" in j

    if not f.isConstructor:
        result.returnType =
            if j["ret"].getStr() == "void":
                ""
            else:
                if "retref" in j:
                    parseTypeDecl(j["ret"].getStr()).replace("ptr", "var")
                else:
                    parseTypeDecl(j["ret"].getStr())
    else:
        result.returnType = f.structName

    var pragmaSeq = @[
        # &"importcpp: \"{structName}(@)\"",
        # "importcpp",
        "header: imguiHeader",
    ]

    if f.isConstructor:
        pragmaSeq.add(&"importcpp: \"{f.structName}(@)\"")
    elif f.structName.len > 0:
        pragmaSeq.add(&"importcpp: \"#.{f.name}(@)\"")
    elif f.namespace.len > 0:
        pragmaSeq.add(&"importcpp: \"{f.namespace}::{f.name}(@)\"")

    if result.isVararg:
        pragmaSeq.add("varargs")

    result.pragmas = "{." & pragmaSeq.join(", ") & ".}"

    proc processDefaultValue(s: string): string =
        if s == "((void*)0)":
            return "nil"
        elif s == "FLT_MAX":
            return "high(cfloat)"

        # is the default an instantiation of a struct?
        var name, args: string
        if scanf(s, "$w($+)$.", name, args):
            if name == "sizeof":
                return &"sizeof({parseTypeDecl(args)}).cint"
            return &"init{name}({args})"

        return s.replace("<<", " shl ").replace("|", " or ")

    proc formatParam(name, typ, def: string): string =
        var def =
            if def.len > 0:
                " = " & def
            else:
                ""
        var typeName: string
        if scanf(typ, "$w&$.", typeName):
            typeName = "var " & parseTypeDecl(typeName)
        else:
            typeName = typ
        result = name & ": " & typeName & def

    let defaults = newStringTable(j["defaults"].getFields()
        .mapIt((it[0], processDefaultValue(it[1].getStr()))),
        modeCaseSensitive)

    result.paramList = j["argsT"]
        .mapIt((it["name"].getStr(), it["type"].getStr()))
        .filterIt(it[0] notin ["self", "..."])
        .mapIt((processParamName(it[0]), parseTypeDecl(it[1]), defaults.getOrDefault(it[0], "")))
        .mapIt(formatParam(it[0], it[1], it[2]))
        .join(", ")

    # Helps us to filter out overloads that differ in constness only
    result.signature = j["signature"].getStr()
    if result.signature.endsWith(")const"):
        result.signature = result.signature[0..^6]

proc newFunction(j: JsonNode): Function =
    new(result)

    result.isConstructor = "constructor" in j[0]

    result.isDestructor = "destructor" in j[0]

    result.structName = j[0]["stname"].getStr()

    result.namespace =
        if "namespace" in j[0]:
            j[0]["namespace"].getStr()
        else:
            ""

    result.name =
        if result.isDestructor:
            result.structName
        else:
            j[0]["funcname"].getStr()

    result.overloads = @[]

    # Don't load overloads for private functions
    if result.name.startsWith("_"):
        return

    var signatures = initHashSet[string]()
    for node in j:
        if "nonUDT" in node:
            continue

        let overload = newOverload(result, node)

        if overload.signature notin signatures:
            result.overloads.add(overload)
            signatures.incl(overload.signature)

proc dump(f: Function) =
    for overload in f.overloads:
        if f.isConstructor:
            file.writeLine(&"proc init{f.structName}*({overload.paramList}): {f.structName} {overload.pragmas}")
        # elif isDestructor:
        #     discard
        elif f.structName.len > 0:
            let templ =
                if overload.isTemplated:
                    "[T]"
                else:
                    ""
            let args =
                if overload.paramList.len > 0:
                    &"self: var {f.structName}{templ}, {overload.paramList}"
                else:
                    &"self: var {f.structName}{templ}"
            let returnType =
                if overload.returnType == "":
                    ""
                else:
                    ": " & overload.returnType
            let name =
                if f.name in ["end"]:
                    "`" & f.name & "`"
                else:
                    f.name
            file.writeLine(&"proc {name}*{templ}({args}){returnType} {overload.pragmas}")
        elif f.namespace.len > 0:
            let returnType =
                if overload.returnType == "":
                    ""
                else:
                    ": " & overload.returnType
            file.writeLine(&"proc {f.name}*({overload.paramList}){returnType} {overload.pragmas}")

var processedFunctions = functions.getFields().mapIt(newFunction(it[1])).toSeq()

let skipStructs = ["ImGuiStoragePair", "ImGuiTextBuffer", "ImGuiTextRange"]

for function in processedFunctions:
    if not function.isConstructor:
        continue
    if function.structName in skipStructs:
        continue
    function.dump()

for function in processedFunctions:
    # A little hack for the static function
    if function.structName == "ImColor" and function.name == "HSV":
        function.namespace = "ImColor"
        function.structName = ""
    if function.isConstructor or function.isDestructor:
        continue
    if function.structName in skipStructs:
        continue
    function.dump()


file.writeLine("""

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

""")
