dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
_puppet_tbl = {}
_sdemo = nil
enmgen2_boss_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_01"
    },
    {
      type = "mechbig_boss",
      locator = "locator_crew_01",
      name = "ep07_boss_01",
      target_vehicle = "landingship_01",
      ai_spawn_option = "MechBig/mechbig_boss"
    }
  }
}
function Initialize()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
  _sdemo = SDemo.create("ep07_sdemo")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestSpawnSupportCrow"
  L2_2 = Supporter
  L2_2 = L2_2.FirstAction
  L2_2 = L2_2.Ground
  L3_3 = "locator2_crow_start_pos_03"
  L0_0(L1_1, L2_2, L3_3)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = _puppet_tbl
    L1_1 = Fn_sendEventComSb
    L2_2 = "getCrowPuppetHundle"
    L1_1 = L1_1(L2_2)
    L0_0.pup_crow = L1_1
    L0_0 = _puppet_tbl
    L0_0 = L0_0.pup_crow
  until L0_0 ~= nil
  L0_0 = crowSetIdle
  L1_1 = _puppet_tbl
  L1_1 = L1_1.pup_crow
  L2_2 = L1_1
  L1_1 = L1_1.getBrain
  L1_1 = L1_1(L2_2)
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAllEnemyKill"
  L0_0(L1_1)
  L0_0 = findGameObject2
  L1_1 = "EnemyGenerator"
  L2_2 = "enmgen2_boss_01"
  L0_0 = L0_0(L1_1, L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.getSpecTable
  L1_1 = L1_1(L2_2)
  L2_2, L3_3 = nil, nil
  for _FORV_7_, _FORV_8_ in ipairs(L1_1.spawnSet) do
    if _FORV_8_.type == "landingship" then
      if L2_2 == nil then
        L2_2 = _FORV_8_.name
      end
    elseif _FORV_8_.type == "mechbig_boss" and L3_3 == nil then
      L3_3 = _FORV_8_.name
    end
  end
  Mob:makeSituationPanic(true)
  playSdemo08(L0_0, L2_2, L3_3)
  crowSetIdle(_puppet_tbl.pup_crow:getBrain(), false)
  FatalMarker.create(kFATAL_TYPE_ACT, _puppet_tbl.pup_crow, true):set(findGameObject2("Puppet", "ep07_boss_01"), "bn_c03_neck", true)
  Fn_userCtrlOn()
  Fn_missionView("ep07_10000")
  FatalMarker.create(kFATAL_TYPE_ACT, _puppet_tbl.pup_crow, true):run()
  repeat
    wait()
  until FatalMarker.create(kFATAL_TYPE_ACT, _puppet_tbl.pup_crow, true):isFatalFinish()
  FatalMarker.create(kFATAL_TYPE_ACT, _puppet_tbl.pup_crow, true):kill()
  invokeCaptionTask(L1_1.spawnSet[2].name):abort()
  invokeBreakGateTask(L3_3):abort()
  Fn_whiteout(0.3)
  _puppet_tbl.pup_crow = nil
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Vehicle:SetPanic(false)
  Mob:makeSituationPanic(false)
end
function invokeBreakGateTask(A0_4)
  return invokeTask(function()
    local L0_5, L1_6, L2_7
    L0_5 = Fn_getBgsetHandle
    L0_5 = L0_5()
    L2_7 = L0_5
    L1_6 = L0_5.findGameObject2
    L1_6 = L1_6(L2_7, "GimmickBg", "gate_md_01_01")
    while L1_6 == nil do
      L2_7 = wait
      L2_7(2)
      L2_7 = L0_5.findGameObject2
      L2_7 = L2_7(L0_5, "GimmickBg", "gate_md_01_01")
      L1_6 = L2_7
    end
    L2_7 = findGameObject2
    L2_7 = L2_7("Puppet", A0_4)
    while L2_7 == nil do
      if L1_6:isBroken() == true then
        return
      end
      wait(2)
      L2_7 = findGameObject2("Puppet", A0_4)
    end
    while 6 < Fn_get_distance(L1_6:getWorldPos(), L2_7:getWorldPos()) do
      wait()
      if L1_6:isBroken() == true then
        return
      end
    end
    print("\233\150\128\227\130\146\231\160\180\229\163\138")
    L1_6:requestBreak(L2_7:getWorldPos() + Vector(0, 5, 0), 1)
  end)
end
function invokeCaptionTask(A0_8)
  local L1_9
  L1_9 = {}
  L1_9.enemy_brain = findGameObject2("EnemyBrain", A0_8)
  L1_9.main_task = invokeTask(function()
    local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L16_26, L17_27
    L0_10 = L1_9
    L1_11 = Fn_captionView
    L2_12 = "ep07_10001"
    L1_11(L2_12)
    L1_11 = 1
    L2_12 = {
      L3_13,
      L4_14,
      L5_15
    }
    L3_13 = {}
    L3_13.hp_rate = 0.8
    L3_13.caption = "ep07_10002"
    L4_14 = {}
    L4_14.hp_rate = 0.5
    L4_14.caption = "ep07_10003"
    L5_15 = {}
    L5_15.hp_rate = 0.2
    L5_15.caption = "ep07_10004"
    L3_13 = #L2_12
    L4_14 = 1
    L5_15 = {
      L6_16,
      L7_17,
      L8_18
    }
    L6_16 = {}
    L6_16.frame = 300
    L6_16.caption = "ep07_10005"
    L7_17 = {}
    L7_17.frame = 900
    L7_17.caption = "ep07_10007"
    L8_18 = {}
    L8_18.frame = 1800
    L8_18.caption = "ep07_10009"
    L6_16 = #L5_15
    L7_17 = 1
    L8_18 = {
      L9_19,
      L10_20,
      L11_21
    }
    L9_19 = "ep07_10006"
    L10_20 = "ep07_10008"
    L11_21 = "ep07_10010"
    L9_19 = #L8_18
    L10_20 = 900
    L11_21 = false
    L12_22 = L11_21
    L13_23 = -1
    L14_24 = L13_23
    L15_25 = L0_10.enemy_brain
    L16_26 = L15_25
    L15_25 = L15_25.setEventListener
    L17_27 = "enemy_mechbig_event"
    L15_25(L16_26, L17_27, function(A0_28)
      local L1_29
      L1_29 = L11_21
      L12_22 = L1_29
      L1_29 = A0_28.isOpen
      L11_21 = L1_29
      L1_29 = L13_23
      L14_24 = L1_29
      L1_29 = A0_28.rest
      L13_23 = L1_29
      return A0_28
    end)
    L15_25 = L0_10.enemy_brain
    L16_26 = L15_25
    L15_25 = L15_25.getMaxHealth
    L15_25 = L15_25(L16_26)
    L16_26 = 0
    L17_27 = L10_20
    while true do
      wait()
      if L0_10.enemy_brain:isFatalAction() == false then
        if L11_21 == false then
          if L12_22 == true and L4_14 >= 2 and L4_14 <= L6_16 then
            L16_26 = L5_15[L4_14].frame - L5_15[L4_14 - 1].frame
          else
            L16_26 = math.max(0, L16_26 - 1)
          end
        end
        if L13_23 <= 0 then
          L17_27 = math.max(0, L17_27 - 1)
        end
        if L7_17 <= L9_19 and L11_21 == true and (L13_23 < L14_24 or L12_22 == false) then
          Fn_captionView(L8_18[L7_17])
          L7_17 = L7_17 + 1
        end
        if HUD:captionGetTextId() == nil and L1_11 <= L3_13 and L0_10.enemy_brain:getHealth() <= L15_25 * L2_12[L1_11].hp_rate then
          Fn_captionView(L2_12[L1_11].caption)
          L1_11 = L1_11 + 1
        end
        if HUD:captionGetTextId() == nil and L4_14 <= L6_16 and L16_26 <= 0 then
          Fn_captionView(L5_15[L4_14].caption)
          L4_14 = L4_14 + 1
          if L6_16 >= L4_14 then
            L16_26 = L5_15[L4_14].frame - L5_15[L4_14 - 1].frame
          end
        end
        if HUD:captionGetTextId() == nil and L17_27 <= 0 then
          Fn_captionView("ep07_10014")
          L17_27 = L10_20
        end
      end
    end
  end)
  function L1_9.abort(A0_30)
    A0_30.enemy_brain:setEventListener("enemy_mechbig_event", nil)
    if A0_30.main_task ~= nil then
      A0_30.main_task:abort()
      A0_30.main_task = nil
    end
  end
  return L1_9
end
function playSdemo08(A0_31, A1_32, A2_33)
  local L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43
  L4_35 = A0_31
  L3_34 = A0_31.requestPrepare
  L3_34(L4_35)
  while true do
    L4_35 = A0_31
    L3_34 = A0_31.isPrepared
    L3_34 = L3_34(L4_35)
    if L3_34 == false then
      L3_34 = wait
      L3_34()
    end
  end
  L4_35 = A0_31
  L3_34 = A0_31.requestSpawn
  L3_34(L4_35)
  L4_35 = A0_31
  L3_34 = A0_31.setEnemyMarker
  L5_36 = false
  L3_34(L4_35, L5_36)
  L3_34 = findGameObject2
  L4_35 = "Puppet"
  L5_36 = A1_32
  L3_34 = L3_34(L4_35, L5_36)
  L5_36 = L3_34
  L4_35 = L3_34.getBrain
  L4_35 = L4_35(L5_36)
  while true do
    L6_37 = L4_35
    L5_36 = L4_35.isReadyEnemy
    L5_36 = L5_36(L6_37)
    if L5_36 == false then
      L5_36 = wait
      L5_36()
    end
  end
  L5_36 = findGameObject2
  L6_37 = "Puppet"
  L7_38 = A2_33
  L5_36 = L5_36(L6_37, L7_38)
  L7_38 = L5_36
  L6_37 = L5_36.getBrain
  L6_37 = L6_37(L7_38)
  while true do
    L8_39 = L6_37
    L7_38 = L6_37.isReadyEnemy
    L7_38 = L7_38(L8_39)
    if L7_38 == false then
      L7_38 = wait
      L7_38()
    end
  end
  L7_38 = "locator2_%s_move_%s_%02d"
  L8_39 = 0
  L9_40 = 1
  L10_41 = 2
  L11_42 = L8_39
  function L12_43(A0_44)
    local L1_45, L2_46
    L1_45 = A0_44.state
    if L1_45 == "wait" then
      L1_45 = {}
      A0_44.movePoint = L1_45
      L1_45 = 1
      while true do
        L2_46 = nil
        if L11_42 == L8_39 then
          L2_46 = findGameObject2("Node", string.format(L7_38, A1_32, "a", L1_45))
        elseif L11_42 == L9_40 then
          L2_46 = findGameObject2("Node", string.format(L7_38, A1_32, "c", L1_45))
        end
        if L2_46 ~= nil then
          print(L2_46:getName())
          table.insert(A0_44.movePoint, L2_46:getName())
        else
          break
        end
        L1_45 = L1_45 + 1
      end
      L2_46 = A0_44.movePoint
      L2_46 = #L2_46
      if L2_46 > 0 then
        A0_44.changeState = "move"
      else
        L2_46 = print
        L2_46("landingship move error")
      end
    else
      L1_45 = A0_44.state
      if L1_45 == "moveEnd" then
        L1_45 = L11_42
        L2_46 = L8_39
        if L1_45 == L2_46 then
          L1_45 = {L2_46}
          L2_46 = A2_33
          A0_44.dropEnemy = L1_45
          A0_44.changeState = "drop"
          L1_45 = print
          L2_46 = "drop"
          L1_45(L2_46)
        else
          L1_45 = L11_42
          L2_46 = L9_40
          if L1_45 == L2_46 then
            L1_45 = L10_41
            L11_42 = L1_45
            L1_45 = L3_34
            L2_46 = L1_45
            L1_45 = L1_45.getBrain
            L1_45 = L1_45(L2_46)
            L2_46 = L1_45
            L1_45 = L1_45.setEventListener
            L1_45(L2_46, "enemy_landingship_event", nil)
          end
        end
      else
        L1_45 = A0_44.state
        if L1_45 == "dropEnd" then
          L1_45 = L9_40
          L11_42 = L1_45
        else
          L1_45 = A0_44.state
          if L1_45 == "openEnd" then
          end
        end
      end
    end
    return A0_44
  end
  L4_35:setEventListener("enemy_landingship_event", L12_43)
  do break end
  L7_38 = findGameObject2
  L8_39 = "Puppet"
  L9_40 = A2_33
  L7_38 = L7_38(L8_39, L9_40)
  L8_39 = _sdemo
  L9_40 = L8_39
  L8_39 = L8_39.reset
  L8_39(L9_40)
  L8_39 = _sdemo
  L9_40 = L8_39
  L8_39 = L8_39.set
  L10_41 = "locator2_sdemo_08_cam_01"
  L11_42 = L7_38
  L12_43 = kSDEMO_APPEND_AIM
  L8_39(L9_40, L10_41, L11_42, L12_43)
  L8_39 = _sdemo
  L9_40 = L8_39
  L8_39 = L8_39.offset
  L10_41 = nil
  L11_42 = Vector
  L12_43 = 0
  L12_43 = L11_42(L12_43, 3, 0)
  L8_39(L9_40, L10_41, L11_42, L12_43, L11_42(L12_43, 3, 0))
  L8_39 = _sdemo
  L9_40 = L8_39
  L8_39 = L8_39.play
  L8_39(L9_40)
  L8_39 = Fn_getPlayer
  L8_39 = L8_39()
  player_pup = L8_39
  L8_39 = player_pup
  L9_40 = L8_39
  L8_39 = L8_39.setVisible
  L10_41 = false
  L8_39(L9_40, L10_41)
  L8_39 = _puppet_tbl
  L8_39 = L8_39.pup_crow
  L9_40 = L8_39
  L8_39 = L8_39.setActive
  L10_41 = false
  L8_39(L9_40, L10_41)
  L8_39 = Fn_missionStart
  L8_39()
  L8_39 = _sdemo
  L9_40 = L8_39
  L8_39 = L8_39.play
  L10_41 = {L11_42}
  L11_42 = {}
  L11_42.pos = "locator2_sdemo_08_cam_02"
  L11_42.time = 3
  L11_42.hashfunc = "Linear"
  L11_42 = nil
  L8_39(L9_40, L10_41, L11_42)
  L8_39 = wait
  L9_40 = 10
  L8_39(L9_40)
  L8_39 = Fn_resetPcPos
  L9_40 = "locator2_pc_start_pos"
  L8_39(L9_40)
  L8_39 = _puppet_tbl
  L8_39 = L8_39.pup_crow
  L9_40 = L8_39
  L8_39 = L8_39.getBrain
  L8_39 = L8_39(L9_40)
  L10_41 = L8_39
  L9_40 = L8_39.reset
  L9_40(L10_41)
  L10_41 = L8_39
  L9_40 = L8_39.warpToNode
  L11_42 = Fn_sendEventComSb
  L12_43 = "ep07_findGameObject2"
  L11_42 = L11_42(L12_43, "Node", "locator2_crow_start_pos_03")
  L12_43 = Supporter
  L12_43 = L12_43.FirstAction
  L12_43 = L12_43.Ground
  L9_40(L10_41, L11_42, L12_43)
  while true do
    L9_40 = _sdemo
    L10_41 = L9_40
    L9_40 = L9_40.isPlay
    L9_40 = L9_40(L10_41)
    if L9_40 then
      L9_40 = wait
      L9_40()
    end
  end
  L9_40 = _sdemo
  L10_41 = L9_40
  L9_40 = L9_40.reset
  L9_40(L10_41)
  L9_40 = _sdemo
  L10_41 = L9_40
  L9_40 = L9_40.set
  L11_42 = "locator2_sdemo_08_cam_03"
  L12_43 = L7_38
  L9_40(L10_41, L11_42, L12_43, kSDEMO_APPEND_AIM)
  L9_40 = _sdemo
  L10_41 = L9_40
  L9_40 = L9_40.offset
  L11_42 = nil
  L12_43 = Vector
  L12_43 = L12_43(0, 3, 0)
  L9_40(L10_41, L11_42, L12_43, L12_43(0, 3, 0))
  L9_40 = _sdemo
  L10_41 = L9_40
  L9_40 = L9_40.play
  L9_40(L10_41)
  L9_40 = waitSeconds
  L10_41 = 2
  L9_40(L10_41)
  L9_40 = _sdemo
  L10_41 = L9_40
  L9_40 = L9_40.play
  L11_42 = {L12_43}
  L12_43 = {}
  L12_43.pos = "locator2_sdemo_08_cam_04"
  L12_43.time = 5
  L12_43.hashfunc = "Linear"
  L12_43 = nil
  L9_40(L10_41, L11_42, L12_43)
  L10_41 = L7_38
  L9_40 = L7_38.getBrain
  L9_40 = L9_40(L10_41)
  repeat
    L10_41 = wait
    L10_41()
    L11_42 = L9_40
    L10_41 = L9_40.isReadyEnemy
    L10_41 = L10_41(L11_42)
  until L10_41
  repeat
    L10_41 = wait
    L10_41()
    L11_42 = L9_40
    L10_41 = L9_40.cmd
    L12_43 = "isLandEnd"
    L10_41 = L10_41(L11_42, L12_43)
  until L10_41
  L10_41 = player_pup
  L11_42 = L10_41
  L10_41 = L10_41.setVisible
  L12_43 = true
  L10_41(L11_42, L12_43)
  L10_41 = _puppet_tbl
  L10_41 = L10_41.pup_crow
  L11_42 = L10_41
  L10_41 = L10_41.setActive
  L12_43 = true
  L10_41(L11_42, L12_43)
  L10_41 = invokeTask
  function L11_42()
    L9_40:cmd("laser", {
      target = "locator2_mechbig_laser_target_01",
      isSwing = true,
      time = 2
    })
    repeat
      wait()
    until L9_40:cmd("isLaserEnd")
    L9_40:setEnableTarget(true)
    A0_31:setEnemyMarker(true)
    L4_35:setVisibleEnemyMarker(false)
    L9_40:setVisibleBossMarker(true)
  end
  L10_41(L11_42)
  while true do
    L10_41 = _sdemo
    L11_42 = L10_41
    L10_41 = L10_41.isPlay
    L10_41 = L10_41(L11_42)
    if L10_41 then
      L10_41 = wait
      L10_41()
    end
  end
  L10_41 = _sdemo
  L11_42 = L10_41
  L10_41 = L10_41.stop
  L12_43 = 1
  L10_41(L11_42, L12_43)
end
