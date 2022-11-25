import("math")
import("Debug")
import("Area")
import("EventData")
import("Mob")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
U = dofile("/Game/Misc/underscore.lua")
function _start_game_obj()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function main()
  local L0_0, L1_1, L2_2
  L0_0 = Mob
  L0_0 = L0_0._mob_set_debug_settings
  L0_0()
  L0_0 = createGameObject2
  L1_1 = "MobGlobal"
  L0_0 = L0_0(L1_1)
  g_mob_global = L0_0
  L0_0 = g_mob_global
  L1_1 = L0_0
  L0_0 = L0_0.setName
  L2_2 = "MobGlobal"
  L0_0(L1_1, L2_2)
  L0_0 = g_mob_global
  L1_1 = L0_0
  L0_0 = L0_0.try_init
  L0_0(L1_1)
  L0_0 = g_mob_global
  L1_1 = L0_0
  L0_0 = L0_0.waitForReady
  L0_0(L1_1)
  L0_0 = g_mob_global
  L1_1 = L0_0
  L0_0 = L0_0.try_start
  L0_0(L1_1)
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.registerBinders
  L2_2 = Mob
  L2_2 = L2_2.area_with_pat_list
  L0_0(L1_1, L2_2)
  L0_0 = "dt_a_root"
  L1_1 = createGameObject2
  L2_2 = "Area"
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.setName
  L2_2(L1_1, L0_0)
  L2_2 = L1_1.setEnableDebugDraw
  L2_2(L1_1, false)
  L2_2 = L1_1.setDriftParams
  L2_2(L1_1, drift_params)
  L2_2 = L1_1.setDriftInherit
  L2_2(L1_1, true)
  L2_2 = L1_1.setDriftEnable
  L2_2(L1_1, false)
  L2_2 = Vector
  L2_2 = L2_2(0, 0, 0)
  if L0_0 == "po_a_root" then
    L2_2 = Vector(0, 29, 110)
  end
  L2_2 = _start_game_obj
  L2_2()
  L2_2 = Area
  L2_2 = L2_2.setAnimMoveDriftEnable
  L2_2(L2_2, true)
end
function Mob.debug_func()
  local L0_3, L1_4, L2_5
  L0_3 = dbg_print
  L1_4 = "overidden Mob.debug_func[@test_z] was called"
  L0_3(L1_4)
  L0_3 = Mob
  L1_4 = L0_3
  L0_3 = L0_3.getMainPartition
  L0_3 = L0_3(L1_4)
  L2_5 = L0_3
  L1_4 = L0_3.getName
  L1_4 = L1_4(L2_5)
  if L1_4 == "po_a_01" then
    L1_4 = true
    L2_5 = Mob
    L2_5 = L2_5.navPicker_setUnwalkable
    L2_5(L2_5, L0_3, "tutorial_start", "event_a", L1_4)
    if L1_4 then
      L2_5 = Mob
      L2_5 = L2_5.collectOverlappedStops
      L2_5 = L2_5(L2_5, L0_3, "tutorial_end")
      Mob:setStopExcludedIndices(L0_3, L2_5)
    else
      L2_5 = Mob
      L2_5 = L2_5.clearStopExcludedIndices
      L2_5(L2_5, L0_3)
    end
  end
end
