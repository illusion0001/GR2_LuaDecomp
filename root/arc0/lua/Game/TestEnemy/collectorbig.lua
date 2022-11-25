import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
import("GlobalGem")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
enmgen2_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.5,
  spawnSet = {
    {
      type = "collectorbig",
      locator = "locator_mclpd01",
      name = "ene_collectorbig",
      ai_spawn_option = "CollectorBig/dm06_b"
    }
  },
  addSpawnSetName = "spawnSetCollector",
  spawnSetCollector = {
    {
      type = "collector01",
      locator = Vector(0, 0, 0),
      name = "call_collector01",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(5, 0, 0),
      name = "call_collector02",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = Vector(-5, 0, 0),
      name = "call_collector03",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = Vector(0, 5, 0),
      name = "call_collector04",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(0, -5, 0),
      name = "call_collector05",
      ai_spawn_option = "Collector/dm06_a"
    }
  }
}
function exitSandbox()
  Sound:unloadResource("enemy_se_hex")
  Sound:unloadResource("enemy_se_jir")
end
setExitCallback(exitSandbox)
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
  L0_0 = Sound
  L1_1 = L0_0
  L0_0 = L0_0.loadResource
  L2_2 = "enemy_se_hex"
  L0_0(L1_1, L2_2)
  L0_0 = Sound
  L1_1 = L0_0
  L0_0 = L0_0.loadResource
  L2_2 = "enemy_se_jir"
  L0_0(L1_1, L2_2)
  L0_0 = DebugStage
  L1_1 = L0_0
  L0_0 = L0_0.createTestPlayer
  L2_2 = Vector
  L3_3 = 0
  L4_4 = 0
  L5_5 = 0
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = YRotQuaternion
  L4_4 = Deg2Rad
  L5_5 = 0
  L13_13 = L4_4(L5_5)
  L13_13 = L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L4_4(L5_5))
  L0_0 = L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L4_4(L5_5)))
  L1_1 = "test_kudo"
  L2_2 = "cubemap_03"
  L3_3 = createGameObject2
  L4_4 = "Area"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L6_6 = L1_1
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setSceneParameters
  L6_6 = L2_2
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setDriftEnable
  L6_6 = false
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.try_init
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.waitForReady
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.try_start
  L4_4(L5_5)
  L4_4 = _loadEventData
  L5_5 = "test_shigi"
  L4_4(L5_5)
  L4_4 = initializeAllGameObjects
  L4_4()
  L4_4 = waitForReadyAllGameObjects
  L4_4()
  L4_4 = startAllGameObjects
  L4_4()
  L4_4 = "g1_ark_pd_01"
  L5_5 = createGameObject2
  L6_6 = "GimmickBg"
  L5_5 = L5_5(L6_6)
  L7_7 = L5_5
  L6_6 = L5_5.setDrawModelName
  L8_8 = L4_4
  L6_6(L7_7, L8_8)
  L7_7 = L5_5
  L6_6 = L5_5.setCollisionName
  L8_8 = L4_4
  L6_6(L7_7, L8_8)
  L7_7 = L5_5
  L6_6 = L5_5.setAttributeName
  L8_8 = L4_4
  L6_6(L7_7, L8_8)
  L7_7 = L5_5
  L6_6 = L5_5.setPos
  L8_8 = Vector
  L9_9 = -30
  L10_10 = 21
  L11_11 = -26
  L13_13 = L8_8(L9_9, L10_10, L11_11)
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L8_8(L9_9, L10_10, L11_11))
  L7_7 = L5_5
  L6_6 = L5_5.setName
  L8_8 = "dlcObjectArk"
  L6_6(L7_7, L8_8)
  L4_4 = "g1_ark_pd_01_a"
  L6_6 = createGameObject2
  L7_7 = "GimmickBg"
  L6_6 = L6_6(L7_7)
  L8_8 = L6_6
  L7_7 = L6_6.setDrawModelName
  L9_9 = L4_4
  L7_7(L8_8, L9_9)
  L8_8 = L6_6
  L7_7 = L6_6.setCollisionName
  L9_9 = L4_4
  L7_7(L8_8, L9_9)
  L8_8 = L6_6
  L7_7 = L6_6.setAttributeName
  L9_9 = L4_4
  L7_7(L8_8, L9_9)
  L8_8 = L6_6
  L7_7 = L6_6.setPos
  L9_9 = Vector
  L10_10 = -30
  L11_11 = 21
  L12_12 = -26
  L13_13 = L9_9(L10_10, L11_11, L12_12)
  L7_7(L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L9_9(L10_10, L11_11, L12_12))
  L8_8 = L6_6
  L7_7 = L6_6.setName
  L9_9 = "dlcObjectArk"
  L7_7(L8_8, L9_9)
  L4_4 = "g1_ark_pd_01_b"
  L7_7 = createGameObject2
  L8_8 = "GimmickBg"
  L7_7 = L7_7(L8_8)
  L9_9 = L7_7
  L8_8 = L7_7.setDrawModelName
  L10_10 = L4_4
  L8_8(L9_9, L10_10)
  L9_9 = L7_7
  L8_8 = L7_7.setCollisionName
  L10_10 = L4_4
  L8_8(L9_9, L10_10)
  L9_9 = L7_7
  L8_8 = L7_7.setAttributeName
  L10_10 = L4_4
  L8_8(L9_9, L10_10)
  L9_9 = L7_7
  L8_8 = L7_7.setPos
  L10_10 = Vector
  L11_11 = -30
  L12_12 = 21
  L13_13 = -26
  L13_13 = L10_10(L11_11, L12_12, L13_13)
  L8_8(L9_9, L10_10, L11_11, L12_12, L13_13, L10_10(L11_11, L12_12, L13_13))
  L9_9 = L7_7
  L8_8 = L7_7.setName
  L10_10 = "dlcObjectArk"
  L8_8(L9_9, L10_10)
  L4_4 = "g1_ark_pd_01_c"
  L8_8 = createGameObject2
  L9_9 = "GimmickBg"
  L8_8 = L8_8(L9_9)
  L10_10 = L8_8
  L9_9 = L8_8.setDrawModelName
  L11_11 = L4_4
  L9_9(L10_10, L11_11)
  L10_10 = L8_8
  L9_9 = L8_8.setCollisionName
  L11_11 = L4_4
  L9_9(L10_10, L11_11)
  L10_10 = L8_8
  L9_9 = L8_8.setAttributeName
  L11_11 = L4_4
  L9_9(L10_10, L11_11)
  L10_10 = L8_8
  L9_9 = L8_8.setPos
  L11_11 = Vector
  L12_12 = -30
  L13_13 = 21
  L13_13 = L11_11(L12_12, L13_13, -26)
  L9_9(L10_10, L11_11, L12_12, L13_13, L11_11(L12_12, L13_13, -26))
  L10_10 = L8_8
  L9_9 = L8_8.setName
  L11_11 = "dlcObjectArk"
  L9_9(L10_10, L11_11)
  L9_9 = initializeAllGameObjects
  L9_9()
  L9_9 = waitForReadyAllGameObjects
  L9_9()
  L9_9 = startAllGameObjects
  L9_9()
  L10_10 = L5_5
  L9_9 = L5_5.setVisible
  L11_11 = true
  L9_9(L10_10, L11_11)
  L10_10 = L6_6
  L9_9 = L6_6.setVisible
  L11_11 = false
  L9_9(L10_10, L11_11)
  L10_10 = L7_7
  L9_9 = L7_7.setVisible
  L11_11 = false
  L9_9(L10_10, L11_11)
  L10_10 = L8_8
  L9_9 = L8_8.setVisible
  L11_11 = false
  L9_9(L10_10, L11_11)
  L9_9 = {
    L10_10,
    L11_11,
    L12_12,
    L13_13
  }
  L10_10 = L5_5
  L11_11 = L6_6
  L12_12 = L7_7
  L13_13 = L8_8
  L10_10 = Player
  L11_11 = L10_10
  L10_10 = L10_10.reset
  L12_12 = Player
  L12_12 = L12_12.kReset_Standing
  L13_13 = findGameObject2
  L13_13 = L13_13("Node", "locator2_pc_start_pos")
  L13_13 = L13_13.getWorldTransform
  L13_13 = L13_13(L13_13)
  L10_10(L11_11, L12_12, L13_13, L13_13(L13_13))
  L10_10 = wait
  L10_10()
  L10_10 = GameDatabase
  L11_11 = L10_10
  L10_10 = L10_10.reset
  L12_12 = ggd
  L12_12 = L12_12.GlobalSystemFlags
  L10_10(L11_11, L12_12)
  L10_10 = Debug
  L11_11 = L10_10
  L10_10 = L10_10.setSwitch
  L12_12 = {L13_13, "Debug Draw"}
  L13_13 = "Display"
  L13_13 = true
  L10_10(L11_11, L12_12, L13_13)
  L10_10 = nil
  repeat
    L11_11 = wait
    L11_11()
    L11_11 = findGameObject2
    L12_12 = "EnemyBrain"
    L13_13 = "ene_collectorbig"
    L11_11 = L11_11(L12_12, L13_13)
    L10_10 = L11_11
  until L10_10
  repeat
    L11_11 = wait
    L11_11()
    L12_12 = L10_10
    L11_11 = L10_10.isReadyEnemy
    L11_11 = L11_11(L12_12)
  until L11_11
  L12_12 = L10_10
  L11_11 = L10_10.cmd
  L13_13 = "setArkInfo"
  L11_11(L12_12, L13_13, {
    parts = {
      L5_5,
      L6_6,
      L7_7,
      L8_8
    }
  })
  L11_11 = 10
  L12_12 = 1
  function L13_13(A0_14)
    if A0_14.isHit then
      print("attack: " .. A0_14.attack)
      if A0_14.attack == "attack_r" then
        L11_11 = L11_11 - 2
      elseif A0_14.attack == "attack_l" then
        L11_11 = L11_11 - 1
      elseif A0_14.attack == "shoot" then
        L11_11 = L11_11 - 1
      elseif A0_14.attack == "dash" then
        L11_11 = L11_11 - 3
      end
      if L11_11 <= 0 then
        L9_9[L12_12]:setVisible(false)
        L11_11 = 10
        L12_12 = L12_12 + 1
        if L12_12 >= 5 then
          L12_12 = 1
        end
        L9_9[L12_12]:setVisible(true)
      end
    end
    if A0_14.isChangeTarget then
      if A0_14.target == "player" then
        print("target: \227\131\151\227\131\172\227\130\164\227\131\164\227\131\188")
      elseif A0_14.target == "ark" then
        print("target: \230\150\185\232\136\159")
      end
    end
    if A0_14.isBreakCoreAll then
      print("\229\133\168\227\130\179\227\130\162\227\129\140\231\160\180\229\163\138\227\129\149\227\130\140\227\129\159")
    end
    return A0_14
  end
  L10_10:setEventListener("enemy_collectorbig_event", L13_13)
  while true do
    wait()
  end
end
function _loadEventData(A0_15)
  local L1_16, L2_17, L3_18
  L1_16 = loadFileAsset
  L2_17 = "evb"
  L3_18 = "evx/"
  L3_18 = L3_18 .. A0_15
  L1_16 = L1_16(L2_17, L3_18)
  L2_17, L3_18 = nil, nil
  if L1_16 ~= nil then
    L1_16:wait()
    L2_17 = L1_16:getRoot()
    L3_18 = EventData:create(A0_15, nil, L2_17)
    L3_18:try_init()
    L3_18:waitForReady()
    L3_18:try_start()
  end
end
