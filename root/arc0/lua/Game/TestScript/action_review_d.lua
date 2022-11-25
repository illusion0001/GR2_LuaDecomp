import("Font")
import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/TestScript/action_review_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Debug/ShortcutKey/user_test_stage.lua")
__puppet_tbl = {}
__next_phase = false
__crate_cap_wait = 20
__enemy_cnt = 0
__view_pos = nil
__crow_puppet = nil
__offset = 0
__life = 0
__time_cnt = 0
__gemtime_cnt = 0
__gemset = false
__ars_cat_warp = false
__ars_cat_warp_inrange = 1
enmgen2_battle_d_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_d_01",
      name = "speciald01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_02",
      name = "speciald02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_04",
      name = "speciald04"
    },
    {
      type = "runner",
      locator = "locator_ene_d_05",
      name = "speciald05"
    },
    {
      type = "runner",
      locator = "locator_ene_d_06",
      name = "speciald06"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_07",
      name = "speciald07"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_08",
      name = "speciald08"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_09",
      name = "speciald09"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_010",
      name = "speciald010"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_011",
      name = "speciald011"
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
    lowlife_gemset(A1_7)
  end
}
enmgen2_battle_d_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_21",
      name = "speciald21"
    },
    {
      type = "mechsmall",
      locator = "locator_ene_d_22",
      name = "speciald22"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_23",
      name = "speciald23"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_24",
      name = "speciald24"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_25",
      name = "speciald25"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_26",
      name = "speciald26"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_27",
      name = "speciald27"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_28",
      name = "speciald28"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_29",
      name = "speciald29"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_30",
      name = "speciald30"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_311",
      name = "speciald311"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_312",
      name = "speciald312"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_313",
      name = "speciald313"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_314",
      name = "speciald314"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_315",
      name = "speciald315"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_316",
      name = "speciald316"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_317",
      name = "speciald317"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_318",
      name = "speciald318"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_319",
      name = "speciald319"
    },
    {
      type = "officer_rifle",
      locator = "locator_ene_d_22",
      name = "speciald320",
      target_vehicle = "speciald22"
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
  onObjectAsh = function(A0_14, A1_15)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_15)
  end
}
enmgen2_battle_d_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_31",
      name = "speciald31"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_32",
      name = "speciald32"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_33",
      name = "speciald33"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_34",
      name = "speciald34"
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
enmgen2_battle_d_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_41",
      name = "speciald41"
    },
    {
      type = "runner",
      locator = "locator_ene_d_42",
      name = "speciald42"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_43",
      name = "speciald43"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_44",
      name = "speciald44"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_46",
      name = "speciald46"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_47",
      name = "speciald47"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_48",
      name = "speciald48"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_49",
      name = "speciald49"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_31)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_32, L1_33
    L0_32 = enmgen2_area_05
    L0_32 = L0_32.spawnSet
    L0_32 = #L0_32
    return L0_32
  end,
  getEnemyDeadNum = function()
    local L1_34
    L1_34 = enmgen2_area_05
    L1_34 = L1_34.enemyDeadNum
    return L1_34
  end,
  getEnemyName = function(A0_35)
    local L1_36
    L1_36 = enmgen2_area_05
    L1_36 = L1_36.spawnSet
    L1_36 = L1_36[A0_35]
    L1_36 = L1_36.name
    return L1_36
  end
}
enmgen2_battle_d_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_51",
      name = "speciald51"
    },
    {
      type = "giant",
      locator = "locator_ene_d_52",
      name = "speciald52"
    },
    {
      type = "guardcore",
      locator = "locator_ene_d_53",
      name = "speciald53"
    },
    {
      type = "guardcore",
      locator = "locator_ene_d_54",
      name = "speciald54"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_55",
      name = "speciald55"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_56",
      name = "speciald56"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_57",
      name = "speciald57"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_58",
      name = "speciald58"
    },
    {
      type = "runner",
      locator = "locator_ene_d_59",
      name = "speciald59"
    },
    {
      type = "runner",
      locator = "locator_ene_d_60",
      name = "speciald60"
    },
    {
      type = "runner",
      locator = "locator_ene_d_61",
      name = "speciald61"
    },
    {
      type = "runner",
      locator = "locator_ene_d_62",
      name = "speciald62"
    }
  },
  onUpdate = function(A0_37)
    local L1_38
  end,
  onEnter = function(A0_39)
    local L1_40
  end,
  onLeave = function(A0_41)
    local L1_42
  end,
  onObjectAsh = function(A0_43, A1_44)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_44)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_45, L1_46
    L0_45 = enmgen2_area_05
    L0_45 = L0_45.spawnSet
    L0_45 = #L0_45
    return L0_45
  end,
  getEnemyDeadNum = function()
    local L1_47
    L1_47 = enmgen2_area_05
    L1_47 = L1_47.enemyDeadNum
    return L1_47
  end,
  getEnemyName = function(A0_48)
    local L1_49
    L1_49 = enmgen2_area_05
    L1_49 = L1_49.spawnSet
    L1_49 = L1_49[A0_48]
    L1_49 = L1_49.name
    return L1_49
  end
}
function Initialize()
  Fn_setCatWarp(true)
  Fn_DebugShortcutKey_User_Test_Stage()
end
function Ingame()
  local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63, L14_64
  L0_50 = Debug
  L0_50 = L0_50.setSwitch
  L4_54 = "Console"
  L0_50(L1_51, L2_52, L3_53)
  L0_50 = invokeTask
  L0_50(L1_51)
  L0_50 = {}
  L4_54 = "woodbox_kk_01"
  L10_60 = "woodbox_kk_01"
  L14_64 = "woodbox_kk_01"
  L0_50[1] = L1_51
  for L4_54 = 11, 25 do
    for L8_58 = 0, 2 do
      L10_60 = "po_a_04"
      L9_59(L10_60, L11_61, L12_62)
    end
  end
  i = 12
  L4_54 = "Node"
  L1_51[L2_52] = L3_53
  L4_54 = "enmgen2_d_01"
  if L2_52 ~= nil then
    __enemy_cnt = 10
    L4_54 = L2_52
    L3_53(L4_54)
  end
  L4_54 = "Node"
  L4_54 = create_gem
  L4_54(L5_55, L6_56)
  L4_54 = Player
  L4_54 = L4_54.setEnergyInfinite
  L4_54(L5_55, L6_56, L7_57)
  L4_54 = HUD
  L4_54 = L4_54.grgDispReq_FadeOut
  L4_54(L5_55)
  L4_54 = Player
  L4_54 = L4_54.setEnergyInfinite
  L4_54(L5_55, L6_56, L7_57)
  L4_54 = HUD
  L4_54 = L4_54.spgDispReq_FadeOut
  L4_54(L5_55)
  L4_54 = Player
  L4_54 = L4_54.setAbility
  L4_54(L5_55, L6_56, L7_57)
  L4_54 = Fn_setCheckPoint
  L4_54(L5_55)
  L4_54 = Fn_missionStart
  L4_54()
  L4_54 = NaviSet_Auto
  L4_54(L5_55)
  L4_54 = waitPhace
  L4_54()
  L4_54 = Fn_disableCityBlockBgm
  L4_54()
  L4_54 = Fn_changeBgm
  L4_54(L5_55)
  L4_54 = Fn_captionView
  L4_54(L5_55, L6_56, L7_57)
  L4_54 = Fn_TutorialStartView
  L6_56.mission_target = "ar_01010"
  L5_55.view = L6_56
  L4_54(L5_55)
  L4_54 = Fn_naviKill
  L4_54()
  L4_54 = Fn_captionView
  L4_54(L5_55, L6_56, L7_57)
  L4_54 = invokeTask
  L4_54 = L4_54(L5_55)
  enemy_cnt = L4_54
  L4_54 = 0
  while true do
    if L7_57 > 0 then
      L4_54 = L4_54 + 1
      L7_57(L8_58)
      __time_cnt = L7_57
      if L7_57 <= L8_58 then
        __gemset = false
      end
      if L5_55 < L4_54 and L6_56 <= 4 then
        __offset = L7_57
        for L10_60 = 11, 25 do
          L14_64 = L10_60
          L14_64 = L0_50[1]
          L14_64 = L14_64[L10_60 - 10]
          L11_61(L12_62, L13_63, L14_64)
        end
        L4_54 = 0
        L7_57(L8_58)
        L7_57(L8_58)
      end
    end
  end
  L7_57(L8_58)
  if L7_57 ~= nil then
    __enemy_cnt = 20
    L8_58(L9_59)
  end
  L10_60 = 3
  L8_58(L9_59, L10_60, L11_61)
  enemy_cnt = L8_58
  L10_60 = 0
  while true do
    if L11_61 > 0 then
      L11_61(L12_62)
      __time_cnt = L11_61
      if L11_61 <= L12_62 then
        __gemset = false
      end
      if L9_59 < L8_58 and L10_60 <= 4 then
        __offset = L11_61
        for L14_64 = 11, 25 do
          create_boxset("po_a_04", "locator2_box_" .. L14_64, L0_50[1][L14_64 - 10])
        end
        L10_60 = L10_60 + 1
        L11_61(L12_62)
        L11_61(L12_62)
      end
    end
  end
  L11_61(L12_62)
  L11_61()
  L11_61()
  L11_61()
  L11_61()
end
function Finalize()
  local L0_65, L1_66
end
function navi_on()
  local L0_67, L1_68
  __next_phase = true
end
function waitPhace()
  while not __next_phase do
    wait()
  end
  __next_phase = falsed
end
function NaviSet_Auto(A0_69, A1_70, A2_71)
  Fn_naviSet(A0_69)
  if A1_70 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_70)
    HUD:naviSetPochiDistanceDensity0(A2_71)
  end
  Sound:pulse("navi_set")
end
function pccubesensor2_tut_12_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_12")
  Fn_naviKill()
  navi_on()
end
