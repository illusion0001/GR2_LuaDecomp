local L1_1
function L0_0(A0_2)
  local L1_3
  if A0_2 == nil then
    return
  end
  L1_3 = A0_2.getName
  L1_3 = L1_3(A0_2)
  return invokeTask(function()
    local L0_4
    L0_4 = nil
    while Fn_findNpc(L1_3) ~= nil and Fn_findNpc(L1_3):getPuppet():isPoseAnimPlaying("lookaround") ~= true do
      if Fn_findNpc(L1_3):getPuppet():isPoseAnimPlaying("feeding_pigeon_00") == true then
        L0_4 = createGameObject2("Effect")
        L0_4:setModelName("ef_ev_par_01m")
        L0_4:setName("ef_ev_par_01m")
        L0_4:setLoop(false)
        L0_4:play()
        L0_4:setActive(true)
        L0_4:try_init()
        L0_4:waitForReady()
        L0_4:try_start()
        Fn_findNpc(L1_3):getPuppet():appendChild(L0_4)
      end
      repeat
        wait()
      until Fn_findNpc(L1_3) == nil or Fn_findNpc(L1_3):isMotionEnd() == true
      if L0_4 ~= nil then
        L0_4:try_term()
      end
      L0_4 = nil
      wait()
    end
  end)
end
feeding_pigeon = L0_0
function L0_0(A0_5)
  if A0_5 == nil then
    return
  end
  return Fn_playLoopMotionRand(A0_5, {
    "stay_00",
    "stay_01",
    "eat"
  }, 10, 20)
end
feeding_pigeon_gull = L0_0
function L0_0(A0_6)
  local L1_7
  if A0_6 == nil then
    return
  end
  L1_7 = A0_6.getName
  L1_7 = L1_7(A0_6)
  return invokeTask(function()
    Fn_createTerrainBg("locator2_ft04_00040k_box", "ia_ft04_00040k_box", "box_ms_01"):setIgnoreGrab(true)
    if Fn_findNpc(L1_7) == nil then
      while Fn_createTerrainBg("locator2_ft04_00040k_box", "ia_ft04_00040k_box", "box_ms_01") ~= nil do
        Fn_createTerrainBg("locator2_ft04_00040k_box", "ia_ft04_00040k_box", "box_ms_01"):try_term()
        wait()
        do break end
        wait()
      end
    end
  end)
end
box_off = L0_0
function L0_0(A0_8)
  local L1_9, L2_10
  if A0_8 == nil then
    return
  end
  L2_10 = A0_8
  L1_9 = A0_8.getName
  L1_9 = L1_9(L2_10)
  L2_10 = {}
  return invokeTask(function()
    L2_10[1] = Fn_createTerrainBg("locator2_ft07_00020k_juggling_club1", "ia_juggling_club_1", "ciclub01_base")
    L2_10[2] = Fn_createTerrainBg("locator2_ft07_00020k_juggling_club2", "ia_juggling_club_2", "ciclub01_base")
    while true do
      if Fn_findNpc(L1_9) == nil then
        for _FORV_4_, _FORV_5_ in ipairs(L2_10) do
          if _FORV_5_ ~= nil then
            _FORV_5_:try_term()
            _FORV_5_ = nil
            wait()
          end
        end
        break
      end
      wait()
    end
  end)
end
club_off = L0_0
function L0_0(A0_11)
  local L1_12
  if A0_11 == nil then
    return
  end
  L1_12 = A0_11.getName
  L1_12 = L1_12(A0_11)
  Fn_PlacementEnabledMob("po_a_01", "vendors_sk_09_01_event", false)
  return invokeTask(function()
    while true do
      if Fn_findNpc(L1_12) == nil then
        Fn_PlacementEnabledMob("po_a_01", "vendors_sk_09_01_event", true)
        break
      end
      wait()
    end
  end)
end
vendors_off = L0_0
function L0_0(A0_13)
  local L1_14, L2_15, L3_16
  if A0_13 == nil then
    return
  end
  L2_15 = A0_13
  L1_14 = A0_13.getName
  L1_14 = L1_14(L2_15)
  L2_15 = "stay_03"
  L3_16 = {
    "talk_sad_00"
  }
  return Fn_repeatPlayMotion(L1_14, L2_15, L3_16, 5, 10)
end
tiredGirls = L0_0
function L0_0(A0_17)
  local L1_18, L2_19, L3_20
  if A0_17 == nil then
    return
  end
  L2_19 = A0_17
  L1_18 = A0_17.getName
  L1_18 = L1_18(L2_19)
  L2_19 = "talk_00"
  L3_20 = {
    "talk_laugh_00"
  }
  return Fn_repeatPlayMotion(L1_18, L2_19, L3_20, 5, 10)
end
talkingMan = L0_0
function L0_0(A0_21)
  local L1_22, L2_23, L3_24
  if A0_21 == nil then
    return
  end
  L2_23 = A0_21
  L1_22 = A0_21.getName
  L1_22 = L1_22(L2_23)
  L2_23 = "talk_00"
  L3_24 = {"talk_02"}
  return Fn_repeatPlayMotion(L1_22, L2_23, L3_24, 5, 10)
end
talkingMan2 = L0_0
function L0_0(A0_25)
  local L1_26, L2_27
  if A0_25 == nil then
    return
  end
  L2_27 = A0_25
  L1_26 = A0_25.getName
  L1_26 = L1_26(L2_27)
  L2_27 = {}
  L2_27.talk_agree_00 = "man01_talk_agree_00"
  return invokeTask(function()
    local L0_28, L1_29
    L0_28 = Fn_loadNpcEventMotion
    L1_29 = L1_26
    L0_28(L1_29, L2_27)
    L0_28 = "talk_03"
    L1_29 = {
      L2_27.talk_agree_00
    }
    Fn_repeatPlayMotion(L1_26, L0_28, L1_29, 5, 10)
  end)
end
talkingMan3 = L0_0
function L0_0(A0_30)
  local L1_31, L2_32, L3_33
  if A0_30 == nil then
    return
  end
  L2_32 = A0_30
  L1_31 = A0_30.getName
  L1_31 = L1_31(L2_32)
  L2_32 = "talk_01"
  L3_33 = {
    "talk_04",
    "talk_sad_02"
  }
  return Fn_repeatPlayMotion(L1_31, L2_32, L3_33, 5, 10)
end
talkingMan4 = L0_0
function L0_0(A0_34)
  local L1_35, L2_36, L3_37
  if A0_34 == nil then
    return
  end
  L2_36 = A0_34
  L1_35 = A0_34.getName
  L1_35 = L1_35(L2_36)
  L2_36 = "talk_00"
  L3_37 = {
    "talk_sad_00"
  }
  return Fn_repeatPlayMotion(L1_35, L2_36, L3_37, 5, 10)
end
talkingManSad = L0_0
function L0_0(A0_38)
  local L1_39, L2_40
  if A0_38 == nil then
    return
  end
  L2_40 = A0_38
  L1_39 = A0_38.getName
  L1_39 = L1_39(L2_40)
  L2_40 = {}
  L2_40.talk_sad_03 = "man01_talk_sad_03"
  return invokeTask(function()
    Fn_watchNpc(L1_39, false)
    Fn_loadNpcEventMotion(L1_39, L2_40)
    Fn_playNpcEventMotion(L1_39, L2_40.talk_sad_03, true, 0.3, false, 0, false)
  end)
end
talkingManSad2 = L0_0
function L0_0(A0_41)
  local L1_42, L2_43, L3_44
  if A0_41 == nil then
    return
  end
  L2_43 = A0_41
  L1_42 = A0_41.getName
  L1_42 = L1_42(L2_43)
  L2_43 = "talk_00"
  L3_44 = {
    "talk_cid_00",
    "talk_cid_01"
  }
  return Fn_repeatPlayMotion(L1_42, L2_43, L3_44, 5, 10)
end
talkingWom = L0_0
function L0_0(A0_45)
  local L1_46, L2_47, L3_48
  if A0_45 == nil then
    return
  end
  L2_47 = A0_45
  L1_46 = A0_45.getName
  L1_46 = L1_46(L2_47)
  L2_47 = "stay_03"
  L3_48 = {
    "talk_sad_00"
  }
  return Fn_repeatPlayMotion(L1_46, L2_47, L3_48, 5, 10)
end
talkingWom2 = L0_0
function L0_0(A0_49)
  local L1_50, L2_51, L3_52
  if A0_49 == nil then
    return
  end
  L2_51 = A0_49
  L1_50 = A0_49.getName
  L1_50 = L1_50(L2_51)
  L2_51 = "talk_03"
  L3_52 = {
    "talk_00",
    "talk_sad_02"
  }
  return Fn_repeatPlayMotion(L1_50, L2_51, L3_52, 5, 10)
end
talkingWom3 = L0_0
function L0_0(A0_53)
  local L1_54
  if A0_53 == nil then
    return
  end
  L1_54 = A0_53.getName
  L1_54 = L1_54(A0_53)
  return invokeTask(function()
    A0_53:setSightParam({
      valid = true,
      watchTarget = true,
      target = Fn_findNpcPuppet("fix_ia_ft08_00050k_01"),
      targetJoint = "dm_head",
      forceTarget = true,
      onlyFace = true
    })
    wait()
    Fn_playMotionNpc(L1_54, "talk_cid_00", false, {animBlendDuration = 0.3, isRepeat = true})
  end)
end
talkingWomRich = L0_0
function L0_0(A0_55)
  local L1_56, L2_57
  if A0_55 == nil then
    return
  end
  L2_57 = A0_55
  L1_56 = A0_55.getName
  L1_56 = L1_56(L2_57)
  L2_57 = {}
  L2_57.idle_bu_00 = "wom01_idle_bu_00"
  return invokeTask(function()
    local L0_58, L1_59
    L0_58 = Fn_loadNpcEventMotion
    L1_59 = L1_56
    L0_58(L1_59, L2_57)
    L0_58 = L2_57.idle_bu_00
    L1_59 = {"talk_03"}
    Fn_repeatPlayMotion(L1_56, L0_58, L1_59, 5, 10)
  end)
end
workingWom = L0_0
function L0_0(A0_60)
  local L1_61, L2_62
  if A0_60 == nil then
    return
  end
  L2_62 = A0_60
  L1_61 = A0_60.getName
  L1_61 = L1_61(L2_62)
  L2_62 = {}
  L2_62.stay_00 = "man27_stay_00"
  return invokeTask(function()
    Fn_watchNpc(L1_61, false)
    wait()
    A0_60:setSightParam({
      valid = true,
      watchTarget = true,
      target = Fn_findNpcPuppet("fix_ia_ft09_00050k_02"),
      forceTarget = true,
      onlyFace = true
    })
    wait()
    Fn_loadNpcEventMotion(L1_61, L2_62)
    Fn_playNpcEventMotion(L1_61, L2_62.stay_00, true, 0.3, false, 0, false)
  end)
end
staySad = L0_0
function L0_0(A0_63)
  local L1_64, L2_65, L3_66
  if A0_63 == nil then
    return
  end
  L2_65 = A0_63
  L1_64 = A0_63.getName
  L1_64 = L1_64(L2_65)
  L2_65 = "relax_00"
  L3_66 = {
    "talk_01",
    "talk_laugh_00"
  }
  return invokeTask(function()
    A0_63:setSightParam({
      valid = true,
      watchTarget = true,
      target = Fn_findNpcPuppet("fix_ia_ft08_00050k_02"),
      targetJoint = "bn_head",
      forceTarget = true,
      onlyFace = true
    })
    wait()
    Fn_repeatPlayMotion(L1_64, L2_65, L3_66, 5, 10)
  end)
end
talkingChiRich = L0_0
function L0_0(A0_67)
  local L1_68, L2_69, L3_70
  if A0_67 == nil then
    return
  end
  L2_69 = A0_67
  L1_68 = A0_67.getName
  L1_68 = L1_68(L2_69)
  L2_69 = Fn_getRandamNpcType
  L3_70 = L1_68
  L2_69 = L2_69(L3_70)
  L3_70 = {}
  if string.match(L2_69, "wom") ~= nil then
    L3_70 = {
      appointment_00 = "man01_appointment_00"
    }
  elseif string.match(L2_69, "man") ~= nil then
    L3_70 = {
      appointment_00 = "wom01_appointment_00"
    }
  end
  return invokeTask(function()
    Fn_loadNpcEventMotion(L1_68, L3_70)
    Fn_playNpcEventMotion(L1_68, L3_70.appointment_00, true, 0.3, false, 0, false)
  end)
end
appointmentAct = L0_0
function L0_0(A0_71)
  local L1_72
  if A0_71 == nil then
    return
  end
  L1_72 = A0_71.getName
  L1_72 = L1_72(A0_71)
  return invokeTask(function()
    local L0_73, L1_74
    L0_73 = {}
    L0_73.idle_bu_00 = "man01_idle_bu_00"
    L1_74 = Fn_loadNpcEventMotion
    L1_74(L1_72, L0_73)
    L1_74 = "stay_00"
    Fn_playLoopMotionInsert(L1_72, L1_74, {
      L0_73.idle_bu_00
    }, 5, 10)
  end)
end
stretch = L0_0
function L0_0(A0_75)
  local L1_76
  if A0_75 == nil then
    return
  end
  L1_76 = A0_75.getName
  L1_76 = L1_76(A0_75)
  return invokeTask(function()
    local L0_77, L1_78
    L0_77 = Fn_createTerrainBg
    L1_78 = "locator2_ft07_00050k_deckbrush"
    L0_77 = L0_77(L1_78, "ft07_00050k_deckbrush", "cideckbrush01_base")
    L1_78 = {}
    L1_78.idle_lo_01 = "man01_idle_lo_01"
    Fn_loadNpcEventMotion(L1_76, L1_78)
    Fn_playNpcEventMotion(L1_76, L1_78.idle_lo_01, true, 0.3, false, 0, false)
    if Fn_findNpc(L1_76) == nil then
      while L0_77 ~= nil do
        L0_77:try_term()
        L0_77 = nil
        wait()
        do break end
        wait()
      end
    end
  end)
end
sit_floor_idle = L0_0
function L0_0(A0_79)
  local L1_80
  if A0_79 == nil then
    return
  end
  L1_80 = A0_79.getName
  L1_80 = L1_80(A0_79)
  return invokeTask(function()
    local L0_81
    L0_81 = {}
    L0_81.idle_dt_02 = "man01_idle_dt_02"
    Fn_loadNpcEventMotion(L1_80, L0_81)
    Fn_playNpcEventMotion(L1_80, L0_81.idle_dt_02, true, 0.3, false, 0, false)
  end)
end
layDown = L0_0
function L0_0(A0_82)
  local L1_83
  if A0_82 == nil then
    return
  end
  L1_83 = A0_82.getName
  L1_83 = L1_83(A0_82)
  return invokeTask(function()
    local L0_84
    L0_84 = {}
    L0_84.idle_lo_00 = "man01_idle_lo_00"
    Fn_loadNpcEventMotion(L1_83, L0_84)
    Fn_playNpcEventMotion(L1_83, L0_84.idle_lo_00, true, 0.3, false, 0, false)
  end)
end
trashRummage = L0_0
function L0_0(A0_85)
  local L1_86
  if A0_85 == nil then
    return
  end
  L1_86 = A0_85.getName
  L1_86 = L1_86(A0_85)
  return invokeTask(function()
    local L0_87, L1_88
    L0_87 = findGameObject2
    L1_88 = "Node"
    L0_87 = L0_87(L1_88, "locator2_ft08_00010k_viewpos")
    L1_88 = Fn_watchNpc
    L1_88(L1_86, false)
    L1_88 = {}
    L1_88.degree_h = 180
    L1_88.degree_v = 160
    L1_88.valid = true
    L1_88.watchTarget = true
    L1_88.target = L0_87
    L1_88.forceTarget = true
    L1_88.onlyFace = true
    A0_85:setSightParam(L1_88)
  end)
end
lookingAtPropeller = L0_0
function L0_0(A0_89)
  if A0_89 == nil then
    return
  end
  return A0_89:setSightParam({
    target = Fn_findNpcPuppet("fix_ia_ft14_00010k_01"),
    targetJoint = "bn_head",
    forceTarget = true,
    onlyFace = true
  })
end
lookingAtTarget = L0_0
function L0_0(A0_90)
  local L1_91
  if A0_90 == nil then
    return
  end
  L1_91 = A0_90.getName
  L1_91 = L1_91(A0_90)
  return invokeTask(function()
    local L0_92, L1_93
    L0_92 = Fn_findNpcPuppet
    L1_93 = A0_90
    L0_92 = L0_92(L1_93)
    L1_93 = createGameObject2
    L1_93 = L1_93("GimmickBg")
    L1_93:setDrawModelName("cigun01_base")
    L1_93:setName("ia_rifle_ft05_00100k")
    Fn_attachJoint(L1_93, L0_92, "loc_r_hand")
    L1_93:try_init()
    L1_93:waitForReady()
    L1_93:try_start()
    if Fn_findNpc(L1_91) == nil then
      while L1_93 ~= nil do
        L1_93:try_term()
        L1_93 = nil
        wait()
        do break end
        wait()
      end
    end
  end)
end
attachRifle = L0_0
function L0_0(A0_94)
  local L1_95
  if A0_94 == nil then
    return
  end
  L1_95 = A0_94.getName
  L1_95 = L1_95(A0_94)
  return invokeTask(function()
    local L0_96, L1_97, L2_98, L3_99, L4_100
    L0_96 = findGameObject2
    L1_97 = "Node"
    L2_98 = "locator2_fix_spawn_ft15_00010k"
    L0_96 = L0_96(L1_97, L2_98)
    function L1_97()
      Fn_warpNpc(L1_95, L0_96)
    end
    L2_98 = A0_94
    L3_99 = L2_98
    L2_98 = L2_98.setEventListener
    L4_100 = "npcFall"
    L2_98(L3_99, L4_100, L1_97)
    L2_98 = {}
    L3_99 = 1
    while true do
      while true do
        L4_100 = "locator2_gri_move_0"
        L4_100 = L4_100 .. L3_99
        if findGameObject2("Node", L4_100) ~= nil then
          L2_98[L3_99] = L4_100
          L3_99 = L3_99 + 1
        else
          break
        end
        wait()
      end
    end
    while true do
      L4_100 = Fn_moveNpc
      L4_100 = L4_100(L1_95, L2_98, {
        anim_walk_speed = 0.5,
        goalDirection = true,
        arrivedLength = 0
      })
      while L4_100:isRunning() do
        if A0_94:getMoveCurrentIndex() == 4 or A0_94:getMoveCurrentIndex() == 7 then
          while A0_94:getMoveCurrentIndex() ~= 5 and A0_94:getMoveCurrentIndex() ~= 8 do
            wait()
          end
          A0_94:pauseMove(true)
          A0_94:playMotion("stay", {
            isRepeat = false,
            isStop = true,
            animBlendDuration = 0.3
          })
          repeat
            wait()
          until A0_94:isMotionEnd()
          A0_94:pauseMove(false)
        end
        wait()
      end
      wait()
    end
  end)
end
moveGrigo = L0_0
function L0_0(A0_101)
  local L1_102
  if A0_101 == nil then
    return
  end
  L1_102 = A0_101.getName
  L1_102 = L1_102(A0_101)
  return invokeTask(function()
    local L0_103, L1_104, L2_105
    L0_103 = Fn_findNpcPuppet
    L1_104 = A0_101
    L0_103 = L0_103(L1_104)
    L1_104 = createGameObject2
    L2_105 = "GimmickBg"
    L1_104 = L1_104(L2_105)
    L2_105 = L1_104.setDrawModelName
    L2_105(L1_104, "cicamera01_base")
    L2_105 = L1_104.setName
    L2_105(L1_104, "ia_camera_ft1400020k")
    L2_105 = Fn_attachJoint
    L2_105(L1_104, L0_103, "loc_r_hand")
    L2_105 = L1_104.try_init
    L2_105(L1_104)
    L2_105 = L1_104.waitForReady
    L2_105(L1_104)
    L2_105 = L1_104.try_start
    L2_105(L1_104)
    L2_105 = {}
    L2_105.idle_sm49_00 = "man01_idle_sm49_00"
    Fn_loadNpcEventMotion(L1_102, L2_105)
    Fn_playNpcEventMotion(L1_102, L2_105.idle_sm49_00, true, 0.3, false, 0, false)
    if Fn_findNpc(L1_102) == nil then
      while L1_104 ~= nil do
        L1_104:try_term()
        L1_104 = nil
        wait()
        do break end
        wait()
      end
    end
  end)
end
attachCamera = L0_0
function L0_0(A0_106)
  local L1_107
  if A0_106 == nil then
    return
  end
  L1_107 = A0_106.getName
  L1_107 = L1_107(A0_106)
  return invokeTask(function()
    local L0_108, L1_109, L2_110, L3_111
    L0_108 = Fn_findNpcPuppet
    L1_109 = A0_106
    L0_108 = L0_108(L1_109)
    L1_109 = createGameObject2
    L2_110 = "GimmickBg"
    L1_109 = L1_109(L2_110)
    L3_111 = L1_109
    L2_110 = L1_109.setDrawModelName
    L2_110(L3_111, "cidrink01_base")
    L3_111 = L1_109
    L2_110 = L1_109.setName
    L2_110(L3_111, "ia_can_" .. L1_107)
    L2_110 = Fn_attachJoint
    L3_111 = L1_109
    L2_110(L3_111, L0_108, "loc_r_hand")
    L3_111 = L1_109
    L2_110 = L1_109.try_init
    L2_110(L3_111)
    L3_111 = L1_109
    L2_110 = L1_109.waitForReady
    L2_110(L3_111)
    L3_111 = L1_109
    L2_110 = L1_109.try_start
    L2_110(L3_111)
    L2_110 = Fn_getRandamNpcType
    L3_111 = L1_107
    L2_110 = L2_110(L3_111)
    L3_111 = {}
    if string.match(L2_110, "wom") ~= nil then
      L3_111 = {
        drink_00 = "wom01_drink_00",
        drink_01 = "wom01_drink_01"
      }
    else
      L3_111 = {
        drink_00 = "man01_drink_00",
        drink_01 = "man01_drink_01"
      }
    end
    Fn_loadNpcEventMotion(L1_107, L3_111)
    Fn_repeatPlayMotion(L1_107, L3_111.drink_01, {
      L3_111.drink_00
    }, 5, 10)
    if Fn_findNpc(L1_107) == nil then
      while L1_109 ~= nil do
        L1_109:try_term()
        L1_109 = nil
        wait()
        do break end
        wait()
      end
    end
  end)
end
drinkAct = L0_0
function L0_0(A0_112)
  local L1_113, L2_114, L3_115
  if A0_112 == nil then
    return
  end
  L2_114 = A0_112
  L1_113 = A0_112.getName
  L1_113 = L1_113(L2_114)
  L2_114 = string
  L2_114 = L2_114.match
  L3_115 = L1_113
  L2_114 = L2_114(L3_115, "_(ft.-k)_")
  L3_115 = {}
  return invokeTask(function()
    local L0_116, L1_117
    L0_116 = Fn_findNpcPuppet
    L1_117 = A0_112
    L0_116 = L0_116(L1_117)
    L1_117 = createGameObject2
    L1_117 = L1_117("GimmickBg")
    L1_117:setDrawModelName("cimemo01_base")
    L1_117:setName("ia_memo" .. L1_113)
    Fn_attachJoint(L1_117, L0_116, "loc_l_hand")
    L1_117:try_init()
    L1_117:waitForReady()
    L1_117:try_start()
    L3_115[1] = L1_117
    L3_115[2] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box1", "ia_box1", "woodbox_kk_02")
    L3_115[3] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box2", "ia_box2", "box_ms_01")
    L3_115[4] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box3", "ia_box3", "woodbox_kk_02")
    L3_115[5] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box4", "ia_box4", "box_ms_01")
    L3_115[6] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box5", "ia_box5", "box_kw_01")
    L3_115[7] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box6", "ia_box6", "box_kw_01")
    L3_115[8] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box7", "ia_box7", "basket_kw_02")
    L3_115[9] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box8", "ia_box8", "barrel_kk_01")
    L3_115[10] = Fn_createTerrainBg("locator2_" .. L2_114 .. "_box9", "ia_box9", "box_ms_02")
    for _FORV_5_, _FORV_6_ in ipairs(L3_115) do
      _FORV_6_:setIgnoreGrab(true)
    end
    while true do
      if Fn_findNpc(L1_113) == nil then
        for _FORV_6_, _FORV_7_ in ipairs(L3_115) do
          if _FORV_7_ ~= nil then
            _FORV_7_:try_term()
            _FORV_7_ = nil
            wait()
          end
        end
        break
      end
      wait()
    end
  end)
end
porterAct = L0_0
function L0_0(A0_118)
  local L1_119
  if A0_118 == nil then
    return
  end
  L1_119 = A0_118.getName
  L1_119 = L1_119(A0_118)
  return invokeTask(function()
    local L0_120, L1_121
    L0_120 = createGameObject2
    L1_121 = "GimmickBg"
    L0_120 = L0_120(L1_121)
    L1_121 = L0_120.setDrawModelName
    L1_121(L0_120, "woodbox_kk_03")
    L1_121 = L0_120.setAttributeName
    L1_121(L0_120, "woodbox_kk_03")
    L1_121 = L0_120.setName
    L1_121(L0_120, "ia_attachbox" .. L1_119)
    L1_121 = L0_120.setFloaterParams
    L1_121(L0_120)
    L1_121 = L0_120.setIgnoreGrab
    L1_121(L0_120, true)
    L1_121 = L0_120.try_init
    L1_121(L0_120)
    L1_121 = L0_120.waitForReady
    L1_121(L0_120)
    L1_121 = L0_120.try_start
    L1_121(L0_120)
    L1_121 = A0_118
    L1_121 = L1_121.getPuppet
    L1_121 = L1_121(L1_121)
    Fn_attachJoint(L0_120, L1_121, "bn_spine0")
    L0_120:setPos(Vector(0, -0.5, -0.15))
    if Fn_findNpc(L1_119) == nil then
      while L0_120 ~= nil do
        L0_120:try_term()
        L0_120 = nil
        wait()
        do break end
        wait()
      end
    end
  end)
end
porterAct2 = L0_0
function L0_0(A0_122)
  local L1_123, L2_124
  if A0_122 == nil then
    return
  end
  L2_124 = A0_122
  L1_123 = A0_122.getName
  L1_123 = L1_123(L2_124)
  L2_124 = Fn_findNpcPuppet
  L2_124 = L2_124(L1_123)
  return invokeTask(function()
    local L0_125, L1_126
    L0_125 = findGameObject2
    L1_126 = "Node"
    L0_125 = L0_125(L1_126, "locator2_fix_spawn_ft14_00010k_01")
    function L1_126()
      print("\232\144\189\227\129\161\227\129\159\227\129\174\227\129\167\229\136\157\230\156\159\228\189\141\231\189\174\227\129\171\227\131\175\227\131\188\227\131\151\227\129\149\227\129\155\227\129\190\227\129\153")
      Fn_warpNpc(L1_123, L0_125)
    end
    A0_122:setEventListener("npcFall", L1_126)
    while A0_122 ~= nil do
      if Fn_get_distance(L2_124:getWorldPos(), L0_125:getWorldPos()) > 5 then
        while Fn_moveNpc(L1_123, {L0_125}, {goalDirection = true}):isRunning() do
          wait()
        end
      end
      wait()
    end
  end)
end
resetGrigo = L0_0
function L0_0(A0_127)
  local L1_128
  if A0_127 == nil then
    return
  end
  L1_128 = A0_127.getName
  L1_128 = L1_128(A0_127)
  return invokeTask(function()
    local L0_129, L1_130, L2_131
    L0_129 = killSpawnTask
    L1_130 = L1_128
    L0_129(L1_130)
    L0_129 = {}
    L1_130 = 1
    while true do
      L2_131 = "locator2_girl_move_0"
      L2_131 = L2_131 .. L1_130
      if findGameObject2("Node", L2_131) ~= nil then
        L0_129[L1_130] = L2_131
        L1_130 = L1_130 + 1
      else
        break
      end
      wait()
    end
    L2_131 = Fn_moveNpc
    L2_131 = L2_131(L1_128, L0_129, {avoidance = true, runLength = 2})
    while L2_131:isRunning() do
      wait()
    end
    Fn_changeNpcToMob(L1_128)
  end)
end
escapeGirls = L0_0
function L0_0(A0_132)
  local L1_133, L2_134
  if A0_132 == nil then
    return
  end
  L2_134 = A0_132
  L1_133 = A0_132.getName
  L1_133 = L1_133(L2_134)
  L2_134 = {}
  L2_134.npc2 = "fix_ia_ft14_00030k_02"
  L2_134.npc3 = "fix_ia_ft14_00030k_03"
  return invokeTask(function()
    local L0_135, L1_136, L2_137, L3_138, L4_139, L5_140, L6_141
    L0_135 = killSpawnTask
    L1_136 = L1_133
    L0_135(L1_136)
    L0_135 = killSpawnTask
    L1_136 = L2_134.npc2
    L0_135(L1_136)
    L0_135 = killSpawnTask
    L1_136 = L2_134.npc3
    L0_135(L1_136)
    L0_135 = Fn_playMotionNpc
    L1_136 = L1_133
    L4_139.animBlendDuration = 0.4
    L0_135(L1_136, L2_137, L3_138, L4_139)
    L0_135 = {}
    L1_136 = 1
    while true do
      L5_140 = L2_137
      if L3_138 ~= nil then
        L0_135[L1_136] = L2_137
        L1_136 = L1_136 + 1
      else
        break
      end
      L3_138()
    end
    for L5_140, L6_141 in L2_137(L3_138) do
      invokeTask(function()
        while Fn_moveNpc(L6_141, L0_135, {avoidance = true, runLength = -1}):isRunning() do
          wait()
        end
        Fn_changeNpcToMob(L6_141)
      end)
      break
    end
  end)
end
adiStay = L0_0
