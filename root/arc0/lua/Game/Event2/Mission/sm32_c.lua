dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm32_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
puppets = {}
puppet_task = {}
name_tbl = {}
_object = nil
_photo = nil
_effect = nil
_sdemo = nil
_PLAYER_MOTION = {
  hail = "kit01_hail_00"
}
_NPC_MOTION = {
  stay_01 = "man01_lookaround_02",
  stay_02 = "man01_lookaround_00",
  stay_03 = "man01_stay_02",
  stay_04 = "man01_photo_00",
  stay_05 = "man01_stay_01",
  stay_06 = "man01_stay_00",
  man_handclap = "man01_handclap_00",
  wom_handclap = "wom01_handclap_00",
  kaj_stay_00 = "kaj01_stay_00",
  kaj_stay_01 = "kaj01_stay_01"
}
_TARGET_MOTION = {
  shock_in = "man01_shock_in_00",
  shock = "man01_shock_00",
  attack = "man01_attack_00",
  walk = "man27_walk_fighting_loop_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_userCtrlOff
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
    L6_6,
    {
      name = "_police_06",
      type = "man31",
      node = "locator2_police_06",
      attach = false,
      active = true
    },
    {
      name = "_police_07",
      type = "man31",
      node = "locator2_police_07",
      attach = false,
      active = true
    },
    {
      name = "_police_08",
      type = "man31",
      node = "locator2_police_08",
      attach = false,
      active = true
    },
    {
      name = "_police_09",
      type = "man31",
      node = "locator2_police_09",
      attach = false,
      active = true
    },
    {
      name = "_police_10",
      type = "man31",
      node = "locator2_police_10",
      attach = false,
      active = true
    },
    {
      name = "_police_11",
      type = "man31",
      node = "locator2_police_11",
      attach = false,
      active = true
    },
    {
      name = "_target01_01",
      type = "man80",
      node = "locator2__target01_01",
      attach = false,
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "_target02_01",
      type = "man80",
      node = "locator2__target02_01",
      attach = false,
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "_target02_02",
      type = "man79",
      node = "locator2__target02_02",
      attach = false,
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "_target03_01",
      type = "man80",
      node = "locator2__target03_01",
      attach = false,
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "_target03_02",
      type = "man79",
      node = "locator2__target03_02",
      attach = false,
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "_target03_03",
      type = "man80",
      node = "locator2__target03_03",
      attach = false,
      active = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "_target03_04",
      type = "man79",
      node = "locator2__target03_04",
      attach = false,
      active = false,
      color_variation = 1,
      hair_variation = 1
    }
  }
  L1_1.name = "_man_01"
  L1_1.type = "kaj01"
  L1_1.node = "locator2__man_01"
  L1_1.attach = false
  L1_1.active = false
  L2_2.name = "_police_01"
  L2_2.type = "man31"
  L2_2.node = "locator2_police_01"
  L2_2.attach = false
  L2_2.active = true
  L3_3.name = "_police_02"
  L3_3.type = "man31"
  L3_3.node = "locator2_police_02"
  L3_3.attach = false
  L3_3.active = true
  L4_4.name = "_police_03"
  L4_4.type = "man31"
  L4_4.node = "locator2_police_03"
  L4_4.attach = false
  L4_4.active = true
  L5_5 = {}
  L5_5.name = "_police_04"
  L5_5.type = "man31"
  L5_5.node = "locator2_police_04"
  L5_5.attach = false
  L5_5.active = true
  L6_6 = {}
  L6_6.name = "_police_05"
  L6_6.type = "man31"
  L6_6.node = "locator2_police_05"
  L6_6.attach = false
  L6_6.active = true
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = puppets
    L6_6[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
    L6_6 = Fn_loadNpcEventMotion
    L6_6(L5_5.name, _NPC_MOTION)
    L6_6 = L5_5.name
    if L6_6 ~= "_man_01" then
      L6_6 = table
      L6_6 = L6_6.insert
      L6_6(name_tbl, L5_5.name)
    end
  end
  L5_5 = "_target03_01"
  L6_6 = "_target03_02"
  for L5_5, L6_6 in L2_2(L3_3) do
    Fn_loadNpcEventMotion(L6_6, _TARGET_MOTION)
  end
  for L5_5, L6_6 in L2_2(L3_3) do
    Fn_disableKaiwaDemo(L6_6)
  end
  while true do
    L5_5 = "bg2__battle_"
    L6_6 = string
    L6_6 = L6_6.format
    L6_6 = L6_6("%02d", L2_2)
    L5_5 = L5_5 .. L6_6
    if L3_3 ~= nil then
      L5_5 = L3_3
      L6_6 = false
      L4_4(L5_5, L6_6)
    end
  end
  _sdemo = L3_3
  L5_5 = true
  L3_3(L4_4, L5_5)
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L0_7 = Fn_userCtrlOff
  L0_7()
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_man02"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_wom26"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_wom17"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_man01"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_wom01"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_man33"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_wom05"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_man32"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "npcgen2__mob_man34"
  L5_12 = 20
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = Fn_setNpcActive
  L1_8 = "_man_01"
  L0_7(L1_8, L2_9)
  L0_7 = Fn_playLoopMotionInsert
  L1_8 = "_man_01"
  L5_12 = 10
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12)
  L0_7 = _police_animation
  L0_7()
  L0_7 = CreateWoodbox
  L1_8 = "locator2__test_pos"
  L0_7 = L0_7(L1_8, L2_9)
  _object = L0_7
  L0_7 = wait
  L0_7()
  L0_7 = _sdemo
  L1_8 = L0_7
  L0_7 = L0_7.reset
  L0_7(L1_8)
  L0_7 = _sdemo
  L1_8 = L0_7
  L0_7 = L0_7.set
  L5_12 = Vector
  L6_13 = 0
  L7_14 = 0
  L7_14 = L5_12(L6_13, L7_14, 0)
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L5_12(L6_13, L7_14, 0))
  L0_7 = _sdemo
  L1_8 = L0_7
  L0_7 = L0_7.play
  L0_7(L1_8)
  while true do
    L0_7 = _sdemo
    L1_8 = L0_7
    L0_7 = L0_7.isPlay
    L0_7 = L0_7(L1_8)
    if L0_7 then
      L0_7 = wait
      L0_7()
    end
  end
  L0_7 = Fn_missionStart
  L0_7()
  L0_7 = Fn_kaiwaDemoView
  L1_8 = "sm32_00301k"
  L0_7(L1_8)
  L0_7 = waitSeconds
  L1_8 = 0.5
  L0_7(L1_8)
  L0_7 = Player
  L1_8 = L0_7
  L0_7 = L0_7.setNoDamageMode
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = _sdemo
  L1_8 = L0_7
  L0_7 = L0_7.play
  L4_11.pos = "locator2__aim_02"
  L4_11.time = 1.5
  L4_11.hashfunc = "EaseInOut"
  L0_7(L1_8, L2_9, L3_10)
  while true do
    L0_7 = _sdemo
    L1_8 = L0_7
    L0_7 = L0_7.isPlay
    L0_7 = L0_7(L1_8)
    if L0_7 then
      L0_7 = wait
      L0_7()
    end
  end
  L0_7 = waitSeconds
  L1_8 = 0.5
  L0_7(L1_8)
  L0_7 = _object
  L1_8 = L0_7
  L0_7 = L0_7.getWorldPos
  L0_7 = L0_7(L1_8)
  L1_8 = _object
  L1_8 = L1_8.getWorldRot
  L1_8 = L1_8(L2_9)
  L2_9(L3_10)
  for L5_12 = 1, 10 do
    L6_13 = Vector
    L7_14 = RandF
    L7_14 = L7_14(-0.05, 0.05)
    L6_13 = L6_13(L7_14, RandF(0, 0.02), RandF(-0.05, 0.05))
    L6_13 = L0_7 + L6_13
    L7_14 = Fn_add_rot
    L7_14 = L7_14(L1_8, RandF(-3, 3), RandF(-5, 5), RandF(-3, 3))
    _object:appendCurvePoint2(L6_13, L7_14, RandF(0.05, 0.15), "Linear", true)
  end
  L5_12 = L1_8
  L6_13 = RandF
  L7_14 = 0.05
  L6_13 = L6_13(L7_14, 0.15)
  L7_14 = "Linear"
  L2_9(L3_10, L4_11, L5_12, L6_13, L7_14, true)
  repeat
    L2_9()
  until L2_9 == false
  L2_9(L3_10)
  L2_9(L3_10)
  while true do
    if L2_9 then
      L2_9()
    end
  end
  L2_9(L3_10)
  L2_9()
  while true do
    L5_12 = "bg2__battle_"
    L6_13 = string
    L6_13 = L6_13.format
    L7_14 = "%02d"
    L6_13 = L6_13(L7_14, L2_9)
    L5_12 = L5_12 .. L6_13
    if L3_10 ~= nil then
      L5_12 = L3_10
      L6_13 = true
      L4_11(L5_12, L6_13)
    end
  end
  L3_10()
  L5_12 = 0
  L3_10(L4_11, L5_12)
  L4_11.name = "_target01_01"
  L4_11.locator = "locator2__target01_01"
  L5_12 = {}
  L6_13 = _TARGET_MOTION
  L6_13 = L6_13.walk
  L5_12.anim_walk = L6_13
  L5_12.arrivedLength = 0
  L5_12.runLength = 9999
  L5_12.anim_walk_speed = 1.2
  L5_12.anim_speed_over = true
  L5_12.recast = true
  L4_11.opt = L5_12
  L5_12 = "locator2_pc_photo_pos"
  L6_13 = L3_10
  L4_11(L5_12, L6_13)
  L4_11()
  L5_12 = "sm32_00310k"
  L4_11(L5_12)
  L5_12 = "locator2_pc_photo_pos"
  L6_13 = L3_10
  L7_14 = "sm32_00311k"
  L4_11(L5_12, L6_13, L7_14)
  L5_12 = {}
  L5_12.name = "_target02_01"
  L5_12.locator = "locator2__target02_01"
  L6_13 = {}
  L7_14 = _TARGET_MOTION
  L7_14 = L7_14.walk
  L6_13.anim_walk = L7_14
  L6_13.arrivedLength = 0
  L6_13.runLength = 9999
  L6_13.anim_walk_speed = 1.2
  L6_13.anim_speed_over = true
  L6_13.recast = true
  L5_12.opt = L6_13
  L6_13 = {}
  L6_13.name = "_target02_02"
  L6_13.locator = "locator2__target02_02"
  L7_14 = {}
  L7_14.anim_walk = _TARGET_MOTION.walk
  L7_14.arrivedLength = 0
  L7_14.runLength = 9999
  L7_14.anim_walk_speed = 1.2
  L7_14.anim_speed_over = true
  L7_14.recast = true
  L6_13.opt = L7_14
  L5_12 = _restart
  L6_13 = "locator2_pc_photo_pos"
  L7_14 = L4_11
  L5_12(L6_13, L7_14)
  L5_12 = Fn_fadein
  L5_12()
  L5_12 = Fn_kaiwaDemoView
  L6_13 = "sm32_00320k"
  L5_12(L6_13)
  L5_12 = _loop
  L6_13 = "locator2_pc_photo_pos"
  L7_14 = L4_11
  L5_12(L6_13, L7_14, "sm32_00321k")
  L5_12 = {
    L6_13,
    L7_14,
    {
      name = "_target03_03",
      locator = "locator2__target03_03",
      opt = {
        arrivedLength = 0,
        runLength = -1,
        anim_walk_speed = 1.5,
        anim_speed_over = true,
        recast = true
      },
      startWaitSeconds = 23
    },
    {
      name = "_target03_04",
      locator = "locator2__target03_04",
      opt = {
        anim_walk = _TARGET_MOTION.walk,
        arrivedLength = 0,
        runLength = 9999,
        anim_walk_speed = 1.2,
        anim_speed_over = true,
        recast = true
      },
      startWaitSeconds = 5
    }
  }
  L6_13 = {}
  L6_13.name = "_target03_01"
  L6_13.locator = "locator2__target03_01"
  L7_14 = {}
  L7_14.anim_walk = _TARGET_MOTION.walk
  L7_14.arrivedLength = 0
  L7_14.runLength = 9999
  L7_14.anim_walk_speed = 1.2
  L7_14.anim_speed_over = true
  L7_14.recast = true
  L6_13.opt = L7_14
  L6_13.startWaitSeconds = 10
  L7_14 = {}
  L7_14.name = "_target03_02"
  L7_14.locator = "locator2__target03_02"
  L7_14.opt = {
    anim_walk = _TARGET_MOTION.walk,
    arrivedLength = 0,
    runLength = 9999,
    anim_walk_speed = 1.2,
    anim_speed_over = true,
    recast = true
  }
  L7_14.startWaitSeconds = 0
  L6_13 = _restart
  L7_14 = "locator2_pc_photo_pos"
  L6_13(L7_14, L5_12)
  L6_13 = Fn_fadein
  L6_13()
  L6_13 = Fn_kaiwaDemoView
  L7_14 = "sm32_00330k"
  L6_13(L7_14)
  L6_13 = _loop
  L7_14 = "locator2_pc_photo_pos"
  L6_13(L7_14, L5_12, "sm32_00331k")
  L6_13 = Fn_setNextMissionFlag
  L6_13()
  L6_13 = Fn_nextMission
  L6_13()
  L6_13 = Fn_exitSandbox
  L6_13()
end
function Finalize()
  Mob:restrictStops_sm32_00(false)
end
function _police_animation()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L0_15 = {
    L1_16,
    L2_17,
    L3_18,
    L4_19,
    L5_20,
    L6_21
  }
  L1_16 = {}
  L1_16.name = L2_17
  L2_17.name = L3_18
  L3_18.name = L4_19
  L5_20 = _NPC_MOTION
  L5_20 = L5_20.stay_04
  L4_19.name = L5_20
  L5_20 = {}
  L6_21 = _NPC_MOTION
  L6_21 = L6_21.stay_05
  L5_20.name = L6_21
  L6_21 = {}
  L6_21.name = _NPC_MOTION.stay_06
  L1_16 = {
    L2_17,
    L3_18,
    L4_19,
    L5_20,
    L6_21,
    {name = "_police_06"},
    {name = "_police_07"},
    {name = "_police_08"},
    {name = "_police_09"},
    {name = "_police_10"},
    {name = "_police_11"}
  }
  L2_17.name = "_police_01"
  L3_18.name = "_police_02"
  L4_19.name = "_police_03"
  L5_20 = {}
  L5_20.name = "_police_04"
  L6_21 = {}
  L6_21.name = "_police_05"
  for L5_20 = 1, #L1_16 do
    L6_21 = math
    L6_21 = L6_21.random
    L6_21 = L6_21(#L0_15)
    Fn_setNpcActive(L1_16[L5_20].name, true)
    invokeTask(function()
      local L0_22
      L0_22 = math
      L0_22 = L0_22.random
      L0_22 = L0_22(0, 0.5)
      waitSeconds(L0_22)
      Fn_playMotionNpc(L1_16[L5_20].name, L0_15[L6_21].name, false)
    end)
    do break end
    break
  end
end
function _restart(A0_23, A1_24)
  PhotoMgr:DeleteAllItem()
  if _object then
    _object:requestRestoreForce()
  else
    _object = CreateWoodbox("locator2__test_pos", true)
    wait(3)
  end
  Fn_resetPcPos(A0_23)
  for _FORV_5_ = 1, #A1_24 do
    Fn_setNpcActive(A1_24[_FORV_5_].name, true)
    Fn_warpNpc(A1_24[_FORV_5_].name, A1_24[_FORV_5_].locator)
    if Fn_findNpc(A1_24[_FORV_5_].name) ~= nil then
      Fn_findNpc(A1_24[_FORV_5_].name):reset()
    end
    if Fn_findNpcPuppet(A1_24[_FORV_5_].name) ~= nil then
      Fn_findNpcPuppet(A1_24[_FORV_5_].name):setUsePhysicsMove(true)
    end
  end
end
function _loop(A0_25, A1_26, A2_27)
  local L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43
  L3_28 = {}
  L4_29 = {}
  while true do
    while true do
      L5_30(L6_31)
      L5_30(L6_31)
      L5_30()
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30(L6_31, L7_32)
      L5_30()
      for L8_33 = 1, #A1_26 do
        L9_34(L10_35)
        break
      end
      while true do
        _photo = L7_32
        L9_34.near = 0.5
        L9_34.far = 20
        L10_35.left = -1
        L10_35.right = 1
        L10_35.top = -1
        L10_35.bottom = 1
        L7_32(L8_33, L9_34, L10_35, L11_36)
        for L10_35 = 1, #A1_26 do
          L14_39 = A1_26[L10_35]
          L14_39 = L14_39.name
          L14_39 = "bn_head"
          L11_36(L12_37, L13_38, L14_39)
        end
        L7_32(L8_33, L9_34)
        for L11_36, L12_37 in L8_33(L9_34) do
          L14_39 = L13_38
          L13_38(L14_39, L15_40)
        end
        L8_33(L9_34)
        while true do
          if L8_33 ~= nil then
          end
          if L8_33 and L5_30 == 0 then
            for L11_36 = 1, #A1_26 do
              if L12_37 ~= nil then
                if not L12_37 then
                  break
                end
              end
            end
            L8_33()
          end
        end
        if L5_30 ~= 0 then
          if L8_33 ~= nil then
            L8_33(L9_34)
            _photo = nil
          end
          break
        end
        if L8_33 ~= nil then
          if L8_33 ~= nil then
            L10_35(L11_36)
            if L10_35 == "number" then
              L10_35(L11_36)
            elseif L10_35 == "table" then
              for L14_39 = 1, #L8_33 do
                for L18_43, _FORV_19_ in L15_40(L16_41) do
                  if _FORV_19_ == L8_33[L14_39].target:getName() then
                    break
                  end
                end
              end
              L14_39 = "%d"
              L11_36(L12_37)
              for L14_39 = 1, #L8_33 do
                for L18_43 = 1, #A1_26 do
                  if L4_29[L18_43] == kPHOTO_NO_TERGET and puppets[A1_26[L18_43].name] == L8_33[L14_39].target and L8_33[L14_39].state ~= kPHOTO_OUT and L8_33[L14_39].state ~= kPHOTO_NO_TERGET and L8_33[L14_39].state ~= kPHOTO_FAR then
                    L4_29[L18_43] = kPHOTO_OK
                    puppet_task[L18_43] = invokeTask(function()
                      Fn_findNpc(A1_26[L18_43].name):pauseMove(true)
                      wait()
                      Fn_playMotionNpc(A1_26[L18_43].name, _TARGET_MOTION.shock_in, true, {animBlendDuration = 0.1})
                      Fn_playMotionNpc(A1_26[L18_43].name, _TARGET_MOTION.shock, false)
                    end)
                    break
                  else
                  end
                end
                if L9_34 == false then
                  if L15_40 == L16_41 and L10_35 == 2 then
                    break
                  end
                else
                  break
                end
              end
            end
          end
          _photo = nil
        end
        for L12_37 = 1, #L4_29 do
          L14_39 = kPHOTO_OK
        end
        L9_34(L10_35, L11_36)
        L9_34(L10_35, L11_36)
        if L8_33 == L9_34 then
          L9_34(L10_35)
          break
        end
      end
      L7_32()
      while true do
        if L7_32 then
          L7_32()
        end
      end
      if L5_30 == 0 then
        L8_33()
      elseif L6_31 then
        L8_33(L9_34)
        L8_33(L9_34)
      else
        L8_33[L5_30] = L9_34
        L8_33(L9_34)
        L8_33(L9_34, L10_35, L11_36)
        L8_33(L9_34)
        while true do
          if L8_33 then
            L8_33()
          end
        end
        L8_33(L9_34)
      end
      L8_33()
      if L7_32 then
        L8_33(L9_34)
      end
      L8_33()
      L8_33(L9_34, L10_35)
      L8_33(L9_34, L10_35)
      L8_33()
      for L11_36 = 1, #L3_28 do
        if L12_37 ~= nil then
          L12_37(L13_38)
        end
      end
      L3_28 = L8_33
      for L11_36 = 1, #A1_26 do
        L14_39 = "stay"
        L12_37(L13_38, L14_39, L15_40)
      end
      L8_33(L9_34, L10_35)
      L8_33(L9_34)
      if L5_30 ~= 0 then
        L8_33(L9_34, L10_35)
        L8_33()
      end
    end
  end
  L5_30()
  L5_30()
end
function _end(A0_44)
  local L1_45, L3_46, L4_47
  for _FORV_4_ = 1, #L3_46 do
    if puppet_task[_FORV_4_] ~= nil then
      puppet_task[_FORV_4_]:abort()
      puppet_task[_FORV_4_] = nil
    end
  end
  for _FORV_4_ = 1, #A0_44 do
    Fn_setNpcActive(A0_44[_FORV_4_].name, false)
  end
end
function effect_create(A0_48)
  if not A0_48:isBroken() then
    A0_48:requestBreak(A0_48:getWorldPos(), 0, 2.7)
  end
  _effect = RAC_createEffect({
    eff_name = "ef_com_exp_02",
    pos_node = A0_48,
    time = 2.7
  })
  Sound:playSE("ef_ev_exp_01", 1, "", _effect)
  box_explain(A0_48:getWorldPos())
end
function effect_term()
  if _effect ~= nil then
    _effect:abort()
    _effect = nil
  end
end
function is_effect_playing()
  if _effect ~= nil and _effect:isRunning() then
    return true
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
