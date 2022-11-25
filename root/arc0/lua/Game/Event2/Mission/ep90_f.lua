dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
dofile("/Game/Misc/fatal_marker.lua")
_vogo_task = nil
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_01",
      name = "giant01",
      ai_spawn_option = "Giant/giant_boss_1stpub"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    "evarea2_po_a_02_common",
    "evarea2_po_a_04_common",
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_haze",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_vogo_escape",
    "evarea2_po_a_04_crow"
  }
  Fn_loadEventData("evx/ep90_common", L0_0)
  Fn_loadEventData("evx/ep90", {
    "evarea2_po_a_04"
  }, true)
  _sdemo = SDemo.create("ep90_f")
  HUD:setMainMenuInfoParam(nil, nil, "ep90_00950")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = Fn_warpNpc
  L1_2 = "vogo_01"
  L2_3 = "warppoint2_vogo_01"
  L0_1(L1_2, L2_3)
  L0_1 = vogo_battle_escape
  L0_1 = L0_1()
  _vogo_task = L0_1
  L0_1 = Fn_spawnSuppotCrow
  L1_2 = false
  L2_3 = Supporter
  L2_3 = L2_3.FirstAction
  L2_3 = L2_3.Ground
  L0_1 = L0_1(L1_2, L2_3)
  L2_3 = L0_1
  L1_2 = L0_1.getBrain
  L1_2 = L1_2(L2_3)
  L2_3 = L1_2.setIdling
  L2_3(L3_4, L4_5)
  L2_3 = create_haze
  L2_3 = L2_3()
  for L6_7, _FORV_7_ in L3_4(L4_5) do
    _FORV_7_:setActive(true)
  end
  L4_5()
  while true do
    if L4_5 == 0 then
      L6_7 = "locator2_pc_start_pos"
      L5_6(L6_7)
      L6_7 = "ep90_01800k"
      L5_6(L6_7)
      L6_7 = L5_6
      L5_6(L6_7, "locator2_cut_07_cam01", "locator2_cut_07_aim01")
      L6_7 = L5_6
      L5_6(L6_7)
      L6_7 = "locator2_pc_start_pos"
      L5_6(L6_7)
      L6_7 = L3_4
      L5_6(L6_7)
      L6_7 = {}
      L6_7.time = 1.85
      L6_7.pos = "locator2_cut_07_cam02"
      L6_7 = {
        {
          time = 1.85,
          pos = "locator2_cut_07_aim02"
        }
      }
      _sdemo:play(L5_6, L6_7)
      while _sdemo:isPlay() do
        wait()
      end
      L6_7 = {
        {
          time = 0.2,
          pos = "locator2_cut_07_aim03"
        },
        {
          time = 0.4,
          pos = "locator2_cut_07_aim04"
        }
      }
      _sdemo:play(nil, L6_7)
      while _sdemo:isPlay() do
        wait()
      end
      L6_7 = {
        {
          time = 2,
          pos = "locator2_cut_07_aim05"
        }
      }
      _sdemo:play(L5_6, L6_7)
      while _sdemo:isPlay() do
        wait()
      end
      _sdemo:stop(1.5)
      waitSeconds(1.5)
    elseif L4_5 == 1 then
      L6_7 = L1_2
      L5_6(L6_7, false)
      L6_7 = kFATAL_TYPE_ASH
      L6_7 = L5_6.set
      L6_7(L5_6, findGameObject2("Puppet", "giant01"), "bn_c01_pelvis0", true)
      L6_7 = Fn_userCtrlOn
      L6_7()
      L6_7 = L5_6.run
      L6_7(L5_6)
      repeat
        L6_7 = wait
        L6_7()
        L6_7 = L5_6.isFatalFinish
        L6_7 = L6_7(L5_6)
      until L6_7
      L6_7 = L5_6.kill
      L6_7(L5_6)
      break
    end
    L5_6()
  end
  if L5_6 ~= nil then
    L6_7 = L5_6
    if L5_6 == true then
      L6_7 = L5_6
      L5_6(L6_7)
    end
  end
  _vogo_task = nil
  L6_7 = "vogo_01"
  L5_6(L6_7)
  L6_7 = L5_6
  L5_6(L6_7, 1)
  L6_7 = 1.5
  L5_6(L6_7)
  L5_6()
  L5_6()
  L5_6()
end
function Finalize()
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  Fn_killNpcTask("vogo_01")
end
