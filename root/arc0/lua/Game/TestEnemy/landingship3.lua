import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_01_01",
      name = "officer0001",
      target_vehicle = "mechsmall0001"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_01",
      name = "officer0002",
      target_vehicle = "mechsmall0002"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_01",
      name = "officer0003",
      target_vehicle = "mechsmall0003"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_01",
      name = "officer0004",
      target_vehicle = "mechsmall0004"
    },
    {
      type = "mechsmall",
      locator = "locator_01_01",
      name = "mechsmall0001",
      target_vehicle = "landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01_01",
      name = "mechsmall0002",
      target_vehicle = "landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01_01",
      name = "mechsmall0003",
      target_vehicle = "landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01_01",
      name = "mechsmall0004",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0001",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0002",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0003",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0004",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0005",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0006",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0007",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0008",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0009",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier0010",
      target_vehicle = "landingship01"
    },
    {
      type = "landingship",
      locator = "locator_01_01",
      name = "landingship01"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end
}
function main()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26
  L0_8 = Vector
  L1_9 = -5.6
  L2_10 = -2
  L3_11 = 96
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = Vector
  L2_10 = 22.7
  L3_11 = 25
  L4_12 = -50.89999999999999
  L1_9 = L1_9(L2_10, L3_11, L4_12)
  L2_10 = Vector
  L3_11 = 22.7
  L4_12 = 30
  L5_13 = -20.89999999999999
  L2_10 = L2_10(L3_11, L4_12, L5_13)
  L3_11 = Vector
  L4_12 = -12.7
  L5_13 = 20
  L6_14 = -20.89999999999999
  L3_11 = L3_11(L4_12, L5_13, L6_14)
  L4_12 = Vector
  L5_13 = -12.7
  L6_14 = 6.5
  L7_15 = -0.8999999999999915
  L4_12 = L4_12(L5_13, L6_14, L7_15)
  L5_13 = enemy_base_bg_setup
  L5_13()
  L5_13 = createGameObject2
  L6_14 = "Node"
  L5_13 = L5_13(L6_14)
  L7_15 = L5_13
  L6_14 = L5_13.setName
  L8_16 = "posA"
  L6_14(L7_15, L8_16)
  L7_15 = L5_13
  L6_14 = L5_13.setPos
  L8_16 = L1_9
  L6_14(L7_15, L8_16)
  L6_14 = createGameObject2
  L7_15 = "Node"
  L6_14 = L6_14(L7_15)
  L8_16 = L6_14
  L7_15 = L6_14.setName
  L9_17 = "posB"
  L7_15(L8_16, L9_17)
  L8_16 = L6_14
  L7_15 = L6_14.setPos
  L9_17 = L2_10
  L7_15(L8_16, L9_17)
  L7_15 = createGameObject2
  L8_16 = "Node"
  L7_15 = L7_15(L8_16)
  L9_17 = L7_15
  L8_16 = L7_15.setName
  L10_18 = "posC"
  L8_16(L9_17, L10_18)
  L9_17 = L7_15
  L8_16 = L7_15.setPos
  L10_18 = L3_11
  L8_16(L9_17, L10_18)
  L8_16 = createGameObject2
  L9_17 = "Node"
  L8_16 = L8_16(L9_17)
  L10_18 = L8_16
  L9_17 = L8_16.setName
  L11_19 = "posD"
  L9_17(L10_18, L11_19)
  L10_18 = L8_16
  L9_17 = L8_16.setPos
  L11_19 = L4_12
  L9_17(L10_18, L11_19)
  L9_17 = DebugStage
  L10_18 = L9_17
  L9_17 = L9_17.createTestPlayer
  L11_19 = L0_8
  L12_20 = YRotQuaternion
  L13_21 = Deg2Rad
  L14_22 = 90
  L18_26 = L13_21(L14_22)
  L18_26 = L12_20(L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L13_21(L14_22))
  L9_17 = L9_17(L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L12_20(L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L13_21(L14_22)))
  L10_18 = Player
  L11_19 = L10_18
  L10_18 = L10_18.setEnergy
  L12_20 = Player
  L12_20 = L12_20.kEnergy_Life
  L13_21 = Player
  L14_22 = L13_21
  L13_21 = L13_21.getEnergyMax
  L15_23 = Player
  L15_23 = L15_23.kEnergy_Life
  L18_26 = L13_21(L14_22, L15_23)
  L10_18(L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L13_21(L14_22, L15_23))
  L10_18 = Player
  L11_19 = L10_18
  L10_18 = L10_18.setEnergy
  L12_20 = Player
  L12_20 = L12_20.kEnergy_Gravity
  L13_21 = Player
  L14_22 = L13_21
  L13_21 = L13_21.getEnergyMax
  L15_23 = Player
  L15_23 = L15_23.kEnergy_Gravity
  L18_26 = L13_21(L14_22, L15_23)
  L10_18(L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L13_21(L14_22, L15_23))
  L10_18 = Player
  L11_19 = L10_18
  L10_18 = L10_18.setEnergy
  L12_20 = Player
  L12_20 = L12_20.kEnergy_SpAttack
  L13_21 = Player
  L14_22 = L13_21
  L13_21 = L13_21.getEnergyMax
  L15_23 = Player
  L15_23 = L15_23.kEnergy_SpAttack
  L18_26 = L13_21(L14_22, L15_23)
  L10_18(L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L13_21(L14_22, L15_23))
  L10_18 = loadFileAsset
  L11_19 = "evb"
  L12_20 = "evx/test_enemy_type_03"
  L10_18 = L10_18(L11_19, L12_20)
  L11_19, L12_20 = nil, nil
  if L10_18 ~= nil then
    L14_22 = L10_18
    L13_21 = L10_18.wait
    L13_21(L14_22)
    L14_22 = L10_18
    L13_21 = L10_18.getRoot
    L13_21 = L13_21(L14_22)
    L11_19 = L13_21
    L13_21 = EventData
    L14_22 = L13_21
    L13_21 = L13_21.create
    L15_23 = "test_kudo"
    L16_24 = nil
    L17_25 = L11_19
    L13_21 = L13_21(L14_22, L15_23, L16_24, L17_25)
    L12_20 = L13_21
    L14_22 = L12_20
    L13_21 = L12_20.try_init
    L13_21(L14_22)
    L14_22 = L12_20
    L13_21 = L12_20.waitForReady
    L13_21(L14_22)
    L14_22 = L12_20
    L13_21 = L12_20.try_start
    L13_21(L14_22)
  end
  L13_21 = print
  L14_22 = "init all"
  L13_21(L14_22)
  L13_21 = initializeAllGameObjects
  L13_21()
  L13_21 = print
  L14_22 = "wait ready all"
  L13_21(L14_22)
  L13_21 = waitForReadyAllGameObjects
  L13_21()
  L13_21 = print
  L14_22 = "start all"
  L13_21(L14_22)
  L13_21 = startAllGameObjects
  L13_21()
  L13_21 = Debug
  L14_22 = L13_21
  L13_21 = L13_21.setSwitch
  L15_23 = {L16_24, L17_25}
  L16_24 = "Display"
  L17_25 = "Debug Draw"
  L16_24 = true
  L13_21(L14_22, L15_23, L16_24)
  L13_21 = Debug
  L14_22 = L13_21
  L13_21 = L13_21.setSwitch
  L15_23 = {L16_24, L17_25}
  L16_24 = "Display"
  L17_25 = "File Asset Status"
  L16_24 = false
  L13_21(L14_22, L15_23, L16_24)
  L13_21 = Debug
  L14_22 = L13_21
  L13_21 = L13_21.setSwitch
  L15_23 = {L16_24, L17_25}
  L16_24 = "Display"
  L17_25 = "Warning Indicator"
  L16_24 = false
  L13_21(L14_22, L15_23, L16_24)
  L13_21 = Debug
  L14_22 = L13_21
  L13_21 = L13_21.setSwitch
  L15_23 = {
    L16_24,
    L17_25,
    L18_26
  }
  L16_24 = "Display"
  L17_25 = "DebugDrawGroup"
  L18_26 = "Enemy"
  L16_24 = true
  L13_21(L14_22, L15_23, L16_24)
  L13_21 = HUD
  L14_22 = L13_21
  L13_21 = L13_21.hpgDispReq_FadeIn
  L13_21(L14_22)
  L13_21 = HUD
  L14_22 = L13_21
  L13_21 = L13_21.grgDispReq_FadeIn
  L13_21(L14_22)
  L13_21 = wait
  L14_22 = 30
  L13_21(L14_22)
  L13_21 = findGameObject2
  L14_22 = "Area"
  L15_23 = "motion_test_stage1_01"
  L13_21 = L13_21(L14_22, L15_23)
  L15_23 = L13_21
  L14_22 = L13_21.appendChild
  L16_24 = L5_13
  L14_22(L15_23, L16_24)
  L15_23 = L13_21
  L14_22 = L13_21.appendChild
  L16_24 = L6_14
  L14_22(L15_23, L16_24)
  L15_23 = L13_21
  L14_22 = L13_21.appendChild
  L16_24 = L7_15
  L14_22(L15_23, L16_24)
  L15_23 = L13_21
  L14_22 = L13_21.appendChild
  L16_24 = L8_16
  L14_22(L15_23, L16_24)
  L14_22 = nil
  while not L14_22 do
    L15_23 = findGameObject2
    L16_24 = "EnemyGenerator"
    L17_25 = "enmgen2_01"
    L15_23 = L15_23(L16_24, L17_25)
    L14_22 = L15_23
    L15_23 = wait
    L15_23()
  end
  L16_24 = L14_22
  L15_23 = L14_22.requestSpawn
  L15_23(L16_24)
  while true do
    L16_24 = L14_22
    L15_23 = L14_22.isPrepared
    L15_23 = L15_23(L16_24)
    if not L15_23 then
      L15_23 = wait
      L15_23()
    end
  end
  L15_23 = findGameObject2
  L16_24 = "Puppet"
  L17_25 = "landingship01"
  L15_23 = L15_23(L16_24, L17_25)
  L17_25 = L15_23
  L16_24 = L15_23.setPos
  L18_26 = L6_14.getPos
  L18_26 = L18_26(L6_14)
  L16_24(L17_25, L18_26, L18_26(L6_14))
  L17_25 = L15_23
  L16_24 = L15_23.getBrain
  L16_24 = L16_24(L17_25)
  L17_25 = 0
  function L18_26(A0_27)
    local L1_28
    L1_28 = A0_27.state
    if L1_28 == "wait" then
      A0_27.changeState = "move"
      L1_28 = L17_25
      if L1_28 == 0 then
        L1_28 = {"posB", "posC"}
        A0_27.movePoint = L1_28
      else
        L1_28 = L17_25
        if L1_28 == 1 then
          L1_28 = {"posC", "posD"}
          A0_27.movePoint = L1_28
        else
          L1_28 = L17_25
          if L1_28 == 2 then
            L1_28 = {"posC"}
            A0_27.movePoint = L1_28
          end
        end
      end
    end
    L1_28 = A0_27.state
    if L1_28 == "moveEnd" then
      L1_28 = L17_25
      if L1_28 == 0 then
        A0_27.changeState = "drop"
        L1_28 = {
          "mechsmall0001",
          "mechsmall0002",
          "mechsmall0003",
          "mechsmall0004"
        }
        A0_27.dropEnemy = L1_28
      else
        L1_28 = L17_25
        if L1_28 == 1 then
          A0_27.changeState = "open"
        else
          L1_28 = L17_25
          if L1_28 == 2 then
            A0_27.changeState = "kill"
          end
        end
      end
    end
    L1_28 = A0_27.state
    if L1_28 == "dropEnd" then
      L1_28 = L17_25
      L1_28 = L1_28 + 1
      L17_25 = L1_28
    end
    L1_28 = A0_27.state
    if L1_28 == "openEnd" then
      L1_28 = L17_25
      L1_28 = L1_28 + 1
      L17_25 = L1_28
    end
    return A0_27
  end
  L16_24:setEventListener("enemy_landingship_event", L18_26)
  while true do
    wait()
  end
end
function enemy_base_bg_setup()
  createGameObject2("Area"):setName("test_z_root2")
  createGameObject2("Area"):setSceneParameters("cubemap_03")
  createGameObject2("Area"):setDriftEnable(false)
  createGameObject2("Area"):try_init()
  createGameObject2("Area"):waitForReady()
  createGameObject2("Area"):try_start()
  createGameObject2("Area"):setPos(Vector(0, -2, 0))
end
