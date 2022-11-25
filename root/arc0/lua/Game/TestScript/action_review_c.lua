import("Font")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/TestScript/action_review_common.lua")
dofile("/Debug/ShortcutKey/user_test_stage.lua")
import("Camera")
__puppet_tbl = {}
__next_phase = false
__view_pos = nil
__crate_cap_wait = 20
__time_cnt = 0
__gemtime_cnt = 0
__gemset = false
__enemy_cnt = 0
__ars_cat_warp = false
__ars_cat_warp_inrange = 1
enmgen2_battle_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_c_01",
      name = "specialc01"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_c_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_c_21",
      name = "specialc21"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_c_22",
      name = "specialc22"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_c_23",
      name = "specialc23"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_15)
  end
}
enmgen2_battle_c_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_c_31",
      name = "specialc31"
    },
    {
      type = "guardcore",
      locator = "locator_ene_c_32",
      name = "specialc32"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_23)
  end
}
function Initialize()
  cam_hdl = createGameObject2("CameraNode")
  cam_hdl:setName("cam_demo")
  cam_node = createGameObject2("GimmickBg")
  cam_node:setName("cam_node")
  cam_node:appendChild(cam_hdl)
  aim_node = createGameObject2("GimmickBg")
  aim_node:setName("aim_node")
  Fn_setCatWarp(true)
  Fn_DebugShortcutKey_User_Test_Stage()
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40
  L4_28 = "Console"
  L0_24(L1_25, L2_26, L3_27)
  L0_24()
  L0_24(L1_25)
  for L3_27 = 1, 9 do
    L4_28 = create_setbox
    L4_28(L5_29, L6_30, L7_31)
  end
  for L3_27 = 21, 24 do
    L4_28 = create_setbox
    L4_28(L5_29, L6_30, L7_31)
  end
  L4_28 = "woodbox_kk_01"
  L0_24[1] = L1_25
  for L4_28 = 1, 6 do
    for L8_32 = 0, 3 do
      L12_36 = L4_28
      L12_36 = L0_24[1]
      L12_36 = L12_36[L4_28]
      L9_33(L10_34, L11_35, L12_36)
    end
  end
  i = 11
  L4_28 = "Node"
  L8_32 = i
  L1_25[L2_26] = L3_27
  L4_28 = Player
  L4_28 = L4_28.kAbility_SpAttack
  L2_26(L3_27, L4_28, L5_29)
  L4_28 = "locator2_box_03"
  L4_28 = L2_26
  L3_27(L4_28, L5_29)
  L4_28 = L3_27
  L3_27(L4_28, L5_29, L6_30)
  L4_28 = L3_27
  L3_27(L4_28)
  L4_28 = L3_27
  L3_27(L4_28, L5_29, L6_30)
  L4_28 = L3_27
  L3_27(L4_28)
  L4_28 = "locator2_pc_start_pos"
  L3_27(L4_28)
  L3_27()
  L4_28 = L1_25[11]
  L3_27(L4_28)
  L3_27()
  L3_27()
  L4_28 = "bgm23"
  L3_27(L4_28)
  L3_27()
  L4_28 = "EnemyGenerator"
  if L3_27 ~= nil then
    __enemy_cnt = 3
    L4_28 = L3_27.requestSpawn
    L4_28(L5_29)
  end
  L4_28 = Font
  L4_28 = L4_28.asciiPrint
  L8_32 = "enemy "
  L8_32 = L8_32 .. L9_33 .. L10_34 .. L11_35
  L4_28(L5_29, L6_30, L7_31, L8_32)
  L4_28 = findGameObject2
  L4_28 = L4_28(L5_29, L6_30)
  L8_32 = L4_28
  L16_40 = L7_31(L8_32)
  L5_29(L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L7_31(L8_32))
  L5_29(L6_30)
  L8_32 = L5_29.getWorldPos
  L16_40 = L8_32(L9_33)
  L6_30(L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L8_32(L9_33))
  L6_30(L7_31)
  L8_32 = aim_node
  L6_30(L7_31, L8_32)
  L8_32 = true
  L6_30(L7_31, L8_32)
  L8_32 = 3
  L6_30(L7_31, L8_32, L9_33)
  L8_32 = false
  L6_30(L7_31, L8_32, L9_33)
  L6_30(L7_31)
  L8_32 = {L9_33}
  L9_33.T = "ar_00870"
  L9_33.L = "mp4/info/action_review_4"
  L6_30(L7_31, L8_32)
  L8_32 = {L9_33}
  L9_33.T = "ar_00880"
  L9_33.L = "mp4/info/action_review_5"
  L6_30(L7_31, L8_32)
  enemy_cnt = L6_30
  L8_32 = {}
  L8_32.mission_target = "ar_00890"
  L7_31.view = L8_32
  L6_30(L7_31)
  L8_32 = 0
  L6_30(L7_31, L8_32, L9_33)
  L8_32 = 0
  while true do
    if L9_33 > 0 then
      L12_36 = 1000
      L16_40 = 3
      L9_33(L10_34, L11_35, L12_36, L13_37)
      L9_33(L10_34)
      __time_cnt = L9_33
      if L9_33 <= L10_34 then
        __gemset = false
      end
      if L7_31 < L6_30 and L8_32 <= 5 then
        for L12_36 = 1, 6 do
          for L16_40 = 0, 2 do
            create_boxset("po_a_02", "locator2_box_1" .. L12_36, L0_24[1][L12_36])
          end
        end
        L8_32 = L8_32 + 1
        L9_33(L10_34)
        L9_33(L10_34)
      end
    end
  end
  L9_33(L10_34)
  if L9_33 ~= nil then
    __enemy_cnt = 2
    L10_34(L11_35)
  end
  enemy_cnt = L10_34
  L12_36 = 3
  L10_34(L11_35, L12_36, L13_37)
  L12_36 = {L13_37}
  L13_37.T = "ar_00930"
  L13_37.L = "mp4/info/action_review_6"
  L10_34(L11_35, L12_36)
  L12_36 = 0
  L10_34(L11_35, L12_36, L13_37)
  L12_36 = 0
  while true do
    if L13_37 > 0 then
      L13_37(L14_38)
      __time_cnt = L13_37
      if L13_37 <= L14_38 then
        __gemset = false
      end
      if L11_35 < L10_34 and L12_36 <= 5 then
        for L16_40 = 1, 6 do
          for _FORV_20_ = 0, 2 do
            create_boxset("po_a_02", "locator2_box_1" .. L16_40, L0_24[1][L16_40])
          end
        end
        L12_36 = L12_36 + 1
        L13_37(L14_38)
        L13_37(L14_38)
      end
    end
  end
  L13_37(L14_38)
  L13_37(L14_38)
  L13_37(L14_38)
  L13_37()
  L13_37()
  L13_37()
  L13_37()
end
function Finalize()
  local L0_41, L1_42
end
function pccubesensor2_tut_11_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_11")
  __next_phase = true
end
function navi_on()
  local L0_43, L1_44
  __next_phase = true
end
function waitPhace()
  while not __next_phase do
    wait()
  end
  __next_phase = false
end
function NaviSet_Auto(A0_45, A1_46, A2_47)
  Fn_naviSet(A0_45)
  if A1_46 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_46)
    HUD:naviSetPochiDistanceDensity0(A2_47)
  end
  Sound:pulse("navi_set")
end
function move_area_po_a_11()
  Fn_getPlayer():setCollidable(false)
  Time:setInGameDeltaSec(0)
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_11"):setWorldTransform(findGameObject2("Node", "locator2_po_a_11"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_11"):setForceMove()
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_10"):setWorldTransform(findGameObject2("Node", "locator2_po_a_10"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_10"):setForceMove()
  wait()
  Time:resetInGameDeltaSec()
  wait()
  Fn_getPlayer():setCollidable(true)
end
