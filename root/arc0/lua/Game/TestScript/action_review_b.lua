dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/TestScript/action_review_common.lua")
dofile("/Debug/ShortcutKey/user_test_stage.lua")
import("Camera")
import("Font")
__puppet_tbl = {}
__next_phase = false
__crate_cap_wait = 20
__enemy_cnt = 0
__time_cnt = 0
__gemtime_cnt = 0
__gemset = false
__ars_cat_warp = false
__ars_cat_warp_inrange = 1
enmgen2_battle_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_01",
      name = "specialb01"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_02",
      name = "specialb02"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_03",
      name = "specialb03"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_04",
      name = "specialb04"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_05",
      name = "specialb05"
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
enmgen2_battle_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_b_21",
      name = "specialb21"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_22",
      name = "specialb22"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_23",
      name = "specialb23"
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
enmgen2_battle_b_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mosquito",
      locator = "locator_ene_b_31",
      name = "specialb31"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_32",
      name = "specialb32"
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
enmgen2_battle_b_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_41",
      name = "specialb41"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_42",
      name = "specialb42"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_43",
      name = "specialb43"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_44",
      name = "specialb44"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_45",
      name = "specialb45"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_46",
      name = "specialb46"
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
  end
}
enmgen2_battle_b_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_51",
      name = "specialb51"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_52",
      name = "specialb52"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_53",
      name = "specialb53"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_54",
      name = "specialb54"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_55",
      name = "specialb55"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_56",
      name = "specialb56"
    }
  },
  onUpdate = function(A0_32)
    local L1_33
  end,
  onEnter = function(A0_34)
    local L1_35
  end,
  onLeave = function(A0_36)
    local L1_37
  end,
  onObjectDead = function(A0_38, A1_39)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_39)
  end
}
enmgen2_battle_b_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mosquito",
      locator = "locator_ene_b_61",
      name = "specialb61"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_62",
      name = "specialb62"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_63",
      name = "specialb63"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_47)
  end
}
function Initialize()
  Fn_setCatWarp(true)
  Fn_DebugShortcutKey_User_Test_Stage()
end
function Ingame()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53
  L0_48 = Debug
  L1_49 = L0_48
  L0_48 = L0_48.setSwitch
  L2_50 = {
    L3_51,
    L4_52,
    L5_53
  }
  L3_51 = "Development"
  L4_52 = "Console"
  L5_53 = "Script"
  L3_51 = true
  L0_48(L1_49, L2_50, L3_51)
  L0_48 = move_area_po_a_11
  L0_48()
  L0_48 = invokeTask
  function L1_49()
    while true do
      if __view_pos ~= nil then
        Camera:setViewControlTarget(__view_pos)
      end
      wait()
    end
  end
  L0_48(L1_49)
  L0_48 = {}
  i = 9
  L1_49 = i
  L2_50 = findGameObject2
  L3_51 = "Node"
  L4_52 = "pccubesensor2_tut_"
  L5_53 = string
  L5_53 = L5_53.format
  L5_53 = L5_53("%02d", i)
  L4_52 = L4_52 .. L5_53
  L2_50 = L2_50(L3_51, L4_52)
  L0_48[L1_49] = L2_50
  L1_49 = Fn_pcSensorOff
  L2_50 = "pccubesensor2_tut_09"
  L1_49(L2_50)
  L1_49 = findGameObject2
  L2_50 = "Node"
  L3_51 = "locator2_woman_04"
  L1_49 = L1_49(L2_50, L3_51)
  L2_50 = create_gem
  L3_51 = L1_49
  L4_52 = 5
  L2_50(L3_51, L4_52)
  L2_50 = Player
  L3_51 = L2_50
  L2_50 = L2_50.setEnergyInfinite
  L4_52 = Player
  L4_52 = L4_52.kEnergy_Gravity
  L5_53 = true
  L2_50(L3_51, L4_52, L5_53)
  L2_50 = HUD
  L3_51 = L2_50
  L2_50 = L2_50.grgDispReq_FadeOut
  L2_50(L3_51)
  L2_50 = Player
  L3_51 = L2_50
  L2_50 = L2_50.setEnergyInfinite
  L4_52 = Player
  L4_52 = L4_52.kEnergy_SpAttack
  L5_53 = true
  L2_50(L3_51, L4_52, L5_53)
  L2_50 = HUD
  L3_51 = L2_50
  L2_50 = L2_50.spgDispReq_FadeOut
  L2_50(L3_51)
  L2_50 = Player
  L3_51 = L2_50
  L2_50 = L2_50.setAbility
  L4_52 = Player
  L4_52 = L4_52.kAbility_AttrTuneSwitch
  L5_53 = false
  L2_50(L3_51, L4_52, L5_53)
  L2_50 = Player
  L3_51 = L2_50
  L2_50 = L2_50.setAbility
  L4_52 = Player
  L4_52 = L4_52.kAbility_SpAttack
  L5_53 = false
  L2_50(L3_51, L4_52, L5_53)
  L2_50 = Fn_setCheckPoint
  L3_51 = "locator2_pc_start_pos"
  L2_50(L3_51)
  L2_50 = Fn_missionStart
  L2_50()
  L2_50 = Fn_pcSensorOn
  L3_51 = "pccubesensor2_tut_09"
  L2_50(L3_51)
  L2_50 = NaviSet_Auto
  L3_51 = L0_48[9]
  L2_50(L3_51)
  L2_50 = findGameObject2
  L3_51 = "EnemyGenerator"
  L4_52 = "enmgen2_b_02"
  L2_50 = L2_50(L3_51, L4_52)
  if L2_50 ~= nil then
    __enemy_cnt = 3
    L4_52 = L2_50
    L3_51 = L2_50.requestSpawn
    L3_51(L4_52)
  end
  L3_51 = wait
  L4_52 = 4
  L3_51(L4_52)
  L4_52 = L2_50
  L3_51 = L2_50.requestIdlingEnemy
  L5_53 = true
  L3_51(L4_52, L5_53)
  L3_51 = waitPhace
  L3_51()
  __next_phase = false
  L4_52 = L2_50
  L3_51 = L2_50.requestIdlingEnemy
  L5_53 = false
  L3_51(L4_52, L5_53)
  L3_51 = Fn_disableCityBlockBgm
  L3_51()
  L3_51 = Fn_changeBgm
  L4_52 = "bgm23"
  L3_51(L4_52)
  L3_51 = Fn_captionView
  L4_52 = "ar_00740"
  L5_53 = 3
  L3_51(L4_52, L5_53, true)
  L3_51 = invokeTask
  function L4_52()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 3)
      wait()
    end
  end
  L3_51 = L3_51(L4_52)
  enemy_cnt = L3_51
  L3_51 = HUD
  L4_52 = L3_51
  L3_51 = L3_51.info
  L5_53 = {
    {
      T = "ar_00750",
      L = "mp4/info/action_review_1"
    }
  }
  L3_51(L4_52, L5_53)
  L3_51 = Fn_TutorialStartView
  L4_52 = {}
  L5_53 = {}
  L5_53.mission_target = "ar_00760"
  L4_52.view = L5_53
  L3_51(L4_52)
  L3_51 = Fn_tutorialCaption
  L4_52 = "gravitykick"
  L3_51(L4_52)
  while true do
    L3_51 = __enemy_cnt
    if L3_51 > 0 then
      L3_51 = waitSeconds
      L4_52 = 1
      L3_51(L4_52)
      L3_51 = __time_cnt
      L3_51 = L3_51 + 1
      __time_cnt = L3_51
      L3_51 = __gemtime_cnt
      L3_51 = L3_51 + 5
      L4_52 = __time_cnt
      if L3_51 <= L4_52 then
        __gemset = false
      end
      L3_51 = print
      L4_52 = "time"
      L5_53 = __time_cnt
      L4_52 = L4_52 .. L5_53
      L3_51(L4_52)
    end
  end
  L3_51 = Fn_tutorialCaptionKill
  L3_51()
  L3_51 = enemy_cnt
  L4_52 = L3_51
  L3_51 = L3_51.abort
  L3_51(L4_52)
  L3_51 = findGameObject2
  L4_52 = "Node"
  L5_53 = "locator2_aim_b1"
  L3_51 = L3_51(L4_52, L5_53)
  L5_53 = L3_51
  L4_52 = L3_51.getWorldPos
  L4_52 = L4_52(L5_53)
  __view_pos = L4_52
  L4_52 = findGameObject2
  L5_53 = "EnemyGenerator"
  L4_52 = L4_52(L5_53, "enmgen2_b_03")
  if L4_52 ~= nil then
    __enemy_cnt = 2
    L5_53 = L4_52.requestSpawn
    L5_53(L4_52)
  end
  L5_53 = Fn_captionView
  L5_53("ar_00770", 3, true)
  __view_pos = nil
  L5_53 = invokeTask
  L5_53 = L5_53(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 2)
      wait()
    end
  end)
  enemy_cnt = L5_53
  L5_53 = Fn_tutorialCaption
  L5_53("gravitykick")
  L5_53 = 0
  while __enemy_cnt > 1 and L5_53 <= 15 do
    L5_53 = L5_53 + 1
    print(L5_53)
    waitSeconds(1)
  end
  marskick_help = invokeTask(function()
    Fn_tutorialCaptionKill()
    Fn_captionView("ar_00780", 3, true)
    HUD:info({
      {
        T = "ar_00790",
        L = "action_review_01"
      }
    })
    Fn_tutorialCaption("marsgrav_kick")
    Player:setAbility(Player.kAbility_AttrTuneSwitch, true)
    pc_tune_mars_mode_wait()
    waitSeconds(1)
    HUD:info({
      {
        T = "ar_00800",
        L = "mp4/info/action_review_2"
      }
    })
  end)
  while __enemy_cnt > 0 do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  enemy_cnt:abort()
  if findGameObject2("EnemyGenerator", "enmgen2_b_06") ~= nil then
    __enemy_cnt = 3
    findGameObject2("EnemyGenerator", "enmgen2_b_06"):requestSpawn()
  end
  enemy_cnt = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 3)
      wait()
    end
  end)
  Fn_tutorialCaption("marsgrav_kick")
  while __enemy_cnt > 0 do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  Fn_tutorialCaptionKill()
  enemy_cnt:abort()
  marskick_help:abort()
  if findGameObject2("EnemyGenerator", "enmgen2_b_04") ~= nil then
    __enemy_cnt = 6
    findGameObject2("EnemyGenerator", "enmgen2_b_04"):requestSpawn()
  end
  __view_pos = findGameObject2("Node", "locator2_aim_b2"):getWorldPos()
  Fn_captionView("ar_00810", 3, true)
  __view_pos = nil
  HUD:info({
    {
      T = "ar_00815",
      L = "action_review_02"
    }
  })
  jupiterkick_help = invokeTask(function()
    Fn_tutorialCaption("jupiter")
    pc_tune_jupiter_mode_wait()
    waitSeconds(1)
    HUD:info({
      {
        T = "ar_00820",
        L = "mp4/info/action_review_3"
      }
    })
  end)
  enemy_cnt = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 6)
      wait()
    end
  end)
  while __enemy_cnt > 0 do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  Fn_tutorialCaptionKill()
  enemy_cnt:abort()
  __view_pos = findGameObject2("Node", "locator2_aim_b3"):getWorldPos()
  if findGameObject2("EnemyGenerator", "enmgen2_b_05") ~= nil then
    __enemy_cnt = 6
    findGameObject2("EnemyGenerator", "enmgen2_b_05"):requestSpawn()
  end
  Fn_captionView("ar_00830", 3, true)
  __view_pos = nil
  enemy_cnt = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 6)
      wait()
    end
  end)
  Fn_tutorialCaption("jupiter")
  while __enemy_cnt > 0 do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  enemy_cnt:abort()
  Fn_tutorialCaptionKill()
  if Player:getAttrTune() ~= Player.kAttrTune_Normal then
    Fn_userCtrlOff()
    Fn_captionView("ar_00840", 3, true)
    Player:setAbility(Player.kAbility_AttrTuneSwitch, true)
    Fn_captionView("ar_00850", 0, false)
    pc_tune_normal_mode_wait()
    Fn_userCtrlOn_NoHUD()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_54, L1_55
end
function pc_tune_mars_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Mars do
    wait()
  end
end
function pc_tune_jupiter_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Jupiter do
    wait()
  end
end
function pc_tune_normal_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Normal do
    wait()
  end
end
function pccubesensor2_tut_09_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_09")
  Fn_naviKill()
  __next_phase = true
end
function GemSetDisp(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62
  L2_58 = nil
  for L6_62 = 1, 9 do
    L2_58 = findGameObject2("Gem", "gem2_navi_0" .. A0_56 .. "_0" .. L6_62)
    if L2_58 ~= nil then
      L2_58:setVisible(A1_57)
    end
  end
end
function navi_on()
  local L0_63, L1_64
  __next_phase = true
end
function waitPhace()
  while not __next_phase do
    wait()
  end
  __next_phase = false
end
function NaviSet_Auto(A0_65, A1_66, A2_67)
  Fn_naviSet(A0_65)
  if A1_66 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_66)
    HUD:naviSetPochiDistanceDensity0(A2_67)
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
