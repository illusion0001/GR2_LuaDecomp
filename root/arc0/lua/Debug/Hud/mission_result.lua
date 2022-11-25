L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = dofile
L0_0("/Debug/Hud/hud_setting.lua")
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
    data_name = "text_id_context",
    data_label = "text_id_context",
    "ui_challenge_perfect",
    "ui_caption_jimaku_3"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "layout_type",
    data_label = "layout_type",
    "normal",
    "battle"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "battle_result",
    data_label = "battle_result",
    get_data = L0_0.getCursor,
    "win",
    "lose",
    "drawgame"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "GetCoin",
    data_label = "GetCoin",
    0,
    1,
    10,
    100,
    1000,
    10000,
    100000,
    123456,
    567890,
    999999
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
        num = 1
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
        num = 2
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "HighScore_TimerSecond",
        data_name = "HighScore_TimerSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 10
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "HighScore_TimerComma",
        data_name = "HighScore_TimerComma",
        step = 1,
        min = 0,
        max = 99,
        num = 0
      }
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "CurrentScore",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "CurrentScore_Score",
      data_label = "CurrentScore_Score",
      step = 100,
      min = 0,
      max = 999999,
      num = 633
    },
    {
      type = dbgCommon.kTypeNode,
      data_label = "CurrentScore_Timer",
      {
        type = dbgCommon.kTypeInteger,
        data_label = "CurrentScore_TimerMinute",
        data_name = "CurrentScore_TimerMinute",
        step = 1,
        min = -1,
        max = 100,
        num = 1
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "CurrentScore_TimerSecond",
        data_name = "CurrentScore_TimerSecond",
        step = 1,
        min = 0,
        max = 59,
        num = 57
      },
      {
        type = dbgCommon.kTypeInteger,
        data_label = "CurrentScore_TimerComma",
        data_name = "CurrentScore_TimerComma",
        step = 1,
        min = 0,
        max = 99,
        num = 0
      }
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
  }
}
function test_mission_result()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
  L0_3 = test_hud_setting_net_service
  L0_3()
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {L3_6, L4_7}
  L3_6 = "Display"
  L4_7 = "Debug Draw"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "Default"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {L3_6, L4_7}
  L3_6 = "Display"
  L4_7 = "File Asset Status"
  L3_6 = false
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = {}
  L1_4 = L0_0.root
  L1_4.cursor = 1
  L1_4 = dbgCommon
  L1_4 = L1_4.cursor_init
  L2_5 = L0_0.root
  L1_4(L2_5)
  L1_4 = dbgCommon
  L2_5 = L0_0.root
  L2_5 = L2_5.draw_num
  L2_5 = L2_5 or 24
  L1_4.draw_num = L2_5
  L1_4 = 100
  L2_5 = 120
  L3_6 = 16
  L4_7 = L0_0.root
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
        L1_10 = L0_3.layout_type
        if L1_10 == "battle" then
          L1_10 = HUD
          L1_10 = L1_10.countDownFinishStart
          L1_10(L2_11, L3_12)
        else
          L1_10 = HUD
          L1_10 = L1_10.countDownFinishStart
          L1_10(L2_11)
        end
        while true do
          L1_10 = HUD
          L1_10 = L1_10.isAnimEndCountDown
          L1_10 = L1_10(L2_11)
          if L1_10 == false then
            L1_10 = wait
            L1_10()
          end
        end
        L1_10 = L0_3.mission_id
        if L1_10 == "None" then
          L0_3.mission_id = nil
        end
        L1_10 = HUD
        L1_10 = L1_10.missionResultOpen
        L1_10(L2_11, L3_12, L4_13)
        L1_10 = wait
        L1_10(L2_11)
        L1_10 = HUD
        L1_10 = L1_10.missionResultSelected
        L1_10 = L1_10(L2_11)
        if L1_10 == L2_11 then
          L2_11(L3_12)
        elseif L1_10 == L2_11 then
          L2_11(L3_12)
        else
          L2_11(L3_12)
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
