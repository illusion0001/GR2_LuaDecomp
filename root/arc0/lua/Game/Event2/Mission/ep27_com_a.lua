dofile("/Game/Event2/Common/HeaderCommon.lua")
_phase = 0
_puppet_tbl = {}
_npc_tbl = {}
_event_mot = {
  care_baby_01 = "new01_care_baby_01"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "new01",
      type = "new01",
      node = "locator2_27_new01",
      active = false
    },
    {
      name = "eqo02",
      type = "eqo02",
      node = "locator2_27_eqo02",
      active = false
    },
    {
      name = "bab01",
      type = "bab01",
      node = "locator2_27_eqo02",
      active = false
    }
  }
  _npc_tbl = Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadNpcEventMotion("new01", _event_mot)
end
function Ingame()
  while true do
    if _phase == 1 then
      Fn_setNpcActive("new01", true)
      Fn_setNpcActive("eqo02", true)
      Fn_setNpcActive("bab01", true)
      Fn_watchNpc("new01", false)
      Fn_watchNpc("eqo02", false)
      Fn_findNpc("eqo02"):setPilot(_puppet_tbl.bab01, "loc_top", "care")
      Fn_playNpcEventMotion("new01", _event_mot.care_baby_01, true, 0.3, false, 0, false)
      Fn_playNpcEventMotion("eqo02", "care", true, 0.3, false, 0, false)
      while _npc_tbl.new01:isReadyNpc() == false or _npc_tbl.eqo02:isReadyNpc() == false or _npc_tbl.bab01:isReadyNpc() == false do
        wait()
      end
      addPhaseNum()
    elseif _phase == 3 then
      Fn_watchNpc("new01", false)
      addPhaseNum()
    end
    wait()
  end
end
function Finalize()
  local L0_1, L1_2
end
function addPhaseNum()
  local L1_3
  L1_3 = _phase
  L1_3 = L1_3 + 1
  _phase = L1_3
end
function checkPhaseNum()
  local L0_4, L1_5
  L0_4 = _phase
  return L0_4
end
