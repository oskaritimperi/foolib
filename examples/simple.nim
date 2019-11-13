import foolib/[raylib, imgui]

InitWindow(1024, 768, "hello")

SetTargetFPS(60)

discard imgui.CreateContext()
imgui.StyleColorsDark()

when defined(macos):
    discard ImGui_ImplOpenGL3_Init("#version 150")
else:
    discard ImGui_ImplOpenGL3_Init("#version 130")
discard ImGui_ImplRaylib_Init()

while not WindowShouldClose():
    ImGui_ImplOpenGL3_NewFrame()
    ImGui_ImplRaylib_NewFrame()
    imgui.NewFrame()

    BeginDrawing()

    ClearBackground(WHITE)

    imgui.ShowDemoWindow(nil)

    imgui.Render()

    ImGui_ImplOpenGL3_RenderDrawData(imgui.GetDrawData())

    EndDrawing()

ImGui_ImplRaylib_Shutdown()
ImGui_ImplOpenGL3_Shutdown()

CloseWindow()
