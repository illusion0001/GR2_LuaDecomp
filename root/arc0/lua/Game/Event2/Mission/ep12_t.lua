dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_puppet_crow = nil
_brain_crow = nil
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
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
function pccubesensor2_change_part_OnEnter(A0_0, A1_1)
  Fn_pcSensorOff(A0_0)
  _change_part = true
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
