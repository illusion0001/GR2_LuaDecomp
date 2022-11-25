dofile("/Game/Misc/perceivable_npc.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
_warcannon_safe_area = true
_danger_area = false
_wdbx_hdl = {}
_wdbx_max = 88
_soldier_voice_type = {}
_VOICE_TYPE_MAX = 4
_is_radio_call = false
_NPC_SIGHT_H_DEG = 45
_NPC_SIGHT_V_DEG = 15
_NPC_SIGHT_LEN = 30
_NPC_GUARD_SIGHT_H_DEG = 45
_NPC_GUARD_SIGHT_V_DEG = 30
_NPC_GUARD_SIGHT_LEN = 35
_NPC_CAUTION_INC = 3
_NPC_CAUTION_DEC = 0.35
_NPC_GUARD_CAUTION_INC = 20
_BAND_SIGHT_H_DEG = 30
_BAND_SIGHT_V_DEG = 15
_BAND_SIGHT_LEN = 15
_BAND_CAUTION_INC = 100
_BAND_CAUTION_DEC = 0.5
_move_option_soldier_normal = {
  anim_walk = "npc_walk",
  anim_turn_l = "npc_turn_l",
  anim_turn_r = "npc_turn_r",
  anim_walk_speed = 1,
  runLength = 99999,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
_move_option_soldier_alert = {
  anim_run_speed = 0.8,
  runLength = -1,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
_detected_sensor = false
npcName_d = nil
function setArStage()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = loadFileAsset
  L1_1 = "evb"
  L2_2 = "evx/ep08_ar_stage"
  L0_0 = L0_0(L1_1, L2_2)
  if L0_0 then
    L2_2 = L0_0
    L1_1 = L0_0.wait
    L1_1(L2_2)
    L2_2 = L0_0
    L1_1 = L0_0.getRoot
    L1_1 = L1_1(L2_2)
    L2_2 = EventData
    L3_3 = L2_2
    L2_2 = L2_2.create
    L2_2 = L2_2(L3_3, L4_4, L5_5, L6_6)
    L3_3 = L2_2.try_init
    L3_3(L4_4)
    L3_3 = L2_2.waitForReady
    L3_3(L4_4)
    L3_3 = L2_2.try_start
    L3_3(L4_4)
    L3_3 = {
      L4_4,
      L5_5,
      L6_6,
      L7_7,
      L8_8,
      L9_9,
      L10_10,
      "bg2_building_kk_36_03",
      "bg2_building_kk_36_04",
      "bg2_flag_kk_01_01",
      "bg2_flag_kk_01_02",
      "bg2_speaker_kk_01_01",
      "bg2_speaker_kk_01_02",
      "bg2_woodbox_ms_01_01",
      "bg2_woodbox_ms_01_02",
      "bg2_woodbox_ms_01_03",
      "bg2_woodbox_ms_01_04",
      "bg2_container_kk_04_01",
      "bg2_container_kk_04_02",
      "bg2_pot_kk_04_01",
      "bg2_pot_kk_04_02",
      "bg2_table_kk_09_01",
      "bg2_table_kk_09_02",
      "bg2_table_kk_07_01",
      "bg2_table_kk_06_01",
      "bg2_table_kk_04_01",
      "bg2_table_kk_06_02",
      "bg2_table_kk_06_03",
      "bg2_table_sk_01_01",
      "bg2_table_kk_06_04",
      "bg2_table_kk_07_02",
      "bg2_table_kk_06_05",
      "bg2_table_kk_06_06",
      "bg2_table_kk_06_07",
      "bg2_table_kk_04_02",
      "bg2_table_kk_06_08",
      "bg2_table_kk_06_09",
      "bg2_table_kk_06_010",
      "bg2_table_kk_07_03",
      "bg2_table_kk_06_011",
      "bg2_table_kk_06_012",
      "bg2_table_kk_06_013",
      "bg2_table_kk_06_014",
      "bg2_table_kk_07_04",
      "bg2_stagelight_sk_01_01",
      "bg2_stagelight_sk_01_02",
      "bg2_stagelight_sk_02_01",
      "bg2_stagelight_sk_02_02",
      "bg2_stagelight_sk_02_03",
      "bg2_stagelight_sk_02_04"
    }
    L7_7 = "bg2_building_kk_36_01"
    L8_8 = "bg2_building_kk_37_01"
    L9_9 = "bg2_building_kk_51_01"
    L10_10 = "bg2_building_kk_36_02"
    for L7_7, L8_8 in L4_4(L5_5) do
      L9_9 = findGameObject2
      L10_10 = "GimmickBg"
      L9_9 = L9_9(L10_10, L8_8)
      if L9_9 then
        L10_10 = Aabb
        L10_10 = L10_10(Vector(-500, -500, -500), Vector(500, 500, 500))
        L9_9:setLocalAabb(L10_10)
        L9_9:setVisibleBlockEnable(false)
        L9_9:setCollidableBlockEnable(false)
        L9_9:setFarCullingEnable(false)
        print(L8_8 .. "\227\129\174Aabb\227\130\181\227\130\164\227\130\186\227\130\146\230\139\161\229\164\167")
      end
    end
    L0_0, L1_1 = nil, nil
  end
end
function setPlayerIdle()
  Fn_userCtrlOff()
  waitSeconds(1)
  if Player:isGravityControlMode() then
    Player:setStay(true, false)
    Fn_coercionGravityShift()
  else
    Fn_coercionGravityRevert()
  end
  waitSeconds(2)
  Fn_userCtrlOn()
end
function setPlayerIdle2()
  if Player:isGravityControlMode() then
    Player:setStay(true, false)
  else
    Player:setStay(true)
  end
end
function soldierActionep08a(A0_11, A1_12)
  local L2_13
  L2_13 = _detected_ar_flg
  if not L2_13 then
    L2_13 = _detected_sol_flg
  elseif L2_13 then
    return
  end
  L2_13 = CALLBACK_REASON
  L2_13 = L2_13.IS_INSIGHT
  if A1_12 == L2_13 then
  else
    L2_13 = CALLBACK_REASON
    L2_13 = L2_13.CAUTION_OVERFLOW
    if A1_12 ~= L2_13 then
      L2_13 = CALLBACK_REASON
      L2_13 = L2_13.DAMAGED
    else
      if A1_12 == L2_13 then
        L2_13 = findGameObject2
        L2_13 = L2_13("Puppet", A0_11)
        Fn_captionView("ep08_09016")
        Sound:playSE(({
          "m25_012b",
          "m26_007b",
          "m27_008b",
          "m28_007b"
        })[RandI(1, #{
          "m25_012b",
          "m26_007b",
          "m27_008b",
          "m28_007b"
        })], 1, "", L2_13)
        Fn_pcSensorOff("pccubesensormulti2_restart_01")
        detectedBySoldier(A0_11)
    end
    else
      L2_13 = CALLBACK_REASON
      L2_13 = L2_13.TERMINATE
      if A1_12 == L2_13 then
      end
    end
  end
end
function soldierAction(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20
  L3_17 = print
  L4_18 = "\226\150\160\226\150\160CALLBACK_REASON\226\150\160\226\150\160"
  L5_19 = A1_15
  L3_17(L4_18, L5_19, L6_20)
  L3_17 = _detected_sensor
  if L3_17 ~= true then
    L3_17 = _detected_sensor
  elseif L3_17 == true then
    return
  end
  L3_17 = 0
  L4_18 = {}
  L5_19 = 0
  for _FORV_9_ = 1, #_soldier_voice_type do
    if _soldier_voice_type[_FORV_9_].name == A0_14 then
      L3_17 = _soldier_voice_type[_FORV_9_].voice_type
    end
  end
  if A1_15 ~= L6_20 then
  else
    if A1_15 == L6_20 then
      if L6_20 then
        return
      end
      L6_20("insightBy:" .. A0_14)
      L4_18 = {
        "a",
        "b",
        "c"
      }
      L5_19 = RandI(1, #L4_18)
      Fn_captionView(({
        "ep08_09000",
        "ep08_09001",
        "ep08_09003"
      })[L5_19])
      Sound:playSE(({
        "m25_010",
        "m26_005",
        "m27_006",
        "m28_005"
      })[L3_17] .. L4_18[L5_19], 1, "", L6_20)
      if RandI(1, 2) == 1 and _is_radio_call == false then
        _is_radio_call = true
        if A2_16 == false or A2_16 == nil then
          waitSeconds(4)
        end
        if _begin_combat then
          return
        end
        for _FORV_13_ = 1, #_soldierInstance do
          if _soldierInstance[_FORV_13_].name == A0_14 then
            if _soldierInstance[_FORV_13_].status == NPC_STATUS.DEAD then
              return
            else
              break
            end
          end
        end
        for _FORV_13_ = 1, #_guardInstance do
          if _guardInstance[_FORV_13_].name == A0_14 then
            if _guardInstance[_FORV_13_].status == NPC_STATUS.DEAD then
              return
            else
              break
            end
          end
        end
        print("\226\150\160\226\150\160CALLBACK_REASON2\226\150\160\226\150\160", A1_15, A0_14)
        L4_18 = {
          "a",
          "b",
          "c"
        }
        L5_19 = RandI(1, #L4_18)
        Fn_captionView(({
          "ep08_09017",
          "ep08_09018",
          "ep08_09019"
        })[L5_19])
        Sound:playSE(({
          "m25_011",
          "m26_006",
          "m27_007",
          "m28_006"
        })[L3_17] .. L4_18[L5_19], 1, "", L6_20)
        _is_radio_call = false
      end
  end
  elseif A1_15 == L6_20 then
    L6_20(A0_14 .. "\227\129\174\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\164\167\227\129\171\227\129\170\227\130\138\227\129\190\227\129\151\227\129\159")
    L6_20("pccubesensor2_talk_range_01")
    _talk_range = false
    _band_talk_start_flg = false
    L6_20("pccubesensor2_talk_range_02")
    if L6_20 == false then
      L6_20()
    end
    L6_20("pccubesensormulti2_ar_safearea_01")
  else
    if A1_15 ~= L6_20 then
    else
      if A1_15 == L6_20 then
        if L6_20 then
          return
        end
        L6_20(A0_14 .. "\227\129\174\232\173\166\230\136\146\227\129\140\232\167\163\227\129\145\227\129\190\227\129\151\227\129\159")
        L4_18 = {
          "a",
          "b",
          "c"
        }
        L5_19 = RandI(1, #L4_18)
        Fn_captionView(({
          "ep08_09006",
          "ep08_09007",
          "ep08_09008"
        })[L5_19])
        Sound:playSE(({
          "m25_013",
          "m26_008",
          "m27_009",
          "m28_008"
        })[L3_17] .. L4_18[L5_19], 1, "", L6_20)
    end
    elseif A1_15 == L6_20 then
      L6_20(A0_14 .. "\227\129\140\230\173\187\228\186\161\227\129\151\227\129\190\227\129\151\227\129\159")
      L6_20()
      if L6_20 ~= nil then
        L6_20("pccubesensor2_talk_range_01")
        L6_20("pccubesensor2_talk_range_02")
      end
      if L6_20 then
        _begin_combat = false
      end
      L6_20()
      for _FORV_9_ = 1, #_soldierTable do
        _soldierTable[_FORV_9_]:setIndicationEnable(true)
        _soldierTable[_FORV_9_]:setIndicationRange(10)
      end
      L6_20(L6_20, 4)
      if L6_20 == false then
        L6_20()
        L6_20()
      end
      L6_20("pccubesensormulti2_ar_safearea_01")
      npcName_d = A0_14
      L6_20(function()
        waitSeconds(3)
        print(A0_14 .. "\227\130\146\233\157\158\232\161\168\231\164\186\230\186\150\229\130\153")
        if findGameObject2("Puppet", npcName_d) ~= nil then
          print(A0_14 .. "\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171\227\129\151\227\129\190\227\129\153")
          for _FORV_4_ = 1, 9 do
            findGameObject2("Puppet", npcName_d):setAlpha(1 - _FORV_4_ / 10)
            waitSeconds(0.3)
          end
          findGameObject2("Puppet", npcName_d):setVisible(false)
        else
          print("puppet_d = nil")
        end
      end)
    elseif A1_15 == L6_20 then
      _begin_combat = true
      L6_20()
      for _FORV_9_ = 1, #_soldierTable do
        _soldierTable[_FORV_9_]:setIndicationEnable(true)
        _soldierTable[_FORV_9_]:setIndicationRange(75)
      end
      L4_18 = {"a", "b"}
      L5_19 = RandI(1, #L4_18)
      Fn_captionView(({"ep08_09011", "ep08_09010"})[L5_19])
      Sound:playSE(({
        "m25_012",
        "m26_007",
        "m27_008",
        "m28_007"
      })[L3_17] .. L4_18[L5_19], 1, "", L6_20)
    elseif A1_15 == L6_20 then
      if L6_20 then
        _begin_combat = false
      end
      if L6_20 ~= false then
      elseif L6_20 == false then
        L6_20()
        L6_20(A0_14)
      end
    end
  end
end
function bandmanAction(A0_21, A1_22)
  if A1_22 == CALLBACK_REASON.CAUTION_OVERFLOW or _processingPcReset == false then
    CautionLevel.allTerminate()
    detectedByBandman(A0_21)
  end
end
function ep08GetLocatorPosRot(A0_23)
  local L1_24, L2_25, L3_26
  L1_24 = findGameObject2
  L2_25 = "Node"
  L3_26 = A0_23
  L1_24 = L1_24(L2_25, L3_26)
  L3_26 = L1_24
  L2_25 = L1_24.getWorldTransform
  L3_26 = L2_25(L3_26)
  return L2_25, L3_26
end
function createGem(A0_27, A1_28)
  local L2_29, L3_30, L4_31
  L3_30 = A0_27
  L2_29 = A0_27.getName
  L2_29 = L2_29(L3_30)
  L3_30 = createGameObject2
  L4_31 = "Gem"
  L3_30 = L3_30(L4_31)
  L4_31 = L3_30.setGemModelNo
  L4_31(L3_30, A1_28)
  L4_31 = A0_27.getWorldPos
  L4_31 = L4_31(A0_27)
  L4_31 = L4_31 + Vector(0, 0, 0)
  L3_30:setWorldPos(L4_31)
  L3_30:setForceMove()
  L3_30:setVisible(true)
  L3_30:try_init()
  L3_30:setVisibleBlockHalfSize(3000)
  L3_30:waitForReadyAsync(function()
    L3_30:try_start()
  end)
  return L3_30
end
function isInEyeSight(A0_32, A1_33, A2_34, A3_35)
  local L4_36, L5_37, L6_38, L7_39
  if A1_33 == nil then
    A1_33 = 40
  end
  if A3_35 == nil then
    A3_35 = true
  end
  if A2_34 == nil then
    A2_34 = 0.6
  end
  L4_36 = false
  L5_37 = Fn_isInSightTarget
  L6_38 = A0_32
  L7_39 = A2_34
  L5_37 = L5_37(L6_38, L7_39)
  if L5_37 == true then
    if A3_35 == true then
      L5_37 = Fn_getPcPosRot
      L6_38 = L5_37()
      L7_39 = L5_37.y
      L7_39 = L7_39 + 1.5
      L5_37.y = L7_39
      L7_39 = Query
      L7_39 = L7_39.setEyeSightTransform
      L7_39(L7_39, L5_37, L6_38)
      L7_39 = Query
      L7_39 = L7_39.setEyeSightAngle
      L7_39(L7_39, Deg2Rad(360))
      L7_39 = Query
      L7_39 = L7_39.setEyeSightRange
      L7_39(L7_39, A1_33)
      L7_39 = A0_32.getWorldPos
      L7_39 = L7_39(A0_32)
      if Query:checkEyeSightSphere(L7_39, 0.1) == true and Query:raycastEyeSight(L7_39) == nil then
        L4_36 = true
      end
    else
      L4_36 = true
    end
  end
  return L4_36
end
function getNodePos(A0_40)
  return findGameObject2("Node", A0_40):getWorldPos()
end
function getNodePos(A0_41)
  return findGameObject2("Node", A0_41):getWorldPos()
end
function getNpcPos(A0_42)
  return Fn_findNpcPuppet(A0_42):getWorldPos()
end
function waitGetPos(A0_43, A1_44)
  pos = getNodePos(A0_43)
  while not isWithinRange(pos, A1_44) do
    wait()
  end
end
function isWithinRange(A0_45, A1_46)
  local L2_47
  L2_47 = Fn_getPcPosRot
  L2_47 = L2_47()
  if A1_46 > Fn_get_distance(A0_45, L2_47) then
    return true
  else
    return false
  end
end
function isWithinRangeOfNPC(A0_48, A1_49)
  return isWithinRange(getNpcPos(A0_48), A1_49)
end
function isWithinRangeOfNode(A0_50, A1_51)
  return isWithinRange(getNodePos(A0_50), A1_51)
end
function isNpcMotionEnd(A0_52)
  return Fn_findNpc(A0_52):isMotionEnd()
end
function isNpcMoveEnd(A0_53)
  return Fn_findNpc(A0_53):isMoveEnd()
end
function isNpcTurnEnd(A0_54)
  return Fn_findNpc(A0_54):isTurnEnd()
end
function waitNpcTurnEnd(A0_55)
  while not isNpcTurnEnd(A0_55) do
    print(A0_55 .. "\227\129\174Turn\229\190\133\227\129\161")
    wait()
  end
end
function turnNpc(A0_56, A1_57, A2_58)
  Fn_findNpc(A0_56):turn(A1_57, A2_58)
end
function waitNpcMotionEnd(A0_59)
  while not isNpcMotionEnd(A0_59) do
    wait()
  end
end
function waitNpcMoveEnd(A0_60)
  while not isNpcMoveEnd(A0_60) do
    wait()
  end
end
function turnNPCifMoveEnd(A0_61)
  if isNpcMoveEnd(A0_61) then
    Fn_turnNpc(A0_61)
    return true
  else
    return false
  end
end
typedef_multiNaviClass = {}
function typedef_multiNaviClass.new(A0_62, A1_63, A2_64)
  local L3_65
  L3_65 = {}
  L3_65.naviDistance = 20
  L3_65.pos = Vector(0, 0, 0)
  if A1_63 == nil or A2_64 == nil then
    L3_65.obj = HUD:mnaviNew({name = A0_62})
  else
    L3_65.obj = HUD:mnaviNew({
      name = A0_62,
      PochFadeLen0 = A1_63,
      PochFadeLen100 = A2_64
    })
  end
  function L3_65.setActive(A0_66)
    L3_65.obj:setActive(A0_66)
  end
  function L3_65.getActive()
    return L3_65.obj:getActive()
  end
  function L3_65.kill()
    L3_65.obj:del(false)
  end
  function L3_65.setPos(A0_67)
    L3_65.pos = A0_67
    L3_65.obj:setTrgPos(A0_67)
  end
  function L3_65.setNaviDistance(A0_68)
    local L1_69
    L3_65.naviDistance = A0_68
  end
  function L3_65.checkSearch()
    local L0_70
    L0_70 = false
    if L3_65.naviDistance > Fn_getDistanceToPlayer(L3_65.pos) then
      L0_70 = true
    end
    return L0_70
  end
  return L3_65
end
