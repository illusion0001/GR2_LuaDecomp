dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("Vision")
_hand_dead = false
_zako_dead_cnt = 0
_swich_effect_request = false
_is_effect_created = false
_flag = nil
_eff_hdl = nil
_spawn_request = false
_enmgen_name = nil
_is_zako_spawned = false
_storm_se_hdl = {}
_storm_se_hdl_cnt = 0
_requestZakoAllKill = false
_cc_a_root_hdl = nil
_scene_param_name = nil
_request_tv = nil
_start_attrtune_check = false
_attrtune_check_task = nil
_tune_change_cnt = 0
enmgen2_com_hand = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_com_storm_01",
      name = "hand_01",
      ai_spawn_option = "Hand/hand_ep13"
    }
  },
  onSpawn = function(A0_0, A1_1)
  end,
  onObjectAsh = function(A0_2, A1_3)
    if A1_3:isInstance("EnemyBrain") then
      print("ASH = " .. A1_3:getName())
      findGameObject2("EnemyGenerator", "enmgen2_com_zako_01"):setAutoRevirthSwitch(false)
      _hand_dead = true
      print("COM\227\131\143\227\131\179\227\131\137\230\173\187\227\130\147\227\129\160\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
    end
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"hand_01"}, 1, 5)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyDeadNum = function(A0_9)
    local L1_10
    L1_10 = A0_9.enemyDeadNum
    return L1_10
  end,
  getEnemyName = function(A0_11, A1_12)
    local L2_13
    L2_13 = A0_11.spawnSet
    L2_13 = L2_13[A1_12]
    L2_13 = L2_13.name
    return L2_13
  end
}
enmgen2_com_zako_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_zako1_enm_01",
      name = "zako1_enm_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_zako1_enm_02",
      name = "zako1_enm_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_zako1_enm_03",
      name = "zako1_enm_03"
    },
    {
      type = "stalker_strong",
      locator = "locator_zako1_enm_04",
      name = "zako1_enm_04"
    },
    {
      type = "imp",
      locator = "locator_zako1_enm_05",
      name = "zako1_enm_05"
    }
  },
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onSpawn = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
    if A1_25:isInstance("EnemyBrain") then
      _zako_dead_cnt = _zako_dead_cnt + 1
      print("COM_zako_dead_count = ", _zako_dead_cnt)
      print(A1_25:getGizmo():getName())
    end
  end,
  onSetupGem = function(A0_26, A1_27)
    Fn_enemyPopGemSetup(A0_26, {
      "zako1_enm_01",
      "zako1_enm_02",
      "zako1_enm_03",
      "zako1_enm_04",
      "zako1_enm_05"
    }, 3, 5)
  end,
  onPopGem = function(A0_28, A1_29)
    Fn_enemyAshPopGem(A0_28, A1_29)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyDeadNum = function(A0_31)
    local L1_32
    L1_32 = A0_31.enemyDeadNum
    return L1_32
  end,
  getEnemyName = function(A0_33, A1_34)
    local L2_35
    L2_35 = A0_33.spawnSet
    L2_35 = L2_35[A1_34]
    L2_35 = L2_35.name
    return L2_35
  end
}
function Initialize()
  local L0_36, L1_37
end
function Ingame()
  local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44
  L0_38 = invokeTask
  function L1_39()
    while true do
      if _requestZakoAllKill then
        invokeTask(function()
          findGameObject2("EnemyGenerator", "enmgen2_com_zako_01"):setActive(false)
          wait()
          findGameObject2("EnemyGenerator", "enmgen2_com_zako_01"):requestAllEnemyKill()
          _requestZakoAllKill = false
        end)
      end
      wait()
    end
  end
  L0_38(L1_39)
  while true do
    L0_38 = _start_attrtune_check
    if L0_38 then
      L0_38 = print
      L1_39 = "\226\152\133_start_attrtune_check\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
      L0_38(L1_39)
      _start_attrtune_check = false
      L0_38 = Player
      L1_39 = L0_38
      L0_38 = L0_38.getAttrTune
      L0_38 = L0_38(L1_39)
      L1_39 = print
      L6_44 = L3_41(L4_42)
      L1_39(L2_40, L3_41, L4_42, L5_43, L6_44, L3_41(L4_42))
      L1_39 = invokeTask
      L1_39 = L1_39(L2_40)
      _attrtune_check_task = L1_39
    else
    end
    L0_38 = _swich_effect_request
    if L0_38 then
      _swich_effect_request = false
      L0_38 = _flag
      if L0_38 then
        L0_38 = findGameObject2
        L1_39 = "Node"
        L0_38 = L0_38(L1_39, L2_40)
        L1_39 = L0_38
        L0_38 = L0_38.getWorldPos
        L0_38 = L0_38(L1_39)
        L1_39 = L0_38.y
        L1_39 = L1_39 + 100
        L0_38.y = L1_39
        L1_39 = Fn_createEffect
        L5_43 = true
        L1_39 = L1_39(L2_40, L3_41, L4_42, L5_43)
        _eff_hdl = L1_39
        L1_39 = print
        L1_39(L2_40)
        _is_effect_created = true
      else
        L0_38 = _flag
        if L0_38 == false then
          L0_38 = _eff_hdl
          L1_39 = L0_38
          L0_38 = L0_38.kill
          L0_38(L1_39)
          _eff_hdl = nil
          L0_38 = print
          L1_39 = "\228\186\136\229\133\134\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136OFF\239\188\129\239\188\129\239\188\129"
          L0_38(L1_39)
        end
      end
    end
    L0_38 = _request_bg_scene
    if L0_38 == true then
      L0_38 = _cc_a_root_hdl
      if L0_38 == nil then
        L0_38 = Fn_findAreaHandle
        L1_39 = "cc_a_root"
        L0_38 = L0_38(L1_39)
        _cc_a_root_hdl = L0_38
        L0_38 = _cc_a_root_hdl
        if L0_38 then
          L0_38 = _cc_a_root_hdl
          L1_39 = L0_38
          L0_38 = L0_38.getSceneParametersName
          L0_38 = L0_38(L1_39)
          _scene_param_name = L0_38
          L0_38 = _cc_a_root_hdl
          L1_39 = L0_38
          L0_38 = L0_38.setSceneParameters
          L0_38(L1_39, L2_40)
          L0_38 = print
          L1_39 = "\226\152\133\227\130\183\227\131\188\227\131\179\227\131\145\227\131\169\239\188\154\233\157\158\229\184\184\228\186\139\230\133\139\227\129\184"
          L0_38(L1_39)
        end
      end
      _request_bg_scene = nil
    else
      L0_38 = _request_bg_scene
      if L0_38 == false then
        L0_38 = _cc_a_root_hdl
        if L0_38 then
          L0_38 = _cc_a_root_hdl
          L1_39 = L0_38
          L0_38 = L0_38.setSceneParameters
          L0_38(L1_39, L2_40)
          _cc_a_root_hdl = nil
          L0_38 = print
          L1_39 = "\226\152\133\227\130\183\227\131\188\227\131\179\227\131\145\227\131\169\239\188\154\233\128\154\229\184\184\227\129\184"
          L0_38(L1_39)
        end
        _request_bg_scene = nil
      end
    end
    L0_38 = _request_tv
    if L0_38 == true then
      L0_38 = VisionBg
      L1_39 = L0_38
      L0_38 = L0_38.globalTvScheduleName
      L0_38(L1_39, L2_40, L3_41)
      L0_38 = VisionBg
      L1_39 = L0_38
      L0_38 = L0_38.globalTvScheduleName
      L0_38(L1_39, L2_40, L3_41)
      L0_38 = print
      L1_39 = "\226\152\133\232\161\151\233\160\173TV\239\188\154\233\157\158\229\184\184\228\186\139\230\133\139\227\129\184"
      L0_38(L1_39)
      _request_tv = nil
    else
      L0_38 = _request_tv
      if L0_38 == false then
        L0_38 = VisionBg
        L1_39 = L0_38
        L0_38 = L0_38.globalTvScheduleName
        L5_43 = ggd
        L5_43 = L5_43.GlobalSystemFlags__TvScheduleHex
        L6_44 = L3_41(L4_42, L5_43)
        L0_38(L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L3_41(L4_42, L5_43))
        L0_38 = VisionBg
        L1_39 = L0_38
        L0_38 = L0_38.globalTvScheduleName
        L0_38(L1_39, L2_40, L3_41)
        L0_38 = print
        L1_39 = "\226\152\133\232\161\151\233\160\173TV\239\188\154\233\128\154\229\184\184\227\129\184"
        L0_38(L1_39)
        _request_tv = nil
      end
    end
    L0_38 = _spawn_request
    if L0_38 then
      _spawn_request = false
      L0_38 = {L1_39, L2_40}
      L1_39 = "enmgen2_com_hand"
      L1_39 = nil
      for L5_43, L6_44 in L2_40(L3_41) do
        L1_39 = findGameObject2("EnemyGenerator", L6_44)
        if L1_39 ~= nil then
          L1_39:requestSpawn()
          while not L1_39:isPrepared() do
            wait()
          end
        end
        print("COM\227\131\143\227\131\179\227\131\137\239\188\134\227\130\182\227\130\179\229\135\186\231\143\190", L6_44)
      end
      _storm_se_hdl_cnt = L2_40
      L5_43 = L4_42
      L6_44 = "amb_ep00_001"
      L2_40[L3_41] = L4_42
      L5_43 = _storm_se_hdl_cnt
      L2_40(L3_41, L4_42)
      _is_zako_spawned = true
    end
    L0_38 = wait
    L0_38()
  end
end
function Finalize()
  while _storm_se_hdl_cnt > 0 do
    if _storm_se_hdl[_storm_se_hdl_cnt] then
      Sound:stopSEHandle(_storm_se_hdl[_storm_se_hdl_cnt])
      print("COM\233\135\141\229\138\155\229\181\144SE finalize stop\239\188\129\239\188\129\239\188\129\239\188\129", _storm_se_hdl[_storm_se_hdl_cnt])
      _storm_se_hdl_cnt = _storm_se_hdl_cnt - 1
    end
  end
  if _cc_a_root_hdl then
    _cc_a_root_hdl:setSceneParameters(_scene_param_name)
    _cc_a_root_hdl = nil
    print("\226\152\133\227\130\183\227\131\188\227\131\179\227\131\145\227\131\169\239\188\154\233\128\154\229\184\184\227\129\184")
  end
end
function startAttrTuneCheck()
  local L1_45
  L1_45 = _attrtune_check_task
  if L1_45 == nil then
    _start_attrtune_check = true
  end
end
function getAttrTuneChangeCount()
  print("_tune_change_cnt =", _tune_change_cnt)
  return _tune_change_cnt
end
function abortAttrTuneCheckTask()
  print("AttrTuneCheckTask\239\188\154\227\130\162\227\131\156\227\131\188\227\131\136\239\188\134Nil\239\188\129\239\188\129\239\188\129")
  _attrtune_check_task = Mv_safeTaskAbort(_attrtune_check_task)
end
function swichEffect(A0_46)
  if _is_effect_created == false or A0_46 == false then
    _swich_effect_request = true
    _flag = A0_46
  end
end
function requestBgScene(A0_47)
  local L1_48
  _request_bg_scene = A0_47
end
function requestTv(A0_49)
  local L1_50
  _request_tv = A0_49
end
function comEnmSpawn()
  local L1_51
  L1_51 = _is_zako_spawned
  if L1_51 == false then
    _spawn_request = true
  end
end
function switchEnmAiMarker(A0_52, A1_53)
  if A1_53 == true then
    findGameObject2("EnemyGenerator", A0_52):requestIdlingEnemy(false)
    findGameObject2("EnemyGenerator", A0_52):setEnemyMarker(true)
    print("\227\130\168\227\131\141\227\131\159\227\131\188AI\239\188\134\227\131\158\227\131\188\227\130\171\227\131\188ON\239\188\129\239\188\129", A0_52)
  elseif A1_53 == false then
    findGameObject2("EnemyGenerator", A0_52):requestIdlingEnemy(true)
    findGameObject2("EnemyGenerator", A0_52):setEnemyMarker(false)
    print("\227\130\168\227\131\141\227\131\159\227\131\188AI\239\188\134\227\131\158\227\131\188\227\130\171\227\131\188OFF\239\188\129\239\188\129", A0_52)
  end
end
function switchIdlingEnemy(A0_54, A1_55)
  findGameObject2("EnemyGenerator", A0_54):requestIdlingEnemy(A1_55)
  print("\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154Idling", A0_54, A1_55)
end
function switchEnmMarker(A0_56, A1_57)
  findGameObject2("EnemyGenerator", A0_56):setEnemyMarker(A1_57)
  print("\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154setMarker", A0_56, A1_57)
end
function stopComStormSe()
  while not _storm_se_hdl_cnt == 0 do
    if _storm_se_hdl[_storm_se_hdl_cnt] then
      Sound:stopSEHandle(_storm_se_hdl[_storm_se_hdl_cnt])
    end
    _storm_se_hdl_cnt = _storm_se_hdl_cnt - 1
  end
  print("COM\233\135\141\229\138\155\229\181\144SE\229\129\156\230\173\162\239\188\129\239\188\129\239\188\129")
end
function gemActive(A0_58)
  local L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65
  L1_59 = {
    L2_60,
    L3_61,
    L4_62,
    L5_63,
    L6_64,
    L7_65
  }
  L2_60 = "gem2_vital_com_01"
  L6_64 = "gem2_vital_com_05"
  L7_65 = "gem2_energy_com_01"
  L2_60 = nil
  for L6_64, L7_65 in L3_61(L4_62) do
    L2_60 = findGameObject2("Gem", L7_65)
    if L2_60 ~= nil then
      L2_60:setActive(A0_58)
    end
  end
end
function getZakoDeadCnt()
  local L0_66, L1_67
  L0_66 = _zako_dead_cnt
  return L0_66
end
function resetZakoDeadCnt()
  local L0_68, L1_69
  _zako_dead_cnt = 0
end
function isHandDead()
  local L0_70, L1_71
  L0_70 = _hand_dead
  return L0_70
end
function zakoAllKill()
  local L0_72, L1_73
  _requestZakoAllKill = true
end
