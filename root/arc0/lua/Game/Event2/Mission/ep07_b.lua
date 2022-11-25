dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlAllOff()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
end
function Ingame()
  Fn_setNpcActive("ep07_merchant", true)
  Fn_setNpcActive("ep07_selsb", true)
  Player:getPuppet():setVisible(false)
  while Fn_sendEventComSb("missionPartInitIsEnd") == false do
    wait()
  end
  Fn_missionStart()
  waitSeconds(1)
  Player:getPuppet():setVisible(true)
  while Player:setAction(Player.kAction_CatWarpOut) == false do
    wait()
  end
  Sound:pulse("cat_warp2")
  Sound:pulse("pc_blackhole_start")
  Fn_sendEventComSb("missionPartMainStart")
  while Fn_sendEventComSb("missionPartMainIsEnd") == false do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
