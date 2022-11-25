dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
function Initialize()
  GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_setNpcActive("ep16_Adicca", false)
  Fn_sendEventComSb("requestSection", "a1")
  Fn_missionStart()
  waitComNextPhase("a1")
  Fn_sendEventComSb("requestSection", "a2")
  waitComNextPhase("a2")
  Fn_playCDemo("ep16_00100c")
  Fn_sendEventComSb("requestSection", "a2_2")
  waitComNextPhase("a2_2")
  while HUD:menuStatus("CDemo").state == "running" do
    wait()
  end
  Fn_kaiwaDemoView("ep16_00110k")
  Fn_resetPcPos("locator2_sdemo1_pc_01")
  Fn_sendEventComSb("requestSection", "a3")
  waitComNextPhase("a3")
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
