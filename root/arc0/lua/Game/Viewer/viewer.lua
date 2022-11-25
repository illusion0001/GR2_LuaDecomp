L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("Viewer")
L0_0 = import
L0_0("Time")
L0_0 = dofile
L0_0("/Game/Viewer/viewer_common.lua")
function L0_0()
  print("GraviteViewer Start")
  if Viewer.setServerEnable ~= nil then
    Viewer:setServerEnable(true)
  end
  if Viewer.resetFileAssetSystem ~= nil then
    Viewer:resetFileAssetSystem()
  end
  Debug:setEnableDebugCamera(true)
  Debug:setValue({"Display", "Debug Draw"}, true)
  Debug:setValue({
    "Display",
    "Debug Camera Info"
  }, false)
  Debug:setValue({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setValue({
    "Display",
    "FIOS2Driver Status"
  }, false)
  Debug:setValue({
    "Display",
    "Sound Warning"
  }, false)
  Debug:setValue({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setValue({
    "Display",
    "Screen Console"
  }, false)
  Debug:setValue({"Display", "FPS"}, true)
  Debug:setValue({
    "Viewer",
    "DebugDrawGroup",
    "Viewer"
  }, true)
  Debug:setValue({
    "Viewer",
    "DebugDrawGroup",
    "Animation"
  }, true)
  Debug:setValue({
    "Viewer",
    "DebugDrawGroup",
    "Locator"
  }, true)
  Debug:setValue({"Viewer", "DrawGrid"}, true)
  Debug:setValue({
    "Viewer",
    "DrawWorldOrigin"
  }, true)
  Debug:setValue({
    "Development",
    "Console",
    "Script"
  }, true)
  Debug:setValue({
    "Development",
    "Animation",
    "Context Buffer Auto Glow"
  }, true)
  Debug:setValue({
    "Gfx",
    "Volumetric Fog",
    "Enabled"
  }, false)
  Debug:setValue({
    "Gfx",
    "Gradation",
    "Enabled"
  }, false)
  Debug:setValue({
    "Game Objects",
    "Wind",
    "Intensity"
  }, 0)
  Debug:setClearColor(true, 80, 80, 90)
  setSceneParamEditModeEnable(true)
  setExitCallback(function()
    Debug:setValue({"Viewer", "DrawGrid"}, false)
    Debug:setValue({
      "Viewer",
      "DrawWorldOrigin"
    }, false)
    Debug:setValue({
      "Viewer",
      "DebugDrawGroup",
      "Viewer"
    }, false)
    Debug:setValue({
      "Viewer",
      "DebugDrawGroup",
      "Animation"
    }, false)
    Debug:setValue({
      "Viewer",
      "DebugDrawGroup",
      "Locator"
    }, false)
    Debug:setValue({
      "Development",
      "Console",
      "Script"
    }, false)
    Debug:setValue({
      "Gfx",
      "Volumetric Fog",
      "Enabled"
    }, true)
    Debug:setValue({
      "Gfx",
      "Gradation",
      "Enabled"
    }, true)
    Debug:setClearColor(false, 0, 0, 0)
    Debug:setEnableDebugCamera(false)
    setSceneParamEditModeEnable(false)
  end)
end
main = L0_0
function L0_0(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6
  L3_4 = A2_3.name
  if L3_4 == nil then
    L3_4 = "null"
  end
  L4_5, L5_6 = nil, nil
  L4_5 = createGameObject2(A0_1)
  if L4_5 == nil then
    return nil
  end
  if A1_2 ~= nil then
    L5_6 = invokeTask(A1_2, L4_5, A2_3)
  end
  L4_5:setName(L3_4)
end
_createViewObject = L0_0
function L0_0(A0_7, A1_8)
  if not A0_7:isInstance("Node") then
    return
  end
  if A1_8.pos ~= nil then
    A0_7:setPos(A1_8.pos)
  end
end
g_view_template = {
  bg = {
    object_type = "TerrainBg",
    task_func = function(A0_9, A1_10)
      Debug:setEnableDebugCamera(true)
      L0_0(A0_9, A1_10)
      initForBgPreview()
      A0_9:setModelName(A1_10.modelName)
      if A1_10.collisionName ~= nil then
        A0_9:setCollisionName(A1_10.collisionName)
      end
      A0_9:try_init()
      A0_9:waitForReady()
      A0_9:waitForLoading()
      A0_9:try_start()
    end
  },
  chara = {
    object_type = "Puppet",
    task_func = function(A0_11, A1_12)
      local L2_13
      L2_13 = Debug
      L2_13 = L2_13.setEnableDebugCamera
      L2_13(L2_13, true)
      L2_13 = {}
      L2_13.model = A1_12.modelName
      if A1_12.animations ~= nil then
        L2_13.anim = {}
        for _FORV_6_ = 1, #A1_12.animations do
          L2_13.anim[_FORV_6_] = {}
          L2_13.anim[_FORV_6_].name = A1_12.animations[_FORV_6_]
          L2_13.anim[_FORV_6_].numLoops = 1
        end
      end
      motion_viewer_update_puppet(L2_13)
    end
  },
  effect = {
    object_type = "Effect",
    task_func = function(A0_14, A1_15)
      Debug:setEnableDebugCamera(true)
      L0_0(A0_14, A1_15)
      A0_14:setModelName(A1_15.modelName)
      A0_14:setLoop(true)
      A0_14:setPlay(true)
      A0_14:try_init()
      A0_14:waitForReady()
      A0_14:waitForLoading()
      A0_14:try_start()
    end
  },
  pdemo = {
    object_type = "PolyDemo",
    task_func = function(A0_16, A1_17)
      Debug:setEnableDebugCamera(false)
      L0_0(A0_16, A1_17)
      loadFileAsset("evd", "/pdemo/" .. A1_17.polydemoName):wait()
      A0_16:setDescription(loadFileAsset("evd", "/pdemo/" .. A1_17.polydemoName):getRoot())
      A0_16:try_init()
      A0_16:waitForReady()
      A0_16:waitForLoading()
      A0_16:try_start()
      while true do
        A0_16:play()
        while not A0_16:isDemoEnd() do
          wait()
        end
        A0_16:reset()
      end
    end
  }
}
function view_bg(A0_18)
  local L1_19
  L1_19 = g_view_template
  L1_19 = L1_19.bg
  _createViewObject(L1_19.object_type, L1_19.task_func, A0_18)
end
function view_chara(A0_20)
  local L1_21
  L1_21 = g_view_template
  L1_21 = L1_21.chara
  _createViewObject(L1_21.object_type, L1_21.task_func, A0_20)
end
function view_gimmick(A0_22)
  local L1_23
  L1_23 = g_view_template
  L1_23 = L1_23.chara
  _createViewObject(L1_23.object_type, L1_23.task_func, A0_22)
end
function view_effect(A0_24)
  local L1_25
  L1_25 = g_view_template
  L1_25 = L1_25.effect
  _createViewObject(L1_25.object_type, L1_25.task_func, A0_24)
end
function view_pdemo(A0_26)
  local L1_27
  L1_27 = g_view_template
  L1_27 = L1_27.pdemo
  _createViewObject(L1_27.object_type, L1_27.task_func, A0_26)
end
motion_viewer_puppet = nil
motion_viewer_brain = nil
motion_viewer_attachments = {}
motion_viewer_task = nil
function motion_viewer_reset(A0_28)
  for _FORV_4_, _FORV_5_ in ipairs(motion_viewer_attachments) do
    _FORV_5_:kill()
  end
  motion_viewer_attachments = {}
  if motion_viewer_puppet ~= nil then
    motion_viewer_puppet:kill()
    motion_viewer_puppet = nil
  end
  if motion_viewer_brain ~= nil then
    motion_viewer_brain:kill()
    motion_viewer_brain = nil
  end
end
function motion_viewer_update_sceneparam(A0_29)
  if A0_29 == nil then
    return
  end
  if A0_29.sceneparam ~= nil and Viewer.setSceneParameters ~= nil then
    Viewer:setSceneParameters(A0_29.sceneparam)
  end
end
function motion_viewer_update_skymodel(A0_30)
  if A0_30 == nil then
    return
  end
  if A0_30.skymodel ~= nil and setSkyModel ~= nil then
    setSkyModel(A0_30.skymodel)
  end
end
function motion_viewer_update_camera_state(A0_31)
  if A0_31 == nil then
    return
  end
  if A0_31.focusObject ~= nil then
    if A0_31.focusObject then
      Viewer:focusDebugCamera(motion_viewer_puppet)
    else
      Viewer:focusDebugCamera(nil)
    end
  end
end
function motion_viewer_update_debugdraw(A0_32)
  if A0_32 == nil then
    return
  end
  if A0_32.drawGrid ~= nil then
    Debug:setValue({"Viewer", "DrawGrid"}, A0_32.drawGrid)
  end
  if A0_32.showAnimInfo ~= nil then
    Debug:setValue({
      "Viewer",
      "ShowPuppetAnimInfo"
    }, A0_32.showAnimInfo)
  end
  if A0_32.drawSkeleton ~= nil then
    Debug:setValue({
      "Viewer",
      "DrawPuppetSkeleton"
    }, A0_32.drawSkeleton)
  end
  if A0_32.syncDirLight ~= nil then
    Debug:setValue({
      "Viewer",
      "SyncDirLightWithCamera"
    }, A0_32.syncDirLight)
  end
end
function motion_viewer_update_timespeed(A0_33)
  if A0_33.timeSpeed ~= nil then
    Time:setInGameDeltaSec(0.03333333333333333 * A0_33.timeSpeed)
  end
end
function motion_viewer_update_puppet(A0_34)
  local L1_35, L2_36
  L1_35 = Debug
  L2_36 = L1_35
  L1_35 = L1_35.setEnableDebugCamera
  L1_35(L2_36, true)
  if A0_34 == nil then
    return
  end
  L1_35 = motion_viewer_puppet
  L2_36 = motion_viewer_brain
  if L1_35 == nil or L1_35:isStopped() then
    L1_35 = createGameObject2("Puppet")
    L1_35:setName("motion_viewer")
    motion_viewer_puppet = L1_35
  end
  if L2_36 == nil or L2_36:isStopped() then
    L2_36 = createGameObject2("ActorBrain")
    L2_36:setName("motion_viewer")
    motion_viewer_brain = L2_36
  end
  for _FORV_6_, _FORV_7_ in ipairs(motion_viewer_attachments) do
    _FORV_7_:kill()
  end
  motion_viewer_attachments = {}
  if motion_viewer_task ~= nil then
    motion_viewer_task:abort()
    motion_viewer_task = nil
  end
  motion_viewer_task = invokeTask(function()
    local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38, L2_39)
    L0_37(L1_38)
    L0_37(L1_38)
    L3_40 = 0
    L4_41 = 0
    L5_42 = 0
    L5_42 = L2_39(L3_40, L4_41, L5_42)
    L0_37(L1_38, L2_39, L3_40, L4_41, L5_42, L2_39(L3_40, L4_41, L5_42))
    L3_40 = 0
    L4_41 = 0
    L5_42 = 0
    L5_42 = L2_39(L3_40, L4_41, L5_42)
    L0_37(L1_38, L2_39, L3_40, L4_41, L5_42, L2_39(L3_40, L4_41, L5_42))
    if L0_37 then
      L0_37(L1_38, L2_39)
    else
      L0_37(L1_38, L2_39)
    end
    if L0_37 ~= nil then
      L0_37(L1_38, L2_39)
    end
    if L0_37 ~= nil then
      L0_37(L1_38)
      L3_40 = A0_34.texRepName
      L4_41 = A0_34.attrRepName
      L0_37(L1_38, L2_39, L3_40, L4_41)
      L0_37(L1_38, L2_39)
      L0_37(L1_38, L2_39)
      L3_40 = A0_34.model
      L0_37(L1_38, L2_39, L3_40)
    end
    if L0_37 ~= nil then
      for L3_40, L4_41 in L0_37(L1_38) do
        L5_42 = print
        L5_42("ATTACHMENT = " .. L4_41.name)
        L5_42 = createGameObject2
        L5_42 = L5_42("Puppet")
        L5_42:loadModel(L4_41.name)
        L5_42:loadBasePoseAnimation(L4_41.name, L4_41.name)
        L5_42:loadBaseAttrAnimation(L4_41.name, L4_41.name)
        L5_42:loadBaseSkeleton(L4_41.name, L4_41.name)
        L1_35:appendChildToJoint(L5_42, L4_41.joint_name)
        L5_42:try_init()
        L5_42:waitForReady()
        L5_42:try_start()
        motion_viewer_attachments[L3_40] = L5_42
      end
    end
    if L0_37 ~= nil then
      for L3_40, L4_41 in L0_37(L1_38) do
        L5_42 = print
        L5_42("ANIM = " .. L4_41.name)
        L5_42 = L1_35
        L5_42 = L5_42.loadPoseAnimation
        L5_42 = L5_42(L5_42, L4_41.name, L4_41.name)
        if not L5_42 then
          L5_42 = print
          L5_42("failed load pose anim = " .. L4_41.name)
        end
        L5_42 = L1_35
        L5_42 = L5_42.loadAttrAnimation
        L5_42 = L5_42(L5_42, L4_41.name, L4_41.name)
        if not L5_42 then
          L5_42 = print
          L5_42("failed load attr anim = " .. L4_41.name)
        end
      end
      L0_37(L1_38)
      L3_40 = true
      L0_37(L1_38, L2_39, L3_40)
    else
      L0_37(L1_38)
      L0_37(L1_38, L2_39)
    end
    if L0_37 ~= nil then
      L0_37(L1_38)
      L3_40 = A0_34.addanim
      if not L0_37 then
        L0_37(L1_38)
      end
      L0_37(L1_38)
      L3_40 = "addanim1"
      L0_37(L1_38, L2_39, L3_40)
      L3_40 = 1
      L0_37(L1_38, L2_39, L3_40)
      L3_40 = 1
      L0_37(L1_38, L2_39, L3_40)
    else
      L0_37(L1_38)
      L0_37(L1_38, L2_39)
    end
  end)
end
