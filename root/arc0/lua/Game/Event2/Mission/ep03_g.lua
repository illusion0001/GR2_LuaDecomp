dofile("/Game/Event2/Common/EventCommon.lua")
_change_part = false
function Initialize()
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_g")
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  Fn_missionStart()
  Fn_userCtrlOn()
  invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.3)
    Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_05"))
    Fn_captionView("ep03_11000")
  end)
  repeat
    wait()
  until _change_part
  Fn_naviKill()
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
  local L0_2, L1_3
end
