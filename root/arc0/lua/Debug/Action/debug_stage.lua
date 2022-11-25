import("math")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Misc/felgar.lua")
DebugStage = {
  _testStageAreaName = "test_z_root2",
  _testStageSceneParamsName = "cubemap_03",
  _testStagePlayerPos = Vector(-16.6, 0.6501, 22),
  _testStagePlayerRot = XYZRotQuaternionEular(180, 41.902607, 180),
  createTestStage = function(A0_0)
    createGameObject2("Area"):setName(A0_0._testStageAreaName)
    createGameObject2("Area"):setSceneParameters(A0_0._testStageSceneParamsName)
    createGameObject2("Area"):setDriftEnable(false)
    createGameObject2("Area"):try_init()
    createGameObject2("Area"):waitForReady()
    createGameObject2("Area"):try_start()
    return (createGameObject2("Area"))
  end,
  createTestPlayer = function(A0_1, A1_2, A2_3)
    local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
    if A1_2 == nil then
      A1_2 = A0_1._testStagePlayerPos
    end
    if A2_3 == nil then
      A2_3 = A0_1._testStagePlayerRot
    end
    L3_4 = createGameObject2
    L4_5 = "Player"
    L3_4 = L3_4(L4_5)
    L5_6 = L3_4
    L4_5 = L3_4.setName
    L6_7 = "player"
    L4_5(L5_6, L6_7)
    L5_6 = L3_4
    L4_5 = L3_4.setWorldTransform
    L6_7 = A1_2
    L7_8 = A2_3
    L4_5(L5_6, L6_7, L7_8)
    L4_5 = Supporter
    L4_5 = L4_5.Spawner
    L4_5 = L4_5.create_supporter_cat
    L5_6 = LayoutPosRot
    L6_7 = A1_2
    L7_8 = A2_3
    L10_11 = L5_6(L6_7, L7_8)
    L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = Player
    L6_7 = L5_6
    L5_6 = L5_6.setBuddy
    L8_9 = L4_5
    L7_8 = L4_5.getBrain
    L10_11 = L7_8(L8_9)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = createGameObject2
    L6_7 = "PlayerCamera2"
    L7_8 = {}
    L7_8.name = "_cam:_main"
    L5_6 = L5_6(L6_7, L7_8)
    L7_8 = L5_6
    L6_7 = L5_6.setName
    L8_9 = "playerCamera2"
    L6_7(L7_8, L8_9)
    L6_7 = Felgar
    L7_8 = L6_7
    L6_7 = L6_7.create
    L8_9 = L3_4
    L7_8 = L6_7(L7_8, L8_9)
    L9_10 = L3_4
    L8_9 = L3_4.bindFelineHaunter
    L10_11 = L6_7
    L8_9(L9_10, L10_11)
    L9_10 = L3_4
    L8_9 = L3_4.bindFelineLeopard
    L10_11 = L7_8
    L8_9(L9_10, L10_11)
    L8_9 = L3_4
    L9_10 = L4_5
    L10_11 = L5_6
    return L8_9, L9_10, L10_11
  end,
  createTestPlayerCrow = function(A0_12, A1_13, A2_14)
    local L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22
    if A1_13 == nil then
      A1_13 = A0_12._testStagePlayerPos
    end
    if A2_14 == nil then
      A2_14 = A0_12._testStagePlayerRot
    end
    L3_15 = createGameObject2
    L4_16 = "Player"
    L3_15 = L3_15(L4_16)
    L4_16 = Player
    L5_17 = L4_16
    L4_16 = L4_16.setCostume
    L6_18 = "cro01"
    L4_16(L5_17, L6_18)
    L5_17 = L3_15
    L4_16 = L3_15.setName
    L6_18 = "player"
    L4_16(L5_17, L6_18)
    L5_17 = L3_15
    L4_16 = L3_15.setWorldTransform
    L6_18 = A1_13
    L7_19 = A2_14
    L4_16(L5_17, L6_18, L7_19)
    L4_16 = Supporter
    L4_16 = L4_16.Spawner
    L4_16 = L4_16.create_supporter_raven
    L5_17 = A1_13
    L6_18 = A2_14
    L7_19 = false
    L4_16 = L4_16(L5_17, L6_18, L7_19)
    L6_18 = L4_16
    L5_17 = L4_16.getBrain
    L5_17 = L5_17(L6_18)
    L6_18 = L5_17
    L5_17 = L5_17.setOwner
    L7_19 = L3_15
    L5_17(L6_18, L7_19)
    L5_17 = Player
    L6_18 = L5_17
    L5_17 = L5_17.setBuddy
    L8_20 = L4_16
    L7_19 = L4_16.getBrain
    L10_22 = L7_19(L8_20)
    L5_17(L6_18, L7_19, L8_20, L9_21, L10_22)
    L5_17 = createGameObject2
    L6_18 = "PlayerCamera2"
    L7_19 = {}
    L7_19.name = "_cam:_main"
    L5_17 = L5_17(L6_18, L7_19)
    L7_19 = L5_17
    L6_18 = L5_17.setName
    L8_20 = "playerCamera2"
    L6_18(L7_19, L8_20)
    L6_18 = Felgar
    L7_19 = L6_18
    L6_18 = L6_18.create
    L8_20 = L3_15
    L9_21 = Player
    L9_21 = L9_21.kFelPartsType_Garuda
    L7_19 = L6_18(L7_19, L8_20, L9_21)
    L9_21 = L3_15
    L8_20 = L3_15.bindFelineHaunter
    L10_22 = L6_18
    L8_20(L9_21, L10_22)
    L9_21 = L3_15
    L8_20 = L3_15.bindFelineLeopard
    L10_22 = L7_19
    L8_20(L9_21, L10_22)
    L8_20 = L3_15
    L9_21 = L4_16
    L10_22 = L5_17
    return L8_20, L9_21, L10_22
  end
}
