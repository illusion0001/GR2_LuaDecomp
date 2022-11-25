ENGINE_EFFECT_NODE_PERFIX = "locator2_machine_effect_"
ENGINE_SE_RANGE = 50
L0_0 = {}
L0_0.energy = "cro01_dlc_gravcollector_00"
L0_0.stay = "cro01_stay_fly_00"
PC_MOTIONTABLE = L0_0
_engine_se_task = nil
_engine_effect_task = nil
L0_0 = {
  false,
  false,
  false,
  false
}
_isCollectedMachine = L0_0
_gravcollector = nil
_is_tutorial_caption = false
function L0_0(A0_1)
  _is_tutorial_caption = true
  Fn_tutorialCaption(A0_1)
  Fn_sendEventComSb("setTutorial", A0_1)
end
setTutorialCaption = L0_0
function L0_0()
  _is_tutorial_caption = false
  Fn_sendEventComSb("setTutorial", nil)
  Fn_tutorialCaptionKill()
end
endTutorialCaption = L0_0
function L0_0(A0_2, A1_3)
  local L2_4
  L2_4 = endEngineSE
  L2_4()
  L2_4 = findGameObject2
  L2_4 = L2_4("Node", "locator2_machine_" .. string.format("%02d", A1_3))
  _engine_se_task = Sound:playSEHandle(A0_2, 1, "", L2_4)
  Sound:setAudibleRange(_engine_se_task, ENGINE_SE_RANGE)
end
playCollectEngineSE = L0_0
function L0_0()
  if _engine_se_task ~= nil then
    Sound:stopSEHandle(_engine_se_task)
  end
  _engine_se_task = nil
end
endEngineSE = L0_0
function L0_0(A0_5)
  _engine_effect_task = RAC_createEffect({
    eff_name = "ef_ev_enget",
    pos_node = findGameObject2("Node", ENGINE_EFFECT_NODE_PERFIX .. string.format("%02d", A0_5))
  })
end
playEngineEffectCollect = L0_0
function L0_0(A0_6)
  endEngineEffect()
  _engine_effect_task = RAC_createEffect({
    eff_name = "ef_ev_enfull",
    pos_node = findGameObject2("Node", "locator2_machine_" .. string.format("%02d", A0_6))
  })
end
playEngineEffectFull = L0_0
function L0_0()
  if _engine_effect_task ~= nil then
    _engine_effect_task:abort()
  end
  _engine_effect_task = nil
end
endEngineEffect = L0_0
function L0_0(A0_7)
  invokeTask(function()
    energyCollectActive(true)
    Fn_playPlayerMotionWait(PC_MOTIONTABLE.energy, 0, 0.3)
    endEngineEffect()
    endEngineSE()
    if A0_7 ~= nil then
      Fn_captionView(A0_7)
    end
  end)
  waitSeconds(3)
end
energyCollectAction = L0_0
function L0_0()
  _gravcollector = Fn_createGimmickBg("loc_ci00", "gravcollector_01", "gravcollector_md_03")
  _gravcollector:setActive(false)
  _gravcollector:setCollidablePermission(false)
  Fn_attachJoint(_gravcollector, Fn_getPlayer(), "loc_ci00")
end
energyCollectCreate = L0_0
function L0_0(A0_8)
  if _gravcollector then
    _gravcollector:setActive(A0_8)
  end
end
energyCollectActive = L0_0
function L0_0(A0_9, A1_10)
  local L2_11, L3_12, L4_13
  L2_11 = findGameObject2
  L3_12 = "Node"
  L4_13 = A1_10
  L2_11 = L2_11(L3_12, L4_13)
  L3_12 = createGameObject2
  L4_13 = "Puppet"
  L3_12 = L3_12(L4_13)
  L4_13 = createGameObject2
  L4_13 = L4_13("ActorBrain")
  invokeTask(function()
    L3_12:loadModel(A0_9 .. "_base")
    if string.sub(A0_9, 1, 3) == "kit" then
      L3_12:loadBaseSkeleton(A0_9 .. "_base", A0_9 .. "_base")
      L3_12:waitForLoading()
    end
    L3_12:try_init()
    L4_13:try_init()
    L3_12:waitForReady()
    L4_13:waitForReady()
    L3_12:setTransform(L2_11:getWorldTransform())
    L3_12:setBrain(L4_13)
    L3_12:try_start()
    L4_13:try_start()
    L3_12:loadPoseAnimation("stay", "kit01_stay_00")
    while L3_12:isLoading() do
      wait()
    end
    L3_12:playPoseAnimation("stay")
  end)
end
_createActor = L0_0
function L0_0(A0_14, A1_15)
  local L2_16, L3_17
  function L2_16()
    Fn_userCtrlAllOff()
    _isCollectedMachine[A1_15] = true
    Fn_pcSensorOff(A0_14)
  end
  L3_17 = {}
  L3_17.RL = {id = "dm01_09000", func = L2_16}
  Fn_gestureAction(L3_17)
end
collectGestureAction = L0_0
function L0_0()
  collectGestureAction("pccubesensor2_collect_01", 1)
end
pccubesensor2_collect_01_OnEnter = L0_0
function L0_0()
  Fn_gestureActionCancel()
  _isCollectedMachine[1] = false
end
pccubesensor2_collect_01_OnLeave = L0_0
function L0_0()
  collectGestureAction("pccubesensor2_collect_02", 2)
end
pccubesensor2_collect_02_OnEnter = L0_0
function L0_0()
  Fn_gestureActionCancel()
  _isCollectedMachine[2] = false
end
pccubesensor2_collect_02_OnLeave = L0_0
function L0_0()
  collectGestureAction("pccubesensor2_collect_03", 3)
end
pccubesensor2_collect_03_OnEnter = L0_0
function L0_0()
  Fn_gestureActionCancel()
  _isCollectedMachine[3] = false
end
pccubesensor2_collect_03_OnLeave = L0_0
function L0_0()
  collectGestureAction("pccubesensor2_collect_04", 4)
end
pccubesensor2_collect_04_OnEnter = L0_0
function L0_0()
  Fn_gestureActionCancel()
  _isCollectedMachine[4] = false
end
pccubesensor2_collect_04_OnLeave = L0_0
