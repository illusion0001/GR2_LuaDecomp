dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm32_common.lua")
dofile("/Game/Misc/balloon.lua")
puppets = {}
name_tbl = {}
puppet_task = {}
police_task = {}
_objs = {}
_test_out = false
_answer01 = 1
_answer02 = 2
_answer03 = 3
_select = {}
_task = nil
_effect = {}
_PLAYER_MOTION = {
  hail = "kit01_hail_00"
}
_NPC_MOTION = {
  shock_in = "man01_shock_in_00",
  shock = "man01_shock_00",
  shock_out = "man01_shock_out_00",
  man_handclap = "man01_handclap_00",
  wom_handclap = "wom01_handclap_00",
  stay_01 = "man01_lookaround_02",
  stay_02 = "man01_lookaround_00",
  stay_03 = "man01_stay_02",
  stay_04 = "man01_photo_00",
  stay_05 = "man01_stay_01",
  kaj_stay_00 = "kaj01_stay_00",
  kaj_stay_01 = "kaj01_stay_01",
  man01_stay_00 = "man01_stay_00",
  wom01_stay_00 = "wom01_stay_00",
  man01_walk_00 = "man01_walk_00",
  wom01_walk_00 = "wom01_walk_00",
  man01_walk_b_00 = "man01_walk_b_00",
  wom01_walk_b_00 = "wom01_walk_b_00"
}
BALLOON_ASSET = {
  "burgundyballoon00",
  "pinkballoon00",
  "purpleballoon00",
  "redballoon00",
  "blueballoon00",
  "bluegreenballoon00",
  "greenballoon00",
  "yellowballoon00",
  "orangeballoon00"
}
GENDER_MAN = 1
GENDER_WOMAN = 2
SELECT_01_GENDER = GENDER_MAN
SELECT_02_GENDER = GENDER_MAN
SELECT_03_GENDER = GENDER_MAN
SELECT_04_GENDER = GENDER_WOMAN
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_loadPlayerMotion
  L0_0(L1_1)
  L0_0 = puppets
  L0_0.sm32_client = L1_1
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    {
      name = "_police_01",
      type = "man31",
      node = "locator2_police_01",
      attach = false,
      active = false
    },
    {
      name = "_police_02",
      type = "man31",
      node = "locator2_police_02",
      attach = false,
      active = false
    },
    {
      name = "_police_03",
      type = "man31",
      node = "locator2_police_03",
      attach = false,
      active = false
    },
    {
      name = "_police_04",
      type = "man31",
      node = "locator2_police_04",
      attach = false,
      active = false
    },
    {
      name = "_police_05",
      type = "man31",
      node = "locator2_police_05",
      attach = false,
      active = false
    },
    {
      name = "_police_06",
      type = "man31",
      node = "locator2_police_06",
      attach = false,
      active = false
    },
    {
      name = "_police_07",
      type = "man31",
      node = "locator2_police_07",
      attach = false,
      active = false
    },
    {
      name = "_police_08",
      type = "man31",
      node = "locator2_police_08",
      attach = false,
      active = false
    },
    {
      name = "_police_09",
      type = "man31",
      node = "locator2_police_09",
      attach = false,
      active = false
    },
    {
      name = "_police_10",
      type = "man31",
      node = "locator2_police_10",
      attach = false,
      active = false
    },
    {
      name = "_police_11",
      type = "man31",
      node = "locator2_police_11",
      attach = false,
      active = false
    },
    {
      name = "_police_12",
      type = "man31",
      node = "locator2_police_12",
      attach = false,
      active = false
    },
    {
      name = "_police_13",
      type = "man31",
      node = "locator2_police_13",
      attach = false,
      active = false
    },
    {
      name = "_police_14",
      type = "man31",
      node = "locator2_police_14",
      attach = false,
      active = false
    },
    {
      name = "_police_15",
      type = "man31",
      node = "locator2_police_15",
      attach = false,
      active = false
    },
    {
      name = "_police_16",
      type = "man31",
      node = "locator2_police_16",
      attach = false,
      active = false
    }
  }
  L1_1.name = "_man_02"
  L1_1.type = "kaj01"
  L1_1.node = "locator2__man_02"
  L1_1.attach = false
  L1_1.active = false
  L2_2.name = "_select_01"
  L2_2.type = "man08"
  L2_2.node = "locator2__select_npc_01"
  L2_2.attach = false
  L2_2.active = false
  L3_3.name = "_select_02"
  L3_3.type = "man01"
  L3_3.node = "locator2__select_npc_02"
  L3_3.attach = false
  L3_3.active = false
  L4_4 = {}
  L4_4.name = "_select_03"
  L4_4.type = "man31"
  L4_4.node = "locator2__select_npc_03"
  L4_4.attach = false
  L4_4.active = false
  L5_5 = {}
  L5_5.name = "_select_04"
  L5_5.type = "wom01"
  L5_5.node = "locator2__select_npc_04"
  L5_5.attach = false
  L5_5.active = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    puppets[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
    Fn_loadNpcEventMotion(L5_5.name, _NPC_MOTION)
    if L5_5.name ~= "_man_02" then
      table.insert(name_tbl, L5_5.name)
    end
  end
  for L4_4, L5_5 in L1_1(L2_2) do
    Fn_disableKaiwaDemo(L5_5)
  end
  while true do
    L4_4 = "bg2_barricade_"
    L5_5 = string
    L5_5 = L5_5.format
    L5_5 = L5_5("%02d", L1_1)
    L4_4 = L4_4 .. L5_5
    if L3_3 ~= nil and L2_2 ~= nil then
      L4_4 = L2_2
      L5_5 = false
      L3_3(L4_4, L5_5)
    end
  end
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = Fn_userCtrlAllOff
  L0_6()
  L0_6 = Fn_missionStart
  L0_6()
  L0_6 = Fn_kaiwaDemoView
  L1_7 = "sm32_00100k"
  L0_6(L1_7)
  L0_6 = Fn_blackout
  L0_6()
  L0_6 = Player
  L1_7 = L0_6
  L0_6 = L0_6.setAttrTune
  L2_8 = Player
  L2_8 = L2_8.kAttrTune_Normal
  L0_6 = L0_6(L1_7, L2_8)
  if L0_6 == true then
    L1_7 = print
    L2_8 = "\227\131\142\227\131\188\227\131\158\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\227\129\184\229\164\137\230\155\180\227\129\151\227\129\190\227\129\151\227\129\159"
    L1_7(L2_8)
  end
  L1_7 = Fn_setNpcActive
  L2_8 = "sm32_client"
  L3_9 = false
  L1_7(L2_8, L3_9)
  L1_7 = Fn_resetPcPos
  L2_8 = "locator2__restart_01"
  L1_7(L2_8)
  L1_7 = Fn_setNpcActive
  L2_8 = "_man_02"
  L3_9 = true
  L1_7(L2_8, L3_9)
  L1_7 = Fn_warpNpc
  L2_8 = "_man_02"
  L3_9 = "locator2__man_02"
  L1_7(L2_8, L3_9)
  L1_7 = Fn_warpNpc
  L2_8 = "_police_10"
  L3_9 = "locator2_police_10"
  L1_7(L2_8, L3_9)
  L1_7 = Fn_warpNpc
  L2_8 = "_police_11"
  L3_9 = "locator2_police_11"
  L1_7(L2_8, L3_9)
  L1_7 = _police_animation
  L1_7()
  L1_7 = turnKajTask
  L2_8 = "_man_02"
  L1_7 = L1_7(L2_8)
  L2_8 = table
  L2_8 = L2_8.insert
  L3_9 = _objs
  L4_10 = CreateWoodbox
  L4_10 = L4_10("locator2__test_01")
  L2_8(L3_9, L4_10, L4_10("locator2__test_01"))
  L2_8 = wait
  L2_8()
  L2_8 = Fn_fadein
  L2_8()
  L2_8 = Fn_kaiwaDemoView
  L3_9 = "sm32_00101k"
  L2_8(L3_9)
  L2_8 = Fn_userCtrlOn
  L2_8()
  L2_8 = Fn_userCtrlGravityOff
  L2_8()
  L2_8 = _explain_loop
  L3_9 = _objs
  L2_8 = L2_8(L3_9)
  _task = L2_8
  L2_8 = Fn_missionView
  L3_9 = "sm32_00100"
  L2_8(L3_9)
  while true do
    L2_8 = _task
    if L2_8 ~= nil then
      L2_8 = _task
      L3_9 = L2_8
      L2_8 = L2_8.isRunning
      L2_8 = L2_8(L3_9)
    end
    if L2_8 then
      L2_8 = wait
      L2_8()
    end
  end
  L2_8 = _task
  L3_9 = L2_8
  L2_8 = L2_8.abort
  L2_8(L3_9)
  _task = nil
  L2_8 = Fn_missionViewEnd
  L2_8()
  L2_8 = Fn_kaiwaDemoView
  L3_9 = "sm32_00102k"
  L2_8(L3_9)
  L2_8 = Fn_blackout
  L2_8()
  L2_8 = effect_term
  L2_8()
  L2_8 = ObjectRelease
  L2_8()
  L2_8 = {
    L3_9,
    L4_10,
    {
      "sm32_00132k",
      "sm32_00133k",
      "sm32_00134k",
      "sm32_00135k"
    }
  }
  L3_9 = {
    L4_10,
    "sm32_00113k",
    "sm32_00114k",
    "sm32_00115k"
  }
  L4_10 = "sm32_00112k"
  L4_10 = {
    "sm32_00122k",
    "sm32_00123k",
    "sm32_00124k",
    "sm32_00125k"
  }
  L3_9 = {
    L4_10,
    "sm32_00121k",
    "sm32_00131k"
  }
  L4_10 = "sm32_00111k"
  L4_10 = 1
  while findGameObject2("GimmickBg", "bg2_barricade_" .. string.format("%02d", L4_10)) ~= nil do
    findGameObject2("GimmickBg", "bg2_barricade_" .. string.format("%02d", L4_10)):setActive(true)
    L4_10 = L4_10 + 1
  end
  _loop("locator2__restart_01", L2_8, L3_9, "sm32_00200k", "sm32_00104k")
  L1_7:abort()
  L1_7 = nil
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_11, L1_12
end
function pccubesensor2__test_OnEnter()
  local L0_13, L1_14
  _test_out = false
end
function pccubesensor2__test_OnLeave()
  local L0_15, L1_16
  _test_out = true
end
function _restart(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28
  L2_19 = Fn_resetPcPos
  L3_20 = A0_17
  L2_19(L3_20)
  L2_19 = RespawnConesAndBarricade
  L2_19()
  L2_19 = {L3_20, L4_21}
  L3_20 = {}
  L3_20.stay = L4_21
  L3_20.walk = L4_21
  L3_20.walk_b = L4_21
  L4_21.stay = L5_22
  L4_21.walk = L5_22
  L4_21.walk_b = L5_22
  L3_20 = {
    L4_21,
    L5_22,
    L6_23,
    L7_24
  }
  L4_21.idx = 1
  L4_21.name = "_select_01"
  L4_21.gender = L5_22
  L5_22.idx = 2
  L5_22.name = "_select_02"
  L5_22.gender = L6_23
  L6_23.idx = 3
  L6_23.name = "_select_03"
  L7_24 = SELECT_03_GENDER
  L6_23.gender = L7_24
  L7_24 = {}
  L7_24.idx = 4
  L7_24.name = "_select_04"
  L8_25 = SELECT_04_GENDER
  L7_24.gender = L8_25
  for L7_24 = 1, #L3_20 do
    L8_25 = math
    L8_25 = L8_25.random
    L9_26 = #L3_20
    L8_25 = L8_25(L9_26)
    L9_26 = L3_20[L8_25]
    L9_26 = L9_26.name
    L10_27 = puppets
    L10_27 = L10_27[L9_26]
    L11_28 = L3_20[L8_25]
    L11_28 = L11_28.gender
    _select[L7_24] = L3_20[L8_25].idx
    _police_animation()
    A1_18[L7_24] = CreateWoodbox("locator2__select_" .. string.format("%02d", L7_24))
    A1_18[L7_24]:setMoveThreshold(0)
    Fn_playMotionNpc(L9_26, "stay", false)
    L10_27:setWorldPos(findGameObject2("Node", "locator2__select_npc_" .. string.format("%02d", L7_24)):getWorldPos())
    L10_27:setWorldRot(findGameObject2("Node", "locator2__select_npc_" .. string.format("%02d", L7_24)):getWorldRot())
    L10_27:setForceMove()
    Fn_setNpcActive(L9_26, true)
    L10_27:setUsePhysicsMove(true)
    puppet_task[L7_24] = invokeTask(function()
      local L0_29
      L0_29 = 0
      while true do
        if Fn_getDistanceToPlayer(A1_18[L7_24]) < 2 then
          if L0_29 == 0 then
            L0_29 = 1
            print(L9_26)
            print(L2_19[L11_28].walk_b)
            Fn_playNpcEventMotion(L9_26, L2_19[L11_28].walk_b, 0, 0.1, false)
            waitSeconds(0.3)
            print(L2_19[L11_28].stay)
            Fn_playNpcEventMotion(L9_26, L2_19[L11_28].stay, -1, 0.2, false)
          end
        elseif L0_29 == 1 then
          L0_29 = 0
          print(L2_19[L11_28].walk)
          Fn_playNpcEventMotion(L9_26, L2_19[L11_28].walk, 0, 0.1, false)
          waitSeconds(0.3)
          print(L2_19[L11_28].stay)
          Fn_playNpcEventMotion(L9_26, L2_19[L11_28].stay, -1, 0.2, false)
        end
        wait()
      end
    end)
    table.remove(L3_20, L8_25)
    do break end
    break
  end
end
function _police_animation()
  local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35, L6_36
  L0_30 = {
    L1_31,
    L2_32,
    L3_33,
    L4_34,
    L5_35
  }
  L1_31 = {}
  L1_31.name = L2_32
  L2_32.name = L3_33
  L3_33.name = L4_34
  L5_35 = _NPC_MOTION
  L5_35 = L5_35.stay_04
  L4_34.name = L5_35
  L5_35 = {}
  L6_36 = _NPC_MOTION
  L6_36 = L6_36.stay_05
  L5_35.name = L6_36
  L1_31 = {
    L2_32,
    L3_33,
    L4_34,
    L5_35,
    L6_36,
    {name = "_police_06"},
    {name = "_police_07"},
    {name = "_police_08"},
    {name = "_police_09"},
    {name = "_police_10"},
    {name = "_police_11"},
    {name = "_police_12"},
    {name = "_police_13"},
    {name = "_police_14"},
    {name = "_police_15"},
    {name = "_police_16"}
  }
  L2_32.name = "_police_01"
  L3_33.name = "_police_02"
  L4_34.name = "_police_03"
  L5_35 = {}
  L5_35.name = "_police_04"
  L6_36 = {}
  L6_36.name = "_police_05"
  for L5_35 = 1, #L1_31 do
    L6_36 = math
    L6_36 = L6_36.random
    L6_36 = L6_36(#L0_30)
    Fn_setNpcActive(L1_31[L5_35].name, true)
    invokeTask(function()
      local L0_37
      L0_37 = math
      L0_37 = L0_37.random
      L0_37 = L0_37(0, 0.9)
      waitSeconds(L0_37)
      Fn_playMotionNpc(L1_31[L5_35].name, L0_30[L6_36].name, false)
    end)
    do break end
    break
  end
end
function _explain_loop(A0_38)
  return (invokeTask(function()
    local L0_39
    L0_39 = 0
    while L0_39 == 0 do
      if _test_out then
        Player:setStay(true)
        Fn_userCtrlAllOff()
        Fn_captionViewWait("sm32_00104")
        Fn_blackout()
        Fn_resetPcPos("locator2__restart_01")
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
        Fn_userCtrlGravityOff()
        _test_out = false
      end
      for _FORV_4_ = 1, #A0_38 do
        if A0_38[_FORV_4_]:isBroken() then
          L0_39 = _FORV_4_
          effect_create(L0_39, A0_38[L0_39])
        end
      end
      _FOR_()
    end
    Fn_userCtrlAllOff()
    while is_effect_playing() do
      wait()
    end
  end))
end
function _photo_loop()
  HUD:inGamePreviewCreate("k_photo_sm3201")
  while HUD:inGamePreviewIsLoading() do
    wait()
  end
  Fn_missionView("sm32_00102")
  HUD:inGamePreviewFadeIn()
  while not HUD:inGamePreviewIsIdle() do
    wait()
  end
  if not HUD:inGamePreviewIsLarge() then
    HUD:inGamePreviewChange()
  end
  Fn_captionView("sm32_00103", 0)
  while not HUD:inGamePreviewIsLarge() do
    wait()
  end
  repeat
    wait()
  until Fn_isCaptionView()
  while not HUD:inGamePreviewIsIdle() or HUD:inGamePreviewIsLarge() do
    wait()
  end
  HUD:inGamePreviewExit()
  Fn_captionViewEnd()
  Fn_missionViewEnd()
  while Fn_isCaptionView() do
    wait()
  end
end
function _loop(A0_40, A1_41, A2_42, A3_43, A4_44)
  local L5_45, L6_46, L7_47, L8_48, L9_49, L10_50
  L5_45 = 1
  L6_46 = #A1_41
  L7_47 = _restart
  L8_48 = A0_40
  L9_49 = _objs
  L7_47(L8_48, L9_49)
  L7_47 = Fn_turnNpc
  L8_48 = "_man_02"
  L7_47(L8_48)
  L7_47 = Fn_fadein
  L7_47()
  L7_47 = Fn_kaiwaDemoView
  L8_48 = "sm32_00103k"
  L7_47(L8_48)
  L7_47 = _photo_loop
  L7_47()
  L7_47 = Fn_findAreaHandle
  L8_48 = "dt_a_root"
  L7_47 = L7_47(L8_48)
  while true do
    while true do
      while true do
        while true do
          L8_48 = 0
          L9_49 = 0
          L10_50 = math
          L10_50 = L10_50.random
          L10_50 = L10_50(#_select)
          Fn_fadein()
          Fn_kaiwaDemoView(A1_41[L5_45][_select[L10_50]])
          Fn_userCtrlOn()
          Fn_userCtrlGravityOff()
          _task = invokeTask(function()
            local L0_51, L1_52, L2_53, L3_54
            while true do
              if L0_51 == 0 then
                if L0_51 then
                  L0_51(L1_52, L2_53)
                  L0_51()
                  L0_51(L1_52)
                  L0_51()
                  L0_51(L1_52)
                  L0_51(L1_52, L2_53)
                  L0_51()
                  L0_51()
                  L0_51()
                  _test_out = false
                end
                for L3_54 = 1, #L1_52 do
                  if _objs[L3_54]:isBroken() then
                    print("\231\160\180\229\163\138\231\149\170\229\143\183:" .. L3_54)
                    if _select[L3_54] ~= _select[L10_50] then
                      effect_create(L3_54, _objs[L3_54])
                      L9_49 = _select[L3_54]
                    else
                      invokeTask(function()
                        local L0_55, L1_56, L2_57, L3_58, L4_59
                        L0_55 = _objs
                        L0_55 = L0_55[L1_56]
                        L0_55 = L0_55.getWorldPos
                        L0_55 = L0_55(L1_56)
                        for L4_59 = 1, 3 do
                          Balloon.create("balloon_" .. string.format("%02d", L4_59), nil, "CharDefs/" .. BALLOON_ASSET[RandI(1, #BALLOON_ASSET)]).puppet:setWorldPos(L0_55 + Vector(RandF(-0.5, 0.5), RandF(-0.8, -0.3), RandF(-0.5, 0.5)))
                          Balloon.create("balloon_" .. string.format("%02d", L4_59), nil, "CharDefs/" .. BALLOON_ASSET[RandI(1, #BALLOON_ASSET)]):start()
                          Balloon.create("balloon_" .. string.format("%02d", L4_59), nil, "CharDefs/" .. BALLOON_ASSET[RandI(1, #BALLOON_ASSET)]):moveOnly(L0_55 + Vector(RandF(-5, 5), 10, RandF(-5, 5)), 10, 40)
                          wait()
                        end
                      end)
                    end
                    if L8_48 == 0 then
                      L8_48 = _select[L3_54]
                    end
                  else
                  end
                end
                L0_51()
              end
            end
            L0_51()
            if L0_51 ~= 0 then
              while true do
                if L0_51 then
                  L0_51()
                  else
                    L0_51(L1_52)
                  end
                end
              end
          end)
          Fn_missionView("sm32_00105")
          while _task ~= nil and _task:isRunning() do
            wait()
          end
          _task:abort()
          _task = nil
          Fn_missionViewEnd()
          if L9_49 == 0 and L8_48 == _select[L10_50] then
            player_good_action()
            if L5_45 == L6_46 then
              Fn_kaiwaDemoView(A3_43)
              Fn_blackout()
              HandClapInvokeTask(name_tbl, _NPC_MOTION.man_handclap, _NPC_MOTION.wom_handclap):abort()
              _end()
              break
            end
            Fn_blackout()
            ;(nil):abort()
            _end()
            L5_45 = L5_45 + 1
            _restart(A0_40, _objs)
          end
        end
      end
      Fn_kaiwaDemoView(A2_42[L5_45])
      Fn_blackout()
      effect_term()
      _end()
      L5_45 = 1
      _restart(A0_40, _objs)
      Fn_fadein()
      Fn_kaiwaDemoView("sm32_00104k")
      _photo_loop()
    end
  end
end
function _end(A0_60)
  ObjectRelease()
  for _FORV_4_ = 1, #puppet_task do
    if puppet_task[_FORV_4_] ~= nil then
      puppet_task[_FORV_4_]:abort()
      puppet_task[_FORV_4_] = nil
    end
  end
  Fn_setNpcActive("_select_01", false)
  Fn_setNpcActive("_select_02", false)
  Fn_setNpcActive("_select_03", false)
  Fn_setNpcActive("_select_04", false)
end
function ObjectRelease()
  local L0_61, L2_62, L3_63
  for _FORV_3_ = 1, #L2_62 do
    if _objs[_FORV_3_] ~= nil then
      _objs[_FORV_3_]:requestRestoreForce()
      _objs[_FORV_3_]:setActive(false)
    end
  end
  _objs = L0_61
end
function effect_create(A0_64, A1_65)
  if not A1_65:isBroken() then
    A1_65:requestBreak(A1_65:getWorldPos(), 0, 2.7)
  end
  _effect[A0_64] = RAC_createEffect({
    eff_name = "ef_com_exp_02",
    pos_node = A1_65,
    time = 2.7
  })
  Sound:playSE("ef_ev_exp_01", 1, "", _effect[A0_64])
  box_explain(A1_65:getWorldPos())
end
function effect_term()
  for _FORV_3_, _FORV_4_ in pairs(_effect) do
    if _effect[_FORV_3_] ~= nil then
      _effect[_FORV_3_]:abort()
      _effect[_FORV_3_] = nil
    end
  end
  _effect = {}
end
function is_effect_playing()
  for _FORV_3_, _FORV_4_ in pairs(_effect) do
    if _effect[_FORV_3_] ~= nil and _effect[_FORV_3_]:isRunning() then
      return true
    end
  end
  return false
end
function player_good_action()
  while Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  Player:setStay(true)
  waitSeconds(0.5)
  Sound:playSE("clear_jingle")
  Fn_playPlayerMotionWait(_PLAYER_MOTION.hail, 0, 0.2, true)
  Player:setStay(false)
end
