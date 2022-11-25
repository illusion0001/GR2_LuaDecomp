dofile("/Game/Event2/Common/EventCommon.lua")
_time = 0
_core_break = {}
_wind_cap = 100
_breakcore_No = nil
_core_sel1 = false
_core_sel2 = false
_core_sel3 = false
sel_chk = false
_kitMotionTable = {
  motion1 = "kit01_down_a_00",
  motion2 = "kit01_down_b_00"
}
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01"
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
function Initialize()
  local L0_8, L1_9
  L0_8 = Player
  L1_9 = L0_8
  L0_8 = L0_8.muteVoice
  L0_8(L1_9, Player.kVoiceMuteLv_OnlyBreath)
  L0_8 = {
    L1_9,
    "g1_building_sf_16_01",
    "g1_building_pd_77_01",
    "g1_tree_yy_08_01",
    "g1_tree_yy_08_02",
    "g1_tree_yy_08_03",
    "g1_tree_yy_08_04",
    "g1_tree_yy_09_01",
    "g1_tree_yy_09_03",
    "g1_tree_yy_09_04",
    "g1_tree_yy_09_08",
    "g1_tree_yy_09_09",
    "g1_tree_pd_05_01",
    "g1_building_kk_33_01",
    "g1_building_kk_34_01"
  }
  L1_9 = "g1_building_sf_10_01"
  L1_9 = Fn_findGimmickBgInBgset
  L1_9 = L1_9(L0_8)
  for _FORV_5_, _FORV_6_ in ipairs(L1_9) do
    _FORV_6_:requestBrokenStart(false)
    print("\229\128\139\230\149\176")
  end
  Fn_loadPlayerMotion(_kitMotionTable)
  Player:setSituation(Player.kSituation_Normal, true, 0, true, false)
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21
  L0_10 = Fn_dtDemoObjectActive
  L1_11 = false
  L0_10(L1_11)
  L0_10 = Fn_lookAtObject
  L1_11 = "locator2_daemon_02"
  L2_12 = 0
  L0_10 = L0_10(L1_11, L2_12)
  L1_11 = Fn_playPlayerMotion
  L2_12 = _kitMotionTable
  L2_12 = L2_12.motion1
  L1_11(L2_12)
  L1_11 = Fn_sendEventComSb
  L2_12 = "requestIdling"
  L1_11(L2_12)
  while true do
    L1_11 = _demon_puppet
    if L1_11 == nil then
      L1_11 = Fn_sendEventComSb
      L2_12 = "boss_name"
      L1_11 = L1_11(L2_12)
      _demon_puppet = L1_11
      L1_11 = wait
      L1_11()
    end
  end
  L1_11 = _demon_puppet
  L2_12 = L1_11
  L1_11 = L1_11.getBrain
  L1_11 = L1_11(L2_12)
  L3_13 = L1_11
  L2_12 = L1_11.setVisibleEnemyMarker
  L4_14 = false
  L2_12(L3_13, L4_14)
  L2_12 = Player
  L3_13 = L2_12
  L2_12 = L2_12.setEnergy
  L4_14 = Player
  L4_14 = L4_14.kEnergy_Life
  L2_12(L3_13, L4_14, L5_15)
  L2_12 = invokeTask
  function L3_13()
    boss_gauge = HUD:createBossHpGauge({
      obj = _demon_puppet
    })
    boss_gauge:setActive(true)
    while _demon_puppet:isRunning() do
      demon_health = L1_11:getHealth()
      if demon_health < L1_11:getMaxHealth() * 0.303 then
        demon_health = L1_11:getMaxHealth() * 0.2889
      end
      boss_gauge:setHp((demon_health - L1_11:getMaxHealth() * 0.2867) / (L1_11:getMaxHealth() - L1_11:getMaxHealth() * 0.2867))
      wait()
    end
  end
  L2_12 = L2_12(L3_13)
  gauge_task = L2_12
  L2_12 = invokeTask
  function L3_13()
    repeat
      if Player:getLastFrameVelocityLength() > 50 and Player:getAction() ~= Player.kAction_AnyGravKick and Player:getAttrTune() ~= "Player.kAttrTune_Jupiter" and Player:isFeline() == false and _wind_cap_non == false then
        if _wind_cap >= 100 and _wind_cap < 200 then
          Fn_captionViewWait("ep26_00100")
          _wind_cap = 200
        elseif _wind_cap >= 300 then
          Fn_captionViewWait("ep26_00101")
          _wind_cap = 0
        end
        _wind_cap = _wind_cap + RandI(10, 40)
      end
      _wind_cap_non = false
      if Player:getAction() == Player.kAction_AnyGravKick then
        _wind_cap_non = true
      end
      wait()
    until false
  end
  L2_12 = L2_12(L3_13)
  _pc_dmg = L2_12
  function L2_12()
    Player:setStay(true, true)
    Fn_playPlayerMotionWait(_kitMotionTable.motion1)
  end
  L3_13 = Fn_missionStart
  L4_14 = L2_12
  L3_13(L4_14)
  L3_13 = waitSeconds
  L4_14 = 2.5
  L3_13(L4_14)
  L3_13 = Fn_playPlayerMotion
  L4_14 = _kitMotionTable
  L4_14 = L4_14.motion2
  L3_13(L4_14)
  L3_13 = waitSeconds
  L4_14 = 1.5
  L3_13(L4_14)
  if L0_10 ~= nil then
    L4_14 = L0_10
    L3_13 = L0_10.abort
    L3_13(L4_14)
    L0_10 = nil
  end
  L3_13 = Player
  L4_14 = L3_13
  L3_13 = L3_13.setStay
  L3_13(L4_14, L5_15)
  L3_13 = Player
  L4_14 = L3_13
  L3_13 = L3_13.setSituation
  L3_13(L4_14, L5_15, L6_16, L7_17, L8_18, L9_19)
  L3_13 = Fn_userCtrlOn
  L3_13()
  L3_13 = Fn_missionView
  L4_14 = "ep26_00104"
  L3_13(L4_14, L5_15)
  L3_13 = waitSeconds
  L4_14 = 1.5
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "requestunIdling"
  L3_13(L4_14)
  repeat
    L3_13 = wait
    L3_13()
    L3_13 = Fn_sendEventComSb
    L4_14 = "a_phase"
    L3_13 = L3_13(L4_14, L5_15)
  until L3_13 == true
  L3_13 = Fn_captionViewWait
  L4_14 = "ep26_00105"
  L3_13(L4_14)
  repeat
    L3_13 = wait
    L3_13()
    L3_13 = Fn_sendEventComSb
    L4_14 = "a_phase"
    L3_13 = L3_13(L4_14, L5_15)
  until L3_13 == true
  L3_13 = waitSeconds
  L4_14 = 2
  L3_13(L4_14)
  L3_13 = Fn_captionViewWait
  L4_14 = "ep26_00106"
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "selchk"
  L3_13(L4_14)
  repeat
    L3_13 = wait
    L3_13()
    L3_13 = Fn_sendEventComSb
    L4_14 = "a_phase"
    L3_13 = L3_13(L4_14, L5_15)
  until L3_13 == true
  L3_13 = Fn_captionViewWait
  L4_14 = "ep26_00107"
  L3_13(L4_14)
  repeat
    L3_13 = print
    L4_14 = "\239\188\146\229\155\158\231\155\174\227\131\171\227\131\188\227\131\151"
    L3_13(L4_14)
    L3_13 = wait
    L3_13()
    L3_13 = Fn_sendEventComSb
    L4_14 = "a_phase"
    L3_13 = L3_13(L4_14, L5_15)
  until L3_13 == true
  L3_13 = waitSeconds
  L4_14 = 1.5
  L3_13(L4_14)
  L3_13 = Fn_captionViewWait
  L4_14 = "ep26_00108"
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "selchk"
  L3_13(L4_14)
  repeat
    L3_13 = print
    L4_14 = "\239\188\147\229\155\158\231\155\174\227\131\171\227\131\188\227\131\151"
    L3_13(L4_14)
    L3_13 = wait
    L3_13()
    L3_13 = Fn_sendEventComSb
    L4_14 = "a_phase"
    L3_13 = L3_13(L4_14, L5_15)
  until L3_13 == true
  L3_13 = waitSeconds
  L4_14 = 6
  L3_13(L4_14)
  L3_13, L4_14 = nil, nil
  for L8_18 = 1, 3 do
    L10_20 = 1
    L11_21 = 12
    core_No = L9_19
    L10_20 = L9_19
    L11_21 = "loc_setCore"
    L11_21 = L11_21 .. string.format("%02d", core_No)
    L4_14 = L9_19
    L3_13 = L4_14
    L10_20 = RandF
    L11_21 = 0
    L10_20 = L10_20(L11_21, 10)
    L10_20 = 5 - L10_20
    L3_13.x = L9_19
    L10_20 = RandF
    L11_21 = 0
    L10_20 = L10_20(L11_21, 10)
    L10_20 = 5 - L10_20
    L3_13.y = L9_19
    L10_20 = RandF
    L11_21 = 0
    L10_20 = L10_20(L11_21, 10)
    L10_20 = 5 - L10_20
    L3_13.z = L9_19
    L10_20 = "exp"
    L11_21 = "ef_com_exp_01"
    L10_20 = Sound
    L11_21 = L10_20
    L10_20 = L10_20.playSE
    L10_20(L11_21, "ep26_cannon_exp", 1, "", L9_19)
    L10_20 = waitSeconds
    L11_21 = RandF
    L11_21 = L11_21(0.05, 0.2)
    L10_20(L11_21, L11_21(0.05, 0.2))
  end
  L5_15()
  if L6_16 ~= L7_17 then
    if L6_16 ~= L7_17 then
      L7_17(L8_18, L9_19)
    end
  end
  if L7_17 == false then
    _breakcore_No = 3
    L7_17(L8_18)
    L7_17(L8_18, L9_19)
  else
    repeat
      repeat
        _core_No = L7_17
        L7_17(L8_18)
        L7_17()
      until L7_17 == false
    until L7_17 ~= 10
    _breakcore_No = L7_17
    L7_17(L8_18, L9_19)
    L7_17(L8_18)
  end
  L7_17(L8_18)
  for L10_20 = 1, 15 do
    L11_21 = RandI
    L11_21 = L11_21(1, 12)
    core_No = L11_21
    L11_21 = _demon_puppet
    L11_21 = L11_21.getJointWorldTransform
    L11_21 = L11_21(L11_21, "loc_setCore" .. string.format("%02d", core_No))
    L4_14 = L11_21
    L3_13 = L4_14
    L11_21 = L4_14.x
    L11_21 = L11_21 + (5 - RandF(0, 10))
    L3_13.x = L11_21
    L11_21 = L4_14.y
    L11_21 = L11_21 + (5 - RandF(0, 10))
    L3_13.y = L11_21
    L11_21 = L4_14.z
    L11_21 = L11_21 + (5 - RandF(0, 10))
    L3_13.z = L11_21
    L11_21 = Fn_createEffect
    L11_21 = L11_21("exp", "ef_com_exp_01", L3_13, false)
    Fn_finishedTremEffect(L11_21, 2)
    Sound:playSE("ep26_cannon_exp", 1, "", L11_21)
    waitSeconds(RandF(0.05, 0.2))
  end
  L7_17(L8_18)
  L7_17()
  if L5_15 ~= nil then
    L7_17(L8_18)
  end
  L7_17(L8_18)
  L7_17(L8_18, L9_19)
  if L7_17 ~= nil then
    L7_17(L8_18)
    gauge_task = nil
  end
  L7_17()
  L7_17()
  L7_17()
  L7_17()
end
function Finalize()
  Player:muteVoice(Player.kVoiceMuteLv_NoMute)
end
function navi_on()
  local L0_22, L1_23
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
