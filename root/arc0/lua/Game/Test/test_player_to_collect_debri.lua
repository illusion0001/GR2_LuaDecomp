import("math")
import("common")
import("Debug")
import("Player")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
function _spawn_debri(A0_0)
  local L1_1
  L1_1 = {}
  L1_1.object_list = {
    "woodbox_sk_01",
    "woodbox_iy_01",
    "apple_kn_01_base",
    "dust_iy_01"
  }
  L1_1.layout_func = LayoutCircle
  L1_1.layout_args = {
    num = 5,
    radius = 2.5,
    from_player_distance = 7
  }
  spawn_clone_debri(L1_1)
end
function put_barrel(A0_2)
  createGameObject2("GimmickBg"):setDrawModelName("barrel_iy_01")
  createGameObject2("GimmickBg"):setCollisionName("barrel_iy_01")
  createGameObject2("GimmickBg"):setAttributeName("barrel_iy_01")
  createGameObject2("GimmickBg"):setPos(A0_2)
  createGameObject2("GimmickBg"):setName("barrel_iy_01")
  createGameObject2("GimmickBg"):setVisibleBlockEnable(false)
  return (createGameObject2("GimmickBg"))
end
function put_barrels(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  for L4_7 = 1, 10 do
    L5_8 = print
    L5_8("put_barrel")
    L5_8 = RandomXZVector
    L5_8 = L5_8()
    L5_8 = L5_8 * 5
    L5_8 = A0_3 + L5_8
    put_barrel(L5_8)
  end
end
function main()
  local L0_9
  L0_9 = Vector
  L0_9 = L0_9(-20.8699, 1, 69.01)
  put_barrels(L0_9)
  createGameObject2("CloneDebriCollector"):try_init()
  while not createGameObject2("CloneDebriCollector"):isReady() do
    wait()
  end
  createGameObject2("CloneDebriCollector"):try_start()
  createGameObject2("TerrainBg"):setModelName("motion_test_stage1")
  createGameObject2("TerrainBg"):setCollisionName("motion_test_stage1")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Debug_RegisterSpawners()
  while true do
    wait()
  end
end
