dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
  L0_0 = _puppet_tbl
  L0_0.ep15_pol_01 = Fn_findNpcPuppet("ep15_pol_01")
  L0_0 = {
    {
      name = "bulbosa",
      type = "bul01",
      node = "locator2_bulbosa_pos",
      active = false
    },
    {
      name = "police1",
      type = "man31",
      node = "locator2_police1_pos",
      active = false
    },
    {
      name = "police2",
      type = "man31",
      node = "locator2_police2_pos",
      active = false
    },
    {
      name = "kaji",
      type = "kaj01",
      node = "locator2_kaji_pos",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_setNpcActive("ep15_pol_01", false)
  Fn_setNpcActive("bulbosa", true)
  Fn_setNpcActive("kaji", true)
  Fn_setNpcActive("police1", true)
  Fn_setNpcActive("police2", true)
  Fn_missionStart()
  waitSeconds(0.5)
  invokeTask(function()
    Fn_turnNpc("bulbosa", _puppet_tbl.kaji)
  end)
  waitSeconds(0.7)
  Player:setLookAtIk(true, 1, _puppet_tbl.kaji:getWorldPos())
  waitSeconds(2)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
