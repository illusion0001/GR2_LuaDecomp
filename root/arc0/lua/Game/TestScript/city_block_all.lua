dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  local L0_0, L1_1
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.get
  L0_0 = L0_0(L1_1, ggd.Debug__PlayerStartPos)
  L1_1 = GameDatabase
  L1_1 = L1_1.get
  L1_1 = L1_1(L1_1, ggd.Debug__PlayerStartArea)
  debugCreateLocater("locator2_pc_start_pos", L0_0, L1_1)
end
function Ingame()
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint(nil)
end
function Finalize()
  local L0_2, L1_3
end
