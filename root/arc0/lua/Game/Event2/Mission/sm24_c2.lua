dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Mission/sm24_common.lua")
puppet_tbl = {}
is_in_sensor = false
EAVESDROP_RANGE = 4
SM24_PLAYER_MOTION = {
  spiralclaw_a = "kit01_spiralclaw_a_00",
  spiralclaw_b = "kit01_spiralclaw_b_00",
  spiralclaw_c = "kit01_spiralclaw_c_00",
  stay_air = "kit01_float_fighting_00"
}
pigeon_data_tbl = {
  {
    npc_name = "pigeon_01",
    reset_pos_name = "locator2_pigeon_01_move_01",
    fly_prefix = "locator2_pigeon_01_move_",
    away_prefix = "locator2_pigeon_01_away_",
    fly_task = nil
  },
  {
    npc_name = "pigeon_02",
    reset_pos_name = "locator2_pigeon_02_move_01",
    fly_prefix = "locator2_pigeon_02_move_",
    away_prefix = "locator2_pigeon_02_away_",
    fly_task = nil
  }
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "pigeon_01",
      type = "brd01",
      node = "locator2_pigeon_01_move_01",
      use_gravity = false
    },
    {
      name = "pigeon_02",
      type = "brd01",
      node = "locator2_pigeon_02_move_01",
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadPlayerMotion(SM24_PLAYER_MOTION)
  Fn_pcSensorOff("pccubesensor2_workshop_01")
  Fn_pcSensorOff("pccubesensor2_workshop_02")
  Fn_pcSensorOff("pccubesensor2_workshop_out_01")
  Fn_pcSensorOff("pccubesensor2_goal_01")
  sdemo = SDemo.create("sm24_sdemo")
end
function Ingame()
  puppet_tbl.sm24_man01 = Fn_findNpcPuppet("sm24_man01")
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_pcSensorOn("pccubesensor2_workshop_01")
  Fn_sendEventComSb("invokeOutOfRange", "C2")
  Player:setStay(false)
  Fn_captionView("sm24_02013")
  RAC_missionNaviCaption("sm24_02014", "locator2_navi_workshop_01")
  is_in_sensor = false
  while is_in_sensor == false do
    wait()
  end
  is_in_sensor = false
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_workshop_01")
  Fn_captionViewWait("sm24_02015")
  waitSeconds(1.5)
  Fn_captionView("sm24_02016")
  invokeTask(function()
    RAC_missionNaviCaption("sm24_02017", "locator2_navi_workshop_02")
    Fn_pcSensorOn("pccubesensor2_workshop_02")
  end)
  is_in_sensor = false
  while is_in_sensor == false do
    wait()
  end
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_workshop_02")
  is_in_sensor = false
  waitSeconds(1)
  Fn_captionView("sm24_02018")
  waitSeconds(1.5)
  Fn_naviKill()
  invokeTask(function()
    pigeonFly()
  end)
  for _FORV_3_ = 1, #pigeon_data_tbl do
    while pigeon_data_tbl[_FORV_3_].fly_task == nil do
      wait()
    end
    while pigeon_data_tbl[_FORV_3_].fly_task:isRunning() do
      wait()
    end
    pigeon_data_tbl[_FORV_3_].fly_task:abort()
    pigeon_data_tbl[_FORV_3_].fly_task = nil
  end
  Fn_lockPlayerAbility(Player.kAbility_SpAttack)
  HUD:spgDispReq_FadeIn()
  HUD:setGaugeFourceVisible(true)
  workshopEavesdropCaption()
  Fn_kaiwaDemoView("sm24_00800k")
  Player:setSituation(Player.kSituation_InCombat, true, 3, true, false)
  pigeonFly(true)
  Fn_missionView("sm24_02019")
  waitSeconds(2)
  FatalMarker.create(kFATAL_TYPE_EMP):set(findGameObject2("Node", "locator2_fatal_marker_pos_01"), nil, false)
  FatalMarker.create(kFATAL_TYPE_EMP):run()
  repeat
    wait()
    if Fn_getDistanceToPlayer("locator2_fatal_marker_pos_01") >= 50 then
      FatalMarker.create(kFATAL_TYPE_EMP):kill()
      Fn_naviSet(findGameObject2("Node", "locator2_fatal_marker_pos_01"))
    else
      Fn_naviKill()
      FatalMarker.create(kFATAL_TYPE_EMP):run()
    end
  until FatalMarker.create(kFATAL_TYPE_EMP):isFatalFinish()
  FatalMarker.create(kFATAL_TYPE_EMP):kill()
  Fn_unLockPlayerAbility(Player.kAbility_SpAttack)
  HUD:setGaugeFourceVisible(false)
  playSdemo05()
  waitSeconds(2)
  Fn_sendEventComSb("endOutOfRange")
  RAC_startCatWarpControl("sm24_area_out_all", nil, "pccubesensor2_out_01", "pccubesensor2_out_02", "warppoint2_pc_13", nil, nil, "sm03_02023", setDropGrab, setTargetGrabWait)
  Fn_userCtrlOn()
  Fn_kaiwaDemoView("sm24_00850k")
  RAC_missionNaviCaption("sm24_02020", "locator2_navi_goal_01")
  is_in_sensor = false
  Fn_pcSensorOn("pccubesensor2_goal_01")
  while is_in_sensor == false or puppet_tbl.sm24_man01:isGrabbed() == false do
    wait()
  end
  Fn_userCtrlOff()
  is_in_sensor = false
  Fn_pcSensorOff("pccubesensor2_goal_01")
  Fn_naviKill()
  for _FORV_4_, _FORV_5_ in ipairs(pigeon_data_tbl) do
    Fn_setNpcActive(_FORV_5_.npc_name, false)
  end
  invokeTask(function()
    local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
    L0_1 = {
      L1_2,
      L2_3,
      L3_4,
      L4_5
    }
    L4_5 = "sm24_02024"
    for L4_5, L5_6 in L1_2(L2_3) do
      Sound:playSE("m33_009", 1, "", puppet_tbl.sm24_man01)
      Fn_captionViewWait(L5_6)
    end
  end):abort()
  waitSeconds(1.5)
  Fn_findNpc("sm24_man01"):setGrabReleaseForce(true)
  Fn_findNpc("sm24_man01"):setIgnoreGrab(true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function workshopEavesdropCaption()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22
  L0_7 = 1
  L1_8 = 2
  L2_9 = {
    L3_10,
    L4_11,
    L5_12
  }
  L3_10 = {
    L4_11,
    L5_12,
    L6_13,
    L7_14
  }
  L4_11 = {}
  L4_11.caption = "sm24_02025"
  L4_11.se = "m33_911"
  L4_11.se_target = L1_8
  L4_11.motion = nil
  L5_12.caption = "sm24_02026"
  L5_12.se = "m33_911"
  L5_12.se_target = L1_8
  L5_12.motion = 1
  L6_13.caption = "sm24_02027"
  L6_13.se = "w17_911"
  L6_13.se_target = L1_8
  L6_13.motion = 2
  L7_14.caption = "sm24_02028"
  L7_14.se = nil
  L7_14.se_target = nil
  L7_14.motion = nil
  L4_11 = {
    L5_12,
    L6_13,
    L7_14,
    L8_15,
    L9_16
  }
  L5_12.caption = "sm24_02029"
  L5_12.se = "m33_911"
  L5_12.se_target = L1_8
  L5_12.motion = 1
  L6_13.caption = "sm24_02030"
  L6_13.se = "m33_911"
  L6_13.se_target = L1_8
  L6_13.motion = 1
  L7_14.caption = "sm24_02031"
  L7_14.se = "w17_911"
  L7_14.se_target = L1_8
  L7_14.motion = 2
  L8_15 = {}
  L8_15.caption = "sm24_02032"
  L8_15.se = "w17_911"
  L8_15.se_target = L1_8
  L8_15.motion = 2
  L9_16 = {}
  L9_16.caption = "sm24_02033"
  L9_16.se = nil
  L9_16.se_target = nil
  L9_16.motion = nil
  L6_13.caption = "sm24_02034"
  L6_13.se = "w17_911"
  L6_13.se_target = L1_8
  L6_13.motion = 2
  L7_14.caption = "sm24_02035"
  L7_14.se = "w17_911"
  L7_14.se_target = L1_8
  L7_14.motion = 2
  L8_15 = {}
  L8_15.caption = "sm24_02036"
  L8_15.se = "m33_911"
  L8_15.se_target = L1_8
  L8_15.motion = 1
  L9_16 = {}
  L9_16.caption = "sm24_02037"
  L9_16.se = nil
  L9_16.se_target = nil
  L9_16.motion = nil
  L3_10 = {
    L4_11,
    L5_12,
    L6_13
  }
  L4_11 = 0.25
  L4_11 = Player
  L4_11 = L4_11.setEnergy
  L4_11(L5_12, L6_13, L7_14)
  L4_11 = findGameObject2
  L4_11 = L4_11(L5_12, L6_13)
  for L8_15, L9_16 in L5_12(L6_13) do
    for L13_20, L14_21 in L10_17(L11_18) do
      L15_22 = Fn_getDistanceToPlayer
      L15_22 = L15_22("locator2_workshop_se_target_01")
      if L15_22 >= EAVESDROP_RANGE then
        L15_22 = Fn_captionViewWait
        L15_22("sm24_02038")
        L15_22 = Fn_naviSet
        L15_22(findGameObject2("Node", "locator2_navi_workshop_02"))
        repeat
          L15_22 = wait
          L15_22()
          L15_22 = Fn_getDistanceToPlayer
          L15_22 = L15_22("locator2_workshop_se_target_01")
        until L15_22 < EAVESDROP_RANGE
        L15_22 = Fn_naviKill
        L15_22()
      end
      L15_22 = L14_21.se
      if L15_22 ~= nil then
        L15_22 = nil
        if L14_21.se_target == L0_7 then
          L15_22 = nil
        elseif L14_21.se_target == L1_8 then
          L15_22 = L4_11
        end
        Sound:playSE(L14_21.se, 0.8, "", L15_22)
      end
      L15_22 = L14_21.motion
      if L15_22 ~= nil then
        L15_22 = Fn_playMotionNpc
        L15_22(pigeon_data_tbl[L14_21.motion].npc_name, "eat", false)
        L15_22 = Fn_playMotionNpc
        L15_22(pigeon_data_tbl[L14_21.motion % 2 + 1].npc_name, "stay_01", false)
      else
        L15_22 = Fn_playMotionNpc
        L15_22(pigeon_data_tbl[1].npc_name, "stay_01", false)
        L15_22 = Fn_playMotionNpc
        L15_22(pigeon_data_tbl[2].npc_name, "stay_01", false)
      end
      L15_22 = Fn_captionViewWait
      L15_22(L14_21.caption)
    end
    L13_20 = Player
    L14_21 = L13_20
    L13_20 = L13_20.getEnergyMax
    L15_22 = Player
    L15_22 = L15_22.kEnergy_SpAttack
    L13_20 = L13_20(L14_21, L15_22)
    L14_21 = L3_10[L8_15]
    L13_20 = L13_20 * L14_21
    L10_17(L11_18, L12_19, L13_20)
  end
end
function playSdemo05()
  local L0_23, L1_24, L2_25, L3_26
  L0_23 = HUD
  L1_24 = L0_23
  L0_23 = L0_23.whiteout
  L2_25 = 0.3
  L0_23(L1_24, L2_25)
  L0_23 = waitSeconds
  L1_24 = 0.5
  L0_23(L1_24)
  L0_23 = Fn_userCtrlAllOff
  L0_23()
  L0_23 = Fn_resetPcPos
  L1_24 = "warppoint2_pc_12"
  L0_23(L1_24)
  L0_23 = Player
  L1_24 = L0_23
  L0_23 = L0_23.setAttrTune
  L2_25 = Player
  L2_25 = L2_25.kAttrTune_Normal
  L0_23(L1_24, L2_25)
  L0_23 = Player
  L1_24 = L0_23
  L0_23 = L0_23.setSituation
  L2_25 = Player
  L2_25 = L2_25.kSituation_InCombat
  L3_26 = true
  L0_23(L1_24, L2_25, L3_26, 3, true, false)
  L0_23 = Fn_playPlayerMotion
  L1_24 = SM24_PLAYER_MOTION
  L1_24 = L1_24.stay_air
  L2_25 = -1
  L3_26 = 0.3
  L0_23(L1_24, L2_25, L3_26)
  L0_23 = sdemo
  L1_24 = L0_23
  L0_23 = L0_23.reset
  L0_23(L1_24)
  L0_23 = sdemo
  L1_24 = L0_23
  L0_23 = L0_23.set
  L2_25 = "locator2_sdemo_05_cam_01"
  L3_26 = Fn_getPlayer
  L3_26 = L3_26()
  L0_23(L1_24, L2_25, L3_26, true, Vector(0, 1, 0))
  L0_23 = sdemo
  L1_24 = L0_23
  L0_23 = L0_23.switchCamera
  L2_25 = true
  L0_23(L1_24, L2_25)
  L0_23 = HUD
  L1_24 = L0_23
  L0_23 = L0_23.fadein
  L2_25 = 1
  L0_23(L1_24, L2_25)
  L0_23 = waitSeconds
  L1_24 = 0.5
  L0_23(L1_24)
  L0_23 = false
  L1_24 = invokeTask
  function L2_25()
    local L0_27
    L0_27 = Sound
    L0_27 = L0_27.playSE
    L0_27(L0_27, "pc1_scratch", 1)
    L0_27 = Sound
    L0_27 = L0_27.playSE
    L0_27(L0_27, "sm24_pc1_008", 1)
    L0_27 = Fn_createEffect
    L0_27 = L0_27("eff_pl_59", "eff_pl_59", Fn_getPlayerWorldPos(), true, nil, false)
    L0_27:setRot(XYZRotQuaternionEular(L0_27:getRot().x + 180, L0_27:getRot().y, L0_27:getRot().z))
    Fn_appendToPlayerJoint(L0_27, "G2EffectorLocator1", true)
    L0_27:setPos(Vector(L0_27:getPos().x, L0_27:getPos().y + 2, L0_27:getPos().z))
    L0_27:try_init()
    L0_27:waitForReady()
    Fn_playPlayerMotionWait(SM24_PLAYER_MOTION.spiralclaw_a, 0, 0.3)
    Fn_playPlayerMotion(SM24_PLAYER_MOTION.spiralclaw_b, -1)
    L0_27:try_start()
    L0_27:setLoop(true)
    L0_27:play()
    while L0_23 == false do
      wait()
    end
    Fn_setAlpha(L0_27, false, 0.5)
    L0_27:kill()
    Fn_playPlayerMotionWait(SM24_PLAYER_MOTION.spiralclaw_c, 0)
  end
  L1_24(L2_25)
  L1_24 = waitSeconds
  L2_25 = 0.5
  L1_24(L2_25)
  L1_24 = sdemo
  L2_25 = L1_24
  L1_24 = L1_24.play
  L3_26 = {
    {
      pos = "locator2_sdemo_05_cam_02",
      time = 2.5,
      hashfunc = "Accel3"
    }
  }
  L1_24(L2_25, L3_26, {
    {
      pos = "locator2_sdemo_05_aim_02",
      time = 2
    }
  })
  L1_24 = wait
  L2_25 = 15
  L1_24(L2_25)
  L1_24 = findGameObject2
  L2_25 = "Node"
  L3_26 = "locator2_fatal_marker_pos_01"
  L1_24 = L1_24(L2_25, L3_26)
  L2_25 = Camera
  L3_26 = L2_25
  L2_25 = L2_25.shake3D
  L2_25(L3_26, 5, 0.2, 9, L1_24:getWorldPos(), 0)
  L2_25 = waitSeconds
  L3_26 = 1.5
  L2_25(L3_26)
  L0_23 = true
  L2_25 = Fn_blackout
  L3_26 = 0.5
  L2_25(L3_26)
  L2_25 = waitSeconds
  L3_26 = 0.5
  L2_25(L3_26)
  L2_25 = sdemo
  L3_26 = L2_25
  L2_25 = L2_25.stop
  L2_25(L3_26)
  L2_25 = Sound
  L3_26 = L2_25
  L2_25 = L2_25.playSE
  L2_25(L3_26, "sm24_glass_break", 1)
  L2_25 = waitSeconds
  L3_26 = 0.5
  L2_25(L3_26)
  L2_25 = Sound
  L3_26 = L2_25
  L2_25 = L2_25.playSE
  L2_25(L3_26, "sm24_m33_936b", 1)
  L2_25 = Sound
  L3_26 = L2_25
  L2_25 = L2_25.playSE
  L2_25(L3_26, "sm24_w17_936b", 1)
  L2_25 = Fn_captionViewWait
  L3_26 = "sm24_02039"
  L2_25(L3_26, nil, nil, Font.kLayerFront)
  L2_25 = Fn_captionViewWait
  L3_26 = "sm24_02040"
  L2_25(L3_26, nil, nil, Font.kLayerFront)
  L2_25 = Fn_setNpcActive
  L3_26 = "sm24_man01"
  L2_25(L3_26, true)
  L2_25 = setDropGrab
  L2_25()
  L2_25 = setTargetGrabWait
  L2_25()
  L2_25 = findGameObject2
  L3_26 = "Node"
  L2_25 = L2_25(L3_26, "locator2_window")
  L3_26 = createGameObject2
  L3_26 = L3_26("SimpleModel")
  L3_26:setModelName("g1_window_ms_04_demo")
  L2_25:appendChild(L3_26)
  L3_26:try_init()
  L3_26:waitForReady()
  L3_26:try_start()
  Player:setEnergy(Player.kEnergy_SpAttack, 0, true)
  Fn_fadein()
end
function setDropGrab()
  Player:dropGrabObject()
  wait()
end
function setTargetGrabWait()
  Fn_resetPcPos("warppoint2_pc_13")
  Player:setAction(Player.kAction_Float)
  Fn_warpNpc("sm24_man01", "warppoint2_man_05")
  while Fn_findNpc("sm24_man01"):isReady() == false do
    wait()
  end
  Fn_setGrabNpc("sm24_man01", false, false)
  while Player:setGrabObject(Fn_findNpcPuppet("sm24_man01")) == false do
    wait()
  end
end
function pigeonFly(A0_28)
  local L1_29, L2_30, L3_31, L4_32
  for L4_32 = 1, #L2_30 do
    invokeTask(function()
      local L0_33
      L0_33 = Fn_setNpcActive
      L0_33(pigeon_data_tbl[L4_32].npc_name, true)
      L0_33 = pigeon_data_tbl
      L0_33 = L0_33[L4_32]
      if L0_33 ~= nil then
        L0_33 = nil
        if A0_28 == nil then
          L0_33 = pigeon_data_tbl[L4_32].fly_prefix
        else
          L0_33 = pigeon_data_tbl[L4_32].away_prefix
        end
        pigeon_data_tbl[L4_32].fly_task = invokeFlyAwayNpcTask(pigeon_data_tbl[L4_32].npc_name, L0_33, 5, true, true, true, A0_28)
      end
    end)
    if A0_28 then
      waitSeconds(0.5)
    else
    end
  end
end
function invokeFlyAwayNpcTask(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39, A6_40)
  local L7_41
  if A6_40 == nil then
    A6_40 = false
  end
  L7_41 = {}
  L7_41.move_task = RAC_InvokePursueFlyTask(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39)
  L7_41.timer_task = invokeTask(function()
    waitSeconds(3)
  end)
  function L7_41.update(A0_42)
    while L7_41.move_task:isRunning() do
      if A6_40 then
        while A0_42.timer_task:isRunning() do
          wait()
        end
        while 0 < 100 and Fn_findNpcPuppet(A0_34):getActive() do
          Fn_findNpcPuppet(A0_34):setAlpha(1 - (0 + 2) / 100)
          wait()
        end
        break
      end
      wait()
    end
  end
  function L7_41.destractor(A0_43)
    A0_43.move_task:abort()
    A0_43.move_task = nil
    if A6_40 then
      Fn_findNpcPuppet(A0_34):setAlpha(1)
      RAC_stopNpcMoveTask(A0_34)
      Fn_setNpcActive(A0_34, false)
    end
  end
  return RAC_InvokeTaskWithDestractor(L7_41.update, L7_41.destractor, L7_41)
end
function Finalize()
  if Fn_getPlayer() then
    RAC_endCatWarpControl("sm24_area_out_all")
    Fn_resetCoercionPose()
  end
end
function pccubesensor2_workshop_01_OnEnter()
  local L0_44, L1_45
  is_in_sensor = true
end
function pccubesensor2_workshop_01_OnLeave()
  local L0_46, L1_47
  is_in_sensor = false
end
function pccubesensor2_workshop_02_OnEnter()
  local L0_48, L1_49
  is_in_sensor = true
end
function pccubesensor2_workshop_02_OnLeave()
  local L0_50, L1_51
  is_in_sensor = false
end
function pccubesensor2_goal_01_OnEnter()
  local L0_52, L1_53
  is_in_sensor = true
end
function pccubesensor2_goal_01_OnLeave()
  local L0_54, L1_55
  is_in_sensor = false
end
