import("Debug")
import("Font")
import("DeltaTimer")
import("Area")
import("Pad")
import("Sound")
import("Camera")
dofile("/Debug/ShortcutKey/setup.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Misc/gm_boss.lua")
_debugLine = 0
function debugDispPrint(A0_0)
  local L1_1
  L1_1 = Debug
  L1_1 = L1_1.isDebugMenuOpen
  L1_1 = L1_1(L1_1)
  if L1_1 then
    L1_1 = 250
  else
    L1_1 = L1_1 or 50
  end
  Font:debugPrint(L1_1, 50 + 20 * _debugLine, A0_0)
  _debugLine = _debugLine + 1
end
_gm = nil
_request = false
_attack_break_00 = false
_attack_l_00 = false
_attack_r_00 = false
_broken_arm_f = false
_broken_arm_r = false
_broken_arm_l = false
_appearance_arm_f = false
_appearance_arm_r = false
_appearance_arm_l = false
function main()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {L3_5, L4_6}
  L3_5 = "Display"
  L4_6 = "Debug Draw"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {L3_5, L4_6}
  L3_5 = "Display"
  L4_6 = "Screen Console"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {
    L3_5,
    L4_6,
    L5_7
  }
  L3_5 = "Display"
  L4_6 = "DebugDrawGroup"
  L5_7 = "Animation"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {
    L3_5,
    L4_6,
    L5_7
  }
  L3_5 = "Display"
  L4_6 = "DebugDrawGroup"
  L5_7 = "ScriptQuery"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {
    L3_5,
    L4_6,
    L5_7
  }
  L3_5 = "Display"
  L4_6 = "DebugDrawGroup"
  L5_7 = "ScriptDebugDraw"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {
    L3_5,
    L4_6,
    L5_7
  }
  L3_5 = "Development"
  L4_6 = "Console"
  L5_7 = "Script"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Debug
  L1_3 = L0_2
  L0_2 = L0_2.setSwitch
  L2_4 = {L3_5, L4_6}
  L3_5 = "Viewer"
  L4_6 = "ShowPuppetAnimInfo"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  function L0_2()
    DebugShortcutKey:registerKeyMap("test_gm2", {
      num0 = {
        desc = "attack_break_00",
        proc = function()
          local L1_8
          L1_8 = _request
          if L1_8 == false then
            _attack_break_00 = true
            _request = true
          end
        end
      },
      num9 = {
        desc = "attack_l_00",
        proc = function()
          local L1_9
          L1_9 = _request
          if L1_9 == false then
            _attack_l_00 = true
            _request = true
          end
        end
      },
      num8 = {
        desc = "attack_r_00",
        proc = function()
          local L1_10
          L1_10 = _request
          if L1_10 == false then
            _attack_r_00 = true
            _request = true
          end
        end
      },
      num1 = {
        desc = "broken_arm_f",
        proc = function()
          local L1_11
          L1_11 = _request
          if L1_11 == false then
            _broken_arm_f = true
            _request = true
          end
        end
      },
      num2 = {
        desc = "broken_arm_r",
        proc = function()
          local L1_12
          L1_12 = _request
          if L1_12 == false then
            _broken_arm_r = true
            _request = true
          end
        end
      },
      num3 = {
        desc = "broken_arm_l",
        proc = function()
          local L1_13
          L1_13 = _request
          if L1_13 == false then
            _broken_arm_l = true
            _request = true
          end
        end
      },
      num4 = {
        desc = "_appearance_arm_f",
        proc = function()
          local L1_14
          L1_14 = _request
          if L1_14 == false then
            _appearance_arm_f = true
            _request = true
          end
        end
      },
      num5 = {
        desc = "_appearance_arm_r",
        proc = function()
          local L1_15
          L1_15 = _request
          if L1_15 == false then
            _appearance_arm_r = true
            _request = true
          end
        end
      },
      num6 = {
        desc = "_appearance_arm_l",
        proc = function()
          local L1_16
          L1_16 = _request
          if L1_16 == false then
            _appearance_arm_l = true
            _request = true
          end
        end
      }
    }, false, false)
  end
  L1_3 = DebugShortcutKey
  L2_4 = L1_3
  L1_3 = L1_3.setup
  L3_5 = "test_gm"
  L4_6 = L0_2
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = DeltaTimer
  L2_4 = L1_3
  L1_3 = L1_3.new
  L1_3 = L1_3(L2_4)
  L3_5 = L1_3
  L2_4 = L1_3.start
  L2_4(L3_5)
  L2_4 = createSandbox2
  L3_5 = "father2"
  L2_4 = L2_4(L3_5)
  L4_6 = L2_4
  L3_5 = L2_4.setString
  L5_7 = "g_filename"
  L3_5(L4_6, L5_7, "/Game/Event2/father2.lua")
  L4_6 = L2_4
  L3_5 = L2_4.try_init
  L3_5(L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.waitForReady
  L3_5(L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.try_start
  L3_5(L4_6)
  while true do
    L4_6 = L2_4
    L3_5 = L2_4.sendEvent
    L5_7 = "isPcSpawned"
    L3_5 = L3_5(L4_6, L5_7)
    if not L3_5 then
      L3_5 = wait
      L3_5()
    end
  end
  L2_4 = nil
  L3_5 = createGameObject2
  L4_6 = "Area"
  L3_5 = L3_5(L4_6)
  L5_7 = L3_5
  L4_6 = L3_5.setName
  L4_6(L5_7, "up_b_root")
  L5_7 = L3_5
  L4_6 = L3_5.try_init
  L4_6(L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.waitForReady
  L4_6(L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.try_start
  L4_6(L5_7)
  L5_7 = L1_3
  L4_6 = L1_3.stop
  L4_6(L5_7)
  L4_6 = print
  L5_7 = "milli second = "
  L5_7 = L5_7 .. L1_3:getMSecond()
  L4_6(L5_7)
  L4_6 = print
  L5_7 = "second = "
  L5_7 = L5_7 .. L1_3:getSecond()
  L4_6(L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.findSubArea
  L4_6 = L4_6(L5_7, "up_a_02_01")
  L5_7 = createGameObject2
  L5_7 = L5_7("Node")
  L4_6:appendChild(L5_7)
  L5_7:setName("_gm_start_node")
  L5_7:setTransform(Vector(0, 135, 200), XYZRotQuatD(0, 180, 0))
  HUD:captionBegin("\228\186\161\233\156\138\233\131\189\229\184\130\228\189\156\230\136\144\228\184\173", 0)
  _gm = GmBoss.create("_gm_start_node")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  _gm:setDispFlag("f", false)
  _gm:run()
  HUD:captionBegin("\228\186\161\233\156\138\233\131\189\229\184\130\228\189\156\230\136\144\231\181\130\228\186\134", 3)
  repeat
    wait()
  until _gm:isMotionEnd("r")
  _gm:setMotionSpeed("f", 0.3)
  _gm:setMotionSpeed("r", 0.3)
  _gm:setMotionSpeed("l", 0.3)
  _gm:setMotionSpeed("b", 0.3)
  _gm:playMotionAll("stay")
  _gm:absorptionEffStandby()
  invokeTask(function()
    while true do
      _debugLine = 0
      debugDispPrint("num0 : attack_break_00")
      debugDispPrint("num9 : attack_l_00")
      debugDispPrint("num8 : attack_r_00")
      debugDispPrint("     -----        ")
      debugDispPrint("num4 : appear_00")
      debugDispPrint("num3 : dead_00 (l)")
      debugDispPrint("num2 : dead_00 (r)")
      debugDispPrint("num1 : dead_00 (f)")
      wait()
    end
  end)
  while true do
    if _attack_break_00 then
      _gm:setMotionSpeed("f", 1)
      _gm:setMotionSpeed("r", 1)
      _gm:setMotionSpeed("l", 1)
      _gm:setMotionSpeed("b", 1)
      _gm:playMotion("l", "attack_break_00", 1)
      _gm:playMotion("r", "attack_break_00", 1)
      _gm:playSE("r", "ene_gc_arm_whoosh", 1)
      _gm:playSE("l", "ene_gc_arm_whoosh", 1)
      repeat
        wait()
      until _gm:isMotionEnd("r")
      _gm:setMotionSpeed("f", 0.3)
      _gm:setMotionSpeed("r", 0.3)
      _gm:setMotionSpeed("l", 0.3)
      _gm:setMotionSpeed("b", 0.3)
      _gm:playMotionAll("stay")
      _attack_break_00 = false
      _request = false
    end
    if _attack_l_00 then
      _gm:attackArm("l")
      _attack_l_00 = false
      _request = false
    end
    if _attack_r_00 then
      _gm:attackArm("r")
      _attack_r_00 = false
      _request = false
    end
    if _broken_arm_f then
      _gm:brokenArm("f", "ep11_ghost_scream")
      _broken_arm_f = false
      _request = false
    end
    if _broken_arm_r then
      _gm:brokenArm("r", "ep11_ghost_scream")
      _broken_arm_r = false
      _request = false
    end
    if _broken_arm_l then
      _gm:brokenArm("l", "ep11_ghost_scream")
      _broken_arm_l = false
      _request = false
    end
    if _appearance_arm_f then
      _gm:appearanceArm("f", "ep11_ghost_recovery")
      _appearance_arm_f = false
      _request = false
    end
    wait()
  end
end
function createUpA02Brk(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26
  L1_18 = {}
  L1_18.up_a_02_brk_01_01 = "up_a_02_brk_01"
  L1_18.up_a_02_brk_02_01 = "up_a_02_brk_02"
  L1_18.up_a_02_brk_03_01 = "up_a_02_brk_03"
  L1_18.up_a_02_brk_04_01 = "up_a_02_brk_04"
  L1_18.up_a_02_brk_05_01 = "up_a_02_brk_05"
  L1_18.up_a_02_brk_06_01 = "up_a_02_brk_06"
  L1_18.up_a_02_brk_07_01 = "up_a_02_brk_07"
  L1_18.up_a_02_brk_08_01 = "up_a_02_brk_08"
  L1_18.up_a_02_brk_09_01 = "up_a_02_brk_09"
  L1_18.up_a_02_brk_10_01 = "up_a_02_brk_10"
  L1_18.up_a_02_brk_11_01 = "up_a_02_brk_11"
  L1_18.up_a_02_brk_12_01 = "up_a_02_brk_12"
  L1_18.up_a_02_brk_13_01 = "up_a_02_brk_13"
  L1_18.up_a_02_brk_14_01 = "up_a_02_brk_14"
  L1_18.up_a_02_brk_15_01 = "up_a_02_brk_15"
  L1_18.construction_sk_01_01 = "construction_sk_01"
  L1_18.construction_sk_01_02 = "construction_sk_01"
  L1_18.construction_sk_01_03 = "construction_sk_01"
  L1_18.construction_sk_01_04 = "construction_sk_01"
  L1_18.construction_sk_01_05 = "construction_sk_01"
  L1_18.construction_sk_01_08 = "construction_sk_01"
  L1_18.construction_sk_01_07 = "construction_sk_01"
  L1_18.construction_sk_01_017 = "construction_sk_01"
  L1_18.construction_sk_01_018 = "construction_sk_01"
  L1_18.construction_sk_04_01 = "construction_sk_04"
  L1_18.construction_sk_04_10 = "construction_sk_04"
  L1_18.construction_sk_04_11 = "construction_sk_04"
  L1_18.construction_sk_04_13 = "construction_sk_04"
  L1_18.rock_sk_05_02 = "rock_sk_05"
  L1_18.rock_sk_05_03 = "rock_sk_05"
  L1_18.rock_sk_05_07 = "rock_sk_05"
  L1_18.rock_sk_05_011 = "rock_sk_05"
  L1_18.rock_sk_05_016 = "rock_sk_05"
  L1_18.rock_sk_06_18 = "rock_sk_06"
  L1_18.rock_sk_06_19 = "rock_sk_06"
  L1_18.rock_sk_06_22 = "rock_sk_06"
  L1_18.rock_sk_06_23 = "rock_sk_06"
  L1_18.rock_sk_06_24 = "rock_sk_06"
  L1_18.rock_sk_06_25 = "rock_sk_06"
  L1_18.rock_sk_07_01 = "rock_sk_07"
  L1_18.rock_sk_07_29 = "rock_sk_07"
  L1_18.rock_sk_07_31 = "rock_sk_07"
  L1_18.rock_sk_08_39 = "rock_sk_08"
  L1_18.rock_sk_08_33 = "rock_sk_08"
  L1_18.rock_sk_08_40 = "rock_sk_08"
  L1_18.rock_sk_08_42 = "rock_sk_08"
  L2_19 = createGameObject2
  L3_20 = "Puppet"
  L2_19 = L2_19(L3_20)
  L3_20 = createGameObject2
  L4_21 = "ActorBrain"
  L3_20 = L3_20(L4_21)
  L4_21 = {}
  for L8_25, L9_26 in L5_22(L6_23) do
    if string.sub(L9_26, 1, 7) == "up_a_02" then
      L4_21[L8_25] = createGameObject2("AreaRegularBg")
      L4_21[L8_25]:setName("upa02brk_" .. L8_25)
      L4_21[L8_25]:setModelName(L9_26)
      L4_21[L8_25]:setEventRange(50)
      L4_21[L8_25]:setVisible(false)
      L4_21[L8_25]:setActive(false)
    else
      L4_21[L8_25] = createGameObject2("TerrainBg")
      L4_21[L8_25]:setName("upa02brk_" .. L8_25)
      L4_21[L8_25]:setModelName(L9_26)
      L4_21[L8_25]:setCollisionName(L9_26)
    end
  end
  L5_22(L6_23)
  L5_22.puppet = L2_19
  L5_22.models = L4_21
  return L5_22
end
