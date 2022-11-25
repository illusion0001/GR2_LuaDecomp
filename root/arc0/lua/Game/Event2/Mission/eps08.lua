dofile("/Game/Event2/Common/EventCommon.lua")
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "phi",
      type = "phi01",
      node = "locator2_phi01_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  local L0_1, L1_2
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "eps08_00010k"
  L0_1(L1_2)
  L0_1 = {L1_2}
  L1_2 = "locator2_phi_move_pos_01"
  L1_2 = {}
  L1_2.anim_walk_speed = 1
  L1_2.anim_walk = "walk2"
  while Fn_isInSightTarget(_puppet_tbl.phi, 1.5) ~= false do
    wait()
  end
  Fn_disappearNpc("phi")
  waitSeconds(1.5)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
