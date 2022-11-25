local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "Viewer"
L0_0(L1_1)
L0_0 = import
L1_1 = "Time"
L0_0(L1_1)
L0_0 = import
L1_1 = "Yaml"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Viewer/viewer_common.lua"
L0_0(L1_1)
g_polydemo = nil
g_param = nil
L0_0 = g_arg
if L0_0 ~= nil then
  L0_0 = g_arg
  g_param = L0_0
end
L0_0 = g_batch_name
if L0_0 ~= nil then
  L0_0 = Yaml
  L0_0.useTargetLocal = true
  L0_0 = Yaml
  L1_1 = L0_0
  L0_0 = L0_0.loadYaml
  L2_2 = "pdemo_batch_config.yaml"
  L0_0 = L0_0(L1_1, L2_2)
  L0_0 = L0_0 or {}
  g_param = L0_0
  L0_0 = Yaml
  L0_0.useTargetLocal = false
  L0_0 = g_param
  L1_1 = {L2_2}
  L2_2 = g_batch_name
  L0_0.names = L1_1
  L0_0 = g_param
  L0_0.batchMode = true
  L0_0 = g_param
  L0_0.enableExitProcess = true
  L0_0 = g_param
  L0_0.captureMode = true
  L0_0 = g_param
  L0_0.convertMP4 = true
  L0_0 = g_param
  L0_0.highQualityMode = true
end
L0_0 = g_param
if L0_0 == nil then
  L0_0 = {}
  g_param = L0_0
end
function L0_0(A0_7)
  if A0_7 ~= nil then
    set_game_pause(not A0_7.play)
  else
    set_game_pause(not get_game_pause())
  end
end
switchPdemoPlay = L0_0
function L0_0()
  set_game_pause(true)
  invokeTask(function()
    wait()
    set_game_pause(false)
    wait()
    set_game_pause(true)
  end)
end
frameAdvance = L0_0
function L0_0()
  if g_polydemo ~= nil and g_polydemo.stepOnPause ~= nil then
    set_game_pause(true)
    g_polydemo:stepOnPause(-1)
  end
end
frameRewind = L0_0
function L0_0()
  if g_polydemo ~= nil then
    g_polydemo:reset()
    g_polydemo:play()
  end
end
jumpToStart = L0_0
function L0_0()
  local L0_8, L1_9
  L0_8 = g_polydemo
  if L0_8 ~= nil then
    L0_8 = g_polydemo
    L1_9 = L0_8
    L0_8 = L0_8.getPlaybackFrameRange
    L1_9 = L0_8(L1_9)
    g_polydemo:setCurrentFrame(L1_9)
    set_game_pause(true)
  end
end
jumpToEnd = L0_0
function L0_0(A0_10)
  if g_polydemo ~= nil then
    g_polydemo:reset()
    g_polydemo:setCurrentFrame(g_polydemo:getChapterInfo(A0_10.chapter).startFrame + A0_10.frame)
  end
end
jumpToChapterAndFrame = L0_0
function L0_0()
  local L0_11
  L0_11 = g_polydemo
  if L0_11 ~= nil then
    L0_11 = g_polydemo
    L0_11 = L0_11.getCurrentChapter
    L0_11 = L0_11(L0_11)
    L0_11 = L0_11 - 1
    if L0_11 < 0 then
      L0_11 = 0
    end
    g_polydemo:reset()
    g_polydemo:setCurrentFrame(g_polydemo:getChapterInfo(L0_11).startFrame)
  end
end
prevChapter = L0_0
function L0_0()
  local L0_12
  L0_12 = g_polydemo
  if L0_12 ~= nil then
    L0_12 = g_polydemo
    L0_12 = L0_12.getCurrentChapter
    L0_12 = L0_12(L0_12)
    L0_12 = L0_12 + 1
    if L0_12 >= g_polydemo:getNumChapters() then
      L0_12 = 0
    end
    g_polydemo:reset()
    g_polydemo:setCurrentFrame(g_polydemo:getChapterInfo(L0_12).startFrame)
  end
end
nextChapter = L0_0
function L0_0()
  local L1_13
  L1_13 = g_param
  L1_13.loop = not g_param.loop
end
switchPdemoLoop = L0_0
function L0_0(A0_14)
  if g_polydemo ~= nil then
    if A0_14 ~= nil then
      g_polydemo:setPlaybackFrameRange(A0_14.startFrame, A0_14.endFrame)
    else
      g_polydemo:setPlaybackFrameRange()
    end
  end
end
setPlaybackRange = L0_0
function L0_0(A0_15)
  local L1_16
  L1_16 = g_polydemo
  if L1_16 ~= nil then
    L1_16 = A0_15
    if L1_16 then
      invokeTask(function()
        local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
        L0_17 = "/Lighting/"
        L1_18 = g_polydemo
        if L1_18 ~= nil then
          L1_18 = {L2_19, L3_20}
          for L5_22, L6_23 in L2_19(L3_20) do
            if loadFileAsset("evd", L6_23 .. L1_16) ~= nil then
              loadFileAsset("evd", L6_23 .. L1_16):wait()
              g_polydemo:setDefaultSceneParam(loadFileAsset("evd", L6_23 .. L1_16):getRoot())
              print("load scene param = " .. L6_23 .. L1_16)
              break
            end
          end
        end
      end)
    else
      g_polydemo:setDefaultSceneParam(nil)
    end
  else
  end
end
pdemo_setDefaultSceneParam = L0_0
function L0_0(A0_24)
  if g_polydemo ~= nil then
    g_polydemo:setIgnoreOwnSceneParam(A0_24)
  end
end
pdemo_setIgnoreOwnSceneParam = L0_0
function L0_0(A0_25)
  if g_polydemo ~= nil and A0_25 ~= nil then
    invokeTask(function()
      setSceneParamEditModeEnable(false)
      Yaml:convertToEvd("dummy_evd", A0_25):wait()
      g_polydemo:hotReload(Yaml:convertToEvd("dummy_evd", A0_25):getRoot())
    end)
  end
end
pdemo_hotReload = L0_0
function L0_0(A0_26)
  if g_polydemo ~= nil and A0_26 ~= nil then
    g_polydemo:setVisibleCheckOnly(A0_26)
  end
end
pdemo_setVisibleCheckOnly = L0_0
function L0_0()
  local L0_27
  L0_27 = 0
  if g_polydemo ~= nil then
    L0_27 = g_polydemo:getCurrentFrame()
  end
  return L0_27
end
pdemo_getCurrentFrame = L0_0
function L0_0(A0_28)
  local L1_29
  L1_29 = nil
  if g_polydemo ~= nil then
    L1_29 = g_polydemo:getEntityInfos(A0_28)
  end
  return L1_29
end
getEntityInfos = L0_0
function L0_0(A0_30)
  local L1_31
  L1_31 = g_polydemo
  if L1_31 ~= nil then
    L1_31 = {}
    for _FORV_5_, _FORV_6_ in ipairs(A0_30) do
      L1_31[_FORV_5_] = g_polydemo:removeEntity(_FORV_6_.uuid)
    end
    return L1_31
  end
end
removeEntities = L0_0
function L0_0()
  if g_polydemo ~= nil then
    return g_polydemo:getManipulator()
  end
  return nil
end
getPolyDemoManipulator = L0_0
function L0_0(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43
  L1_33 = createGameObject2
  L2_34 = "PolyDemo"
  L1_33 = L1_33(L2_34)
  L2_34 = loadFileAsset
  L3_35 = "evd"
  L2_34 = L2_34(L3_35, L4_36)
  if L2_34 ~= nil then
    L3_35 = L2_34.wait
    L3_35(L4_36)
    L3_35 = L1_33.setDescription
    L11_43 = L5_37(L6_38)
    L3_35(L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L5_37(L6_38))
  end
  L3_35 = {
    L4_36,
    L5_37,
    L6_38
  }
  for L7_39, L8_40 in L4_36(L5_37) do
    L9_41 = loadFileAsset
    L10_42 = "evd"
    L11_43 = "/pdemo/"
    L11_43 = L11_43 .. A0_32 .. L8_40
    L9_41 = L9_41(L10_42, L11_43)
    if L9_41 ~= nil then
      L11_43 = L9_41
      L10_42 = L9_41.wait
      L10_42(L11_43)
      L11_43 = L9_41
      L10_42 = L9_41.getRoot
      L10_42 = L10_42(L11_43)
      L11_43 = L1_33.setSubDescription
      L11_43(L1_33, L7_39 - 1, L10_42)
      L11_43 = L10_42.defaultSceneParam
      if L11_43 then
        L11_43 = loadFileAsset
        L11_43 = L11_43("evd", "/Lighting/" .. L10_42.defaultSceneParam)
        if L11_43 ~= nil then
          L11_43:wait()
          L1_33:setDefaultSceneParam(L11_43:getRoot())
        end
      end
      L11_43 = L10_42.defaultSkyModel
      if L11_43 then
        L11_43 = L10_42.defaultSkyModel
        if L11_43 ~= nil then
          setSkyModel(L11_43, true)
        end
      end
    end
  end
  if L4_36 ~= nil then
    if L4_36 ~= nil then
      L7_39 = g_param
      L7_39 = L7_39.ignoreLoadBg
      L4_36(L5_37, L6_38, L7_39)
    end
  end
  L4_36(L5_37, L6_38)
  L4_36(L5_37)
  L4_36(L5_37)
  if not L4_36 then
    if L4_36 ~= nil then
      if L4_36 ~= nil then
        L7_39 = L1_33
        L8_40 = L4_36
        L9_41 = L5_37
        L6_38(L7_39, L8_40, L9_41)
      end
    end
  end
  if L4_36 ~= nil then
    if L4_36 ~= nil then
      L4_36(L5_37, L6_38)
    else
      L4_36(L5_37, L6_38)
    end
  end
  if L4_36 ~= nil then
    if L4_36 ~= nil then
      L4_36(L5_37, L6_38)
    else
      L4_36(L5_37, L6_38)
    end
  end
  if L4_36 ~= nil then
    L7_39 = "-start_number $START_FRAME "
    L8_40 = "-i %06d.$IN_EXT "
    L9_41 = "-frames $DURATION "
    L10_42 = "-pix_fmt yuv420p "
    L11_43 = "-g 0 "
    L4_36(L5_37, L6_38)
  end
  return L1_33
end
function L1_1(A0_44)
  local L1_45, L2_46, L3_47
  L2_46 = A0_44
  L1_45 = A0_44.getNumChapters
  L1_45 = L1_45(L2_46)
  L1_45 = L1_45 - 1
  L3_47 = A0_44
  L2_46 = A0_44.getCurrentChapter
  L2_46 = L2_46(L3_47)
  L3_47 = A0_44.getCurrentFrame
  L3_47 = L3_47(A0_44)
  if Debug:getEnableDebugCamera() then
    Debug:screenPrint(0, 432, {
      "[DEBUG CAMERA]"
    })
  end
  if get_game_pause() then
    Debug:screenPrint(0, 448, {"[PAUSE]"})
  end
  if g_param.loop then
    Debug:screenPrint(0, 464, {"[LOOP]"})
  end
  if A0_44:getChapterInfo(L2_46) ~= nil then
    Debug:screenPrint(0, 480, {
      "Chapter " .. L2_46 .. "/" .. L1_45 .. "(" .. A0_44:getChapterInfo(L2_46).name .. ")"
    })
    Debug:screenPrint(0, 496, {
      "Chapter Frame " .. A0_44:getChapterInfo(L2_46).startFrame .. "-" .. A0_44:getChapterInfo(L2_46).endFrame
    })
  end
  Debug:screenPrint(0, 512, {
    "Frame " .. L3_47
  })
end
function L2_2(A0_48)
  local L1_49
  L1_49 = L0_0
  L1_49 = L1_49(A0_48)
  g_polydemo = L1_49
  setSkyModel(nil, true)
  init_bg = nil
  term_bg = nil
  if A0_48 ~= nil and g_param.loadInitScript then
    dofile_noerror("/Game/pdemo_init/" .. A0_48 .. ".lua")
  end
  if init_bg ~= nil then
    init_bg(L1_49)
  end
  if g_param.visibleCheckOnly and g_polydemo.setVisibleCheckOnly then
    g_polydemo:setVisibleCheckOnly(g_param.visibleCheckOnly)
  end
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  if g_param.checkedEntities and g_polydemo.setEntityChecked then
    for _FORV_5_, _FORV_6_ in ipairs(g_param.checkedEntities) do
      g_polydemo:setEntityChecked(_FORV_6_.uuid, true)
    end
  end
  startAllGameObjects()
  return L1_49
end
function L3_3(A0_50)
  if term_bg ~= nil then
    term_bg(A0_50)
  end
end
function L4_4(A0_51, A1_52)
  while A0_51 > 0 do
    Debug:screenPrint(0, 512, {A1_52})
    wait()
    A0_51 = A0_51 - 1
  end
end
function L5_5(A0_53)
  Debug:setValue({
    "Performance",
    "Phisics Debugger np",
    "Visual Debugger np"
  }, A0_53)
  Debug:setValue({
    "Viewer",
    "Enable Viewer Server"
  }, A0_53)
  Debug:setValue({
    "Development",
    "Enable Cokoda Server"
  }, A0_53)
  Debug:setValue({
    "Game Objects",
    "Supporter",
    "Enable Server"
  }, A0_53)
end
function L6_6(A0_54)
  while true do
    A0_54:play()
    L1_1(A0_54)
    if A0_54:isDemoEnd() then
      if g_param.captureMode then
        L4_4(10, "Capture Done")
        break
      elseif g_param.batchMode then
        L4_4(3, "Play Done")
        break
      elseif g_param.loop and not get_game_pause() then
        A0_54:reset()
        print("RESET")
      end
    end
    wait()
  end
  if g_param.convertMP4 then
    L4_4(3, "Convert To MP4")
    if A0_54.executeConvertMP4 ~= nil then
      A0_54:executeConvertMP4()
    end
  end
  L4_4(3, "DONE = " .. A0_54:getName())
end
function main()
  local L0_55, L1_56, L2_57, L3_58, L4_59, L5_60
  L0_55(L1_56)
  L0_55(L1_56)
  L3_58 = "Game Objects"
  L4_59 = "Wind"
  L5_60 = "Intensity"
  L3_58 = 0
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Display"
  L4_59 = "Debug Draw"
  L3_58 = true
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Viewer"
  L4_59 = "DebugDrawGroup"
  L5_60 = "Viewer"
  L3_58 = true
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Development"
  L4_59 = "Animation"
  L5_60 = "Context Buffer Auto Glow"
  L3_58 = true
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Display"
  L4_59 = "Screen Console"
  L3_58 = true
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Scale"
  L3_58 = 1.2
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Near"
  L3_58 = 0
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Far"
  L3_58 = 45
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Fade Scale"
  L3_58 = 0.2
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Alpha"
  L3_58 = 0.95
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Scale2"
  L3_58 = 1.2
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Near2"
  L3_58 = 0
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Character"
  L5_60 = "Contour Far2"
  L3_58 = 45
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Softbody"
  L5_60 = "Clip Z"
  L3_58 = 5000
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Auto Adjust Cascade"
  L3_58 = false
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade0 SlopeScale"
  L3_58 = 18
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade0 DepthBias"
  L3_58 = 10
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade1 SlopeScale"
  L3_58 = 8
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade1 DepthBias"
  L3_58 = 12
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade2 SlopeScale"
  L3_58 = 6
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Shadow"
  L5_60 = "Cascade2 DepthBias"
  L3_58 = 5
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Performance"
  L4_59 = "Bg"
  L5_60 = "ShaderLOD"
  L3_58 = false
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Volumetric Fog"
  L5_60 = "JitterOffset"
  L3_58 = 0
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Volumetric Fog"
  L5_60 = "Lit JitterOffset"
  L3_58 = 0
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Volumetric Fog"
  L5_60 = "JitterBlend"
  L3_58 = 1
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Volumetric Fog"
  L5_60 = "Den JitterBlend"
  L3_58 = 1
  L0_55(L1_56, L2_57, L3_58)
  L3_58 = "Gfx"
  L4_59 = "Volumetric Fog"
  L5_60 = "Dark JitterBlend"
  L3_58 = 1
  L0_55(L1_56, L2_57, L3_58)
  L0_55(L1_56, L2_57)
  L0_55(L1_56)
  if L0_55 == nil then
    L0_55.loop = true
  end
  if L0_55 ~= nil then
    L0_55(L1_56)
  end
  if L0_55 ~= nil then
    L0_55(L1_56)
  end
  if L0_55 ~= nil then
    L0_55(L1_56)
  end
  if L0_55 then
    L0_55.loop = false
    L3_58 = "Viewer"
    L4_59 = "PolyDemo Capture Mode"
    L3_58 = true
    L0_55(L1_56, L2_57, L3_58)
    L0_55(L1_56)
    L0_55(L1_56)
  end
  if L0_55 == nil then
    if L0_55 ~= nil then
      L0_55.names = L1_56
    else
      L0_55.names = L1_56
    end
  end
  for L3_58, L4_59 in L0_55(L1_56) do
    L5_60 = L2_2
    L5_60 = L5_60(L4_59)
    L6_6(L5_60)
    L3_3(L5_60)
    terminateAllGameObjects()
  end
  if L0_55 then
    L3_58 = "Viewer"
    L4_59 = "PolyDemo Capture Mode"
    L3_58 = false
    L0_55(L1_56, L2_57, L3_58)
    L0_55(L1_56)
    L0_55(L1_56)
  end
  if L0_55 then
    L0_55(L1_56, L2_57)
  end
end
