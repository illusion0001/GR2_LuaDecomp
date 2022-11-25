dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep11_common.lua")
_crow = nil
_up_a_12b_hdl = nil
_npc_child = "chi16"
_npc_mama = "wom27"
_npc_man47 = "npcgen2_c2_man47"
_npc_npc_01 = "npcgen2_c2_npc_01"
_npc_npc_02 = "npcgen2_c2_npc_02"
_npc_npc_03 = "npcgen2_c2_npc_03"
_npc_escape = false
_cat_warp = false
function Initialize()
  _sdemo = SDemo.create("ep11_c")
  _up_a_12b_hdl = Fn_findAreaHandle("up_a_12b")
  if _up_a_12b_hdl:isEffectiveness() == false then
    _up_a_12b_hdl:setEffectiveness(true)
    _up_a_12b_hdl:setAreaGroup("ji_c_root")
  end
  Player:setGrabPickupCategPriority("npc", Player.kGrabPickupPrio_High)
  Player:setGrabPickupCategPriority("gimmickbg", Player.kGrabPickupPrio_Low)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
  L0_0 = emergency_catwarp_start
  L0_0 = L0_0()
  L1_1 = Fn_sendEventComSb
  L2_2 = "setPcSensor"
  L3_3 = "pccubesensor2_safty_area"
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_setCatWarp
  L2_2 = false
  L1_1(L2_2)
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = {}
  L1_1.groggy_u_00 = "man01_groggy_u_00"
  _npcMotions0 = L1_1
  L1_1 = Fn_loadNpcEventMotion
  L2_2 = _npc_man47
  L3_3 = _npcMotions0
  L1_1(L2_2, L3_3)
  L1_1 = {}
  L1_1.run_afraid_01 = "man01_run_afraid_01"
  _npcMotions1 = L1_1
  L1_1 = Fn_loadNpcEventMotion
  L2_2 = _npc_npc_01
  L3_3 = _npcMotions1
  L1_1(L2_2, L3_3)
  L1_1 = {}
  L1_1.talk_sad_03 = "wom01_talk_sad_03"
  L1_1.surprise_run_00 = "wom01_surprise_run_00"
  L1_1.run_afraid_00 = "wom01_run_afraid_00"
  _npcMotions2 = L1_1
  L1_1 = Fn_loadNpcEventMotion
  L2_2 = _npc_npc_02
  L3_3 = _npcMotions2
  L1_1(L2_2, L3_3)
  L1_1 = {}
  L1_1.surprise_run_01 = "wom01_surprise_run_01"
  L1_1.run_afraid_01 = "wom01_run_afraid_01"
  _npcMotions3 = L1_1
  L1_1 = Fn_loadNpcEventMotion
  L2_2 = _npc_npc_03
  L3_3 = _npcMotions3
  L1_1(L2_2, L3_3)
  L1_1 = createGameObject2
  L2_2 = "Effect"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setName
  L4_4 = "up_a_11_brk"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setModelName
  L4_4 = "up_a_11_brk"
  L2_2(L3_3, L4_4)
  L2_2 = _up_a_12b_hdl
  L3_3 = L2_2
  L2_2 = L2_2.appendChild
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.try_init
  L2_2(L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.waitForReady
  L2_2(L3_3)
  L2_2 = Fn_findAreaHandle
  L3_3 = "up_a_11"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2
  L2_2 = L2_2.setExpandedAabb
  L4_4 = true
  L2_2(L3_3, L4_4)
  repeat
    L2_2 = print
    L3_3 = "\228\186\161\233\156\138\233\131\189\229\184\130\227\129\174\230\186\150\229\130\153\229\190\133\227\129\161..."
    L2_2(L3_3)
    L2_2 = wait
    L2_2()
    L2_2 = Fn_sendEventComSb
    L3_3 = "isGmReady"
    L2_2 = L2_2(L3_3)
  until L2_2
  L2_2 = Fn_sendEventComSb
  L3_3 = "getCrowHandle"
  L2_2 = L2_2(L3_3)
  L3_3 = typedef_CrowClass
  L3_3 = L3_3.new
  L4_4 = L2_2
  L3_3 = L3_3(L4_4)
  _crow = L3_3
  L3_3 = Fn_sendEventComSb
  L4_4 = "setNpcActive"
  L5_5 = {L6_6, L7_7}
  L6_6 = "sis01"
  L7_7 = "cid01"
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = Fn_sendEventComSb
  L4_4 = "setNpcActive"
  L5_5 = {L6_6, L7_7}
  L6_6 = "chi16"
  L7_7 = "wom27"
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = Fn_sendEventComSb
  L4_4 = "requestSpawn"
  L5_5 = {L6_6, L7_7}
  L6_6 = "enmgen2_01"
  L7_7 = "enmgen2_02"
  L3_3(L4_4, L5_5)
  L3_3 = Fn_findNpc
  L4_4 = _npc_mama
  L3_3 = L3_3(L4_4)
  L4_4 = Fn_findNpc
  L5_5 = _npc_child
  L4_4 = L4_4(L5_5)
  L5_5 = {}
  L5_5.isRepeat = true
  L5_5.isRandom = false
  L6_6 = {
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13
  }
  L7_7 = "lookaround_01"
  L8_8 = "pray_in_00"
  L9_9 = "pray_00"
  L10_10 = "pray_00"
  L11_11 = "pray_00"
  L8_8 = L3_3
  L7_7 = L3_3.playMotion
  L9_9 = L6_6
  L10_10 = L5_5
  L7_7(L8_8, L9_9, L10_10)
  L7_7 = {L8_8}
  L8_8 = "scared_nevy_00"
  L9_9 = L4_4
  L8_8 = L4_4.playMotion
  L10_10 = L7_7
  L11_11 = L5_5
  L8_8(L9_9, L10_10, L11_11)
  L9_9 = L4_4
  L8_8 = L4_4.setEventListener
  L10_10 = "npcFall"
  function L11_11()
    if not _cat_warp then
      print(string.format("%s \227\129\175\232\144\189\228\184\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L4_4:getName()))
      Fn_captionView("ep11_01001")
      L4_4:reset()
      L4_4:setActive(false)
      Fn_scriptGameOver(false)
    end
  end
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = waitSkyStable
  L8_8()
  L8_8 = Fn_sendEventComSb
  L9_9 = "startGmScream"
  L8_8(L9_9)
  L8_8 = npcAction
  L8_8()
  L8_8 = Fn_setGrabNpc
  L9_9 = L4_4
  L10_10 = false
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Fn_missionStart
  L8_8()
  L8_8 = Fn_userCtrlOn
  L8_8()
  L8_8 = Fn_captionView
  L9_9 = "ep11_09018"
  L8_8(L9_9)
  L8_8 = Sound
  L9_9 = L8_8
  L8_8 = L8_8.playSE
  L10_10 = "w10_004"
  L11_11 = 1
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = waitSeconds
  L9_9 = 3.5
  L8_8(L9_9)
  L8_8 = Fn_captionView
  L9_9 = "ep11_09020"
  L8_8(L9_9)
  L8_8 = waitSeconds
  L9_9 = 0.3
  L8_8(L9_9)
  L8_8 = Fn_missionView
  L9_9 = "ep11_09019"
  L8_8(L9_9)
  _currentMissionText = "ep11_09019"
  L8_8 = waitSeconds
  L9_9 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L8_8(L9_9)
  L8_8 = Fn_naviSet
  L9_9 = L4_4
  L8_8(L9_9)
  repeat
    L8_8 = wait
    L8_8()
    L8_8 = Fn_getDistanceToPlayer
    L9_9 = L4_4
    L8_8 = L8_8(L9_9)
    if not (L8_8 < 5) then
      L9_9 = L4_4
      L8_8 = L4_4.isGrabbed
      L8_8 = L8_8(L9_9)
    end
  until L8_8
  L8_8 = Fn_missionView
  L9_9 = "ep11_09021"
  L8_8(L9_9)
  _currentMissionText = "ep11_09021"
  L8_8 = waitSeconds
  L9_9 = _CAPTION_WAIT_AFTER_MISSION_VIEW
  L8_8(L9_9)
  L8_8 = Fn_captionView
  L9_9 = "ep11_09028"
  L8_8(L9_9)
  repeat
    L8_8 = wait
    L8_8()
    L9_9 = L4_4
    L8_8 = L4_4.isGrabbed
    L8_8 = L8_8(L9_9)
  until L8_8
  L8_8 = findGameObject2
  L9_9 = "Node"
  L10_10 = "locator2_navi_child_goal"
  L8_8 = L8_8(L9_9, L10_10)
  L9_9 = Fn_naviSet
  L10_10 = L8_8
  L9_9(L10_10)
  L9_9 = true
  while true do
    L10_10 = Fn_findNpcPuppet
    L11_11 = _npc_child
    L10_10 = L10_10(L11_11)
    L11_11 = Fn_get_distance
    L15_15 = L13_13(L14_14)
    L11_11 = L11_11(L12_12, L13_13, L14_14, L15_15, L13_13(L14_14))
    if not (L11_11 < 4) then
      L11_11 = L4_4.isGrabbed
      L11_11 = L11_11(L12_12)
      if L11_11 then
        if not L9_9 then
          L11_11 = Fn_naviSet
          L11_11(L12_12)
          L9_9 = true
        end
      elseif L9_9 then
        L11_11 = Fn_naviSet
        L11_11(L12_12)
        L9_9 = false
      end
      L11_11 = wait
      L11_11()
    end
  end
  L10_10 = Fn_sendEventComSb
  L11_11 = "requestIdling"
  L10_10(L11_11, L12_12, L13_13)
  L10_10 = Fn_setGrabReleaseNpc
  L11_11 = L4_4
  L10_10(L11_11)
  L10_10 = Fn_captionView
  L11_11 = "ep11_09022"
  L10_10(L11_11)
  L10_10 = Fn_naviKill
  L10_10()
  L10_10 = Fn_sendEventComSb
  L11_11 = "stopGmScream"
  L10_10(L11_11)
  L10_10 = invokeTask
  L11_11 = reunionDemo
  L10_10(L11_11, L12_12, L13_13)
  L10_10 = Fn_sendEventComSb
  L11_11 = "stopGmScream"
  L10_10(L11_11)
  L10_10 = waitSeconds
  L11_11 = 5
  L10_10(L11_11)
  L10_10 = Fn_sendEventComSb
  L11_11 = "requestKill"
  L10_10(L11_11, L12_12)
  L10_10 = Player
  L11_11 = L10_10
  L10_10 = L10_10.setEnergy
  L15_15 = Player
  L15_15 = L15_15.kEnergy_Gravity
  L15_15 = L13_13(L14_14, L15_15)
  L10_10(L11_11, L12_12, L13_13, L14_14, L15_15, L13_13(L14_14, L15_15))
  L10_10 = Player
  L11_11 = L10_10
  L10_10 = L10_10.setEnergyInfinite
  L10_10(L11_11, L12_12, L13_13)
  L10_10 = Player
  L11_11 = L10_10
  L10_10 = L10_10.setStay
  L10_10(L11_11, L12_12, L13_13)
  L10_10 = Fn_sendEventComSb
  L11_11 = "getGmMouth"
  L10_10 = L10_10(L11_11)
  L11_11 = _sdemo
  L11_11 = L11_11.set
  L15_15 = false
  L11_11(L12_12, L13_13, L14_14, L15_15)
  L11_11 = {L12_12, L13_13}
  L12_12.pos = "locator2_cam_pos_02"
  L12_12.time = 3
  L12_12.hashfunc = "easeIn"
  L13_13.pos = "locator2_cam_pos_03"
  L13_13.time = 3
  L13_13.hashfunc = "easeOut"
  L15_15 = nil
  L12_12(L13_13, L14_14, L15_15)
  repeat
    L12_12()
  until L12_12
  L12_12(L13_13)
  _up_a_11_hdl = L12_12
  L12_12(L13_13, L14_14)
  if L12_12 then
    L15_15 = true
    L12_12(L13_13, L14_14, L15_15)
    L12_12(L13_13, L14_14)
  end
  L15_15 = true
  L12_12(L13_13, L14_14, L15_15)
  L12_12(L13_13, L14_14)
  L12_12(L13_13)
  L12_12(L13_13, L14_14)
  L12_12(L13_13)
  L12_12(L13_13)
  repeat
    L12_12()
  until L12_12
  L12_12(L13_13)
  for L15_15 = 1, 9 do
    invokeTask(function()
      local L0_16
      L0_16 = waitSeconds
      L0_16(RandF(0.1, 1.5))
      L0_16 = string
      L0_16 = L0_16.format
      L0_16 = L0_16("locator2_sdemoc_sfx_%02d", L15_15)
      Fn_createEffect("ef_ev_brksmk_01", "ef_ev_brksmk_01", L0_16, false)
    end)
    break
  end
  L15_15 = 1
  L12_12(L13_13, L14_14, L15_15)
  L12_12(L13_13)
  L13_13.pos = "locator2_cam_pos_04"
  L13_13.time = 6
  L11_11 = L12_12
  L15_15 = nil
  L12_12(L13_13, L14_14, L15_15)
  L15_15 = {}
  L15_15.deg = 60
  L12_12(L13_13, L14_14, L15_15, "Linear")
  L12_12(L13_13)
  L10_10 = L12_12
  L13_13.pos = L10_10
  L13_13.time = 3
  L13_13.hashfunc = "easeInOut"
  aimPos = L12_12
  L15_15 = aimPos
  L12_12(L13_13, L14_14, L15_15)
  repeat
    L12_12()
  until L12_12
  L12_12(L13_13)
  L12_12(L13_13)
  repeat
    L12_12()
    L15_15 = "f"
  until L12_12
  L12_12(L13_13)
  L12_12(L13_13)
  L10_10 = L12_12
  L13_13.pos = L10_10
  L13_13.time = 1
  L13_13.hashfunc = "easeInOut"
  aimPos = L12_12
  L15_15 = aimPos
  L12_12(L13_13, L14_14, L15_15)
  L12_12(L13_13)
  L14_14.pos = "locator2_cam_pos_01"
  L14_14.time = 5
  L14_14.hashfunc = "easeOut"
  L11_11 = L13_13
  L14_14.pos = L12_12
  L14_14.time = 5
  L14_14.hashfunc = "easeOut"
  aimPos = L13_13
  L15_15 = L11_11
  L13_13(L14_14, L15_15, aimPos)
  L15_15 = 5
  L13_13(L14_14, L15_15, {deg = 45}, "Linear")
  L13_13(L14_14)
  repeat
    L13_13()
    L15_15 = "move"
  until L13_13
  L13_13(L14_14)
  L13_13(L14_14)
  L15_15 = "b"
  L13_13(L14_14, L15_15, "ep11_ghost_scream", 1)
  _npc_escape = true
  L15_15 = true
  L13_13(L14_14, L15_15)
  L13_13(L14_14)
  L15_15 = "locator2_c2_cam_02"
  L13_13(L14_14, L15_15, L12_12, true)
  L15_15 = 4
  L13_13(L14_14, L15_15, {deg = 35}, "Linear")
  L13_13(L14_14)
  L15_15 = "b"
  L13_13(L14_14, L15_15, "ep11_ghost_scream", 1)
  L13_13(L14_14)
  L13_13(L14_14)
  L13_13(L14_14)
  L15_15 = "locator2_c2_cam_01"
  L13_13(L14_14, L15_15, L12_12, true)
  L15_15 = 1
  L13_13(L14_14, L15_15, {deg = 45}, "Linear")
  L13_13(L14_14)
  L13_13(L14_14)
  L13_13(L14_14)
  repeat
    L13_13()
    L15_15 = "move"
  until L13_13
  L13_13(L14_14)
  L13_13(L14_14)
  L15_15 = Player
  L15_15 = L15_15.kEnergy_Gravity
  L13_13(L14_14, L15_15, Player:getEnergyMax(Player.kEnergy_Gravity))
  L15_15 = Player
  L15_15 = L15_15.kEnergy_Gravity
  L13_13(L14_14, L15_15, true)
  L15_15 = false
  L13_13(L14_14, L15_15)
  if L0_0 then
    L13_13(L14_14)
  end
  L13_13()
  L13_13()
  L13_13()
end
function Finalize()
  if Fn_getPlayer() then
    Player:resetGrabPickupCategPriority()
    Camera:stopShake(0.5)
  end
  Mob:makeSituationPanic(false)
end
function reunionDemo(A0_17, A1_18)
  local L2_19, L3_20
  L2_19 = {}
  L2_19.runLength = -1
  L2_19.arrivedLength = 1
  L2_19.recast = true
  L3_20 = {}
  L3_20.startIndex = 1
  L3_20.goalDirection = false
  Fn_playMotionNpc(A0_17, "pray_00", true)
  A1_18:move({
    {
      pos = A0_17:getPuppet():getWorldPos(),
      opt = L2_19
    }
  }, L3_20)
  A0_17:turn(A1_18:getPuppet():getWorldPos())
  repeat
    wait()
  until A0_17:isTurnEnd()
  Fn_playMotionNpc(A0_17, "scared_nevy_in_00", true)
  while true do
    if A0_17:isMotionEnd() then
      Fn_playMotionNpc(A0_17, "scared_nevy_00", false)
    end
    if A1_18:isMoveEnd() and A1_18:isMotionEnd() then
      Fn_playMotionNpc(A1_18, "talk_laugh_00", false)
    end
    wait()
  end
end
function npcAction()
  invokeTask(function()
    local L0_21, L1_22, L2_23, L3_24
    L0_21 = {
      L1_22,
      L2_23,
      L3_24,
      "inform_ex_out_00",
      "scared_04"
    }
    L1_22 = "inform_ex_in_00"
    L2_23 = "inform_ex_00"
    L3_24 = "inform_ex_00"
    L1_22 = Fn_findNpc
    L2_23 = _npc_man47
    L1_22 = L1_22(L2_23)
    L3_24 = L1_22
    L2_23 = L1_22.playMotion
    L2_23(L3_24, L0_21, {
      isRepeat = true,
      isRandom = false,
      animBlendDuration = 0.5
    })
    repeat
      L2_23 = wait
      L2_23()
      L2_23 = _npc_escape
    until L2_23
    L3_24 = L1_22
    L2_23 = L1_22.setActive
    L2_23(L3_24, true)
    L2_23 = waitSeconds
    L3_24 = 1
    L2_23(L3_24)
    L2_23 = Sound
    L3_24 = L2_23
    L2_23 = L2_23.playSE
    L2_23(L3_24, "m30_011a", 1, "", Fn_findNpcPuppet(_npc_man47))
    L2_23 = Fn_captionView
    L3_24 = "ep11_09029"
    L2_23(L3_24)
    L2_23 = {}
    L2_23.isRepeat = false
    L2_23.isRandom = false
    L2_23.animBlendDuration = 1
    L3_24 = {
      _npcMotions0.groggy_u_00
    }
    L1_22:playMotion(L3_24, L2_23)
    waitSeconds(8)
    L1_22:changeMob()
  end)
  invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28
    L0_25 = {L1_26, L2_27}
    L1_26 = "scared_03"
    L2_27 = "talk_sad_01"
    L1_26 = Fn_findNpc
    L2_27 = _npc_npc_01
    L1_26 = L1_26(L2_27)
    L3_28 = L1_26
    L2_27 = L1_26.playMotion
    L2_27(L3_28, L0_25, {
      isRepeat = true,
      isRandom = false,
      animBlendDuration = 0.5
    })
    repeat
      L2_27 = wait
      L2_27()
      L2_27 = _npc_escape
    until L2_27
    L2_27 = {}
    L2_27.anim_run = "man01_run_afraid_01"
    L2_27.anim_walk_speed = 1
    L2_27.runLength = -1
    L2_27.recast = true
    L3_28 = {
      {
        pos = "locator2_c2_npc_01_01",
        opt = L2_27
      },
      {
        pos = "locator2_c2_npc_01_02",
        opt = L2_27
      },
      {
        pos = "locator2_c2_npc_01_03",
        opt = L2_27
      },
      {
        pos = "locator2_c2_npc_01_04",
        opt = L2_27
      }
    }
    Fn_findNpc("npcgen2_c2_npc_01"):move(L3_28, {startIndex = 1, goalDirection = false})
  end)
  invokeTask(function()
    local L0_29, L1_30, L2_31, L3_32
    L0_29 = {L1_30, L2_31}
    L1_30 = "wom01_talk_sad_03"
    L2_31 = "scared_01"
    L1_30 = Fn_findNpc
    L2_31 = _npc_npc_02
    L1_30 = L1_30(L2_31)
    L3_32 = L1_30
    L2_31 = L1_30.playMotion
    L2_31(L3_32, L0_29, {
      isRepeat = true,
      isRandom = false,
      animBlendDuration = 0.5
    })
    repeat
      L2_31 = wait
      L2_31()
      L2_31 = _npc_escape
    until L2_31
    L3_32 = L1_30
    L2_31 = L1_30.playMotion
    L2_31(L3_32, "surprise_00", {animBlendDuration = 0.5})
    repeat
      L2_31 = wait
      L2_31()
      L3_32 = L1_30
      L2_31 = L1_30.isMotionEnd
      L2_31 = L2_31(L3_32)
    until L2_31
    L2_31 = {}
    L2_31.anim_run = "wom01_run_afraid_00"
    L2_31.anim_walk_speed = 1
    L2_31.runLength = -1
    L2_31.recast = true
    L3_32 = {
      {
        pos = "locator2_c2_npc_02_01",
        opt = L2_31
      },
      {
        pos = "locator2_c2_npc_02_02",
        opt = L2_31
      },
      {
        pos = "locator2_c2_npc_02_03",
        opt = L2_31
      },
      {
        pos = "locator2_c2_npc_02_04",
        opt = L2_31
      }
    }
    Fn_findNpc("npcgen2_c2_npc_02"):move(L3_32, {startIndex = 1, goalDirection = false})
  end)
  invokeTask(function()
    local L0_33, L1_34, L2_35, L3_36
    L0_33 = {L1_34}
    L1_34 = "scared_03"
    L1_34 = Fn_findNpc
    L2_35 = _npc_npc_03
    L1_34 = L1_34(L2_35)
    L3_36 = L1_34
    L2_35 = L1_34.playMotion
    L2_35(L3_36, L0_33, {
      isRepeat = true,
      isRandom = false,
      animBlendDuration = 0.5
    })
    repeat
      L2_35 = wait
      L2_35()
      L2_35 = _npc_escape
    until L2_35
    L3_36 = L1_34
    L2_35 = L1_34.playMotion
    L2_35(L3_36, "surprise_01", {animBlendDuration = 0.5})
    repeat
      L2_35 = wait
      L2_35()
      L3_36 = L1_34
      L2_35 = L1_34.isMotionEnd
      L2_35 = L2_35(L3_36)
    until L2_35
    L2_35 = {}
    L2_35.anim_run = "wom01_run_afraid_01"
    L2_35.anim_walk_speed = 1
    L2_35.runLength = -1
    L2_35.recast = true
    L3_36 = {
      {
        pos = "locator2_c2_npc_03_01",
        opt = L2_35
      },
      {
        pos = "locator2_c2_npc_03_02",
        opt = L2_35
      },
      {
        pos = "locator2_c2_npc_03_03",
        opt = L2_35
      },
      {
        pos = "locator2_c2_npc_03_04",
        opt = L2_35
      }
    }
    Fn_findNpc("npcgen2_c2_npc_03"):move(L3_36, {startIndex = 1, goalDirection = false})
  end)
end
function pccubesensor2_warning_OnEnter(A0_37)
  local L1_38
end
function pccubesensor2_warning_OnLeave(A0_39)
  invokeTask(function()
    if Fn_findNpc(_npc_child):isGrabbed() then
      Fn_captionViewWait("ep11_09028")
    end
  end)
end
function pccubesensor2_outrange_OnEnter(A0_40)
  local L1_41
end
function pccubesensor2_outrange_OnLeave(A0_42)
  invokeTask(function()
    local L0_43
    _cat_warp = true
    L0_43 = Fn_userCtrlOff
    L0_43()
    L0_43 = Fn_findNpc
    L0_43 = L0_43(_npc_child)
    if L0_43:isGrabbed() then
      Fn_setGrabReleaseNpc(_npc_child)
      Fn_catWarp()
      Fn_warpNpc(_npc_child, "locator2_pc_start_pos")
      Fn_setGrabNpc(L0_43, false, true)
      Player:setGrabObject(Fn_findNpcPuppet(_npc_child))
      Fn_captionViewWait("ep11_09028")
      Fn_missionView(_currentMissionText)
    else
      Fn_catWarp()
      Fn_missionView(_currentMissionText)
    end
    Fn_userCtrlOn()
    _cat_warp = false
  end)
end
