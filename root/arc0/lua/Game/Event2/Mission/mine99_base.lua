dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
dofile("/Game/Misc/lithograph_controller.lua")
_show_mine_name = false
_evarea2_list = {}
_evb_hdl_list = {}
_entity_task = nil
_retry_task = nil
_checkpoint1_task = nil
_checkpoint2_task = nil
_gameover_task = nil
_forcing_gameover = false
_litho_ctrls = nil
_litho_hdl = nil
_litho_sensor = nil
_mission_text_table = nil
_param_mine99_base = {
  start_area_name = nil,
  goal_area_name = nil,
  litho_pos = nil,
  litho_cam = nil,
  litho_aim = nil,
  litho_pc_pos_01 = nil,
  litho_pc_pos_02 = nil,
  enmgen_tbl = {}
}
_extra_warp_point = nil
_cage_drop_sensor_use = true
_event_file_name = ""
_boss_battle_floor = false
_floor_num = 0
_retry_mine99_entity = false
function InitializeBody()
  local L0_0, L1_1
end
function IngameBody()
  local L0_2, L1_3
end
function FinalizeBody()
  local L0_4, L1_5
end
_gravityOre = nil
_addGravityOre = nil
_onBreak_callFuncName = nil
function Initialize()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L0_6 = invokeSystemTask
  L1_7 = debugDispMine
  L0_6(L1_7)
  L0_6 = Ugc
  L1_7 = L0_6
  L0_6 = L0_6.disableFriendDGUpdate
  L2_8 = true
  L0_6(L1_7, L2_8)
  L0_6 = bgManager
  L1_7 = L0_6
  L0_6 = L0_6.sendEvent
  L2_8 = "requestCraneShip"
  L3_9 = {}
  L4_10.set_cage_out_sensor = true
  L3_9.cage = L4_10
  L0_6(L1_7, L2_8, L3_9)
  L0_6 = string
  L0_6 = L0_6.format
  L1_7 = "mine99_%03d"
  L2_8 = _floor_num
  L0_6 = L0_6(L1_7, L2_8)
  mine_name = L0_6
  L0_6 = HUD
  L1_7 = L0_6
  L0_6 = L0_6.enemymarkerSetRange
  L2_8 = _ENEMYMARKER_RANGE
  L0_6(L1_7, L2_8)
  L0_6 = GameDatabase
  L1_7 = L0_6
  L0_6 = L0_6.set
  L2_8 = ggd
  L2_8 = L2_8.GlobalSystemFlags__GameOverEnable
  L3_9 = false
  L0_6(L1_7, L2_8, L3_9)
  L0_6 = GameDatabase
  L1_7 = L0_6
  L0_6 = L0_6.set
  L2_8 = ggd
  L2_8 = L2_8.Savedata__Menu__MenuUnlock__SaveLoadSave
  L3_9 = false
  L0_6(L1_7, L2_8, L3_9)
  L0_6 = GameDatabase
  L1_7 = L0_6
  L0_6 = L0_6.set
  L2_8 = ggd
  L2_8 = L2_8.GlobalSystemFlags__Mine99MissionMmanaging
  L3_9 = false
  L0_6(L1_7, L2_8, L3_9)
  L0_6 = _waitInfinityMineArea
  L0_6 = L0_6()
  L1_7 = _findUseEvarea2
  L2_8 = _event_file_name
  L3_9 = L0_6
  L1_7 = L1_7(L2_8, L3_9)
  _evarea2_list = L1_7
  L1_7 = _informationAnalysisOfEvarea2
  L2_8 = _evarea2_list
  L3_9 = _boss_battle_floor
  L1_7 = L1_7(L2_8, L3_9)
  L2_8 = _createEventDate
  L3_9 = _evarea2_list
  L2_8 = L2_8(L3_9)
  _evb_hdl_list = L2_8
  L2_8 = initializeAllGameObjects
  L2_8()
  L2_8 = waitForReadyAllGameObjects
  L2_8()
  if L1_7 then
    L2_8 = {}
    L3_9 = {}
    L7_13 = L1_7.goal
    L3_9 = L4_10[L5_11]
    L4_10(L5_11)
    if L4_10 > 1 then
      L4_10(L5_11)
      for L7_13, L8_14 in L4_10(L5_11) do
        if L8_14.name == L3_9.name then
          debugPrintMine(L8_14.name .. "\227\129\175\227\130\180\227\131\188\227\131\171\227\130\168\227\131\170\227\130\162\227\129\168\229\144\140\227\129\152\227\129\170\227\129\174\227\129\167\229\175\190\232\177\161\227\129\171\227\129\151\227\129\190\227\129\155\227\130\147")
        else
          debugPrintMine(L8_14.name .. "\227\129\175\227\130\180\227\131\188\227\131\171\227\130\168\227\131\170\227\130\162\227\129\168\233\129\149\227\129\134\227\129\174\227\129\167\229\175\190\232\177\161\227\129\171\227\129\151\227\129\190\227\129\153")
          table.insert(L2_8, L8_14)
        end
      end
      L7_13 = "\227\129\167\227\129\153\227\128\130"
      L4_10(L5_11)
      L2_8 = L2_8[L4_10]
    else
      if L4_10 == 0 then
        L4_10(L5_11)
      else
        L4_10(L5_11)
      end
      L2_8 = L4_10[1]
    end
    L4_10(L5_11)
    L4_10.start_area_name = L5_11
    L4_10.goal_area_name = L5_11
    L4_10.litho_pos = L5_11
    L4_10.litho_cam = L5_11
    L4_10.litho_aim = L5_11
    L4_10.litho_pc_pos_01 = L5_11
    L4_10.litho_pc_pos_02 = L5_11
    L4_10.enmgen_tbl = L5_11
    if L4_10 then
      L7_13 = L2_8.component
      L7_13 = L7_13.start
      L7_13 = L6_12
      L8_14 = L5_11.getTranslation
      L8_14 = L8_14(L5_11)
      L7_13 = L6_12(L7_13, L8_14, L5_11:getRotation())
      L8_14 = createGameObject2
      L8_14 = L8_14("Node")
      L8_14:setName("locator2_pc_start_pos")
      L4_10:appendChild(L8_14)
      L8_14:setTransform(L6_12, L7_13)
    end
    L5_11(L6_12)
    L7_13 = _floor_num
    L7_13 = L7_13 + 1
    L8_14 = L3_9.component
    L8_14 = L8_14.goal
    L5_11(L6_12, L7_13, L8_14, false)
    L7_13 = _param_mine99_base
    L7_13 = L7_13.litho_cam
    L8_14 = _param_mine99_base
    L8_14 = L8_14.litho_aim
    L7_13 = L5_11(L6_12, L7_13, L8_14, _param_mine99_base.litho_pc_pos_01, _param_mine99_base.litho_pc_pos_02, _floor_num, _cage_drop_sensor_use)
    _litho_sensor = L7_13
    _litho_hdl = L6_12
    _litho_ctrls = L5_11
    L5_11()
    L5_11()
    L7_13 = L3_9.component
    L7_13 = L7_13.cage
    if L5_11 then
      if L6_12 then
        L7_13 = L6_12
        if L6_12 then
          L6_12.name = nil
          L6_12.pos = nil
          L6_12.rot = nil
          L7_13 = g_own
          L8_14 = L7_13
          L7_13 = L7_13.getName
          L7_13 = L7_13(L8_14)
          L6_12.sb_name = L7_13
          L8_14 = L5_11
          L7_13 = L5_11.getTransform
          L8_14 = L7_13(L8_14)
          L6_12.name = L3_9.name
          L6_12.pos = L7_13
          L6_12.rot = L8_14
          bgManager:sendEvent("requestBgSet", {
            warpMine = copyTable(L6_12)
          })
          repeat
            wait()
          until bgManager:sendEvent("getBgSetInfomation", {isWarpFinish = true})
        end
      end
    end
  end
  L2_8 = InitializeBody
  L2_8()
  L2_8 = Fn_sendMineSetupCallBrokenGravityOre
  L3_9 = _onBreak_callFuncName
  L2_8(L3_9)
  L2_8 = Fn_sendBulkMineSetupRun
  L3_9 = mine_name
  L7_13 = findGameObject2
  L8_14 = "Node"
  L7_13 = L7_13(L8_14, _param_mine99_base.litho_pc_pos_01)
  if not L7_13 then
    L7_13 = findGameObject2
    L8_14 = "Node"
    L7_13 = L7_13(L8_14, _param_mine99_base.litho_pc_pos_02)
    if not L7_13 then
      L7_13 = findGameObject2
      L8_14 = "Node"
      L7_13 = L7_13(L8_14, "locator2_pc_start_pos")
    end
  end
  L6_12.node = L7_13
  L2_8(L3_9, L4_10, L5_11, L6_12)
  L2_8 = Fn_userCtrlAllOff
  L2_8()
end
function Ingame()
  local L0_15
  L0_15 = Fn_setCrewActive
  L0_15(false)
  L0_15 = GameDatabase
  L0_15 = L0_15.get
  L0_15 = L0_15(L0_15, ggd.Savedata__CreneShipFlags__PlayerLife)
  if L0_15 > 0 then
    Player:setEnergy(Player.kEnergy_Life, L0_15)
    debugPrintMine("\227\131\151\227\131\172\227\130\164\227\131\164\227\129\174\227\131\169\227\130\164\227\131\149\227\130\146\229\164\137\230\155\180\227\129\151\227\129\190\227\129\151\227\129\159 : " .. L0_15)
  end
  Fn_noticeEnterMineAnalytics(mine_name)
  if GameDatabase:get(ggd.Savedata__StatisticalChart__AttainMineLevel) < _floor_num then
    GameDatabase:set(ggd.Savedata__StatisticalChart__AttainMineLevel, _floor_num)
    GameDatabase:backup(ggd.Savedata__StatisticalChart)
  end
  repeat
    wait()
  until Fn_sendIsRunMine()
  Fn_setCatWarp(true)
  Fn_setMineGravityStorm()
  _entity_task = invokeTask(IngameBody)
  _checkpoint1_task = invokeTask(_setLithoCheckPoint01)
  _checkpoint2_task = invokeTask(_setLithoCheckPoint02)
  _retry_task = invokeTask(function()
    local L0_16, L1_17
    while true do
      if L0_16 then
        if L0_16 then
          if L0_16 then
            L0_16(L1_17)
          end
        end
        if L0_16 then
          if L0_16 then
            L0_16(L1_17)
          end
        end
        if L0_16 then
          if L0_16 then
            L0_16(L1_17)
          end
        end
        _checkpoint1_task = nil
        _checkpoint2_task = nil
        L0_16()
        if L0_16 then
          if L0_16 then
            L0_16(L1_17, "sendRequestRetryReset")
          end
        end
        for _FORV_3_, _FORV_4_ in L0_16(L1_17) do
          _FORV_4_:try_term()
        end
        _evb_hdl_list = L0_16
        if L0_16 then
          L0_16(L1_17)
          L0_16()
        end
        if L0_16 then
          L0_16(L1_17, true)
          L0_16()
          L0_16(L1_17)
          _litho_hdl = nil
        end
        if L0_16 then
          L0_16(L1_17)
          _litho_sensor = nil
        end
        _litho_ctrls = nil
        L0_16(L1_17)
        _evb_hdl_list = L0_16
        L0_16()
        L0_16()
        L0_16()
        _litho_sensor = L0_16(L1_17, _param_mine99_base.litho_cam, _param_mine99_base.litho_aim, _param_mine99_base.litho_pc_pos_01, _param_mine99_base.litho_pc_pos_02, _floor_num, false)
        _litho_hdl = L1_17
        _litho_ctrls = L0_16
        L0_16()
        L0_16(L1_17, _gravityOre, _addGravityOre, {
          node = findGameObject2("Node", _param_mine99_base.litho_pc_pos_01) or findGameObject2("Node", _param_mine99_base.litho_pc_pos_02) or findGameObject2("Node", "locator2_pc_start_pos")
        })
        L0_16()
        repeat
          L0_16()
        until L0_16
        L0_16()
        if L1_17 then
        end
        if L1_17 then
          Fn_resetPcPos(L1_17)
        end
        Player:setStay(false)
        Fn_setCatWarpCheckPoint(_param_mine99_base.litho_pc_pos_02)
        _entity_task = invokeTask(IngameBody)
        _checkpoint1_task = invokeTask(_setLithoCheckPoint01)
        _checkpoint2_task = invokeTask(_setLithoCheckPoint02)
        _retry_mine99_entity = false
      end
      L0_16()
    end
  end)
  _gameover_task = invokeTask(function()
    while true do
      if Player:getEnergy(Player.kEnergy_Life) <= 0 or _forcing_gameover then
        waitSeconds(3)
        Fn_blackout()
        Fn_recoverEnergyFully()
        GameDatabase:set(ggd.Savedata__CreneShipFlags__PlayerDead, true)
        Fn_setBgmPoint("event", "bgmstop", "mine99")
        nextGravityStorm(false)
      end
      wait()
    end
  end)
  Fn_noticeExitMineAnalytics(mine_name)
  Ugc:removeInstantDeathGhost()
  nextGravityStorm(Fn_waitGravityStormInOrCageMoveSkip() == 1 and true or false)
end
function nextGravityStorm(A0_18)
  local L1_19, L2_20
  L1_19 = _entity_task
  if L1_19 then
    L1_19 = _entity_task
    L2_20 = L1_19
    L1_19 = L1_19.isRunning
    L1_19 = L1_19(L2_20)
    if L1_19 then
      L1_19 = _entity_task
      L2_20 = L1_19
      L1_19 = L1_19.abort
      L1_19(L2_20)
    end
  end
  _entity_task = nil
  L1_19 = _retry_task
  if L1_19 then
    L1_19 = _retry_task
    L2_20 = L1_19
    L1_19 = L1_19.isRunning
    L1_19 = L1_19(L2_20)
    if L1_19 then
      L1_19 = _retry_task
      L2_20 = L1_19
      L1_19 = L1_19.abort
      L1_19(L2_20)
    end
  end
  _retry_task = nil
  L1_19 = _checkpoint1_task
  if L1_19 then
    L1_19 = _checkpoint1_task
    L2_20 = L1_19
    L1_19 = L1_19.isRunning
    L1_19 = L1_19(L2_20)
    if L1_19 then
      L1_19 = _checkpoint1_task
      L2_20 = L1_19
      L1_19 = L1_19.abort
      L1_19(L2_20)
    end
  end
  L1_19 = _checkpoint2_task
  if L1_19 then
    L1_19 = _checkpoint2_task
    L2_20 = L1_19
    L1_19 = L1_19.isRunning
    L1_19 = L1_19(L2_20)
    if L1_19 then
      L1_19 = _checkpoint2_task
      L2_20 = L1_19
      L1_19 = L1_19.abort
      L1_19(L2_20)
    end
  end
  _checkpoint1_task = nil
  _checkpoint2_task = nil
  L1_19 = bgManager
  if L1_19 then
    L1_19 = bgManager
    L2_20 = L1_19
    L1_19 = L1_19.isRunning
    L1_19 = L1_19(L2_20)
    if L1_19 then
      L1_19 = bgManager
      L2_20 = L1_19
      L1_19 = L1_19.sendEvent
      L1_19(L2_20, "requestBgSet", {newMine = "mine01"})
      repeat
        L1_19 = wait
        L1_19()
        L1_19 = bgManager
        L2_20 = L1_19
        L1_19 = L1_19.sendEvent
        L1_19 = L1_19(L2_20, "getBgSetInfomation", {isNewMine = true})
      until L1_19
    end
  end
  L1_19 = Fn_setEffectivenessMineArea
  L2_20 = false
  L1_19(L2_20)
  L1_19 = GameDatabase
  L2_20 = L1_19
  L1_19 = L1_19.get
  L1_19 = L1_19(L2_20, ggd.Savedata__CreneShipFlags__MineId)
  L2_20 = "mine"
  L2_20 = L2_20 .. string.format("%02d", L1_19) .. "_header"
  if A0_18 then
    Fn_setKeepPlayerPos()
  end
  Fn_setNextMissionFlag(L2_20)
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  FinalizeBody()
  Fn_missionInfoEnd()
  _evb_hdl_list = nil
  if _gameover_task and _gameover_task:isRunning() then
    _gameover_task:abort()
  end
  _gameover_task = nil
  if _entity_task and _entity_task:isRunning() then
    _entity_task:abort()
  end
  _entity_task = nil
  if _retry_task and _retry_task:isRunning() then
    _retry_task:abort()
  end
  _retry_task = nil
  if _checkpoint1_task and _checkpoint1_task:isRunning() then
    _checkpoint1_task:abort()
  end
  if _checkpoint2_task and _checkpoint2_task:isRunning() then
    _checkpoint2_task:abort()
  end
  if _litho_ctrls then
    _litho_ctrls:azSeUnload()
  end
  _litho_ctrls = nil
  GameDatabase:set(ggd.GlobalSystemFlags__Mine99MissionMmanaging, false)
end
function _createEventDate(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31
  L1_22 = {}
  L2_23 = {}
  for L6_27, L7_28 in L3_24(L4_25) do
    L8_29 = L7_28.evarea2_hdl
    if L8_29 then
      L8_29 = L7_28.evarea2_hdl
      L9_30 = L8_29
      L8_29 = L8_29.getName
      L8_29 = L8_29(L9_30)
      L9_30 = true
      for _FORV_13_, _FORV_14_ in L10_31(L2_23) do
        if _FORV_14_ == L8_29 then
          L9_30 = false
          break
        end
      end
      if L9_30 then
        table.insert(L1_22, L10_31)
        table.insert(L2_23, L8_29)
      end
    end
  end
  return L1_22
end
function _setLithoCheckPoint01()
  if _litho_ctrls then
    repeat
      wait()
    until _litho_ctrls:isLithographStart()
    Fn_setCatWarpCheckPoint(_param_mine99_base.litho_pc_pos_01)
  end
end
function _setLithoCheckPoint02()
  if _litho_ctrls then
    repeat
      wait()
    until _litho_ctrls:isSecondHalfProcessStart()
    Fn_setCatWarpCheckPoint(_param_mine99_base.litho_pc_pos_02)
  end
end
function _waitInfinityMineArea()
  local L0_32, L1_33
  L0_32 = Fn_getGameObject
  L1_33 = "bgManager"
  L0_32 = L0_32(L1_33)
  L1_33 = L0_32
  L0_32 = L0_32.sendEvent
  L0_32 = L0_32(L1_33, "getBgsetHandle")
  L1_33 = L0_32.sendEvent
  L1_33 = L1_33(L0_32, "getMineRootAreaConfigure")
  while not L1_33 do
    wait()
    L1_33 = L0_32:sendEvent("getMineRootAreaConfigure")
  end
  return L1_33
end
function getElectedAreaNames()
  local L0_34, L1_35, L2_36, L3_37, L4_38, L5_39, L6_40
  L0_34 = nil
  L1_35 = _waitInfinityMineArea
  L1_35 = L1_35()
  if L1_35 then
    L0_34 = L2_36
    for L5_39, L6_40 in L2_36(L3_37) do
      for _FORV_10_, _FORV_11_ in ipairs(L6_40) do
        table.insert(L0_34, _FORV_11_.area_name)
      end
    end
  end
  return L0_34
end
function _findEvarea2Child(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51, L11_52, L12_53, L13_54, L14_55
  L1_42 = {}
  L2_43 = A0_41.getChildCount
  L2_43 = L2_43(L3_44)
  for L6_47 = 1, L2_43 do
    L8_49 = A0_41
    L7_48 = A0_41.getChild
    L9_50 = L6_47
    L7_48 = L7_48(L8_49, L9_50)
    L9_50 = L7_48
    L8_49 = L7_48.getTypeName
    L8_49 = L8_49(L9_50)
    if L8_49 == "locator2" or L8_49 == "enmgen2" then
      L9_50 = table
      L9_50 = L9_50.insert
      L14_55 = L11_52(L12_53)
      L9_50(L10_51, L11_52, L12_53, L13_54, L14_55, L11_52(L12_53))
    end
    L9_50 = L7_48.getChildCount
    L9_50 = L9_50(L10_51)
    if L9_50 ~= 0 then
      L9_50 = _findEvarea2Child
      L9_50 = L9_50(L10_51)
      for L13_54, L14_55 in L10_51(L11_52) do
        table.insert(L1_42, L14_55)
      end
    end
  end
  return L1_42
end
function _findUseEvarea2(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66, L11_67, L12_68, L13_69
  L2_58 = loadFileAsset
  L3_59 = "evb"
  L4_60 = "evx/"
  L5_61 = A0_56
  L4_60 = L4_60 .. L5_61
  L2_58 = L2_58(L3_59, L4_60)
  if L2_58 == nil then
    L3_59 = nil
    return L3_59
  end
  L4_60 = L2_58
  L3_59 = L2_58.wait
  L3_59(L4_60)
  L4_60 = L2_58
  L3_59 = L2_58.getRoot
  L3_59 = L3_59(L4_60)
  if L3_59 == nil then
    L4_60 = nil
    return L4_60
  end
  L4_60 = debugPrintMine
  L5_61 = "evarea2\227\129\174\230\164\156\231\180\162\233\150\139\229\167\139 ==========================================="
  L4_60(L5_61)
  L4_60 = debugPrintMine
  L5_61 = "\230\164\156\231\180\162evb\229\144\141\239\188\154"
  L6_62 = A0_56
  L5_61 = L5_61 .. L6_62
  L4_60(L5_61)
  L4_60 = {}
  L5_61 = {}
  L7_63 = L3_59
  L6_62 = L3_59.findBundle
  L6_62 = L6_62(L7_63, L8_64)
  L7_63 = L6_62.getChildCount
  L7_63 = L7_63(L8_64)
  for L11_67 = 1, L7_63 do
    L13_69 = L6_62
    L12_68 = L6_62.getChild
    L12_68 = L12_68(L13_69, L11_67)
    L13_69 = L12_68.getName
    L13_69 = L13_69(L12_68)
    if string.find(L13_69, "evarea2") ~= nil then
      L5_61[L12_68:getString("areaname")] = L12_68
      if string.find(L13_69, "root") ~= nil then
        table.insert(L4_60, {
          area_name = L12_68:getString("areaname"),
          evarea2_hdl = L12_68
        })
      end
    end
  end
  function L6_62(A0_70, A1_71, A2_72)
    if A0_70:findBundle(A1_71) == nil then
      return nil
    end
    if A0_70:findBundle(A1_71):findBundle(A2_72) == nil then
      return nil
    end
    if A0_70:findBundle(A1_71):findBundle(A2_72):getChildCount() <= 0 then
      return nil
    end
    return (A0_70:findBundle(A1_71):findBundle(A2_72))
  end
  L7_63 = L3_59.findBundle
  L7_63 = L7_63(L8_64, L9_65)
  for L11_67, L12_68 in L8_64(L9_65) do
    L13_69 = {}
    L13_69.area_name = L12_68.area_name
    L13_69.evarea2_hdl = nil
    L13_69.child = nil
    if L6_62(L7_63, L12_68.locator_name, L12_68.evarea_name) then
      L13_69.evarea2_hdl = L6_62(L7_63, L12_68.locator_name, L12_68.evarea_name)
      debugPrintMine(L12_68.area_name .. " \227\129\175 evarea2__lottery_pattern \227\129\174 evarea2\227\130\146\230\142\161\231\148\168\227\129\151\227\129\190\227\129\153 ")
    else
      L13_69.evarea2_hdl = L5_61[L12_68.area_name]
      debugPrintMine(L12_68.area_name .. " \227\129\175 evarea2__instance_event \227\129\174 " .. (L13_69.evarea2_hdl ~= nil and L13_69.evarea2_hdl:getName() or "nil") .. " \227\129\167\227\129\153")
    end
    if L13_69.evarea2_hdl then
      L13_69.child = _findEvarea2Child(L13_69.evarea2_hdl)
    end
    table.insert(L4_60, L13_69)
  end
  for L11_67, L12_68 in L8_64(L9_65) do
    L13_69 = {}
    L13_69.area_name = L12_68.area_name
    L13_69.evarea2_hdl = nil
    L13_69.child = nil
    if L12_68.evarea_name then
      if L6_62(L7_63, L12_68.locator_name, L12_68.evarea_name) then
        L13_69.evarea2_hdl = L6_62(L7_63, L12_68.locator_name, L12_68.evarea_name)
        debugPrintMine(L12_68.area_name .. " \227\129\175 evarea2__lottery_pattern\227\129\174evarea2\227\130\146\230\142\161\231\148\168\227\129\151\227\129\190\227\129\153 ")
      else
        L13_69.evarea2_hdl = L5_61[L12_68.area_name]
        debugPrintMine(L12_68.area_name .. " \227\129\175 evarea2__instance_event \227\129\174 " .. (L13_69.evarea2_hdl ~= nil and L13_69.evarea2_hdl:getName() or "nil") .. " \227\129\167\227\129\153")
      end
    else
      L13_69.evarea2_hdl = L5_61[L12_68.area_name]
      debugPrintMine(L12_68.area_name .. " \227\129\175 evarea2__instance_event \227\129\174 " .. (L13_69.evarea2_hdl ~= nil and L13_69.evarea2_hdl:getName() or "nil") .. " \227\129\167\227\129\153")
    end
    if L13_69.evarea2_hdl then
      L13_69.child = _findEvarea2Child(L13_69.evarea2_hdl)
    end
    table.insert(L4_60, L13_69)
  end
  L6_62 = debugPrintMine
  L7_63 = "evarea2\227\129\174\230\164\156\231\180\162\231\181\130\228\186\134 ==========================================="
  L6_62(L7_63)
  return L4_60
end
function _informationAnalysisOfEvarea2(A0_73, A1_74)
  local L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86
  if A0_73 == nil then
    L2_75 = nil
    return L2_75
  end
  L2_75 = debugPrintMine
  L2_75(L3_76)
  L2_75 = {}
  L2_75.start = L3_76
  L2_75.goal = L3_76
  L2_75.enmgen = L3_76
  for L6_79, L7_80 in L3_76(L4_77) do
    L8_81 = L7_80.child
    if L8_81 then
      L8_81 = {}
      L8_81.start = nil
      L8_81.goal = nil
      L8_81.cage = nil
      L8_81.litho_cam = nil
      L8_81.litho_aim = nil
      L8_81.litho_pos = nil
      L8_81.litho_pc_pos_01 = nil
      L8_81.litho_pc_pos_02 = nil
      for L12_85, L13_86 in L9_82(L10_83) do
        if string.find(L13_86, "locator2_start_pos") then
          L8_81.start = L13_86
        elseif string.find(L13_86, "locator2_goal_pos") then
          L8_81.goal = L13_86
        elseif string.find(L13_86, "locator2_cage_pos") then
          L8_81.cage = L13_86
        elseif string.find(L13_86, "locator2_litho_cam") then
          L8_81.litho_cam = L13_86
        elseif string.find(L13_86, "locator2_litho_aim") then
          L8_81.litho_aim = L13_86
        elseif string.find(L13_86, "locator2_litho_pos") then
          L8_81.litho_pos = L13_86
        elseif string.find(L13_86, "locator2_litho_pc_pos_01") then
          L8_81.litho_pc_pos_01 = L13_86
          if L8_81.litho_pc_pos_02 == nil then
            L8_81.litho_pc_pos_02 = L13_86
          end
        elseif string.find(L13_86, "locator2_litho_pc_pos_02") then
          L8_81.litho_pc_pos_02 = L13_86
        elseif string.find(L13_86, "enmgen2") then
          if L2_75.enmgen[L7_80.area_name] == nil then
            L2_75.enmgen[L7_80.area_name] = {}
          end
          table.insert(L2_75.enmgen[L7_80.area_name], L13_86)
        end
      end
      if A1_74 then
        if L9_82 then
          L12_85 = L7_80.area_name
          L11_84.name = L12_85
          L11_84.component = L8_81
          L12_85 = L7_80.evarea2_hdl
          L11_84.evarea2_hdl = L12_85
          L9_82(L10_83, L11_84)
          L9_82(L10_83)
        end
        if L9_82 then
          if L9_82 then
            if L9_82 then
              L12_85 = L7_80.area_name
              L11_84.name = L12_85
              L11_84.component = L8_81
              L12_85 = L7_80.evarea2_hdl
              L11_84.evarea2_hdl = L12_85
              L9_82(L10_83, L11_84)
              L9_82(L10_83)
            end
          end
        end
      else
        if L9_82 then
          L12_85 = L7_80.area_name
          L11_84.name = L12_85
          L11_84.component = L8_81
          L12_85 = L7_80.evarea2_hdl
          L11_84.evarea2_hdl = L12_85
          L9_82(L10_83, L11_84)
          L9_82(L10_83)
        end
        if L9_82 then
          if L9_82 then
            if L9_82 then
              if L9_82 then
                if L9_82 then
                  if L9_82 then
                    L12_85 = L7_80.area_name
                    L11_84.name = L12_85
                    L11_84.component = L8_81
                    L12_85 = L7_80.evarea2_hdl
                    L11_84.evarea2_hdl = L12_85
                    L9_82(L10_83, L11_84)
                    L9_82(L10_83)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L3_76(L4_77)
  return L2_75
end
function _setupLithograph(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92, A6_93)
  local L7_94, L8_95, L9_96, L10_97, L11_98
  L7_94 = findGameObject2
  L8_95 = "Node"
  L9_96 = A0_87
  L7_94 = L7_94(L8_95, L9_96)
  if L7_94 == nil then
    L8_95 = debugPrintMine
    L9_96 = "\231\159\179\231\137\136\227\129\174\233\133\141\231\189\174\231\148\168\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L8_95(L9_96)
    L8_95 = nil
    return L8_95
  end
  L8_95 = findUpArea
  L9_96 = L7_94
  L8_95 = L8_95(L9_96)
  if L8_95 == nil then
    L9_96 = debugPrintMine
    L10_97 = "\231\159\179\231\137\136\227\129\174\233\133\141\231\189\174\231\148\168\227\131\142\227\131\188\227\131\137\227\129\174\232\166\170\227\129\174\227\130\168\227\131\170\227\130\162\227\129\140\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\128\130"
    L9_96(L10_97)
    L9_96 = nil
    return L9_96
  end
  L9_96 = createGameObject2
  L10_97 = "Lithograph"
  L9_96 = L9_96(L10_97)
  L11_98 = L9_96
  L10_97 = L9_96.setName
  L10_97(L11_98, "lithograph_01")
  L11_98 = L8_95
  L10_97 = L8_95.appendChild
  L10_97(L11_98, L9_96)
  L11_98 = L9_96
  L10_97 = L9_96.setTransform
  L10_97(L11_98, L7_94:getTransform())
  if A6_93 ~= false then
    L10_97 = createGameObject2
    L11_98 = "PlayerSensor"
    L10_97 = L10_97(L11_98)
    L11_98 = L10_97.setName
    L11_98(L10_97, "mine99_sensor")
    L11_98 = L10_97.setDetectBehavior
    L11_98(L10_97, 1)
    L11_98 = L10_97.addSphere
    L11_98(L10_97, 20)
    L11_98 = "Mine99SensorOnEnter"
    _G[L11_98] = function(A0_99)
      Fn_cageMove()
      A0_99:setActive(false)
    end
    L10_97:setOnEnter(L11_98)
    L8_95:appendChild(L10_97)
    L10_97:setTransform(L7_94:getTransform())
  end
  L10_97 = {}
  L11_98 = g_own
  L11_98 = L11_98.getName
  L11_98 = L11_98(L11_98)
  L10_97[L11_98] = {
    Fn_getMine99FloorClear(A5_92)
  }
  L11_98 = {
    {
      first_half = {
        warp = A3_90,
        cut1 = {cam = A1_88, aim = A2_89}
      },
      second_half = {
        warp = A4_91,
        cut1 = {cam = A1_88, aim = A2_89}
      },
      failure = {
        cut1 = {cam = A1_88, aim = A2_89}
      }
    }
  }
  if not _mission_text_table then
    _mission_text_table = {
      {
        text = string.format("ic_pi_monument_%05d", A5_92 * 10),
        se = string.format("skb_%03d", A5_92 % 3 + 1)
      }
    }
  end
  return Lithograph_controller.create(L10_97, L11_98, _mission_text_table), L9_96, sensor
end
function Fn_getMissionPart()
  return g_own:getName()
end
function LithographStart()
  if _litho_ctrls then
    _litho_ctrls:LithographStart()
  end
end
function isLithographStart()
  if _litho_ctrls then
    return _litho_ctrls:isLithographStart()
  end
end
function setFirstHalfProcessEnd()
  if _litho_ctrls then
    _litho_ctrls:setFirstHalfProcessEnd()
  end
  Fn_sendRequestRemoveDrop({mimick = true})
end
function isFirstHalfProcessEnd()
  if _litho_ctrls then
    return _litho_ctrls:isFirstHalfProcessEnd()
  end
end
function missionComplete()
  if _litho_ctrls then
    while Fn_getCageStatus() == true do
      wait()
    end
    invokeTask(function()
      GameDatabase:set(ggd.GlobalSystemFlags__Mine99MissionMmanaging, true)
      _litho_ctrls:missionComplete()
      GameDatabase:set(ggd.GlobalSystemFlags__Mine99MissionMmanaging, false)
    end)
  end
end
function setSecondHalfProcessEnd()
  if _litho_ctrls then
    _litho_ctrls:setSecondHalfProcessEnd()
  end
end
function isSecondHalfProcessStart()
  if _litho_ctrls then
    return _litho_ctrls:isSecondHalfProcessStart()
  end
end
function isSecondHalfProcessEventStart()
  if _litho_ctrls then
    return _litho_ctrls:isSecondHalfProcessEventStart()
  end
end
function isSecondHalfProcessEnd()
  if _litho_ctrls then
    return _litho_ctrls:isSecondHalfProcessEnd()
  end
end
function isSecondHalfProcessWait()
  if _litho_ctrls then
    return _litho_ctrls:isSecondHalfProcessWait()
  end
end
function missionFailure()
  if _litho_ctrls then
    while Fn_getCageStatus() == true do
      wait()
    end
    invokeTask(function()
      GameDatabase:set(ggd.GlobalSystemFlags__Mine99MissionMmanaging, true)
      _litho_ctrls:missionFailure()
      GameDatabase:set(ggd.GlobalSystemFlags__Mine99MissionMmanaging, false)
    end)
  end
end
function isFailureProcessEnd()
  if _litho_ctrls then
    return _litho_ctrls:isFailureProcessEnd()
  end
end
function missionTextVisible(A0_100)
  if _litho_ctrls then
    _litho_ctrls:setMissionEnable(A0_100)
  end
end
function Fn_retryMine99()
  local L0_101, L1_102
  _retry_mine99_entity = true
end
function Fn_showMineName(A0_103)
  if _show_mine_name == false then
    _show_mine_name = true
    invokeTask(function()
      local L0_104
      L0_104 = waitSeconds
      L0_104(1)
      L0_104 = {}
      L0_104.unique = "ui_gaiku_01_32"
      L0_104.section = string.format("ui_gaiku_04_%02d", A0_103 or _floor_num)
      L0_104.town = nil
      Fn_cityBlock(L0_104)
    end)
  end
end
function Fn_getMine99FloorClear(A0_105)
  local L1_106, L2_107
  L1_106 = A0_105 or _floor_num
  L2_107 = ggd
  L2_107 = L2_107[string.format("Savedata__Mine99__mine99_%03d_clear", L1_106)]
  if L2_107 then
    return GameDatabase:get(L2_107)
  end
  return nil
end
function Fn_setMine99FloorClear(A0_108, A1_109)
  local L2_110, L3_111, L4_112
  L2_110 = A0_108 or _floor_num
  L3_111 = A1_109 or true
  L4_112 = ggd
  L4_112 = L4_112[string.format("Savedata__Mine99__mine99_%03d_clear", L2_110)]
  if L4_112 then
    GameDatabase:set(L4_112, L3_111)
  end
end
function Fn_unlockMine99Boss(A0_113)
  local L1_114
  if 30 == A0_113 then
    L1_114 = {}
    L1_114[ggd.Savedata__Mine99__mine99_010_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_020_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_026_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_027_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_028_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_029_clear] = false
    L1_114[ggd.Savedata__Mine99__mine99_030_clear] = false
    GameDatabase:set(L1_114)
  end
end
function sendMineSetupDeathGhost(A0_115, A1_116)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupDeathGhost", A0_115, A1_116)
  end
end
function sendMineSetupSelfDyingRecording()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupSelfDyingRecording")
  end
end
function Fn_dropGraviryOre(A0_117)
  local L1_118, L2_119, L3_120, L4_121, L5_122, L6_123
  L1_118 = MineManager
  if L1_118 then
    L1_118 = MineManager
    L2_119 = L1_118
    L1_118 = L1_118.isRunning
    L1_118 = L1_118(L2_119)
    if L1_118 then
      L1_118 = findGameObject2
      L2_119 = "Node"
      L3_120 = A0_117
      L1_118 = L1_118(L2_119, L3_120)
      if L1_118 then
        L2_119 = findUpArea
        L3_120 = L1_118
        L2_119 = L2_119(L3_120)
        if L2_119 then
          L4_121 = L1_118
          L3_120 = L1_118.getTransform
          L4_121 = L3_120(L4_121)
          L5_122 = copyTable
          L6_123 = L3_120
          L5_122 = L5_122(L6_123)
          L3_120 = L5_122
          L5_122 = copyTable
          L6_123 = L4_121
          L5_122 = L5_122(L6_123)
          L4_121 = L5_122
          L5_122 = MineManager
          L6_123 = L5_122
          L5_122 = L5_122.sendEvent
          L5_122(L6_123, "dropGraviryOre", L2_119:getName(), L3_120, L4_121)
        else
          L3_120 = debugPrintMine
          L4_121 = "\227\130\168\227\131\170\227\130\162\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147\227\128\130"
          L3_120(L4_121)
        end
      else
        L2_119 = debugPrintMine
        L3_120 = A0_117
        L4_121 = "\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147\227\128\130"
        L3_120 = L3_120 .. L4_121
        L2_119(L3_120)
      end
    end
  end
end
function Fn_setExtraWarpPoint(A0_124)
  local L1_125
  _extra_warp_point = A0_124
end
function Fn_getStartAreaName()
  local L1_126
  L1_126 = _param_mine99_base
  L1_126 = L1_126.start_area_name
  return L1_126
end
function Fn_getGoalAreaName()
  local L1_127
  L1_127 = _param_mine99_base
  L1_127 = L1_127.goal_area_name
  return L1_127
end
function Fn_getEneGenNameTable()
  local L1_128
  L1_128 = _param_mine99_base
  L1_128 = L1_128.enmgen_tbl
  return L1_128
end
function Fn_getCageStatus()
  return g_own:getGameObject("mother2"):findGameObject2("Sandbox2", "bgManager"):findGameObject2("Sandbox2", "craneShipManager"):sendEvent("getCageStatus")
end
function debugPrintMine(A0_129)
  print(" l  mine99  l " .. A0_129)
end
_debug_disp_mine = false
function debugDispMine()
  while __debugSystemTask do
    if _debug_disp_mine then
      __debugDispX = 50
      __debugLine = 0
      debugDispPrint("- mine param -")
      debugDispPrint("start_area_name = [ " .. tostring(_param_mine99_base.start_area_name) .. " ]")
      debugDispPrint("goal_area_name  = [ " .. tostring(_param_mine99_base.goal_area_name) .. " ]")
      debugDispPrint("litho_pos       = [ " .. tostring(_param_mine99_base.litho_pos) .. " ]")
      debugDispPrint("litho_cam       = [ " .. tostring(_param_mine99_base.litho_cam) .. " ]")
      debugDispPrint("litho_aim       = [ " .. tostring(_param_mine99_base.litho_aim) .. " ]")
      debugDispPrint("litho_pc_pos_01 = [ " .. tostring(_param_mine99_base.litho_pc_pos_01) .. " ]")
      debugDispPrint("litho_pc_pos_02 = [ " .. tostring(_param_mine99_base.litho_pc_pos_02) .. " ]")
    end
    wait()
  end
end
debugMineParam = {
  name = "DispMineParam",
  callback = function()
    local L1_130
    L1_130 = _debug_disp_mine
    L1_130 = not L1_130
    _debug_disp_mine = L1_130
  end
}
table.insert(g_customDebugMenu, debugMineParam)
