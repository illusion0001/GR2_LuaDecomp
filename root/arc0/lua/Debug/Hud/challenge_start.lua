L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = import
L0_0("GameDatabase")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = {}
function L0_0.getCursor(A0_1)
  local L1_2
  L1_2 = A0_1.cursor
  return L1_2
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "mission_id",
    data_label = "mission_id",
    "None",
    "cm90",
    "cm01",
    "cm02",
    "cm03",
    "cm04",
    "cm05",
    "cm06",
    "cm07",
    "cm08",
    "cm09",
    "cm10",
    "cm11",
    "cm12",
    "cm13",
    "cm14",
    "cm15",
    "cm16",
    "cm17",
    "cm18",
    "cm19",
    "cm20"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id_msg_window_header",
    data_label = "text_id_msg_window_header",
    "ui_challenge_main1_01",
    "ui_caption_jimaku_3"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id_msg_window_context",
    data_label = "text_id_msg_window_context",
    "ui_challenge_main2_01",
    "ui_caption_jimaku_3"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id_context",
    data_label = "text_id_context",
    "ui_challenge_perfect",
    "ui_caption_jimaku_3"
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Score",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Score1st",
      data_label = "Score1st",
      step = 100,
      min = 0,
      max = 999999,
      num = 300000
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Score2nd",
      data_label = "Score2nd",
      step = 100,
      min = 0,
      max = 999999,
      num = 200000
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Score3rd",
      data_label = "Score3rd",
      step = 100,
      min = 0,
      max = 999999,
      num = 100000
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Timer",
    {
      type = dbgCommon.kTypeNode,
      data_label = "Timer1st",
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer1stMinute",
        data_name = "Timer1stMinute",
        step = 1,
        min = 0,
        max = 9,
        num = 0
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer1stSecond",
        data_name = "Timer1stSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 2
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer1stComma",
        data_name = "Timer1stComma",
        step = 1,
        min = 0,
        max = 99,
        num = 30
      }
    },
    {
      type = dbgCommon.kTypeNode,
      data_label = "Timer2nd",
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer2ndMinute",
        data_name = "Timer2ndMinute",
        step = 1,
        min = 0,
        max = 9,
        num = 0
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer2ndSecond",
        data_name = "Timer2ndSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 3
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer2ndComma",
        data_name = "Timer2ndComma",
        step = 1,
        min = 0,
        max = 99,
        num = 0
      }
    },
    {
      type = dbgCommon.kTypeNode,
      data_label = "Timer3rd",
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer3rdMinute",
        data_name = "Timer3rdMinute",
        step = 1,
        min = 0,
        max = 9,
        num = 0
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer3rdSecond",
        data_name = "Timer3rdSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 3
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "Timer3rdComma",
        data_name = "Timer3rdComma",
        step = 1,
        min = 0,
        max = 99,
        num = 30
      }
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Gem",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Gem1st",
      data_label = "Gem1st",
      step = 100,
      min = 0,
      max = 99999,
      num = 30000
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Gem2nd",
      data_label = "Gem2nd",
      step = 100,
      min = 0,
      max = 99999,
      num = 5000
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Gem3rd",
      data_label = "Gem3rd",
      step = 100,
      min = 0,
      max = 99999,
      num = 100
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "HighScore",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "HighScore_Score",
      data_label = "HighScore_Score",
      step = 100,
      min = 0,
      max = 999999,
      num = 633
    },
    {
      type = dbgCommon.kTypeNode,
      data_label = "HighScore_Timer",
      {
        type = dbgCommon.kTypeInteger,
        data_label = "HighScore_TimerMinute",
        data_name = "HighScore_TimerMinute",
        step = 1,
        min = -1,
        max = 100,
        num = 0
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "HighScore_TimerSecond",
        data_name = "HighScore_TimerSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 1
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "HighScore_TimerComma",
        data_name = "HighScore_TimerComma",
        step = 1,
        min = 0,
        max = 99,
        num = 57
      }
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "HighScore_NoRecord",
      data_label = "HighScore_NoRecord",
      data = false
    }
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "record_type",
    data_label = "record_type",
    get_data = L0_0.getCursor,
    cursor = 2,
    "score",
    "timer"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "screen_mp4_name",
    data_label = "screen_mp4",
    "cm/cm90",
    "none"
  },
  {
    type = dbgCommon.kTypeBoolean,
    data_name = "enable_ghost_battle",
    data_label = "enable_ghost_battle",
    data = true
  }
}
function test_challenge_start()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L5_8 = "Default"
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = {}
  L5_8 = "ep13"
  for L5_8 = 1, #L1_4 do
    GameDatabase:set(ggd["Savedata__EventFinishedFlags__" .. L1_4[L5_8]], 1)
  end
  L5_8 = "cm04"
  for L5_8 = 1, #L1_4 do
    GameDatabase:set(ggd["Savedata__Menu__EventStateFlags__" .. L1_4[L5_8]], 1)
  end
  for L4_7 = 1, 200 do
    L5_8 = Debug
    L5_8 = L5_8.setSwitch
    L5_8(L5_8, {
      "Development",
      "UI",
      "News",
      "Add"
    })
  end
  L1_4.cursor = 1
  L1_4(L2_5)
  L5_8 = false
  invokeTask(function()
    local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15
    while true do
      L0_9 = dbgCommon
      L0_9 = L0_9.pad_update
      L0_9()
      L0_9 = L4_7.cursor
      L0_9 = L4_7[L0_9]
      L1_10 = L5_8
      if L1_10 == true then
        L1_10 = L0_9.type
        if L1_10 == L2_11 then
          L1_10 = Debug
          L1_10 = L1_10.screenPrint
          L5_14 = L0_9.data_label
          L1_10(L2_11, L3_12, L4_13, L5_14)
          L1_10 = L0_9.cursor
          for L5_14 = 1, #L0_9 do
            L0_9.cursor = L5_14
            L6_15 = type
            L6_15 = L6_15(L0_9.label)
            if L6_15 == "function" then
              L6_15 = L0_9.label
              L6_15 = L6_15(L0_9)
              label = L6_15
            else
              L6_15 = dbgCommon
              L6_15 = L6_15.cbDefaultTypeLabel
              L6_15 = L6_15(L0_9)
              label = L6_15
            end
            L6_15 = Debug
            L6_15 = L6_15.screenPrint
            L6_15(L6_15, L1_4, L2_5 + L3_6 * L5_14, string.format("%s", label or "none"))
          end
          L0_9.cursor = L1_10
          L5_14 = L2_5
          L6_15 = L3_6
          L6_15 = L6_15 * L0_9.cursor
          L5_14 = L5_14 + L6_15
          L6_15 = ">"
          L2_11(L3_12, L4_13, L5_14, L6_15)
        end
      else
        L1_10 = L4_7.prev_node
        if L1_10 ~= nil then
          L5_14 = L1_4
          L5_14 = L5_14 - 8
          L6_15 = L2_5
          L3_12(L4_13, L5_14, L6_15, L2_11.data_label or "")
        end
        for L5_14 = 1, #L3_12 do
          L6_15 = nil
          if type(L4_7[L5_14].label) == "string" then
            L6_15 = L4_7[L5_14].label
          elseif type(L4_7[L5_14].label) == "function" then
            L6_15 = L4_7[L5_14].label(L4_7[L5_14])
          else
            L6_15 = dbgCommon.cbDefaultTypeLabel(L4_7[L5_14])
          end
          if L5_8 == true and L4_7.cursor == L5_14 then
            Debug:screenPrint(L1_4, L2_5 + L3_6 * L5_14, string.format("%-12s :<%s>", L4_7[L5_14].data_label or "", L6_15 or "none"))
          elseif L4_7[L5_14].type == dbgCommon.kTypeNode or L4_7[L5_14].type == dbgCommon.kTypeTable then
            Debug:screenPrint(L1_4, L2_5 + L3_6 * L5_14, string.format("%-12s > %s", L4_7[L5_14].data_label or "", L6_15 or "none"))
          else
            Debug:screenPrint(L1_4, L2_5 + L3_6 * L5_14, string.format("%-12s : %s", L4_7[L5_14].data_label or "", L6_15 or "none"))
          end
        end
        L5_14 = L2_5
        L6_15 = L3_6
        L6_15 = L6_15 * L4_7.cursor
        L5_14 = L5_14 + L6_15
        L6_15 = ">"
        L2_11(L3_12, L4_13, L5_14, L6_15)
      end
      L1_10 = HUD
      L1_10 = L1_10.testViewerGetKey
      L1_10 = L1_10(L2_11, L3_12)
      if L1_10 then
        L1_10 = wait
        L1_10(L2_11)
        L1_10 = {}
        L0_3 = L1_10
        L1_10 = dbgCommon
        L1_10 = L1_10.get_param
        L1_10(L2_11, L3_12)
        L1_10 = L0_3.mission_id
        if L1_10 == "None" then
          L0_3.mission_id = nil
        end
        L1_10 = HUD
        L1_10 = L1_10.challengeStartOpen
        L1_10(L2_11, L3_12, L4_13)
        L1_10 = wait
        L1_10()
        L1_10 = HUD
        L1_10 = L1_10.challengeStartResult
        L1_10 = L1_10(L2_11)
        if L1_10 == L3_12 then
          L3_12(L4_13)
          L3_12(L4_13)
        elseif L1_10 == L3_12 then
          L3_12(L4_13)
        else
          L3_12(L4_13)
        end
      else
        L1_10 = HUD
        L1_10 = L1_10.testViewerGetKey
        L1_10 = L1_10(L2_11, L3_12)
        if L1_10 then
          L1_10 = L5_8
          if L1_10 == true then
            L1_10 = false
            L5_8 = L1_10
          else
            L1_10 = L4_7.prev_node
            if L1_10 ~= nil then
              L1_10 = L4_7.prev_node
              L4_7 = L1_10
            end
          end
        else
          L1_10 = HUD
          L1_10 = L1_10.testViewerGetKey
          L1_10 = L1_10(L2_11, L3_12)
          if L1_10 then
            L1_10 = L5_8
            if L1_10 == false then
              L1_10 = L0_9.type
              if L1_10 == L2_11 then
                L1_10 = L4_7
                L0_9.prev_node = L1_10
                L4_7 = L0_9
              else
                L1_10 = true
                L5_8 = L1_10
              end
            else
              L1_10 = false
              L5_8 = L1_10
            end
          else
            L1_10 = dbgCommon
            L1_10 = L1_10.is_repeat_button
            L1_10 = L1_10(L2_11)
            if L1_10 then
              L1_10 = L5_8
              if L1_10 == true then
                L1_10 = dbgCommon
                L1_10 = L1_10.defaultTypeMove
                L1_10(L2_11, L3_12)
              else
                L1_10 = L4_7.cursor
                L1_10 = L1_10 + 1
                L4_7.cursor = L1_10
                L1_10 = L4_7
                L1_10 = #L1_10
                if L1_10 < L2_11 then
                  L4_7.cursor = 1
                end
              end
            else
              L1_10 = dbgCommon
              L1_10 = L1_10.is_repeat_button
              L1_10 = L1_10(L2_11)
              if L1_10 then
                L1_10 = L5_8
                if L1_10 == true then
                  L1_10 = dbgCommon
                  L1_10 = L1_10.defaultTypeMove
                  L1_10(L2_11, L3_12)
                else
                  L1_10 = L4_7.cursor
                  L1_10 = L1_10 - 1
                  L4_7.cursor = L1_10
                  L1_10 = L4_7.cursor
                  if L1_10 < 1 then
                    L1_10 = L4_7
                    L1_10 = #L1_10
                    L4_7.cursor = L1_10
                  end
                end
              end
            end
          end
        end
      end
      L1_10 = wait
      L1_10()
    end
  end)
end
