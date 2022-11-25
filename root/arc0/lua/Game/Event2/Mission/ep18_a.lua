dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_next_phase = false
_kaiwa_cnt = 0
_reinforce = false
_killkaji = false
_forestall = false
_crow_pup = nil
_brain_crow = nil
_endPart = false
_grigoMotions = {
  hacked_00 = "mcgri01_hacked_00"
}
_mob_to_npc_table = {}
_warp_caption_flag = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "kaji",
      type = "kaj01",
      node = "locator2_kaji_01"
    }
  }
  Fn_setupNpc(L0_0)
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  L0_1()
  L0_1(L1_2)
  while true do
    if L0_1 == false then
      L0_1()
    end
  end
  for L3_4 = 1, 7 do
    npc = Fn_findNpc("npcgen2_man01_" .. string.format("%02d", L3_4))
    while npc:isReadyNpc() == false do
      wait()
    end
  end
  L0_1(L1_2)
  L3_4 = {}
  L3_4.attach = true
  L3_4.grigo = true
  L3_4.range = 25
  L3_4.time = 1
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2()
  L1_2(L2_3)
  L1_2()
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2()
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2()
  L1_2()
  L3_4 = 7
  L1_2(L2_3, L3_4, 0, 7)
  L3_4 = Vector
  L3_4 = L3_4(-410, 219, 40)
  L1_2(L2_3, L3_4, 100)
  L1_2()
  _endPart = true
  L1_2()
  L1_2()
  L1_2()
  L1_2()
  L1_2()
  L1_2()
end
function waitPhase()
  print("print begin waitPhase")
  while not _next_phase do
    wait()
  end
  _next_phase = false
  print("print finish waitPhase")
end
function pccubesensor2_rein_01_OnEnter()
  print("print begin pccubesensor2_rein_01_OnEnter")
  invokeTask(function()
    _reinforce = true
    Fn_sendEventComSb("reinforce_grigo")
    Fn_pcSensorOn("pccubesensor2_keimu_01")
    Fn_pcSensorOff("pccubesensor2_rein_01")
  end)
  print("print finish pccubesensor2_rein_01_OnEnter")
end
function caption()
  invokeTask(function()
    local L1_5
    L1_5 = false
    repeat
      wait(2)
    until _killkaji
    while true do
      if 0 == 2 then
        Fn_captionView("ep18_00101", 5)
      elseif _reinforce == true and L1_5 == false and Fn_sendEventComSb("lookGrigos") then
        Fn_captionView("ep18_00102", 5)
        L1_5 = true
      end
      waitSeconds(1)
    end
  end)
end
function pccubesensor2_keimu_01_OnEnter()
  print("print begin pccubesensor2_keimu_01_OnEnter")
  invokeTask(function()
    local L0_6, L1_7
    _next_phase = true
  end)
  print("print finish pccubesensor2_keimu_01_OnEnter")
end
function kajiMove()
  print("print begin kajiMove")
  invokeTask(function()
    local L0_8
    L0_8 = {
      "locator2_kaji_goal_01",
      "locator2_kaji_goal_02",
      "locator2_kaji_goal_03",
      "locator2_kaji_goal_04",
      "locator2_kaji_goal_05",
      "locator2_kaji_goal_06"
    }
    while true do
      wait(2)
      if Fn_findNpc("kaji"):isMoveEnd() and false == false then
        Fn_findNpc("kaji"):playMotion("stay")
      elseif _forestall then
        print("kill kaji")
        Fn_disappearNpc("kaji", 0)
        _killkaji = true
        break
      elseif not Fn_isInSightTarget(Fn_findNpcPuppet("kaji"), 1) and true == true then
        if 0 + 1 >= 150 then
          print("kill kaji")
          Fn_disappearNpc("kaji", 0)
          _killkaji = true
          break
        end
      else
      end
    end
  end)
end
function pccubesensor2_catwarp_OnEnter()
  if _killkaji == false then
    invokeTask(function()
      Fn_catWarp()
      Fn_captionView("ep18_00103", 5)
    end)
  end
end
function pccubesensor2_deletekaji_OnLeave()
  local L0_9, L1_10
  _forestall = true
end
function crowAction()
  invokeTask(function()
    local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28, L18_29
    L0_11 = Fn_spawnSuppotCrow
    L0_11 = L0_11()
    _crow_pup = L0_11
    L0_11 = _crow_pup
    L1_12 = L0_11
    L0_11 = L0_11.getBrain
    L0_11 = L0_11(L1_12)
    _brain_crow = L0_11
    L0_11 = {}
    L1_12 = findGameObject2
    L2_13 = "Node"
    L3_14 = "locator2_crow_move_point_00"
    L1_12 = L1_12(L2_13, L3_14)
    L2_13 = L1_12
    L1_12 = L1_12.getWorldPos
    L1_12 = L1_12(L2_13)
    L2_13 = findGameObject2
    L3_14 = "Node"
    L4_15 = "locator2_crow_move_point_01"
    L2_13 = L2_13(L3_14, L4_15)
    L3_14 = L2_13
    L2_13 = L2_13.getWorldPos
    L2_13 = L2_13(L3_14)
    L3_14 = findGameObject2
    L4_15 = "Node"
    L5_16 = "locator2_crow_move_point_02"
    L3_14 = L3_14(L4_15, L5_16)
    L4_15 = L3_14
    L3_14 = L3_14.getWorldPos
    L3_14 = L3_14(L4_15)
    L4_15 = findGameObject2
    L5_16 = "Node"
    L6_17 = "locator2_crow_move_point_03"
    L4_15 = L4_15(L5_16, L6_17)
    L5_16 = L4_15
    L4_15 = L4_15.getWorldPos
    L4_15 = L4_15(L5_16)
    L5_16 = findGameObject2
    L6_17 = "Node"
    L7_18 = "locator2_crow_move_point_04"
    L5_16 = L5_16(L6_17, L7_18)
    L6_17 = L5_16
    L5_16 = L5_16.getWorldPos
    L5_16 = L5_16(L6_17)
    L6_17 = findGameObject2
    L7_18 = "Node"
    L8_19 = "locator2_crow_move_point_05"
    L6_17 = L6_17(L7_18, L8_19)
    L7_18 = L6_17
    L6_17 = L6_17.getWorldPos
    L6_17 = L6_17(L7_18)
    L7_18 = findGameObject2
    L8_19 = "Node"
    L9_20 = "locator2_crow_move_point_06"
    L7_18 = L7_18(L8_19, L9_20)
    L8_19 = L7_18
    L7_18 = L7_18.getWorldPos
    L7_18 = L7_18(L8_19)
    L8_19 = {
      L9_20,
      L10_21,
      L11_22,
      L12_23,
      L13_24,
      L14_25
    }
    L9_20 = {}
    L9_20.pos = L1_12
    L10_21 = Supporter
    L10_21 = L10_21.MovePoint
    L10_21 = L10_21.Ground
    L9_20.action = L10_21
    L9_20.vel = 10
    L10_21 = {}
    L10_21.pos = L2_13
    L11_22 = Supporter
    L11_22 = L11_22.MovePoint
    L11_22 = L11_22.Ground
    L10_21.action = L11_22
    L10_21.vel = 10
    L11_22 = {}
    L11_22.pos = L2_13
    L12_23 = Supporter
    L12_23 = L12_23.MovePoint
    L12_23 = L12_23.Takeoff
    L11_22.action = L12_23
    L11_22.vel = 10
    L12_23 = {}
    L12_23.pos = L2_13
    L13_24 = Supporter
    L13_24 = L13_24.MovePoint
    L13_24 = L13_24.Air
    L12_23.action = L13_24
    L12_23.vel = 10
    L13_24 = {}
    L13_24.pos = L3_14
    L14_25 = Supporter
    L14_25 = L14_25.MovePoint
    L14_25 = L14_25.Air
    L13_24.action = L14_25
    L13_24.vel = 10
    L14_25 = {}
    L14_25.action = L15_26
    L14_25.count = 3
    L9_20 = _brain_crow
    L10_21 = L9_20
    L9_20 = L9_20.setMovePoints
    L11_22 = L8_19
    L9_20(L10_21, L11_22)
    L9_20 = _brain_crow
    L10_21 = L9_20
    L9_20 = L9_20.startMovePoint
    L9_20(L10_21)
    repeat
      L9_20 = wait
      L9_20()
      L9_20 = _brain_crow
      L10_21 = L9_20
      L9_20 = L9_20.isMovePointEnd
      L9_20 = L9_20(L10_21)
    until L9_20
    L9_20, L10_21, L11_22 = nil, nil, nil
    L12_23 = {}
    L13_24 = nil
    L14_25 = false
    while true do
      L9_20 = L15_26
      L10_21 = L15_26
      if L10_21 == L11_22 then
        L10_21 = L10_21 + 1
      end
      L12_23 = L15_26
      for L18_29 = 11, 17 do
        L0_11[L18_29] = Fn_sendEventComSb("getgrigoPuppet", "ene_grigo_" .. string.format("%02d", L18_29))
      end
      if L15_26 ~= nil and L10_21 == 1 or L14_25 == true then
        L15_26()
      else
        L15_26(L16_27)
      end
      L14_25 = false
      L15_26(L16_27)
      L13_24 = L15_26
      if L15_26 ~= nil and L10_21 == 1 then
        L18_29 = L17_28
        L18_29 = L17_28(L18_29)
        L15_26(L16_27, L17_28, L18_29, L17_28(L18_29))
        L16_27.action = L17_28
        L16_27.count = 2
        L17_28.pos = L13_24
        L18_29 = Supporter
        L18_29 = L18_29.MovePoint
        L18_29 = L18_29.FallKick
        L17_28.action = L18_29
        L18_29 = L0_11[L9_20]
        L17_28.target = L18_29
        L17_28.vel = 15
        L17_28.forced = true
        L12_23 = L15_26
        L14_25 = true
      elseif L10_21 == 2 then
        L15_26(L16_27)
        L16_27.action = L17_28
        L16_27.count = 2
        L17_28.pos = L13_24
        L18_29 = Supporter
        L18_29 = L18_29.MovePoint
        L18_29 = L18_29.Air
        L17_28.action = L18_29
        L17_28.vel = 10
        L18_29 = {}
        L18_29.pos = L4_15
        L18_29.action = Supporter.MovePoint.Air
        L18_29.vel = 10
        L12_23 = L15_26
      elseif L10_21 == 3 then
        L15_26(L16_27)
        L16_27.action = L17_28
        L16_27.count = 2
        L17_28.pos = L13_24
        L18_29 = Supporter
        L18_29 = L18_29.MovePoint
        L18_29 = L18_29.Air
        L17_28.action = L18_29
        L17_28.vel = 10
        L18_29 = {}
        L18_29.pos = L5_16
        L18_29.action = Supporter.MovePoint.Air
        L18_29.vel = 10
        L12_23 = L15_26
      else
        L15_26(L16_27)
        L16_27.action = L17_28
        L16_27.count = 3
        L17_28.pos = L13_24
        L18_29 = Supporter
        L18_29 = L18_29.MovePoint
        L18_29 = L18_29.Air
        L17_28.action = L18_29
        L17_28.vel = 10
        L18_29 = {}
        L18_29.pos = L4_15
        L18_29.action = Supporter.MovePoint.Air
        L18_29.vel = 10
        L12_23 = L15_26
      end
      L15_26(L16_27, L17_28)
      L15_26(L16_27)
      repeat
        L15_26()
      until L15_26
      L11_22 = L10_21
    end
  end)
end
function moveMobGrigo(A0_30, A1_31)
  invokeTask(function()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38
    L0_32 = waitSeconds
    L1_33 = 2
    L0_32(L1_33)
    L0_32 = Fn_moveNpc
    L1_33 = A0_30
    L2_34 = "locator2_mob_grigo_move_point"
    L3_35.arrivedLength = 30
    L3_35.runLength = -1
    L3_35.anim_run_speed = 1
    L3_35.recast = true
    L0_32 = L0_32(L1_33, L2_34, L3_35)
    L1_33 = false
    L2_34 = nil
    while true do
      L6_38 = L5_37
      L6_38 = L5_37(L6_38)
      L3_35(L4_36, L5_37, L6_38, L5_37(L6_38))
      L6_38 = 50
      L6_38 = L5_37(L6_38)
      L3_35(L4_36, L5_37, L6_38, L5_37(L6_38))
      L3_35(L4_36, L5_37)
      L2_34 = L3_35
      L2_34.y = L3_35
      if L3_35 ~= true and L1_33 == false then
        L6_38 = "police"
        L3_35(L4_36, L5_37)
        L3_35(L4_36, L5_37)
        L3_35(L4_36, L5_37)
        L1_33 = true
      elseif L3_35 == false then
        L6_38 = L5_37
        L6_38 = L5_37(L6_38)
        if L3_35 ~= nil then
          if L3_35 >= 200 then
            L6_38 = L5_37
            L6_38 = Fn_getDistanceToPlayer
            L6_38 = L6_38(A1_31)
            L3_35(L4_36, L5_37, L6_38, L6_38(A1_31))
            for L6_38, _FORV_7_ in L3_35(L4_36) do
              print(_FORV_7_.name, A1_31:getName())
              if _FORV_7_.name == A1_31:getName() then
                table.remove(_mob_to_npc_table, L6_38)
                Fn_sendEventComSb("setMobGrigoTable", _mob_to_npc_table)
                break
              end
            end
            L3_35(L4_36)
            break
          end
        end
      end
      L3_35(L4_36)
    end
  end)
end
function playSoundAlert(A0_39)
  invokeTask(function()
    local L0_40, L1_41, L2_42, L3_43, L4_44
    L0_40 = wait
    L1_41 = 13
    L0_40(L1_41)
    L0_40 = A0_39
    L1_41 = L0_40
    L0_40 = L0_40.getPuppet
    L0_40 = L0_40(L1_41)
    L1_41 = false
    L2_42, L3_43, L4_44 = nil, nil, nil
    if L0_40 ~= nil then
      repeat
        wait(3)
        if L1_41 == false and Fn_getDistanceToPlayer(L0_40) <= 50 then
          L2_42 = Sound:playSEHandle("ep18_grigo_alert", 1, "", L0_40)
          L3_43 = Sound:playSEHandle("w12_014", 1, "", L0_40)
          L4_44 = Sound:playSEHandle("ene_bot_move", 1, "", L0_40)
          L1_41 = true
        elseif L1_41 == true and Fn_getDistanceToPlayer(L0_40) > 50 then
          Sound:stopSEHandle(L2_42)
          Sound:stopSEHandle(L3_43)
          Sound:stopSEHandle(L4_44)
          L1_41 = false
        end
      until _endPart
      Sound:stopSEHandle(L2_42)
      Sound:stopSEHandle(L3_43)
      Sound:stopSEHandle(L4_44)
      L2_42, L3_43, L4_44 = nil, nil, nil
    else
      print("Puppet\227\129\140nil\227\129\167\227\129\151\227\129\159")
    end
  end)
end
function playExp(A0_45, A1_46, A2_47, A3_48)
  local L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55
  L4_49 = findGameObject2
  L5_50 = "Node"
  L6_51 = A0_45
  L4_49 = L4_49(L5_50, L6_51)
  L5_50 = L4_49
  L4_49 = L4_49.getWorldPos
  L4_49 = L4_49(L5_50)
  L5_50, L6_51, L7_52, L8_53, L9_54, L10_55 = nil, nil, nil, nil, nil, nil
  invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(A0_45) < 85 and Fn_isInSightTarget(A0_45, 1) then
        L5_50 = math.random(-A1_46, A1_46)
        L6_51 = math.random(-A2_47, A2_47)
        L7_52 = math.random(-A3_48, A3_48)
        L8_53 = L4_49 + Vector(L5_50, L6_51, L7_52)
        L9_54 = createGameObject2("BulletShockwave")
        L9_54:setParam({
          type = "blow",
          damage = 1,
          force = 3.5,
          time = 0.1,
          interval = -1,
          pos = L8_53,
          radius = 2
        })
        L9_54:try_init()
        L9_54:attack()
        Fn_createEffect("exp", "ef_com_exp_13", L8_53, false)
        Sound:playSE("gen_explosion", 1, "", findGameObject2("Node", A0_45))
      end
      L10_55 = math.random(120, 240)
      wait(L10_55)
    end
  end)
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_56
  L1_56 = _warp_caption_flag
  if L1_56 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_00104")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  Area:gravityStorm()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
end
