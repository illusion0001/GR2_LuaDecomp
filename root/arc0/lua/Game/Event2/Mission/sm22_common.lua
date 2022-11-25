L0_0 = {}
L0_0.BLUE = 10
L0_0.SCREAM20 = 20
L0_0.YELLOW = 50
L0_0.SCREAM65 = 65
L0_0.RED = 80
L0_0.MAX = 100
L0_0.PLUS = 0.065
L0_0.PLUS02 = 0.025
L0_0.MINUS = 0.5
L0_0.MUL10 = 0.4
L0_0.MUL00 = 1
L0_0.MUL01 = 1.5
L0_0.MUL02 = 5
L0_0.SAFE_CAP = 0
L0_0.BLUE_CAP = 1
L0_0.SCREAM01_CAP = 2
L0_0.YELLOW_CAP = 3
L0_0.SCREAM02_CAP = 4
L0_0.RED_CAP = 5
FEAR_GAUGE = L0_0
L0_0 = {}
L0_0.man_stay = "man01_stay_01"
L0_0.mot_in = "scared_in_00"
L0_0.mot = "scared_00"
L0_0.mot_out = "scared_out_00"
L0_0.stay = "stay"
L0_0.surprise_00 = "man01_surprise_00"
L0_0.surprise_01 = "man01_surprise_01"
L0_0.nevy_in = "man01_scared_nevy_in_00"
L0_0.nevy = "man01_scared_nevy_00"
L0_0.nevy_out = "man01_scared_nevy_out_00"
L0_0.inform_00 = "man01_inform_nevy_00"
L0_0.run_afraid_00 = "man01_run_afraid_00"
L0_0.run_afraid_01 = "man01_run_afraid_01"
L0_0.turn_l = "man01_turn_l_00"
L0_0.turn_r = "man01_turn_r_00"
L0_0.man_talk = "man01_talk_01"
L0_0.sup_stay = "man01_surprise_00"
_MAN_MOT_LIST = L0_0
L0_0 = {}
L0_0.mot_in = "shock_in_00"
L0_0.mot = "shock_00"
L0_0.mot_out = "shock_out_00"
L0_0.stay = "stay"
L0_0.surprise_00 = "wom01_surprise_00"
L0_0.surprise_01 = "wom01_surprise_01"
L0_0.nevy_in = "wom01_scared_nevy_in_00"
L0_0.nevy = "wom01_scared_nevy_00"
L0_0.nevy_out = "wom01_scared_nevy_out_00"
L0_0.run_afraid_00 = "wom01_run_afraid_00"
L0_0.run_afraid_01 = "wom01_run_afraid_01"
L0_0.inform_00 = "wom01_inform_nevy_00"
L0_0.inform_01 = "wom01_inform_nevy_01"
L0_0.sup_stay = "wom01_surprise_00"
_WON_MOT_LIST = L0_0
L0_0 = {}
L0_0.mot_in = "cry_in_00"
L0_0.mot = "cry_00"
L0_0.mot_out = "cry_out_00"
L0_0.stay = "stay"
L0_0.surprise_00 = "chi01_surprise_00"
L0_0.surprise_01 = "chi01_surprise_01"
L0_0.nevy_in = "chi01_scared_nevy_in_00"
L0_0.nevy = "chi01_scared_nevy_00"
L0_0.nevy_out = "chi01_scared_nevy_out_00"
L0_0.run_afraid_00 = "chi01_run_afraid_00"
L0_0.sup_stay = "chi01_surprise_00"
_CHI_MOT_LIST = L0_0
L0_0 = {
  {
    name = "sm22_new_regime",
    scream = nil
  },
  {
    name = "sm22_old_regime",
    scream = "m23_936"
  },
  {
    name = "sm22_man_poor",
    scream = "m05_936"
  },
  {
    name = "sm22_man_middle_class",
    scream = "m06_936"
  },
  {name = "sm22_madam", scream = "w04_936"},
  {
    name = "sm22_citizen_man45",
    scream = "m07_936"
  },
  {
    name = "sm22_citizen_man32",
    scream = "m02_936"
  },
  {
    name = "sm22_citizen_man48",
    scream = "m04_936"
  },
  {
    name = "sm22_citizen_wom17",
    scream = "w07_936"
  },
  {
    name = "sm22_citizen_chi12",
    scream = "w09_936"
  }
}
_npc_name_list = L0_0
_fear_gauge = 0
_enemy_bonus = 1
_fear_cap = 0
_sound_task = nil
_scream_flag = false
function L0_0(A0_1, A1_2, A2_3, A3_4, A4_5)
  if A0_1 == true then
    if getFearGauge() >= FEAR_GAUGE.BLUE - 2 and getFearGauge() <= FEAR_GAUGE.BLUE and _fear_cap < FEAR_GAUGE.BLUE_CAP then
      print("\230\129\144\230\128\150\229\186\16610%")
      Fn_captionView(A1_2)
      _fear_cap = FEAR_GAUGE.BLUE_CAP
    elseif getFearGauge() >= FEAR_GAUGE.SCREAM20 - 2 and getFearGauge() <= FEAR_GAUGE.SCREAM20 and _fear_cap < FEAR_GAUGE.SCREAM01_CAP then
      print("\230\129\144\230\128\150\229\186\16620%+voice\229\134\141\231\148\159")
      playScream()
      _fear_cap = FEAR_GAUGE.SCREAM01_CAP
    elseif getFearGauge() >= FEAR_GAUGE.YELLOW - 2 and getFearGauge() <= FEAR_GAUGE.YELLOW and _fear_cap < FEAR_GAUGE.YELLOW_CAP then
      print("\230\129\144\230\128\150\229\186\16650%+voice\229\134\141\231\148\159")
      playScream()
      Fn_captionView(A2_3)
      _fear_cap = FEAR_GAUGE.YELLOW_CAP
    elseif getFearGauge() >= FEAR_GAUGE.SCREAM65 - 2 and getFearGauge() <= FEAR_GAUGE.SCREAM65 and _fear_cap < FEAR_GAUGE.SCREAM02_CAP then
      print("\230\129\144\230\128\150\229\186\16665%+voice\229\134\141\231\148\159")
      playScream()
      _fear_cap = FEAR_GAUGE.SCREAM02_CAP
    elseif getFearGauge() >= FEAR_GAUGE.RED - 2 and getFearGauge() <= FEAR_GAUGE.RED and _fear_cap < FEAR_GAUGE.RED_CAP then
      print("\230\129\144\230\128\150\229\186\16680%+voice\229\134\141\231\148\159")
      playScream()
      Fn_captionView(A3_4)
      _fear_cap = FEAR_GAUGE.RED_CAP
    else
      if getFearGauge() >= FEAR_GAUGE.MAX then
        playScream()
        Player:setStay(true)
        Fn_userCtrlAllOff()
        Fn_captionView(A4_5)
        return true
      else
      end
    end
  elseif _fear_cap == FEAR_GAUGE.RED_CAP and getFearGauge() <= FEAR_GAUGE.RED - 10 then
    _fear_cap = FEAR_GAUGE.YELLOW_CAP
  elseif _fear_cap == FEAR_GAUGE.YELLOW_CAP and getFearGauge() <= FEAR_GAUGE.YELLOW - 10 then
    _fear_cap = FEAR_GAUGE.BLUE_CAP
  elseif _fear_cap == FEAR_GAUGE.BLUE_CAP and getFearGauge() < FEAR_GAUGE.BLUE then
    _fear_cap = FEAR_GAUGE.SAFE_CAP
  end
  return false
end
npcFearFunc = L0_0
function L0_0()
  if _fear_gauge <= FEAR_GAUGE.MAX then
    _fear_gauge = _fear_gauge + FEAR_GAUGE.PLUS * _enemy_bonus
  end
  HUD:miniGaugeSetNum(_fear_gauge / FEAR_GAUGE.MAX)
end
incFearGauge = L0_0
function L0_0()
  if _fear_gauge > 0 then
    _fear_gauge = _fear_gauge - FEAR_GAUGE.MINUS
  end
  HUD:miniGaugeSetNum(_fear_gauge / FEAR_GAUGE.MAX)
end
decFearGauge = L0_0
function L0_0()
  local L0_6, L1_7
  L0_6 = _fear_gauge
  return L0_6
end
getFearGauge = L0_0
function L0_0()
  _fear_gauge = 0
  HUD:miniGaugeSetNum(_fear_gauge / FEAR_GAUGE.MAX)
end
clearFearGauge = L0_0
function L0_0()
  HUD:miniGaugeSetNum(_fear_gauge / FEAR_GAUGE.MAX)
end
updateFearGauge = L0_0
function L0_0()
  HUD:miniGaugeSetVisible(true)
  updateFearGauge()
  HUD:miniGaugeSetTextID("sm22_09000")
  HUD:miniGaugeSetType(HUD.kCountType_Up, 0.5)
end
setupFearGauge = L0_0
function L0_0()
  HUD:miniGaugeSetVisible(false)
  clearFearGauge()
end
stopFearGauge = L0_0
function L0_0(A0_8)
  local L1_9
  _enemy_bonus = A0_8
end
setGaugeEnemyBonus = L0_0
function L0_0()
  local L0_10, L1_11
  L0_10 = _enemy_bonus
  return L0_10
end
getGaugeEnemyBonus = L0_0
function L0_0()
  local L0_12
  _scream_flag = true
  L0_12 = Fn_get_shuffle_teble
  L0_12 = L0_12(_npc_name_list)
  _sound_task = invokeTask(function()
    randomWaitSecondsSound()
    for _FORV_3_, _FORV_4_ in pairs(L0_12) do
      if _FORV_4_.scream ~= nil and _scream_flag == true then
        Sound:playSE(_FORV_4_.scream, 1, "", _puppet_tbl[_FORV_4_.name])
      end
      randomWaitSecondsSound()
    end
  end)
end
playScream = L0_0
function L0_0()
  _sound_task = Mv_safeTaskAbort(_sound_task)
  _scream_flag = false
end
stopScream = L0_0
function L0_0()
  waitSeconds(({
    0.2,
    0.3,
    0.4,
    0.5,
    0.6
  })[math.random(1, 5)])
end
randomWaitSecondsShort = L0_0
function L0_0()
  waitSeconds(({
    0.4,
    0.6,
    0.8,
    1,
    1.2
  })[math.random(1, 5)])
end
randomWaitSeconds = L0_0
function L0_0()
  waitSeconds(({
    1,
    1.5,
    2,
    2.5,
    3,
    3.5,
    4,
    4.5,
    5,
    5.5
  })[math.random(1, 10)])
end
randomWaitSecondsLong = L0_0
function L0_0()
  waitSeconds(({
    0.4,
    0.8,
    1,
    1.2,
    1.5
  })[math.random(1, 5)])
end
randomWaitSecondsSound = L0_0
function L0_0()
  waitSeconds(({
    0.05,
    0.1,
    0.15,
    0.2,
    0.25
  })[math.random(1, 5)])
end
randomWaitSecondsMin = L0_0
