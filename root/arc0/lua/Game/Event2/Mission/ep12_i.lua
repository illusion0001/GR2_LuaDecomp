dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_change_part = false
_puppet_crow = nil
_brain_crow = nil
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  _brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, false)
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_sendEventComSb("aisleMissionView")
  _navi_task = invokeTask(function()
    waitSeconds(1.3)
    Fn_sendEventComSb("guide_navi", 1)
  end)
  repeat
    wait()
  until _change_part
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_fall_01_OnEnter()
  invokeTask(function()
    Fn_sendEventComSb("requestMoveRubble", "ANY_MOVE", "fallstop_01", 4, 0.5, "EaseInOut", false)
    _fall01_task = invokeTask(object_fall)
  end)
end
function object_fall()
  while not _change_part do
    Fn_sendEventComSb("requestObjFall", "aisle_03", 10, 9, 0, "ORDER")
    waitSeconds(30)
  end
end
function pccubesensor2_caption_01_OnEnter()
  invokeTask(function()
    Fn_captionViewWait("ep12_04004")
  end)
  Fn_pcSensorOff("pccubesensor2_caption_01")
end
function pccubesensor2_info_OnEnter(A0_0, A1_1)
  Fn_pcSensorOff(A0_0)
  invokeTask(function()
    if GameDatabase:get(ggd.Savedata__Info__ep12__ep12_info_02) ~= 2 then
      HUD:info("ep12_info_02", false)
    else
      HUD:info("ep12_info_02", true)
    end
  end)
end
function pccubesensor2_change_part_OnEnter(A0_2, A1_3)
  _fall01_task:abort()
  Fn_pcSensorOff(A0_2)
  _change_part = true
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
