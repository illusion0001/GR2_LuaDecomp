dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("Vehicle")
ADD01_ZAKO_TIME = 20
ADD02_ZAKO_TIME = 45
REMIND_DEAD_CNT = 5
_cat_navi_view = false
_caption_flg = false
_caption_cnt = 0
_zako_dead_cnt = 0
_visible_flg = false
_sdemo = nil
enmgen2_add_zako_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 8,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_add_zako1_enm_01",
      name = "add_zako1_enm_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_add_zako1_enm_02",
      name = "add_zako1_enm_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_add_zako1_enm_03",
      name = "add_zako1_enm_03"
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
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    if A1_11:isInstance("EnemyBrain") then
      _zako_dead_cnt = _zako_dead_cnt + 1
      print("ADD__zako_dead_cnt = ", _zako_dead_cnt)
      print(A1_11:getGizmo():getName())
    end
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "add_zako1_enm_01",
      "add_zako1_enm_02",
      "add_zako1_enm_01"
    }, 3, 5)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  getEnemyName = function(A0_19, A1_20)
    local L2_21
    L2_21 = A0_19.spawnSet
    L2_21 = L2_21[A1_20]
    L2_21 = L2_21.name
    return L2_21
  end
}
enmgen2_add_zako_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 8,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_add_zako2_enm_01",
      name = "add_zako2_enm_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_add_zako2_enm_02",
      name = "add_zako2_enm_02"
    },
    {
      type = "imp",
      locator = "locator_add_zako2_enm_03",
      name = "add_zako2_enm_03"
    }
  },
  onUpdate = function(A0_22)
    local L1_23
  end,
  onEnter = function(A0_24)
    local L1_25
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onSpawn = function(A0_28, A1_29)
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
    if A1_33:isInstance("EnemyBrain") then
      _zako_dead_cnt = _zako_dead_cnt + 1
      print("ADD__zako_dead_cnt = ", _zako_dead_cnt)
      print(A1_33:getGizmo():getName())
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_34)
    return #A0_34.spawnSet
  end,
  getEnemyDeadNum = function(A0_35)
    local L1_36
    L1_36 = A0_35.enemyDeadNum
    return L1_36
  end,
  getEnemyName = function(A0_37, A1_38)
    local L2_39
    L2_39 = A0_37.spawnSet
    L2_39 = L2_39[A1_38]
    L2_39 = L2_39.name
    return L2_39
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_c_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_c_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_navi_kill_c_01")
  _sdemo_cut01 = SDemo.create("ep13_c_cut01")
  _sdemo_cut02 = SDemo.create("ep13_c_cut02")
end
function Ingame()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L0_40 = print
  L1_41 = "***********C\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139*****************"
  L0_40(L1_41)
  L0_40 = Fn_setCatWarp
  L1_41 = false
  L0_40(L1_41)
  L0_40 = Fn_pcSensorOn
  L1_41 = "pccubesensor2_catwarp_warning_c_01"
  L0_40(L1_41)
  L0_40 = Fn_pcSensorOn
  L1_41 = "pccubesensor2_catwarp_area_c_01"
  L0_40(L1_41)
  L0_40 = Fn_pcSensorOn
  L1_41 = "pccubesensor2_catwarp_navi_kill_c_01"
  L0_40(L1_41)
  L0_40 = Fn_setCatWarpCheckPoint
  L1_41 = "locator2_pc_catwarp_pos_c_01"
  L0_40(L1_41)
  L0_40 = findGameObject2
  L1_41 = "EnemyGenerator"
  L2_42 = "enmgen2_add_zako_01"
  L0_40 = L0_40(L1_41, L2_42)
  L1_41 = findGameObject2
  L2_42 = "EnemyGenerator"
  L3_43 = "enmgen2_add_zako_02"
  L1_41 = L1_41(L2_42, L3_43)
  L2_42 = Fn_sendEventComSb
  L3_43 = "gemActive"
  L4_44 = true
  L2_42(L3_43, L4_44)
  L2_42 = Fn_sendEventComSb
  L3_43 = "comEnmSpawn"
  L2_42(L3_43)
  L2_42 = Fn_sendEventComSb
  L3_43 = "requestBgScene"
  L4_44 = true
  L2_42(L3_43, L4_44)
  L2_42 = Fn_sendEventComSb
  L3_43 = "requestTv"
  L4_44 = true
  L2_42(L3_43, L4_44)
  L2_42 = Fn_sendEventComSb
  L3_43 = "startAttrTuneCheck"
  L2_42(L3_43)
  L2_42 = Fn_setBgmPoint
  L3_43 = "battle"
  L2_42(L3_43)
  L2_42 = Fn_missionStart
  L2_42()
  L2_42 = Mob
  L3_43 = L2_42
  L2_42 = L2_42.makeSituationPanic
  L4_44 = true
  L2_42(L3_43, L4_44)
  L2_42 = Vehicle
  L3_43 = L2_42
  L2_42 = L2_42.SetPanic
  L4_44 = true
  L5_45 = findGameObject2
  L6_46 = "Node"
  L7_47 = "locator2_hand"
  L5_45 = L5_45(L6_46, L7_47)
  L6_46 = L5_45
  L5_45 = L5_45.getWorldPos
  L8_48 = L5_45(L6_46)
  L2_42(L3_43, L4_44, L5_45, L6_46, L7_47, L8_48, L5_45(L6_46))
  L2_42 = Area
  L3_43 = L2_42
  L2_42 = L2_42.gravityStorm
  L4_44 = Vector
  L5_45 = 36
  L6_46 = 33
  L7_47 = 385
  L4_44 = L4_44(L5_45, L6_46, L7_47)
  L5_45 = 200
  L2_42(L3_43, L4_44, L5_45)
  L2_42 = Player
  L3_43 = L2_42
  L2_42 = L2_42.setStay
  L4_44 = false
  L2_42(L3_43, L4_44)
  L2_42 = Fn_userCtrlOn
  L2_42()
  L2_42 = Fn_captionViewWait
  L3_43 = "ep13_02002"
  L2_42(L3_43)
  L2_42 = Fn_missionView
  L3_43 = "ep13_02003"
  L2_42(L3_43)
  L2_42 = Fn_sendEventComSb
  L3_43 = "switchEnmMarker"
  L4_44 = "enmgen2_com_hand"
  L5_45 = true
  L2_42(L3_43, L4_44, L5_45)
  L2_42 = Fn_sendEventComSb
  L3_43 = "switchEnmAiMarker"
  L4_44 = "enmgen2_com_zako_01"
  L5_45 = true
  L2_42(L3_43, L4_44, L5_45)
  L2_42 = nil
  L3_43 = 0
  L4_44 = false
  L5_45 = false
  L6_46 = invokeTask
  function L7_47()
    while true do
      if L3_43 == ADD01_ZAKO_TIME then
        L0_40:requestSpawn()
        print("\232\191\189\229\138\160\227\130\182\227\130\179\239\188\145\229\135\186\231\143\190")
        Fn_captionView("ep13_02004")
      elseif L3_43 == ADD02_ZAKO_TIME then
        L1_41:requestSpawn()
        print("\232\191\189\229\138\160\227\130\182\227\130\179\239\188\146\229\135\186\231\143\190")
        L4_44 = true
      end
      if _zako_dead_cnt + Fn_sendEventComSb("getZakoDeadCnt") >= 10 then
        L4_44 = true
      end
      if L5_45 == false and L4_44 then
        L5_45 = true
        Fn_captionView("ep13_02005")
        waitSeconds(2)
        print("\227\131\147\227\131\165\227\131\188\227\130\179\227\131\179\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
        L2_42 = Mv_viewObjWait("locator2_sdemo_hand_aim_01", 0.5)
        waitSeconds(1)
        L2_42 = Mv_safeTaskAbort(L2_42)
        Player:setStay(true)
        Fn_userCtrlAllOff()
        print("\227\130\182\227\130\179\230\146\131\231\160\180\231\183\143\230\149\176\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129\239\188\129\239\188\129\239\188\129")
        _zako_dead_cnt = 0
        Fn_sendEventComSb("resetZakoDeadCnt")
        print("_zako_dead_cnt + getZakoDeadCnt = ", _zako_dead_cnt + Fn_sendEventComSb("getZakoDeadCnt"))
        Fn_sendEventComSb("switchEnmMarker", "enmgen2_com_hand", false)
        Fn_sendEventComSb("switchEnmAiMarker", "enmgen2_com_zako_01", false)
        L0_40:requestIdlingEnemy(true)
        L0_40:setEnemyMarker(false)
        L1_41:requestIdlingEnemy(true)
        L1_41:setEnemyMarker(false)
        _sdemo_cut02:switchCamera(true, 1.5)
        _sdemo_cut02:set("locator2_sdemo_hand_cam_01", "locator2_sdemo_hand_aim_01", false)
        _sdemo_cut02:play()
        Fn_setKittenAndCatActive(false)
        Fn_setCatActive(false)
        print("\227\131\135\227\131\144\227\131\131\227\130\176\239\188\154\227\131\143\227\131\179\227\131\137\227\129\140\231\153\187\229\160\180\227\129\153\227\130\139\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\131\135\227\131\162")
        waitSeconds(3)
        Fn_kaiwaDemoView("ep13_00140k")
        Fn_setKittenAndCatActive(true)
        Fn_setCatActive(true)
        _sdemo_cut02:stop(2)
        Player:setStay(false)
        Fn_userCtrlOn()
        Fn_sendEventComSb("switchEnmMarker", "enmgen2_com_hand", true)
        Fn_sendEventComSb("switchEnmAiMarker", "enmgen2_com_zako_01", true)
        L0_40:requestIdlingEnemy(false)
        L0_40:setEnemyMarker(true)
        L1_41:requestIdlingEnemy(false)
        L1_41:setEnemyMarker(true)
        Fn_missionView("ep13_02008")
      end
      if L5_45 and _zako_dead_cnt + Fn_sendEventComSb("getZakoDeadCnt") ~= 0 and (_zako_dead_cnt + Fn_sendEventComSb("getZakoDeadCnt")) % REMIND_DEAD_CNT == 0 then
        print("\227\131\143\227\131\179\227\131\137\229\128\146\227\129\155\227\129\168\229\134\141\232\161\168\231\164\186\229\135\166\231\144\134")
        print("\227\130\182\227\130\179\230\146\131\231\160\180\231\183\143\230\149\176\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129\239\188\129\239\188\129\239\188\129")
        _zako_dead_cnt = 0
        Fn_sendEventComSb("resetZakoDeadCnt")
        Fn_captionViewWait("ep13_02009")
        Fn_missionView("ep13_02008")
      end
      waitSeconds(1)
      L3_43 = L3_43 + 1
    end
  end
  L6_46 = L6_46(L7_47)
  while true do
    L7_47 = Fn_sendEventComSb
    L8_48 = "isHandDead"
    L7_47 = L7_47(L8_48)
    if L7_47 then
      L7_47 = Mv_safeTaskAbort
      L8_48 = L6_46
      L7_47 = L7_47(L8_48)
      L6_46 = L7_47
      L7_47 = Mv_safeTaskAbort
      L8_48 = L2_42
      L7_47 = L7_47(L8_48)
      L2_42 = L7_47
      break
    end
    L7_47 = wait
    L7_47()
  end
  L7_47 = print
  L8_48 = "\227\131\143\227\131\179\227\131\137\227\129\168\227\129\174\227\131\144\227\131\136\227\131\171\231\181\130\228\186\134\239\188\129\239\188\129\239\188\129"
  L7_47(L8_48)
  L7_47 = Fn_sendEventComSb
  L8_48 = "stopComStormSe"
  L7_47(L8_48)
  L7_47 = Fn_captionViewEnd
  L7_47()
  L7_47 = Fn_naviKill
  L7_47()
  L7_47 = Fn_pcSensorOff
  L8_48 = "pccubesensor2_catwarp_warning_c_01"
  L7_47(L8_48)
  L7_47 = Fn_pcSensorOff
  L8_48 = "pccubesensor2_catwarp_area_c_01"
  L7_47(L8_48)
  L7_47 = Fn_pcSensorOff
  L8_48 = "pccubesensor2_catwarp_navi_kill_c_01"
  L7_47(L8_48)
  L7_47 = Fn_sendEventComSb
  L8_48 = "switchEnmAiMarker"
  L7_47(L8_48, "enmgen2_com_zako_01", false)
  L8_48 = L0_40
  L7_47 = L0_40.setAutoRevirthSwitch
  L7_47(L8_48, false)
  L8_48 = L0_40
  L7_47 = L0_40.requestIdlingEnemy
  L7_47(L8_48, true)
  L8_48 = L0_40
  L7_47 = L0_40.setEnemyMarker
  L7_47(L8_48, false)
  L8_48 = L1_41
  L7_47 = L1_41.setAutoRevirthSwitch
  L7_47(L8_48, false)
  L8_48 = L1_41
  L7_47 = L1_41.requestIdlingEnemy
  L7_47(L8_48, true)
  L8_48 = L1_41
  L7_47 = L1_41.setEnemyMarker
  L7_47(L8_48, false)
  L7_47 = waitSeconds
  L8_48 = 1
  L7_47(L8_48)
  L7_47 = Sound
  L8_48 = L7_47
  L7_47 = L7_47.pulse
  L7_47(L8_48, "ep13_announcement2")
  L7_47 = findGameObject2
  L8_48 = "Node"
  L7_47 = L7_47(L8_48, "locator2_haze_01")
  L8_48 = Fn_createEffect
  L8_48("haze", "ef_ev_bkzan_01", L7_47, true)
  L8_48 = print
  L8_48("Effect play ( n\194\180\226\136\128\239\189\128)n\227\130\156*:.\227\128\130.:*")
  L8_48 = waitSeconds
  L8_48(2)
  L8_48 = Player
  L8_48 = L8_48.setStay
  L8_48(L8_48, true)
  L8_48 = Fn_userCtrlAllOff
  L8_48()
  L8_48 = Fn_captionView
  L8_48("ep13_02007")
  L8_48 = Mv_viewObjWait
  L8_48 = L8_48("locator2_haze_01")
  waitSeconds(2)
  L8_48 = Mv_safeTaskAbort(L8_48)
  waitSeconds(3)
  Fn_sendEventComSb("zakoAllKill")
  wait()
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Area:gravityStorm()
  Mob:makeSituationPanic(false)
  Vehicle:SetPanic(false)
end
function pccubesensor2_catwarp_warning_c_01_OnLeave()
  invokeTask(function()
    if Player:isGravityControlMode() or Player:getAction() == Player.kAction_Jump then
      Player:setStay(true)
    end
    Fn_naviSet(findGameObject2("Node", "locator2_fountain"))
    _cat_navi_view = true
    Fn_captionViewWait("ep13_02010")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_c_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_c_01_OnEnter()
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
