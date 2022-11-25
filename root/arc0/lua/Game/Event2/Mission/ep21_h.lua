dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
enmgen2_battle_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator_h_01",
      name = "jammer_01"
    },
    {
      type = "jammer",
      locator = "locator_h_02",
      name = "jammer_02"
    },
    {
      type = "jammer",
      locator = "locator_h_03",
      name = "jammer_03"
    },
    {
      type = "jammer",
      locator = "locator_h_04",
      name = "jammer_04"
    },
    {
      type = "jammer",
      locator = "locator_h_05",
      name = "jammer_05"
    },
    {
      type = "jammer",
      locator = "locator_h_06",
      name = "jammer_06"
    },
    {
      type = "jammer",
      locator = "locator_h_07",
      name = "jammer_07"
    },
    {
      type = "jammer",
      locator = "locator_h_08",
      name = "jammer_08"
    },
    {
      type = "jammer",
      locator = "locator_h_09",
      name = "jammer_09"
    },
    {
      type = "jammer",
      locator = "locator_h_10",
      name = "jammer_10"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
_litho_theme = nil
_crow_puppet = nil
switch = {}
litho2_flag = false
litho_first = false
_clear_time_first = {
  0,
  0,
  179,
  99
}
kICE_MOVE = 0
kICE_MOVING = 1
kICE_STOP = 2
kICE_STOPPED = 3
kICE_RESET = 4
kICE_DAMAGE = 5
_reset = false
_ice_max = 125
_ice_table = {}
icicle = {}
icicle_se = {}
kitun_climb = false
crow_climb = false
all_clear = false
out_far = false
_demo_flg = false
crow_vel = 25
crow_vel_al = 6.6
release_cnt = 0
warp_now = false
function Initialize()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18
  L0_11 = Fn_loadEventData
  L1_12 = "evx/ep21_ice"
  L0_11(L1_12, L2_13, L3_14)
  L0_11 = Fn_getGameObject
  L1_12 = "mother2"
  L0_11 = L0_11(L1_12)
  L1_12 = L0_11.sendEvent
  L1_12 = L1_12(L2_13, L3_14, L4_15)
  for L5_16 = 1, 65 do
    L6_17 = {}
    L7_18 = L5_16
    L6_17.handle = L1_12:findSubArea("co_a_07_" .. L7_18)
    L6_17.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_18)
    L6_17.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_18)
    L6_17.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_18)
    L6_17.velocity = 80
    L6_17.state = kICE_MOVE
    table.insert(_ice_table, L6_17)
  end
  for L5_16 = 66, 105 do
    L6_17 = {}
    L7_18 = L5_16
    L6_17.handle = L1_12:findSubArea("co_a_12_" .. L7_18)
    L6_17.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_18)
    L6_17.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_18)
    L6_17.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_18)
    L6_17.velocity = 80
    L6_17.state = kICE_MOVE
    table.insert(_ice_table, L6_17)
  end
  for L5_16 = 106, _ice_max do
    L6_17 = {}
    L7_18 = L5_16
    L6_17.handle = L1_12:findSubArea("co_a_11_" .. L7_18)
    L6_17.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_18)
    L6_17.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_18)
    L6_17.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_18)
    L6_17.velocity = 80
    L6_17.state = kICE_MOVE
    table.insert(_ice_table, L6_17)
  end
  L2_13(L3_14)
  L2_13(L3_14)
  L2_13(L3_14)
  L2_13(L3_14)
  sdemo = L2_13
end
function Ingame()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32
  L0_19 = setDebugDispMission
  L0_19()
  L0_19 = invokeTask
  function L1_20()
    while true do
      if _brain_crow ~= nil then
        setDebugDispMissionText("flag  : " .. tostring(_next_phase == true))
      end
      wait()
    end
  end
  L0_19(L1_20)
  L0_19 = Fn_sendEventComSb
  L1_20 = "stop_stormse_01"
  L0_19(L1_20)
  L0_19 = Fn_sendEventComSb
  L1_20 = "stop_stormse_02"
  L0_19(L1_20)
  L0_19 = Fn_createEffect
  L1_20 = "film1"
  L2_21 = "ef_ev_cld_01"
  L3_22 = "pccubesensor2_05"
  L4_23 = true
  L0_19 = L0_19(L1_20, L2_21, L3_22, L4_23)
  L1_20 = Fn_setCatWarpCheckPoint
  L2_21 = "locator2_pc_start_pos"
  L1_20(L2_21)
  L1_20 = GravPowConsumUp
  L1_20()
  L1_20 = ice_processing
  L1_20 = L1_20()
  L2_21 = restart_processing
  L2_21 = L2_21()
  while true do
    while true do
      L3_22 = _crow_puppet
      if L3_22 == nil then
        L3_22 = Fn_sendEventComSb
        L4_23 = "crow_name"
        L3_22 = L3_22(L4_23)
        _crow_puppet = L3_22
        L3_22 = wait
        L3_22()
      end
    end
  end
  while true do
    while true do
      L3_22 = _brain_crow
      if L3_22 == nil then
        L3_22 = _crow_puppet
        L4_23 = L3_22
        L3_22 = L3_22.getBrain
        L3_22 = L3_22(L4_23)
        _brain_crow = L3_22
        L3_22 = wait
        L3_22()
      end
    end
  end
  while true do
    L3_22 = _brain_crow
    L4_23 = L3_22
    L3_22 = L3_22.isRunning
    L3_22 = L3_22(L4_23)
    if not L3_22 then
      L3_22 = wait
      L3_22()
    end
  end
  L3_22 = invokeTask
  function L4_23()
    local L0_33
    L0_33 = nil
    repeat
      if (Player:getRecentAreaName() == "co_a_01" or Player:getRecentAreaName() == "co_a_02" or Player:getRecentAreaName() == "co_a_03") and release_cnt <= 0 then
        Player:setSpecialTuning(Player.kSpecialTuning_Ep21InnerPillar)
        if L0_33 ~= false then
          print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171h")
          L0_33 = false
        end
      else
        Player:setSpecialTuning(Player.kSpecialTuning_None)
        if L0_33 ~= true then
          print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\136\227\129\134\227\129\171h")
          L0_33 = true
        end
      end
      if release_cnt < 0 then
        release_cnt = 0
      end
      wait()
    until false
  end
  L3_22 = L3_22(L4_23)
  no_jump = L3_22
  L3_22 = Fn_userCtrlOn
  L3_22()
  L3_22 = Fn_missionStart
  L3_22()
  repeat
    L3_22 = wait
    L3_22()
    L3_22 = Fn_sendEventComSb
    L4_23 = "isLithographStart"
    L3_22 = L3_22(L4_23)
  until L3_22
  L3_22 = Fn_sendEventComSb
  L4_23 = "setFirstHalfProcessEnd"
  L3_22(L4_23)
  L3_22 = findGameObject2
  L4_23 = "EnemyGenerator"
  L5_24 = "enmgen2_h_01"
  L3_22 = L3_22(L4_23, L5_24)
  if L3_22 ~= nil then
    L5_24 = L3_22
    L4_23 = L3_22.requestSpawn
    L4_23(L5_24)
  end
  repeat
    L4_23 = wait
    L4_23()
    L4_23 = Fn_sendEventComSb
    L5_24 = "isFirstHalfProcessEnd"
    L4_23 = L4_23(L5_24)
  until L4_23
  litho2_flag = true
  L4_23 = Fn_missionView
  L5_24 = "ep21_09003"
  L6_25, L7_26 = nil, nil
  L8_27 = true
  L4_23(L5_24, L6_25, L7_26, L8_27)
  L4_23 = invokeTask
  L5_24 = litho_timer
  L6_25 = _clear_time_first
  L4_23 = L4_23(L5_24, L6_25)
  _litho_timer_task = L4_23
  L4_23 = findGameObject2
  L5_24 = "Node"
  L6_25 = "pccubesensor2_clear_02"
  L4_23 = L4_23(L5_24, L6_25)
  L5_24 = Fn_naviSet
  L6_25 = L4_23
  L5_24(L6_25)
  L5_24 = _brain_crow
  L6_25 = L5_24
  L5_24 = L5_24.setIdling
  L7_26 = false
  L5_24(L6_25, L7_26)
  L5_24 = setSateAllIce
  L6_25 = kICE_STOP
  L5_24(L6_25)
  L5_24 = _brain_crow
  L6_25 = L5_24
  L5_24 = L5_24.setClimbObjects
  L7_26 = Supporter
  L7_26 = L7_26.ClimbTarget
  L7_26 = L7_26.ep21_Icicle
  L8_27 = _ice_table
  L5_24 = L5_24(L6_25, L7_26, L8_27)
  L6_25 = findGameObject2
  L7_26 = "Node"
  L8_27 = "locator2_goal_h"
  L6_25 = L6_25(L7_26, L8_27)
  L8_27 = L6_25
  L7_26 = L6_25.getWorldPos
  L7_26 = L7_26(L8_27)
  L8_27 = _brain_crow
  L8_27 = L8_27.setClimbGoal
  L8_27(L9_28, L10_29)
  L8_27 = {
    L9_28,
    L10_29,
    L11_30,
    [6] = L12_31(L13_32)
  }
  L12_31 = "locator2_goal_h_around2"
  L12_31 = "Node"
  L13_32 = "locator2_goal_h_around3"
  L12_31 = L11_30
  L12_31 = findGameObject2
  L13_32 = "Node"
  L12_31 = L12_31(L13_32, "locator2_goal_h_around4")
  L13_32 = L12_31
  L12_31 = L12_31.getWorldPos
  L13_32 = L12_31(L13_32)
  ;({
    L9_28,
    L10_29,
    L11_30,
    [6] = L12_31(L13_32)
  })[4] = L12_31
  ;({
    L9_28,
    L10_29,
    L11_30,
    [6] = L12_31(L13_32)
  })[5] = L13_32
  for L12_31, L13_32 in L9_28(L10_29) do
    _brain_crow:addClimbPoint(L13_32)
  end
  L12_31 = 150
  L9_28(L10_29, L11_30, L12_31)
  if L5_24 then
    L9_28(L10_29, L11_30)
  else
    L9_28(L10_29)
  end
  L9_28()
  time_cnt = 0
  lito2_pos = L9_28
  repeat
    repeat
      if L9_28 then
        if L9_28 == false then
          if L9_28 == true then
            if L9_28 == true then
              L9_28(L10_29)
            else
              L12_31 = 1
              L13_32 = ""
              L9_28(L10_29, L11_30, L12_31, L13_32, _crow_puppet)
              L9_28(L10_29)
            end
            L9_28(L10_29, L11_30)
            L9_28(L10_29)
            crow_climb = true
            L9_28()
            L10_29(L11_30)
          end
        end
      end
      if L9_28 == true then
        if L9_28 == false then
          if L9_28 == true then
            L9_28()
            if L9_28 == true then
              L9_28(L10_29)
            else
              _demo_flg = true
            end
            kitun_climb = true
            crow_climb = true
          end
        end
      end
      L9_28()
    until L9_28 == true
  until L9_28 == true
  L9_28()
  time_cnt = -1
  L9_28(L10_29)
  L9_28(L10_29)
  L9_28(L10_29, L11_30)
  L9_28(L10_29)
  L9_28(L10_29)
  if L9_28 == true then
    L9_28()
    L10_29.pos = "locator2_cam_06"
    L10_29.time = 0
    L11_30.pos = "locator2_aim_06"
    L11_30.time = 0
    L12_31 = L11_30
    L11_30(L12_31)
    L12_31 = "\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159"
    L11_30(L12_31)
  end
  L9_28(L10_29)
  L9_28(L10_29)
  L12_31 = L11_30
  L13_32 = L9_28
  L11_30(L12_31, L13_32, L10_29)
  L12_31 = "\227\130\175\227\131\173\227\130\166\227\131\175\227\131\188\227\131\151"
  L11_30(L12_31)
  repeat
    L11_30()
    L12_31 = "isSecondHalfProcessEnd"
  until L11_30
  L12_31 = "pccubesensor2_neko_04"
  L11_30(L12_31)
  L12_31 = L11_30
  L13_32 = false
  L11_30(L12_31, L13_32)
  L12_31 = "crowVisible"
  L11_30(L12_31)
  L12_31 = "ep21_00119"
  L13_32 = nil
  L11_30(L12_31, L13_32, nil, true)
  L12_31 = L3_22
  L13_32 = false
  L11_30(L12_31, L13_32)
  L12_31 = kICE_MOVE
  L11_30(L12_31)
  L12_31 = "pccubesensor2_neko_02"
  L11_30(L12_31)
  L12_31 = "pccubesensor2_neko_01"
  L11_30(L12_31)
  all_clear = true
  _next_phase = false
  L12_31 = "Node"
  L13_32 = "pccubesensor2_04"
  L12_31 = Fn_naviSet
  L13_32 = L11_30
  L12_31(L13_32)
  L12_31 = waitPhace
  L12_31()
  L12_31 = Fn_naviKill
  L12_31()
  L12_31 = findGameObject2
  L13_32 = "Node"
  L12_31 = L12_31(L13_32, "locator2_navi_03")
  L13_32 = Fn_naviSet
  L13_32(L12_31)
  L13_32 = waitPhace
  L13_32()
  out_far = true
  L13_32 = Fn_captionViewWait
  L13_32("ep21_07004")
  L13_32 = Fn_captionViewWait
  L13_32("ep21_07005")
  L13_32 = waitPhace
  L13_32()
  L13_32 = Fn_naviKill
  L13_32()
  L13_32 = Player
  L13_32 = L13_32.setParameter
  L13_32(L13_32, Player.kParam_GravPowConsumFactor)
  L13_32 = Fn_setNextMissionFlag
  L13_32()
  L13_32 = Fn_nextMission
  L13_32()
  L13_32 = Fn_exitSandbox
  L13_32()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
  end
  Fn_missionInfoEnd()
end
function pccubesensor2_03_OnEnter(A0_34)
  _next_phase = true
  print("true")
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_clear_02")
end
function pccubesensor2_03_OnLeave()
  _next_phase = false
  print("false")
end
function pccubesensor2_release_end_OnEnter(A0_35)
  print("\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\129\170\227\129\132\229\135\166\231\144\134\227\130\168\227\131\179\227\131\137")
  if no_jump ~= nil then
    no_jump:abort()
    no_jump = nil
  end
  Player:setSpecialTuning(Player.kSpecialTuning_None)
  if out_far == false then
    Fn_pcSensorOn("pccubesensor2_07")
  end
  Fn_pcSensorOn("pccubesensor2_05")
end
function pccubesensor2_release_restart_OnEnter()
  print("\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\129\170\227\129\132\229\135\166\231\144\134\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136")
  if no_jump == nil then
    no_jump = invokeTask(function()
      local L0_36
      L0_36 = nil
      repeat
        if (Player:getRecentAreaName() == "co_a_01" or Player:getRecentAreaName() == "co_a_02" or Player:getRecentAreaName() == "co_a_03") and release_cnt <= 0 then
          Player:setSpecialTuning(Player.kSpecialTuning_Ep21InnerPillar)
          if L0_36 ~= false then
            print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171h")
            L0_36 = false
          end
        else
          Player:setSpecialTuning(Player.kSpecialTuning_None)
          if L0_36 ~= true then
            print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\136\227\129\134\227\129\171h")
            L0_36 = true
          end
        end
        if release_cnt < 0 then
          release_cnt = 0
        end
        wait()
      until false
    end)
  end
  release_cnt = release_cnt + 1
  print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\171\227\130\166\227\131\179\227\131\136\239\188\139\239\188\145" .. release_cnt)
  Fn_pcSensorOff("pccubesensor2_05")
  Fn_pcSensorOff("pccubesensor2_07")
end
function pccubesensor2_04_OnEnter(A0_37)
  A0_37:setActive(false)
  _next_phase = true
end
function pccubesensor2_07_OnEnter(A0_38)
  A0_38:setActive(false)
  _next_phase = true
end
function pccubesensor2_05_OnEnter(A0_39)
  A0_39:setActive(false)
  _next_phase = true
end
function pccubesensor2_clear_02_OnEnter(A0_40)
  local L1_41
  L1_41 = Fn_captionView
  L1_41("ep21_07003")
  L1_41 = A0_40.setActive
  L1_41(A0_40, false)
  L1_41 = Fn_naviKill
  L1_41()
  L1_41 = findGameObject2
  L1_41 = L1_41("Node", "locator2_navi_02")
  Fn_naviSet(L1_41)
end
function pccubesensor2_neko_01_OnEnter(A0_42)
  warp_now = true
  invokeTask(function()
    _next_phase = false
    Fn_captionViewEnd()
    if Fn_sendEventComSb("isSecondHalfProcessEnd") or upper_clear2 == true then
      Fn_setCatWarpCheckPoint("locator2_restart_01")
    else
      Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
    end
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\128\128\227\130\185\227\130\191\227\131\188\227\131\136\229\156\176\231\130\185 neko_01")
    Fn_catWarp()
    warp_now = false
  end)
end
function pccubesensor2_neko_02_OnEnter(A0_43)
  warp_now = true
  invokeTask(function()
    Fn_captionViewEnd()
    Fn_setCatWarpCheckPoint("locator2_restart_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\130\175\227\131\170\227\130\162\231\155\180\229\137\141 neko_02")
    Fn_catWarp()
    warp_now = false
  end)
end
function pccubesensor2_neko_03_OnEnter(A0_44)
  warp_now = true
  invokeTask(function()
    _next_phase = false
    Fn_captionViewEnd()
    Fn_setCatWarpCheckPoint("locator2_upper_reset_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151 \230\159\177\231\153\187\227\130\138\227\129\153\227\129\142 neko_03")
    Fn_catWarp()
    warp_now = false
  end)
end
function pccubesensor2_neko_04_OnLeave(A0_45)
  warp_now = true
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_clear_catwarp_pos")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151 \230\159\177\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159")
    Fn_catWarp()
    warp_now = false
  end)
end
function navi_on()
  local L0_46, L1_47
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function cubesensor2_07_OnEnter(A0_48)
  A0_48:setActive(false)
  crow_advance = invokeTask(function()
    crow_speed_adjust()
    crow_fastmove("locator2_crowmove_21")
    print("\227\130\175\227\131\173\227\130\166\239\188\145\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_22")
    print("\227\130\175\227\131\173\227\130\166\239\188\146\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_23")
    print("\227\130\175\227\131\173\227\130\166\239\188\147\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_24")
    print("\227\130\175\227\131\173\227\130\166\239\188\148\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_25")
    print("\227\130\175\227\131\173\227\130\166\239\188\149\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_26")
    print("\227\130\175\227\131\173\227\130\166\239\188\150\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_27")
    print("\227\130\175\227\131\173\227\130\166\239\188\151\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_28")
    print("\227\130\175\227\131\173\227\130\166\239\188\152\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_29")
    print("\227\130\175\227\131\173\227\130\166\239\188\153\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_30")
    print("\227\130\175\227\131\173\227\130\16610\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_31")
    print("\227\130\175\227\131\173\227\130\16611\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_32")
    print("\227\130\175\227\131\173\227\130\16612\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_33")
    print("\227\130\175\227\131\173\227\130\16613\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_34")
    print("\227\130\175\227\131\173\227\130\16614\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_35")
    print("\227\130\175\227\131\173\227\130\16615\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_36")
    print("\227\130\175\227\131\173\227\130\16616\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_37")
    print("\227\130\175\227\131\173\227\130\16617\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_38")
    print("\227\130\175\227\131\173\227\130\16618\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    _brain_crow:setFollowPoint(false, nil, 0)
    crow_speed_adjust_off()
  end)
end
