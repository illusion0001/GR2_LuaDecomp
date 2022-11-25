import("math")
import("Debug")
import("HUD")
import("Font")
import("Camera")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Debug/Hud/debugViewerParam.lua")
dofile("/Debug/Hud/debugViewer.lua")
dofile("/Debug/Hud/debugViewer2.lua")
dofile("/Debug/Hud/in_game_preview.lua")
dofile("/Debug/Hud/counter999.lua")
dofile("/Debug/Hud/gem.lua")
dofile("/Debug/Hud/talisman.lua")
dofile("/Debug/Hud/minigauge.lua")
dofile("/Debug/Hud/hp_gauge.lua")
dofile("/Debug/Hud/countdown.lua")
dofile("/Debug/Hud/test_font.lua")
dofile("/Debug/Hud/multinavi.lua")
dofile("/Debug/Hud/enemy_marker.lua")
dofile("/Debug/Hud/caption.lua")
dofile("/Debug/Hud/common_ctrl_guide.lua")
dofile("/Debug/Hud/challenge_start.lua")
dofile("/Debug/Hud/action_dialog.lua")
dofile("/Debug/Hud/side_mission.lua")
dofile("/Debug/Hud/mission_result.lua")
dofile("/Debug/Hud/stack_telop.lua")
dofile("/Debug/Hud/sight_marker.lua")
dofile("/Debug/Hud/place_name.lua")
dofile("/Debug/Hud/ghost_marker.lua")
dofile("/Debug/Hud/fatal_marker.lua")
dofile("/Debug/Hud/loading.lua")
dofile("/Debug/Hud/selection.lua")
dofile("/Debug/Hud/photo.lua")
dofile("/Debug/Hud/lively_action.lua")
dofile("/Debug/Hud/treasure_start.lua")
dofile("/Debug/Hud/test_sound.lua")
dofile("/Debug/Hud/infomation.lua")
dofile("/Debug/Hud/popup_counter.lua")
dofile("/Debug/Hud/list_order.lua")
dofile("/Debug/Hud/playable_telop.lua")
dofile("/Debug/Hud/debugCommon.lua")
dofile("/Debug/Hud/capture_flag.lua")
dofile("/Debug/Hud/camera_common_counter.lua")
dofile("/Debug/Hud/yesno.lua")
dofile("/Debug/Hud/home.lua")
dofile("/Debug/Hud/mine_select.lua")
dofile("/Debug/Hud/credit.lua")
dofile("/Debug/Hud/modelation.lua")
dofile("/Debug/Hud/costume_change.lua")
dofile("/Debug/Hud/chapter.lua")
dofile("/Debug/Hud/lyricsSelect.lua")
dofile("/Debug/Hud/iconguide.lua")
main_table = {}
function main_table.setting(A0_0)
  wait(3)
  if A0_0.is_walk == true then
    test_hud_select_setup(true, true, A0_0.is_disable_photo)
  elseif A0_0.is_bg_none == true then
  else
    test_hud_select_setup(false, false, A0_0.is_disable_photo)
  end
  wait()
end
main_table.root = {
  {
    type = dbgCommon.kTypeNode,
    data_label = "Viewer",
    {
      type = dbgCommon.kTypeFunction,
      data = debugViewer,
      prev = main_table.setting,
      data_label = "HUD_VIEWER",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = debugViewerLocal,
      prev = main_table.setting,
      data_label = "HUD_VIEWER_LOCAL",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = debugFont,
      data_label = "FONT_TEST",
      is_break = true,
      is_bg_none = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = debugViewer2,
      prev = main_table.setting,
      data_label = "HUD_VIEWER2",
      is_break = true
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Menu",
    {
      type = dbgCommon.kTypeFunction,
      data = test_photo_save_collect,
      prev = main_table.setting,
      data_label = "COLLECT_SAVE",
      is_walk = true,
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_treasure_start,
      prev = main_table.setting,
      data_label = "TREASURE_START",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_treasure_send,
      prev = main_table.setting,
      data_label = "TREASURE_SEND",
      is_walk = true,
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_photo_review,
      prev = main_table.setting,
      data_label = "PHOTO_REVIEW",
      is_walk = true,
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_challenge_start,
      prev = main_table.setting,
      data_label = "CHALLENGE_START",
      is_break = true,
      is_walk = true,
      is_disable_photo = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_mission_result,
      prev = main_table.setting,
      data_label = "MISSION_RESULT",
      is_break = true,
      is_walk = true,
      is_disable_photo = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_infomation,
      prev = main_table.setting,
      data_label = "INFOMATION",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_mine_select,
      prev = main_table.setting,
      data_label = "MINE_SELECT",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_costume_change,
      prev = main_table.setting,
      data_label = "COSTUME_CHANGE",
      is_walk = true,
      is_break = true
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Marker",
    {
      type = dbgCommon.kTypeFunction,
      data = test_multinavi,
      prev = main_table.setting,
      data_label = "MULTINAVI",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_enemy_marker,
      prev = main_table.setting,
      data_label = "ENEMY_MARKER_TEST",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_sight_marker,
      prev = main_table.setting,
      data_label = "SIGHT_MARKER",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_ghost_marker,
      prev = main_table.setting,
      data_label = "GHOST_MARKER_TEST",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_fatal_marker,
      prev = main_table.setting,
      data_label = "FATAL_MARKER_TEST",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_fatal_multi,
      prev = main_table.setting,
      data_label = "FATAL_MULTI_TEST",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_fatal_parallel,
      prev = main_table.setting,
      data_label = "FATAL_PARALLEL_TEST",
      is_break = true,
      is_walk = true
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "CommonCounter",
    {
      type = dbgCommon.kTypeFunction,
      data = test_gem,
      prev = main_table.setting,
      data_label = "GEM",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_counter999,
      prev = main_table.setting,
      data_label = "COUNT999",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_minigauge,
      prev = main_table.setting,
      data_label = "MINIGAUGE",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_talisman,
      prev = main_table.setting,
      data_label = "TALISMAN",
      is_break = true
    }
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_hp_gauge_walk,
    prev = main_table.setting,
    data_label = "HP_GAUGE",
    is_break = true,
    is_walk = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_popup_counter,
    prev = main_table.setting,
    data_label = "POPUP_COUNTER",
    is_break = true,
    is_walk = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_playable_telop,
    prev = main_table.setting,
    data_label = "PLAYABLE_TELOP",
    is_break = true,
    is_walk = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_list_order,
    prev = main_table.setting,
    data_label = "LIST_ORDER",
    is_break = true,
    is_walk = true
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "PlaceName",
    {
      type = dbgCommon.kTypeFunction,
      data = test_place_name,
      prev = main_table.setting,
      data_label = "PLACE_NAME",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_place_name,
      prev = main_table.setting,
      data_label = "PLACE_NAME_WALK",
      is_break = true,
      is_walk = true
    }
  },
  {
    type = dbgCommon.kTypeFunction,
    data = testSoundFunc,
    data_label = "SOUND_TEST",
    is_break = true,
    is_bg_none = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = testSoundAllFunc,
    data_label = "SOUND_TEST_ALL",
    is_break = true,
    is_bg_none = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_ingame_preview,
    prev = main_table.setting,
    data_label = "INGAME_PREVIEW",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_countdown,
    prev = main_table.setting,
    data_label = "COUNTDOWN",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_caption,
    prev = main_table.setting,
    data_label = "CAPTION",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_common_ctrl_guide,
    prev = main_table.setting,
    data_label = "COMMON_CTRL_GUIDE",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_selection,
    prev = main_table.setting,
    data_label = "COMMON_SELECTION",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_action_dialog,
    prev = main_table.setting,
    data_label = "ACTION_DIALOG",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_side_mission,
    prev = main_table.setting,
    data_label = "SIDE_MISSION",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_stack_telop,
    prev = main_table.setting,
    data_label = "STACK_TELOP",
    is_break = true
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Photo",
    {
      type = dbgCommon.kTypeFunction,
      data = test_photo,
      prev = main_table.setting,
      data_label = "PHOTO_TEST",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_photo_camera,
      prev = main_table.setting,
      data_label = "PHOTO_CAMERA_TEST",
      is_break = true,
      is_walk = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_photo_upload_init,
      data_label = "PHOTO_UPLOAD_TEST",
      is_break = true
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "LoadingTest",
    {
      type = dbgCommon.kTypeFunction,
      data = test_loading,
      prev = main_table.setting,
      data_label = "LOADING_TEST",
      is_break = true
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_loading_load_begin,
      data_label = "LOADING_BEGIN"
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_loading_load_begin_autosave,
      data_label = "LOADING_BEGIN_AUTOSAVE"
    },
    {
      type = dbgCommon.kTypeFunction,
      data = test_loading_load_end,
      data_label = "LOADING_END"
    }
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_lively_action,
    data_label = "LIVELY_ACTION",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data_label = "WALK",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_capture_flag_ui,
    data_label = "CAPTURE_FLAG",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_camera_common_counter,
    data_label = "CAMERA_COMMON_COUNTER",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_yesno,
    prev = main_table.setting,
    data_label = "COMMON_YESNO",
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_home_ui,
    data_label = "HOME",
    is_walk = false,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_credit,
    data_label = "CREDIT",
    is_walk = false,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_modelation_ui,
    data_label = "MODELATION",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_chapter,
    data_label = "CHAPTER",
    is_walk = false,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_lyricsSelect,
    data_label = "LyricsSelect",
    is_walk = false,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    prev = main_table.setting,
    data = test_iconguide,
    data_label = "IconGuide",
    is_walk = true,
    is_break = true
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_infomation_direct,
    data_label = "INFOMATION_DIRECT"
  }
}
function main()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "Debug Draw GameObject"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "FIOS2Driver Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, true)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Display",
    "HUD",
    "Off debug print"
  }, true)
  Debug:setSwitch({
    "Development",
    "Console",
    "Standard"
  }, true)
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  HUD:setUserControlLock(true)
  setExitCallback(dbgCommon.exit_cb)
  HUD:enablePhotoMode(false)
  HUD:enableGesture(false)
  dbgCommon.add_exit_func(exit)
  dbgCommon.TreeExecute(main_table.root)
end
function exit()
  HUD:setUserControlLock(false)
  HUD:enablePhotoMode(true)
  HUD:enableGesture(true)
end
TestStage = {
  enter = function(A0_1)
    A0_1.area = DebugStage:createTestStage()
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    tune = Player.kAttrTune_Normal
    Player:setAttrTune(tune, true)
    HUD:hpgDispReq_FadeIn()
    HUD:grgDispReq_FadeIn()
    HUD:spgDispReq_FadeIn()
    Debug:setSwitch({"Display", "Debug Draw"}, true)
    Debug:setSwitch({
      "Display",
      "File Asset Status"
    }, false)
    Debug:setSwitch({
      "Display",
      "Warning Indicator"
    }, false)
    HUD:enablePhotoMode(false)
    HUD:enableGesture(false)
    Debug_RegisterSpawners()
  end
}
function test_hud_select_setup(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8
  if A0_2 then
    L3_5 = HUD
    L4_6 = L3_5
    L3_5 = L3_5.menuOpen
    L5_7 = "Main"
    L3_5(L4_6, L5_7)
  end
  L3_5 = HUD
  L4_6 = L3_5
  L3_5 = L3_5.menuOpen
  L5_7 = "Gameover"
  L3_5(L4_6, L5_7)
  L3_5 = HUD
  L4_6 = L3_5
  L3_5 = L3_5.debugLoadWithPlayerCharacter
  L3_5(L4_6)
  if A1_3 then
    L3_5 = TestStage
    L4_6 = L3_5
    L3_5 = L3_5.enter
    L3_5(L4_6)
  else
    L3_5 = DebugStage
    L4_6 = L3_5
    L3_5 = L3_5.createTestStage
    L3_5 = L3_5(L4_6)
    L4_6 = initializeAllGameObjects
    L4_6()
    L4_6 = waitForReadyAllGameObjects
    L4_6()
    L4_6 = startAllGameObjects
    L4_6()
    L4_6 = Debug
    L5_7 = L4_6
    L4_6 = L4_6.setEnableDebugCamera
    L6_8 = true
    L4_6(L5_7, L6_8)
    L4_6 = Vector
    L5_7 = -16
    L6_8 = 2.0501
    L4_6 = L4_6(L5_7, L6_8, 82)
    L5_7 = Vector
    L6_8 = 0
    L5_7 = L5_7(L6_8, 0, 0)
    L6_8 = Vector
    L6_8 = L6_8(0, 1, 0)
    Debug:resetDebugCamera(L4_6, L5_7, L6_8)
    HUD:testResetPad(HUD.kTestAssignLayer_PhotoMode)
  end
  if A2_4 then
    L3_5 = HUD
    L4_6 = L3_5
    L3_5 = L3_5.testResetPad
    L5_7 = HUD
    L5_7 = L5_7.kTestAssignLayer_PhotoMode
    L3_5(L4_6, L5_7)
  end
  L3_5 = print
  L4_6 = "init all"
  L3_5(L4_6)
  L3_5 = initializeAllGameObjects
  L3_5()
  L3_5 = print
  L4_6 = "wait ready all"
  L3_5(L4_6)
  L3_5 = waitForReadyAllGameObjects
  L3_5()
  L3_5 = print
  L4_6 = "start all"
  L3_5(L4_6)
  L3_5 = startAllGameObjects
  L3_5()
end
