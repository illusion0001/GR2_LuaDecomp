dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm01_common.lua")
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = setUserCtrlOn
  L0_0(false)
  L0_0 = {
    {
      name = MIZ_ID,
      type = "tkg05",
      node = "locator2_miz_e_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  local L0_1
  L0_1 = Fn_warpCageMineArea
  L0_1()
  L0_1 = Fn_findNpc
  L0_1 = L0_1(MIZ_ID)
  Fn_warpNpc(L0_1, "locator2_miz_e_01")
  Fn_missionStart()
  waitSeconds(2)
  Fn_kaiwaDemoView("sm01_00800k")
  Fn_blackout()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disappearNpc(MIZ_ID)
end
