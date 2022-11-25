dofile("/Game/Event2/Common/EventCommon.lua")
_change_part = false
function Initialize()
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_c")
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  Fn_missionStart()
  waitSeconds(1)
  if GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_01) ~= 2 then
    HUD:info("ep03_info_01", false)
  else
    HUD:info("ep03_info_01")
  end
  Fn_userCtrlOn()
  Fn_sendEventComSb("ViewMission")
  waitSeconds(1.3)
  invokeTask(function()
    Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_02"))
    while Fn_getDistanceToPlayer("locator2_litho_navi_02") > 30 do
      wait()
    end
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
