import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
import("GlobalGem")
import("Vehicle")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  createSandbox2("father2"):setString("g_filename", "/Game/Event2/father2.lua")
  createSandbox2("father2"):try_init()
  createSandbox2("father2"):waitForReady()
  createSandbox2("father2"):try_start()
  while not createSandbox2("father2"):sendEvent("isPcSpawned") do
    wait()
  end
  createGameObject2("Area"):setName("test_kudo")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  _loadEventData("test_tsuha_vehicle")
  test_tsuha_vehicle_create()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  wait()
  GameDatabase:reset(ggd.GlobalSystemFlags)
end
function _loadEventData(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = loadFileAsset
  L2_2 = "evb"
  L3_3 = "evx/"
  L3_3 = L3_3 .. A0_0
  L1_1 = L1_1(L2_2, L3_3)
  L2_2, L3_3 = nil, nil
  if L1_1 ~= nil then
    L1_1:wait()
    L2_2 = L1_1:getRoot()
    L3_3 = EventData:create(A0_0, nil, L2_2)
    L3_3:try_init()
    L3_3:waitForReady()
    L3_3:try_start()
  end
end
function test_tsuha_vehicle_create()
  local L0_4, L1_5
  L0_4 = {}
  L1_5 = {}
  L1_5.ship = nil
  L1_5.pos_route_tbl = nil
  L1_5.route_object = nil
  L0_4[1] = L1_5
  L1_5 = {}
  L1_5.ship = nil
  L1_5.pos_route_tbl = nil
  L1_5.route_object = nil
  L0_4[2] = L1_5
  L1_5 = {}
  L1_5.ship = nil
  L1_5.pos_route_tbl = nil
  L1_5.route_object = nil
  L0_4[3] = L1_5
  while true do
    L1_5 = Vehicle
    L1_5 = L1_5.isReady
    L1_5 = L1_5(L1_5)
    if not L1_5 then
      L1_5 = wait
      L1_5()
    end
  end
  L1_5 = L0_4[1]
  L1_5.pos_route_tbl = {
    findGameObject2("Node", "locator2_ve_route01_01"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route01_02"):getWorldPos()
  }
  L1_5 = L0_4[1]
  L1_5.ship, L0_4[1].route_object = CreateScriptVehicle(L0_4[1].pos_route_tbl, "ForScript01", "ship_01")
  L1_5 = L0_4[1]
  L1_5 = L1_5.ship
  L1_5 = L1_5.setWorldTransform
  L1_5(L1_5, findGameObject2("Node", "locator2_ve_route01_01"):getWorldTransform())
  L1_5 = L0_4[2]
  L1_5.pos_route_tbl = {
    findGameObject2("Node", "locator2_ve_route02_01"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route02_02"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route02_03"):getWorldPos()
  }
  L1_5 = L0_4[2]
  L1_5.ship, L0_4[2].route_object = CreateScriptVehicle(L0_4[2].pos_route_tbl, "ForScript01", "ship_02")
  L1_5 = L0_4[2]
  L1_5 = L1_5.ship
  L1_5 = L1_5.setWorldTransform
  L1_5(L1_5, findGameObject2("Node", "locator2_ve_route02_01"):getWorldTransform())
  L1_5 = L0_4[3]
  L1_5.pos_route_tbl = {
    findGameObject2("Node", "locator2_ve_route03_01"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route03_02"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route03_03"):getWorldPos(),
    findGameObject2("Node", "locator2_ve_route03_04"):getWorldPos()
  }
  L1_5 = L0_4[3]
  L1_5.ship, L0_4[3].route_object = CreateScriptVehicle(L0_4[3].pos_route_tbl, "ForScript01", "ship_03")
  L1_5 = L0_4[3]
  L1_5 = L1_5.ship
  L1_5 = L1_5.setWorldTransform
  L1_5(L1_5, findGameObject2("Node", "locator2_ve_route03_01"):getWorldTransform())
  L1_5 = {}
  L1_5[1] = {
    name = "man01_01",
    type = "man01",
    anim_name = "fly",
    active = true,
    attach = true,
    color_variation = 0,
    start = true
  }
  L1_5[2] = {
    name = "man01_02",
    type = "man01",
    anim_name = "fly",
    active = true,
    attach = true,
    color_variation = 0,
    start = true
  }
  L1_5[3] = {
    name = "man01_03",
    type = "man01",
    anim_name = "fly",
    active = true,
    attach = true,
    color_variation = 0,
    start = true
  }
  Fn_setupNpc(L1_5)
  L0_4[1].ship:setPilot(Fn_findNpcPuppet("man01_01"), "loc_driver1")
  L0_4[2].ship:setPilot(Fn_findNpcPuppet("man01_02"), "loc_driver1")
  L0_4[3].ship:setPilot(Fn_findNpcPuppet("man01_03"), "loc_driver1")
  invokeTask(function()
    local L0_6, L1_7
    function L0_6()
      for _FORV_3_, _FORV_4_ in pairs(L0_4) do
        if _FORV_4_.ship:getRemainingDist() <= 0 then
          _FORV_4_.ship:setBaseSpeed(0)
        end
      end
    end
    function L1_7()
      local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13
      for L3_11, L4_12 in L0_8(L1_9) do
        L5_13 = L4_12.ship
        L5_13 = L5_13.getRemainingDist
        L5_13 = L5_13(L5_13)
        if L5_13 <= 0 then
          L5_13 = Vehicle
          L5_13 = L5_13.spawnRoute
          L5_13 = L5_13(L5_13, L4_12.pos_route_tbl)
          Vehicle:attach(nil, L4_12.ship)
          Vehicle:attach(L5_13, L4_12.ship)
        end
      end
    end
    while true do
      L0_6()
      wait()
    end
  end)
end
function CreateScriptVehicle(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19
  L3_17 = Vehicle
  L4_18 = L3_17
  L3_17 = L3_17.spawnRoute
  L5_19 = A0_14
  L3_17 = L3_17(L4_18, L5_19)
  L4_18 = Vehicle
  L5_19 = L4_18
  L4_18 = L4_18.spawnVehicle
  L4_18 = L4_18(L5_19, A1_15)
  L5_19 = L4_18.setName
  L5_19(L4_18, A2_16)
  L5_19 = Vehicle
  L5_19 = L5_19.attach
  L5_19(L5_19, L3_17, L4_18)
  function L5_19()
    print(L4_18:getName() .. " : recv damage")
  end
  L4_18:setCallback(L5_19)
  DebugShipWatch(L4_18)
  return L4_18, L3_17
end
_debug_ship_watch_tbl = {watch_num = 0}
function DebugShipWatch(A0_20)
  invokeTask(function(A0_21, A1_22)
    local L2_23
    L2_23 = A0_21.getName
    L2_23 = L2_23(A0_21)
    while true do
      Font:asciiPrint(10, 50 + A1_22 * 50, string.format("[%s] ", L2_23) .. "Base Speed:" .. string.format("%.3f", A0_21:getBaseSpeed()) .. ", Current Speed:" .. string.format("%.3f", A0_21:getCurrSpeed()) .. ", Remaining Distance:" .. string.format("%.3f", A0_21:getRemainingDist()))
      wait()
    end
  end, A0_20, _debug_ship_watch_tbl.watch_num)
  _debug_ship_watch_tbl.watch_num = _debug_ship_watch_tbl.watch_num + 1
end
