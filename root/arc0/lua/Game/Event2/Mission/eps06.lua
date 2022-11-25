dofile("/Game/Event2/Common/EventCommon.lua")
puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "ep06_riz01",
      type = "ryz01",
      node = "locator2_riz_start_pos_ryz01_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_playMotionNpc("ep06_riz01", "talk_00", false)
  Fn_missionStart()
  Fn_kaiwaDemoView("eps06_00010k")
  invokeTask(function()
    Fn_moveNpc("ep06_riz01", "locator2_riz_move_pos_ryz01_01")
    while not Fn_findNpc("ep06_riz01"):isMoveEnd() do
      wait()
    end
    Fn_turnNpc("ep06_riz01")
    while not Fn_findNpc("ep06_riz01"):isTurnEnd() do
      wait()
    end
  end)
  Fn_playMotionNpc("ep06_riz01", "stay", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
