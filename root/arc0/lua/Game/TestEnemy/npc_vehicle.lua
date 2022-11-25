import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L0_0 = Vector
  L1_1 = -22.3
  L2_2 = -1.999998
  L3_3 = 85.7
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L1_1 = Vector
  L2_2 = -18.7
  L3_3 = -1.8
  L4_4 = 86.5
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  L2_2 = Vector
  L3_3 = -18.7
  L4_4 = -1.8
  L5_5 = 87.5
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = Vector
  L4_4 = -15.7
  L5_5 = 5
  L6_6 = 4.400000000000006
  L3_3 = L3_3(L4_4, L5_5, L6_6)
  L4_4 = Vector
  L5_5 = -0.5
  L6_6 = 18
  L7_7 = -4.099999999999994
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  L5_5 = Vector
  L6_6 = 9.1
  L7_7 = 13
  L8_8 = 0.9000000000000057
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6 = Vector
  L7_7 = 19.9
  L8_8 = 10
  L9_9 = 3.5
  L6_6 = L6_6(L7_7, L8_8, L9_9)
  L7_7 = enemy_base_bg_setup
  L7_7()
  L7_7 = createGameObject2
  L8_8 = "Node"
  L7_7 = L7_7(L8_8)
  L9_9 = L7_7
  L8_8 = L7_7.setName
  L10_10 = "posA"
  L8_8(L9_9, L10_10)
  L9_9 = L7_7
  L8_8 = L7_7.setPos
  L10_10 = L3_3
  L8_8(L9_9, L10_10)
  L8_8 = createGameObject2
  L9_9 = "Node"
  L8_8 = L8_8(L9_9)
  L10_10 = L8_8
  L9_9 = L8_8.setName
  L11_11 = "posB"
  L9_9(L10_10, L11_11)
  L10_10 = L8_8
  L9_9 = L8_8.setPos
  L11_11 = L4_4
  L9_9(L10_10, L11_11)
  L9_9 = createGameObject2
  L10_10 = "Node"
  L9_9 = L9_9(L10_10)
  L11_11 = L9_9
  L10_10 = L9_9.setName
  L12_12 = "posC"
  L10_10(L11_11, L12_12)
  L11_11 = L9_9
  L10_10 = L9_9.setPos
  L12_12 = L5_5
  L10_10(L11_11, L12_12)
  L10_10 = createGameObject2
  L11_11 = "Node"
  L10_10 = L10_10(L11_11)
  L12_12 = L10_10
  L11_11 = L10_10.setName
  L11_11(L12_12, "posD")
  L12_12 = L10_10
  L11_11 = L10_10.setPos
  L11_11(L12_12, L6_6)
  L11_11 = DebugStage
  L12_12 = L11_11
  L11_11 = L11_11.createTestPlayer
  L11_11 = L11_11(L12_12, L0_0, YRotQuaternion(Deg2Rad(90)))
  L12_12 = Player
  L12_12 = L12_12.setEnergy
  L12_12(L12_12, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  L12_12 = Player
  L12_12 = L12_12.setEnergy
  L12_12(L12_12, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  L12_12 = Player
  L12_12 = L12_12.setEnergy
  L12_12(L12_12, Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  L12_12 = print
  L12_12("init all")
  L12_12 = initializeAllGameObjects
  L12_12()
  L12_12 = print
  L12_12("wait ready all")
  L12_12 = waitForReadyAllGameObjects
  L12_12()
  L12_12 = print
  L12_12("start all")
  L12_12 = startAllGameObjects
  L12_12()
  L12_12 = HUD
  L12_12 = L12_12.hpgDispReq_FadeIn
  L12_12(L12_12)
  L12_12 = HUD
  L12_12 = L12_12.grgDispReq_FadeIn
  L12_12(L12_12)
  L12_12 = Debug
  L12_12 = L12_12.setSwitch
  L12_12(L12_12, {"Display", "Debug Draw"}, true)
  L12_12 = Debug
  L12_12 = L12_12.setSwitch
  L12_12(L12_12, {
    "Display",
    "File Asset Status"
  }, false)
  L12_12 = Debug
  L12_12 = L12_12.setSwitch
  L12_12(L12_12, {
    "Display",
    "Warning Indicator"
  }, false)
  L12_12 = Debug
  L12_12 = L12_12.setSwitch
  L12_12(L12_12, {
    "Display",
    "DebugDrawGroup",
    "Enemy"
  }, true)
  L12_12 = Debug
  L12_12 = L12_12.setSwitch
  L12_12(L12_12, {
    "Display",
    "DebugDrawGroup",
    "Npc"
  }, true)
  L12_12 = wait
  L12_12(30)
  L12_12 = findGameObject2
  L12_12 = L12_12("Area", "motion_test_stage1_01")
  for _FORV_18_ = 1, #{
    {
      label = "man01",
      npcName = "NPC_man01",
      pos = L2_2,
      rot = Quat(0, 0.99, 0, -0.15)
    },
    {
      label = "ve02",
      npcName = "NPC_ve02",
      pos = L1_1,
      rot = Quat(0, -0.71, 0, 0.71)
    }
  } do
    Npc.Load(({
      {
        label = "man01",
        npcName = "NPC_man01",
        pos = L2_2,
        rot = Quat(0, 0.99, 0, -0.15)
      },
      {
        label = "ve02",
        npcName = "NPC_ve02",
        pos = L1_1,
        rot = Quat(0, -0.71, 0, 0.71)
      }
    })[_FORV_18_].npcName, L12_12, ({
      {
        label = "man01",
        npcName = "NPC_man01",
        pos = L2_2,
        rot = Quat(0, 0.99, 0, -0.15)
      },
      {
        label = "ve02",
        npcName = "NPC_ve02",
        pos = L1_1,
        rot = Quat(0, -0.71, 0, 0.71)
      }
    })[_FORV_18_].pos, ({
      {
        label = "man01",
        npcName = "NPC_man01",
        pos = L2_2,
        rot = Quat(0, 0.99, 0, -0.15)
      },
      {
        label = "ve02",
        npcName = "NPC_ve02",
        pos = L1_1,
        rot = Quat(0, -0.71, 0, 0.71)
      }
    })[_FORV_18_].rot, ({
      {
        label = "man01",
        npcName = "NPC_man01",
        pos = L2_2,
        rot = Quat(0, 0.99, 0, -0.15)
      },
      {
        label = "ve02",
        npcName = "NPC_ve02",
        pos = L1_1,
        rot = Quat(0, -0.71, 0, 0.71)
      }
    })[_FORV_18_].label, ({
      {use_gravity = true},
      {use_gravity = true},
      {use_gravity = false}
    })[_FORV_18_])
  end
  _FOR_()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  L12_12:appendChild(L7_7)
  L12_12:appendChild(L8_8)
  L12_12:appendChild(L9_9)
  L12_12:appendChild(L10_10)
  wait(30)
  while true do
    while true do
      Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[2].npcName):getGenerator():setPilots({
        {
          pilot = Npc.FindNpc(({
            {
              label = "man01",
              npcName = "NPC_man01",
              pos = L2_2,
              rot = Quat(0, 0.99, 0, -0.15)
            },
            {
              label = "ve02",
              npcName = "NPC_ve02",
              pos = L1_1,
              rot = Quat(0, -0.71, 0, 0.71)
            }
          })[1].npcName):getGenerator():getPuppet(),
          attach = "loc_driver1",
          anim = "fly_l_in"
        }
      })
      repeat
        wait()
      until Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[2].npcName):getGenerator():isRideOnPilot()
      wait(30)
      Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[2].npcName):getGenerator():releasePilots({
        {
          pilot = Npc.FindNpc(({
            {
              label = "man01",
              npcName = "NPC_man01",
              pos = L2_2,
              rot = Quat(0, 0.99, 0, -0.15)
            },
            {
              label = "ve02",
              npcName = "NPC_ve02",
              pos = L1_1,
              rot = Quat(0, -0.71, 0, 0.71)
            }
          })[1].npcName):getGenerator():getPuppet(),
          anim = "fly_l_out"
        }
      })
      repeat
        wait()
      until Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[2].npcName):getGenerator():isRideOffPilot()
      wait()
      Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[1].npcName):getGenerator():turn(180)
      repeat
        wait()
      until Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[1].npcName):getGenerator():isTurnEnd()
      wait()
    end
  end
  while true do
    wait()
  end
  wait()
  gen3:fly({
    {pos = "posA", attr = "fly"},
    {pos = "posB", attr = "fly"},
    {pos = "posC", attr = "fly"}
  }, {moveSpeed = 1, escape = false})
  repeat
    wait()
  until gen3:isFlyEnd()
  gen3:releasePilots({
    {
      pilot = Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[2].npcName):getGenerator():getPuppet(),
      anim = "walk"
    }
  })
  wait(60)
  gen3:releasePilots({
    {
      pilot = Npc.FindNpc(({
        {
          label = "man01",
          npcName = "NPC_man01",
          pos = L2_2,
          rot = Quat(0, 0.99, 0, -0.15)
        },
        {
          label = "ve02",
          npcName = "NPC_ve02",
          pos = L1_1,
          rot = Quat(0, -0.71, 0, 0.71)
        }
      })[1].npcName):getGenerator():getPuppet(),
      anim = "walk"
    }
  })
  repeat
    wait()
  until gen3:isRideOffPilot()
  wait(30)
  Npc.FindNpc(({
    {
      label = "man01",
      npcName = "NPC_man01",
      pos = L2_2,
      rot = Quat(0, 0.99, 0, -0.15)
    },
    {
      label = "ve02",
      npcName = "NPC_ve02",
      pos = L1_1,
      rot = Quat(0, -0.71, 0, 0.71)
    }
  })[1].npcName):getGenerator():playMotion("stay")
  Npc.FindNpc(({
    {
      label = "man01",
      npcName = "NPC_man01",
      pos = L2_2,
      rot = Quat(0, 0.99, 0, -0.15)
    },
    {
      label = "ve02",
      npcName = "NPC_ve02",
      pos = L1_1,
      rot = Quat(0, -0.71, 0, 0.71)
    }
  })[2].npcName):getGenerator():playMotion("stay")
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
