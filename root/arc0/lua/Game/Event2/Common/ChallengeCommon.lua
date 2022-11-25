import("Replay")
import("Area")
__ghost_puppet = {}
__list_order = true
__record_run = false
__record_task = nil
__timer_run = false
__timer_task = nil
__finish = false
__delay_task = nil
__sort_task = nil
__gameover_task = nil
__is_gameover = false
__cm_cat_warp_run = false
__cm_cat_warp_task = nil
__cm_cat_warp_inrange = 0
__score_type = "time"
__cm02_sort = false
__cm02_cp_max = 0
function raceOutrangeOnEnter()
  local L1_0
  L1_0 = __cm_cat_warp_inrange
  L1_0 = L1_0 + 1
  __cm_cat_warp_inrange = L1_0
end
function raceOutrangeOnLeave()
  local L0_1, L1_2
  L0_1 = __cm_cat_warp_inrange
  L0_1 = L0_1 - 1
  __cm_cat_warp_inrange = L0_1
  L0_1 = __cm_cat_warp_inrange
  if L0_1 <= 0 then
    __cm_cat_warp_run = true
  end
end
function resetOutrange()
  local L0_3, L1_4
  __cm_cat_warp_run = false
  __cm_cat_warp_inrange = 1
end
function restartOutrange()
  local L1_5
  L1_5 = __cm_cat_warp_inrange
  L1_5 = L1_5 - 1
  __cm_cat_warp_inrange = L1_5
end
function challengeCatWarpAbout()
  if __cm_cat_warp_task and __cm_cat_warp_task:isRunning() then
    __cm_cat_warp_task:abort()
    __cm_cat_warp_task = nil
  end
  resetOutrange()
end
function challengeCatWarp(A0_6)
  if A0_6 == false then
    return
  end
  __cm_cat_warp_task = invokeTask(function()
    while true do
      if __cm_cat_warp_run then
        HUD:setUserControlLock(true)
        HUD:courseOutStart()
        Fn_catWarp()
        __cm_cat_warp_run = false
      end
      wait()
    end
  end)
end
function challengeEndFunc()
  __list_order = false
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
  challengeCatWarpAbout()
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  HUD:delMenuMissionCallback()
  Fn_userCtrlAllOff()
  if __delay_task then
    __delay_task:abort()
    __delay_task = nil
  end
  invokeTask(function()
    Fn_blackout()
    GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
    Fn_recordAbout()
    Fn_timerAbout()
    Fn_counterViewEnd()
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
      repeat
        wait()
      until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
      Fn_userCtrlAllOff()
      Fn_blackout()
    end
    for _FORV_3_, _FORV_4_ in pairs(__ghost_puppet) do
      _FORV_4_.marker:setActive(false)
    end
    GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, true)
    Fn_setNextMissionFlag(event_name)
    Fn_nextMission()
    Fn_exitSandbox()
  end)
end
function challengeRetireFunc()
  __list_order = false
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
  challengeCatWarpAbout()
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  HUD:delMenuMissionCallback()
  Fn_userCtrlAllOff()
  if __delay_task then
    __delay_task:abort()
    __delay_task = nil
  end
  invokeTask(function()
    Player:setStay(true)
    Fn_blackout()
    GameDatabase:set(ggd.GlobalSystemFlags__GameRetire, true)
    GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
    HUD:countDownEnd()
    HUD:captionEnd()
    HUD:missionEnd()
    Fn_recordAbout()
    Fn_timerAbout()
    Fn_counterViewEnd()
    _resetSoundParam()
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
      repeat
        wait()
      until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
      Fn_userCtrlAllOff()
      Fn_blackout()
    end
    for _FORV_3_, _FORV_4_ in pairs(__ghost_puppet) do
      _FORV_4_.marker:setActive(false)
    end
    Fn_resetPcPos("locator2_pc_restart_pos")
    wait()
    GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, true)
    _requestRetireMission()
    Fn_exitSandbox()
  end)
end
function challengeRetryFunc(A0_7)
  __list_order = false
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
  challengeCatWarpAbout()
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  HUD:delMenuMissionCallback()
  Fn_userCtrlAllOff()
  if __delay_task then
    __delay_task:abort()
    __delay_task = nil
  end
  invokeTask(function()
    Player:setStay(true)
    Fn_blackout()
    HUD:countDownEnd()
    HUD:captionEnd()
    HUD:missionEnd()
    Fn_recordAbout()
    Fn_timerAbout()
    Fn_counterViewEnd()
    _resetSoundParam()
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
      repeat
        wait()
      until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
      Fn_userCtrlAllOff()
      Fn_blackout()
    end
    GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, true)
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life), true)
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
    Player:setEnergy(Player.kEnergy_SpAttack, 0, true)
    Player:setEnergy(Player.kEnergy_Feline, 0, true)
    for _FORV_3_, _FORV_4_ in pairs(__ghost_puppet) do
      _FORV_4_.marker:setActive(false)
    end
    if A0_7 then
      Fn_setNextMissionFlag(event_name .. "_header")
    end
    Fn_nextMission()
    Fn_exitSandbox()
  end)
end
function challengeScoreDisp(A0_8, A1_9)
  invokeTask(function()
    while true do
      for _FORV_3_, _FORV_4_ in ipairs(A0_8) do
        setDebugDispMissionText("[ " .. (_FORV_4_.onlineId ~= nil and _FORV_4_.onlineId or "player") .. " ]")
        setDebugDispMissionText("goal  : " .. tostring(_FORV_4_.isGoal))
        setDebugDispMissionText("score : " .. tostring(_FORV_4_[1].skey1))
      end
      wait()
    end
  end)
  invokeTask(function()
    HUD:setListOrderSortType(HUD.kSortDir_Descend, HUD.kSortDir_Ascend, HUD.kSortDir_Ascend)
    while __list_order do
      if 0 >= 30 then
        for _FORV_5_, _FORV_6_ in ipairs(A1_9) do
          if _FORV_6_.brain == nil then
            A0_8[_FORV_5_][1].skey1 = HUD:counter999GetNum()
          elseif 1 <= #_FORV_6_.score then
            A0_8[_FORV_5_][1].skey1 = _FORV_6_.score[1]
          else
            A0_8[_FORV_5_][1].skey1 = _FORV_6_.score[#_FORV_6_.score]
            A0_8[_FORV_5_].isGoal = true
          end
        end
      end
      HUD:setListOrder(A0_8)
      wait()
    end
    if __finish then
      for _FORV_5_, _FORV_6_ in ipairs(A0_8) do
        _FORV_6_.isGoal = true
        if _FORV_5_ == 1 then
          _FORV_6_[1].skey1 = HUD:counter999GetNum()
        else
          _FORV_6_[1].skey1 = A1_9[_FORV_5_].score[#A1_9[_FORV_5_].score]
        end
      end
      HUD:setListOrder(A0_8)
    else
      HUD:setListOrder()
    end
  end)
end
function challengeTimeDisp(A0_10, A1_11)
  invokeTask(function()
    while true do
      for _FORV_3_, _FORV_4_ in ipairs(A0_10) do
        setDebugDispMissionText("[ " .. (_FORV_4_.onlineId ~= nil and _FORV_4_.onlineId or "player") .. " ]")
        setDebugDispMissionText("goal : " .. tostring(_FORV_4_.isGoal))
        setDebugDispMissionText("cp   : " .. tostring(_FORV_4_[1].skey1))
        if type(_FORV_4_[1].skey2) == "table" then
          setDebugDispMissionText("time : " .. tostring(_FORV_4_[1].skey2[1]) .. ":" .. tostring(_FORV_4_[1].skey2[2]) .. ":" .. tostring(_FORV_4_[1].skey2[3]) .. ":" .. tostring(_FORV_4_[1].skey2[4]))
        else
          setDebugDispMissionText("time : " .. tostring(_FORV_4_[1].skey2))
        end
        setDebugDispMissionText("dist : " .. tostring(_FORV_4_[1].skey3))
      end
      wait()
    end
  end)
  invokeTask(function()
    local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21
    L4_16 = HUD
    L4_16 = L4_16.kSortDir_Ascend
    L0_12(L1_13, L2_14, L3_15, L4_16)
    while true do
      if L0_12 then
        for L4_16, L5_17 in L1_13(L2_14) do
          L6_18 = L5_17.brain
          if L6_18 == nil then
            L6_18 = A0_10[L4_16]
            L6_18 = L6_18[1]
            L7_19 = HUD
            L8_20 = L7_19
            L7_19 = L7_19.counter99_99GetNum
            L7_19 = L7_19(L8_20)
            L6_18.skey1 = L7_19
          else
            L6_18 = L5_17.cp
            L7_19 = L5_17.second
            L7_19 = L7_19[L6_18]
            if L0_12 >= L7_19 then
              L8_20 = L5_17.c_point
              if L8_20 then
                L8_20 = L5_17.c_point
                L9_21 = L5_17.cp
                L8_20 = L8_20[L9_21]
                if L8_20 then
                  L8_20 = A0_10[L4_16]
                  L8_20 = L8_20[1]
                  L9_21 = L5_17.c_point
                  L9_21 = L9_21[L5_17.cp]
                  L8_20.skey1 = L9_21
                end
              else
                L8_20 = A0_10[L4_16]
                L8_20 = L8_20[1]
                L9_21 = L5_17.cp
                L8_20.skey1 = L9_21
              end
              L8_20 = L5_17.cp
              L8_20 = L8_20 + 1
              L5_17.cp = L8_20
              L8_20 = L5_17.second
              L9_21 = L5_17.cp
              L8_20 = L8_20[L9_21]
              if L8_20 == nil then
                L5_17.isGoal = true
                L8_20 = L5_17.cp
                L8_20 = L8_20 - 1
                L5_17.cp = L8_20
              end
            end
          end
        end
        if L1_13 == false then
          if L1_13 then
            for L4_16, L5_17 in L1_13(L2_14) do
              L6_18 = __cp_table
              L7_19 = L5_17[1]
              L7_19 = L7_19.skey1
              L7_19 = L7_19 + 1
              L6_18 = L6_18[L7_19]
              L7_19 = HUD
              L8_20 = L7_19
              L7_19 = L7_19.timerGetAsTime
              L7_19 = L7_19(L8_20)
              if L6_18 then
                L8_20 = L6_18.handle
                L9_21 = L8_20
                L8_20 = L8_20.getWorldPos
                L8_20 = L8_20(L9_21)
                L9_21 = A1_11[L4_16]
                L9_21 = L9_21.puppet
                L9_21 = L9_21.getWorldPos
                L9_21 = L9_21(L9_21)
                L5_17[1].skey2 = L7_19
                L5_17[1].skey3 = L8_20:DistanceTo(L9_21)
              else
                L5_17.isGoal = true
                if L4_16 == 1 then
                else
                  L8_20 = A1_11[L4_16]
                  L8_20 = L8_20.time
                  L9_21 = L5_17[1]
                  L9_21.skey2 = L8_20[#L8_20]
                  L9_21 = L5_17[1]
                  L9_21.skey3 = 0
                end
              end
            end
          end
        else
          for L4_16, L5_17 in L1_13(L2_14) do
            L6_18 = __cm02_cp_max
            L7_19 = L5_17[1]
            L7_19 = L7_19.skey1
            if L6_18 > L7_19 then
              L6_18 = L5_17.isGoal
              if L6_18 == false then
                L6_18 = HUD
                L7_19 = L6_18
                L6_18 = L6_18.timerGetAsTime
                L6_18 = L6_18(L7_19)
                L7_19 = L5_17[1]
                L7_19.skey2 = L6_18
                L7_19 = L5_17[1]
                L7_19.skey3 = 0
              end
            else
              L5_17.isGoal = true
              if L4_16 == 1 then
              else
                L6_18 = A1_11[L4_16]
                L6_18 = L6_18.time
                L7_19 = L5_17[1]
                L8_20 = #L6_18
                L8_20 = L6_18[L8_20]
                L7_19.skey2 = L8_20
                L7_19 = L5_17[1]
                L7_19.skey3 = 0
              end
            end
          end
        end
        L1_13(L2_14, L3_15)
        L1_13()
      end
    end
    if L0_12 then
      for L3_15, L4_16 in L0_12(L1_13) do
        L4_16.isGoal = true
        L5_17 = L4_16[1]
        L6_18 = HUD
        L7_19 = L6_18
        L6_18 = L6_18.counter99_99GetNum
        L6_18 = L6_18(L7_19)
        L5_17.skey1 = L6_18
        if L3_15 == 1 then
          L5_17 = L4_16[1]
          L6_18 = HUD
          L7_19 = L6_18
          L6_18 = L6_18.timerGetAsTime
          L6_18 = L6_18(L7_19)
          L5_17.skey2 = L6_18
          L5_17 = L4_16[1]
          L5_17.skey3 = 0
        else
          L5_17 = A1_11[L3_15]
          L5_17 = L5_17.time
          L6_18 = L4_16[1]
          L7_19 = #L5_17
          L7_19 = L5_17[L7_19]
          L6_18.skey2 = L7_19
          L6_18 = L4_16[1]
          L6_18.skey3 = 0
        end
      end
      L0_12(L1_13, L2_14)
    else
      L0_12(L1_13)
    end
  end)
end
function createGhost(A0_22, A1_23, A2_24, A3_25)
  local L4_26
  L4_26 = {}
  L4_26.id = A0_22
  L4_26.obj = nil
  L4_26.marker = nil
  L4_26.puppet = nil
  L4_26.brain = nil
  L4_26.pos = A3_25
  L4_26.obj = createGameObject2("GhostPuppet")
  L4_26.obj:setName(A0_22)
  L4_26.obj:setAssetName(A1_23)
  L4_26.obj:setCopyFile(A2_24)
  L4_26.obj:setGhostType(GhostPuppet.kGhostType_ReplayOnly)
  L4_26.obj:setEnableGleam(true)
  L4_26.obj:setOffsetVec(-1, A3_25)
  return L4_26
end
function Fn_setOptions()
  HUD:setMenuMissionCallback("challengeRetireFunc", "challengeRetryFunc")
  GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Challenge)
  GameDatabase:set(ggd.Menu__IsActiveCallback, true)
end
function Fn_delOptions()
  GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  HUD:delMenuMissionCallback()
end
function Fn_resultOpen()
  HUD:missionResultOpen(event_name)
  wait()
  Replay:recFileClean()
  if HUD:missionResultSelected() == HUD.kHUDMissionResult_Retry then
    challengeRetryFunc(true)
  elseif HUD:missionResultSelected() == HUD.kHUDMissionResult_End then
    challengeEndFunc()
  elseif HUD:missionResultSelected() == HUD.kHUDMissionResult_Ghost then
    challengeRetryFunc(true)
  end
end
function Fn_createGhost()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32
  L0_27 = HUD
  L0_27 = L0_27.getChallengeGhost
  L0_27 = L0_27(L1_28)
  if L1_28 >= 1 then
    for L4_31 = 1, #L0_27 do
      L5_32 = print
      L5_32("getChallengeGhost OnlineID : " .. L0_27[L4_31].OnlineID)
      L5_32 = Vector
      L5_32 = L5_32(1, 0, 0)
      if L4_31 == 2 then
        L5_32 = Vector(2, 0, 0)
      elseif L4_31 == 3 then
        L5_32 = Vector(-1, 0, 0)
      end
      __ghost_puppet[L4_31] = createGhost(L0_27[L4_31].OnlineID, "ghost0" .. L4_31, L0_27[L4_31].ghost, L5_32)
    end
    L1_28()
    L1_28()
    for L4_31, L5_32 in L1_28(L2_29) do
      L5_32.marker = HUD:createGhostMarker({
        id = L5_32.id,
        obj = L5_32.obj,
        joint = "bn_root",
        color = HUD.kGhostColor_Blue + L4_31 - 1,
        detail = true
      })
      L5_32.marker:setActive(false)
      L5_32.puppet = L5_32.obj:getPuppet()
      L5_32.brain = L5_32.puppet:getBrain()
    end
    L1_28()
  end
  if L1_28 > 0 then
  else
  end
  return L1_28
end
function Fn_playGhost()
  local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47, L15_48, L16_49, L17_50
  for L3_36, L4_37 in L0_33(L1_34) do
    L5_38 = L4_37.obj
    L6_39 = L5_38
    L5_38 = L5_38.play
    L5_38(L6_39)
    L5_38 = L4_37.obj
    L6_39 = L5_38
    L5_38 = L5_38.setOffsetVec
    L7_40 = 5
    L8_41 = L4_37.pos
    L5_38(L6_39, L7_40, L8_41)
    L5_38 = L4_37.marker
    if L5_38 then
      L5_38 = L4_37.marker
      L6_39 = L5_38
      L5_38 = L5_38.setActive
      L7_40 = true
      L5_38(L6_39, L7_40)
    end
  end
  if L0_33 > 0 then
    L1_34.isGoal = false
    L2_35.skey1 = 0
    L2_35.skey2 = 0
    L2_35.skey3 = 0
    L2_35.puppet = L3_36
    L2_35.brain = nil
    for L5_38, L6_39 in L2_35(L3_36) do
      L7_40 = L5_38 + 1
      L8_41 = {L9_42}
      L9_42 = L6_39.id
      L8_41.onlineId = L9_42
      L8_41.isGoal = false
      L9_42 = {}
      L9_42.skey1 = 0
      L9_42.skey2 = 0
      L9_42.skey3 = 0
      L0_33[L7_40] = L8_41
      L8_41 = {}
      L9_42 = L6_39.puppet
      L8_41.puppet = L9_42
      L9_42 = L6_39.brain
      L8_41.brain = L9_42
      L8_41.score = nil
      L8_41.time = nil
      L8_41.second = nil
      L8_41.cp = 1
      L8_41.c_point = nil
      L1_34[L7_40] = L8_41
      L8_41 = L1_34[L7_40]
      L8_41 = L8_41.brain
      if L8_41 then
        L8_41 = L1_34[L7_40]
        L9_42 = L1_34[L7_40]
        L9_42 = L9_42.brain
        L10_43 = L9_42
        L9_42 = L9_42.getArray
        L11_44 = "score"
        L9_42 = L9_42(L10_43, L11_44)
        L8_41.score = L9_42
        L8_41 = L1_34[L7_40]
        L9_42 = L1_34[L7_40]
        L9_42 = L9_42.brain
        L10_43 = L9_42
        L9_42 = L9_42.getArray
        L11_44 = "second"
        L9_42 = L9_42(L10_43, L11_44)
        L8_41.second = L9_42
        L8_41 = L1_34[L7_40]
        L9_42 = L1_34[L7_40]
        L9_42 = L9_42.brain
        L10_43 = L9_42
        L9_42 = L9_42.getArray
        L11_44 = "c_point"
        L9_42 = L9_42(L10_43, L11_44)
        L8_41.c_point = L9_42
        L8_41 = L1_34[L7_40]
        L8_41 = L8_41.brain
        L9_42 = L8_41
        L8_41 = L8_41.getArray
        L10_43 = "hour"
        L8_41 = L8_41(L9_42, L10_43)
        L9_42 = L1_34[L7_40]
        L9_42 = L9_42.brain
        L10_43 = L9_42
        L9_42 = L9_42.getArray
        L11_44 = "minute"
        L9_42 = L9_42(L10_43, L11_44)
        L10_43 = L1_34[L7_40]
        L10_43 = L10_43.brain
        L11_44 = L10_43
        L10_43 = L10_43.getArray
        L12_45 = "sec"
        L10_43 = L10_43(L11_44, L12_45)
        L11_44 = L1_34[L7_40]
        L11_44 = L11_44.brain
        L12_45 = L11_44
        L11_44 = L11_44.getArray
        L11_44 = L11_44(L12_45, L13_46)
        L12_45 = {}
        if L8_41 then
          for L16_49, L17_50 in L13_46(L14_47) do
            table.insert(L12_45, {
              L17_50,
              L9_42[L16_49],
              L10_43[L16_49],
              L11_44[L16_49]
            })
          end
        end
        L13_46.time = L12_45
      end
    end
    if L2_35 == "time" then
      L2_35(L3_36, L4_37)
    elseif L2_35 == "score" then
      L2_35(L3_36, L4_37)
    end
  end
end
function Fn_recordStandby()
  if not __record_task then
    __record_task = invokeTask(function()
      local L0_51, L1_52, L2_53, L3_54
      L0_51 = Replay
      L1_52 = L0_51
      L0_51 = L0_51.setFileName
      L2_53 = "replay_"
      L3_54 = event_name
      L2_53 = L2_53 .. L3_54
      L0_51(L1_52, L2_53)
      while true do
        L0_51 = __record_run
        if not L0_51 then
          L0_51 = wait
          L0_51()
        end
      end
      L0_51 = print
      L1_52 = "<< challenge common >> rec start"
      L0_51(L1_52)
      L0_51 = Replay
      L1_52 = L0_51
      L0_51 = L0_51.recStart
      L0_51(L1_52)
      L0_51 = __score_type
      if L0_51 == "time" then
        L0_51 = 0
        L1_52 = 0
        L2_53, L3_54 = nil, nil
        while not __finish do
          L0_51 = HUD:counter99_99GetNum()
          L2_53 = HUD:timerGetAsTime()
          L3_54 = HUD:timerGetSecond()
          if L0_51 ~= L1_52 then
            Replay:pushToArray("hour", L2_53[1])
            Replay:pushToArray("minute", L2_53[2])
            Replay:pushToArray("sec", L2_53[3])
            Replay:pushToArray("milli", L2_53[4])
            Replay:pushToArray("second", L3_54)
            Replay:pushToArray("c_point", L0_51)
            L1_52 = L0_51
            print("cp : " .. L0_51 .. " time : " .. L2_53[1] .. ":" .. L2_53[2] .. ":" .. L2_53[3] .. ":" .. L2_53[4] .. " second : " .. L3_54)
          end
          wait()
        end
        L0_51 = HUD:counter99_99GetNum()
        L2_53 = HUD:timerGetAsTime()
        L3_54 = HUD:timerGetSecond()
        Replay:pushToArray("hour", L2_53[1])
        Replay:pushToArray("minute", L2_53[2])
        Replay:pushToArray("sec", L2_53[3])
        Replay:pushToArray("milli", L2_53[4])
        Replay:pushToArray("second", L3_54)
        Replay:pushToArray("c_point", L0_51)
        print("cp : " .. L0_51 .. " time : " .. L2_53[1] .. ":" .. L2_53[2] .. ":" .. L2_53[3] .. ":" .. L2_53[4] .. " second : " .. L3_54)
      else
        L0_51 = nil
        L1_52 = 0
        L2_53 = 1199
        L3_54 = 1
        while not __finish do
          if L1_52 >= 30 then
            L0_51 = HUD:counter999GetNum()
            if L2_53 >= L3_54 then
              Replay:pushToArray("score", L0_51)
              L3_54 = L3_54 + 1
            end
            old_score = L0_51
            print("score : " .. L0_51)
            L1_52 = 0
          end
          wait()
          L1_52 = L1_52 + 1
        end
        Replay:pushToArray("score", L0_51)
      end
      L0_51 = wait
      L0_51()
      L0_51 = Replay
      L1_52 = L0_51
      L0_51 = L0_51.recEnd
      L0_51(L1_52)
      L0_51 = Replay
      L1_52 = L0_51
      L0_51 = L0_51.recFileSave
      L0_51(L1_52)
      L0_51 = print
      L1_52 = "<< challenge common >> rec end"
      L0_51(L1_52)
    end)
  end
end
function Fn_recordStart()
  local L0_55, L1_56
  __record_run = true
end
function Fn_recordAbout()
  if __record_task and __record_task:isRunning() then
    __record_task:abort()
  end
  if __record_task then
    repeat
      wait()
    until not __record_task:isRunning()
  end
  Replay:recEnd()
  Replay:recFileClean()
  __record_task = nil
  __record_run = false
end
function Fn_timerStandby()
  if not __timer_task then
    __timer_task = invokeTask(function()
      while not __timer_run do
        wait()
      end
      HUD:timerStart()
      while true do
        if __finish then
          HUD:timerStop()
          break
        end
        wait()
      end
    end)
  end
end
function Fn_timerStart()
  local L0_57, L1_58
  __timer_run = true
end
function Fn_timerAbout()
  if __timer_task and __timer_task:isRunning() then
    HUD:timerStop()
    __timer_task:abort()
  end
  repeat
    wait()
  until __timer_task == nil or not __timer_task:isRunning()
  __timer_task = nil
  __timer_run = false
end
function Fn_counterInit(A0_59)
  local L1_60, L2_61, L3_62, L4_63
  L1_60, L2_61, L3_62 = nil, nil, nil
  L4_63 = HUD
  L4_63 = L4_63.kCount99_99IconType_Checkbox
  L1_60 = "ui_hud_counter_timer_01"
  L2_61 = {
    0,
    59,
    59,
    99
  }
  L3_62 = {
    0,
    0,
    0,
    0
  }
  if A0_59 and A0_59.timer then
    L1_60 = A0_59.timer.text or L1_60
    L2_61 = A0_59.timer.max or L2_61
    L3_62 = A0_59.timer.start or L3_62
  end
  HUD:timerSetTextID(L1_60)
  HUD:timerSetMax(L2_61)
  HUD:timerSetSecond(L3_62)
  L1_60 = "ui_hud_counter_score_01"
  L4_63 = HUD.kCount999IconType_Stone
  L3_62 = 0
  if A0_59 and A0_59.score then
    L1_60 = A0_59.score.text or L1_60
    L3_62 = A0_59.score.start or L3_62
  end
  HUD:counter999SetIcon(L4_63)
  HUD:counter999SetTextID(L1_60)
  HUD:counter999SetNum(L3_62)
  L1_60 = "ui_hud_counter_slash_01"
  L2_61 = 1
  L3_62 = 0
  L4_63 = HUD.kCount99_99IconType_Stone
  if A0_59 and A0_59.counter then
    L1_60 = A0_59.counter.text or L1_60
    L2_61 = A0_59.counter.max or L2_61
    L3_62 = A0_59.counter.start or L3_62
    L4_63 = A0_59.counter.icon or L4_63
  end
  HUD:counter99_99SetIcon(L4_63)
  HUD:counter99_99SetTextID(L1_60)
  HUD:counter99_99SetMax(L2_61)
  HUD:counter99_99SetNum(L3_62)
end
function Fn_counterView(A0_64)
  if A0_64 then
    HUD:timerSetVisible(A0_64.timer or false)
    HUD:counter999SetVisible(A0_64.score or false)
    HUD:counter99_99SetVisible(A0_64.counter or false)
  end
end
function Fn_counterViewDelay(A0_65)
  if not __delay_task then
    __delay_task = invokeTask(function()
      waitSeconds(3)
      Fn_counterView(A0_65)
    end)
  end
end
function Fn_counterViewEnd()
  HUD:timerSetVisible(false, false)
  HUD:counter999SetVisible(false, false, 0)
  HUD:counter999SetVisible(false, false, 1)
  HUD:counter99_99SetVisible(false, false)
  HUD:miniGaugeSetVisible(false, false)
  HUD:cameraCommonCounter99_99SetVisible(false, false)
end
function Fn_challengeInitialize(A0_66)
  if Player:isFeline() then
    Player:setFeline(false, false)
  end
  GameDatabase:set(ggd.GlobalSystemFlags__GameOverEnable, false)
  if HUD:getMissionData(event_name) ~= nil then
    if HUD:getMissionData(event_name).score_type == "time" then
      __score_type = HUD:getMissionData(event_name).score_type
    elseif HUD:getMissionData(event_name).score_type == "score" then
      __score_type = HUD:getMissionData(event_name).score_type
    end
  end
  Fn_lockPlayerAbility({
    Player.kAbility_FelineStart,
    Player.kAbility_FelineEnd
  })
  Fn_userCtrlAllOff()
  Fn_counterInit(A0_66)
  Fn_recordStandby()
  Fn_timerStandby()
  Area:requestRestore()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, false)
  GameDatabase:set(ggd.Savedata__Option__ChallengeLevelLock, true)
end
function Fn_challengeStart(A0_67, A1_68, A2_69, A3_70)
  local L4_71
  L4_71 = Fn_setCatWarpCheckPoint
  L4_71("locator2_pc_start_pos")
  L4_71 = Fn_setOptions
  L4_71()
  L4_71 = Fn_createGhost
  L4_71()
  L4_71 = challengeCatWarp
  L4_71(A2_69)
  L4_71 = Fn_missionStart
  L4_71()
  if A3_70 then
    L4_71 = ggd
    L4_71 = L4_71["Savedata__Info__" .. event_name .. "__" .. event_name .. "_info_01"]
    if L4_71 and GameDatabase:get(L4_71) == 0 then
      HUD:info(A3_70, false)
    end
  end
  L4_71 = Fn_setBgmPoint
  L4_71("event", "challenge_pri", "cm_table")
  if A1_68 then
    L4_71 = invokeTask
    L4_71(A1_68)
  end
  L4_71 = Fn_counterViewDelay
  L4_71(A0_67)
  L4_71 = Fn_countDown
  L4_71()
  L4_71 = Fn_userCtrlOn
  L4_71()
  L4_71 = Player
  L4_71 = L4_71.setStay
  L4_71(L4_71, false)
  L4_71 = Fn_playGhost
  L4_71()
  L4_71 = Fn_recordStart
  L4_71()
  L4_71 = Fn_timerStart
  L4_71()
  L4_71 = Fn_setBgmPoint
  L4_71("event", "challenge_start", "cm_table")
  L4_71 = Area
  L4_71 = L4_71.setAnimMoveDriftEnable
  L4_71(L4_71, true, true, true)
  L4_71 = GameDatabase
  L4_71 = L4_71.set
  L4_71(L4_71, ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
  L4_71 = invokeTask
  L4_71 = L4_71(function()
    while true do
      if Player:getEnergy(Player.kEnergy_Life) <= 0 or Player:getDeathState() == Player.kDeath_Dead or GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
        __is_gameover = true
        Fn_challengeFinish()
        break
      end
      wait()
    end
  end)
  __gameover_task = L4_71
end
function Fn_challengeFinish()
  HUD:setUserControlLock(true)
  if __is_gameover == false then
    if __gameover_task and __gameover_task:isRunning() then
      __gameover_task:abort()
    end
    __gameover_task = nil
  end
  __finish = true
  __list_order = false
  Fn_setBgmPoint("event", "challenge_finish", "cm_table")
  Fn_getGameObject("enemyManager"):requestIdlingEnemy(true)
  if __is_gameover == false then
    Net:trophyUnlock(19)
  end
  Fn_userCtrlOff()
  if __is_gameover == false then
    Player:setStay(true)
  end
  if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
    repeat
      wait()
    until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
    Fn_userCtrlAllOff()
  end
  challengeCatWarpAbout()
  Fn_finish()
  waitSeconds(2)
  repeat
    wait()
  until not __record_task:isRunning()
  if __score_type == "time" then
    Analytics:missionStatus(Analytics.kMissionClear, HUD:timerGetAsTime())
  else
    Analytics:missionStatus(Analytics.kMissionClear, HUD:counter999GetNum())
  end
  Fn_delOptions()
  Fn_resultOpen()
  HUD:setListOrder()
  HUD:setUserControlLock(false)
end
function Fn_challengeFinalize()
  Fn_naviKill()
  Fn_recordAbout()
  Fn_setBgmPoint("event", "challenge_end", "cm_table")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_setCatWarp(true)
  Player:setStay(false)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Area:requestRestore()
  Player:dropGrabObject()
  GameDatabase:set(ggd.GlobalSystemFlags__GameOverEnable, true)
  GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, true)
  GameDatabase:set(ggd.Savedata__Option__ChallengeLevelLock, false)
  HUD:setUserControlLock(false)
end
function Fn_popupScore(A0_72, A1_73)
  local L2_74
  L2_74 = A0_72.isInstance
  L2_74 = L2_74(A0_72, "EnemyBrain")
  if L2_74 then
    L2_74 = A0_72.getGizmo
    L2_74 = L2_74(A0_72)
  else
    L2_74 = L2_74 or A0_72
  end
  HUD:counter999AddNum(A1_73)
  HUD:scorePop(A1_73, L2_74, "bn_root")
end
function Fn_calculateAddTime(A0_75, A1_76)
  local L2_77, L3_78, L4_79, L5_80
  L2_77 = A0_75[4]
  L3_78 = A1_76[4]
  L2_77 = L2_77 + L3_78
  L3_78 = A0_75[3]
  L4_79 = A1_76[3]
  L3_78 = L3_78 + L4_79
  L4_79 = A0_75[2]
  L5_80 = A1_76[2]
  L4_79 = L4_79 + L5_80
  L5_80 = A0_75[1]
  L5_80 = L5_80 + A1_76[1]
  if L2_77 >= 100 then
    L2_77 = L2_77 - 100
    L3_78 = L3_78 + 1
  end
  if L3_78 >= 60 then
    L3_78 = L3_78 - 60
    L4_79 = L4_79 + 1
  end
  if L4_79 >= 60 then
    L4_79 = L4_79 - 60
    L5_80 = L5_80 + 1
  end
  return {
    L5_80,
    L4_79,
    L3_78,
    L2_77
  }
end
function Fn_calculateSubTime(A0_81, A1_82)
  local L2_83, L3_84, L4_85, L5_86, L6_87
  L2_83 = 1
  L3_84 = A0_81[4]
  L4_85 = A1_82[4]
  L3_84 = L3_84 - L4_85
  L4_85 = A0_81[3]
  L5_86 = A1_82[3]
  L4_85 = L4_85 - L5_86
  L5_86 = A0_81[2]
  L6_87 = A1_82[2]
  L5_86 = L5_86 - L6_87
  L6_87 = A0_81[1]
  L6_87 = L6_87 - A1_82[1]
  if L3_84 < 0 then
    L3_84 = L3_84 + 100
    L4_85 = L4_85 - 1
  end
  if L4_85 < 0 then
    L4_85 = L4_85 + 60
    L5_86 = L5_86 - 1
  end
  if L5_86 < 0 then
    L5_86 = L5_86 + 60
    L6_87 = L6_87 - 1
  end
  if L6_87 < 0 then
    L2_83 = -1
    L6_87 = 0
    L5_86 = 0
    L4_85 = 0
    L3_84 = 0
  end
  return {
    L6_87,
    L5_86,
    L4_85,
    L3_84
  }, L2_83
end
function Fn_addTime(A0_88)
  local L1_89
  L1_89 = HUD
  L1_89 = L1_89.timerStop
  L1_89(L1_89)
  L1_89 = Fn_calculateAddTime
  L1_89 = L1_89(HUD:timerGetAsTime(), A0_88)
  HUD:timerSetSecond(L1_89)
  HUD:timerStart()
end
