dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
_litho_theme = nil
_crow_puppet = nil
switch = {}
litho1_flag = false
litho_first = false
time_cnt = -1
_litho_timer_task = nil
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
_crash_ice = nil
kitun_climb = false
crow_climb = false
_demo_flg = false
half_clear = false
crow_vel = 25
crow_vel_al = 6.6
release_cnt = 0
warp_now = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_loadEventData
  L1_1 = "evx/ep21_beans"
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = move_area_beans
  L0_0()
  L0_0 = Fn_loadEventData
  L1_1 = "evx/ep21_ice"
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_getGameObject
  L1_1 = "mother2"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.sendEvent
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  for L5_5 = 1, 65 do
    L6_6 = {}
    L7_7 = L5_5
    L6_6.handle = L1_1:findSubArea("co_a_07_" .. L7_7)
    L6_6.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_7)
    L6_6.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_7)
    L6_6.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_7)
    L6_6.velocity = 80
    L6_6.state = kICE_MOVE
    table.insert(_ice_table, L6_6)
  end
  for L5_5 = 66, 105 do
    L6_6 = {}
    L7_7 = L5_5
    L6_6.handle = L1_1:findSubArea("co_a_12_" .. L7_7)
    L6_6.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_7)
    L6_6.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_7)
    L6_6.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_7)
    L6_6.velocity = 80
    L6_6.state = kICE_MOVE
    table.insert(_ice_table, L6_6)
  end
  for L5_5 = 106, _ice_max do
    L6_6 = {}
    L7_7 = L5_5
    L6_6.handle = L1_1:findSubArea("co_a_11_" .. L7_7)
    L6_6.node_top = findGameObject2("Node", "locator2_ice_top_" .. L7_7)
    L6_6.node_bot = findGameObject2("Node", "locator2_ice_bot_" .. L7_7)
    L6_6.node_boteff = findGameObject2("Node", "locator2_iceeff_bot_" .. L7_7)
    L6_6.velocity = 80
    L6_6.state = kICE_MOVE
    table.insert(_ice_table, L6_6)
  end
  yes_func_l2 = L2_2
  L3_3.id = "ic_litho_00120"
  L3_3.func = L4_4
  L2_2.RL = L3_3
  sdemo = L3_3
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27
  L0_8 = Fn_sendEventComSb
  L1_9 = "stop_stormse_01"
  L0_8(L1_9)
  L0_8 = Fn_sendEventComSb
  L1_9 = "stop_stormse_02"
  L0_8(L1_9)
  L0_8 = Fn_loadEventData
  L1_9 = "evx/ep21_beans"
  L2_10 = "ep21_beans"
  L3_11 = true
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = move_area_beans
  L0_8()
  L0_8 = GravPowConsumDown
  L0_8()
  L0_8 = Fn_setCatWarpCheckPoint
  L1_9 = "locator2_pc_start_pos"
  L0_8(L1_9)
  L0_8 = ice_processing
  L0_8 = L0_8()
  L1_9 = restart_processing
  L1_9 = L1_9()
  while true do
    while true do
      L2_10 = _crow_puppet
      if L2_10 == nil then
        L2_10 = Fn_sendEventComSb
        L3_11 = "crow_name"
        L2_10 = L2_10(L3_11)
        _crow_puppet = L2_10
        L2_10 = wait
        L2_10()
      end
    end
  end
  while true do
    while true do
      L2_10 = _brain_crow
      if L2_10 == nil then
        L2_10 = _crow_puppet
        L3_11 = L2_10
        L2_10 = L2_10.getBrain
        L2_10 = L2_10(L3_11)
        _brain_crow = L2_10
        L2_10 = wait
        L2_10()
      end
    end
  end
  while true do
    while true do
      L2_10 = _brain_crow
      L3_11 = L2_10
      L2_10 = L2_10.isRunning
      L2_10 = L2_10(L3_11)
      if not L2_10 then
        L2_10 = wait
        L2_10()
      end
    end
  end
  while true do
    L2_10 = _brain_crow
    L3_11 = L2_10
    L2_10 = L2_10.isActive
    L2_10 = L2_10(L3_11)
    if not L2_10 then
      L2_10 = wait
      L2_10()
    end
  end
  L2_10 = HUD
  L3_11 = L2_10
  L2_10 = L2_10.hpgDispReq_FadeOut
  L2_10(L3_11)
  L2_10 = HUD
  L3_11 = L2_10
  L2_10 = L2_10.grgDispReq_FadeOut
  L2_10(L3_11)
  L2_10 = HUD
  L3_11 = L2_10
  L2_10 = L2_10.spgDispReq_FadeOut
  L2_10(L3_11)
  L2_10 = invokeTask
  function L3_11()
    repeat
      if (Player:getRecentAreaName() == "co_a_01" or Player:getRecentAreaName() == "co_a_02" or Player:getRecentAreaName() == "co_a_03") and release_cnt <= 0 then
        Player:setSpecialTuning(Player.kSpecialTuning_Ep21InnerPillar)
      else
        Player:setSpecialTuning(Player.kSpecialTuning_None)
      end
      if release_cnt < 0 then
        release_cnt = 0
      end
      wait()
    until false
  end
  L2_10(L3_11)
  L2_10 = GameDatabase
  L3_11 = L2_10
  L2_10 = L2_10.get
  L4_12 = ggd
  L4_12 = L4_12.GlobalSystemFlags__GameRetry
  L2_10 = L2_10(L3_11, L4_12)
  if L2_10 == true then
    L2_10 = Fn_resetPcPos
    L3_11 = "locator2_retrykit_01"
    L2_10(L3_11)
    L2_10 = _brain_crow
    L3_11 = L2_10
    L2_10 = L2_10.warpToNode
    L4_12 = findGameObject2
    L5_13 = "Node"
    L6_14 = "locator2_retrycrow_01"
    L4_12 = L4_12(L5_13, L6_14)
    L5_13 = Supporter
    L5_13 = L5_13.FirstAction
    L5_13 = L5_13.Ground
    L2_10(L3_11, L4_12, L5_13)
    L2_10 = Fn_pcSensorOff
    L3_11 = "pccubesensor2_maku_03"
    L2_10(L3_11)
    L2_10 = print
    L3_11 = "\230\159\177\227\129\171\229\133\165\227\129\163\227\129\166\233\135\141\229\138\155\227\130\178\227\131\188\227\130\184\230\182\136\232\178\187\233\135\143\227\130\162\227\131\131\227\131\151"
    L2_10(L3_11)
    L2_10 = GravPowConsumUp
    L2_10()
    L2_10 = print
    L3_11 = "\227\131\170\227\131\136\227\131\169\227\130\164\230\153\130\227\129\171\229\176\130\231\148\168\227\129\167\229\174\159\232\161\140\227\129\151\227\129\159\227\129\132\229\135\166\231\144\134"
    L2_10(L3_11)
    warp_now = false
  end
  L2_10 = Fn_missionStart
  L2_10()
  L2_10 = Fn_userCtrlOn
  L2_10()
  function L2_10()
    waitPhace()
    Fn_kaiwaDemoView("ep21_00330k")
  end
  L3_11 = Fn_skipMissionRetryAtProcessing
  L4_12 = L2_10
  L3_11 = L3_11(L4_12)
  if L3_11 then
    L3_11 = print
    L4_12 = "\227\131\170\227\131\136\227\131\169\227\130\164\227\129\152\227\130\131\227\129\170\227\129\132\227\129\168\227\129\141\227\129\171\229\174\159\232\161\140\227\129\153\227\130\139\229\135\166\231\144\134"
    L3_11(L4_12)
  end
  repeat
    L3_11 = wait
    L3_11()
    L3_11 = Fn_sendEventComSb
    L4_12 = "isLithographStart"
    L3_11 = L3_11(L4_12)
  until L3_11
  L3_11 = Fn_sendEventComSb
  L4_12 = "setFirstHalfProcessEnd"
  L3_11(L4_12)
  repeat
    L3_11 = wait
    L3_11()
    L3_11 = Fn_sendEventComSb
    L4_12 = "isFirstHalfProcessEnd"
    L3_11 = L3_11(L4_12)
  until L3_11
  L3_11 = Fn_userCtrlOff
  L3_11()
  L3_11 = {L4_12}
  L4_12 = {}
  L4_12.pos = "locator2_cam_01"
  L4_12.time = 0
  L4_12 = {L5_13}
  L5_13 = {}
  L5_13.pos = "locator2_aim_02"
  L5_13.time = 5
  L5_13 = sdemo
  L6_14 = L5_13
  L5_13 = L5_13.set
  L7_15 = "locator2_cam_01"
  L8_16 = "locator2_aim_01"
  L9_17 = false
  L5_13(L6_14, L7_15, L8_16, L9_17)
  L5_13 = sdemo
  L6_14 = L5_13
  L5_13 = L5_13.play
  L7_15 = L3_11
  L8_16 = L4_12
  L5_13(L6_14, L7_15, L8_16)
  function L5_13()
    waitSeconds(2)
  end
  L6_14 = Fn_skipMissionRetryAtProcessing
  L7_15 = L5_13
  L6_14 = L6_14(L7_15)
  if L6_14 then
    L6_14 = print
    L7_15 = "\227\131\170\227\131\136\227\131\169\227\130\164\227\129\152\227\130\131\227\129\170\227\129\132\227\129\168\227\129\141\227\129\171\229\174\159\232\161\140\227\129\153\227\130\139\229\135\166\231\144\134"
    L6_14(L7_15)
  end
  L6_14 = setSateAllIce
  L7_15 = kICE_STOP
  L6_14(L7_15)
  function L6_14()
    waitSeconds(2)
    Fn_captionViewWait("ep21_06000")
    Fn_captionViewWait("ep21_06001", 3, 2)
  end
  L7_15 = Fn_skipMissionRetryAtProcessing
  L8_16 = L6_14
  L7_15 = L7_15(L8_16)
  if L7_15 then
    L7_15 = print
    L8_16 = "\227\131\170\227\131\136\227\131\169\227\130\164\227\129\152\227\130\131\227\129\170\227\129\132\227\129\168\227\129\141\227\129\171\229\174\159\232\161\140\227\129\153\227\130\139\229\135\166\231\144\134"
    L7_15(L8_16)
  end
  L7_15 = _brain_crow
  L8_16 = L7_15
  L7_15 = L7_15.setIdling
  L9_17 = false
  L7_15(L8_16, L9_17)
  L7_15 = findGameObject2
  L8_16 = "Node"
  L9_17 = "pccubesensor2_clear_01"
  L7_15 = L7_15(L8_16, L9_17)
  L8_16 = Fn_naviSet
  L9_17 = L7_15
  L8_16(L9_17)
  L8_16 = Fn_userCtrlOn
  L8_16()
  L8_16 = invokeTask
  L9_17 = litho_timer
  L10_18 = _clear_time_first
  L8_16 = L8_16(L9_17, L10_18)
  _litho_timer_task = L8_16
  L8_16 = sdemo
  L9_17 = L8_16
  L8_16 = L8_16.stop
  L10_18 = 1
  L8_16(L9_17, L10_18)
  litho1_flag = true
  L8_16 = Fn_missionView
  L9_17 = "ep21_09002"
  L10_18, L11_19 = nil, nil
  L8_16(L9_17, L10_18, L11_19, L12_20)
  L8_16 = _crow_puppet
  L9_17 = L8_16
  L8_16 = L8_16.getBrain
  L8_16 = L8_16(L9_17)
  _brain_crow = L8_16
  L8_16 = _brain_crow
  L9_17 = L8_16
  L8_16 = L8_16.setClimbObjects
  L10_18 = Supporter
  L10_18 = L10_18.ClimbTarget
  L10_18 = L10_18.ep21_Icicle
  L11_19 = _ice_table
  L8_16 = L8_16(L9_17, L10_18, L11_19)
  L9_17 = findGameObject2
  L10_18 = "Node"
  L11_19 = "locator2_goal_l"
  L9_17 = L9_17(L10_18, L11_19)
  L11_19 = L9_17
  L10_18 = L9_17.getWorldPos
  L10_18 = L10_18(L11_19)
  L11_19 = _brain_crow
  L11_19 = L11_19.setClimbGoal
  L11_19(L12_20, L13_21)
  L11_19 = {
    L12_20,
    L13_21,
    L14_22,
    L15_23,
    L16_24,
    L17_25,
    L18_26,
    L19_27,
    findGameObject2("Node", "locator2_goal_l_around7"):getWorldPos(),
    findGameObject2("Node", "locator2_goal_l_around8"):getWorldPos()
  }
  L15_23 = "locator2_start_l_around2"
  L15_23 = "Node"
  L16_24 = "locator2_goal_l_around1"
  L15_23 = L14_22
  L15_23 = findGameObject2
  L16_24 = "Node"
  L17_25 = "locator2_goal_l_around2"
  L15_23 = L15_23(L16_24, L17_25)
  L16_24 = L15_23
  L15_23 = L15_23.getWorldPos
  L15_23 = L15_23(L16_24)
  L16_24 = findGameObject2
  L17_25 = "Node"
  L18_26 = "locator2_goal_l_around3"
  L16_24 = L16_24(L17_25, L18_26)
  L17_25 = L16_24
  L16_24 = L16_24.getWorldPos
  L16_24 = L16_24(L17_25)
  L17_25 = findGameObject2
  L18_26 = "Node"
  L19_27 = "locator2_goal_l_around4"
  L17_25 = L17_25(L18_26, L19_27)
  L18_26 = L17_25
  L17_25 = L17_25.getWorldPos
  L17_25 = L17_25(L18_26)
  L18_26 = findGameObject2
  L19_27 = "Node"
  L18_26 = L18_26(L19_27, "locator2_goal_l_around5")
  L19_27 = L18_26
  L18_26 = L18_26.getWorldPos
  L18_26 = L18_26(L19_27)
  L19_27 = findGameObject2
  L19_27 = L19_27("Node", "locator2_goal_l_around6")
  L19_27 = L19_27.getWorldPos
  L19_27 = L19_27(L19_27)
  for L15_23, L16_24 in L12_20(L13_21) do
    L17_25 = _brain_crow
    L18_26 = L17_25
    L17_25 = L17_25.addClimbPoint
    L19_27 = L16_24
    L17_25(L18_26, L19_27)
  end
  L15_23 = 150
  L12_20(L13_21, L14_22, L15_23)
  if L8_16 then
    L12_20(L13_21, L14_22)
  else
    L12_20(L13_21)
  end
  L12_20()
  time_cnt = 0
  repeat
    repeat
      if L12_20 then
        if L12_20 == false then
          if L12_20 == true then
            if L12_20 == true then
              L12_20(L13_21)
            else
              L12_20(L13_21)
              L15_23 = 1
              L16_24 = ""
              L17_25 = _crow_puppet
              L12_20(L13_21, L14_22, L15_23, L16_24, L17_25)
            end
            L12_20(L13_21, L14_22)
            L12_20(L13_21)
            crow_climb = true
            L12_20()
            L13_21(L14_22)
          end
        end
      end
      if L12_20 == true then
        if L12_20 == false then
          L12_20()
          if L12_20 == true then
            L12_20(L13_21)
          else
            L12_20(L13_21)
            _demo_flg = true
          end
          kitun_climb = true
          crow_climb = true
        end
      end
      L12_20()
    until L12_20 == true
  until L12_20 == true
  L12_20(L13_21)
  L12_20(L13_21, L14_22)
  L12_20(L13_21)
  L12_20()
  time_cnt = -1
  L12_20(L13_21)
  L12_20(L13_21)
  if L12_20 == true then
    repeat
      L12_20(L13_21)
      L12_20()
      if L12_20 ~= L13_21 then
        if L12_20 ~= L13_21 then
        end
      end
    until L12_20 == L13_21
    L12_20()
    L13_21.pos = "locator2_cam_03"
    L13_21.time = 0
    L14_22.pos = "locator2_aim_03"
    L14_22.time = 0
    L15_23 = L14_22
    L16_24 = "locator2_cam_03"
    L17_25 = "locator2_aim_03"
    L18_26 = true
    L14_22(L15_23, L16_24, L17_25, L18_26)
    L15_23 = L14_22
    L14_22(L15_23)
    L15_23 = L14_22
    L14_22(L15_23)
    L15_23 = "\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159"
    L14_22(L15_23)
    L15_23 = "Node"
    L16_24 = "locator2_crow_g_01"
    L15_23 = L14_22
    L15_23 = L14_22(L15_23)
    L16_24 = _brain_crow
    L17_25 = L16_24
    L16_24 = L16_24.warp
    L18_26 = L14_22
    L19_27 = L15_23
    L16_24(L17_25, L18_26, L19_27)
    L16_24 = print
    L17_25 = "\227\130\175\227\131\173\227\130\166\227\131\175\227\131\188\227\131\151"
    L16_24(L17_25)
    L16_24 = _crow_puppet
    L17_25 = L16_24
    L16_24 = L16_24.getWorldPos
    L16_24 = L16_24(L17_25)
    L17_25 = {
      L18_26,
      L19_27,
      {
        node = findGameObject2("Node", "locator2_crow_g_03"),
        action = Supporter.MovePoint.Air,
        vel = crow_vel
      },
      {
        node = findGameObject2("Node", "locator2_crow_g_03"),
        action = Supporter.MovePoint.Alight,
        vel = crow_vel_al
      }
    }
    L18_26 = {}
    L18_26.pos = L16_24
    L19_27 = Supporter
    L19_27 = L19_27.MovePoint
    L19_27 = L19_27.Air
    L18_26.action = L19_27
    L19_27 = crow_vel
    L18_26.vel = L19_27
    L19_27 = {}
    L19_27.node = findGameObject2("Node", "locator2_crow_g_02")
    L19_27.action = Supporter.MovePoint.Air
    L19_27.vel = crow_vel
    L18_26 = _brain_crow
    L19_27 = L18_26
    L18_26 = L18_26.setMovePoints
    L18_26(L19_27, L17_25)
    L18_26 = _brain_crow
    L19_27 = L18_26
    L18_26 = L18_26.startMovePoint
    L18_26(L19_27)
    L18_26 = print
    L19_27 = "\227\130\175\227\131\173\227\130\166\231\167\187\229\139\149\233\150\139\229\167\139"
    L18_26(L19_27)
    repeat
      L18_26 = print
      L19_27 = "\227\130\175\227\131\173\227\130\166\231\167\187\229\139\149\229\190\133\227\129\161"
      L18_26(L19_27)
      L18_26 = wait
      L18_26()
      L18_26 = _brain_crow
      L19_27 = L18_26
      L18_26 = L18_26.isMovePointEnd
      L18_26 = L18_26(L19_27)
    until L18_26
    L18_26 = _brain_crow
    L19_27 = L18_26
    L18_26 = L18_26.clearMovePoint
    L18_26(L19_27)
    L18_26 = print
    L19_27 = "\227\130\175\227\131\173\227\130\166\231\167\187\229\139\149\231\181\130\228\186\134"
    L18_26(L19_27)
    L18_26 = {L19_27}
    L19_27 = {}
    L19_27.pos = "locator2_cam_03"
    L19_27.time = 0
    L19_27 = {
      {
        pos = "locator2_aim_04",
        time = 1
      }
    }
    sdemo:play(L18_26, L19_27)
    waitSeconds(1.5)
    setSateAllIce(kICE_MOVE)
    waitSeconds(2)
    Fn_userCtrlOn()
    sdemo:stop(2)
  end
  L12_20(L13_21)
  half_clear = true
  _next_phase = false
  crow_climb = false
  kitun_climb = false
  L12_20(L13_21)
  repeat
    L12_20(L13_21)
    L12_20()
  until L12_20
  L12_20()
  L12_20()
  L12_20()
  L12_20()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
  end
end
function pccubesensor2_maku_03_OnEnter(A0_28)
  A0_28:setActive(false)
  _next_phase = true
end
function pccubesensor2_check_01_OnEnter(A0_29)
  _next_phase = true
  print("true")
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_clear_01")
end
function pccubesensor2_check_01_OnLeave()
  _next_phase = false
  print("false")
end
function pccubesensor2_nekowarp_01_OnLeave(A0_30)
  warp_now = true
  invokeTask(function()
    local L0_31
    L0_31 = print
    L0_31("\230\159\177\227\130\146\229\135\186\227\130\136\227\129\134\227\129\168\227\129\151\227\129\166\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151")
    function L0_31()
      Fn_findAreaHandle("co_a_root"):setSceneParameters("co_a_root")
    end
    Fn_catWarp(nil, nil, L0_31)
    warp_now = false
  end)
end
function pccubesensor2_check_02_OnEnter(A0_32)
  warp_now = true
  invokeTask(function()
    _next_phase = false
    Fn_captionViewEnd()
    Fn_setCatWarpCheckPoint("locator2_upper_reset_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\130\175\227\131\170\227\130\162\231\155\180\229\137\141")
    Fn_catWarp()
    warp_now = false
  end)
end
function pccubesensor2_check_03_OnEnter(A0_33)
  upper_clear2 = true
  print("\231\132\161\231\144\134\227\130\132\227\130\138\231\153\187\227\129\163\227\129\159")
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
function pccubesensor2_04_OnEnter(A0_35)
  A0_35:setActive(false)
  _next_phase = true
end
function pccubesensor2_05_OnEnter(A0_36)
  A0_36:setActive(false)
  _next_phase = true
end
function pccubesensor2_clear_01_OnEnter(A0_37)
  local L1_38
  L1_38 = A0_37.setActive
  L1_38(A0_37, false)
  L1_38 = Fn_naviKill
  L1_38()
  L1_38 = findGameObject2
  L1_38 = L1_38("Node", "locator2_navi_01")
  Fn_naviSet(L1_38)
end
function navi_on()
  local L0_39, L1_40
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
