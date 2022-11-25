import("GameDatabase")
import("Rtc")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
if _is_mission then
  dofile("/Game/Event2/Common/EventCommon.lua")
  print("treasure_box : EventCommon.lua\227\130\146dofile\227\129\151\227\129\190\227\129\151\227\129\159")
else
  dofile("/Game/Event2/Common/HeaderCommon.lua")
  print("treasure_box : HeaderCommon.lua\227\130\146dofile\227\129\151\227\129\190\227\129\151\227\129\159")
end
dofile("/Game/Event2/Common/NetworkCommon.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
_kTresureRewardMax = 58
_kTresureRewardMaxPrevious = 57
_treasure = {}
_treasure_box_access = false
_treasure_photo = false
_root_area_id = 0
_root_area_name = "None"
_node_name = nil
_is_menu = false
_lock_savemenu = false
_config_list = {
  {
    evb = "treasure_po_a_root",
    gdb = "po",
    root_name = "po_a_root"
  },
  {
    evb = "treasure_lo_a_root",
    gdb = "lo",
    root_name = "lo_a_root"
  },
  {
    evb = "treasure_mi_a_root",
    gdb = "mi",
    root_name = "mi_a_root"
  },
  {
    evb = "treasure_up_a_root",
    gdb = "up",
    root_name = "up_a_root"
  },
  {
    evb = "treasure_dt_a_root",
    gdb = "dt",
    root_name = "dt_a_root"
  },
  {
    evb = "treasure_cc_a_root",
    gdb = "cc",
    root_name = "cc_a_root"
  },
  {
    evb = "treasure_ed_a_root",
    gdb = "ed",
    root_name = "ed_a_root"
  },
  {
    evb = "treasure_id_a_root",
    gdb = "id",
    root_name = "id_a_root"
  }
}
_stop_sandbox = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = _is_mission
  if L0_0 then
    L0_0 = GameDatabase
    L1_1 = L0_0
    L0_0 = L0_0.get
    L2_2 = ggd
    L2_2 = L2_2.Savedata__TreasureFlags__Network__AreaId
    L0_0 = L0_0(L1_1, L2_2)
    _root_area_id = L0_0
    L0_0 = _root_area_id
    if L0_0 ~= nil then
      L0_0 = _root_area_id
      if not (L0_0 <= 0) then
        L0_0 = _root_area_id
        L1_1 = _config_list
        L1_1 = #L1_1
      end
    elseif L0_0 > L1_1 then
      L0_0 = print
      L1_1 = "\228\184\141\230\173\163\227\131\135\227\131\188\227\130\191\227\129\140\230\157\165\227\129\190\227\129\151\227\129\159\227\129\174\227\129\167\231\181\130\228\186\134\229\135\166\231\144\134\227\129\171\233\128\178\227\129\191\227\129\190\227\129\153"
      L0_0(L1_1)
      _stop_sandbox = true
      return
    end
    L0_0 = GameDatabase
    L1_1 = L0_0
    L0_0 = L0_0.get
    L2_2 = ggd
    L2_2 = L2_2.Savedata__TreasureFlags__Network__TBox
    L0_0 = L0_0(L1_1, L2_2)
    _node_name = L0_0
    L0_0 = _config_list
    L1_1 = _root_area_id
    L0_0 = L0_0[L1_1]
    L0_0 = L0_0.root_name
    _root_area_name = L0_0
    L0_0 = Fn_userCtrlOff
    L0_0()
  else
    L0_0 = GameDatabase
    L1_1 = L0_0
    L0_0 = L0_0.get
    L2_2 = ggd
    L2_2 = L2_2.Savedata__TreasureFlags__Local__AreaId
    L0_0 = L0_0(L1_1, L2_2)
    _root_area_id = L0_0
    L0_0 = _root_area_id
    if L0_0 ~= nil then
      L0_0 = _root_area_id
      if not (L0_0 <= 0) then
        L0_0 = _root_area_id
        L1_1 = _config_list
        L1_1 = #L1_1
      end
    elseif L0_0 > L1_1 then
      L0_0 = print
      L1_1 = "\228\184\141\230\173\163\227\131\135\227\131\188\227\130\191\227\129\140\230\157\165\227\129\190\227\129\151\227\129\159\227\129\174\227\129\167\231\181\130\228\186\134\229\135\166\231\144\134\227\129\171\233\128\178\227\129\191\227\129\190\227\129\153"
      L0_0(L1_1)
      _stop_sandbox = true
      return
    end
    L0_0 = GameDatabase
    L1_1 = L0_0
    L0_0 = L0_0.get
    L2_2 = ggd
    L2_2 = L2_2.Savedata__TreasureFlags__Local__TBox
    L0_0 = L0_0(L1_1, L2_2)
    _node_name = L0_0
    L0_0 = _config_list
    L1_1 = _root_area_id
    L0_0 = L0_0[L1_1]
    L0_0 = L0_0.root_name
    _root_area_name = L0_0
  end
  L0_0 = loadFileAsset
  L1_1 = "evb"
  L2_2 = "evx/"
  L3_3 = _config_list
  L4_4 = _root_area_id
  L3_3 = L3_3[L4_4]
  L3_3 = L3_3.evb
  L2_2 = L2_2 .. L3_3
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = nil
  if L0_0 then
    L3_3 = L0_0
    L2_2 = L0_0.wait
    L2_2(L3_3)
    L3_3 = L0_0
    L2_2 = L0_0.getRoot
    L2_2 = L2_2(L3_3)
    L1_1 = L2_2
    L2_2 = EventData
    L3_3 = L2_2
    L2_2 = L2_2.create
    L4_4 = "treasure_box"
    L5_5 = nil
    L6_6 = L1_1
    L2_2 = L2_2(L3_3, L4_4, L5_5, L6_6)
    L4_4 = L2_2
    L3_3 = L2_2.try_init
    L3_3(L4_4)
    L4_4 = L2_2
    L3_3 = L2_2.waitForReady
    L3_3(L4_4)
    L4_4 = L2_2
    L3_3 = L2_2.try_start
    L3_3(L4_4)
  end
  L2_2 = _is_mission
  if L2_2 and L1_1 then
    L2_2 = GameDatabase
    L3_3 = L2_2
    L2_2 = L2_2.get
    L4_4 = ggd
    L4_4 = L4_4.Savedata__TreasureFlags__Network__IsMenu
    L2_2 = L2_2(L3_3, L4_4)
    if L2_2 then
      _is_menu = true
      L2_2 = _findNearNode
      L3_3 = _node_name
      L3_3 = L2_2(L3_3)
      if L2_2 and L3_3 then
        L4_4 = print
        L5_5 = "treasure_box : pc start node is "
        L6_6 = L2_2.getName
        L6_6 = L6_6(L2_2)
        L5_5 = L5_5 .. L6_6 .. " : " .. L3_3:getName()
        L4_4(L5_5)
        L5_5 = L2_2
        L4_4 = L2_2.getTransform
        L5_5 = L4_4(L5_5)
        if L4_4 then
          L6_6 = createGameObject2
          L6_6 = L6_6("Node")
          L6_6:setName("locator2_pc_start_pos")
          L3_3:appendChild(L6_6)
          L6_6:setTransform(L4_4, L5_5)
        end
      end
    end
  end
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12
  L0_7 = GameDatabase
  L1_8 = L0_7
  L0_7 = L0_7.set
  L2_9 = ggd
  L2_9 = L2_9.GlobalSystemFlags__CityBgm
  L3_10 = true
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = _stop_sandbox
  if L0_7 then
    L0_7 = print
    L1_8 = "\228\184\141\230\173\163\227\131\135\227\131\188\227\130\191\227\129\170\227\129\174\227\129\171\229\174\159\232\161\140\227\129\151\227\130\136\227\129\134\227\129\168\227\129\151\227\129\159\227\129\174\227\129\167\229\188\183\229\136\182\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153"
    L0_7(L1_8)
    L0_7 = kill
    L0_7()
    return
  end
  L0_7 = findGameObject2
  L1_8 = "Node"
  L2_9 = _node_name
  L0_7 = L0_7(L1_8, L2_9)
  L1_8 = nil
  function L2_9()
    local L0_13, L1_14
    _treasure_box_access = true
  end
  L3_10 = createTreasureBox
  L4_11 = L2_9
  L3_10 = L3_10(L4_11)
  L5_12 = L0_7
  L4_11 = L0_7.appendChild
  L4_11(L5_12, L3_10.puppet)
  L5_12 = L0_7
  L4_11 = L0_7.setLocalAabb
  L4_11(L5_12, Aabb(Vector(-10000, -10000, -10000), Vector(10000, 10000, 10000)))
  L4_11 = initializeAllGameObjects
  L4_11()
  L4_11 = waitForReadyAllGameObjects
  L4_11()
  L4_11 = startAllGameObjects
  L4_11()
  L4_11 = treasureBoxIn
  L5_12 = L3_10.puppet
  L4_11(L5_12)
  L4_11 = _is_menu
  if not L4_11 then
    L4_11 = _is_mission
  elseif L4_11 then
    L4_11 = Fn_missionStart
    L4_11()
    L4_11 = Fn_userCtrlOn
    L4_11()
  end
  L4_11 = _is_mission
  if L4_11 then
    L4_11 = GameDatabase
    L5_12 = L4_11
    L4_11 = L4_11.set
    L4_11(L5_12, ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
    _lock_savemenu = true
    L4_11 = Fn_missionView
    L5_12 = "ic_treasure_00300"
    L4_11(L5_12)
    L4_11 = GameDatabase
    L5_12 = L4_11
    L4_11 = L4_11.get
    L4_11 = L4_11(L5_12, ggd.Savedata__TreasureFlags__Network__TGhost)
    if L4_11 == "None" or L4_11 == nil then
      L4_11 = "locator2_pc_start_pos"
    end
    L5_12 = findGameObject2
    L5_12 = L5_12("Node", L4_11)
    if L5_12 then
      L1_8 = invokeTask(navigate, L5_12, L3_10.puppet)
    end
    HUD:inGamePreviewCreate(_root_area_id, HUD.kIngamePreviewType_Treasure)
    while HUD:inGamePreviewIsLoading() do
      wait()
    end
    HUD:inGamePreviewFadeIn()
    L3_10.se_hdl = Sound:playSEHandle("sys_hint_treasure", 1, "", L3_10.puppet)
  end
  repeat
    L4_11 = wait
    L4_11()
    L4_11 = _treasure_box_access
  until L4_11
  L4_11 = g_own
  L5_12 = L4_11
  L4_11 = L4_11.setBool
  L4_11(L5_12, "is_treasure_open", true)
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.setStay
  L4_11(L5_12, true)
  L4_11 = Fn_userCtrlOff
  L4_11()
  L4_11 = L3_10.sensor
  L5_12 = L4_11
  L4_11 = L4_11.setActive
  L4_11(L5_12, false)
  L4_11 = L3_10.se_hdl
  if L4_11 then
    L4_11 = Sound
    L5_12 = L4_11
    L4_11 = L4_11.stopSEHandle
    L4_11(L5_12, L3_10.se_hdl)
  end
  L4_11 = HUD
  L5_12 = L4_11
  L4_11 = L4_11.inGamePreviewFadeOut
  L4_11(L5_12)
  if L1_8 then
    L5_12 = L1_8
    L4_11 = L1_8.abort
    L4_11(L5_12)
    L1_8 = nil
  end
  L4_11 = Fn_naviKill
  L4_11()
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.setEnergy
  L4_11(L5_12, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.turnTo
  L4_11(L5_12, L3_10.puppet:getWorldPos(), 0.4, false)
  L4_11 = invokeTask
  L5_12 = treasureBoxOpen
  L4_11 = L4_11(L5_12, L3_10.puppet)
  L5_12 = wait
  L5_12()
  L5_12 = HUD
  L5_12 = L5_12.menuDelCallback
  L5_12(L5_12, HUD.kCallback_Retire)
  L5_12 = Player
  L5_12 = L5_12.getPuppet
  L5_12 = L5_12(L5_12)
  L5_12:playPoseAnimation("treasure_open_00", 0, 0.3)
  invokeTask(function()
    repeat
      wait()
    until L5_12:isPoseAnimEnd()
    if Player:getAttrTune() == Player.kAttrTune_Mars then
      L5_12:playPoseAnimation("stay_mars_loop", -1, 0.3)
    else
      L5_12:playPoseAnimation("stay", -1, 0.3)
    end
  end)
  if _is_mission then
    HUD:sendTreasureResult(_root_area_id, _node_name)
    print("treasure_box : sendTreasureResult : area id = " .. tostring(_root_area_id) .. " : node name = " .. tostring(_node_name))
  end
  while L4_11:isRunning() do
    wait()
  end
  L4_11 = nil
  if GameDatabase:get(ggd.Savedata__TreasureFlags__IsFirst) then
    waitSeconds(1)
    GameDatabase:set(ggd.Savedata__TreasureFlags__IsFirst, false)
    HUD:info("th01_info_01", false, 15)
    wait()
  end
  GameDatabase:set(ggd.GlobalSystemFlags__CollectionCallbackEnable, false)
  Fn_userCtrlOn()
  Player:setStay(false)
  HUD:photoTreasureSaveDelete(_root_area_id)
  GameDatabase:set(ggd.GlobalSystemFlags__CollectionCallbackEnable, true)
  while invokeTask(treasureBoxClose, L3_10.puppet):isRunning() do
    wait()
  end
  treasureBoxOut(L3_10.puppet, L3_10.col)
  if _is_mission then
    if g_own:getGameObject("soundManager") then
      g_own:getGameObject("soundManager"):sendEvent("requestJingle", "mission_clear")
    end
    HUD:sideMissionEndOpen("ui_topinfo_main_treasure", "ui_sm_sub_06")
    while HUD:sideMissionIsVisible() do
      wait()
    end
    if _is_menu then
      Fn_blackout()
      Fn_userCtrlOff()
    else
      Fn_setKeepPlayerPos()
    end
    Fn_setNextMissionFlag()
    Fn_nextMission()
    Fn_exitSandbox()
  else
    kill()
  end
end
function Finalize()
  HUD:setPhotoMode(false)
  HUD:setFilmedPhotoCallback(nil)
  if _lock_savemenu then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
    _lock_savemenu = false
  end
  if _treasure.se_hdl then
    Sound:stopSEHandle(_treasure.se_hdl)
  end
  g_own:setBool("is_treasure_open", false)
end
function createTreasureBox(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22
  L1_16 = loadFileAsset
  L2_17 = "evd"
  L3_18 = "CharDefs/npc/treasurebox01"
  L1_16 = L1_16(L2_17, L3_18)
  if L1_16 then
    L3_18 = L1_16
    L2_17 = L1_16.wait
    L2_17(L3_18)
    L2_17 = createGameObject2
    L3_18 = "Puppet"
    L2_17 = L2_17(L3_18)
    L4_19 = L2_17
    L3_18 = L2_17.setEnableDebugDraw
    L5_20 = true
    L3_18(L4_19, L5_20)
    L4_19 = L2_17
    L3_18 = L2_17.setName
    L5_20 = "tb_puppet"
    L3_18(L4_19, L5_20)
    L4_19 = L2_17
    L3_18 = L2_17.setDescription
    L6_21 = L1_16
    L5_20 = L1_16.getRoot
    L7_22 = L5_20(L6_21)
    L3_18(L4_19, L5_20, L6_21, L7_22, L5_20(L6_21))
    L4_19 = L2_17
    L3_18 = L2_17.setActive
    L5_20 = false
    L3_18(L4_19, L5_20)
    L4_19 = L2_17
    L3_18 = L2_17.setLocalAabb
    L5_20 = Aabb
    L6_21 = Vector
    L7_22 = -80
    L6_21 = L6_21(L7_22, -80, -80)
    L7_22 = Vector
    L7_22 = L7_22(80, 80, 80)
    L7_22 = L5_20(L6_21, L7_22, L7_22(80, 80, 80))
    L3_18(L4_19, L5_20, L6_21, L7_22, L5_20(L6_21, L7_22, L7_22(80, 80, 80)))
    L3_18 = createGameObject2
    L4_19 = "GimmickBg"
    L3_18 = L3_18(L4_19)
    L5_20 = L3_18
    L4_19 = L3_18.setName
    L6_21 = "tb_col"
    L4_19(L5_20, L6_21)
    L5_20 = L3_18
    L4_19 = L3_18.setCollisionName
    L6_21 = "treasurebox_col"
    L4_19(L5_20, L6_21)
    L5_20 = L3_18
    L4_19 = L3_18.setAttributeName
    L6_21 = "invisible_col"
    L4_19(L5_20, L6_21)
    L5_20 = L2_17
    L4_19 = L2_17.appendChild
    L6_21 = L3_18
    L4_19(L5_20, L6_21)
    L4_19 = createGameObject2
    L5_20 = "PlayerSensor"
    L4_19 = L4_19(L5_20)
    L5_20 = "tb_sensor"
    L6_21 = L5_20
    L7_22 = "_OnEnter"
    L6_21 = L6_21 .. L7_22
    L7_22 = L5_20
    L7_22 = L7_22 .. "_OnLeave"
    _G[L6_21] = function()
      local L0_23
      L0_23 = _is_menu
      if not L0_23 then
        L0_23 = _is_ghost
      elseif L0_23 then
        L0_23 = _treasure
        L0_23 = L0_23.se_hdl
        if L0_23 then
          L0_23 = Sound
          L0_23 = L0_23.stopSEHandle
          L0_23(L0_23, _treasure.se_hdl)
          L0_23 = _treasure
          L0_23.se_hdl = nil
        end
      end
      L0_23 = {}
      L0_23.RL = {
        id = "ui_event_guide_12",
        func = A0_15
      }
      Fn_gestureAction(L0_23)
    end
    _G[L7_22] = function()
      if (_is_menu or _is_ghost) and not _treasure.se_hdl then
        _treasure.se_hdl = Sound:playSEHandle("sys_hint_treasure", 1, "", L2_17)
      end
      Fn_gestureActionCancel()
    end
    L4_19:setName(L5_20)
    L4_19:setDetectBehavior(1)
    L4_19:addCylinder(Vector(1, 0.4, 1), 16)
    L4_19:setPos(Vector(0, 1, 0))
    L4_19:setOnEnter(L6_21)
    L4_19:setOnLeave(L7_22)
    L2_17:appendChild(L4_19)
    return {
      puppet = L2_17,
      col = L3_18,
      sensor = L4_19
    }
  else
  end
  L2_17 = nil
  return L2_17
end
function navigate(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29, L6_30
  L2_26 = Fn_getPlayer
  L2_26 = L2_26()
  L4_28 = A0_24
  L3_27 = A0_24.getWorldPos
  L3_27 = L3_27(L4_28)
  L5_29 = L2_26
  L4_28 = L2_26.getWorldPos
  L4_28 = L4_28(L5_29)
  L6_30 = A1_25
  L5_29 = A1_25.getWorldPos
  L5_29 = L5_29(L6_30)
  L6_30 = L5_29
  L5_29 = L5_29.DistanceTo
  L5_29 = L5_29(L6_30, L3_27)
  L5_29 = L5_29 * 1.5
  L6_30 = 0
  if L5_29 < 0 then
    L5_29 = L5_29 * -1
  end
  while true do
    L4_28 = L2_26:getWorldPos()
    L6_30 = L3_27:DistanceTo(L4_28)
    if L5_29 < L6_30 then
      if not false then
        Fn_captionViewWait("ic_treasure_00310")
        Fn_naviSet(A0_24)
      end
    elseif L6_30 < 50 and true then
      Fn_naviKill()
      Fn_captionViewWait("ic_treasure_00320")
    end
    wait()
  end
end
function findNodeTransform(A0_31, A1_32, A2_33)
  local L3_34, L4_35, L5_36, L6_37, L7_38
  L4_35 = A0_31
  L3_34 = A0_31.findParentBundle
  L5_36 = A1_32
  L3_34 = L3_34(L4_35, L5_36)
  if L3_34 then
    L5_36 = L3_34
    L4_35 = L3_34.getString
    L6_37 = "areaname"
    L4_35 = L4_35(L5_36, L6_37)
    if L4_35 then
      L5_36 = nil
      if A2_33 then
        L7_38 = A0_31
        L6_37 = A0_31.findBundle
        L6_37 = L6_37(L7_38, A2_33, true)
        L5_36 = L6_37
      else
        L7_38 = A0_31
        L6_37 = A0_31.findBundle
        L6_37 = L6_37(L7_38, A1_32, true)
        L5_36 = L6_37
      end
      if L5_36 then
        L7_38 = L3_34
        L6_37 = L3_34.worldToLocal
        L7_38 = L6_37(L7_38, L5_36:getTranslation(), L5_36:getRotation())
        return L6_37, L7_38, L4_35
      end
    else
      L5_36 = findNodeTransform
      L6_37 = A0_31
      L7_38 = L3_34.getName
      L7_38 = L7_38(L3_34)
      return L5_36(L6_37, L7_38, A1_32)
    end
  end
  L4_35 = nil
  return L4_35
end
function treasureBoxOpen(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47
  L1_40 = invokeTask
  function L2_41()
    local L0_48
    L0_48 = wait
    L0_48(15)
    L0_48 = Sound
    L0_48 = L0_48.playSE
    L0_48(L0_48, "sys_box_flash", 1, "", A0_39)
    L0_48 = Fn_createEffect
    L0_48 = L0_48("ef_ui_lgtpar_01", "ef_ui_lgtpar_01", A0_39, false)
    Fn_finishedTremEffect(L0_48, 5)
  end
  L1_40(L2_41)
  L1_40 = wait
  L1_40()
  L2_41 = A0_39
  L1_40 = A0_39.playPoseAnimation
  L3_42 = "open"
  L4_43 = 0
  L1_40(L2_41, L3_42, L4_43)
  L1_40 = wait
  L2_41 = 17
  L1_40(L2_41)
  L1_40 = Sound
  L2_41 = L1_40
  L1_40 = L1_40.playSE
  L3_42 = "sys_box_open"
  L4_43 = 1
  L1_40(L2_41, L3_42, L4_43, L5_44, L6_45)
  L2_41 = A0_39
  L1_40 = A0_39.getWorldRot
  L1_40 = L1_40(L2_41)
  L2_41 = Fn_get_target_rot
  L3_42 = A0_39
  L4_43 = Fn_getPlayerWorldPos
  L8_47 = L4_43()
  L2_41 = L2_41(L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L4_43())
  L3_42 = 2
  L4_43 = 1 / L3_42
  for L8_47 = 1, L3_42 do
    A0_39:setWorldRot(SlerpQuat(L4_43 * L8_47, L1_40, L2_41))
    A0_39:setForceMove()
    wait()
  end
  L5_44(L6_45, L7_46)
  L5_44(L6_45)
  L5_44(L6_45)
  L5_44(L6_45, L7_46)
  L8_47 = ggd
  L8_47 = L8_47.Savedata__StatisticalChart__TreasureCount
  L6_45(L7_46, L8_47, L5_44)
  L8_47 = ggd
  L8_47 = L8_47.Savedata__StatisticalChart
  L6_45(L7_46, L8_47)
  L8_47 = "Savedata__TreasureFlags__Local__Date__lo"
  L8_47 = L7_46
  L8_47 = L7_46.year
  L8_47 = L8_47 .. string.format("%02d", L7_46.month) .. string.format("%02d", L7_46.day) .. ":" .. L7_46.hour * 60 + L7_46.minute
  GameDatabase:set(ggd[L6_45[_root_area_id]], tostring(L8_47))
  treasureBoxReward(A0_39)
  waitSeconds(0.5)
end
function treasureBoxIn(A0_49)
  Sound:playSE("sys_box_appear", 1, "", A0_49)
  A0_49:playPoseAnimation("in", 0)
  invokeTask(function()
    wait(3)
    A0_49:setActive(true)
    repeat
      wait()
    until A0_49:isPoseAnimEnd()
    A0_49:playPoseAnimation("stay")
  end)
end
function treasureBoxClose(A0_50)
  Sound:playSE("sys_box_close", 1, "", A0_50)
  A0_50:playPoseAnimation("close", 0)
  repeat
    wait()
  until A0_50:isPoseAnimEnd()
  A0_50:playPoseAnimation("stay")
end
function treasureBoxOut(A0_51, A1_52)
  Sound:playSE("sys_box_disappear", 1, "", A0_51)
  invokeTask(function()
    wait(46)
  end)
  A1_52:setCollidablePermission(false)
  A0_51:playPoseAnimation("out", 0)
  repeat
    if not A0_51:isPoseAnimPlaying("out") then
      A0_51:playPoseAnimation("out", 0)
    end
    wait()
  until A0_51:isPoseAnimEnd()
  A0_51:setVisible(false)
  waitSeconds(3)
  A0_51:setActive(false)
end
function createGem(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
  L2_55 = RandI
  L3_56 = 5
  L2_55 = L2_55(L3_56, L4_57)
  L3_56 = 1
  for L7_60 = 1, L2_55 do
    L8_61 = g_own
    L9_62 = L8_61
    L8_61 = L8_61.getGameObject
    L8_61 = L8_61(L9_62, "eventheader")
    L8_61 = L8_61 or g_own
    L9_62 = L8_61.createGameObject2
    L9_62 = L9_62(L8_61, "Gem")
    L9_62:setFaceGetting(true)
    L9_62:setGemModelNo(L3_56)
    A0_53:appendChild(L9_62)
    L9_62:setPos(Vector(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
    L9_62:setDynamic(true)
    L9_62:try_init()
    L9_62:waitForReadyAsync(function(A0_63)
      A0_63:try_start()
      A0_63:setImpulse(Vector(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5)))
      L9_62:leaveFromParent(true)
    end)
    wait(RandF(1, 3))
    break
  end
end
function treasureBoxPhoto(A0_64)
  local L1_65, L2_66, L3_67, L4_68
  _treasure_photo = false
  L1_65 = false
  L2_66 = invokeTask
  function L3_67()
    local L0_69
    L0_69 = Fn_missionViewWait
    L0_69("ic_treasure_00200")
    L0_69 = nil
    while not _treasure_photo and not L1_65 do
      if HUD:isPhotoMode() then
        L0_69 = nil
      else
        L0_69 = "ic_camera_00100"
      end
      if L0_69 ~= nil then
        if L0_69 ~= nil then
          Fn_captionView(L0_69, 0)
        else
          Fn_captionViewEnd()
        end
      end
      wait()
    end
  end
  L2_66 = L2_66(L3_67)
  L3_67 = invokeTask
  function L4_68()
    local L0_70, L1_71, L2_72, L3_73, L4_74
    L0_70 = Fn_getPlayer
    L0_70 = L0_70()
    L1_71 = A0_64
    L2_72 = L1_71
    L1_71 = L1_71.getWorldPos
    L1_71 = L1_71(L2_72)
    L3_73 = L0_70
    L2_72 = L0_70.getWorldPos
    L2_72 = L2_72(L3_73)
    L3_73 = 0
    L4_74 = "ic_treasure_00200"
    while not _treasure_photo and not L1_65 do
      L2_72 = L0_70:getWorldPos()
      L3_73 = L1_71:DistanceTo(L2_72)
      if L3_73 > 50 then
        L1_65 = true
        Fn_naviKill()
        Fn_missionViewEnd()
      elseif L3_73 > 30 then
        L4_74 = "ic_treasure_00210"
      elseif L3_73 < 20 then
        L4_74 = "ic_treasure_00200"
      end
      if L4_74 ~= "ic_treasure_00200" then
        if L4_74 ~= nil then
          Fn_missionView(L4_74)
          if L4_74 == "ic_treasure_00210" then
            Fn_naviSet(A0_64)
          elseif L4_74 == "ic_treasure_00200" then
            Fn_naviKill()
          end
        end
      end
      wait()
    end
  end
  L3_67 = L3_67(L4_68)
  L4_68 = wait
  L4_68()
  function L4_68()
    invokeTask(function()
      HUD:treasureSendOpen(_root_area_id, _root_area_name, _node_name)
      wait()
      if HUD:treasureSendSelected() == HUD.kTreasureSendButton_Send then
        _treasure_photo = true
        print("Photo_Upload_End")
      elseif HUD:treasureSendSelected() == HUD.kTreasureSendButton_Retry then
        print("SelectButton:Retry")
      end
    end)
  end
  HUD:setFilmedPhotoCallback(L4_68)
  repeat
    wait()
  until _treasure_photo or L1_65
  if L2_66 and L2_66:isRunning() then
    L2_66:abort()
    L2_66 = nil
  end
  if L3_67 and L3_67:isRunning() then
    L3_67:abort()
    L3_67 = nil
  end
  if L1_65 then
    waitSeconds(0.5)
    Fn_captionViewWait("ic_treasure_00220")
  end
  Fn_naviKill()
  Fn_captionViewEnd()
  Fn_missionViewEnd()
  Fn_missionInfoEnd()
  HUD:setPhotoMode(false)
  HUD:setFilmedPhotoCallback(nil)
  return L1_65
end
function treasureBoxReward(A0_75)
  local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81
  L1_76 = RandI
  L2_77 = 1
  L3_78 = 100
  L1_76 = L1_76(L2_77, L3_78)
  L2_77 = findTreasureBoxReward
  L4_79 = L2_77()
  L5_80 = print
  L6_81 = "\229\143\150\229\190\151\230\149\176     : "
  L6_81 = L6_81 .. L3_78
  L5_80(L6_81)
  L5_80 = print
  L6_81 = "\229\143\150\229\190\151\229\143\175\232\131\189\230\149\176 : "
  L6_81 = L6_81 .. L4_79
  L5_80(L6_81)
  if L3_78 <= L4_79 and L1_76 < 95 then
    L5_80 = 1
    L6_81 = true
    if L3_78 == _kTresureRewardMaxPrevious then
      L5_80 = _kTresureRewardMax
    else
      L5_80 = RandI(1, #L2_77)
    end
    if GameDatabase:get(ggd.Debug__TBoxReward) then
      L5_80 = GameDatabase:get(ggd.Debug__TBoxRewardId)
    end
    Sound:pulse("success")
    createGem(A0_75, 10)
    if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName) == "eventheader" then
      L6_81 = false
    end
    if L5_80 == _kTresureRewardMax then
      _rewardView("treasure", "tb" .. string.format("%02d", L5_80), nil, nil, L6_81)
    else
      _rewardView("treasure", L2_77[L5_80], nil, nil, L6_81)
    end
  else
    L5_80 = Sound
    L6_81 = L5_80
    L5_80 = L5_80.pulse
    L5_80(L6_81, "success")
    L5_80 = createGem
    L6_81 = A0_75
    L5_80(L6_81, 30)
  end
end
function findTreasureBoxReward()
  local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92
  L0_82 = GameDatabase
  L1_83 = L0_82
  L0_82 = L0_82.get
  L2_84 = ggd
  L2_84 = L2_84.Savedata__EventManageFlags__CurrentEpisodeNum
  L0_82 = L0_82(L1_83, L2_84)
  L1_83 = {}
  L2_84 = 0
  L3_85 = 0
  L4_86 = false
  for L8_90 = 1, _kTresureRewardMaxPrevious do
    L4_86 = false
    if L0_82 < 15 and L8_90 >= 11 and L8_90 <= 35 then
      L4_86 = true
      L9_91 = print
      L10_92 = "Savedata__RewardFlags__treasure__"
      L10_92 = L10_92 .. "tb" .. string.format("%02d", L8_90) .. "\227\129\175ft14\228\187\165\228\184\139\227\129\167\227\129\175\229\135\186\227\129\190\227\129\155\227\130\147"
      L9_91(L10_92)
    end
    if not L4_86 then
      L9_91 = "tb"
      L10_92 = string
      L10_92 = L10_92.format
      L10_92 = L10_92("%02d", L8_90)
      L9_91 = L9_91 .. L10_92
      L10_92 = ggd
      L10_92 = L10_92["Savedata__RewardFlags__treasure__" .. L9_91]
      if L10_92 then
        if GameDatabase:get(L10_92) then
          L2_84 = L2_84 + 1
        elseif L8_90 < _kTresureRewardMax then
          table.insert(L1_83, L9_91)
        end
      end
      L3_85 = L3_85 + 1
    end
  end
  return L5_87, L6_88, L7_89
end
if _is_mission then
  debugTreasureBoxSetNavi = {
    name = "TBox_SetNavi",
    callback = function()
      local L0_93, L1_94
      L0_93 = GameDatabase
      L1_94 = L0_93
      L0_93 = L0_93.get
      L0_93 = L0_93(L1_94, ggd.Savedata__TreasureFlags__Network__TBox)
      L1_94 = findGameObject2
      L1_94 = L1_94("Node", L0_93)
      if L1_94 then
        HUD:naviSetActivate(true)
        HUD:naviSetTarget(L1_94)
      end
    end
  }
  table.insert(g_customDebugMenu, debugTreasureBoxSetNavi)
end
