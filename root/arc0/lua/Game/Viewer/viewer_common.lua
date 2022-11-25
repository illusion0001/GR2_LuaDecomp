L0_0 = import
L0_0("Debug")
L0_0 = nil
function get_game_pause()
  return Time:getInGameDeltaSec() == 0
end
function set_game_pause(A0_1)
  if A0_1 then
    Time:setInGameDeltaSec(0)
  else
    Time:resetInGameDeltaSec()
  end
end
function setHighQualityMode(A0_2)
  if A0_2 then
    Debug:setValue({
      "Performance",
      "SetPerformParam(Maximum)"
    })
  else
    Debug:setValue({
      "Performance",
      "SetPerformParam(Default)"
    })
  end
end
function setParticleDrawMode(A0_3)
  if A0_3 then
    Debug:setValue({
      "ParticleFX",
      "Feature",
      "Draw"
    }, true)
  else
    Debug:setValue({
      "ParticleFX",
      "Feature",
      "Draw"
    }, false)
  end
end
function setSceneParamEditModeEnable(A0_4)
  Debug:setValue({
    "Viewer",
    "SceneParam Edit Mode"
  }, A0_4)
end
function setLightDebugDrawEnable(A0_5)
  Debug:setValue({
    "Display",
    "DebugDrawGroup",
    "Light"
  }, A0_5)
end
function setSceneParameters(A0_6)
  if Viewer.setSceneParameters ~= nil then
    Viewer:setSceneParameters(A0_6)
  end
end
function resetSceneParameters()
  if Viewer.setSceneParameters ~= nil then
    Viewer:setSceneParameters("lt_template")
  end
end
function setSkyModel(A0_7, A1_8)
  local L2_9
  if A0_7 ~= nil then
    L2_9 = L0_0
    if L2_9 ~= nil then
      L2_9 = L0_0
      L2_9 = L2_9.try_term
      L2_9(L2_9)
      L2_9 = nil
      L0_0 = L2_9
    end
    function L2_9()
      createGameObject2("SimpleModel"):setModelName(A0_7)
      createGameObject2("SimpleModel"):try_init()
      createGameObject2("SimpleModel"):waitForReady()
      createGameObject2("SimpleModel"):try_start()
      if L0_0 == nil then
        L0_0 = createGameObject2("SimpleModel")
      end
    end
    if A1_8 then
      L2_9()
    else
      invokeTask(L2_9)
    end
  end
end
function resetSkyModel(A0_10)
  if L0_0 ~= nil then
    L0_0:try_term()
    L0_0 = nil
  end
end
function initForBgPreview()
  if L0_0 == nil then
    setSkyModel("sky_gray_root")
    resetSceneParameters()
  end
end
function switchDebugCamera()
  Debug:setEnableDebugCamera(not Debug:getEnableDebugCamera())
end
function switchSceneParamEditModeEnable()
  Debug:setValue({
    "Viewer",
    "SceneParam Edit Mode"
  }, not Debug:getValue({
    "Viewer",
    "SceneParam Edit Mode"
  }))
end
function setEntityEditParams(A0_11)
  print("no longer supported")
end
