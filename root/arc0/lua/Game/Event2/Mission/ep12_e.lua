dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_altar = false
_item_hdl = nil
_puppet_crow = nil
_brain_crow = nil
function Initialize()
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
  while _altar == false do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_altar_OnEnter()
  if _altar == false then
    _altar = true
    Fn_pcSensorOff("pccubesensor2_altar")
  end
end
function pccubesensor2_alter_room_OnEnter(A0_0)
  Fn_pcSensorOff(A0_0)
  Fn_captionView("ep12_02003")
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
