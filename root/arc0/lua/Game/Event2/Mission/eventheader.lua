import("PhotoMgr")
import("GlobalGem")
import("Ugc")
import("Rtc")
import("Yaml")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/NetworkCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Table/FreeTimeTable.lua")
dofile("/Game/Misc/my_home.lua")
__finalize = false
__sb_header_same = {}
__sb_header_different = {}
__sb_list_same = nil
__sb_list_different = nil
__start_caption = nil
__mission_reply = false
__mission_replay_run = false
__home_cancel = false
__home_start_cursor = 0
__home_manhole = false
__home_manhole_run = false
__my_home = nil
__npc_same_list = nil
__npc_different_list = nil
__delay_npc_create_task = nil
__npc_same_hdls = nil
__npc_different_hdls = nil
__select_mission_name = nil
__treasure_task = nil
__treasure_sb = nil
__treasure = {}
__costume_reset = false
__treasure_gdb_list = {
  "Savedata__TreasureFlags__Local__Date__po",
  "Savedata__TreasureFlags__Local__Date__lo",
  "Savedata__TreasureFlags__Local__Date__mi",
  "Savedata__TreasureFlags__Local__Date__up",
  "Savedata__TreasureFlags__Local__Date__dt",
  "Savedata__TreasureFlags__Local__Date__cc",
  "Savedata__TreasureFlags__Local__Date__ed",
  "Savedata__TreasureFlags__Local__Date__id"
}
__mine_marker = {}
__return_to_port = false
__challeng_ghost_task = {}
__challeng_ghost_list = {}
__challeng_ghost_active = true
__treasure_evb_load_cnt = 0
__challeng_marker_nodes = {}
__challeng_marker_change = false
__challeng_menu_open = false
__deactive_marker = false
__deactive_marker_list = {}
function debugPrintEventHeader(A0_0)
  print(" |  ev hdr | " .. A0_0)
end
function Initialize()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  __deactive_marker = true
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.reset
  L2_3 = ggd
  L2_3 = L2_3.GlobalSystemFlags__Gauge
  L0_1(L1_2, L2_3)
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.reset
  L2_3 = ggd
  L2_3 = L2_3.GlobalSystemFlags__GaugeCoercion
  L0_1(L1_2, L2_3)
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = ggd
  L2_3 = L2_3.GlobalSystemFlags__SkipResetAbility
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = _analyzeMarkerList
  L2_3 = L0_1()
  L3_4 = _createMakerNode
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  __sb_list_different = L6_7
  __sb_list_same = L5_6
  __npc_different_list = L4_5
  __npc_same_list = L3_4
  L3_4 = initializeAllGameObjects
  L3_4()
  L3_4 = waitForReadyAllGameObjects
  L3_4()
  L3_4 = startAllGameObjects
  L3_4()
  L3_4 = g_own
  L3_4 = L3_4.getGameObject
  L3_4 = L3_4(L4_5, L5_6)
  L4_5(L5_6, L6_7)
  while true do
    if L4_5 then
      L4_5()
    end
  end
  L3_4 = nil
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5(L5_6)
  for L7_8, L8_9 in L4_5(L5_6) do
    if L7_8 ~= "home" and L7_8 ~= "mansion" then
      L9_10 = string
      L9_10 = L9_10.find
      L10_11 = L7_8
      L9_10 = L9_10(L10_11, L11_12)
      if L9_10 == nil then
        L9_10 = _createManholeMarker
        L10_11 = L8_9.new_node
        L10_11 = L10_11.hdl
        L9_10(L10_11, L11_12)
      end
    end
  end
  for L7_8, L8_9 in L4_5(L5_6) do
    L9_10 = _createMissionMarkerStory
    L10_11 = L8_9.new_node
    L10_11 = L10_11.hdl
    L9_10(L10_11, L11_12, L12_13, L13_14)
    L9_10 = L8_9.caption
    __start_caption = L9_10
    if L7_8 == "ep10" then
      L9_10 = Fn_getGameObject
      L10_11 = "bgManager"
      L9_10 = L9_10(L10_11)
      L10_11 = L9_10.sendEvent
      L13_14.windmill_broken = false
      L10_11(L11_12, L12_13, L13_14)
    end
  end
  for L7_8, L8_9 in L4_5(L5_6) do
    L9_10 = _createMissionMarkerSide
    L10_11 = L8_9.new_node
    L10_11 = L10_11.hdl
    L14_15 = L8_9.monologue_start
    L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, L8_9.monologue_end)
  end
  for L7_8, L8_9 in L4_5(L5_6) do
    L9_10 = _createMissionMarkerChallenge
    L10_11 = L8_9.new_node
    L10_11 = L10_11.hdl
    L14_15 = L12_13(L13_14)
    L10_11 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, L12_13(L13_14))
    if L11_12 == nil then
      L12_13.node = L9_10
      L12_13.letter = L10_11
      L11_12[L7_8] = L12_13
    else
      L14_15 = "\227\129\174\227\131\158\227\131\188\227\130\171\227\131\188\227\129\175\228\189\156\230\136\144\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153"
      L11_12(L12_13)
    end
  end
  for L8_9, L9_10 in L5_6(L6_7) do
    L10_11 = _createMiningMarker
    L14_15 = free_setting_tbl
    L14_15 = L14_15[L8_9]
    L14_15 = L9_10.contact
    L10_11(L11_12, L12_13, L13_14, L14_15)
  end
  if L4_5 then
    if L5_6 then
      L14_15 = L6_7(L7_8, L8_9)
      L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
      L5_6()
      if L6_7 == "ve_crane_root" then
        L9_10 = "worker"
      end
      for L9_10, L10_11 in L6_7(L7_8) do
        for L14_15, _FORV_15_ in L11_12(L12_13) do
          if _FORV_15_.name == L10_11 then
            table.remove(__npc_same_list, L14_15)
            break
          end
        end
        for L14_15, _FORV_15_ in L11_12(L12_13) do
          if _FORV_15_.name == L10_11 then
            table.remove(__npc_different_list, L14_15)
            break
          end
        end
      end
      L6_7()
      L6_7()
      L6_7()
      L9_10 = false
      L6_7(L7_8, L8_9, L9_10)
      __return_to_port = true
    end
  end
  L5_6(L6_7, L7_8, L8_9)
  if L5_6 == "ft15" or L5_6 == "ft16" or L5_6 == "ft18" or L5_6 == "ft21" or L5_6 == "ft28" then
    L6_7(L7_8, L8_9)
  end
  if L6_7 == "free" then
    L6_7(L7_8)
  end
end
function initializeHeaderNpc()
  if __delay_npc_create_task then
    return
  end
  __delay_npc_create_task = invokeTask(function()
    for _FORV_4_, _FORV_5_ in pairs(__npc_same_list) do
      print(_FORV_5_.name)
    end
    __npc_same_hdls = Fn_setupNpc(__npc_same_list, true)
    g_own:getGameObject("npcManager"):sendEvent("requestReady")
    repeat
      wait()
    until g_own:getGameObject("npcManager"):sendEvent("isObjectReady")
    for _FORV_4_, _FORV_5_ in pairs(__sb_list_same) do
      _createHeaderSandbox(_FORV_5_.name, _FORV_5_.path, __sb_header_same)
    end
  end)
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
  L0_16 = Mob
  L1_17 = L0_16
  L0_16 = L0_16.makeSituationPanic
  L2_18 = false
  L0_16(L1_17, L2_18)
  L0_16 = Fn_setKittenAndCatActive
  L1_17 = true
  L0_16(L1_17)
  L0_16 = invokeTask
  function L1_17()
    local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29
    function L0_22(A0_30)
      __treasure_evb_load_cnt = __treasure_evb_load_cnt + 1
      debugPrintEventHeader("load evb name : " .. A0_30)
      if loadFileAsset("evb", "evx/" .. A0_30) then
        loadFileAsset("evb", "evx/" .. A0_30):wait()
        if EventData:create(A0_30, nil, loadFileAsset("evb", "evx/" .. A0_30):getRoot()) then
          EventData:create(A0_30, nil, loadFileAsset("evb", "evx/" .. A0_30):getRoot()):try_init()
          EventData:create(A0_30, nil, loadFileAsset("evb", "evx/" .. A0_30):getRoot()):waitForReadyAsync(function(A0_31)
            A0_31:try_start()
            __treasure_evb_load_cnt = __treasure_evb_load_cnt - 1
            debugPrintEventHeader("load evb finish name : " .. A0_30)
          end)
        end
      else
        debugPrintEventHeader("load evb name : " .. A0_30 .. " is nil")
      end
    end
    L1_23 = GameDatabase
    L2_24 = L1_23
    L1_23 = L1_23.get
    L3_25 = ggd
    L3_25 = L3_25.Savedata__EventManageFlags__TreasureBox
    L1_23 = L1_23(L2_24, L3_25)
    if L1_23 then
      L1_23 = GameDatabase
      L2_24 = L1_23
      L1_23 = L1_23.get
      L3_25 = ggd
      L3_25 = L3_25.Savedata__EventManageFlags__ClearEpisodeNum
      L1_23 = L1_23(L2_24, L3_25)
      if L1_23 < 12 then
        L2_24 = 4
      else
        L2_24 = L2_24 or 8
      end
      L3_25 = nil
      for L7_29 = 1, L2_24 do
        L3_25 = _getIdToAreaName(L7_29)
        if L3_25 then
          if L2_24 >= 8 then
            if L1_23 >= 21 then
              L0_22("treasure_" .. L3_25)
            elseif L1_23 < 21 and L7_29 > 4 then
              L0_22("treasure_" .. L3_25)
            end
          else
            L0_22("treasure_" .. L3_25)
          end
        end
      end
      while true do
        if L4_26 ~= 0 then
          L4_26()
        end
      end
      __treasure_task = L4_26
      L4_26(L5_27)
      L4_26(L5_27)
    end
  end
  L0_16(L1_17)
  L0_16 = invokeTask
  function L1_17()
    Net:checkAvailability()
    while Net:checkAvailabilityUpdate() ~= 0 do
      wait()
    end
    Ugc:serviceStart()
    if GameDatabase:get(ggd.GlobalSystemFlags__NetWorkService) then
      Net:checkParentalControl()
      while Net:updateParentalControl() ~= 0 do
        wait()
      end
    end
    GameDatabase:set(ggd.GlobalSystemFlags__NetWorkService, false)
    downloadNetworkData()
  end
  L0_16(L1_17)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.GlobalSystemFlags__GameOverEnable
  L3_19 = true
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = _resetHUD
  L0_16()
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.reset
  L2_18 = ggd
  L2_18 = L2_18.Savedata__Menu__Mission
  L0_16(L1_17, L2_18)
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setTargetingPriority
  L2_18 = Player
  L2_18 = L2_18.kTargetingPrio_Default
  L0_16(L1_17, L2_18)
  L0_16 = HUD
  L1_17 = L0_16
  L0_16 = L0_16.sightMarkerSetDisable
  L2_18 = false
  L0_16(L1_17, L2_18)
  L0_16 = _resetFeline
  L0_16()
  L0_16 = Fn_resetCoercionPose
  L0_16()
  L0_16 = Sound
  L1_17 = L0_16
  L0_16 = L0_16.setGlobalVariable
  L2_18 = "voice_type"
  L3_19 = "normal"
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = Fn_setCatWarp
  L1_17 = true
  L0_16(L1_17)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.get
  L2_18 = ggd
  L2_18 = L2_18.Savedata__EventManageFlags__ClearEpisodeNum
  L0_16 = L0_16(L1_17, L2_18)
  if L0_16 > 4 then
    L0_16 = GameDatabase
    L1_17 = L0_16
    L0_16 = L0_16.set
    L2_18 = ggd
    L2_18 = L2_18.GlobalSystemFlags__PhotoItemLoad
    L3_19 = true
    L0_16(L1_17, L2_18, L3_19)
    L0_16 = GameDatabase
    L1_17 = L0_16
    L0_16 = L0_16.get
    L2_18 = ggd
    L2_18 = L2_18.Savedata__EventManageFlags__GestureUnlock
    L0_16 = L0_16(L1_17, L2_18)
    if L0_16 == false then
      L0_16 = GameDatabase
      L1_17 = L0_16
      L0_16 = L0_16.set
      L2_18 = ggd
      L2_18 = L2_18.Savedata__EventManageFlags__GestureUnlock
      L3_19 = true
      L0_16(L1_17, L2_18, L3_19)
      L0_16 = GameDatabase
      L1_17 = L0_16
      L0_16 = L0_16.get
      L2_18 = ggd
      L2_18 = L2_18.Savedata__RewardFlags__GetCount__GestureCnt
      L0_16 = L0_16(L1_17, L2_18)
      L1_17 = GameDatabase
      L2_18 = L1_17
      L1_17 = L1_17.get
      L3_19 = ggd
      L3_19 = L3_19.Savedata__RewardFlags__GetCount__GestureMax
      L1_17 = L1_17(L2_18, L3_19)
      L0_16 = L0_16 + 4
      L2_18 = GameDatabase
      L3_19 = L2_18
      L2_18 = L2_18.set
      L4_20 = ggd
      L4_20 = L4_20.Savedata__RewardFlags__GetCount__GestureCnt
      L5_21 = L0_16
      L2_18(L3_19, L4_20, L5_21)
      L2_18 = GameDatabase
      L3_19 = L2_18
      L2_18 = L2_18.set
      L4_20 = ggd
      L4_20 = L4_20.Savedata__StatisticalChart__GestureCount
      L5_21 = L0_16
      L5_21 = L5_21 .. "/" .. L1_17
      L2_18(L3_19, L4_20, L5_21)
    end
  end
  L0_16 = invokeSystemTask
  function L1_17()
    debugPrintEventHeader("\229\136\165\227\130\168\227\131\170\227\130\162\227\129\174NPC\231\148\159\230\136\144\227\130\191\227\130\185\227\130\175\229\174\159\232\161\140")
    __npc_different_hdls = Fn_setupNpc(__npc_different_list, true)
    g_own:getGameObject("npcManager"):sendEvent("requestReady")
    repeat
      if __exit_sandbox or __finalize then
        return
      end
      if g_own:getGameObject("npcManager"):isRunning() then
        wait()
      end
    until g_own:getGameObject("npcManager"):sendEvent("isObjectReady")
    if __finalize then
      debugPrintEventHeader("\231\148\159\230\136\144\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153 01")
      return
    end
    g_own:getGameObject("npcManager"):sendEvent("requestStart")
    for _FORV_5_, _FORV_6_ in pairs(__sb_list_different) do
      if _FORV_5_ ~= nil then
        _createHeaderSandbox(_FORV_6_.name, _FORV_6_.path, __sb_header_different)
      end
    end
    if 0 + 1 ~= 0 then
      repeat
        if __exit_sandbox or __finalize then
          return
        end
        wait()
      until #__sb_header_different == 0 + 1
      if __finalize then
        debugPrintEventHeader("\231\148\159\230\136\144\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153 02")
        return
      end
      _startHeaderSandbox(__sb_header_different)
    end
    debugPrintEventHeader("\229\136\165\227\130\168\227\131\170\227\130\162\227\129\174NPC\231\148\159\230\136\144\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
  end
  L0_16(L1_17)
  L0_16 = invokeTask
  function L1_17()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40
    while true do
      for L3_35, L4_36 in L0_32(L1_33) do
        L5_37 = Ugc
        L6_38 = L5_37
        L5_37 = L5_37.isChLetter
        L7_39 = L3_35
        L5_37 = L5_37(L6_38, L7_39)
        if L5_37 then
          L5_37 = L4_36.letter
          if L5_37 == false then
            __challeng_marker_change = true
            L5_37 = "gui_marker_03"
            L6_38 = "gui_marker_04"
            L7_39 = getGameDataBaseVal
            L8_40 = "Savedata__EventFinishedFlags__"
            L8_40 = L8_40 .. L3_35
            L7_39 = L7_39(L8_40)
            if L7_39 > 0 then
              L5_37 = "gui_marker_05"
              L6_38 = "gui_marker_06"
            end
            L7_39 = {}
            L7_39.name = L5_37
            L7_39.name2 = L6_38
            L8_40 = "ui_acdialog_main_"
            L8_40 = L8_40 .. L3_35
            L7_39.ad_title_id = L8_40
            L7_39.ad_sub_id = "ui_acdialog_sub_02"
            L8_40 = "ui_map_msinfo_main_"
            L8_40 = L8_40 .. L3_35
            L7_39.map_title_id = L8_40
            L7_39.map_sub_id = "ui_map_msinfo_header_02"
            L7_39.giude_id = "ui_keyguide_ac_01"
            L7_39.pattern = "default"
            L7_39.map_disp = true
            L7_39.sensor_ofs = 1.2
            L8_40 = true
            if __challeng_menu_open then
              L8_40 = false
              repeat
                wait()
              until not __challeng_menu_open
            end
            Fn_changeMapMarker(L4_36.node, L7_39, L8_40)
            L4_36.letter = true
            debugPrintEventHeader("\230\140\145\230\136\166\231\138\182\227\129\174\227\131\129\227\131\163\227\131\172\227\131\179\227\130\184\227\131\158\227\131\188\227\130\171\227\131\188\227\129\171\229\164\137\230\155\180")
          end
        else
          L5_37 = L4_36.letter
          if L5_37 == true then
            __challeng_marker_change = true
            L5_37 = "gui_marker_03"
            L6_38 = getGameDataBaseVal
            L7_39 = "Savedata__EventFinishedFlags__"
            L8_40 = L3_35
            L7_39 = L7_39 .. L8_40
            L6_38 = L6_38(L7_39)
            if L6_38 > 0 then
              L5_37 = "gui_marker_05"
            end
            L6_38 = {}
            L6_38.name = L5_37
            L7_39 = "ui_acdialog_main_"
            L8_40 = L3_35
            L7_39 = L7_39 .. L8_40
            L6_38.ad_title_id = L7_39
            L6_38.ad_sub_id = "ui_acdialog_sub_02"
            L7_39 = "ui_map_msinfo_main_"
            L8_40 = L3_35
            L7_39 = L7_39 .. L8_40
            L6_38.map_title_id = L7_39
            L6_38.map_sub_id = "ui_map_msinfo_header_02"
            L6_38.giude_id = "ui_keyguide_ac_01"
            L6_38.pattern = "default"
            L6_38.map_disp = true
            L6_38.sensor_ofs = 1.2
            L7_39 = true
            L8_40 = __challeng_menu_open
            if L8_40 then
              L7_39 = false
              repeat
                L8_40 = wait
                L8_40()
                L8_40 = __challeng_menu_open
              until not L8_40
            end
            L8_40 = Fn_changeMapMarker
            L8_40(L4_36.node, L6_38, L7_39)
            L4_36.letter = false
            L8_40 = debugPrintEventHeader
            L8_40("\233\128\154\229\184\184\227\129\174\227\131\129\227\131\163\227\131\172\227\131\179\227\130\184\227\131\158\227\131\188\227\130\171\227\131\188\227\129\171\229\164\137\230\155\180")
          end
        end
        L5_37 = wait
        L5_37()
      end
      L0_32()
    end
  end
  L0_16(L1_17)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.Savedata__EventManageFlags__EventCheckPoint
  L3_19 = "None"
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.Savedata__EventManageFlags__MissionReplay
  L3_19 = "None"
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.Savedata__EventManageFlags__MissionNotice
  L3_19 = false
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = PhotoMgr
  L1_17 = L0_16
  L0_16 = L0_16.DeleteAllItem
  L0_16(L1_17)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.GlobalSystemFlags__CityBgm
  L3_19 = true
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.get
  L2_18 = ggd
  L2_18 = L2_18.Menu__MapName
  L0_16 = L0_16(L1_17, L2_18)
  if L0_16 == "po" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "po_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "bu" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "bu_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "lo" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "lo_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "up" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "up_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "go" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "go_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "cc" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "cc_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "dt" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "dt_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "ed" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "ed_onEnter"
    L1_17(L2_18, L3_19)
  elseif L0_16 == "id" then
    L1_17 = Fn_setBgmPoint
    L2_18 = "event"
    L3_19 = "id_onEnter"
    L1_17(L2_18, L3_19)
  end
  L1_17 = GameDatabase
  L2_18 = L1_17
  L1_17 = L1_17.set
  L3_19 = ggd
  L3_19 = L3_19.GlobalSystemFlags__Lively
  L4_20 = true
  L1_17(L2_18, L3_19, L4_20)
  L1_17 = GameDatabase
  L2_18 = L1_17
  L1_17 = L1_17.set
  L3_19 = ggd
  L3_19 = L3_19.CreneShipFlags__MiningRun
  L4_20 = true
  L1_17(L2_18, L3_19, L4_20)
  L1_17 = _startHeaderSandbox
  L2_18 = __sb_header_same
  L1_17(L2_18)
  function L1_17(A0_41)
    invokeTask(function()
      Player:setStay(true)
      Fn_blackout()
      GameDatabase:set(ggd.Savedata__EventManageFlags__MissionReplay, A0_41)
      GameDatabase:set(ggd.Savedata__EventManageFlags__MissionNotice, true)
      Fn_naviKill()
      Fn_setNextMissionFlag(A0_41 .. "_header")
      Fn_nextMission()
      Fn_exitSandbox()
    end)
  end
  L2_18 = HUD
  L3_19 = L2_18
  L2_18 = L2_18.menuSetCallback
  L4_20 = HUD
  L4_20 = L4_20.kCallback_ChallengeMissionRankingSelect
  L5_21 = L1_17
  L2_18(L3_19, L4_20, L5_21)
  L2_18 = false
  L3_19 = false
  L4_20 = __return_to_port
  if L4_20 then
    __start_caption = false
    L3_19 = true
    L4_20 = Fn_returnToPort
    L4_20()
    L4_20 = invokeTask
    function L5_21()
      Fn_waitReturnToPortFinish()
      _setDeactiveMarkerOn()
      GameDatabase:set(ggd.Savedata__EventManageFlags__CityPlaceName, true)
      if MineManager and MineManager:isRunning() then
        MineManager:sendEvent("setLoackUpdateMine", false)
      end
      Ugc:disableFriendDGUpdate(false)
    end
    L4_20(L5_21)
    __return_to_port = false
    L2_18 = true
  else
    L4_20 = GameDatabase
    L5_21 = L4_20
    L4_20 = L4_20.set
    L4_20(L5_21, ggd.Savedata__EventManageFlags__CityPlaceName, true)
    L4_20 = MineManager
    if L4_20 then
      L4_20 = MineManager
      L5_21 = L4_20
      L4_20 = L4_20.isRunning
      L4_20 = L4_20(L5_21)
      if L4_20 then
        L4_20 = MineManager
        L5_21 = L4_20
        L4_20 = L4_20.sendEvent
        L4_20(L5_21, "setLoackUpdateMine", false)
      end
    end
    L4_20 = Ugc
    L5_21 = L4_20
    L4_20 = L4_20.disableFriendDGUpdate
    L4_20(L5_21, false)
  end
  L4_20 = Fn_missionStart
  L4_20()
  if not L3_19 then
    L4_20 = _setDeactiveMarkerOn
    L4_20()
    L4_20 = HUD
    L5_21 = L4_20
    L4_20 = L4_20.setUserControlLock
    L4_20(L5_21, false)
  end
  L4_20 = GameDatabase
  L5_21 = L4_20
  L4_20 = L4_20.set
  L4_20(L5_21, ggd.GlobalSystemFlags__CityBgm, true)
  L4_20 = GameDatabase
  L5_21 = L4_20
  L4_20 = L4_20.set
  L4_20(L5_21, ggd.GlobalSystemFlags__CatWarpEnable, true)
  if not L2_18 then
    L4_20 = GameDatabase
    L5_21 = L4_20
    L4_20 = L4_20.get
    L4_20 = L4_20(L5_21, ggd.Savedata__EventFlags__eps09__flag01)
    if L4_20 == 0 then
      L4_20 = GameDatabase
      L5_21 = L4_20
      L4_20 = L4_20.get
      L4_20 = L4_20(L5_21, ggd.Savedata__EventManageFlags__CurrentFreeMode)
      if L4_20 == "ft09" then
      end
    else
      L4_20 = Fn_userCtrlOn
      L4_20()
    end
  end
  L4_20 = Player
  L5_21 = L4_20
  L4_20 = L4_20.isStayMode
  L4_20 = L4_20(L5_21)
  if L4_20 then
    L4_20 = Player
    L5_21 = L4_20
    L4_20 = L4_20.setStay
    L4_20(L5_21, false)
    L4_20 = debugPrintEventHeader
    L5_21 = "stay\231\138\182\230\133\139\227\129\174\227\129\190\227\129\190\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\140\227\130\175\227\131\170\227\130\162\227\131\187\227\131\170\227\130\191\227\130\164\227\130\162\227\129\149\227\130\140\227\129\159\227\130\136\227\129\134\227\129\170\227\129\174\227\129\167\227\128\129\227\129\147\227\129\147\227\129\167\232\167\163\233\153\164\227\129\151\227\129\190\227\129\153"
    L4_20(L5_21)
  end
  L4_20 = GameDatabase
  L5_21 = L4_20
  L4_20 = L4_20.get
  L4_20 = L4_20(L5_21, ggd.Savedata__EventManageFlags__CurrentFreeMode)
  L5_21 = __start_caption
  if L5_21 then
    L5_21 = true
    invokeTask(function()
      wait(15)
      if L4_20 == "ft09" then
        if GameDatabase:get(ggd.Savedata__EventFlags__eps09__flag01) == 0 then
          L5_21 = false
        end
      elseif L4_20 == "ft10" then
        if GameDatabase:get(ggd.Savedata__EventFlags__eps10__flag01) == 0 then
          L5_21 = false
        end
      elseif L4_20 == "ft15" then
        if Player:getRecentAreaName() == "dt_a_root" then
          L5_21 = false
        end
      elseif L4_20 == "ft16" and Player:getRecentAreaName() == "cc_a_root" then
        L5_21 = false
      end
      if L5_21 then
        Fn_captionView(__start_caption, 5)
      end
      __start_caption = nil
    end)
  else
  end
  if L4_20 == "ft03" then
    L5_21 = Fn_menuUnLockEp03
    L5_21()
  end
  L5_21 = HUD
  L5_21 = L5_21.menuSetCallback
  L5_21(L5_21, HUD.kCallback_ChallengeBattle, challengeBattle)
  L5_21 = HUD
  L5_21 = L5_21.menuSetCallback
  L5_21(L5_21, HUD.kCallback_DeleteTreasure, deleteTreasure)
  L5_21 = HUD
  L5_21 = L5_21.menuSetCallback
  L5_21(L5_21, HUD.kCallback_GenerateTreasure, generateTreasure)
  L5_21 = HUD
  L5_21 = L5_21.menuSetCallback
  L5_21(L5_21, HUD.kCallback_TreasureStart, treasureStart)
  L5_21 = HUD
  L5_21 = L5_21.menuSetCallback
  L5_21(L5_21, HUD.kCallback_MineBossNavi, setMineMarkerNavi)
  L5_21 = GameDatabase
  L5_21 = L5_21.get
  L5_21 = L5_21(L5_21, ggd.Savedata__EventManageFlags__LateMissionName)
  if string.find(L5_21, "treasure_") then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
    _lock_savemenu = false
    _autoSaveReq()
  end
end
function Finalize()
  local L0_42
  __finalize = true
  if L0_42 then
    if L0_42 then
      L0_42(L0_42)
    end
  end
  __delay_npc_create_task = nil
  if L0_42 then
    if L0_42 then
      L0_42(L0_42)
    end
  end
  __treasure_task = nil
  if L0_42 then
    if L0_42 then
      L0_42(L0_42)
    else
      L0_42(L0_42)
    end
  end
  __treasure_sb = nil
  if L0_42 then
    for _FORV_3_, _FORV_4_ in L0_42(__npc_same_list) do
      if _FORV_4_.mission ~= __select_mission_name and __npc_same_hdls[_FORV_4_.name] then
        debugPrintEventHeader(_FORV_4_.name .. "\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
        if __npc_same_hdls[_FORV_4_.name]:isRunning() then
          __npc_same_hdls[_FORV_4_.name]:try_term()
        else
          __npc_same_hdls[_FORV_4_.name]:kill()
        end
      end
    end
    for _FORV_3_, _FORV_4_ in L0_42(__npc_different_list) do
      if _FORV_4_.mission ~= __select_mission_name and __npc_different_hdls[_FORV_4_.name] then
        debugPrintEventHeader(_FORV_4_.name .. "\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
        if __npc_different_hdls[_FORV_4_.name]:isRunning() then
          __npc_different_hdls[_FORV_4_.name]:try_term()
        else
          __npc_different_hdls[_FORV_4_.name]:kill()
        end
      end
    end
  end
  L0_42(L0_42, HUD.kCallback_ChallengeMissionRankingSelect)
  L0_42(L0_42)
  L0_42(L0_42, HUD.kCallback_MineBossNavi)
  L0_42(L0_42, HUD.kCallback_MissionReplay)
  L0_42(L0_42, HUD.kCallback_ChallengeBattle)
  L0_42(L0_42, HUD.kCallback_DeleteTreasure)
  L0_42(L0_42, HUD.kCallback_GenerateTreasure)
  L0_42(L0_42, HUD.kCallback_TreasureStart)
  L0_42(L0_42, ggd.GlobalSystemFlags__Lively, false)
  L0_42(L0_42, ggd.Savedata__EventManageFlags__CityPlaceName, false)
  L0_42()
  L0_42(L0_42)
  while L0_42 == "eventheader" do
    if not (0 > 60) and not g_own:isStopped() then
      wait()
    end
  end
  if string.find(L0_42, "treasure_") then
    GameDatabase:set(ggd.GlobalSystemFlags__CityBgm, true)
  else
    GameDatabase:set(ggd.GlobalSystemFlags__CityBgm, false)
  end
end
function FinalizeHeaderSandbox()
  local L0_43, L1_44, L2_45, L3_46
  for L3_46 = 1, #L1_44 do
    if __sb_header_same[L3_46] and __sb_header_same[L3_46]:isRunning() then
      __sb_header_same[L3_46]:sendEvent("Finalize")
    end
  end
  __sb_header_same = L0_43
  for L3_46 = 1, #L1_44 do
    if __sb_header_different[L3_46] and __sb_header_different[L3_46]:isRunning() then
      __sb_header_different[L3_46]:sendEvent("Finalize")
    end
  end
  __sb_header_different = L0_43
end
function getGameDataBaseVal(A0_47)
  local L1_48
  L1_48 = ggd
  L1_48 = L1_48[A0_47]
  if L1_48 then
    return GameDatabase:get(L1_48)
  end
  return -1
end
function setGameDataBaseVal(A0_49, A1_50)
  local L2_51
  L2_51 = ggd
  L2_51 = L2_51[A0_49]
  if L2_51 then
    return GameDatabase:set(L2_51, A1_50)
  end
  return -1
end
function getMissionTarget(A0_52)
  local L1_53, L2_54, L3_55, L4_56
  L1_53 = nil
  L2_54 = false
  L3_55 = A0_52.chara
  if L3_55 ~= nil then
    L3_55 = A0_52.chara
    L3_55 = L3_55[1]
    if L3_55 then
      L3_55 = A0_52.chara
      L3_55 = L3_55[1]
      L1_53 = L3_55.node
    else
      L3_55 = A0_52.chara
      L1_53 = L3_55.node
    end
    L2_54 = true
  end
  L3_55 = A0_52.node
  if L3_55 ~= nil then
    L1_53 = A0_52.node
  end
  L3_55 = L1_53
  L4_56 = L2_54
  return L3_55, L4_56
end
function getMissionParam(A0_57)
  if A0_57.ggd then
    for _FORV_4_, _FORV_5_ in ipairs(A0_57.ggd) do
      if ggd[_FORV_5_.flag_name] and GameDatabase:get(ggd[_FORV_5_.flag_name]) == _FORV_5_.flag_value then
        return _FORV_5_
      end
    end
    return A0_57.ggd[#A0_57.ggd]
  end
  return A0_57
end
function challengeBattle(A0_58, A1_59)
  if A0_58 == nil and A1_59 == nil then
  else
    HUD:fadeout(0.5)
    debugPrintEventHeader("call challengeBattle " .. A0_58)
    GameDatabase:set(ggd.Savedata__EventManageFlags__MissionReplay, A0_58)
    GameDatabase:set(ggd.Savedata__EventManageFlags__MissionNotice, true)
    Fn_setNextMissionFlag(A0_58)
    Fn_nextMission()
    Fn_exitSandbox()
  end
end
function _createHeaderSandbox(A0_60, A1_61, A2_62)
  invokeSystemTask(function()
    local L0_63
    L0_63 = debugPrintEventHeader
    L0_63("\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185" .. A0_60 .. "\228\189\156\230\136\144\233\150\139\229\167\139")
    L0_63 = createSandbox2
    L0_63 = L0_63(A0_60)
    L0_63:setString("g_filename", A1_61)
    L0_63:try_init()
    L0_63:waitForReadyAsync(function(A0_64)
      L0_63:setGameObject("mother2", Fn_getGameObject("mother2"))
      L0_63:setGameObject("father2", Fn_getGameObject("father2"))
      L0_63:setGameObject("eventManager", Fn_getGameObject("eventManager"))
      L0_63:setGameObject("bgManager", Fn_getGameObject("bgManager"))
      L0_63:setGameObject("npcManager", Fn_getGameObject("npcManager"))
      L0_63:setGameObject("soundManager", Fn_getGameObject("soundManager"))
      L0_63:try_start()
    end)
    table.insert(A2_62, L0_63)
    debugPrintEventHeader("\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185" .. A0_60 .. "\228\189\156\230\136\144\231\181\130\228\186\134")
  end)
end
function _startHeaderSandbox(A0_65)
  local L1_66
  L1_66 = #A0_65
  if L1_66 > 0 then
    while true do
      for _FORV_6_ = 1, L1_66 do
        if A0_65[_FORV_6_]:isRunning() and A0_65[_FORV_6_]:sendEvent("isInitialized") then
        end
      end
      if _FOR_ or __finalize then
        debugPrintEventHeader("\229\136\157\230\156\159\229\140\150\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153")
        break
      end
      if 0 + 1 ~= L1_66 then
        wait()
      end
    end
    if __exit_sandbox or __finalize then
      debugPrintEventHeader("\231\148\159\230\136\144\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153 03")
      return
    end
    for _FORV_5_ = 1, L1_66 do
      A0_65[_FORV_5_]:sendEvent("areaWarpFinish")
    end
    while true do
      for _FORV_6_ = 1, L1_66 do
        if A0_65[_FORV_6_]:sendEvent("isReadyGameObject") then
        end
      end
      if _FOR_ or __finalize then
        debugPrintEventHeader("ready\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153")
        break
      end
      if 0 + 1 ~= L1_66 then
        wait()
      end
    end
    if __exit_sandbox or __finalize then
      debugPrintEventHeader("\231\148\159\230\136\144\228\184\173\227\129\171finalize\227\129\171\232\161\140\227\129\163\227\129\159\227\129\174\227\129\167task\227\130\146\230\138\156\227\129\145\227\129\190\227\129\153 04")
      return
    end
    for _FORV_5_ = 1, L1_66 do
      A0_65[_FORV_5_]:sendEvent("startGameObjects")
    end
    for _FORV_5_ = 1, L1_66 do
      A0_65[_FORV_5_]:sendEvent("sbRun")
    end
  end
end
function _analyzeMarkerList()
  local L0_67, L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81, L15_82
  L0_67(L1_68)
  for L3_70 = 1, 51 do
    L4_71 = setGameDataBaseVal
    L5_72 = "Savedata__Menu__EventLockFlags__sm"
    L5_72 = L5_72 .. L6_73
    L4_71(L5_72, L6_73)
  end
  for L3_70 = 1, 20 do
    L4_71 = setGameDataBaseVal
    L5_72 = "Savedata__Menu__EventLockFlags__cm"
    L5_72 = L5_72 .. L6_73
    L4_71(L5_72, L6_73)
  end
  L3_70 = {}
  L4_71 = {}
  L3_70.home = L4_71
  L4_71 = {}
  L3_70.mansion = L4_71
  L2_69.facility = L3_70
  L3_70 = {}
  L2_69.story = L3_70
  L3_70 = {}
  L2_69.side = L3_70
  L3_70 = {}
  L2_69.challenge = L3_70
  L3_70 = {}
  L2_69.mining = L3_70
  L3_70 = {}
  L4_71 = {}
  L5_72 = free_time_tbl
  L5_72 = L5_72[L6_73]
  if L6_73 then
    L6_73(L7_74, L8_75, L9_76)
    L7_74.node = "locator2_home"
    L7_74.evb = "city_marker"
    L6_73.home = L7_74
  end
  if L6_73 then
    L7_74.node = "locator2_mansion"
    L7_74.evb = "city_marker"
    L6_73.mansion = L7_74
  end
  if L6_73 then
    for L9_76 = 12, 21 do
      L10_77 = "Manhole"
      L11_78 = string
      L11_78 = L11_78.format
      L12_79 = "%02d"
      L13_80 = L9_76
      L11_78 = L11_78(L12_79, L13_80)
      L10_77 = L10_77 .. L11_78
      L11_78 = nil
      if L9_76 <= 14 then
        L11_78 = "manhole_po"
      elseif L9_76 > 14 and L9_76 <= 16 then
        L11_78 = "manhole_mi"
      elseif L9_76 == 17 then
        L11_78 = "manhole_lo"
      elseif L9_76 > 17 and L9_76 <= 20 then
        L11_78 = "manhole_up"
      else
        L11_78 = "manhole_ar"
      end
      L12_79 = L2_69.facility
      L13_80 = {}
      L14_81 = "locator2_"
      L15_82 = L10_77
      L14_81 = L14_81 .. L15_82
      L13_80.node = L14_81
      L13_80.evb = L11_78
      L12_79[L10_77] = L13_80
      L12_79 = L2_69.facility
      L13_80 = L10_77
      L14_81 = "_warp"
      L13_80 = L13_80 .. L14_81
      L14_81 = {}
      L15_82 = "locator2_"
      L15_82 = L15_82 .. L10_77 .. "_warp"
      L14_81.node = L15_82
      L14_81.evb = L11_78
      L12_79[L13_80] = L14_81
    end
  end
  if L6_73 then
    for L9_76 = 1, 11 do
      L10_77 = "Manhole"
      L11_78 = string
      L11_78 = L11_78.format
      L12_79 = "%02d"
      L13_80 = L9_76
      L11_78 = L11_78(L12_79, L13_80)
      L10_77 = L10_77 .. L11_78
      L11_78 = nil
      if L9_76 <= 3 then
        L11_78 = "manhole_cc"
      elseif L9_76 > 3 and L9_76 <= 6 then
        L11_78 = "manhole_ed"
      elseif L9_76 > 6 and L9_76 <= 8 then
        L11_78 = "manhole_id"
      else
        L11_78 = "manhole_dt"
      end
      L12_79 = L2_69.facility
      L13_80 = {}
      L14_81 = "locator2_"
      L15_82 = L10_77
      L14_81 = L14_81 .. L15_82
      L13_80.node = L14_81
      L13_80.evb = L11_78
      L12_79[L10_77] = L13_80
      L12_79 = L2_69.facility
      L13_80 = L10_77
      L14_81 = "_warp"
      L13_80 = L13_80 .. L14_81
      L14_81 = {}
      L15_82 = "locator2_"
      L15_82 = L15_82 .. L10_77 .. "_warp"
      L14_81.node = L15_82
      L14_81.evb = L11_78
      L12_79[L13_80] = L14_81
    end
  end
  if L6_73 then
    if L9_76 then
    else
    end
    L10_77 = L5_72.story
    L11_78 = "_setup"
    L10_77 = L10_77 .. L11_78
    L11_78 = L5_72.story
    L12_79 = "_setup"
    L11_78 = L11_78 .. L12_79
    L12_79 = false
    L13_80 = "locator2_retire_pos"
    L14_81 = GameDatabase
    L15_82 = L14_81
    L14_81 = L14_81.get
    L14_81 = L14_81(L15_82, ggd.GlobalSystemFlags__GameRetire)
    if not L14_81 then
      L14_81 = GameDatabase
      L15_82 = L14_81
      L14_81 = L14_81.get
      L14_81 = L14_81(L15_82, ggd.GlobalSystemFlags__GameClear)
    elseif L14_81 then
      L14_81 = GameDatabase
      L15_82 = L14_81
      L14_81 = L14_81.get
      L14_81 = L14_81(L15_82, ggd.Savedata__EventManageFlags__MissionReplay)
      if L14_81 == "None" then
        L14_81 = GameDatabase
        L15_82 = L14_81
        L14_81 = L14_81.get
        L14_81 = L14_81(L15_82, ggd.Savedata__EventManageFlags__LateMissionName)
        L15_82 = string
        L15_82 = L15_82.match
        L15_82 = L15_82(L14_81, "(.-)_()")
        if L15_82 == nil then
          L15_82 = L14_81
        end
        L11_78 = L15_82 .. "_setup"
        L12_79 = true
        if free_setting_tbl[L15_82] then
          if getMissionParam(free_setting_tbl[L15_82]).retire_node then
            L13_80 = getMissionParam(free_setting_tbl[L15_82]).retire_node
          end
          debugPrintEventHeader("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\130\146\227\131\170\227\130\191\227\130\164\227\130\162or\227\130\175\227\131\170\227\130\162\227\129\151\227\129\159\227\129\174\227\129\167\232\191\189\229\138\160\227\129\167 " .. L11_78 .. ".evb \227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\128\129\227\129\157\227\129\174" .. L13_80 .. "\227\130\146locator2_pc_start_pos\227\129\171\227\129\151\227\129\190\227\129\153")
        else
          debugPrintEventHeader(L15_82 .. "\227\129\175free_setting_tbl\227\129\171\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\227\131\149\227\131\170\227\131\188\227\130\191\227\130\164\227\131\160\227\129\174\229\136\157\230\156\159\228\189\141\231\189\174\227\129\167\227\129\153")
        end
      end
    end
    L14_81 = GameDatabase
    L15_82 = L14_81
    L14_81 = L14_81.get
    L14_81 = L14_81(L15_82, ggd.GlobalSystemFlags__GameRetire)
    if L14_81 then
      __costume_reset = true
    end
    L14_81 = GameDatabase
    L15_82 = L14_81
    L14_81 = L14_81.set
    L14_81(L15_82, ggd.GlobalSystemFlags__GameRetire, false)
    L14_81 = GameDatabase
    L15_82 = L14_81
    L14_81 = L14_81.set
    L14_81(L15_82, ggd.GlobalSystemFlags__GameClear, false)
    L14_81 = L2_69.story
    L15_82 = L5_72.story
    L14_81[L15_82] = {
      node = L7_74,
      contact = L8_75,
      evb = L10_77,
      evb2 = L11_78,
      retire = L12_79,
      retire_node = L13_80
    }
    if L9_76 then
      L14_81 = L5_72.story
      L15_82 = {}
      L15_82.name = L9_76
      L15_82.path = "/Game/Event2/Mission/" .. L9_76 .. ".lua"
      L15_82.same_list = true
      L3_70[L14_81] = L15_82
    end
    if L8_75 then
      L14_81 = L5_72.story
      L15_82 = L6_73.chara
      L4_71[L14_81] = L15_82
    end
    L14_81 = L6_73.opt
    if L14_81 then
      L14_81 = L2_69.story
      L15_82 = L5_72.story
      L14_81 = L14_81[L15_82]
      L15_82 = L6_73.opt
      L15_82 = L15_82.caption
      L14_81.caption = L15_82
    end
  end
  L7_74(L8_75)
  for L10_77, L11_78 in L7_74(L8_75) do
    L12_79 = L6_73
    L13_80 = L11_78
    L14_81 = getMissionParam
    L15_82 = free_setting_tbl
    L15_82 = L15_82[L11_78]
    L14_81 = L14_81(L15_82)
    L15_82 = false
    L12_79(L13_80, L14_81, L15_82)
  end
  L7_74(L8_75)
  for L10_77, L11_78 in L7_74(L8_75) do
    L12_79 = L6_73
    L13_80 = L11_78
    L14_81 = getMissionParam
    L15_82 = free_setting_tbl
    L15_82 = L15_82[L11_78]
    L14_81 = L14_81(L15_82)
    L15_82 = true
    L12_79(L13_80, L14_81, L15_82)
  end
  L10_77 = false
  L7_74(L8_75, L9_76, L10_77)
  L10_77 = "None"
  L7_74(L8_75, L9_76, L10_77)
  L7_74(L8_75)
  for L10_77, L11_78 in L7_74(L8_75) do
    L12_79 = unlock_mission_tbl
    L12_79 = L12_79[L11_78]
    if L12_79 then
      L12_79 = getGameDataBaseVal
      L13_80 = "Savedata__EventFinishedFlags__"
      L14_81 = unlock_mission_tbl
      L14_81 = L14_81[L11_78]
      L13_80 = L13_80 .. L14_81
      L12_79 = L12_79(L13_80)
      if L12_79 == 0 then
        L12_79 = debugPrintEventHeader
        L13_80 = L11_78
        L14_81 = "\227\129\175"
        L15_82 = unlock_mission_tbl
        L15_82 = L15_82[L11_78]
        L13_80 = L13_80 .. L14_81 .. L15_82 .. "\227\129\140\227\130\175\227\131\170\227\130\162\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\228\189\156\227\130\138\227\129\190\227\129\155\227\130\147"
        L12_79(L13_80)
      else
        L12_79 = setGameDataBaseVal
        L13_80 = "Savedata__Menu__EventLockFlags__"
        L14_81 = L11_78
        L13_80 = L13_80 .. L14_81
        L14_81 = false
        L12_79(L13_80, L14_81)
        L12_79 = getMissionTarget
        L13_80 = getMissionParam
        L14_81 = free_setting_tbl
        L14_81 = L14_81[L11_78]
        L15_82 = L13_80(L14_81)
        L13_80 = L12_79(L13_80, L14_81, L15_82, L13_80(L14_81))
        L14_81 = L2_69.challenge
        L15_82 = {}
        L15_82.node = L12_79
        L15_82.contact = L13_80
        L15_82.evb = L11_78 .. "_setup"
        L14_81[L11_78] = L15_82
        L14_81 = debugPrintEventHeader
        L15_82 = L11_78
        L15_82 = L15_82 .. "\227\130\146\228\189\156\227\130\138\227\129\190\227\129\153 : " .. L12_79
        L14_81(L15_82)
      end
    else
      L12_79 = setGameDataBaseVal
      L13_80 = "Savedata__Menu__EventLockFlags__"
      L14_81 = L11_78
      L13_80 = L13_80 .. L14_81
      L14_81 = false
      L12_79(L13_80, L14_81)
      L12_79 = getMissionTarget
      L13_80 = getMissionParam
      L14_81 = free_setting_tbl
      L14_81 = L14_81[L11_78]
      L15_82 = L13_80(L14_81)
      L13_80 = L12_79(L13_80, L14_81, L15_82, L13_80(L14_81))
      L14_81 = L2_69.challenge
      L15_82 = {}
      L15_82.node = L12_79
      L15_82.contact = L13_80
      L15_82.evb = L11_78 .. "_setup"
      L14_81[L11_78] = L15_82
      L14_81 = debugPrintEventHeader
      L15_82 = L11_78
      L15_82 = L15_82 .. "\227\130\146\228\189\156\227\130\138\227\129\190\227\129\153 : " .. L12_79
      L14_81(L15_82)
    end
  end
  if L7_74 then
    for L10_77, L11_78 in L7_74(L8_75) do
      L12_79 = getMissionTarget
      L13_80 = getMissionParam
      L14_81 = free_setting_tbl
      L14_81 = L14_81[L11_78]
      L15_82 = L13_80(L14_81)
      L13_80 = L12_79(L13_80, L14_81, L15_82, L13_80(L14_81))
      if L1_68 == true and L11_78 == "mine_bu" or L1_68 == true and L11_78 == "mine_po" or L0_67 == true and L11_78 == "mine_hx" then
        L14_81 = debugPrintEventHeader
        L15_82 = "\230\142\161\230\142\152\227\129\174\231\170\147\229\143\163\227\129\171\227\130\181\227\130\164\227\131\137\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\140\232\168\173\229\174\154\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153 \239\188\154 "
        L15_82 = L15_82 .. L11_78
        L14_81(L15_82)
        L14_81 = copyFreeSettingTable
        L15_82 = free_setting_tbl
        L15_82 = L15_82[L11_78]
        L15_82 = L15_82.chara
        L14_81 = L14_81(L15_82)
        L4_71[L11_78] = L14_81
      else
        L14_81 = getMissionTarget
        L15_82 = getMissionParam
        L15_82 = L15_82(free_setting_tbl[L11_78])
        L15_82 = L14_81(L15_82, L15_82(free_setting_tbl[L11_78]))
        L2_69.mining[L11_78] = {
          node = L14_81,
          contact = L15_82,
          evb = L11_78 .. "_setup"
        }
        if L15_82 then
          L4_71[L11_78] = copyFreeSettingTable(free_setting_tbl[L11_78].chara)
        end
        debugPrintEventHeader(L11_78 .. "\227\130\146\228\189\156\227\130\138\227\129\190\227\129\153 : " .. L14_81)
      end
    end
  end
  L7_74(L8_75)
  return L7_74, L8_75, L9_76
end
function _findNodeTransform(A0_83, A1_84, A2_85)
  local L3_86, L4_87, L5_88, L6_89, L7_90
  L4_87 = A0_83
  L3_86 = A0_83.findParentBundle
  L5_88 = A1_84
  L3_86 = L3_86(L4_87, L5_88)
  if L3_86 then
    L5_88 = L3_86
    L4_87 = L3_86.getString
    L6_89 = "areaname"
    L4_87 = L4_87(L5_88, L6_89)
    if L4_87 then
      L5_88 = nil
      if A2_85 then
        L7_90 = A0_83
        L6_89 = A0_83.findBundle
        L6_89 = L6_89(L7_90, A2_85, true)
        L5_88 = L6_89
      else
        L7_90 = A0_83
        L6_89 = A0_83.findBundle
        L6_89 = L6_89(L7_90, A1_84, true)
        L5_88 = L6_89
      end
      if L5_88 then
        L7_90 = L3_86
        L6_89 = L3_86.worldToLocal
        L7_90 = L6_89(L7_90, L5_88:getTranslation(), L5_88:getRotation())
        return L6_89, L7_90, L4_87
      end
    else
      L5_88 = debugPrintEventHeader
      L6_89 = "warning : "
      L7_90 = A1_84
      L6_89 = L6_89 .. L7_90 .. "\227\129\174\232\166\170\227\129\175evarea2\227\129\167\227\129\175\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\227\130\130\227\129\134\228\184\128\233\154\142\229\177\164\228\184\138\227\130\146\232\170\191\227\129\185\227\129\190\227\129\153"
      L5_88(L6_89)
      L5_88 = _findNodeTransform
      L6_89 = A0_83
      L7_90 = L3_86.getName
      L7_90 = L7_90(L3_86)
      return L5_88(L6_89, L7_90, A1_84)
    end
  end
  L4_87 = nil
  return L4_87
end
function _setDeactiveMarker(A0_91, A1_92, A2_93)
  local L3_94
  L3_94 = __deactive_marker
  if L3_94 then
    L3_94 = {}
    L3_94.sensor = A0_91
    L3_94.marker = A1_92
    L3_94.marker2 = A2_93
    table.insert(__deactive_marker_list, L3_94)
    if A0_91 then
      A0_91:setActive(false)
    end
    if A1_92 then
      A1_92:playOut()
    end
    if A2_93 then
      A2_93:playOut()
    end
  end
end
function _setDeactiveMarkerOn()
  local L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102
  if L0_95 then
    for L3_98, L4_99 in L0_95(L1_96) do
      L5_100 = L4_99.sensor
      L6_101 = L5_100
      L5_100 = L5_100.getName
      L5_100 = L5_100(L6_101)
      L6_101 = string
      L6_101 = L6_101.find
      L7_102 = L5_100
      L6_101 = L6_101(L7_102, "Manhole")
      if L6_101 ~= nil then
        L6_101 = string
        L6_101 = L6_101.match
        L7_102 = L5_100
        L6_101 = L6_101(L7_102, "Manhole%d+")
        if L6_101 then
          L7_102 = ggd
          L7_102 = L7_102["Savedata__Menu__ManholeFlags__" .. L6_101]
          if L7_102 then
            if GameDatabase:get(L7_102) then
              if string.find(L5_100, "_before") == nil then
                debugPrintEventHeader(tostring(L5_100) .. "\227\130\146\230\156\137\229\138\185\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
                L4_99.sensor:setActive(true)
                L4_99.marker:playIn()
              end
            elseif string.find(L5_100, "_before") ~= nil then
              debugPrintEventHeader(tostring(L5_100) .. "\227\130\146\230\156\137\229\138\185\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
              L4_99.sensor:setActive(true)
              L4_99.marker:playIn()
            end
          end
        end
      elseif L5_100 == "marker_node_ep21_sensor" then
        L6_101 = GameDatabase
        L7_102 = L6_101
        L6_101 = L6_101.get
        L6_101 = L6_101(L7_102, ggd.Savedata__Menu__EventStateFlags__ep21)
        if L6_101 > 0 then
          L6_101 = debugPrintEventHeader
          L7_102 = tostring
          L7_102 = L7_102(L5_100)
          L7_102 = L7_102 .. "\227\130\146\230\156\137\229\138\185\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159"
          L6_101(L7_102)
          L6_101 = L4_99.sensor
          L7_102 = L6_101
          L6_101 = L6_101.setActive
          L6_101(L7_102, true)
          L6_101 = L4_99.marker
          L7_102 = L6_101
          L6_101 = L6_101.playIn
          L6_101(L7_102)
          L6_101 = L4_99.marker2
          if L6_101 then
            L6_101 = L4_99.marker2
            L7_102 = L6_101
            L6_101 = L6_101.playIn
            L6_101(L7_102)
          end
        else
          L6_101 = debugPrintEventHeader
          L7_102 = tostring
          L7_102 = L7_102(L5_100)
          L7_102 = L7_102 .. "\227\129\175Savedata__Menu__EventStateFlags__ep21\227\129\1400\227\129\170\227\129\174\227\129\167\230\156\137\229\138\185\227\129\171\227\129\151\227\129\190\227\129\155\227\130\147"
          L6_101(L7_102)
        end
      else
        L6_101 = debugPrintEventHeader
        L7_102 = tostring
        L7_102 = L7_102(L5_100)
        L7_102 = L7_102 .. "\227\130\146\230\156\137\229\138\185\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159"
        L6_101(L7_102)
        L6_101 = L4_99.sensor
        L7_102 = L6_101
        L6_101 = L6_101.setActive
        L6_101(L7_102, true)
        L6_101 = L4_99.marker
        L7_102 = L6_101
        L6_101 = L6_101.playIn
        L6_101(L7_102)
        L6_101 = L4_99.marker2
        if L6_101 then
          L6_101 = L4_99.marker2
          L7_102 = L6_101
          L6_101 = L6_101.playIn
          L6_101(L7_102)
        end
      end
    end
    __deactive_marker_list = L0_95
    L0_95(L1_96)
  end
  __deactive_marker = false
end
function _createMakerNode(A0_103, A1_104, A2_105)
  local L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120, L18_121, L19_122, L20_123, L21_124, L22_125, L23_126
  L3_106 = 0
  L4_107 = {}
  L5_108 = false
  L6_109 = {}
  L7_110 = {}
  L8_111 = {}
  L9_112 = {}
  for L13_116, L14_117 in L10_113(L11_114) do
    if L16_119 then
      L19_122 = L14_117.evb2
      if L15_118 == nil then
        L19_122 = L14_117.evb
        L20_123 = "\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\129\190\227\129\153"
        L16_119(L17_120)
        L14_117.retire = false
      end
    end
    if L15_118 == nil then
      L19_122 = L14_117.evb
    end
    if L15_118 then
      L16_119(L17_120)
      if L16_119 then
        L19_122 = nil
        L20_123 = L14_117.retire
        if L20_123 then
          L20_123 = _findNodeTransform
          L21_124 = L16_119
          L22_125 = L14_117.retire_node
          L22_125 = L20_123(L21_124, L22_125)
          L19_122 = L22_125
          if L17_120 == nil then
            L20_123 = _findNodeTransform
            L21_124 = L16_119
            L22_125 = "locator2_pc_start_pos"
            L22_125 = L20_123(L21_124, L22_125)
            L19_122 = L22_125
          end
        else
          L20_123 = _findNodeTransform
          L21_124 = L16_119
          L22_125 = "locator2_pc_start_pos"
          L22_125 = L20_123(L21_124, L22_125)
          L19_122 = L22_125
        end
        if L17_120 then
          L20_123 = {}
          L20_123.pos = L17_120
          L20_123.rot = L18_121
          L20_123.area = L19_122
          L20_123.name = "locator2_pc_start_pos"
          L4_107 = L20_123
        end
      end
    end
  end
  for L13_116, L14_117 in L10_113(L11_114) do
    for L18_121, L19_122 in L15_118(L16_119) do
      L20_123 = L19_122.evb
      if L20_123 ~= nil then
        L3_106 = L3_106 + 1
        L20_123 = invokeSystemTask
        function L21_124()
          local L0_127, L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135, L9_136
          L0_127 = debugPrintEventHeader
          L1_128 = "\227\131\158\227\131\188\227\130\171\227\131\188\228\189\156\230\136\144\227\129\174\227\130\191\227\130\185\227\130\175\229\174\159\232\161\140"
          L2_129 = tostring
          L3_130 = L19_122.evb
          L2_129 = L2_129(L3_130)
          L1_128 = L1_128 .. L2_129
          L0_127(L1_128)
          L0_127 = loadFileAsset
          L1_128 = "evb"
          L2_129 = "evx/"
          L3_130 = L19_122.evb
          L2_129 = L2_129 .. L3_130
          L0_127 = L0_127(L1_128, L2_129)
          if not L0_127 then
            L1_128 = debugPrintEventHeader
            L2_129 = L19_122.evb
            L3_130 = "\227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
            L2_129 = L2_129 .. L3_130
            L1_128(L2_129)
            L1_128 = L3_106
            L1_128 = L1_128 - 1
            L3_106 = L1_128
            return
          end
          L2_129 = L0_127
          L1_128 = L0_127.wait
          L1_128(L2_129)
          L2_129 = L0_127
          L1_128 = L0_127.getRoot
          L1_128 = L1_128(L2_129)
          if not L1_128 then
            L0_127 = nil
            L2_129 = L3_106
            L2_129 = L2_129 - 1
            L3_106 = L2_129
            return
          end
          L2_129 = L19_122.evb
          if L2_129 ~= "city_marker" then
            L2_129 = _findNodeTransform
            L3_130 = L1_128
            L4_131 = L19_122.node
            L4_131 = L2_129(L3_130, L4_131)
            if L2_129 then
              if L5_132 == "facility" then
                L5_132.pos = L2_129
                L5_132.rot = L3_130
                L5_132.area = L4_131
                L5_132.name = L6_133
                L19_122.new_node = L5_132
              else
                L5_132.pos = L2_129
                L5_132.rot = L3_130
                L5_132.area = L4_131
                L5_132.name = L6_133
                L19_122.new_node = L5_132
              end
            else
              L8_135 = 0
              L9_136 = 0
              L5_132.pos = L6_133
              L8_135 = 0
              L9_136 = 0
              L5_132.rot = L6_133
              L5_132.area = nil
              L5_132.name = L6_133
              L19_122.new_node = L5_132
              L8_135 = ".evb \229\134\133\227\129\174 evarea2 \227\129\174\227\129\169\227\129\147\227\129\139\227\129\171 areaname \227\129\171\232\168\173\229\174\154\230\188\143\227\130\140\227\129\140\227\129\130\227\130\138\227\129\190\227\129\153\227\128\130"
              L5_132(L6_133)
            end
            if L5_132 then
              if L5_132 ~= true then
                if L5_132 == L6_133 then
                  L8_111[L5_132] = L6_133
                else
                  L9_112[L5_132] = L6_133
                end
              end
            end
            if L5_132 then
              if L5_132 then
                for L8_135, L9_136 in L5_132(L6_133) do
                  if L8_135 == 1 then
                    L9_136.node = L19_122.new_node.name
                    L9_136.pos = L2_129
                    L9_136.rot = L3_130
                    L9_136.area = L4_131
                    L9_136.mission = L18_121
                    if L19_122.new_node.area == L4_107.area then
                      table.insert(L6_109, copyFreeSettingTable(L9_136))
                    else
                      table.insert(L7_110, copyFreeSettingTable(L9_136))
                    end
                  elseif _findNodeTransform(L1_128, L9_136.node) then
                    L9_136.area, L9_136.rot, L9_136.pos, L9_136.node = _findNodeTransform(L1_128, L9_136.node)
                    L9_136.area, L9_136.rot, L9_136.pos, L9_136.node = _findNodeTransform(L1_128, L9_136.node)
                    L9_136.mission = L18_121
                    if _findNodeTransform(L1_128, L9_136.node) == L4_107.area then
                      table.insert(L6_109, copyFreeSettingTable(L9_136))
                    else
                      table.insert(L7_110, copyFreeSettingTable(L9_136))
                    end
                  end
                end
              else
                L5_132.node = L6_133
                L5_132.pos = L2_129
                L5_132.rot = L3_130
                L5_132.area = L4_131
                L5_132.mission = L6_133
                if L5_132 == L6_133 then
                  L8_135 = L18_121
                  L8_135 = A1_104[L8_135]
                  L9_136 = L7_134(L8_135)
                  L5_132(L6_133, L7_134, L8_135, L9_136, L7_134(L8_135))
                else
                  L8_135 = L18_121
                  L8_135 = A1_104[L8_135]
                  L9_136 = L7_134(L8_135)
                  L5_132(L6_133, L7_134, L8_135, L9_136, L7_134(L8_135))
                end
              end
            end
          else
            L2_129 = L5_108
            if not L2_129 then
              L2_129 = EventData
              L3_130 = L2_129
              L2_129 = L2_129.create
              L4_131 = L19_122.evb
              L2_129(L3_130, L4_131, L5_132, L6_133)
              L2_129 = true
              L5_108 = L2_129
            end
          end
          L0_127 = nil
          L2_129 = L3_106
          L2_129 = L2_129 - 1
          L3_106 = L2_129
          L2_129 = debugPrintEventHeader
          L3_130 = "\227\131\158\227\131\188\227\130\171\227\131\188\228\189\156\230\136\144\227\129\174\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134"
          L4_131 = tostring
          L4_131 = L4_131(L5_132)
          L3_130 = L3_130 .. L4_131
          L2_129(L3_130)
        end
        L20_123(L21_124)
      else
      end
    end
    break
  end
  repeat
    L10_113()
  until L3_106 == 0
  for L13_116, L14_117 in L10_113(L11_114) do
    if L15_118 then
      L8_111[L13_116] = L14_117
    end
  end
  L10_113(L11_114)
  if L4_107 then
    L10_113[L11_114] = L12_115
    L14_117 = "Node"
    L14_117 = L13_116.setName
    L14_117(L15_118, L16_119)
    L14_117 = L12_115.appendChild
    L14_117(L15_118, L16_119)
    L14_117 = L13_116.setTransform
    L14_117(L15_118, L16_119, L17_120)
    L4_107.hdl = L13_116
  end
  for L14_117, L15_118 in L11_114(L12_115) do
    for L19_122, L20_123 in L16_119(L17_120) do
      L21_124 = L20_123.new_node
      if L21_124 then
        L21_124 = L20_123.new_node
        L21_124 = L21_124.area
        L22_125 = nil
        L23_126 = L10_113[L21_124]
        if L23_126 == nil then
          if L21_124 then
            L23_126 = Fn_findAreaHandle
            L23_126 = L23_126(L21_124)
            L22_125 = L23_126
            L10_113[L21_124] = L22_125
          end
        else
          L22_125 = L10_113[L21_124]
        end
        L23_126 = createGameObject2
        L23_126 = L23_126("Node")
        L23_126:setName(L20_123.new_node.name)
        if L22_125 then
          L22_125:appendChild(L23_126)
        elseif L21_124 then
          debugPrintEventHeader(L21_124 .. "\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129" .. L19_122 .. " \227\129\175\229\164\137\227\129\170\228\189\141\231\189\174\227\129\171\233\133\141\231\189\174\227\129\149\227\130\140\227\129\190\227\129\153")
        else
          debugPrintEventHeader(L20_123.new_node.name .. "\227\130\146\232\168\173\231\189\174\227\129\153\227\130\139\227\130\168\227\131\170\227\130\162\227\129\140\230\164\156\231\180\162\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159")
        end
        L23_126:setTransform(L20_123.new_node.pos, L20_123.new_node.rot)
        L20_123.new_node.hdl = L23_126
      end
    end
  end
  for L14_117, L15_118 in L11_114(L12_115) do
    for L19_122, L20_123 in L16_119(L17_120) do
      if L19_122 == 1 then
      else
        L21_124 = L20_123.area
        L22_125 = nil
        L23_126 = L10_113[L21_124]
        if L23_126 == nil then
          if L21_124 then
            L23_126 = Fn_findAreaHandle
            L23_126 = L23_126(L21_124)
            L22_125 = L23_126
            L10_113[L21_124] = L22_125
          end
        else
          L22_125 = L10_113[L21_124]
        end
        L23_126 = createGameObject2
        L23_126 = L23_126("Node")
        L23_126:setName(L20_123.node)
        if L22_125 then
          L22_125:appendChild(L23_126)
        elseif L21_124 then
          debugPrintEventHeader(L21_124 .. "\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\229\164\137\227\129\170\228\189\141\231\189\174\227\129\171\233\133\141\231\189\174\227\129\149\227\130\140\227\129\190\227\129\153")
        else
          debugPrintEventHeader(L14_117 .. "\227\130\146\232\168\173\231\189\174\227\129\153\227\130\139\227\130\168\227\131\170\227\130\162\227\129\140\230\164\156\231\180\162\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159")
        end
        L23_126:setTransform(L20_123.pos, L20_123.rot)
        L20_123.hdl = L23_126
      end
    end
  end
  L14_117 = L9_112
  return L11_114, L12_115, L13_116, L14_117
end
function _warpMarkerNode(A0_137)
  local L1_138, L2_139, L3_140, L4_141, L5_142
  function L1_138(A0_143, A1_144, A2_145, A3_146)
    local L4_147, L5_148, L6_149
    L4_147 = findGameObject2
    L5_148 = "Node"
    L6_149 = A2_145
    L4_147 = L4_147(L5_148, L6_149)
    if L4_147 then
      L6_149 = L4_147
      L5_148 = L4_147.getWorldPos
      L5_148 = L5_148(L6_149)
      L6_149 = A1_144.DistanceTo
      L6_149 = L6_149(A1_144, L5_148)
      if L6_149 < 0 then
        L6_149 = L6_149 * 1
      end
      if L6_149 < 1.5 then
        debugPrintEventHeader(A2_145 .. A3_146 .. " : " .. tostring(L6_149))
        A0_143:appendChild(L4_147)
        L4_147:setTransform(Vector(3, 0, 0), Quaternion(0, 0, 0, 1))
        L4_147:setForceMove()
        L4_147:getParent():appendChild(L4_147, true)
        return true
      end
    end
  end
  L2_139 = A0_137.facility
  L2_139 = L2_139.home
  L2_139 = L2_139.node
  if L2_139 then
    L2_139 = findGameObject2
    L3_140 = "Node"
    L2_139 = L2_139(L3_140, L4_141)
    if L2_139 then
      L3_140 = L2_139.getWorldPos
      L3_140 = L3_140(L4_141)
      for _FORV_7_, _FORV_8_ in L4_141(L5_142) do
        L1_138(L2_139, L3_140, _FORV_8_.new_node.name, "\227\129\175\229\156\159\231\174\161\227\129\174\229\174\182\227\129\171\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153")
      end
      for _FORV_7_, _FORV_8_ in L4_141(L5_142) do
        L1_138(L2_139, L3_140, _FORV_8_.new_node.name, "\227\129\175\229\156\159\231\174\161\227\129\174\229\174\182\227\129\171\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153")
      end
    end
  end
  L2_139 = A0_137.facility
  L2_139 = L2_139.mansion
  L2_139 = L2_139.node
  if L2_139 then
    L2_139 = findGameObject2
    L3_140 = "Node"
    L2_139 = L2_139(L3_140, L4_141)
    L3_140 = findGameObject2
    L3_140 = L3_140(L4_141, L5_142)
    if L2_139 and L3_140 then
      for _FORV_9_, _FORV_10_ in pairs(A0_137.side) do
        if L1_138(L3_140, L5_142, _FORV_10_.new_node.name, "\227\129\175\229\164\162\232\166\139\227\129\174\233\164\168\227\129\171\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153") then
        end
      end
      for _FORV_9_, _FORV_10_ in pairs(A0_137.challenge) do
        if L1_138(L3_140, L5_142, _FORV_10_.new_node.name, "\227\129\175\229\164\162\232\166\139\227\129\174\233\164\168\227\129\171\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153") then
        end
      end
      if L4_141 then
        debugPrintEventHeader("\229\164\162\232\166\139\227\129\174\233\164\168\227\129\174\227\131\158\227\131\188\227\130\171\227\131\188\227\130\146\231\167\187\229\139\149\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
        L2_139:setWorldPos(L3_140:getWorldPos())
        L2_139:setForceMove()
      end
    end
  end
end
function _createHomeMaker(A0_150)
  local L1_151, L2_152, L3_153, L4_154, L5_155, L6_156, L7_157, L8_158
  L1_151 = findGameObject2
  L2_152 = "Node"
  L3_153 = A0_150
  L1_151 = L1_151(L2_152, L3_153)
  if not L1_151 then
    return
  end
  L2_152 = {}
  L2_152.target = L1_151
  L3_153 = Vector
  L4_154 = 1.2
  L5_155 = 1.2
  L6_156 = 1.2
  L3_153 = L3_153(L4_154, L5_155, L6_156)
  L2_152.size = L3_153
  L2_152.type_cylinder = true
  L3_153 = {}
  L3_153.name = "gui_marker_08"
  L3_153.ad_title_id = "ui_acdialog_main_hm01"
  L3_153.ad_sub_id = "ui_acdialog_sub_09"
  L3_153.map_title_id = "ui_map_msinfo_main_hm01"
  L3_153.map_sub_id = "ui_map_msinfo_header_09"
  L3_153.giude_id = "ui_keyguide_ac_07"
  L3_153.pattern = "default"
  L3_153.map_disp = true
  function L4_154()
    local L0_159, L1_160
    L0_159 = debugPrintEventHeader
    L1_160 = "\227\131\155\227\131\188\227\131\160\229\174\159\232\161\140"
    L0_159(L1_160)
    L0_159 = Player
    L1_160 = L0_159
    L0_159 = L0_159.setAbility
    L0_159(L1_160, Player.kAbility_FirstPersonView, false)
    L0_159 = Fn_userCtrlAllOff
    L0_159()
    L0_159 = HUD
    L1_160 = L0_159
    L0_159 = L0_159.navisSetMaskFromDemo
    L0_159(L1_160, true)
    L0_159 = Fn_blackout
    L0_159()
    L0_159 = Area
    L1_160 = L0_159
    L0_159 = L0_159.setForceSceneParams
    L0_159(L1_160, "cc_a_home")
    L0_159 = Fn_getPlayer
    L0_159 = L0_159()
    L1_160 = MyHome
    L1_160 = L1_160.create
    L1_160 = L1_160()
    __my_home = L1_160
    L1_160 = __my_home
    L1_160 = L1_160._AllReloadMotionKit
    L1_160(L1_160)
    repeat
      L1_160 = wait
      L1_160()
      L1_160 = __my_home
      L1_160 = L1_160.isReady
      L1_160 = L1_160(L1_160)
    until L1_160
    L1_160 = Player
    L1_160 = L1_160.setSpecialTuning
    L1_160(L1_160, Player.kSpecialTuning_AtHome)
    L1_160 = Player
    L1_160 = L1_160.setAttrTune
    L1_160(L1_160, Player.kAttrTune_Normal, true)
    L1_160 = Fn_setCatActive
    L1_160(false)
    L1_160 = Player
    L1_160 = L1_160.setStay
    L1_160(L1_160, true, true)
    L1_160 = __my_home
    L1_160 = L1_160.run
    L1_160(L1_160)
    L1_160 = Camera
    L1_160 = L1_160.addHomeCamera
    L1_160(L1_160, findGameObject2("Node", "locator2_home_cam_01"), findGameObject2("Node", "locator2_home_aim_01"), 30)
    function L1_160(A0_161)
      HUD:enablePhotoMode(false)
      if A0_161 == HUD.kSelectItem_Home_Warp then
        debugPrintEventHeader("homeClosedCallback = " .. A0_161)
        __home_manhole = true
        invokeTask(function()
          local L0_162
          L0_162 = debugPrintEventHeader
          L0_162("\227\131\158\227\131\179\227\131\155\227\131\188\227\131\171\231\167\187\229\139\149\229\174\159\232\161\140")
          L0_162 = HUD
          L0_162 = L0_162.menuOpen
          L0_162(L0_162, "Main", "Manhole")
          L0_162 = wait
          L0_162()
          L0_162 = debugPrintEventHeader
          L0_162("\227\131\158\227\131\179\227\131\155\227\131\188\227\131\171\227\131\175\227\131\188\227\131\151\231\148\187\233\157\162\231\181\130\228\186\134")
          L0_162 = HUD
          L0_162 = L0_162.getManholeWarpTarget
          L0_162 = L0_162(L0_162)
          if L0_162 ~= "" then
            Fn_userCtrlAllOff()
            __home_manhole = false
            __home_manhole_run = true
            debugPrintEventHeader(L0_162 .. "\227\129\184\227\131\175\227\131\188\227\131\151\239\188\129")
            __my_home:kill()
            __my_home = nil
            Fn_resetPcPos("locator2_" .. L0_162 .. "_warp")
            while not Area:isStartedOverall() do
              wait()
            end
            Fn_mobWaitForReady()
            Fn_fadein(1, true)
            Fn_userCtrlOn()
          else
            __home_cancel = true
            __home_manhole = false
            __home_start_cursor = HUD.kSelectItem_Home_Warp
          end
        end)
      elseif A0_161 == HUD.kSelectItem_Home_Rearrange then
        debugPrintEventHeader("homeClosedCallback = " .. A0_161)
        invokeTask(function()
          debugPrintEventHeader("\229\174\182\229\133\183\233\133\141\231\189\174\229\174\159\232\161\140")
          HUD:enablePhotoMode(false)
          HUD:furnitureSelectOpen()
          wait()
          while HUD:furnitureSelectIsActive() do
            wait()
          end
          __home_cancel = true
          __home_start_cursor = HUD.kSelectItem_Home_Rearrange
        end)
      elseif A0_161 == HUD.kSelectItem_Home_EpisodeReplay then
        debugPrintEventHeader("homeClosedCallback = " .. A0_161)
        HUD:menuOpen("MissionReplay")
        __mission_reply = true
        __home_start_cursor = HUD.kSelectItem_Home_EpisodeReplay
      end
    end
    while true do
      HUD:enablePhotoMode(true)
      HUD:homeOpen()
      HUD:setCallbackFunction(HUD.kCallback_Home_Closed, L1_160)
      HUD:setCurrentMenu(__home_start_cursor)
      wait()
      while HUD:homeIsActive() or HUD:furnitureSelectIsActive() do
        wait()
      end
      while __home_manhole do
        wait()
      end
      while __mission_reply do
        wait()
      end
      if __home_cancel then
        __home_cancel = false
      else
        break
      end
      wait()
    end
    Fn_blackout()
    HUD:navisSetMaskFromDemo(false)
    Area:setForceSceneParams(nil)
    Camera:removeHomeCamera()
    Player:setStay(false)
    L0_159:setVisible(true)
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Fn_setCatActive(true)
    if __home_manhole_run or __mission_replay_run then
    else
      __my_home:kill()
      __my_home = nil
      Fn_resetPcPos("locator2_home_warp")
      while not Area:isStartedOverall() do
        wait()
      end
      Fn_mobWaitForReady()
      Fn_fadein(nil, true)
      Fn_userCtrlOn()
    end
    __home_manhole_run = false
    __mission_replay_run = false
    GameDatabase:backup(ggd.Savedata__HomeInfo__FurnitureInfo)
    GameDatabase:backup(ggd.Savedata__HomeInfo__New)
    Player:setAbility(Player.kAbility_FirstPersonView, true)
    debugPrintEventHeader("\227\131\155\227\131\188\227\131\160\231\181\130\228\186\134")
  end
  L5_155 = setupMarkerBase
  L6_156 = L2_152
  L7_157 = L3_153
  L8_158 = L4_154
  L6_156 = L5_155(L6_156, L7_157, L8_158)
  L7_157 = _setDeactiveMarker
  L8_158 = L5_155
  L7_157(L8_158, L6_156)
  function L7_157(A0_163, A1_164)
    __mission_reply = false
    if A0_163 == nil and A1_164 == nil then
      __home_cancel = true
    else
      invokeSystemTask(function()
        local L0_165, L1_166, L2_167
        L0_165 = GameDatabase
        L1_166 = L0_165
        L0_165 = L0_165.set
        L2_167 = ggd
        L2_167 = L2_167.Savedata__EventManageFlags__MissionReplay
        L0_165(L1_166, L2_167, A0_163)
        __mission_replay_run = true
        L0_165 = __my_home
        L1_166 = L0_165
        L0_165 = L0_165.kill
        L0_165(L1_166)
        __my_home = nil
        L0_165 = monologue_tbl
        L1_166 = A1_164
        L0_165 = L0_165[L1_166]
        if L0_165 then
          L0_165 = monologue_tbl
          L1_166 = A1_164
          L0_165 = L0_165[L1_166]
          L0_165 = L0_165.end_kaiwa
          if L0_165 then
            L0_165 = GameDatabase
            L1_166 = L0_165
            L0_165 = L0_165.set
            L2_167 = ggd
            L2_167 = L2_167.Savedata__EventManageFlags__MonologueEnd
            L0_165(L1_166, L2_167, monologue_tbl[A1_164].end_kaiwa)
            L0_165 = debugPrintEventHeader
            L1_166 = "\227\129\174\227\130\168\227\131\148\227\130\189\227\131\188\227\131\137\227\131\170\227\131\151\227\131\172\227\130\164\227\129\167"
            L2_167 = A1_164
            L1_166 = L1_166 .. L2_167 .. "\227\129\174\231\181\130\228\186\134\230\153\130\227\129\174\227\131\162\227\131\142\227\131\173\227\131\188\227\130\176\227\130\146\227\130\187\227\131\131\227\131\136"
            L0_165(L1_166)
          end
        end
        L0_165 = A1_164
        if L0_165 == "ep07" then
          L0_165 = GameDatabase
          L1_166 = L0_165
          L0_165 = L0_165.reset
          L2_167 = ggd
          L2_167 = L2_167.Savedata__BrokenObj__ep07
          L0_165(L1_166, L2_167)
        else
          L0_165 = A1_164
          if L0_165 == "ep10" then
            L0_165 = GameDatabase
            L1_166 = L0_165
            L0_165 = L0_165.reset
            L2_167 = ggd
            L2_167 = L2_167.Savedata__BrokenObj__ep10
            L0_165(L1_166, L2_167)
          else
            L0_165 = A1_164
            if L0_165 == "ep26" then
              L0_165 = GameDatabase
              L1_166 = L0_165
              L0_165 = L0_165.reset
              L2_167 = ggd
              L2_167 = L2_167.Savedata__BrokenObj__ep26
              L0_165(L1_166, L2_167)
            end
          end
        end
        L0_165 = ggd
        L1_166 = "Savedata__EventClearFlag__"
        L2_167 = A1_164
        L1_166 = L1_166 .. L2_167
        L0_165 = L0_165[L1_166]
        if L0_165 then
          L1_166 = GameDatabase
          L2_167 = L1_166
          L1_166 = L1_166.reset
          L1_166(L2_167, L0_165)
        end
        L1_166 = ggd
        L2_167 = "Savedata__EventFlags__"
        L2_167 = L2_167 .. A1_164
        L1_166 = L1_166[L2_167]
        if L1_166 then
          L2_167 = GameDatabase
          L2_167 = L2_167.reset
          L2_167(L2_167, L1_166)
        end
        L2_167 = ggd
        L2_167 = L2_167["EventFlags__" .. A1_164]
        if L2_167 then
          GameDatabase:reset(L2_167)
        end
        Fn_setBgmPoint("event", "episode_replay")
        Fn_setNextMissionFlag(A0_163)
        Fn_nextMission()
        Fn_exitSandbox()
      end)
    end
  end
  L8_158 = HUD
  L8_158 = L8_158.menuSetCallback
  L8_158(L8_158, HUD.kCallback_MissionReplay, L7_157)
end
function _createMansionMaker(A0_168)
  local L1_169, L2_170, L3_171, L4_172, L5_173, L6_174, L7_175, L8_176
  L1_169 = findGameObject2
  L2_170 = "Node"
  L3_171 = A0_168
  L1_169 = L1_169(L2_170, L3_171)
  if not L1_169 then
    return
  end
  L2_170 = {}
  L2_170.target = L1_169
  L3_171 = Vector
  L4_172 = 1.2
  L5_173 = 1.2
  L6_174 = 1.2
  L3_171 = L3_171(L4_172, L5_173, L6_174)
  L2_170.size = L3_171
  L2_170.type_cylinder = true
  L3_171 = {}
  L3_171.name = "gui_marker_12"
  L3_171.ad_title_id = "ui_acdialog_main_loc01"
  L3_171.ad_sub_id = "ui_acdialog_sub_09"
  L3_171.map_title_id = "ui_map_msinfo_main_loc01"
  L3_171.map_sub_id = "ui_map_msinfo_header_09"
  L3_171.giude_id = "ui_keyguide_ac_07"
  L3_171.pattern = "default"
  L3_171.map_disp = true
  function L4_172()
    debugPrintEventHeader("\229\164\162\233\173\133\227\129\174\233\164\168\229\174\159\232\161\140")
    HUD:menuOpen("Talisman")
    wait()
    debugPrintEventHeader("\229\164\162\233\173\133\227\129\174\233\164\168\231\181\130\228\186\134")
  end
  L5_173 = setupMarkerBase
  L6_174 = L2_170
  L7_175 = L3_171
  L8_176 = L4_172
  L6_174 = L5_173(L6_174, L7_175, L8_176)
  L7_175 = _setDeactiveMarker
  L8_176 = L5_173
  L7_175(L8_176, L6_174)
  function L7_175(A0_177, A1_178, A2_179, A3_180, A4_181)
    local L5_182, L6_183, L7_184, L8_185, L9_186, L10_187, L11_188, L12_189, L13_190, L14_191, L15_192, L16_193, L17_194, L18_195, L19_196, L20_197
    L5_182 = 3
    L6_183 = 0
    L7_184 = 8
    L8_185 = 5
    L9_186 = {}
    L9_186.shape = 0
    L10_187 = {
      L11_188,
      L12_189,
      L13_190
    }
    L11_188 = 0
    L9_186.skill = L10_187
    L10_187 = {
      L11_188,
      L12_189,
      L13_190
    }
    L11_188 = 0
    L9_186.skill_rarity = L10_187
    L9_186.skii_max = 0
    L9_186.min_rarity = 0
    L9_186.up_probability_rarity = 0
    L10_187 = {
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    }
    L11_188 = GlobalGem
    L11_188 = L11_188.getTalismanInfo
    L11_188 = L11_188(L12_189, L13_190)
    L15_192 = A2_179
    L15_192 = L14_191
    L16_193 = A3_180
    L15_192 = GlobalGem
    L16_193 = L15_192
    L15_192 = L15_192.getTalismanInfo
    L20_197 = L15_192(L16_193, L17_194)
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[5] = L15_192
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[6] = L16_193
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[7] = L17_194
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[8] = L18_195
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[9] = L19_196
    ;({
      L11_188,
      L12_189,
      L13_190,
      L14_191,
      [11] = L15_192(L16_193, L17_194)
    })[10] = L20_197
    L11_188 = {
      L12_189,
      L13_190,
      L14_191
    }
    for L15_192, L16_193 in L12_189(L13_190) do
      for L20_197 = 1, L5_182 do
        if 0 < L16_193["skill" .. L20_197] then
          L9_186.min_rarity = L9_186.min_rarity + L16_193["rarity" .. L20_197]
          L6_183 = L6_183 + 1
        end
      end
    end
    L15_192 = L13_190 * 100
    L15_192 = 1
    L16_193 = 100
    L15_192 = L12_189
    L16_193 = L5_182
    L9_186.skii_max = L14_191
    L15_192 = L9_186.min_rarity
    L15_192 = L15_192 / L6_183
    L15_192 = L14_191(L15_192)
    L15_192 = L12_189
    L16_193 = L7_184
    L9_186.min_rarity = L14_191
    L15_192 = L13_190 * 100
    L9_186.up_probability_rarity = L14_191
    L15_192 = 0
    L16_193 = 1
    for L20_197 = 1, L9_186.skii_max do
      L15_192 = L9_186.min_rarity
      if L7_184 > L15_192 and 0 < L9_186.up_probability_rarity and Fn_lottery(L9_186.up_probability_rarity) then
        L15_192 = L15_192 + 1
      end
      L9_186.skill_rarity[L20_197] = L15_192
    end
    if L14_191 then
      L9_186.shape = 1
    else
      L9_186.shape = L17_194
    end
    L15_192 = L9_186.min_rarity
    L16_193 = Player
    L16_193 = L16_193.getTalismanFilteredSkillNo
    L20_197 = L9_186.shape
    L20_197 = L11_188[L20_197]
    L16_193 = L16_193(L17_194, L18_195, L19_196)
    L14_191[L15_192] = L16_193
    L15_192 = L9_186.min_rarity
    if L7_184 > L15_192 then
      L15_192 = L9_186.min_rarity
      L15_192 = L15_192 + 1
      L16_193 = Player
      L16_193 = L16_193.getTalismanFilteredSkillNo
      L20_197 = L9_186.shape
      L20_197 = L11_188[L20_197]
      L16_193 = L16_193(L17_194, L18_195, L19_196)
      L14_191[L15_192] = L16_193
    end
    L15_192 = 0
    L16_193 = 1
    for L20_197 = 1, L9_186.skii_max do
      L15_192 = L9_186.skill_rarity[L20_197]
      if #L14_191[L15_192] > 0 then
        L9_186.skill[L16_193] = L14_191[L15_192][RandI(1, #L14_191[L15_192])]
        L16_193 = L16_193 + 1
      end
    end
    L15_192 = L9_186.skill
    L15_192 = L15_192[1]
    if 0 == L15_192 then
      L15_192 = L9_186.skill
      L15_192 = L15_192[2]
      if 0 == L15_192 then
        L15_192 = L9_186.skill
        L15_192 = L15_192[3]
        if 0 == L15_192 then
          L15_192 = debugPrintEventHeader
          L16_193 = "\227\130\185\227\130\173\227\131\171ID\227\129\140 0, 0, 0"
          L15_192(L16_193)
          L15_192 = L9_186.skill
          L16_193 = L10_187[1]
          L16_193 = L16_193.skill1
          L15_192[1] = L16_193
          L15_192 = L9_186.skill
          L16_193 = L10_187[1]
          L16_193 = L16_193.skill2
          L15_192[2] = L16_193
          L15_192 = L9_186.skill
          L16_193 = L10_187[1]
          L16_193 = L16_193.skill3
          L15_192[3] = L16_193
        end
      end
    end
    L15_192 = debugPrintEventHeader
    L16_193 = string
    L16_193 = L16_193.format
    L20_197 = L9_186.skill
    L20_197 = L20_197[2]
    L20_197 = L16_193(L17_194, L18_195, L19_196, L20_197, L9_186.skill[3], L9_186.skill_rarity[1], L9_186.skill_rarity[2], L9_186.skill_rarity[3])
    L15_192(L16_193, L17_194, L18_195, L19_196, L20_197, L16_193(L17_194, L18_195, L19_196, L20_197, L9_186.skill[3], L9_186.skill_rarity[1], L9_186.skill_rarity[2], L9_186.skill_rarity[3]))
    L15_192 = L9_186.shape
    L16_193 = L9_186.skill
    L16_193 = L16_193[1]
    return L15_192, L16_193, L17_194, L18_195
  end
  talisman_relottery_func = L7_175
  L7_175 = HUD
  L8_176 = L7_175
  L7_175 = L7_175.menuSetCallback
  L7_175(L8_176, HUD.kCallback_TalismanRelottery, talisman_relottery_func)
end
function _createManholeMarker(A0_198, A1_199)
  local L2_200, L3_201, L4_202, L5_203, L6_204, L7_205
  L2_200 = GameDatabase
  L3_201 = L2_200
  L2_200 = L2_200.get
  L4_202 = ggd
  L5_203 = "Savedata__Menu__ManholeFlags__"
  L6_204 = A1_199
  L5_203 = L5_203 .. L6_204
  L4_202 = L4_202[L5_203]
  L2_200 = L2_200(L3_201, L4_202)
  L3_201 = string
  L3_201 = L3_201.sub
  L4_202 = A1_199
  L5_203 = string
  L5_203 = L5_203.len
  L6_204 = A1_199
  L5_203 = L5_203(L6_204)
  L5_203 = L5_203 - 1
  L6_204 = string
  L6_204 = L6_204.len
  L7_205 = A1_199
  L7_205 = L6_204(L7_205)
  L3_201 = L3_201(L4_202, L5_203, L6_204, L7_205, L6_204(L7_205))
  L4_202 = {}
  L4_202.sensor = nil
  L4_202.marker = nil
  L5_203 = {}
  L5_203.target = A0_198
  L6_204 = Vector
  L7_205 = 1.2
  L6_204 = L6_204(L7_205, 1.2, 1.2)
  L5_203.size = L6_204
  L5_203.type_cylinder = true
  L6_204 = {}
  L6_204.name = "gui_marker_09"
  L7_205 = "ui_acdialog_main_mh"
  L7_205 = L7_205 .. L3_201
  L6_204.ad_title_id = L7_205
  L6_204.ad_sub_id = "ui_acdialog_sub_07"
  L7_205 = "ui_map_msinfo_main_mh"
  L7_205 = L7_205 .. L3_201
  L6_204.map_title_id = L7_205
  L6_204.map_sub_id = "ui_map_msinfo_header_07"
  L6_204.giude_id = "ui_keyguide_ac_04"
  L6_204.pattern = "default"
  L6_204.map_disp = true
  L6_204.active = L2_200
  function L7_205()
    local L0_206
    L0_206 = debugPrintEventHeader
    L0_206("\227\131\158\227\131\179\227\131\155\227\131\188\227\131\171\231\167\187\229\139\149\229\174\159\232\161\140")
    L0_206 = HUD
    L0_206 = L0_206.menuOpen
    L0_206(L0_206, "Main", "Manhole")
    L0_206 = wait
    L0_206()
    L0_206 = debugPrintEventHeader
    L0_206("\227\131\158\227\131\179\227\131\155\227\131\188\227\131\171\227\131\175\227\131\188\227\131\151\231\148\187\233\157\162\231\181\130\228\186\134")
    L0_206 = HUD
    L0_206 = L0_206.getManholeWarpTarget
    L0_206 = L0_206(L0_206)
    if L0_206 ~= "" then
      Fn_userCtrlAllOff()
      debugPrintEventHeader(L0_206 .. "\227\129\184\227\131\175\227\131\188\227\131\151\239\188\129")
      Fn_resetPcPos("locator2_" .. L0_206 .. "_warp")
      while not Area:isStartedOverall() do
        wait()
      end
      Fn_mobWaitForReady()
      Fn_fadein(1, true)
      Fn_userCtrlOn()
    end
  end
  L4_202.sensor, L4_202.marker = setupMarkerBase(L5_203, L6_204, L7_205)
  _setDeactiveMarker(L4_202.sensor, L4_202.marker)
  if not L2_200 then
    _createManholeBeforeSensor(A1_199, L4_202, A0_198)
  end
end
function _createManholeBeforeSensor(A0_207, A1_208, A2_209)
  local L3_210, L4_211, L5_212, L6_213, L7_214
  L3_210 = "sensor_"
  L4_211 = A0_207
  L5_212 = "_before"
  L3_210 = L3_210 .. L4_211 .. L5_212
  L4_211 = nil
  L5_212 = "marker_"
  L6_213 = A0_207
  L7_214 = "_before"
  L5_212 = L5_212 .. L6_213 .. L7_214
  L6_213 = nil
  L7_214 = L3_210
  L7_214 = L7_214 .. "_OnEnter"
  _G[L7_214] = function()
    HUD:setUserControlLock(true)
    invokeTask(function()
      local L0_215
      L0_215 = GameDatabase
      L0_215 = L0_215.set
      L0_215(L0_215, ggd["Savedata__Menu__ManholeFlags__" .. A0_207], true)
      L0_215 = GameDatabase
      L0_215 = L0_215.get
      L0_215 = L0_215(L0_215, ggd.Savedata__Menu__ManholeFlags__ManholeCount)
      L0_215 = L0_215 + 1
      GameDatabase:set(ggd.Savedata__Menu__ManholeFlags__ManholeCount, L0_215)
      GameDatabase:set(ggd.Savedata__StatisticalChart__ManholeCount, L0_215 .. "/21")
      if L0_215 == 21 then
        Net:trophyUnlock(33)
      end
      L4_211:setActive(false)
      L6_213:playOut()
      repeat
        wait()
      until L6_213:isOutEnd()
      A1_208.marker:playIn()
      Sound:pulse("sys_manhole_locate")
      if true then
        Player:setStay(true)
      end
      HUD:captionBegin("ic_manhole_00001", 1.8)
      waitSeconds(1.8)
      if true then
        waitSeconds(1)
        HUD:info("mh_first_01", false)
        Player:setStay(false)
      end
      _autoSaveReq()
      A1_208.sensor:setActive(true)
      HUD:setUserControlLock(false)
    end)
  end
  L4_211 = createGameObject2("PlayerSensor")
  L4_211:setName(L3_210)
  L4_211:setDetectBehavior(1)
  L4_211:addCylinder(Vector(1.2, 1.2, 1.2), 32)
  L4_211:setPos(Vector(0, 1.2, 0))
  L4_211:setOnEnter(L7_214)
  A2_209:appendChild(L4_211)
  L6_213 = createGameObject2("MapMarker")
  L6_213:setName(L5_212)
  L6_213:setAssetName("gui_marker_25")
  L6_213:setupPattern("default")
  A2_209:appendChild(L6_213)
  if __marker_set[L3_210] == nil then
    __marker_set[L3_210] = {
      sensor = {hdl = L4_211, name = L3_210},
      marker = {hdl = L6_213, name = L5_212}
    }
    _setDeactiveMarker(L4_211, L6_213)
  end
end
function _createMissionMarkerStory(A0_216, A1_217, A2_218, A3_219)
  local L4_220, L5_221, L6_222, L7_223, L8_224, L9_225, L10_226, L11_227, L12_228
  L4_220 = {}
  L4_220.target = A0_216
  L4_220.find_type = "Node"
  L5_221 = Vector
  L6_222 = 1.2
  L7_223 = 1.2
  L8_224 = 1.2
  L5_221 = L5_221(L6_222, L7_223, L8_224)
  L4_220.size = L5_221
  L4_220.type_cylinder = true
  L5_221 = nil
  L6_222 = {}
  L6_222.name = "gui_marker_01"
  L7_223 = "ui_acdialog_main_"
  L8_224 = A1_217
  L7_223 = L7_223 .. L8_224
  L6_222.ad_title_id = L7_223
  L6_222.ad_sub_id = "ui_acdialog_sub_01"
  L7_223 = "ui_map_msinfo_main_"
  L8_224 = A1_217
  L7_223 = L7_223 .. L8_224
  L6_222.map_title_id = L7_223
  L6_222.map_sub_id = "ui_map_msinfo_header_01"
  L6_222.giude_id = "ui_keyguide_ac_01"
  if A3_219 then
    L7_223 = "A"
  else
    L7_223 = L7_223 or "default"
  end
  L6_222.pattern = L7_223
  L6_222.active = true
  L6_222.map_disp = true
  L7_223 = ggd
  L8_224 = "Savedata__Menu__EventStateFlags__"
  L9_225 = A1_217
  L8_224 = L8_224 .. L9_225
  L7_223 = L7_223[L8_224]
  if L7_223 and A1_217 ~= "ep21" then
    L8_224 = GameDatabase
    L9_225 = L8_224
    L8_224 = L8_224.get
    L10_226 = L7_223
    L8_224 = L8_224(L9_225, L10_226)
    if L8_224 == 0 then
      L8_224 = GameDatabase
      L9_225 = L8_224
      L8_224 = L8_224.set
      L10_226 = L7_223
      L11_227 = 1
      L8_224(L9_225, L10_226, L11_227)
    end
  end
  L8_224 = A2_218.marker
  if L8_224 then
    L8_224 = A2_218.marker
    L8_224 = L8_224.ad_main
    L8_224 = L8_224 or L6_222.ad_title_id
    L6_222.ad_title_id = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.ad_sub
    L8_224 = L8_224 or L6_222.ad_sub_id
    L6_222.ad_sub_id = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.map_main
    L8_224 = L8_224 or L6_222.map_title_id
    L6_222.map_title_id = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.map_sub
    L8_224 = L8_224 or L6_222.map_sub_id
    L6_222.map_sub_id = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.key_guide
    L8_224 = L8_224 or L6_222.giude_id
    L6_222.giude_id = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.pattern
    L8_224 = L8_224 or L6_222.pattern
    L6_222.pattern = L8_224
    L8_224 = A2_218.marker
    L8_224 = L8_224.active
    if L8_224 == nil then
      L8_224 = L6_222.active
    elseif not L8_224 then
      L8_224 = A2_218.marker
      L8_224 = L8_224.active
    end
    L6_222.active = L8_224
    L8_224 = A2_218.marker
    L5_221 = L8_224.ofs
  end
  L8_224, L9_225 = nil, nil
  L10_226 = A2_218.opt
  if L10_226 then
    L10_226 = A2_218.opt
    L8_224 = L10_226.kaiwa
    L10_226 = A2_218.opt
    L10_226 = L10_226.kaiwa2
    kaiwa2 = L10_226
    L10_226 = A2_218.opt
    L9_225 = L10_226.yesno
  end
  function L10_226()
    local L0_229, L1_230, L2_231, L3_232, L4_233
    L0_229 = Fn_userCtrlOff
    L0_229()
    L0_229 = Fn_coercionGravityRevert
    L0_229 = L0_229()
    repeat
      L1_230 = wait
      L1_230()
      L2_231 = L0_229
      L1_230 = L0_229.isRunning
      L1_230 = L1_230(L2_231)
    until not L1_230
    L0_229 = nil
    L1_230 = GameDatabase
    L2_231 = L1_230
    L1_230 = L1_230.get
    L3_232 = ggd
    L3_232 = L3_232.Savedata__EventManageFlags__CurrentFreeMode
    L1_230 = L1_230(L2_231, L3_232)
    if L1_230 == "ft04" then
      L1_230 = GameDatabase
      L2_231 = L1_230
      L1_230 = L1_230.isAllChunksMounted
      L1_230 = L1_230(L2_231)
      if not L1_230 then
        L1_230 = GameDatabase
        L2_231 = L1_230
        L1_230 = L1_230.playGoDialogOpen
        L1_230(L2_231)
        L1_230 = Fn_userCtrlOn
        L1_230()
        return
      end
    end
    L1_230 = getMarkerHandle
    L2_231 = A0_216
    L1_230 = L1_230(L2_231)
    L3_232 = L1_230
    L2_231 = L1_230.playOut
    L2_231(L3_232)
    repeat
      L2_231 = wait
      L2_231()
      L3_232 = L1_230
      L2_231 = L1_230.isOutEnd
      L2_231 = L2_231(L3_232)
    until L2_231
    L2_231 = wait
    L3_232 = 10
    L2_231(L3_232)
    L2_231 = L8_224
    if L2_231 then
      L2_231 = Fn_kaiwaDemoView
      L3_232 = L8_224
      L2_231(L3_232)
      L2_231 = wait
      L2_231()
    end
    L2_231 = kaiwa2
    if L2_231 then
      L2_231 = GameDatabase
      L3_232 = L2_231
      L2_231 = L2_231.set
      L4_233 = ggd
      L4_233 = L4_233.Savedata__EventManageFlags__MonologueStart
      L2_231(L3_232, L4_233, kaiwa2)
    end
    L2_231 = false
    L3_232 = false
    L4_233 = L9_225
    if L4_233 then
      L3_232 = true
      L4_233 = Fn_userCtrlOff
      L4_233()
      L4_233 = HUD
      L4_233 = L4_233.yesnoOpen
      L4_233(L4_233, L9_225)
      L4_233 = nil
      while true do
        L4_233 = HUD:yesnoResult()
        if L4_233 ~= nil then
          if L4_233 == HUD.kYesNoAnswerYes then
            L2_231 = true
          elseif L4_233 == HUD.kYesNoAnswerNo then
          end
        else
          wait()
          else
            L2_231 = true
          end
        end
      end
    if L3_232 then
      L4_233 = Fn_userCtrlOn
      L4_233()
    end
    if L2_231 then
      L4_233 = A1_217
      __select_mission_name = L4_233
      L4_233 = Fn_naviKill
      L4_233()
      L4_233 = Fn_setKeepPlayerPos
      L4_233()
      L4_233 = Fn_setNextMissionFlag
      L4_233(A1_217 .. "_header")
      L4_233 = Fn_nextMission
      L4_233()
      L4_233 = Fn_exitSandbox
      L4_233()
    else
      L4_233 = L1_230.playIn
      L4_233(L1_230)
    end
  end
  L11_227 = setupMarkerBase
  L12_228 = L4_220
  L12_228 = L11_227(L12_228, L6_222, L10_226)
  _setDeactiveMarker(L11_227, L12_228)
  if L5_221 then
    L12_228:setPos(L5_221)
  end
end
function _createMissionMarkerSide(A0_234, A1_235, A2_236, A3_237, A4_238, A5_239)
  local L6_240, L7_241, L8_242, L9_243, L10_244, L11_245, L12_246, L13_247, L14_248, L15_249, L16_250
  L6_240 = {}
  L6_240.target = A0_234
  L6_240.find_type = "Node"
  L7_241 = Vector
  L8_242 = 1.2
  L9_243 = 1.2
  L10_244 = 1.2
  L7_241 = L7_241(L8_242, L9_243, L10_244)
  L6_240.size = L7_241
  L6_240.type_cylinder = true
  L7_241 = {}
  L7_241.name = "gui_marker_02"
  L8_242 = "ui_acdialog_main_"
  L9_243 = A1_235
  L8_242 = L8_242 .. L9_243
  L7_241.ad_title_id = L8_242
  L7_241.ad_sub_id = "ui_acdialog_sub_04"
  L8_242 = "ui_map_msinfo_main_"
  L9_243 = A1_235
  L8_242 = L8_242 .. L9_243
  L7_241.map_title_id = L8_242
  L7_241.map_sub_id = "ui_map_msinfo_header_04"
  L7_241.giude_id = "ui_keyguide_ac_01"
  if A3_237 then
    L8_242 = "A"
  else
    L8_242 = L8_242 or "default"
  end
  L7_241.pattern = L8_242
  L7_241.map_disp = true
  L7_241.active = true
  L8_242 = ggd
  L9_243 = "Savedata__Menu__EventStateFlags__"
  L10_244 = A1_235
  L9_243 = L9_243 .. L10_244
  L8_242 = L8_242[L9_243]
  if L8_242 then
    L9_243 = GameDatabase
    L10_244 = L9_243
    L9_243 = L9_243.get
    L11_245 = L8_242
    L9_243 = L9_243(L10_244, L11_245)
    if L9_243 == 0 then
      L9_243 = GameDatabase
      L10_244 = L9_243
      L9_243 = L9_243.set
      L11_245 = L8_242
      L12_246 = 1
      L9_243(L10_244, L11_245, L12_246)
    end
  end
  L9_243 = A2_236.marker
  if L9_243 then
    L9_243 = A2_236.marker
    L9_243 = L9_243.ad_main
    L9_243 = L9_243 or L7_241.ad_title_id
    L7_241.ad_title_id = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.ad_sub
    L9_243 = L9_243 or L7_241.ad_sub_id
    L7_241.ad_sub_id = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.map_main
    L9_243 = L9_243 or L7_241.map_title_id
    L7_241.map_title_id = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.map_sub
    L9_243 = L9_243 or L7_241.map_sub_id
    L7_241.map_sub_id = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.key_guide
    L9_243 = L9_243 or L7_241.giude_id
    L7_241.giude_id = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.pattern
    L9_243 = L9_243 or L7_241.pattern
    L7_241.pattern = L9_243
    L9_243 = A2_236.marker
    L9_243 = L9_243.active
    if L9_243 == nil then
      L9_243 = L7_241.active
    elseif not L9_243 then
      L9_243 = A2_236.marker
      L9_243 = L9_243.active
    end
    L7_241.active = L9_243
  end
  L9_243, L10_244, L11_245 = nil, nil, nil
  L12_246 = A2_236.opt
  if L12_246 then
    L12_246 = A2_236.opt
    L9_243 = L12_246.kaiwa
    L12_246 = A2_236.opt
    L10_244 = L12_246.fader
    L12_246 = A2_236.opt
    L11_245 = L12_246.pc_pos_reset
  end
  function L12_246()
    Fn_userCtrlOff()
    repeat
      wait()
    until not Fn_coercionGravityRevert():isRunning()
    getMarkerHandle(A0_234):playOut()
    repeat
      wait()
    until getMarkerHandle(A0_234):isOutEnd()
    wait(10)
    if A4_238 then
      GameDatabase:set(ggd.Savedata__EventManageFlags__MonologueStart, A4_238)
      GameDatabase:set(ggd.Savedata__EventManageFlags__PastSideMission, true)
      GameDatabase:set(ggd.Savedata__Player__Costume, "kit01")
    end
    if A5_239 then
      GameDatabase:set(ggd.Savedata__EventManageFlags__MonologueEnd, A5_239)
    end
    if L9_243 then
      Fn_kaiwaDemoView(L9_243)
      wait()
    end
    if L10_244 == "blackout" then
      Fn_blackout()
    end
    if not true and L11_245 ~= true then
      Fn_setKeepPlayerPos()
    end
    __select_mission_name = A1_235
    Fn_naviKill()
    Fn_setNextMissionFlag(A1_235 .. "_header")
    Fn_nextMission()
    Fn_exitSandbox()
  end
  L13_247 = setupMarkerBase
  L14_248 = L6_240
  L15_249 = L7_241
  L16_250 = L12_246
  L14_248 = L13_247(L14_248, L15_249, L16_250)
  L15_249 = _setDeactiveMarker
  L16_250 = L13_247
  L15_249(L16_250, L14_248)
end
function _createMissionMarkerChallenge(A0_251, A1_252, A2_253)
  local L3_254, L4_255, L5_256, L6_257, L7_258, L8_259, L9_260, L10_261, L11_262, L12_263, L13_264
  L3_254 = false
  L4_255, L5_256 = nil, nil
  L6_257 = Ugc
  L7_258 = L6_257
  L6_257 = L6_257.isChLetter
  L8_259 = A1_252
  L6_257 = L6_257(L7_258, L8_259)
  if L6_257 then
    L4_255 = "gui_marker_03"
    L5_256 = "gui_marker_04"
    L6_257 = getGameDataBaseVal
    L7_258 = "Savedata__EventFinishedFlags__"
    L8_259 = A1_252
    L7_258 = L7_258 .. L8_259
    L6_257 = L6_257(L7_258)
    if L6_257 > 0 then
      L4_255 = "gui_marker_05"
      L5_256 = "gui_marker_06"
    end
    L3_254 = true
    L6_257 = debugPrintEventHeader
    L7_258 = A1_252
    L8_259 = "\227\129\175\230\140\145\230\136\166\231\138\182\227\129\140\229\177\138\227\129\132\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167"
    L9_260 = L5_256
    L10_261 = "\227\130\146\232\191\189\229\138\160\227\129\167\228\189\156\230\136\144 : letter :"
    L11_262 = tostring
    L12_263 = L3_254
    L11_262 = L11_262(L12_263)
    L7_258 = L7_258 .. L8_259 .. L9_260 .. L10_261 .. L11_262
    L6_257(L7_258)
  else
    L4_255 = "gui_marker_03"
    L6_257 = getGameDataBaseVal
    L7_258 = "Savedata__EventFinishedFlags__"
    L8_259 = A1_252
    L7_258 = L7_258 .. L8_259
    L6_257 = L6_257(L7_258)
    if L6_257 > 0 then
      L4_255 = "gui_marker_05"
    end
    L3_254 = false
    L6_257 = debugPrintEventHeader
    L7_258 = A1_252
    L8_259 = "\227\129\175\230\140\145\230\136\166\231\138\182\227\129\140\229\177\138\227\129\132\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\232\191\189\229\138\160\227\131\158\227\131\188\227\130\171\227\131\188\227\129\175\231\132\161\227\129\151 : letter :"
    L9_260 = tostring
    L10_261 = L3_254
    L9_260 = L9_260(L10_261)
    L7_258 = L7_258 .. L8_259 .. L9_260
    L6_257(L7_258)
  end
  L6_257 = {}
  L6_257.target = A0_251
  L7_258 = Vector
  L8_259 = 1.2
  L9_260 = 1.2
  L10_261 = 1.2
  L7_258 = L7_258(L8_259, L9_260, L10_261)
  L6_257.size = L7_258
  L6_257.type_cylinder = true
  L7_258 = {}
  L7_258.name = L4_255
  L7_258.name2 = L5_256
  L8_259 = "ui_acdialog_main_"
  L9_260 = A1_252
  L8_259 = L8_259 .. L9_260
  L7_258.ad_title_id = L8_259
  L7_258.ad_sub_id = "ui_acdialog_sub_02"
  L8_259 = "ui_map_msinfo_main_"
  L9_260 = A1_252
  L8_259 = L8_259 .. L9_260
  L7_258.map_title_id = L8_259
  L7_258.map_sub_id = "ui_map_msinfo_header_02"
  L7_258.giude_id = "ui_keyguide_ac_01"
  L7_258.pattern = "default"
  L7_258.active = true
  L7_258.map_disp = true
  L8_259 = ggd
  L9_260 = "Savedata__Menu__EventStateFlags__"
  L10_261 = A1_252
  L9_260 = L9_260 .. L10_261
  L8_259 = L8_259[L9_260]
  if L8_259 then
    L9_260 = GameDatabase
    L10_261 = L9_260
    L9_260 = L9_260.get
    L11_262 = L8_259
    L9_260 = L9_260(L10_261, L11_262)
    if L9_260 == 0 then
      L9_260 = GameDatabase
      L10_261 = L9_260
      L9_260 = L9_260.set
      L11_262 = L8_259
      L12_263 = 1
      L9_260(L10_261, L11_262, L12_263)
    end
  end
  L9_260 = A2_253.marker
  if L9_260 then
    L9_260 = A2_253.marker
    L9_260 = L9_260.ad_main
    L9_260 = L9_260 or L7_258.ad_title_id
    L7_258.ad_title_id = L9_260
    L9_260 = A2_253.marker
    L9_260 = L9_260.ad_sub
    L9_260 = L9_260 or L7_258.ad_sub_id
    L7_258.ad_sub_id = L9_260
    L9_260 = A2_253.marker
    L9_260 = L9_260.map_main
    L9_260 = L9_260 or L7_258.map_title_id
    L7_258.map_title_id = L9_260
    L9_260 = A2_253.marker
    L9_260 = L9_260.map_sub
    L9_260 = L9_260 or L7_258.map_sub_id
    L7_258.map_sub_id = L9_260
    L9_260 = A2_253.marker
    L9_260 = L9_260.key_guide
    L9_260 = L9_260 or L7_258.giude_id
    L7_258.giude_id = L9_260
    L9_260 = A2_253.marker
    L9_260 = L9_260.pattern
    L9_260 = L9_260 or L7_258.pattern
    L7_258.pattern = L9_260
  end
  L9_260, L10_261, L11_262, L12_263 = nil, nil, nil, nil
  function L13_264()
    __challeng_marker_change = false
    Fn_userCtrlOff()
    repeat
      wait()
    until not Fn_coercionGravityRevert():isRunning()
    invokeTask(function()
      __challeng_menu_open = true
      getMarkerHandle(A0_251):playOut()
      if getMarkerHandle(A0_251) then
        getMarkerHandle(A0_251):playOut()
      end
      repeat
        wait()
      until getMarkerHandle(A0_251):isOutEnd()
      wait(10)
      HUD:challengeStartOpen(A1_252)
      wait()
      if HUD:challengeStartResult() == HUD.kHUDChallengeStart_Start then
        Fn_blackout()
        Fn_naviKill()
        Fn_setNextMissionFlag(A1_252 .. "_header")
        Fn_nextMission()
        Fn_exitSandbox()
      elseif HUD:challengeStartResult() == HUD.kHUDChallengeStart_Back then
        wait(10)
        Fn_userCtrlOn()
        if __challeng_marker_change == false then
          getMarkerHandle(A0_251):playIn()
          if getMarkerHandle(A0_251) then
            getMarkerHandle(A0_251):playIn()
          end
          if L9_260 ~= nil then
            if L9_260:getPos().y < 100 then
              L9_260:setPos(Vector(0, 100, 0))
              L9_260:setForceMove()
              wait(3)
              L9_260:setPos(Vector(0, L6_257.size.y, 0))
              L9_260:setForceMove()
              debugPrintEventHeader("\227\131\129\227\131\163\227\131\172\227\131\179\227\130\184\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\174\227\130\187\227\131\179\227\130\181\227\131\188\227\130\146\228\184\138\228\184\139\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
            else
              debugPrintEventHeader("\227\131\129\227\131\163\227\131\172\227\131\179\227\130\184\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\174\227\130\187\227\131\179\227\130\181\227\131\188\227\129\175\228\184\138\227\129\140\227\129\163\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\229\188\132\227\130\138\227\129\190\227\129\155\227\130\147")
            end
          end
        else
          debugPrintEventHeader("\227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\229\164\137\230\155\180\227\129\140\232\161\140\227\130\143\227\130\140\227\129\159\227\129\174\227\129\167\228\189\149\227\130\130\227\129\151\227\129\190\227\129\155\227\130\147")
        end
      end
      __challeng_menu_open = false
    end)
  end
  L9_260, L10_261, L11_262, L12_263 = setupMarkerBase(L6_257, L7_258, L13_264)
  _setDeactiveMarker(L9_260, L10_261, L12_263)
  createShowGhostSensor(L11_262, A1_252)
  return L11_262, L3_254
end
function _createMiningMarker(A0_265, A1_266, A2_267, A3_268)
  local L4_269, L5_270, L6_271, L7_272, L8_273, L9_274, L10_275
  L4_269 = {}
  L4_269.target = A0_265
  L4_269.find_type = "Node"
  L5_270 = Vector
  L6_271 = 1.2
  L7_272 = 1.2
  L8_273 = 1.2
  L5_270 = L5_270(L6_271, L7_272, L8_273)
  L4_269.size = L5_270
  L4_269.type_cylinder = true
  L5_270 = "ui_acdialog_main_loc02"
  L6_271 = "ui_map_msinfo_main_loc02"
  if A1_266 == "mine_hx" then
    L5_270 = "ui_acdialog_main_loc03"
    L6_271 = "ui_map_msinfo_main_loc03"
  end
  L7_272 = {}
  L7_272.name = "gui_marker_10"
  L7_272.ad_title_id = L5_270
  L7_272.ad_sub_id = "ui_acdialog_sub_10"
  L7_272.map_title_id = L6_271
  L7_272.map_sub_id = "ui_map_msinfo_header_10"
  L7_272.giude_id = "ui_keyguide_ac_02"
  if A3_268 then
    L8_273 = "A"
  else
    L8_273 = L8_273 or "default"
  end
  L7_272.pattern = L8_273
  L7_272.map_disp = true
  L8_273 = GameDatabase
  L9_274 = L8_273
  L8_273 = L8_273.get
  L10_275 = ggd
  L10_275 = L10_275.CreneShipFlags__ShipMoving
  L8_273 = L8_273(L9_274, L10_275)
  if L8_273 == true then
  end
  L7_272.active = true
  L8_273, L9_274 = nil, nil
  function L10_275()
    local L0_276, L1_277, L2_278, L3_279
    L0_276 = Fn_userCtrlOff
    L0_276()
    L0_276 = Fn_coercionGravityRevert
    L0_276 = L0_276()
    repeat
      L1_277 = wait
      L1_277()
      L1_277 = L0_276.isRunning
      L1_277 = L1_277(L2_278)
    until not L1_277
    L0_276 = nil
    L1_277 = L8_273
    L1_277 = L1_277.setActive
    L1_277(L2_278, L3_279)
    L1_277 = L9_274
    L1_277 = L1_277.playOut
    L1_277(L2_278)
    repeat
      L1_277 = wait
      L1_277()
      L1_277 = L9_274
      L1_277 = L1_277.isOutEnd
      L1_277 = L1_277(L2_278)
    until L1_277
    L1_277 = wait
    L1_277(L2_278)
    L1_277 = A2_267.opt
    if L1_277 then
      L1_277 = A2_267.opt
      L1_277 = L1_277.kaiwa
      if L1_277 then
        L1_277 = Fn_kaiwaDemoView
        L1_277(L2_278)
        L1_277 = wait
        L1_277()
      end
    end
    L1_277 = HUD
    L1_277 = L1_277.mineSelectInit
    L1_277(L2_278)
    L1_277 = HUD
    L1_277 = L1_277.mineSelectSetCurrentMineId
    L1_277(L2_278, L3_279)
    L1_277 = MineManager
    L1_277 = L1_277.sendEvent
    L1_277 = L1_277(L2_278, L3_279)
    for _FORV_5_, _FORV_6_ in L2_278(L3_279) do
      if _FORV_6_ then
        HUD:mineSelectSetting(_FORV_6_.id, _FORV_6_.density, _FORV_6_.level, _FORV_6_.boss, _FORV_6_.storm, _FORV_6_.impossible)
      end
    end
    if L2_278 then
      L2_278(L3_279, "setLoackUpdateMine", true)
    end
    L2_278(L3_279, true)
    L3_279(L3_279)
    while true do
      if L3_279 == HUD.kHUDMineSelect_None then
      elseif L3_279 == HUD.kHUDMineSelect_Decide then
        GameDatabase:set(ggd.GlobalSystemFlags__Gauge, false)
        debugPrintEventHeader(string.format("\233\129\184\227\129\176\227\130\140\227\129\159\230\142\161\230\142\152\229\160\180ID:%d", L2_278))
        break
      elseif L3_279 == HUD.kHUDMineSelect_Return then
        debugPrintEventHeader("mine select return")
        wait(10)
        L9_274:playIn()
        L8_273:setActive(true)
        if MineManager then
          MineManager:sendEvent("setLoackUpdateMine", false)
        end
        Ugc:disableFriendDGUpdate(false)
        break
      elseif L3_279 == HUD.kHUDMineSelect_ReturnTown then
        debugPrintEventHeader("mine select back to town")
        if MineManager then
          MineManager:sendEvent("setLoackUpdateMine", false)
        end
        Ugc:disableFriendDGUpdate(false)
        break
      end
      wait()
    end
    L3_279()
    if L2_278 > 0 then
      if L3_279 == "mine_hx" then
      else
      end
      GameDatabase:set(ggd.Savedata__CreneShipFlags__MineId, L2_278)
      GameDatabase:set(ggd.Savedata__CreneShipFlags__ShipName, L3_279)
      Fn_setCraneShipInformation(L3_279)
      Fn_setCrew()
      Fn_departure("mine0" .. L2_278 .. "_header", A1_266)
      GameDatabase:set(ggd.CreneShipFlags__MineId, L2_278)
      GameDatabase:set(ggd.GlobalSystemFlags__Gauge, true)
      Fn_exitSandbox()
    end
  end
  L8_273, L9_274 = setupMarkerBase(L4_269, L7_272, L10_275)
  _setDeactiveMarker(L8_273, L9_274)
  table.insert(__mine_marker, L9_274)
end
function setMineMarkerNavi()
  local L0_280, L1_281
  L0_280 = nil
  L1_281 = __mine_marker
  L1_281 = #L1_281
  if L1_281 > 0 then
    if L1_281 == 2 then
      if Fn_getPlayerWorldPos():DistanceTo(__mine_marker[1]:getWorldPos()) > Fn_getPlayerWorldPos():DistanceTo(__mine_marker[2]:getWorldPos()) then
        L0_280 = __mine_marker[2]
      else
        L0_280 = __mine_marker[1]
      end
    else
      L0_280 = __mine_marker[1]
    end
  end
  if L0_280 then
    HUD:naviSetUsersNavi(L0_280)
  end
end
function updateTreasureBox(A0_282)
  local L1_283, L2_284, L3_285, L4_286, L5_287, L6_288, L7_289, L8_290
  L1_283 = A0_282 or false
  L2_284, L3_285, L4_286 = nil, nil, nil
  L5_287 = getIntervalTime
  L5_287 = L5_287()
  L6_288 = false
  while true do
    L7_289 = nil
    L8_290 = __treasure_sb
    if L8_290 then
      L8_290 = __treasure_sb
      L8_290 = L8_290.isRunning
      L8_290 = L8_290(L8_290)
      if L8_290 then
        L8_290 = __treasure_sb
        L8_290 = L8_290.getBool
        L8_290 = L8_290(L8_290, "is_treasure_open")
        if L8_290 then
          L6_288 = true
          L8_290 = debugPrintEventHeader
          L8_290("\229\174\157\231\174\177\227\130\146\229\174\159\232\161\140\228\184\173\227\129\170\227\129\174\227\129\167\229\190\133\230\169\159\227\129\151\227\129\190\227\129\153")
          while true do
            L8_290 = __treasure_sb
            L8_290 = L8_290.getBool
            L8_290 = L8_290(L8_290, "is_treasure_open")
            if L8_290 then
              L8_290 = wait
              L8_290()
            end
          end
        end
      end
      L8_290 = __treasure_sb
      L8_290 = L8_290.isStopped
      L8_290 = L8_290(L8_290)
      if L8_290 then
        L8_290 = debugPrintEventHeader
        L8_290("\229\174\157\231\174\177\227\130\146\229\133\165\230\137\139\227\129\151\227\129\159\227\130\136\227\129\134\227\129\170\227\129\174\227\129\167\227\128\129\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\130\146\232\167\163\230\148\190\227\129\151\227\129\190\227\129\153")
        __treasure_sb = nil
        L6_288 = false
      end
    else
      L6_288 = false
    end
    if not L6_288 then
      L8_290 = Player
      L8_290 = L8_290.getRecentAreaName
      L8_290 = L8_290(L8_290)
      L2_284 = L8_290
      if L2_284 then
        L8_290 = string
        L8_290 = L8_290.find
        L8_290 = L8_290(L2_284, "bu_")
        if L8_290 ~= nil then
          L8_290 = GameDatabase
          L8_290 = L8_290.get
          L8_290 = L8_290(L8_290, ggd.Savedata__TreasureFlags__IsFirst)
          if L8_290 then
            L2_284 = "po_a_01"
          else
            L2_284 = "po_a_root"
          end
        end
      end
      if L2_284 then
        L8_290 = string
        L8_290 = L8_290.find
        L8_290 = L8_290(L2_284, "_root")
        if L8_290 == nil then
          L8_290 = Fn_findAreaHandle
          L8_290 = L8_290(L2_284)
          if L8_290 then
            L8_290 = _findUpAreaRoot(L8_290)
            if L8_290 then
              L4_286 = L8_290:getName()
              if GameDatabase:get(ggd.Savedata__TreasureFlags__IsFirst) then
              else
                L2_284 = L4_286
              end
            end
          end
        end
      elseif L2_284 ~= "hx_a_root" then
        L4_286 = L2_284
      else
        L2_284 = L3_285
        L8_290 = debugPrintEventHeader
        L8_290("\227\131\152\227\130\173\227\130\181\227\131\180\227\130\163\227\131\171\227\129\174\231\183\154\232\183\175\227\129\174\228\184\138\227\129\175\227\128\129\228\187\165\229\137\141\227\129\174\227\130\168\227\131\170\227\130\162\227\129\174\227\129\190\227\129\190\227\129\171\227\129\151\227\129\190\227\129\153")
      end
      if L4_286 and L2_284 ~= L3_285 then
        L8_290 = _getAreaNameToId
        L8_290 = L8_290(L4_286)
        if isCreateTreasureBoxArea(L8_290) then
          L7_289 = findTreasureBoxNodes(L4_286)
          if L7_289 then
            if GameDatabase:get(ggd.Savedata__TreasureFlags__IsFirst) then
              table.sort(L7_289, function(A0_291, A1_292)
                return A0_291.dist < A1_292.dist
              end)
              GameDatabase:set(ggd.Savedata__TreasureFlags__Local__AreaId, L8_290)
              GameDatabase:set(ggd.Savedata__TreasureFlags__Local__TBox, L7_289[1].name)
            else
              GameDatabase:set(ggd.Savedata__TreasureFlags__Local__AreaId, L8_290)
              GameDatabase:set(ggd.Savedata__TreasureFlags__Local__TBox, L7_289[RandI(1, #L7_289)].name)
            end
            L1_283 = true
            L3_285 = L2_284
          end
        end
      end
    end
    if L1_283 then
      L8_290 = __treasure_sb
      if L8_290 then
        L8_290 = debugPrintEventHeader
        L8_290("\228\187\165\229\137\141\227\129\174\229\174\157\231\174\177\227\129\174\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
        L8_290 = __treasure_sb
        L8_290 = L8_290.isRunning
        L8_290 = L8_290(L8_290)
        if L8_290 then
          L8_290 = __treasure_sb
          L8_290 = L8_290.sendEvent
          L8_290(L8_290, "kill")
        end
        __treasure_sb = nil
      end
      L8_290 = debugPrintEventHeader
      L8_290("\229\174\157\231\174\177\227\129\174\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\153")
      L8_290 = createSandbox2
      L8_290 = L8_290("treasure_box")
      __treasure_sb = L8_290
      L8_290 = __treasure_sb
      L8_290 = L8_290.setString
      L8_290(L8_290, "g_filename", "/Game/Event2/Mission/treasure_new.lua")
      L8_290 = __treasure_sb
      L8_290 = L8_290.try_init
      L8_290(L8_290)
      L8_290 = __treasure_sb
      L8_290 = L8_290.waitForReady
      L8_290(L8_290)
      L8_290 = __treasure_sb
      L8_290 = L8_290.setGameObject
      L8_290(L8_290, "mother2", mother2)
      L8_290 = __treasure_sb
      L8_290 = L8_290.setGameObject
      L8_290(L8_290, "father2", father2)
      L8_290 = __treasure_sb
      L8_290 = L8_290.setGameObject
      L8_290(L8_290, "eventheader", g_own)
      L8_290 = __treasure_sb
      L8_290 = L8_290.setGameObject
      L8_290(L8_290, "soundManager", Fn_getGameObject("soundManager"))
      L8_290 = __treasure_sb
      L8_290 = L8_290.setBool
      L8_290(L8_290, "isTreasureOpen", false)
      L8_290 = __treasure_sb
      L8_290 = L8_290.try_start
      L8_290(L8_290)
      L8_290 = __treasure_sb
      L8_290 = L8_290.sendEvent
      L8_290(L8_290, "areaWarpFinish")
      L8_290 = __treasure_sb
      L8_290 = L8_290.sendEvent
      L8_290(L8_290, "startGameObjects")
      L8_290 = __treasure_sb
      L8_290 = L8_290.sendEvent
      L8_290(L8_290, "sbRun")
      L1_283 = false
      L8_290 = getIntervalTime
      L8_290 = L8_290()
      L5_287 = L8_290
    end
    L8_290 = waitSeconds
    L8_290(60)
    L5_287 = L5_287 - 1
    if L5_287 <= 0 then
      L8_290 = getIntervalTime
      L8_290 = L8_290()
      L5_287 = L8_290
      L3_285 = nil
      L8_290 = debugPrintEventHeader
      L8_290("\227\131\173\227\131\188\227\130\171\227\131\171\229\174\157\231\174\177\227\129\140\227\130\191\227\130\164\227\131\160\227\130\162\227\130\166\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130 \229\174\157\231\174\177\227\130\146\228\189\156\227\130\138\231\155\180\227\129\151\227\129\190\227\129\153\227\128\130")
    end
  end
end
function updateTreasureBoxTimer()
  local L0_293, L1_294, L2_295, L3_296, L4_297, L5_298, L6_299, L7_300, L8_301, L9_302
  L0_293 = getIntervalTime
  L0_293 = L0_293()
  while true do
    L1_294 = waitSeconds
    L2_295 = 60
    L1_294(L2_295)
    L1_294 = Rtc
    L2_295 = L1_294
    L1_294 = L1_294.localtime
    L1_294 = L1_294(L2_295)
    L2_295 = L1_294.year
    L3_296 = string
    L3_296 = L3_296.format
    L3_296 = L3_296(L4_297, L5_298)
    L2_295 = L2_295 .. L3_296 .. L4_297
    L3_296 = L1_294.hour
    L3_296 = L3_296 * 60
    L3_296 = L3_296 + L4_297
    for L7_300, L8_301 in L4_297(L5_298) do
      L9_302 = GameDatabase
      L9_302 = L9_302.get
      L9_302 = L9_302(L9_302, ggd[L8_301])
      if L9_302 ~= "None" and tonumber(string.sub(L9_302, 1, string.find(L9_302, ":") - 1)) and tonumber(string.sub(L9_302, string.find(L9_302, ":") + 1, #L9_302)) then
        if L2_295 - tonumber(string.sub(L9_302, 1, string.find(L9_302, ":") - 1)) == 0 then
          if L0_293 <= L3_296 - tonumber(string.sub(L9_302, string.find(L9_302, ":") + 1, #L9_302)) then
            GameDatabase:set(ggd[L8_301], "None")
            debugPrintEventHeader("\229\174\157\231\174\177\229\143\150\229\190\151\229\190\140\227\128\129\228\184\128\229\174\154\230\153\130\233\150\147\231\181\140\233\129\142\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
            L0_293 = getIntervalTime()
          end
        else
          GameDatabase:set(ggd[L8_301], "None")
          debugPrintEventHeader("\229\174\157\231\174\177\229\143\150\229\190\151\229\190\140\227\128\129\230\151\165\228\187\152\227\129\140\229\164\137\227\130\143\227\129\163\227\129\159\227\129\174\227\129\167\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\153\227\128\130")
        end
      end
    end
    L4_297()
  end
end
function isCreateTreasureBoxArea(A0_303)
  if A0_303 == nil then
    return false
  end
  if GameDatabase:get(ggd[__treasure_gdb_list[A0_303]]) == "None" then
    return true
  end
  return false
end
function getIntervalTime()
  if Ugc:getParamTable() ~= nil and Yaml:convertToLua(Ugc:getParamTable():getRoot()) and Yaml:convertToLua(Ugc:getParamTable():getRoot()).interval and Yaml:convertToLua(Ugc:getParamTable():getRoot()).interval.treasure and Yaml:convertToLua(Ugc:getParamTable():getRoot()).interval.treasure.offline then
    return Yaml:convertToLua(Ugc:getParamTable():getRoot()).interval.treasure.offline
  end
  return 60
end
function createShowGhostSensor(A0_304, A1_305)
  local L2_306, L3_307
  L2_306 = createGameObject2
  L3_307 = "PlayerSensor"
  L2_306 = L2_306(L3_307)
  L3_307 = L2_306.setName
  L3_307(L2_306, A1_305 .. "_sg01")
  L3_307 = L2_306.setDetectBehavior
  L3_307(L2_306, 1)
  L3_307 = L2_306.addSphere
  L3_307(L2_306, 80)
  L3_307 = L2_306.setOnEnter
  L3_307(L2_306, "createShowGhost")
  L3_307 = A0_304.appendChild
  L3_307(A0_304, L2_306)
  L3_307 = createGameObject2
  L3_307 = L3_307("PlayerSensor")
  L3_307:setName(A1_305 .. "_sg02")
  L3_307:setDetectBehavior(1)
  L3_307:addSphere(100)
  L3_307:setOnLeave("deleteShowGhost")
  A0_304:appendChild(L3_307)
end
function createShowGhost(A0_308)
  local L1_309, L2_310
  L1_309 = __challeng_ghost_active
  if not L1_309 then
    L1_309 = debugPrintEventHeader
    L2_310 = "\233\135\141\229\138\155\229\181\144\231\153\186\231\148\159\228\184\173\227\129\170\227\129\174\227\129\167\227\128\129showGhost\227\130\146\228\184\128\230\153\130\231\154\132\227\129\171\228\189\156\230\136\144\227\129\151\227\129\190\227\129\155\227\130\147"
    L1_309(L2_310)
    return
  end
  L2_310 = A0_308
  L1_309 = A0_308.getName
  L1_309 = L1_309(L2_310)
  L2_310 = string
  L2_310 = L2_310.match
  L2_310 = L2_310(L1_309, "(.-)_()")
  if __challeng_ghost_task[L2_310] == nil then
    __challeng_ghost_task[L2_310] = invokeTask(function()
      local L0_311, L1_312, L2_313, L3_314, L4_315, L5_316, L6_317
      while true do
        L0_311 = wait
        L0_311()
        L0_311 = HUD
        L1_312 = L0_311
        L0_311 = L0_311.faderAlpha
        L0_311 = L0_311(L1_312)
        if L0_311 == 0 then
          L0_311 = nil
          L1_312 = Ugc
          L2_313 = L1_312
          L1_312 = L1_312.findShowGhost
          L1_312 = L1_312(L2_313, L3_314)
          while true do
            L2_313 = L1_312.isValid
            L2_313 = L2_313(L3_314)
            if L2_313 == true then
              L2_313 = L1_312.loadReplay
              L2_313(L3_314)
              while true do
                L2_313 = L1_312.isLoading
                L2_313 = L2_313(L3_314)
                if L2_313 then
                  L2_313 = wait
                  L2_313()
                end
              end
              L2_313 = L1_312.get
              L2_313 = L2_313(L3_314)
              if L2_313 ~= nil then
                if L0_311 ~= nil then
                  if L3_314 == L4_315 then
                    L6_317 = " : "
                    L3_314(L4_315)
                    break
                  end
                else
                  if L3_314 ~= nil then
                    for L6_317, _FORV_7_ in L3_314(L4_315) do
                      if _FORV_7_.ghost:getName() == L2_313.onlineId then
                        while _FORV_7_.ghost:isReplayPlaying() do
                          wait()
                        end
                        debugPrintEventHeader(_FORV_7_.ghost:getName() .. " term")
                        _FORV_7_.ghost:try_term()
                        table.remove(__challeng_ghost_list[L2_310], L6_317)
                        break
                      end
                    end
                  end
                  L3_314(L4_315)
                  L6_317 = L2_313.onlineId
                  L4_315(L5_316, L6_317)
                  L6_317 = "ghost01"
                  L4_315(L5_316, L6_317)
                  L6_317 = L2_313.replay
                  L4_315(L5_316, L6_317)
                  L6_317 = GhostPuppet
                  L6_317 = L6_317.kGhostType_ReplayOnly
                  L4_315(L5_316, L6_317)
                  L6_317 = true
                  L4_315(L5_316, L6_317)
                  if L4_315 == nil then
                    L6_317 = {}
                    L4_315[L5_316] = L6_317
                  end
                  L0_311 = L2_313
                  L6_317 = L3_314
                  L6_317 = __challeng_ghost_list
                  L6_317 = L6_317[L2_310]
                  L5_316(L6_317, {ghost = L3_314, task = L4_315})
                end
            end
            else
              L3_314(L4_315)
            end
            L3_314(L4_315)
            L1_312 = L3_314
          end
          L2_313 = waitSeconds
          L2_313(L3_314)
        end
      end
    end)
  end
end
function playShowGhost(A0_318)
  A0_318:try_init()
  A0_318:waitForReady()
  A0_318:try_start()
  A0_318:setFade(0, 1, 1.5)
  A0_318:play()
  waitSeconds(3.5)
  A0_318:setFade(1, 0, 1.5)
  while not A0_318:isFadeEnd() do
    wait()
  end
  A0_318:pause()
end
function deleteShowGhost(A0_319)
  local L1_320
  L1_320 = debugPrintEventHeader
  L1_320("delete Show Ghost")
  L1_320 = A0_319.getName
  L1_320 = L1_320(A0_319)
  if __challeng_ghost_task[string.match(L1_320, "(.-)_()")] and __challeng_ghost_task[string.match(L1_320, "(.-)_()")]:isRunning() then
    __challeng_ghost_task[string.match(L1_320, "(.-)_()")]:abort()
  end
  __challeng_ghost_task[string.match(L1_320, "(.-)_()")] = nil
  if __challeng_ghost_list[string.match(L1_320, "(.-)_()")] then
    for _FORV_6_, _FORV_7_ in ipairs(__challeng_ghost_list[string.match(L1_320, "(.-)_()")]) do
      if _FORV_7_.task:isRunning() then
        _FORV_7_.task:abort()
      end
      if _FORV_7_.ghost:isRunning() then
        debugPrintEventHeader(_FORV_7_.ghost:getName() .. " term")
        _FORV_7_.ghost:setFade(1, 0, 1.5)
        _FORV_7_.ghost:try_term()
      else
        debugPrintEventHeader(_FORV_7_.ghost:getName() .. " kill")
        _FORV_7_.ghost:kill()
      end
    end
    __challeng_ghost_list[string.match(L1_320, "(.-)_()")] = {}
  end
end
function setShowGhostActive(A0_321)
  __challeng_ghost_active = A0_321
  if __challeng_ghost_list then
    for _FORV_4_, _FORV_5_ in pairs(__challeng_ghost_list) do
      if _FORV_5_.ghost and not _FORV_5_.ghost:isStopped() then
        _FORV_5_.ghost:setActive(A0_321)
      end
    end
  end
end
_debugTreasureBoxDisp = false
_debugTreasureBoxWarp = false
_debugTreasureBoxWarpTask = nil
_debugTreasureBoxAreaId = 1
_debugTreasureBoxLoctorId = 1
_debugTreasureBoxLoctorList = {
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"}
}
_debugTreasureGhostHdl = nil
_debugTreasureGhostAreaId = 1
_debugTreasureGhostLoctorId = 1
_debugTreasureGhostLoctorList = {
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"},
  {"None"}
}
function debugTreasureBox()
  local L0_322, L1_323, L2_324, L3_325, L4_326, L5_327, L6_328, L7_329, L8_330, L9_331, L10_332, L11_333, L12_334
  L0_322 = invokeTask
  function L1_323()
    while true do
      if HUD:faderAlpha() <= 0 then
        _debugTreasureBoxfindNode()
        break
      end
      wait()
    end
  end
  L0_322(L1_323)
  while true do
    L0_322 = _debugTreasureBoxDisp
    if L0_322 then
      __debugLine = 0
      L0_322 = debugDispPrint
      L1_323 = "- TreasureBox -"
      L0_322(L1_323)
      L0_322 = Rtc
      L1_323 = L0_322
      L0_322 = L0_322.localtime
      L0_322 = L0_322(L1_323)
      L1_323 = L0_322.year
      L2_324 = string
      L2_324 = L2_324.format
      L2_324 = L2_324(L3_325, L4_326)
      L1_323 = L1_323 .. L2_324 .. L3_325
      L2_324 = L0_322.hour
      L2_324 = L2_324 * 60
      L2_324 = L2_324 + L3_325
      for L6_328, L7_329 in L3_325(L4_326) do
        L8_330 = GameDatabase
        L9_331 = L8_330
        L8_330 = L8_330.get
        L10_332 = ggd
        L10_332 = L10_332[L7_329]
        L8_330 = L8_330(L9_331, L10_332)
        if L8_330 ~= "None" then
          L9_331 = string
          L9_331 = L9_331.find
          L10_332 = L8_330
          L11_333 = ":"
          L9_331 = L9_331(L10_332, L11_333)
          L10_332 = tonumber
          L11_333 = string
          L11_333 = L11_333.sub
          L12_334 = L8_330
          L12_334 = L11_333(L12_334, 1, L9_331 - 1)
          L10_332 = L10_332(L11_333, L12_334, L11_333(L12_334, 1, L9_331 - 1))
          L11_333 = tonumber
          L12_334 = string
          L12_334 = L12_334.sub
          L12_334 = L12_334(L8_330, L9_331 + 1, #L8_330)
          L11_333 = L11_333(L12_334, L12_334(L8_330, L9_331 + 1, #L8_330))
          L12_334 = 0
          if L10_332 and L11_333 and L1_323 - L10_332 == 0 then
            L12_334 = L2_324 - L11_333
          end
          debugDispPrint(string.sub(L7_329, #L7_329 - 1, #L7_329) .. " : wait " .. L12_334)
        else
          L9_331 = debugDispPrint
          L10_332 = string
          L10_332 = L10_332.sub
          L11_333 = L7_329
          L12_334 = #L7_329
          L12_334 = L12_334 - 1
          L10_332 = L10_332(L11_333, L12_334, #L7_329)
          L11_333 = " : OK"
          L10_332 = L10_332 .. L11_333
          L9_331(L10_332)
        end
      end
    end
    L0_322 = wait
    L0_322()
  end
end
function _debugTreasureBoxfindNode()
  local L0_335, L1_336, L2_337, L3_338, L4_339, L5_340, L6_341, L7_342, L8_343
  for L3_338 = 1, 8 do
    for L7_342 = 1, 100 do
      L8_343 = "locator2_tb_"
      L8_343 = L8_343 .. L3_338 .. string.format("%03d", L7_342)
      if findGameObject2("Node", L8_343) ~= nil then
        _debugTreasureBoxLoctorList[L3_338][L7_342] = L8_343
      else
        break
      end
    end
  end
end
function _debugTreasureGhostfindNode()
  local L0_344, L1_345, L2_346, L3_347, L4_348, L5_349, L6_350, L7_351, L8_352
  for L3_347 = 1, 8 do
    for L7_351 = 1, 100 do
      L8_352 = "locator2_tg_"
      L8_352 = L8_352 .. L3_347 .. string.format("%03d", L7_351)
      if findGameObject2("Node", L8_352) ~= nil then
        _debugTreasureGhostLoctorList[L3_347][L7_351] = L8_352
      else
        break
      end
    end
  end
end
function _debugTreasureBoxCreate()
  if _debugTreasureBoxWarp then
    debugPrintEventHeader("\233\128\163\231\182\154\227\131\175\227\131\188\227\131\151\227\130\146\231\166\129\230\173\162\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153")
  elseif __treasure_sb and __treasure_sb:isRunning() and not __treasure_sb:getBool("is_treasure_open") or __treasure_sb and __treasure_sb:isStopped() or __treasure_sb == nil then
    debugPrintEventHeader("\227\131\135\227\131\144\227\131\131\227\130\176\227\129\167\229\174\157\231\174\177\227\130\146\228\189\156\227\130\138\231\155\180\227\129\151\227\129\190\227\129\153")
    if __treasure_sb and __treasure_sb:isRunning() then
      __treasure_sb:sendEvent("kill")
    end
    __treasure_sb = nil
    if __treasure_task and __treasure_task:isRunning() then
      __treasure_task:abort()
    end
    __treasure_task = nil
    _debugTreasureBoxWarp = true
    _debugTreasureBoxWarpTask = invokeTask(function()
      local L0_353, L1_354, L2_355, L3_356
      L0_353 = _debugTreasureBoxLoctorList
      L1_354 = _debugTreasureBoxAreaId
      L0_353 = L0_353[L1_354]
      L1_354 = _debugTreasureBoxLoctorId
      L0_353 = L0_353[L1_354]
      if L0_353 ~= "None" then
        L0_353 = GameDatabase
        L1_354 = L0_353
        L0_353 = L0_353.set
        L2_355 = ggd
        L2_355 = L2_355.Savedata__TreasureFlags__Local__AreaId
        L3_356 = _debugTreasureBoxAreaId
        L0_353(L1_354, L2_355, L3_356)
        L0_353 = GameDatabase
        L1_354 = L0_353
        L0_353 = L0_353.set
        L2_355 = ggd
        L2_355 = L2_355.Savedata__TreasureFlags__Local__TBox
        L3_356 = _debugTreasureBoxLoctorList
        L3_356 = L3_356[_debugTreasureBoxAreaId]
        L3_356 = L3_356[_debugTreasureBoxLoctorId]
        L0_353(L1_354, L2_355, L3_356)
        L0_353 = findGameObject2
        L1_354 = "Node"
        L2_355 = _debugTreasureBoxLoctorList
        L3_356 = _debugTreasureBoxAreaId
        L2_355 = L2_355[L3_356]
        L3_356 = _debugTreasureBoxLoctorId
        L2_355 = L2_355[L3_356]
        L0_353 = L0_353(L1_354, L2_355)
        L1_354 = Player
        L2_355 = L1_354
        L1_354 = L1_354.getPuppet
        L1_354 = L1_354(L2_355)
        L2_355 = Fn_resetPcPos
        L3_356 = L0_353
        L2_355(L3_356)
        while true do
          L3_356 = L1_354
          L2_355 = L1_354.getWorldPos
          L2_355 = L2_355(L3_356)
          L3_356 = L0_353.getWorldPos
          L3_356 = L3_356(L0_353)
          if not (L2_355:DistanceTo(L3_356) > 1) then
            wait()
          end
        end
        L2_355 = GameDatabase
        L3_356 = L2_355
        L2_355 = L2_355.set
        L2_355(L3_356, ggd.GlobalSystemFlags__ActionDialogActive, false)
        L2_355 = invokeTask
        L3_356 = updateTreasureBox
        L2_355 = L2_355(L3_356, true)
        __treasure_task = L2_355
        _debugTreasureBoxWarp = false
        _debugTreasureBoxWarpTask = nil
      end
    end)
  else
    debugPrintEventHeader("\229\174\157\231\174\177\227\130\146\229\174\159\232\161\140\228\184\173\227\129\170\227\129\174\227\129\167\227\131\135\227\131\144\227\131\131\227\130\176\227\129\167\227\129\174\228\189\156\230\136\144\227\129\175\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
  end
end
debugTreasureGhostTask = nil
function _debugTreasureGhostCreate()
  if debugTreasureGhostTask == nil then
    debugTreasureGhostTask = invokeTask(function()
      local L0_357, L1_358
      L0_357 = findGameObject2
      L1_358 = "Node"
      L0_357 = L0_357(L1_358, _debugTreasureGhostLoctorList[_debugTreasureGhostAreaId][_debugTreasureGhostLoctorId])
      if L0_357 then
        L1_358 = _debugTreasureGhostHdl
        if L1_358 == nil then
          L1_358 = nil
          _debugTreasureGhostHdl, L1_358 = _createNetworkGhost("test", "ghost03", HUD.kGhostColor_Yellow, {
            {anim_name = "stay"}
          })
          L0_357:appendChild(_debugTreasureGhostHdl)
          _debugTreasureGhostHdl:try_init()
          _debugTreasureGhostHdl:waitForReady()
          _debugTreasureGhostHdl:try_start()
          _debugTreasureGhostHdl:setFade(0, 1, 1.5)
          _debugTreasureGhostHdl:play()
          L1_358:setActive(true)
        else
          L1_358 = L0_357.appendChild
          L1_358(L0_357, _debugTreasureGhostHdl)
        end
        L1_358 = Fn_resetPcPos
        L1_358(L0_357)
      end
      debugTreasureGhostTask = nil
    end)
  end
end
debugTreasureBoxNextTask = nil
debugTreasureBoxMenu = {
  name = "TBox",
  children = {
    {
      name = "TBox_Disp",
      callback = function()
        local L1_359
        L1_359 = _debugTreasureBoxDisp
        L1_359 = not L1_359
        _debugTreasureBoxDisp = L1_359
      end
    },
    {
      name = "TBox_SetNavi",
      callback = function()
        local L0_360, L1_361
        L0_360 = GameDatabase
        L1_361 = L0_360
        L0_360 = L0_360.get
        L0_360 = L0_360(L1_361, ggd.Savedata__TreasureFlags__Local__TBox)
        L1_361 = findGameObject2
        L1_361 = L1_361("Node", L0_360)
        if L1_361 and findGameObject2("Sandbox2", "treasure_box") then
          HUD:naviSetActivate(true)
          HUD:naviSetTarget(L1_361)
        end
      end
    },
    {
      name = "TBox_Reward",
      get = function()
        return GameDatabase:get(ggd.Debug__TBoxReward)
      end,
      up = function()
        GameDatabase:set(ggd.Debug__TBoxReward, not GameDatabase:get(ggd.Debug__TBoxReward))
      end,
      down = function()
        GameDatabase:set(ggd.Debug__TBoxReward, not GameDatabase:get(ggd.Debug__TBoxReward))
      end
    },
    {
      name = "TBox_RewardId",
      get = function()
        return GameDatabase:get(ggd.Debug__TBoxRewardId)
      end,
      up = function()
        local L0_362
        L0_362 = GameDatabase
        L0_362 = L0_362.get
        L0_362 = L0_362(L0_362, ggd.Debug__TBoxRewardId)
        L0_362 = L0_362 + 1
        if L0_362 > 58 then
          L0_362 = 1
        end
        GameDatabase:set(ggd.Debug__TBoxRewardId, L0_362)
      end,
      down = function()
        local L0_363
        L0_363 = GameDatabase
        L0_363 = L0_363.get
        L0_363 = L0_363(L0_363, ggd.Debug__TBoxRewardId)
        L0_363 = L0_363 - 1
        if L0_363 < 1 then
          L0_363 = 58
        end
        GameDatabase:set(ggd.Debug__TBoxRewardId, L0_363)
      end
    },
    {
      name = "TBox_RewardComp",
      callback = function()
        local L0_364, L1_365, L2_366, L3_367, L4_368
        L0_364(L1_365)
        for L3_367 = 1, 58 do
          L4_368 = GameDatabase
          L4_368 = L4_368.get
          L4_368 = L4_368(L4_368, ggd.Savedata__StatisticalChart__TreasureCount)
          L4_368 = L4_368 + 1
          if L4_368 > 9999999 then
            L4_368 = 9999999
          end
          GameDatabase:set(ggd.Savedata__StatisticalChart__TreasureCount, L4_368)
          GameDatabase:backup(ggd.Savedata__StatisticalChart)
          _rewardView("treasure", "tb" .. string.format("%02d", L3_367), false, true)
        end
      end
    },
    {
      name = "TBox_findNode",
      callback = function()
        _debugTreasureBoxfindNode()
      end
    },
    {
      name = "TBox_selectArea",
      get = function()
        return _getIdToAreaName(_debugTreasureBoxAreaId)
      end,
      up = function()
        local L0_369, L1_370
        L0_369 = _debugTreasureBoxAreaId
        L0_369 = L0_369 + 1
        _debugTreasureBoxAreaId = L0_369
        _debugTreasureBoxLoctorId = 1
        L0_369 = _debugTreasureBoxAreaId
        if L0_369 > 8 then
          _debugTreasureBoxAreaId = 1
        end
      end,
      down = function()
        local L0_371, L1_372
        L0_371 = _debugTreasureBoxAreaId
        L0_371 = L0_371 - 1
        _debugTreasureBoxAreaId = L0_371
        _debugTreasureBoxLoctorId = 1
        L0_371 = _debugTreasureBoxAreaId
        if L0_371 <= 0 then
          _debugTreasureBoxAreaId = 8
        end
      end
    },
    {
      name = "TBox_selectLoc ",
      get = function()
        local L0_373, L1_374
        L0_373 = _debugTreasureBoxLoctorList
        L1_374 = _debugTreasureBoxAreaId
        L0_373 = L0_373[L1_374]
        L1_374 = _debugTreasureBoxLoctorId
        L0_373 = L0_373[L1_374]
        return L0_373
      end,
      up = function()
        local L0_375, L1_376
        L0_375 = _debugTreasureBoxLoctorId
        L0_375 = L0_375 + 1
        _debugTreasureBoxLoctorId = L0_375
        L0_375 = _debugTreasureBoxLoctorId
        L1_376 = _debugTreasureBoxLoctorList
        L1_376 = L1_376[_debugTreasureBoxAreaId]
        L1_376 = #L1_376
        if L0_375 > L1_376 then
          _debugTreasureBoxLoctorId = 1
        end
      end,
      down = function()
        local L0_377
        L0_377 = _debugTreasureBoxLoctorId
        L0_377 = L0_377 - 1
        _debugTreasureBoxLoctorId = L0_377
        L0_377 = _debugTreasureBoxLoctorId
        if L0_377 <= 0 then
          L0_377 = _debugTreasureBoxLoctorList
          L0_377 = L0_377[_debugTreasureBoxAreaId]
          L0_377 = #L0_377
          _debugTreasureBoxLoctorId = L0_377
        end
      end
    },
    {
      name = "TBox_Create",
      callback = function()
        _debugTreasureBoxCreate()
      end
    },
    {
      name = "TBox_Next",
      callback = function()
        if debugTreasureBoxNextTask == nil then
          debugTreasureBoxNextTask = invokeTask(function()
            _debugTreasureBoxLoctorId = _debugTreasureBoxLoctorId + 1
            while _debugTreasureBoxLoctorList[_debugTreasureBoxAreaId][_debugTreasureBoxLoctorId] == nil or _debugTreasureBoxLoctorList[_debugTreasureBoxAreaId][_debugTreasureBoxLoctorId] == "None" do
              _debugTreasureBoxLoctorId = 1
              _debugTreasureBoxAreaId = _debugTreasureBoxAreaId + 1
              if _debugTreasureBoxAreaId > 8 then
                _debugTreasureBoxAreaId = 1
                do break end
                break
              end
              wait()
            end
            _debugTreasureBoxCreate()
            debugTreasureBoxNextTask = nil
          end)
        end
      end
    },
    {
      name = "TBox_Previous",
      callback = function()
        if debugTreasureBoxNextTask == nil then
          debugTreasureBoxNextTask = invokeTask(function()
            _debugTreasureBoxLoctorId = _debugTreasureBoxLoctorId - 1
            if _debugTreasureBoxLoctorId < 1 then
              _debugTreasureBoxAreaId = _debugTreasureBoxAreaId - 1
              if 1 > _debugTreasureBoxAreaId then
                _debugTreasureBoxAreaId = 8
              end
              _debugTreasureBoxLoctorId = #_debugTreasureBoxLoctorList[_debugTreasureBoxAreaId]
            end
            while _debugTreasureBoxLoctorList[_debugTreasureBoxAreaId][_debugTreasureBoxLoctorId] == nil or _debugTreasureBoxLoctorList[_debugTreasureBoxAreaId][_debugTreasureBoxLoctorId] == "None" do
              _debugTreasureBoxAreaId = _debugTreasureBoxAreaId - 1
              if 1 > _debugTreasureBoxAreaId then
                _debugTreasureBoxAreaId = 8
              end
              _debugTreasureBoxLoctorId = #_debugTreasureBoxLoctorList[_debugTreasureBoxAreaId]
              do break end
              do break end
              wait()
            end
            _debugTreasureBoxCreate()
            debugTreasureBoxNextTask = nil
          end)
        end
      end
    }
  }
}
debugTreasureGhostNextTask = nil
debugTreasureGhostMenu = {
  name = "TGhost",
  children = {
    {
      name = "TGhost_findNode",
      callback = function()
        _debugTreasureGhostfindNode()
      end
    },
    {
      name = "TGhost_selectArea",
      get = function()
        return _getIdToAreaName(_debugTreasureGhostAreaId)
      end,
      up = function()
        local L0_378, L1_379
        L0_378 = _debugTreasureGhostAreaId
        L0_378 = L0_378 + 1
        _debugTreasureGhostAreaId = L0_378
        _debugTreasureGhostLoctorId = 1
        L0_378 = _debugTreasureGhostAreaId
        if L0_378 > 8 then
          _debugTreasureGhostAreaId = 1
        end
      end,
      down = function()
        local L0_380, L1_381
        L0_380 = _debugTreasureGhostAreaId
        L0_380 = L0_380 - 1
        _debugTreasureGhostAreaId = L0_380
        _debugTreasureGhostLoctorId = 1
        L0_380 = _debugTreasureGhostAreaId
        if L0_380 <= 0 then
          _debugTreasureGhostAreaId = 8
        end
      end
    },
    {
      name = "TGhost_selectLoc ",
      get = function()
        local L0_382, L1_383
        L0_382 = _debugTreasureGhostLoctorList
        L1_383 = _debugTreasureGhostAreaId
        L0_382 = L0_382[L1_383]
        L1_383 = _debugTreasureGhostLoctorId
        L0_382 = L0_382[L1_383]
        return L0_382
      end,
      up = function()
        local L0_384, L1_385
        L0_384 = _debugTreasureGhostLoctorId
        L0_384 = L0_384 + 1
        _debugTreasureGhostLoctorId = L0_384
        L0_384 = _debugTreasureGhostLoctorId
        L1_385 = _debugTreasureGhostLoctorList
        L1_385 = L1_385[_debugTreasureGhostAreaId]
        L1_385 = #L1_385
        if L0_384 > L1_385 then
          _debugTreasureGhostLoctorId = 1
        end
      end,
      down = function()
        local L0_386
        L0_386 = _debugTreasureGhostLoctorId
        L0_386 = L0_386 - 1
        _debugTreasureGhostLoctorId = L0_386
        L0_386 = _debugTreasureGhostLoctorId
        if L0_386 <= 0 then
          L0_386 = _debugTreasureGhostLoctorList
          L0_386 = L0_386[_debugTreasureGhostAreaId]
          L0_386 = #L0_386
          _debugTreasureGhostLoctorId = L0_386
        end
      end
    },
    {
      name = "TGhost_Create",
      callback = function()
        _debugTreasureGhostCreate()
      end
    },
    {
      name = "TGhost_Next",
      callback = function()
        if debugTreasureGhostNextTask == nil then
          debugTreasureGhostNextTask = invokeTask(function()
            _debugTreasureGhostLoctorId = _debugTreasureGhostLoctorId + 1
            while _debugTreasureGhostLoctorList[_debugTreasureGhostAreaId][_debugTreasureGhostLoctorId] == nil or _debugTreasureGhostLoctorList[_debugTreasureGhostAreaId][_debugTreasureGhostLoctorId] == "None" do
              _debugTreasureGhostLoctorId = 1
              _debugTreasureGhostAreaId = _debugTreasureGhostAreaId + 1
              if _debugTreasureGhostAreaId > 8 then
                _debugTreasureGhostAreaId = 1
                do break end
                break
              end
              wait()
            end
            _debugTreasureGhostCreate()
            debugTreasureGhostNextTask = nil
          end)
        end
      end
    },
    {
      name = "TGhost_Previous",
      callback = function()
        if debugTreasureGhostNextTask == nil then
          debugTreasureGhostNextTask = invokeTask(function()
            _debugTreasureGhostLoctorId = _debugTreasureGhostLoctorId - 1
            if _debugTreasureGhostLoctorId < 1 then
              _debugTreasureGhostAreaId = _debugTreasureGhostAreaId - 1
              if 1 > _debugTreasureGhostAreaId then
                _debugTreasureGhostAreaId = 8
              end
              _debugTreasureGhostLoctorId = #_debugTreasureGhostLoctorList[_debugTreasureGhostAreaId]
            end
            while _debugTreasureGhostLoctorList[_debugTreasureGhostAreaId][_debugTreasureGhostLoctorId] == nil or _debugTreasureGhostLoctorList[_debugTreasureGhostAreaId][_debugTreasureGhostLoctorId] == "None" do
              _debugTreasureGhostAreaId = _debugTreasureGhostAreaId - 1
              if 1 > _debugTreasureGhostAreaId then
                _debugTreasureGhostAreaId = 8
              end
              _debugTreasureGhostLoctorId = #_debugTreasureGhostLoctorList[_debugTreasureGhostAreaId]
              do break end
              do break end
              wait()
            end
            _debugTreasureGhostCreate()
            debugTreasureGhostNextTask = nil
          end)
        end
      end
    }
  }
}
table.insert(g_customDebugMenu, debugTreasureBoxMenu)
table.insert(g_customDebugMenu, debugTreasureGhostMenu)
