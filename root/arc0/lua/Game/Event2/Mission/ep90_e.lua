dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_vogo_task = nil
enmgen2_ep90_d_e = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_01",
      name = "ene_c_01"
    },
    {
      type = "runner",
      locator = "locator_02",
      name = "ene_c_02"
    },
    {
      type = "runner",
      locator = "locator_03",
      name = "ene_c_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "ene_c_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "ene_c_05"
    },
    {
      type = "gellyfish",
      locator = "locator_06",
      name = "ene_c_06"
    },
    {
      type = "gellyfish",
      locator = "locator_07",
      name = "ene_c_07"
    },
    {
      type = "imp",
      locator = "locator_08",
      name = "ene_c_08"
    },
    {
      type = "imp",
      locator = "locator_09",
      name = "ene_c_09"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = {
    "evarea2_po_a_02_common",
    "evarea2_po_a_04_common",
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_haze",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_vogo_escape",
    "evarea2_po_a_04_ep90_d_e",
    "evarea2_po_a_04_crow"
  }
  Fn_loadEventData("evx/ep90_common", L0_0)
  Fn_loadEventData("evx/ep90", {
    "evarea2_po_a_04"
  }, true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = findGameObject2
  L1_2 = "EnemyGenerator"
  L2_3 = "enmgen2_ep90_d_e"
  L0_1 = L0_1(L1_2, L2_3)
  L2_3 = L0_1
  L1_2 = L0_1.requestIdlingEnemy
  L3_4 = true
  L1_2(L2_3, L3_4)
  L1_2 = Fn_warpNpc
  L2_3 = "vogo_01"
  L3_4 = "warppoint2_vogo_01"
  L1_2(L2_3, L3_4)
  L1_2 = vogo_battle_escape
  L1_2 = L1_2()
  _vogo_task = L1_2
  L1_2 = Fn_spawnSuppotCrow
  L2_3 = false
  L3_4 = Supporter
  L3_4 = L3_4.FirstAction
  L3_4 = L3_4.Ground
  L1_2 = L1_2(L2_3, L3_4)
  L3_4 = L1_2
  L2_3 = L1_2.getBrain
  L2_3 = L2_3(L3_4)
  L3_4 = L2_3.setIdling
  L3_4(L2_3, true)
  L3_4 = create_haze
  L3_4 = L3_4()
  for _FORV_7_, _FORV_8_ in pairs(L3_4) do
    _FORV_8_:setActive(true)
  end
  Fn_missionStart()
  while true do
    if 0 == 0 then
      Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
      Fn_kaiwaDemoView("ep90_01700k")
      L0_1:requestIdlingEnemy(false)
      L2_3:setIdling(false)
      Fn_missionViewWait("ep90_00950")
      while true do
        if 0 < L0_1:getEnemyCount() then
          wait()
          break
        end
      end
    end
  end
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  Fn_killNpcTask("vogo_01")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  Fn_killNpcTask("vogo_01")
end
