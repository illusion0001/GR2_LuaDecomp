import("Camera")
import("Mob")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
dofile("/Game/Misc/pdemo.lua")
_navi_market = false
_navi_street = false
_navi_goal = false
_navi_vogo = false
_navi_bridge = false
_vogo_task = nil
_barker_task = nil
_barker_once = {}
_city_task = nil
_guide_task = nil
_girl_task = nil
_duck01_task = nil
_mot_task = {}
enmgen2_wagon_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_01",
      name = "enm_a_01",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    },
    {
      type = "stalker",
      locator = "locator_a_02",
      name = "enm_a_02",
      ai_spawn_option = "Stalker/Stalker_WildStay"
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
enmgen2_wagon_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_b_01",
      name = "enm_b_01",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    },
    {
      type = "stalker",
      locator = "locator_b_01",
      name = "enm_b_02",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
function Initialize()
  local L0_16, L1_17, L2_18
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setPowerUpLevel
  L2_18 = Player
  L2_18 = L2_18.kPowUpCateg_Base
  L0_16(L1_17, L2_18, 5)
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setPowerUpLevel
  L2_18 = Player
  L2_18 = L2_18.kPowUpCateg_Combat
  L0_16(L1_17, L2_18, 5)
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setEnergy
  L2_18 = Player
  L2_18 = L2_18.kEnergy_Life
  L0_16(L1_17, L2_18, Player:getEnergyMax(Player.kEnergy_Life), true)
  L0_16 = Fn_loadEventData
  L1_17 = "evx/ep90"
  L2_18 = {
    "evarea2_po_a_01"
  }
  L0_16(L1_17, L2_18, true)
  L0_16 = {
    L1_17,
    L2_18,
    {
      name = "duck01",
      type = "duck01",
      node = "locator2_duck01"
    },
    {
      name = "gull01",
      type = "gull01",
      node = "locator2_gull01",
      use_gravity = false
    },
    {
      name = "npc_wagon",
      type = "man40",
      node = "locator2_wagon",
      use_gravity = false
    },
    {
      name = "ve01",
      type = "ve01",
      node = "locator2_ve01",
      use_gravity = false,
      anim_name = "fly"
    }
  }
  L1_17 = {}
  L1_17.name = "boy"
  L1_17.type = "chi11"
  L1_17.node = "locator2_chi01"
  L2_18 = {}
  L2_18.name = "girl"
  L2_18.type = "chi14"
  L2_18.node = "locator2_chi02"
  L1_17 = Fn_setupNpc
  L2_18 = L0_16
  L1_17(L2_18)
  L1_17 = {
    L2_18,
    "evarea2_po_a_04_crate_before",
    "evarea2_po_a_04_crate_dummy"
  }
  L2_18 = "evarea2_po_a_04_common"
  L2_18 = Fn_loadEventData
  L2_18("evx/ep90_common", L1_17, true)
  L2_18 = Fn_pcSensorOff
  L2_18("pccubesensor2_eps90_goal")
  L2_18 = Fn_pcSensorOff
  L2_18("pccubesensor2_vogo")
  L2_18 = Fn_pcSensorOff
  L2_18("pccubesensor2_bridge")
  L2_18 = Fn_pcSensorOff
  L2_18("pccubesensor2_tutorial_attack")
  L2_18 = Fn_pcSensorOff
  L2_18("pccubesensor2_tutorial_gravity")
  L2_18 = Fn_findAreaHandle
  L2_18 = L2_18("po_a_01")
  _polydemo = PDemo.create("ep90_sd_yakitori", L2_18, {camera = true, scene_param = false})
  _sdemo_02 = SDemo.create("ep90_header_02")
end
function Ingame()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35
  L0_19 = vogo_crate_broken_demo
  L0_19 = L0_19()
  _vogo_task = L0_19
  L0_19 = Player
  L1_20 = L0_19
  L0_19 = L0_19.getPuppet
  L0_19 = L0_19(L1_20)
  L2_21 = L0_19
  L1_20 = L0_19.loadPoseAnimation
  L3_22 = "kit01_c01"
  L4_23 = "ep90_sd_yakitori_kit01_c01"
  L5_24 = 0
  L1_20(L2_21, L3_22, L4_23, L5_24)
  L2_21 = L0_19
  L1_20 = L0_19.loadPoseAnimation
  L3_22 = "kit01_c02"
  L4_23 = "ep90_sd_yakitori_kit01_c02"
  L5_24 = 0
  L1_20(L2_21, L3_22, L4_23, L5_24)
  L1_20 = Fn_playMotionNpc
  L2_21 = "npc_wagon"
  L3_22 = "cook_yakitori_00"
  L4_23 = false
  L1_20(L2_21, L3_22, L4_23)
  L1_20 = Fn_findNpc
  L2_21 = "npc_wagon"
  L1_20 = L1_20(L2_21)
  L3_22 = L1_20
  L2_21 = L1_20.getPuppet
  L2_21 = L2_21(L3_22)
  L3_22 = Fn_findNpc
  L4_23 = "gull01"
  L3_22 = L3_22(L4_23)
  L5_24 = L3_22
  L4_23 = L3_22.getPuppet
  L4_23 = L4_23(L5_24)
  L5_24 = createGameObject2
  L6_25 = "GimmickBg"
  L5_24 = L5_24(L6_25)
  L7_26 = L5_24
  L6_25 = L5_24.setDrawModelName
  L8_27 = "ciskewered01_base"
  L6_25(L7_26, L8_27)
  L7_26 = L5_24
  L6_25 = L5_24.setName
  L8_27 = "skewered01"
  L6_25(L7_26, L8_27)
  L7_26 = L5_24
  L6_25 = L5_24.setActive
  L8_27 = false
  L6_25(L7_26, L8_27)
  L7_26 = L5_24
  L6_25 = L5_24.try_init
  L6_25(L7_26)
  L7_26 = L5_24
  L6_25 = L5_24.waitForReady
  L6_25(L7_26)
  L7_26 = L5_24
  L6_25 = L5_24.try_start
  L6_25(L7_26)
  L6_25 = createGameObject2
  L7_26 = "SimpleModel"
  L6_25 = L6_25(L7_26)
  L8_27 = L6_25
  L7_26 = L6_25.setModelName
  L9_28 = "ciskewered02_base"
  L7_26(L8_27, L9_28)
  L8_27 = L6_25
  L7_26 = L6_25.setName
  L9_28 = "skewered02"
  L7_26(L8_27, L9_28)
  L8_27 = L6_25
  L7_26 = L6_25.setActive
  L9_28 = false
  L7_26(L8_27, L9_28)
  L7_26 = findGameObject2
  L8_27 = "Node"
  L9_28 = "locator2_ciskewered02"
  L7_26 = L7_26(L8_27, L9_28)
  L9_28 = L7_26
  L8_27 = L7_26.appendChild
  L10_29 = L6_25
  L8_27(L9_28, L10_29)
  L9_28 = L6_25
  L8_27 = L6_25.try_init
  L8_27(L9_28)
  L9_28 = L6_25
  L8_27 = L6_25.waitForReady
  L8_27(L9_28)
  L9_28 = L6_25
  L8_27 = L6_25.try_start
  L8_27(L9_28)
  L8_27 = 0
  while true do
    if L8_27 == 0 then
      L9_28 = opening_child_guide
      L9_28()
      L9_28 = invokeTask
      function L10_29()
        while _navi_street ~= true or Fn_isCaptionView() ~= false do
          wait()
        end
        waitSeconds(0.5)
        Fn_cityBlock({
          unique = "ui_gaiku_01_16",
          section = "ui_gaiku_02_16",
          town = "ui_gaiku_03_02"
        })
      end
      L9_28 = L9_28(L10_29)
      _city_task = L9_28
      L9_28 = invokeTask
      function L10_29()
        waitSeconds(120)
        Fn_pcSensorOn("pccubesensor2_bridge")
      end
      L9_28 = L9_28(L10_29)
      _bridge_task = L9_28
      while true do
        L9_28 = GameDatabase
        L10_29 = L9_28
        L9_28 = L9_28.get
        L11_30 = ggd
        L11_30 = L11_30.GlobalSystemFlags__ExclusionFlag
        L9_28 = L9_28(L10_29, L11_30)
        if L9_28 == true then
          L9_28 = wait
          L9_28()
        end
      end
      L9_28 = GameDatabase
      L10_29 = L9_28
      L9_28 = L9_28.set
      L11_30 = ggd
      L11_30 = L11_30.GlobalSystemFlags__ExclusionFlag
      L9_28(L10_29, L11_30, L12_31)
      ExclusionFlag = true
      L8_27 = 1
    elseif L8_27 == 1 then
      L9_28 = _navi_market
      if L9_28 == true then
        L9_28 = _city_task
        if L9_28 ~= nil then
          L9_28 = _city_task
          L10_29 = L9_28
          L9_28 = L9_28.isRunning
          L9_28 = L9_28(L10_29)
          if L9_28 == true then
            L9_28 = _city_task
            L10_29 = L9_28
            L9_28 = L9_28.abort
            L9_28(L10_29)
          end
        end
        _city_task = nil
        L9_28 = _bridge_task
        if L9_28 ~= nil then
          L9_28 = _bridge_task
          L10_29 = L9_28
          L9_28 = L9_28.isRunning
          L9_28 = L9_28(L10_29)
          if L9_28 == true then
            L9_28 = _bridge_task
            L10_29 = L9_28
            L9_28 = L9_28.abort
            L9_28(L10_29)
          end
        end
        _bridge_task = nil
        L9_28 = Fn_pcSensorOff
        L10_29 = "pccubesensor2_bridge"
        L9_28(L10_29)
        L9_28 = Fn_naviKill
        L9_28()
        L9_28 = Fn_captionViewEnd
        L9_28()
        L9_28 = invokeTask
        function L10_29()
          local L0_36, L1_37
          L0_36 = {
            L1_37,
            {
              "mmb017a",
              "mmb017b",
              "mmb017c"
            },
            {
              "mmc017a",
              "mmc017b",
              "mmc017c"
            },
            {
              "mwa017a",
              "mwa017b",
              "mwa017c"
            },
            {
              "mwb017a",
              "mwb017b",
              "mwb017c"
            },
            {
              "mwc017a",
              "mwc017b",
              "mwc017c"
            }
          }
          L1_37 = {
            "mma017a",
            "mma017b",
            "mma017c"
          }
          L1_37 = RandI
          L1_37 = L1_37(2, 4)
          for _FORV_5_ = 1, L1_37 do
            Sound:playSE(L0_36[RandI(1, #L0_36)][RandI(1, 3)], RandF(0.3, 0.8), "", nil)
            waitSeconds(RandF(0.5, 1.5))
          end
        end
        L9_28(L10_29)
        L9_28 = Fn_captionView
        L10_29 = "ep90_00510"
        L9_28(L10_29)
        L9_28 = waitSeconds
        L10_29 = 2
        L9_28(L10_29)
        L9_28 = findGameObject2
        L10_29 = "EnemyGenerator"
        L11_30 = "enmgen2_wagon_01"
        L9_28 = L9_28(L10_29, L11_30)
        L11_30 = L9_28
        L10_29 = L9_28.requestSpawn
        L10_29(L11_30)
        L10_29 = wait
        L10_29()
        L10_29 = Mob
        L11_30 = L10_29
        L10_29 = L10_29.makeSituationPanic
        L10_29(L11_30, L12_31)
        L11_30 = L1_20
        L10_29 = L1_20.playMotion
        L10_29(L11_30, L12_31)
        L10_29 = waitSeconds
        L11_30 = 1
        L10_29(L11_30)
        L10_29 = Fn_captionView
        L11_30 = "ep90_00511"
        L10_29(L11_30)
        L10_29 = Fn_vctrlOff
        L11_30 = "vctrl2_wagon"
        L10_29(L11_30)
        L10_29 = {
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        }
        L11_30 = findGameObject2
        L11_30 = L11_30(L12_31, L13_32)
        L16_35 = L12_31(L13_32, L14_33)
        ;({
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        })[2] = L12_31
        ;({
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        })[3] = L13_32
        ;({
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        })[4] = L14_33
        ;({
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        })[5] = L15_34
        ;({
          L11_30,
          [7] = L12_31(L13_32, L14_33)
        })[6] = L16_35
        L11_30 = invokeTask
        L11_30(L12_31)
        L11_30 = waitSeconds
        L11_30(L12_31)
        L11_30 = Fn_missionViewWait
        L11_30(L12_31)
        L11_30 = Fn_pcSensorOn
        L11_30(L12_31)
        L11_30 = Fn_tutorialCaption
        L11_30(L12_31)
        L11_30 = {}
        L15_34 = "enm_a_01"
        L12_31.pupp = L13_32
        L15_34 = "enm_a_01"
        L12_31.brain = L13_32
        L12_31.gem = false
        L11_30.enm_a_01 = L12_31
        L15_34 = "enm_a_02"
        L12_31.pupp = L13_32
        L15_34 = "enm_a_02"
        L12_31.brain = L13_32
        L12_31.gem = false
        L11_30.enm_a_02 = L12_31
        while true do
          if L12_31 > 0 then
            for L15_34, L16_35 in L12_31(L13_32) do
              if L16_35.gem == false and 0 >= L16_35.brain:getHealth() then
                invokeTask(function()
                  createGameObject2("Gem"):setGemModelNo(5)
                  createGameObject2("Gem"):setWorldTransform(L16_35.pupp:getWorldTransform())
                  createGameObject2("Gem"):setDynamic(true)
                  createGameObject2("Gem"):try_init()
                  createGameObject2("Gem"):waitForReady()
                  createGameObject2("Gem"):try_start()
                  createGameObject2("Gem"):setImpulse(Vector(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5)))
                end)
                L11_30[L15_34].gem = true
              else
              end
            end
            L12_31()
          end
        end
        L12_31()
        L12_31(L13_32)
        L15_34 = false
        L12_31(L13_32, L14_33, L15_34)
        L12_31(L13_32)
        L12_31(L13_32)
        L12_31(L13_32)
        L13_32(L14_33)
        L13_32()
        L13_32(L14_33)
        L13_32(L14_33)
        L13_32(L14_33)
        while true do
          while true do
            if L13_32 > 0 then
              L13_32()
            end
          end
        end
        while true do
          if L13_32 > 0 then
            L13_32()
          end
        end
        L13_32(L14_33)
        L13_32()
        L15_34 = "1stbattle_end"
        L13_32(L14_33, L15_34)
        L15_34 = "scared_out_00"
        L13_32(L14_33, L15_34)
        L15_34 = false
        L13_32(L14_33, L15_34)
        L13_32()
        L8_27 = 2
      else
      end
    elseif L8_27 == 2 then
      L9_28 = Fn_pcSensorOff
      L10_29 = "pccubesensor2_street"
      L9_28(L10_29)
      L9_28 = Fn_userCtrlOff
      L9_28()
      L9_28 = Fn_naviKill
      L9_28()
      L9_28 = HUD
      L10_29 = L9_28
      L9_28 = L9_28.captionEnd
      L9_28(L10_29)
      L9_28 = Fn_resetPcPos
      L10_29 = "warppoint2_01"
      L9_28(L10_29)
      L9_28 = Area
      L10_29 = L9_28
      L9_28 = L9_28.requestRestore
      L9_28(L10_29)
      L9_28 = wait
      L9_28()
      while true do
        L9_28 = _polydemo
        L10_29 = L9_28
        L9_28 = L9_28.isLoading
        L9_28 = L9_28(L10_29)
        if L9_28 == false then
          L9_28 = wait
          L9_28()
        end
      end
      L9_28 = waitSeconds
      L10_29 = 3
      L9_28(L10_29)
      L9_28 = Fn_fadein
      L9_28()
      function L9_28()
        waitSeconds(10)
      end
      L10_29 = Fn_kaiwaDemoView2
      L11_30 = "ft90_00500k"
      L10_29(L11_30, L12_31)
      L10_29 = Fn_getPlayer
      L10_29 = L10_29()
      L11_30 = L10_29.setCollidable
      L11_30(L12_31, L13_32)
      L11_30 = Player
      L11_30 = L11_30.getPuppet
      L11_30 = L11_30(L12_31)
      L12_31(L13_32, L14_33)
      L12_31(L13_32)
      L12_31(L13_32, L14_33)
      L12_31(L13_32, L14_33)
      L12_31(L13_32)
      L15_34 = "gull01"
      while true do
        L15_34 = L14_33
        if L14_33 == false then
          if L12_31 == 90 then
            L15_34 = L14_33
            L16_35 = "bird_flyaway"
            L14_33(L15_34, L16_35, 0.5, "", L13_32)
          end
          if L12_31 == 100 then
            L15_34 = L14_33
            L16_35 = "kit064c"
            L14_33(L15_34, L16_35)
          end
          L14_33()
        end
      end
      L15_34 = L10_29
      L16_35 = true
      L14_33(L15_34, L16_35)
      L15_34 = L11_30
      L16_35 = true
      L14_33(L15_34, L16_35)
      L10_29 = nil
      L15_34 = true
      L14_33(L15_34)
      L15_34 = L2_21
      L16_35 = true
      L14_33(L15_34, L16_35)
      L15_34 = L1_20
      L16_35 = "stay"
      L14_33(L15_34, L16_35)
      L15_34 = L4_23
      L16_35 = true
      L14_33(L15_34, L16_35)
      L15_34 = L14_33
      L16_35 = 2
      L14_33(L15_34, L16_35)
      L15_34 = L14_33
      L14_33(L15_34)
      L15_34 = "warppoint2_02"
      L14_33(L15_34)
      L15_34 = L14_33
      L16_35 = false
      L14_33(L15_34, L16_35)
      L14_33()
      L8_27 = 3
    elseif L8_27 == 3 then
      L9_28 = invokeTask
      function L10_29()
        L5_24:setActive(true)
        Fn_attachJoint(L5_24, L4_23, "loc_ci00")
        waitSeconds(1)
        Fn_warpNpc("gull01", "locator2_gull01_start")
        HUD:naviSetPochiDistanceDensity0(25)
        HUD:naviSetPochiDistanceDensity100(30)
        Fn_naviSet(L4_23)
        Fn_captionViewWait("ep90_00300")
        Fn_missionViewWait("ep90_00310")
        Fn_pcSensorOn("pccubesensor2_tutorial_gravity")
        Fn_tutorialCaption("gravity")
      end
      L9_28(L10_29)
      while true do
        L9_28 = Fn_get_distance
        L11_30 = L4_23
        L10_29 = L4_23.getWorldPos
        L10_29 = L10_29(L11_30)
        L11_30 = Fn_getPcPosRot
        L16_35 = L11_30()
        L9_28 = L9_28(L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L11_30())
        if L9_28 > 15 then
          L9_28 = wait
          L9_28()
        end
      end
      L9_28 = {
        L10_29,
        L11_30,
        L12_31,
        L13_32,
        L14_33,
        L15_34,
        L16_35
      }
      L10_29 = {}
      L10_29.pos = "locator2_gull01_escape_a_01"
      L10_29.attr = "takeoff"
      L11_30 = {}
      L11_30.pos = "locator2_gull01_escape_a_02"
      L11_30.attr = "fly"
      L12_31.pos = "locator2_gull01_escape_a_03"
      L12_31.attr = "fly"
      L13_32.pos = "locator2_gull01_escape_a_04"
      L13_32.attr = "fly"
      L14_33.pos = "locator2_gull01_escape_a_05"
      L14_33.attr = "fly"
      L15_34 = {}
      L15_34.pos = "locator2_gull01_escape_a_06"
      L15_34.attr = "fly"
      L16_35 = {}
      L16_35.pos = "locator2_gull01_escape_b_01"
      L16_35.attr = "land"
      L10_29 = Fn_fly
      L11_30 = L3_22
      L13_32.moveSpeed = 15
      L10_29(L11_30, L12_31, L13_32)
      L10_29 = Fn_pcSensorOff
      L11_30 = "pccubesensor2_tutorial_gravity"
      L10_29(L11_30)
      L10_29 = Fn_tutorialCaptionKill
      L10_29()
      while true do
        L10_29 = Fn_get_distance
        L11_30 = L4_23.getWorldPos
        L11_30 = L11_30(L12_31)
        L16_35 = L12_31()
        L10_29 = L10_29(L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L12_31())
        if L10_29 > 15 then
          L10_29 = wait
          L10_29()
        end
      end
      L10_29 = {
        L11_30,
        L12_31,
        L13_32,
        L14_33,
        L15_34
      }
      L11_30 = {}
      L11_30.pos = "locator2_gull01_escape_b_02"
      L11_30.attr = "takeoff"
      L12_31.pos = "locator2_gull01_escape_c_01"
      L12_31.attr = "fly"
      L13_32.pos = "locator2_gull01_escape_c_02"
      L13_32.attr = "fly"
      L14_33.pos = "locator2_gull01_escape_c_03"
      L14_33.attr = "fly"
      L15_34 = {}
      L15_34.pos = "locator2_gull01_escape_c_04"
      L15_34.attr = "land"
      L9_28 = L10_29
      L10_29 = Fn_fly
      L11_30 = L3_22
      L13_32.moveSpeed = 15
      L10_29(L11_30, L12_31, L13_32)
      L8_27 = 4
    elseif L8_27 == 4 then
      L9_28 = Fn_warpNpc
      L10_29 = "gull01"
      L11_30 = "locator2_gull01_escape_c_04"
      L9_28(L10_29, L11_30)
      L10_29 = L5_24
      L9_28 = L5_24.setActive
      L11_30 = false
      L9_28(L10_29, L11_30)
      L10_29 = L6_25
      L9_28 = L6_25.setActive
      L11_30 = true
      L9_28(L10_29, L11_30)
      L10_29 = L3_22
      L9_28 = L3_22.playMotion
      L11_30 = "eat"
      L9_28(L10_29, L11_30)
      L9_28 = Fn_pcSensorOn
      L10_29 = "pccubesensor2_eps90_goal"
      L9_28(L10_29)
      while true do
        L9_28 = _navi_goal
        if L9_28 == false then
          L9_28 = wait
          L9_28()
        end
      end
      L9_28 = Fn_naviKill
      L9_28()
      L9_28 = HUD
      L10_29 = L9_28
      L9_28 = L9_28.captionEnd
      L9_28(L10_29)
      L9_28 = Player
      L10_29 = L9_28
      L9_28 = L9_28.setStay
      L11_30 = true
      L9_28(L10_29, L11_30)
      L9_28 = _sdemo_02
      L10_29 = L9_28
      L9_28 = L9_28.set
      L11_30 = "locator2_cut_03_cam01"
      L9_28(L10_29, L11_30, L12_31, L13_32)
      L9_28 = _sdemo_02
      L10_29 = L9_28
      L9_28 = L9_28.offset
      L11_30 = nil
      L15_34 = 0
      L16_35 = L12_31(L13_32, L14_33, L15_34)
      L9_28(L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L12_31(L13_32, L14_33, L15_34))
      L9_28 = _sdemo_02
      L10_29 = L9_28
      L9_28 = L9_28.play
      L11_30 = {L12_31}
      L12_31.time = 4
      L12_31.pos = "locator2_cut_03_cam02"
      L9_28(L10_29, L11_30)
      L9_28 = waitSeconds
      L10_29 = 1
      L9_28(L10_29)
      L9_28 = Sound
      L10_29 = L9_28
      L9_28 = L9_28.playSE
      L11_30 = "kit051c"
      L9_28(L10_29, L11_30)
      L9_28 = Fn_captionView
      L10_29 = "ep90_00350"
      L9_28(L10_29)
      L9_28 = waitSeconds
      L10_29 = 2
      L9_28(L10_29)
      L9_28 = {
        L10_29,
        L11_30,
        L12_31,
        L13_32
      }
      L10_29 = {}
      L10_29.pos = "locator2_gull01_lost_01"
      L10_29.attr = "takeoff"
      L11_30 = {}
      L11_30.pos = "locator2_gull01_lost_02"
      L11_30.attr = "fly"
      L12_31.pos = "locator2_gull01_lost_03"
      L12_31.attr = "fly"
      L13_32.pos = "locator2_gull01_lost_04"
      L13_32.attr = "fly"
      L10_29 = invokeTask
      function L11_30()
        Fn_fly(L3_22, L9_28, {moveSpeed = 10, escape = false})
      end
      L10_29(L11_30)
      L10_29 = invokeTask
      function L11_30()
        waitSeconds(8)
        for _FORV_3_ = 1, 100 do
          L4_23:setAlpha(1 - _FORV_3_ / 100)
          wait()
        end
      end
      L10_29(L11_30)
      while true do
        L10_29 = _sdemo_02
        L11_30 = L10_29
        L10_29 = L10_29.isPlay
        L10_29 = L10_29(L11_30)
        if L10_29 then
          L10_29 = wait
          L10_29()
        end
      end
      L10_29 = _sdemo_02
      L11_30 = L10_29
      L10_29 = L10_29.play
      L13_32.time = 4
      L13_32.pos = "locator2_cut_03_cam03"
      L10_29(L11_30, L12_31)
      while true do
        L10_29 = _sdemo_02
        L11_30 = L10_29
        L10_29 = L10_29.isPlay
        L10_29 = L10_29(L11_30)
        if L10_29 then
          L10_29 = wait
          L10_29()
        end
      end
      L10_29 = _sdemo_02
      L11_30 = L10_29
      L10_29 = L10_29.play
      L13_32.time = 4
      L13_32.pos = "locator2_cut_03_cam04"
      L10_29(L11_30, L12_31)
      L10_29 = Sound
      L11_30 = L10_29
      L10_29 = L10_29.playSE
      L10_29(L11_30, L12_31)
      L10_29 = Fn_captionView
      L11_30 = "ep90_00370"
      L10_29(L11_30, L12_31)
      while true do
        L10_29 = _sdemo_02
        L11_30 = L10_29
        L10_29 = L10_29.isPlay
        L10_29 = L10_29(L11_30)
        if L10_29 then
          L10_29 = wait
          L10_29()
        end
      end
      L10_29 = waitSeconds
      L11_30 = 1
      L10_29(L11_30)
      L10_29 = _sdemo_02
      L11_30 = L10_29
      L10_29 = L10_29.set
      L10_29(L11_30)
      L10_29 = _sdemo_02
      L11_30 = L10_29
      L10_29 = L10_29.play
      L13_32.time = 2
      L13_32.pos = "locator2_cut_03_cam05"
      L14_33.time = 2
      L14_33.pos = "locator2_cut_03_cam05_aim"
      L10_29(L11_30, L12_31, L13_32)
      while true do
        L10_29 = _sdemo_02
        L11_30 = L10_29
        L10_29 = L10_29.isPlay
        L10_29 = L10_29(L11_30)
        if L10_29 then
          L10_29 = wait
          L10_29()
        end
      end
      L10_29 = Fn_captionView
      L11_30 = "ep90_00390"
      L10_29(L11_30)
      L10_29 = Fn_resetPcPos
      L11_30 = "warppoint2_03"
      L10_29(L11_30)
      L10_29 = _sdemo_02
      L11_30 = L10_29
      L10_29 = L10_29.stop
      L10_29(L11_30, L12_31)
      L10_29 = waitSeconds
      L11_30 = 3
      L10_29(L11_30)
      L10_29 = Fn_kaiwaDemoView
      L11_30 = "ft90_00600k"
      L10_29(L11_30)
      L10_29 = Fn_pcSensorOn
      L11_30 = "pccubesensor2_vogo"
      L10_29(L11_30)
      L10_29 = Fn_naviSet
      L11_30 = Fn_findNpcPuppet
      L16_35 = L11_30(L12_31)
      L10_29(L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L11_30(L12_31))
      L10_29 = HUD
      L11_30 = L10_29
      L10_29 = L10_29.captionEnd
      L10_29(L11_30)
      L10_29 = Player
      L11_30 = L10_29
      L10_29 = L10_29.setStay
      L10_29(L11_30, L12_31)
      L8_27 = 5
      break
    elseif L8_27 == 5 then
      L9_28 = _navi_vogo
    end
    if L9_28 ~= true then
      L9_28 = wait
      L9_28()
    end
  end
  L9_28 = GameDatabase
  L10_29 = L9_28
  L9_28 = L9_28.set
  L11_30 = ggd
  L11_30 = L11_30.GlobalSystemFlags__ExclusionFlag
  L9_28(L10_29, L11_30, L12_31)
  ExclusionFlag = false
end
function bird_move(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51, L14_52, L15_53, L16_54, L17_55, L18_56, L19_57
  L3_41 = 5
  L4_42 = A2_40.fpm
  if L4_42 ~= nil then
    L4_42 = A2_40.fpm
    fpm = L4_42
  end
  L4_42 = false
  L5_43 = A2_40.wait
  if L5_43 ~= nil then
    L4_42 = A2_40.wait
  end
  L5_43 = false
  L6_44 = A2_40.chase
  if L6_44 ~= nil then
    L5_43 = A2_40.chase
  end
  L6_44 = Fn_getPlayer
  L6_44 = L6_44()
  for L10_48, L11_49 in L7_45(L8_46) do
    L12_50 = L11_49.hdl
    L13_51 = L12_50
    L12_50 = L12_50.getWorldPos
    L12_50 = L12_50(L13_51)
    L14_52 = A0_38
    L13_51 = A0_38.getWorldPos
    L13_51 = L13_51(L14_52)
    L14_52 = L11_49.hdl
    L15_53 = L14_52
    L14_52 = L14_52.getParent
    L14_52 = L14_52(L15_53)
    L16_54 = L14_52
    L15_53 = L14_52.appendChild
    L17_55 = A0_38
    L15_53(L16_54, L17_55)
    L16_54 = A0_38
    L15_53 = A0_38.setWorldPos
    L17_55 = L13_51
    L15_53(L16_54, L17_55)
    L16_54 = A0_38
    L15_53 = A0_38.setForceMove
    L15_53(L16_54)
    L15_53 = Fn_get_distance
    L16_54 = L13_51
    L17_55 = L12_50
    L15_53 = L15_53(L16_54, L17_55)
    L16_54 = L15_53 * L3_41
    L17_55 = get_move_pos
    L18_56 = L13_51
    L19_57 = L12_50
    L17_55 = L17_55(L18_56, L19_57, L16_54)
    L19_57 = A0_38
    L18_56 = A0_38.setWorldRot
    L18_56(L19_57, XYZRotQuaternionEular(0, Fn_get_distance_angle(L13_51, L12_50), 0))
    L18_56 = L11_49.takeoff
    if L18_56 == true then
      L19_57 = A0_38
      L18_56 = A0_38.playPoseAnimation
      L18_56(L19_57, "takeoff")
      L18_56 = invokeTask
      function L19_57()
        while A0_38:isPoseAnimEnd() == false do
          wait()
        end
        if A0_38:isPoseAnimPlaying("takeoff") == true then
          A0_38:playPoseAnimation("fly")
        end
      end
      L18_56(L19_57)
    else
      L19_57 = A0_38
      L18_56 = A0_38.playPoseAnimation
      L18_56(L19_57, "fly")
    end
    L18_56 = 0
    L19_57 = RandI
    L19_57 = L19_57(90, 150)
    while true do
      L13_51 = A0_38:getWorldPos()
      if L16_54 < 0 then
        A0_38:setWorldPos(L12_50)
      else
        A0_38:setWorldPos(L13_51 + L17_55)
      end
      A0_38:setForceMove()
      if 5 > Fn_get_distance(L13_51, L12_50) then
        if L11_49.landing == true and false == false then
          A0_38:playPoseAnimation("fly")
        end
        if not (Fn_get_distance(L13_51, L12_50) < 0.1) then
          else
            if 0 % 10 == 0 then
              L12_50 = L11_49.hdl:getWorldPos()
              L15_53 = Fn_get_distance(L13_51, L12_50)
              if L5_43 == true then
                pc_dist = Fn_get_distance(L13_51, Fn_getPcPosRot())
                if pc_dist <= 15 then
                else
                end
              end
              L16_54 = L15_53 * (L3_41 / 2)
              L17_55 = get_move_pos(L13_51, L12_50, L16_54)
            end
            if L18_56 > L19_57 then
              if A0_38:isPoseAnimPlaying("fly") then
                A0_38:playPoseAnimation("fly1")
              elseif A0_38:isPoseAnimPlaying("fly1") then
                A0_38:playPoseAnimation("fly")
              end
              L19_57 = RandI(60, 150)
              L18_56 = 0
            end
          end
          L18_56 = L18_56 + 1
          wait()
        end
    end
    if L4_42 == true then
      while 10 < Fn_get_distance(L13_51, Fn_getPcPosRot()) do
        if false == false then
          A0_38:playPoseAnimation("stay")
        end
        wait()
      end
    end
  end
  L6_44 = nil
  L7_45(L8_46, L9_47)
end
function Finalize()
  Fn_tutorialCaptionKill()
  HUD:captionEnd()
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  if _barker_task ~= nil and _barker_task:isRunning() == true then
    _barker_task:abort()
  end
  _barker_task = nil
  if _city_task ~= nil and _city_task:isRunning() == true then
    _city_task:abort()
  end
  _city_task = nil
  if _bridge_task ~= nil and _bridge_task:isRunning() == true then
    _bridge_task:abort()
  end
  _bridge_task = nil
  if _guide_task ~= nil and _guide_task:isRunning() == true then
    _guide_task:abort()
  end
  _guide_task = nil
  if _girl_task ~= nil and _girl_task:isRunning() == true then
    _girl_task:abort()
  end
  _girl_task = nil
  if _duck01_task ~= nil and _duck01_task:isRunning() == true then
    _duck01_task:abort()
  end
  _duck01_task = nil
  for _FORV_3_, _FORV_4_ in pairs(_mot_task) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() == true then
      _FORV_4_:abort()
    end
  end
  _mot_task = {}
  Fn_killNpcTask("boy")
  Fn_killNpcTask("girl")
  Fn_killNpcTask("duck01")
  Fn_killNpcTask("gull01")
  Fn_disappearNpc("boy")
  Fn_disappearNpc("girl")
  Fn_disappearNpc("duck01")
  Fn_disappearNpc("gull01")
  Mob:makeSituationPanic(false)
  if ExclusionFlag then
    GameDatabase:set(ggd.GlobalSystemFlags__ExclusionFlag, false)
  end
end
function pccubesensor2_street_OnLeave(A0_58)
  A0_58:setActive(false)
  invokeTask(function()
    Fn_captionViewWait("ep90_00500")
    Fn_naviSet(findGameObject2("Node", "locator2_street"))
  end)
end
function pccubesensor2_guide_OnLeave(A0_59)
  if Fn_isInSightTarget("locator2_street", 0.7) == true then
    Fn_captionView("ep90_00110")
  end
end
function pccubesensor2_bridge_OnEnter(A0_60)
  A0_60:setActive(false)
  invokeTask(function()
    Fn_captionViewWait("ep90_00115")
    Fn_naviSet(findGameObject2("Node", "locator2_street"))
  end)
end
function pccubesensor2_market_OnEnter(A0_61)
  A0_61:setActive(false)
  _navi_street = true
end
function pccubesensor2_eps90_goal_OnEnter(A0_62)
  _navi_goal = true
  A0_62:setActive(false)
end
function pccubesensor2_vogo_OnEnter(A0_63)
  _navi_vogo = true
  Fn_naviKill()
  A0_63:setActive(false)
end
function pccubesensor2_tutorial_OnLeave(A0_64)
  Fn_tutorialCaptionKill()
  A0_64:setActive(false)
end
function vctrl2_wagon_OnEnter(A0_65)
  _navi_market = true
  A0_65:setActive(false)
end
function pccubesensor2_barker_01_OnEnter(A0_66)
  shop_barker(A0_66, findGameObject2("Node", "locator2_barker_01"), "ep90_00520", "ep90_00525", "mmc002a", "kit022b")
end
function pccubesensor2_barker_02_OnEnter(A0_67)
  shop_barker(A0_67, findGameObject2("Node", "locator2_barker_02"), "ep90_00530", "ep90_00535", "mmb002c", "kit040a")
end
function pccubesensor2_barker_03_OnEnter(A0_68)
  shop_barker(A0_68, findGameObject2("Node", "locator2_barker_03"), "ep90_00540", "ep90_00545", "mma002b", "kit020b")
end
function pccubesensor2_barker_04_OnEnter(A0_69)
  shop_barker(A0_69, findGameObject2("Node", "locator2_barker_04"), "ep90_00550", "ep90_00555", "mma002c", "kit032b")
end
function pccubesensor2_barker_05_OnEnter(A0_70)
  shop_barker(A0_70, findGameObject2("Node", "locator2_barker_05"), "ep90_00560", "ep90_00565", "mmb002b", "kit022c")
end
function pccubesensor2_barker_06_OnEnter(A0_71)
  shop_barker(A0_71, findGameObject2("Node", "locator2_barker_06"), "ep90_00561", "ep90_00566", "mmb002a", "kit042a")
end
function pccubesensor2_barker_07_OnEnter(A0_72)
  shop_barker(A0_72, findGameObject2("Node", "locator2_barker_07"), "ep90_00562", "ep90_00567", "mma002c", "kit033c")
end
function pccubesensor2_barker_08_OnEnter(A0_73)
  shop_barker(A0_73, findGameObject2("Node", "locator2_barker_08"), "ep90_00563", "ep90_00568", "mmc002b", "kit033a")
end
function pccubesensor2_barker_09_OnEnter(A0_74)
  shop_barker(A0_74, findGameObject2("Node", "locator2_barker_09"), "ep90_00564", "ep90_00569", "mmc002c", "kit038b")
end
function pccubesensor2_barker_OnLeave(A0_75)
  if _barker_task ~= nil and _barker_task:isRunning() == true then
    _barker_task:abort()
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end
  _barker_task = nil
  if _barker_once[A0_75:getName()] == true then
    A0_75:setActive(false)
  end
end
function shop_barker(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81)
  _barker_task = invokeTask(function()
    local L0_82
    while true do
      L0_82 = Fn_isInSightTarget
      L0_82 = L0_82(A1_77, 0.7)
      if L0_82 ~= true then
        L0_82 = wait
        L0_82()
      end
    end
    L0_82 = Sound
    L0_82 = L0_82.playSE
    L0_82(L0_82, A4_80, 0.5, "", A1_77)
    L0_82 = Fn_captionView
    L0_82(A2_78)
    L0_82 = waitSeconds
    L0_82(1)
    L0_82 = A1_77
    L0_82 = L0_82.getWorldPos
    L0_82 = L0_82(L0_82)
    while true do
      if false == false then
        if Player:getAction() == Player.kAction_Idle then
        end
      else
        if true == true then
          Camera:setViewControlTarget(L0_82)
          Player:setLookAtIk(true, 1, L0_82)
          if (0 < Pad:getStick(Pad.kStick_Camera) or 0 < Pad:getStick(Pad.kStick_Camera)) and 0 + 1 > 10 then
            Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          end
        end
        if Fn_isInSightTarget(A1_77, 0.3) == true and Fn_isCaptionView() == false then
          Sound:playSE(A5_81, 0.8, "", Player.getPuppet())
          Fn_captionView(A3_79)
          _barker_once[A0_76:getName()] = true
          break
        end
      end
      wait()
    end
    waitSeconds(1)
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end)
end
function opening_child_guide()
  local L0_83, L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92
  L0_83 = Fn_findNpc
  L1_84 = "boy"
  L0_83 = L0_83(L1_84)
  L2_85 = L0_83
  L1_84 = L0_83.getPuppet
  L1_84 = L1_84(L2_85)
  L2_85 = Fn_findNpc
  L3_86 = "girl"
  L2_85 = L2_85(L3_86)
  L4_87 = L2_85
  L3_86 = L2_85.getPuppet
  L3_86 = L3_86(L4_87)
  L4_87 = Fn_findNpc
  L5_88 = "duck01"
  L4_87 = L4_87(L5_88)
  L6_89 = L4_87
  L5_88 = L4_87.getPuppet
  L5_88 = L5_88(L6_89)
  L6_89 = {
    L7_90,
    L8_91,
    L9_92,
    "mmd007a"
  }
  L7_90 = "mmd001b"
  L8_91 = "mmd006a"
  L9_92 = "mmd006b"
  boy_voice = L6_89
  L6_89 = {
    L7_90,
    L8_91,
    L9_92,
    "mwd007a"
  }
  L7_90 = "mwd001b"
  L8_91 = "mwd006a"
  L9_92 = "mwd006b"
  girl_voice = L6_89
  L6_89 = createGameObject2
  L7_90 = "Node"
  L6_89 = L6_89(L7_90)
  L8_91 = L6_89
  L7_90 = L6_89.setName
  L9_92 = "locator2_chi02_move"
  L7_90(L8_91, L9_92)
  L7_90 = createGameObject2
  L8_91 = "Node"
  L7_90 = L7_90(L8_91)
  L9_92 = L7_90
  L8_91 = L7_90.setName
  L8_91(L9_92, "locator2_duck01_move")
  L8_91 = start_game_obj
  L8_91()
  L8_91 = findGameObject2
  L9_92 = "Node"
  L8_91 = L8_91(L9_92, "locator2_street")
  L9_92 = Fn_turnNpc
  L9_92(L0_83, L8_91)
  L9_92 = Sound
  L9_92 = L9_92.playSE
  L9_92(L9_92, "mmd002b", 0.7, "", L1_84)
  L9_92 = L0_83.playMotion
  L9_92(L0_83, "beckon")
  L9_92 = Fn_turnNpc
  L9_92(L2_85, L1_84)
  repeat
    L9_92 = wait
    L9_92()
    L9_92 = L0_83.isMotionEnd
    L9_92 = L9_92(L0_83)
  until L9_92
  L9_92 = false
  _guide_task = invokeTask(function()
    local L0_93, L1_94, L2_95
    L0_93 = {L1_94, L2_95}
    L1_94 = "locator2_chi01_move_01"
    L2_95 = "locator2_chi01_move_02"
    L1_94 = Fn_moveNpc
    L2_95 = "boy"
    L1_94 = L1_94(L2_95, L0_93, {
      arrivedLength = 2,
      runLength = 3,
      anim_walk = "walk1",
      anim_walk_b = "anim_walk_b1",
      anim_run = "run1"
    })
    L2_95 = RandI
    L2_95 = L2_95(200, 600)
    while L1_94:isRunning() do
      L2_95 = L2_95 - 1
      if L2_95 < 0 then
        L0_83:pauseMove(true)
        Sound:playSE(boy_voice[RandI(1, #boy_voice)], 0.7, "", L1_84)
        L0_83:playMotion("beckon")
        repeat
          wait()
        until L0_83:isMotionEnd()
        L0_83:pauseMove(false)
        L2_95 = RandI(200, 400)
      end
      wait()
    end
    L1_94 = nil
    L0_83:playMotion("stay")
    L9_92 = true
  end)
  _girl_task = invokeTask(function()
    local L0_96, L1_97
    repeat
      L0_96 = RandI
      L1_97 = 50
      L0_96 = L0_96(L1_97, 100)
      L1_97 = {
        "locator2_chi01_move_01",
        "locator2_chi02_goal"
      }
      while Fn_moveNpc("girl", L1_97, {
        arrivedLength = 2,
        runLength = 5,
        anim_walk = "walk1",
        anim_walk_b = "anim_walk_b1",
        anim_run = "run"
      }):isRunning() do
        if L0_96 < 0 then
          Sound:playSE(girl_voice[RandI(1, #boy_voice)], 0.7, "", L3_86)
          L0_96 = RandI(300, 600)
        end
        L0_96 = L0_96 - 1
        wait()
      end
      wait()
    until L9_92 == true
  end)
  _duck01_task = invokeTask(function()
    local L0_98
    repeat
      L0_98 = RandI
      L0_98 = L0_98(100, 200)
      L7_90:setWorldPos(L3_86:getWorldPos())
      L7_90:setForceMove()
      while Fn_moveNpc("duck01", {L7_90}, {arrivedLength = 1, runLength = -1}):isRunning() do
        if L0_98 < 0 then
          Sound:playSE("duck_quack", 0.5, "", L5_88)
          L0_98 = RandI(300, 600)
        end
        L0_98 = L0_98 - 1
        wait()
      end
      wait()
    until L9_92 == true
    L0_98 = Fn_moveNpc
    L0_98 = L0_98("duck01", {
      "locator2_duck01_goal"
    }, {arrivedLength = 1, runLength = -1})
    while L0_98:isRunning() do
      wait()
    end
  end)
  _mot_task.boy = Fn_playLoopMotionInsert(L0_83, "stay", {"stay_02"}, 5, 10)
  _mot_task.girl = Fn_playLoopMotionInsert(L2_85, "stay", {"stay_02"}, 5, 10)
  _mot_task.duck01 = Fn_playLoopMotionInsert(L4_87, "stay", {"stay_01", "quack_00"}, 5, 10)
end
