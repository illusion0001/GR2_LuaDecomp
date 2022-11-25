dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm22_common.lua")
_enemy_hdl_tbl = {}
_puppet_tbl = {}
_is_area_distant = false
_old_regim_sensor_touch = false
_citizens_sensor = nil
_is_citizens_sensor_enter = false
_is_citizens_sensor_leave = false
_is_already_motion = false
enemy_table = {
  "sm22_enemy_c_d_01",
  "sm22_enemy_c_d_02",
  "sm22_enemy_c_d_03"
}
ENEMY_NEAR_DIST01 = 20
ENEMY_NEAR_DIST02 = 5
function Initialize()
  local L0_0, L1_1
  L1_1.name = "sm22_new_regime"
  L1_1.type = "man57"
  L1_1.node = "locator2_new_regime_d"
  L1_1.recast = false
  L1_1.attach = false
  L1_1.color_variation = 1
  L1_1.reset = false
  chara_table = L0_0
  L0_0(L1_1)
  for _FORV_3_, _FORV_4_ in L0_0(L1_1) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
  end
  L0_0(L1_1)
  L0_0(L1_1)
  L1_1(L0_0, 1)
  L1_1(L0_0, "Puppet")
  L1_1("cubesensor2_citizens_d")
  L1_1(L1_1, L0_0, true)
  L1_1:setFilterType("Puppet")
  Fn_sensorOff("cubesensor2_old_regime")
  _puppet_tbl.sm22_old_regime:appendChild(L1_1, true)
  _sdemo_cut01 = SDemo.create("sm22_d_cut01")
  _sdemo_cut02 = SDemo.create("sm22_d_cut02")
  _sdemo_cut03 = SDemo.create("sm22_d_cut03")
  _sdemo_cut04 = SDemo.create("sm22_d_cut04")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16
  L0_2 = Mob
  L0_2 = L0_2.makeSituationPanic
  L0_2(L1_3, L2_4)
  L0_2 = Fn_sendEventComSb
  L0_2 = L0_2(L1_3)
  if not L0_2 then
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
    while true do
      L0_2 = Fn_sendEventComSb
      L0_2 = L0_2(L1_3)
      if L0_2 then
        L0_2 = wait
        L0_2()
      end
    end
    _is_already_motion = true
    L0_2 = waitSeconds
    L0_2(L1_3)
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
    while true do
      L0_2 = Fn_sendEventComSb
      L0_2 = L0_2(L1_3)
      if L0_2 then
        L0_2 = wait
        L0_2()
      end
    end
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
    while true do
      L0_2 = Fn_sendEventComSb
      L0_2 = L0_2(L1_3)
      if L0_2 then
        L0_2 = wait
        L0_2()
      end
    end
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
    L0_2 = Fn_sendEventComSb
    L0_2(L1_3, L2_4)
  end
  L0_2 = {
    L1_3,
    L2_4,
    L3_5,
    L4_6,
    L5_7,
    L6_8,
    L7_9,
    L8_10,
    L9_11,
    L10_12
  }
  L1_3.name = "sm22_new_regime"
  L1_3.type = "man"
  L2_4.name = "sm22_old_regime"
  L2_4.type = "man"
  L3_5.name = "sm22_man_poor"
  L3_5.type = "man"
  L4_6 = {}
  L4_6.name = "sm22_man_middle_class"
  L4_6.type = "man"
  L5_7 = {}
  L5_7.name = "sm22_madam"
  L5_7.type = "wom"
  L6_8 = {}
  L6_8.name = "sm22_citizen_man45"
  L6_8.type = "man"
  L7_9 = {}
  L7_9.name = "sm22_citizen_man32"
  L7_9.type = "man"
  L8_10 = {}
  L8_10.name = "sm22_citizen_man48"
  L8_10.type = "man"
  L9_11 = {}
  L9_11.name = "sm22_citizen_wom17"
  L9_11.type = "wom"
  L10_12.name = "sm22_citizen_chi12"
  L10_12.type = "chi"
  L1_3.mot_in = "scared_in_00"
  L1_3.mot = "scared_00"
  L1_3.mot_out = "scared_out_00"
  L1_3.stay = "stay"
  L1_3.surprise = "man01_surprise_01"
  L1_3.nevy_in = "man01_scared_nevy_in_00"
  L1_3.nevy = "man01_scared_nevy_00"
  L1_3.nevy_out = "man01_scared_nevy_out_00"
  man_mot_list = L1_3
  L1_3.mot_in = "shock_in_00"
  L1_3.mot = "shock_00"
  L1_3.mot_out = "shock_out_00"
  L1_3.stay = "stay"
  L1_3.surprise = "wom01_surprise_01"
  L1_3.nevy_in = "wom01_scared_nevy_in_00"
  L1_3.nevy = "wom01_scared_nevy_00"
  L1_3.nevy_out = "wom01_scared_nevy_out_00"
  wom_mot_list = L1_3
  L1_3.mot_in = "cry_in_00"
  L1_3.mot = "cry_00"
  L1_3.mot_out = "cry_out_00"
  L1_3.stay = "stay"
  L1_3.surprise = "man01_surprise_00"
  L1_3.nevy_in = "chi01_scared_nevy_in_00"
  L1_3.nevy = "chi01_scared_nevy_00"
  L1_3.nevy_out = "chi01_scared_nevy_out_00"
  chi_mot_list = L1_3
  L1_3.run_afr_00 = "man01_run_afraid_00"
  L1_3.run_afr_01 = "man01_run_afraid_01"
  npc_run_afraid_list = L1_3
  for L4_6, L5_7 in L1_3(L2_4) do
    L6_8 = L5_7.type
    if L6_8 == "man" then
      L6_8 = Fn_loadNpcEventMotion
      L7_9 = L5_7.name
      L8_10 = man_mot_list
      L6_8(L7_9, L8_10)
    else
      L6_8 = L5_7.type
      if L6_8 == "wom" then
        L6_8 = Fn_loadNpcEventMotion
        L7_9 = L5_7.name
        L8_10 = wom_mot_list
        L6_8(L7_9, L8_10)
      else
        L6_8 = L5_7.type
        if L6_8 == "chi" then
          L6_8 = Fn_loadNpcEventMotion
          L7_9 = L5_7.name
          L8_10 = chi_mot_list
          L6_8(L7_9, L8_10)
        end
      end
    end
    L6_8 = Fn_loadNpcEventMotion
    L7_9 = L5_7.name
    L8_10 = npc_run_afraid_list
    L6_8(L7_9, L8_10)
  end
  L4_6 = "sm22_man_poor"
  L5_7 = "sm22_man_middle_class"
  L6_8 = "sm22_citizen_man45"
  L7_9 = "sm22_citizen_man32"
  L8_10 = "sm22_citizen_man48"
  L4_6 = "sm22_citizen_wom17"
  L3_5.isStop = true
  L4_6 = invokeTask
  function L5_7()
    local L0_17, L1_18, L2_19, L3_20, L4_21
    for L3_20, L4_21 in L0_17(L1_18) do
      Fn_killNpcTask(L4_21.name)
      if L4_21.type == "man" then
        invokeTask(function()
          Fn_playMotionNpc(L4_21.name, "man01_scared_nevy_in_00", true, L3_5)
          Fn_playMotionNpc(L4_21.name, "man01_scared_nevy_00", false)
        end)
      elseif L4_21.type == "wom" then
        invokeTask(function()
          Fn_playMotionNpc(L4_21.name, "wom01_scared_nevy_in_00", true, L3_5)
          Fn_playMotionNpc(L4_21.name, "wom01_scared_nevy_00", false)
        end)
      elseif L4_21.type == "chi" then
        Fn_playMotionNpc(L4_21.name, "chi01_scared_nevy_in_00", true, L3_5)
        Fn_playMotionNpc(L4_21.name, "chi01_scared_nevy_00", false)
      end
      wait(math.random(3, 10))
      break
    end
  end
  L4_6(L5_7)
  L4_6 = 0
  L5_7 = FEAR_GAUGE
  L5_7 = L5_7.SAFE_CAP
  L6_8 = setupFearGauge
  L6_8()
  L6_8 = Fn_missionStart
  L6_8()
  L6_8 = playScream
  L6_8()
  L6_8 = Fn_userCtrlOn
  L6_8()
  L6_8 = Fn_sendEventComSb
  L7_9 = "requestIdleEnemy"
  L8_10 = false
  L6_8(L7_9, L8_10)
  L6_8 = Fn_sendEventComSb
  L7_9 = "requestChangeEnemyMarker"
  L8_10 = true
  L6_8(L7_9, L8_10)
  L6_8 = Fn_missionView
  L7_9 = "sm22_02000"
  L6_8(L7_9)
  L6_8 = Fn_pcSensorOn
  L7_9 = "pccubesensor2_area_distant_d_01"
  L6_8(L7_9)
  L6_8 = Fn_pcSensorOn
  L7_9 = "pccubesensor2_area_distant_d_catwarp_01"
  L6_8(L7_9)
  L6_8 = Fn_sensorOn
  L7_9 = "cubesensor2_citizens_d"
  L6_8(L7_9)
  L6_8 = Fn_setCatWarpCheckPoint
  L7_9 = "locator2_pc_start_pos"
  L6_8(L7_9)
  L6_8 = false
  L7_9 = 0
  L8_10 = {}
  L9_11 = invokeTask
  L9_11(L10_12)
  while not L6_8 do
    L9_11 = false
    for L13_15, L14_16 in L10_12(L11_13) do
      if not L9_11 then
        L8_10[L13_15] = Fn_sendEventComSb("requestEnemyHandle", L14_16)
        if L8_10[L13_15] ~= nil then
          L7_9 = Fn_get_distance(_puppet_tbl.sm22_new_regime:getWorldPos(), L8_10[L13_15]:getWorldPos())
          print("\232\183\157\233\155\162\227\129\175\239\188\159 \226\134\146 ", L7_9)
          if L7_9 <= ENEMY_NEAR_DIST01 then
            L9_11 = true
            _is_citizens_sensor_enter = true
            if _is_citizens_sensor_leave == true or L7_9 <= ENEMY_NEAR_DIST02 then
              setGaugeEnemyBonus(FEAR_GAUGE.MUL10)
              break
            end
            setGaugeEnemyBonus(FEAR_GAUGE.MUL10)
            break
          else
            _is_citizens_sensor_enter = false
            print("\233\187\146\232\153\171\239\188\154\228\189\143\230\176\145\227\129\174\232\191\145\227\129\143\227\129\171\227\129\132\227\129\170\227\129\132")
          end
      end
      else
        print("\227\130\168\227\131\141\227\131\159\227\131\188\227\130\146\231\153\186\232\166\139\229\135\186\230\157\165\227\129\170\227\129\132")
      end
      setGaugeEnemyBonus(FEAR_GAUGE.MUL10)
    end
    if L10_12 then
      L14_16()
      if L14_16 == true then
        L14_16(3)
        L14_16()
      end
    else
      L10_12()
      L10_12(L11_13, L12_14, L13_15, L14_16, nil)
    end
    if L10_12 then
      L6_8 = true
      break
    end
    L10_12()
  end
  L9_11 = stopFearGauge
  L9_11()
  L9_11 = Fn_captionViewWait
  L9_11(L10_12)
  L9_11 = {}
  L11_13(L12_14, L13_15)
  L11_13()
  L11_13(L12_14)
  L12_14.pos = "locator2_cam_d_02"
  L12_14.time = 4
  L13_15.pos = "locator2_aim_d_02"
  L13_15.time = 4
  L13_15(L14_16, L11_13, L12_14)
  while true do
    if L13_15 then
      L13_15()
    end
  end
  L13_15(L14_16)
  L13_15(L14_16)
  for _FORV_16_ = 1, #L9_11 do
    if L9_11[_FORV_16_] ~= nil then
      L9_11[_FORV_16_]:abort()
    end
    L9_11[_FORV_16_] = nil
  end
  for _FORV_18_, _FORV_19_ in pairs(chara_table) do
    if _FORV_19_.name ~= "sm22_new_regime" and _FORV_19_.name ~= "sm22_old_regime" then
      L14_16[_FORV_18_] = Fn_moveNpc(_FORV_19_.name, L13_15)
    end
  end
  waitSeconds(3)
  Fn_kaiwaDemoView("sm22_00800k")
  Mob:makeSituationPanic(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_22, L1_23
end
function cubesensor2_citizens_d_OnEnter(A0_24, A1_25)
  for _FORV_5_, _FORV_6_ in pairs(enemy_table) do
    if A1_25:getName() == _FORV_6_ then
      print("\230\164\156\231\159\165\227\129\151\227\129\159")
      _is_citizens_sensor_enter = true
    end
  end
end
function cubesensor2_citizens_d_OnLeave(A0_26, A1_27)
  for _FORV_5_, _FORV_6_ in pairs(enemy_table) do
    if A1_27:getName() == _FORV_6_ then
      print("\230\164\156\231\159\165\227\129\151\227\129\159")
      _is_citizens_sensor_leave = true
    end
  end
end
function pccubesensor2_area_distant_OnEnter()
  local L0_28, L1_29
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_30, L1_31
  _is_area_distant = true
end
function pccubesensor2_area_distant_d_catwarp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function cubesensor2_old_regime_OnEnter()
  local L0_32, L1_33
  _old_regim_sensor_touch = true
end
