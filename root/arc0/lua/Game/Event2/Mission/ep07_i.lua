dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
_puppet_tbl = {}
function Initialize()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
end
function Ingame()
  Fn_userCtrlOff()
  Fn_sendEventComSb("requestSpawnSupportCrow", Supporter.FirstAction.Ground, "locator2_crow_start_pos_02")
  repeat
    wait()
    _puppet_tbl.pup_crow = Fn_sendEventComSb("getCrowPuppetHundle")
  until _puppet_tbl.pup_crow ~= nil
  crowSetIdle(_puppet_tbl.pup_crow:getBrain(), true)
  if Fn_sendEventComSb("isThisStartMissionPart") == true then
    Fn_sendEventComSb("requestButtleInit")
    while Fn_sendEventComSb("isButtleInitEnd") == false do
      wait()
    end
    Fn_sendEventComSb("requestSpawnBattleEnemyIdle")
  end
  while Fn_sendEventComSb("isBattleReady") == false do
    wait()
  end
  Fn_missionStart()
  Fn_sendEventComSb("requestBattleStart")
  crowSetIdle(_puppet_tbl.pup_crow:getBrain(), false)
  Fn_missionView("ep07_08000")
  Fn_userCtrlOn()
  while Fn_sendEventComSb("isButtleEnd") == false do
    wait()
  end
  Fn_setBgmPoint("event", "battle1_end")
  _puppet_tbl.pup_crow = nil
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
