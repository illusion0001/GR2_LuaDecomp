L0_0 = import
L0_0("Mob")
L0_0 = import
L0_0("Time")
L0_0 = import
L0_0("Area")
L0_0 = import
L0_0("math")
L0_0 = import
L0_0("GameDatabase")
L0_0 = dofile
L0_0 = L0_0("/Game/Misc/underscore.lua")
_ = L0_0
L0_0 = dofile
L0_0 = L0_0("/Game/Event2/mob_hatchery.lua")
g_mob_global = nil
function on_area_started(A0_1)
  local L1_2
end
function on_main_area_changed(A0_3, A1_4)
  dbg_print("on_main_area_changed", A0_3, A1_4)
end
function check_if_mob_requested()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__Mob) and GameDatabase:get(ggd.GlobalSystemFlags__Mob) then
    return true
  else
    GameDatabase:set(ggd.GlobalSystemFlags__Mob, false)
    return false
  end
end
function main()
  local L0_5, L1_6
  L0_5 = createGameObject2
  L1_6 = "MobGlobal"
  L0_5 = L0_5(L1_6)
  g_mob_global = L0_5
  L0_5 = g_mob_global
  L1_6 = L0_5
  L0_5 = L0_5.setName
  L0_5(L1_6, "MobGlobal")
  L0_5 = g_mob_global
  L1_6 = L0_5
  L0_5 = L0_5.try_init
  L0_5(L1_6)
  L0_5 = g_mob_global
  L1_6 = L0_5
  L0_5 = L0_5.waitForReady
  L0_5(L1_6)
  L0_5 = g_mob_global
  L1_6 = L0_5
  L0_5 = L0_5.try_start
  L0_5(L1_6)
  L0_5 = Mob
  L0_5 = L0_5.devel
  if L0_5 then
    L0_5 = Mob
    L0_5 = L0_5._mob_set_debug_settings
    L0_5()
  end
  L0_5 = Area
  L1_6 = _area_on_started
  L0_5.on_started = L1_6
  L0_5 = Mob
  L1_6 = L0_5
  L0_5 = L0_5.registerBinders
  L0_5(L1_6, Mob.area_with_pat_list)
  L0_5 = invokeTask
  L1_6 = L0_0.taskManagement
  L0_5(L1_6)
  L0_5 = check_if_mob_requested
  L0_5 = L0_5()
  while true do
    L1_6 = check_if_mob_requested
    L1_6 = L1_6()
    Mob:setWorking(L1_6)
    wait()
  end
end
