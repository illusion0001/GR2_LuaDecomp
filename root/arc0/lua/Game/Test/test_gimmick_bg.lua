import("math")
import("Debug")
import("HUD")
import("Area")
import("Wind")
import("Pad")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
unit_test = "g1_bell_kk_01"
function put_gimmickbg(A0_0, A1_1)
  createGameObject2("GimmickBg"):setDrawModelName(A1_1)
  createGameObject2("GimmickBg"):setCollisionName(A1_1)
  createGameObject2("GimmickBg"):setAttributeName(A1_1)
  createGameObject2("GimmickBg"):setPos(A0_0)
  createGameObject2("GimmickBg"):setAutoRestore(10)
  createGameObject2("GimmickBg"):setName(A1_1)
  return (createGameObject2("GimmickBg"))
end
function put_barrel(A0_2)
  return put_gimmickbg(A0_2, "barrel_kk_01")
end
function restore_callback(A0_3)
  A0_3:pushJob("NJ", "N", 0, "B")
end
function dynamic_callback(A0_4)
  A0_4:getDynamicObject():setEventListener("damage", damage_callback)
  print("box dynamic")
end
function damage_callback(A0_5)
  print("box damage")
end
function broken_callback(A0_6)
  print("box broken")
end
function judge_callback(A0_7, A1_8, A2_9, A3_10)
  print("judge:" .. A1_8 .. "=" .. A2_9)
  if A3_10:getName() ~= nil then
    print("  sender:" .. A3_10:getName())
  else
    print("  sender: not named")
  end
  return 2
end
function dynamic_judge_callback(A0_11)
  A0_11:getDynamicObject():setEventListener("judge", judge_callback)
end
function dynamic_terminate_callback(A0_12)
  A0_12:getDynamicObject():setAutoTerminate(2)
end
function put_box(A0_13)
  put_gimmickbg(A0_13, "woodbox_kk_01"):setEventListener("dynamic", dynamic_callback)
  put_gimmickbg(A0_13, "woodbox_kk_01"):setEventListener("damage", damage_callback)
  put_gimmickbg(A0_13, "woodbox_kk_01"):setEventListener("broken", broken_callback)
  return (put_gimmickbg(A0_13, "woodbox_kk_01"))
end
function put_other(A0_14)
  return put_gimmickbg(A0_14, "watertank_fl_01")
end
bkobjs = {}
function main()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26
  L0_15 = test_gimmick_bg
  if L0_15 == nil then
    test_gimmick_bg = "gate_md_01"
  end
  L0_15 = HUD
  L1_16 = L0_15
  L0_15 = L0_15.menuOpen
  L2_17 = "Main"
  L0_15(L1_16, L2_17)
  L0_15 = HUD
  L1_16 = L0_15
  L0_15 = L0_15.menuOpen
  L2_17 = "Gameover"
  L0_15(L1_16, L2_17)
  L0_15 = Vector
  L1_16 = -22
  L2_17 = 0
  L3_18 = 17.6
  L0_15 = L0_15(L1_16, L2_17, L3_18)
  org = L0_15
  L0_15 = Vector
  L1_16 = -24
  L2_17 = org
  L2_17 = L2_17.y
  L3_18 = 95
  L0_15 = L0_15(L1_16, L2_17, L3_18)
  pos_player = L0_15
  L0_15 = Vector
  L1_16 = org
  L1_16 = L1_16.x
  L1_16 = L1_16 + 8
  L2_17 = org
  L2_17 = L2_17.y
  L3_18 = org
  L3_18 = L3_18.z
  L0_15 = L0_15(L1_16, L2_17, L3_18)
  pos1 = L0_15
  L0_15 = Vector
  L1_16 = org
  L1_16 = L1_16.x
  L1_16 = L1_16 + 8
  L2_17 = org
  L2_17 = L2_17.y
  L3_18 = org
  L3_18 = L3_18.z
  L3_18 = L3_18 + 8
  L0_15 = L0_15(L1_16, L2_17, L3_18)
  pos2 = L0_15
  L0_15 = createGameObject2
  L1_16 = "Area"
  L0_15 = L0_15(L1_16)
  L2_17 = L0_15
  L1_16 = L0_15.setName
  L3_18 = "test_z_root2"
  L1_16(L2_17, L3_18)
  L2_17 = L0_15
  L1_16 = L0_15.setPos
  L3_18 = Vector
  L4_19 = 0
  L5_20 = -0.6
  L6_21 = 0
  L11_26 = L3_18(L4_19, L5_20, L6_21)
  L1_16(L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L3_18(L4_19, L5_20, L6_21))
  L1_16 = Area
  L2_17 = L1_16
  L1_16 = L1_16.setAnimMoveDriftEnable
  L3_18 = false
  L1_16(L2_17, L3_18)
  L1_16 = print
  L2_17 = "init all"
  L1_16(L2_17)
  L1_16 = initializeAllGameObjects
  L1_16()
  L1_16 = print
  L2_17 = "wait ready all"
  L1_16(L2_17)
  L1_16 = waitForReadyAllGameObjects
  L1_16()
  L2_17 = L0_15
  L1_16 = L0_15.setSceneParameters
  L3_18 = "default"
  L1_16(L2_17, L3_18)
  L1_16 = print
  L2_17 = "start all"
  L1_16(L2_17)
  L1_16 = startAllGameObjects
  L1_16()
  L1_16 = 1.5
  L2_17 = 0.86
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 2
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[1] = L4_19
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 1
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[2] = L4_19
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 1
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[3] = L4_19
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 2
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[4] = L4_19
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 1
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[5] = L4_19
  L3_18 = bkobjs
  L4_19 = put_barrel
  L5_20 = Vector
  L6_21 = org
  L6_21 = L6_21.x
  L6_21 = L6_21 + 1
  L11_26 = L5_20(L6_21, L7_22, L8_23)
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L5_20(L6_21, L7_22, L8_23))
  L3_18[6] = L4_19
  L3_18 = bkobjs
  L3_18 = L3_18[1]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = bkobjs
  L3_18 = L3_18[2]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = bkobjs
  L3_18 = L3_18[3]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = bkobjs
  L3_18 = L3_18[4]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = bkobjs
  L3_18 = L3_18[5]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = bkobjs
  L3_18 = L3_18[6]
  L4_19 = L3_18
  L3_18 = L3_18.switchGravityGrabAsWeapon
  L5_20 = false
  L3_18(L4_19, L5_20)
  L3_18 = 0.6
  L4_19 = 0.6
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[7] = L6_21
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + L3_18
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[8] = L6_21
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 - L3_18
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[9] = L6_21
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = org
  L10_25 = L10_25.z
  L11_26 = L3_18 / 2
  L10_25 = L10_25 + L11_26
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[10] = L6_21
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = org
  L10_25 = L10_25.z
  L11_26 = L3_18 / 2
  L10_25 = L10_25 - L11_26
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[11] = L6_21
  L5_20 = bkobjs
  L6_21 = put_box
  L10_25 = L4_19 * 2
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[12] = L6_21
  L5_20 = bkobjs
  L6_21 = put_other
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 - 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[13] = L6_21
  L5_20 = bkobjs
  L6_21 = put_other
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 - 3
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20[14] = L6_21
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 5
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[15] = L6_21
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 4
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[16] = L6_21
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 20
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[17] = L6_21
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = -3.935287
  L10_25 = 32.229996
  L11_26 = -3.951309
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[18] = L6_21
  L5_20 = bkobjs
  L5_20 = L5_20[17]
  L6_21 = L5_20
  L5_20 = L5_20.setRot
  L10_25 = 0
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L5_20(L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20 = bkobjs
  L5_20 = L5_20[18]
  L6_21 = L5_20
  L5_20 = L5_20.setRot
  L10_25 = 0
  L11_26 = 0.707107
  L11_26 = L7_22(L8_23, L9_24, L10_25, L11_26)
  L5_20(L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25, L11_26))
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = org
  L10_25 = L10_25.z
  L10_25 = L10_25 + 20
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[19] = L6_21
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = 2.791718
  L10_25 = 21.900078
  L11_26 = 2.891716
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[20] = L6_21
  L5_20 = bkobjs
  L5_20 = L5_20[19]
  L6_21 = L5_20
  L5_20 = L5_20.setRot
  L10_25 = 0
  L11_26 = L7_22(L8_23, L9_24, L10_25)
  L5_20(L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25))
  L5_20 = bkobjs
  L5_20 = L5_20[20]
  L6_21 = L5_20
  L5_20 = L5_20.setRot
  L10_25 = 0
  L11_26 = 0.707107
  L11_26 = L7_22(L8_23, L9_24, L10_25, L11_26)
  L5_20(L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L7_22(L8_23, L9_24, L10_25, L11_26))
  L5_20 = bkobjs
  L5_20 = L5_20[5]
  L6_21 = L5_20
  L5_20 = L5_20.setLockonPermission
  L5_20(L6_21, L7_22)
  L5_20 = bkobjs
  L5_20 = L5_20[12]
  L6_21 = L5_20
  L5_20 = L5_20.setLockonPermission
  L5_20(L6_21, L7_22)
  L5_20 = bkobjs
  L5_20 = L5_20[15]
  L6_21 = L5_20
  L5_20 = L5_20.setLockonPermission
  L5_20(L6_21, L7_22)
  L5_20 = bkobjs
  L6_21 = put_gimmickbg
  L10_25 = org
  L10_25 = L10_25.z
  L6_21 = L6_21(L7_22, L8_23)
  L5_20[21] = L6_21
  L5_20 = bkobjs
  L5_20 = L5_20[21]
  L6_21 = L5_20
  L5_20 = L5_20.setName
  L5_20(L6_21, L7_22)
  L5_20 = bkobjs
  L5_20 = L5_20[21]
  L6_21 = L5_20
  L5_20 = L5_20.setLockonPermission
  L5_20(L6_21, L7_22)
  L5_20 = createGameObject2
  L6_21 = "Sensor"
  L5_20 = L5_20(L6_21)
  L6_21 = L5_20.setName
  L6_21(L7_22, L8_23)
  L6_21 = L5_20.setDetectBehavior
  L6_21(L7_22, L8_23)
  L6_21 = L5_20.addBox
  L10_25 = 3
  L11_26 = 3
  L11_26 = L8_23(L9_24, L10_25, L11_26)
  L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L8_23(L9_24, L10_25, L11_26))
  L6_21 = L5_20.setPos
  L10_25 = org
  L10_25 = L10_25.y
  L10_25 = L10_25 + 3
  L11_26 = org
  L11_26 = L11_26.z
  L11_26 = L8_23(L9_24, L10_25, L11_26)
  L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L8_23(L9_24, L10_25, L11_26))
  L6_21 = L5_20.setOnEnter
  L6_21(L7_22, L8_23)
  L6_21 = L5_20.setOnLeave
  L6_21(L7_22, L8_23)
  L6_21 = nil
  if L0_15 ~= nil then
    L6_21 = L7_22
    L7_22(L8_23, L9_24)
    for L10_25, L11_26 in L7_22(L8_23) do
      if L11_26 ~= nil then
        L6_21:appendChild(L11_26)
      end
    end
  end
  L7_22(L8_23, L9_24)
  L10_25 = 0
  L11_26 = L2_17
  L11_26 = L9_24(L10_25, L11_26, 0)
  L7_22(L8_23, L9_24, L10_25, L11_26, L9_24(L10_25, L11_26, 0))
  if L7_22 ~= nil then
    L7_22(L8_23, L9_24)
  end
  if L7_22 ~= nil then
    L7_22(L8_23, L9_24)
  end
  L10_25 = "a"
  L8_23(L9_24, L10_25)
  L10_25 = Vector
  L11_26 = -20
  L11_26 = L10_25(L11_26, 5, -10)
  L8_23(L9_24, L10_25, L11_26, L10_25(L11_26, 5, -10))
  L10_25 = XYZRotQuaternionEular
  L11_26 = 30
  L11_26 = L10_25(L11_26, 40, 70)
  L8_23(L9_24, L10_25, L11_26, L10_25(L11_26, 40, 70))
  if L6_21 ~= nil then
    L10_25 = L7_22
    L8_23(L9_24, L10_25)
  end
  L10_25 = nil
  L11_26 = "S"
  L8_23(L9_24, L10_25, L11_26, 6, "D")
  L10_25 = nil
  L11_26 = "S"
  L8_23(L9_24, L10_25, L11_26, 6, "B")
  L10_25 = "M"
  L11_26 = "S"
  L8_23(L9_24, L10_25, L11_26, 3, "B")
  L10_25 = "P"
  L11_26 = "S"
  L8_23(L9_24, L10_25, L11_26, 5, "D")
  L10_25 = "P"
  L11_26 = "N"
  L8_23(L9_24, L10_25, L11_26, 3, "D")
  L10_25 = "dynamic"
  L11_26 = dynamic_terminate_callback
  L8_23(L9_24, L10_25, L11_26)
  L10_25 = "dynamic"
  L11_26 = dynamic_terminate_callback
  L8_23(L9_24, L10_25, L11_26)
  L10_25 = "dynamic"
  L11_26 = dynamic_terminate_callback
  L8_23(L9_24, L10_25, L11_26)
  L10_25 = "dynamic"
  L11_26 = dynamic_terminate_callback
  L8_23(L9_24, L10_25, L11_26)
  L10_25 = "dynamic"
  L11_26 = dynamic_terminate_callback
  L8_23(L9_24, L10_25, L11_26)
  L8_23(L9_24)
  L8_23()
  L8_23(L9_24)
  L8_23()
  L8_23(L9_24)
  L8_23()
  if L7_22 ~= nil then
    L10_25 = Vector
    L11_26 = 1
    L10_25 = L10_25(L11_26, 0, 0)
    L11_26 = 0
    L8_23(L9_24, L10_25, L11_26, -1, Vector(5, 5, 5), 2)
  end
  L10_25 = L9_24
  L11_26 = {"Display", "Debug Draw"}
  L9_24(L10_25, L11_26, false)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "DebugDrawGroup",
    "Collision"
  }
  L9_24(L10_25, L11_26, L8_23)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "DebugDrawGroup",
    "GimmickBg"
  }
  L9_24(L10_25, L11_26, true)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "DebugDrawGroup",
    "Sensor"
  }
  L9_24(L10_25, L11_26, true)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "DebugDrawGroup",
    "BlockObject"
  }
  L9_24(L10_25, L11_26, L8_23)
  L10_25 = L9_24
  L11_26 = {
    "Viewer",
    "DrawGizmoCollision"
  }
  L9_24(L10_25, L11_26, L8_23)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "File Asset Status"
  }
  L9_24(L10_25, L11_26, false)
  L10_25 = L9_24
  L11_26 = {
    "Display",
    "Warning Indicator"
  }
  L9_24(L10_25, L11_26, false)
  L10_25 = L9_24
  L11_26 = {
    "Development",
    "Console",
    "Script"
  }
  L9_24(L10_25, L11_26, true)
  L10_25 = L9_24
  L11_26 = {
    "Game Objects",
    "Player",
    "SpAttackPoint: Infinite"
  }
  L9_24(L10_25, L11_26, true)
  L10_25 = L9_24
  L9_24(L10_25)
  L10_25 = L9_24
  L9_24(L10_25)
  L10_25 = L9_24
  L11_26 = pos_player
  L10_25 = print
  L11_26 = "init all"
  L10_25(L11_26)
  L10_25 = initializeAllGameObjects
  L10_25()
  L10_25 = print
  L11_26 = "wait ready all"
  L10_25(L11_26)
  L10_25 = waitForReadyAllGameObjects
  L10_25()
  L10_25 = print
  L11_26 = "start all"
  L10_25(L11_26)
  L10_25 = startAllGameObjects
  L10_25()
  if L0_15 ~= nil then
    L10_25 = Area
    L11_26 = L10_25
    L10_25 = L10_25.setAnimMoveDriftEnable
    L10_25(L11_26)
  end
  L10_25 = Debug
  L11_26 = L10_25
  L10_25 = L10_25.setSwitch
  L10_25(L11_26, {
    "Display",
    "DebugDrawGroup",
    "Effector"
  }, true)
  L10_25 = nil
  while true do
    L11_26 = Wind
    L11_26 = L11_26.addPointFlow
    L11_26 = L11_26(L11_26, L6_21, Vector(-20, 1, 24), 1.5, 0.5, -100, 1, L10_25)
    L10_25 = L11_26
    L11_26 = Pad
    L11_26 = L11_26.getButton
    L11_26 = L11_26(L11_26, Pad.kButton_Enter)
    if L11_26 then
      L11_26 = bkobjs
      L11_26 = L11_26[21]
      L11_26 = L11_26.setReactionaryParam
      L11_26(L11_26, "play", 0.1)
    end
    L11_26 = Pad
    L11_26 = L11_26.getButton
    L11_26 = L11_26(L11_26, Pad.kButton_Cancel)
    if L11_26 then
      L11_26 = bkobjs
      L11_26 = L11_26[21]
      L11_26 = L11_26.setReactionaryParam
      L11_26(L11_26, "stop", 0)
    end
    L11_26 = wait
    L11_26()
  end
end
function enter_sensor(A0_27, A1_28)
  if A1_28:isInstance("GimmickBg") and A1_28:isInstantObject() and not A1_28:isBroken() then
    print("enter")
    Wind:setWind()
  end
end
function leave_sensor(A0_29, A1_30)
  if A1_30:isInstance("GimmickBg") and A1_30:isInstantObject() and not A1_30:isBroken() then
    print("leave")
    Wind:setWind(10, 30, 40, 50, 5)
  end
end
