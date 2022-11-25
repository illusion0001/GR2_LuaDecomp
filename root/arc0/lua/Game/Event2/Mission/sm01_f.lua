dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm01_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2
  L0_2 = setUserCtrlOn
  L0_2(false)
  L0_2 = Fn_resetPcPos
  L0_2("locator2_pc_start_pos")
  function L0_2()
    Fn_missionStart()
  end
  Fn_kaiwaDemoView2("sm01_00900k", L0_2)
  setUserCtrlOn(true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
