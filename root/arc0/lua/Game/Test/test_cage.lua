import("math")
import("Debug")
import("HUD")
import("Player")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
CAGE_FLOATER_PARAMS = {
  tx = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.1,
    min_a = 0,
    max_t = 30,
    min_t = 10
  },
  ty = {
    rand = 0.5,
    sign = 0.85,
    max_a = 0.2,
    min_a = 0,
    max_t = 3,
    min_t = 1
  },
  tz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.1,
    min_a = 0,
    max_t = 30,
    min_t = 10
  },
  rx = {
    rand = 0.5,
    sign = 0,
    max_a = 5,
    min_a = 0,
    max_t = 5,
    min_t = 1
  },
  ry = {
    rand = 0.5,
    sign = 0,
    max_a = 5,
    min_a = 0,
    max_t = 10,
    min_t = 1
  },
  rz = {
    rand = 0.5,
    sign = 0,
    max_a = 5,
    min_a = 0,
    max_t = 5,
    min_t = 1
  }
}
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Vector
  L1_1 = -22
  L2_2 = 0
  L3_3 = 17.6
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  org = L0_0
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "ve_crane_root"
  L1_1(L2_2, L3_3)
  L1_1 = createGameObject2
  L2_2 = "GimmickBg"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setDrawModelName
  L4_4 = "ve_cage"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setCollisionName
  L4_4 = "ve_cage"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setAttributeName
  L4_4 = "ve_cage"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setVisibleBlockEnable
  L4_4 = false
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setFloaterParams
  L4_4 = CAGE_FLOATER_PARAMS
  L2_2(L3_3, L4_4)
  L3_3 = L0_0
  L2_2 = L0_0.appendChild
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.connectToLocation
  L4_4 = L0_0
  L2_2(L3_3, L4_4, nil, "ve_cage_01", true)
  L2_2 = createGameObject2
  L3_3 = "GimmickBg"
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.setCollisionName
  L3_3(L4_4, "ve_cage_col")
  L4_4 = L2_2
  L3_3 = L2_2.setAttributeName
  L3_3(L4_4, "ve_cage_col")
  L4_4 = L2_2
  L3_3 = L2_2.overrideCollisionFilterLayer
  L3_3(L4_4, "Boundary")
  L4_4 = L2_2
  L3_3 = L2_2.setCollidablePermission
  L3_3(L4_4, false)
  L4_4 = L1_1
  L3_3 = L1_1.appendChild
  L3_3(L4_4, L2_2)
  L3_3 = createGameObject2
  L4_4 = "Wire"
  L3_3 = L3_3(L4_4)
  L4_4 = L3_3.setModelName
  L4_4(L3_3, "wire_nk_01")
  L4_4 = L3_3.setVisibleBlockEnable
  L4_4(L3_3, false)
  L4_4 = DebugStage
  L4_4 = L4_4.createTestPlayer
  L4_4 = L4_4(L4_4, org, YRotQuaternion(Deg2Rad(90)))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  L0_0:setPhasePos(Vector(org.x + 3, 60, org.z))
  L0_0:setForceMove()
  while L1_1:isConnectingToLocation() do
    wait()
  end
  L3_3:bind(L0_0, "wire_nk_01", nil, L1_1, nil, Vector(0, -0.1, 0))
  L1_1:appendCurvePoint(Vector(0, 0, 0), Vector(0, 0, 1), 10)
  L1_1:appendCurvePoint(Vector(0, -40, 0), Vector(0, 0, 1), 10)
  L1_1:appendCurvePoint(Vector(0, 0, 0), Vector(0, 0, 1), 10)
  L1_1:setCurveRepeatCount(-1)
  Debug:setSwitch({"Display", "Debug Draw"}, false)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  L1_1:setVisibleBlockEnable(false)
  invokeTask(function(A0_5, A1_6, A2_7)
    while true do
      pos, rot = A1_6:getNodePosRot("ve_cage_chara_position")
      if pos == nil then
        wait()
      end
    end
    print(pos)
    Player:reset(Player.kReset_Standing, pos, IdentityQuaternion())
    frame = 0
    while true do
      frame = frame + 1
      if frame == 60 then
        A2_7:setCollidablePermission(true)
        A1_6:overrideCollisionFilterLayer("Boundary")
        print("=== lock ===")
      end
      if frame == 120 then
        A2_7:setCollidablePermission(false)
        A1_6:overrideCollisionFilterLayer(nil)
        print("=== unlock ===")
        frame = 0
      end
      wait()
    end
  end, L4_4, L1_1, L2_2)
end
