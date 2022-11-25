import("math")
import("Debug")
import("HUD")
import("Font")
dbgCommon = {}
dbgCommon.kTypeInteger = 0 + 1
dbgCommon.kTypeNumber = 0 + 1 + 1
dbgCommon.kTypeNode = 0 + 1 + 1 + 1
dbgCommon.kTypeTable = 0 + 1 + 1 + 1 + 1
dbgCommon.kTypeBoolean = 0 + 1 + 1 + 1 + 1 + 1
dbgCommon.kTypeFunction = 0 + 1 + 1 + 1 + 1 + 1 + 1
dbgCommon.kKeyPrev = 0 + 1
dbgCommon.kKeyNext = 0 + 1 + 1
function dbgCommon.cbDefaultTypeLabel(A0_0)
  if A0_0.type == dbgCommon.kTypeInteger then
    return string.format("%d", A0_0.num)
  elseif A0_0.type == dbgCommon.kTypeNumber then
    return string.format("%.2f", A0_0.num)
  elseif A0_0.type == dbgCommon.kTypeNode then
  elseif A0_0.type == dbgCommon.kTypeTable then
    return dbgCommon.cbDefaultLabelTable(A0_0)
  elseif A0_0.type == dbgCommon.kTypeBoolean then
    if A0_0.data == true then
      return "ON"
    else
      return "OFF"
    end
  elseif A0_0.type == dbgCommon.kTypeFunction then
  end
  return ""
end
function dbgCommon.defaultTypeMove(A0_1, A1_2)
  if A0_1.type == dbgCommon.kTypeInteger then
    dbgCommon.defaultMoveNum(A0_1, A1_2)
  elseif A0_1.type == dbgCommon.kTypeNumber then
    dbgCommon.defaultMoveNum(A0_1, A1_2)
  elseif A0_1.type == dbgCommon.kTypeNode then
  elseif A0_1.type == dbgCommon.kTypeTable then
    dbgCommon.defaultMoveTable(A0_1, A1_2)
  elseif A0_1.type == dbgCommon.kTypeBoolean then
    if A0_1.data == true then
      A0_1.data = false
    else
      A0_1.data = true
    end
  elseif A0_1.type == dbgCommon.kTypeFunction then
  end
end
function dbgCommon.getDefaultTypeData(A0_3)
  if A0_3.type == dbgCommon.kTypeInteger then
    return A0_3.num
  elseif A0_3.type == dbgCommon.kTypeNumber then
    return A0_3.num
  elseif A0_3.type == dbgCommon.kTypeNode then
  elseif A0_3.type == dbgCommon.kTypeTable then
    return dbgCommon.cbDefaultDataTable(A0_3)
  elseif A0_3.type == dbgCommon.kTypeBoolean then
    return A0_3.data
  elseif A0_3.type == dbgCommon.kTypeFunction then
    return A0_3.data
  end
end
function dbgCommon.cbDefaultLabelTable(A0_4)
  local L1_5, L2_6
  L1_5 = A0_4.cursor
  L2_6 = A0_4[L1_5]
  if type(L2_6) == "number" then
    return string.format("%d", L2_6)
  elseif type(L2_6) == "string" then
    return L2_6
  elseif type(L2_6) == "table" and type(L2_6.name) == "string" then
    return L2_6.name
  end
  return "none"
end
function dbgCommon.cbDefaultDataTable(A0_7)
  local L2_8
  L2_8 = A0_7.cursor
  return A0_7[L2_8]
end
function dbgCommon.defaultMoveNum(A0_9, A1_10)
  local L2_11, L3_12
  L2_11 = dbgCommon
  L2_11 = L2_11.kKeyNext
  if A1_10 == L2_11 then
    L2_11 = A0_9.num
    L3_12 = A0_9.step
    L2_11 = L2_11 - L3_12
    A0_9.num = L2_11
  else
    L2_11 = dbgCommon
    L2_11 = L2_11.kKeyPrev
    if A1_10 == L2_11 then
      L2_11 = A0_9.num
      L3_12 = A0_9.step
      L2_11 = L2_11 + L3_12
      A0_9.num = L2_11
    end
  end
  L2_11 = A0_9.max
  L3_12 = A0_9.num
  if L2_11 < L3_12 then
    L2_11 = A0_9.min
    A0_9.num = L2_11
  else
    L2_11 = A0_9.num
    L3_12 = A0_9.min
    if L2_11 < L3_12 then
      L2_11 = A0_9.max
      A0_9.num = L2_11
    end
  end
end
function dbgCommon.defaultMoveTable(A0_13, A1_14)
  local L2_15
  L2_15 = A0_13.cursor
  if A1_14 == dbgCommon.kKeyNext then
    dbgCommon.move_node_cursor(A0_13, 1)
  elseif A1_14 == dbgCommon.kKeyPrev then
    dbgCommon.move_node_cursor(A0_13, -1)
  end
end
function dbgCommon.cbLabelPos(A0_16)
  return string.format("X:%4d Y:%4d", A0_16[1].num, A0_16[2].num)
end
function dbgCommon.pad_update()
  if dbgCommon.pad_counter == nil then
    dbgCommon.pad_counter = 0
  end
  if dbgCommon.pad_repeat_level == nil then
    dbgCommon.pad_repeat_level = 1
  end
  if Pad:getButton(Pad.kButton_LU) or Pad:getButton(Pad.kButton_LD) or Pad:getButton(Pad.kButton_LL) or Pad:getButton(Pad.kButton_LR) then
    dbgCommon.pad_counter = dbgCommon.pad_counter + 1
    if dbgCommon.pad_repeat_level == 1 and dbgCommon.pad_counter > 8 then
      dbgCommon.pad_repeat_level = dbgCommon.pad_repeat_level + 1
    elseif dbgCommon.pad_repeat_level == 2 and dbgCommon.pad_counter > 16 then
      dbgCommon.pad_repeat_level = dbgCommon.pad_repeat_level + 1
    elseif dbgCommon.pad_repeat_level == 3 and dbgCommon.pad_counter > 24 then
      dbgCommon.pad_repeat_level = dbgCommon.pad_repeat_level + 1
    end
  else
    dbgCommon.pad_repeat_level = 1
    dbgCommon.pad_counter = 0
  end
end
function dbgCommon.is_repeat_button(A0_17)
  if Pad:getButton(A0_17) then
    if dbgCommon.pad_repeat_level == 1 and dbgCommon.pad_counter % 8 == 1 then
      return true
    elseif dbgCommon.pad_repeat_level == 2 and dbgCommon.pad_counter % 4 == 1 then
      return true
    elseif dbgCommon.pad_repeat_level == 3 and dbgCommon.pad_counter % 2 == 1 then
      return true
    elseif dbgCommon.pad_repeat_level == 4 then
      return true
    elseif dbgCommon.pad_repeat_level == 5 then
      return true
    end
  end
  return false
end
function dbgCommon.get_repeat_num()
  local L0_18, L1_19
  L0_18 = dbgCommon
  L0_18 = L0_18.pad_repeat_level
  if L0_18 <= 4 then
    L0_18 = 1
    return L0_18
  else
    L0_18 = dbgCommon
    L0_18 = L0_18.pad_repeat_level
    if L0_18 == 5 then
      L0_18 = 8
      return L0_18
    end
  end
end
function dbgCommon.get_param(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25
  for L5_25 = 1, #A1_21 do
    if A1_21[L5_25].type == dbgCommon.kTypeNode then
      dbgCommon.get_param(A0_20, A1_21[L5_25])
    elseif A1_21[L5_25].type == dbgCommon.kTypeFunction then
    elseif A1_21[L5_25].data_name ~= nil then
      if type(A1_21[L5_25].get_data_free_format) == "function" then
        A1_21[L5_25].get_data_free_format(A1_21[L5_25], A0_20)
      elseif type(A1_21[L5_25].get_data) == "function" then
        A0_20[A1_21[L5_25].data_name] = A1_21[L5_25].get_data(A1_21[L5_25])
      else
        A0_20[A1_21[L5_25].data_name] = dbgCommon.getDefaultTypeData(A1_21[L5_25])
      end
    end
  end
end
function dbgCommon.cursor_init(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  for L4_30 = 1, #A0_26 do
    if A0_26[L4_30].cursor == nil then
      A0_26[L4_30].cursor = 1
    end
    if A0_26[L4_30].cursor_top == nil then
      A0_26[L4_30].cursor_top = 1
    end
    if A0_26[L4_30].type == dbgCommon.kTypeNode then
      dbgCommon.cursor_init(A0_26[L4_30])
    end
  end
end
function dbgCommon.function_execute(A0_31)
  if type(A0_31.prev) == "function" then
    A0_31.prev(A0_31)
  end
  if type(A0_31.data) == "function" then
    A0_31.data(A0_31)
  end
  if type(A0_31.after) == "function" then
    A0_31.after(A0_31)
  end
end
function dbgCommon.TreeExecute(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40
  A0_32.cursor = 1
  A0_32.cursor_top = 1
  L1_33 = dbgCommon
  L1_33 = L1_33.cursor_init
  L2_34 = A0_32
  L1_33(L2_34)
  L1_33 = type
  L2_34 = A0_32.init
  L1_33 = L1_33(L2_34)
  if L1_33 == "function" then
    L1_33 = A0_32.init
    L1_33()
  end
  L1_33 = dbgCommon
  L2_34 = A0_32.draw_num
  L2_34 = L2_34 or 24
  L1_33.draw_num = L2_34
  L1_33 = dbgCommon
  L1_33 = L1_33.draw_num
  L2_34 = dbgCommon
  L3_35 = A0_32.scroll_pos_up
  L3_35 = L3_35 or 11
  L2_34.scroll_pos_up = L3_35
  L2_34 = dbgCommon
  L3_35 = A0_32.scroll_pos_down
  L3_35 = L3_35 or 13
  L2_34.scroll_pos_down = L3_35
  L2_34 = dbgCommon
  L2_34 = L2_34.scroll_pos_up
  L3_35 = dbgCommon
  L3_35 = L3_35.scroll_pos_down
  L4_36 = A0_32.pos_x
  L4_36 = L4_36 or 100
  L5_37 = A0_32.pos_y
  L5_37 = L5_37 or 80
  L6_38 = 16
  L7_39 = A0_32
  L8_40 = false
  invokeTask(function()
    local L0_41, L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51
    while true do
      L0_41 = Debug
      L1_42 = L0_41
      L0_41 = L0_41.isDebugMenuOpen
      L0_41 = L0_41(L1_42)
      if L0_41 == false then
        L0_41 = dbgCommon
        L0_41 = L0_41.pad_update
        L0_41()
        L0_41 = L7_39.cursor
        L0_41 = L7_39[L0_41]
        L1_42 = L8_40
        if L1_42 == true then
          L1_42 = L0_41.type
          if L1_42 == L2_43 then
            L1_42 = Debug
            L1_42 = L1_42.screenPrint
            L1_42(L2_43, L3_44, L4_45, L5_46)
            L1_42 = L0_41.cursor
            for L7_48 = 1, L3_44 do
              L8_49 = L7_48 + L2_43
              L8_49 = L8_49 - 1
              L0_41.cursor = L8_49
              if L7_48 == 1 and L2_43 > 1 then
                label = "..."
              elseif L7_48 == L3_44 then
                L8_49 = L2_43 + L3_44
                L8_49 = L8_49 - 1
                L9_50 = #L0_41
                if L8_49 < L9_50 then
                  label = "..."
                end
              else
                L8_49 = type
                L9_50 = L0_41.label
                L8_49 = L8_49(L9_50)
                if L8_49 == "function" then
                  L8_49 = L0_41.label
                  L9_50 = L0_41
                  L8_49 = L8_49(L9_50)
                  label = L8_49
                else
                  L8_49 = dbgCommon
                  L8_49 = L8_49.cbDefaultTypeLabel
                  L9_50 = L0_41
                  L8_49 = L8_49(L9_50)
                  label = L8_49
                end
              end
              L8_49 = Debug
              L9_50 = L8_49
              L8_49 = L8_49.screenPrint
              L10_51 = L4_36
              L8_49(L9_50, L10_51, L5_37 + L6_38 * L7_48, string.format("%s", label or "none"))
            end
            L0_41.cursor = L1_42
            L8_49 = L6_38
            L9_50 = L1_42 - L2_43
            L9_50 = L9_50 + 1
            L8_49 = L8_49 * L9_50
            L8_49 = ">"
            L4_45(L5_46, L6_47, L7_48, L8_49)
          end
        else
          L1_42 = L7_39.prev_node
          if L1_42 ~= nil then
            L3_44(L4_45, L5_46, L6_47, L7_48)
          end
          for L8_49 = 1, L4_45 do
            L9_50 = L8_49 + L3_44
            L9_50 = L9_50 - 1
            L10_51 = nil
            if type(L7_39[L9_50].label) == "string" then
              L10_51 = L7_39[L9_50].label
            elseif type(L7_39[L9_50].label) == "function" then
              L10_51 = L7_39[L9_50].label(L7_39[L9_50])
            else
              L10_51 = dbgCommon.cbDefaultTypeLabel(L7_39[L9_50])
            end
            if L8_49 == 1 and L3_44 > 1 then
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("..."))
            elseif L8_49 == L4_45 and L3_44 + L4_45 - 1 < #L7_39 then
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("..."))
            elseif L8_40 == true and L7_39.cursor == L8_49 then
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("%-12s :<%s>", L7_39[L9_50].data_label or "", L10_51 or "none"))
            elseif L7_39[L9_50].type == dbgCommon.kTypeFunction then
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("%-12s>>", L7_39[L9_50].data_label or ""))
            elseif L7_39[L9_50].type == dbgCommon.kTypeNode or L7_39[L9_50].type == dbgCommon.kTypeTable then
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("%-12s > %s", L7_39[L9_50].data_label or "", L10_51 or "none"))
            else
              Debug:screenPrint(L4_36, L5_37 + L6_38 * L8_49, string.format("%-12s : %s", L7_39[L9_50].data_label or "", L10_51 or "none"))
            end
          end
          L8_49 = L5_37
          L9_50 = L6_38
          L10_51 = L2_43 - L3_44
          L10_51 = L10_51 + 1
          L9_50 = L9_50 * L10_51
          L8_49 = L8_49 + L9_50
          L9_50 = ">"
          L5_46(L6_47, L7_48, L8_49, L9_50)
        end
        L1_42 = HUD
        L1_42 = L1_42.testViewerGetKey
        L1_42 = L1_42(L2_43, L3_44)
        if not L1_42 then
          L1_42 = HUD
          L1_42 = L1_42.testViewerGetKey
          L1_42 = L1_42(L2_43, L3_44)
        else
          if L1_42 then
            L1_42 = wait
            L1_42(L2_43)
            L1_42 = type
            L1_42 = L1_42(L2_43)
            if L1_42 == "function" then
              L1_42 = A0_32.Execute
              L1_42(L2_43, L3_44)
            end
        end
        else
          L1_42 = HUD
          L1_42 = L1_42.testViewerGetKey
          L1_42 = L1_42(L2_43, L3_44)
          if L1_42 then
            L1_42 = L8_40
            if L1_42 == true then
              L1_42 = false
              L8_40 = L1_42
            else
              L1_42 = L7_39.prev_node
              if L1_42 ~= nil then
                L1_42 = L7_39.prev_node
                L7_39 = L1_42
              end
            end
          else
            L1_42 = HUD
            L1_42 = L1_42.testViewerGetKey
            L1_42 = L1_42(L2_43, L3_44)
            if L1_42 then
              L1_42 = L8_40
              if L1_42 == false then
                L1_42 = L0_41.type
                if L1_42 == L2_43 then
                  L1_42 = L7_39
                  L0_41.prev_node = L1_42
                  L7_39 = L0_41
                else
                  L1_42 = L0_41.type
                  if L1_42 == L2_43 then
                    L1_42 = dbgCommon
                    L1_42 = L1_42.function_execute
                    L1_42(L2_43)
                    L1_42 = L0_41.is_break
                    if L1_42 ~= true then
                      else
                        L1_42 = true
                        L8_40 = L1_42
                      end
                      else
                        L1_42 = false
                        L8_40 = L1_42
                      end
                      else
                        L1_42 = dbgCommon
                        L1_42 = L1_42.is_repeat_button
                        L1_42 = L1_42(L2_43)
                        if L1_42 then
                          L1_42 = dbgCommon
                          L1_42 = L1_42.get_repeat_num
                          L1_42 = L1_42()
                          for L5_46 = 1, L1_42 do
                            if L6_47 == true then
                              L8_49 = dbgCommon
                              L8_49 = L8_49.kKeyNext
                              L6_47(L7_48, L8_49)
                            else
                              L8_49 = 1
                              L6_47(L7_48, L8_49)
                            end
                          end
                        else
                          L1_42 = dbgCommon
                          L1_42 = L1_42.is_repeat_button
                          L1_42 = L1_42(L2_43)
                          if L1_42 then
                            L1_42 = dbgCommon
                            L1_42 = L1_42.get_repeat_num
                            L1_42 = L1_42()
                            for L5_46 = 1, L1_42 do
                              if L6_47 == true then
                                L8_49 = dbgCommon
                                L8_49 = L8_49.kKeyPrev
                                L6_47(L7_48, L8_49)
                              else
                                L8_49 = -1
                                L6_47(L7_48, L8_49)
                              end
                            end
                          end
                        end
                      end
                      L0_41 = type
                      L1_42 = A0_32.update
                      L0_41 = L0_41(L1_42)
                      if L0_41 == "function" then
                        L0_41 = A0_32.update
                        L0_41()
                      end
                      L0_41 = wait
                      L0_41()
                    end
                end
          end
        end
      end
    end
  end)
end
function dbgCommon.move_node_cursor(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L10_61, L11_62
  L2_54 = #A0_52
  L3_55 = #A0_52
  L4_56 = dbgCommon
  L4_56 = L4_56.draw_num
  if L3_55 > L4_56 then
    L3_55 = L4_56
  end
  L5_57 = dbgCommon
  L5_57 = L5_57.scroll_pos_up
  L6_58 = dbgCommon
  L6_58 = L6_58.scroll_pos_down
  L7_59 = A0_52.cursor_top
  L8_60 = L7_59 + L3_55
  L8_60 = L8_60 - 1
  L10_61 = A0_52.cursor
  L11_62 = L10_61 - L7_59
  L11_62 = L11_62 + 1
  if A1_53 > 0 then
    if L2_54 > L8_60 and L11_62 == L6_58 then
      A0_52.cursor_top = A0_52.cursor_top + A1_53
    end
    A0_52.cursor = A0_52.cursor + A1_53
    if L2_54 < A0_52.cursor then
      A0_52.cursor = 1
      A0_52.cursor_top = 1
    end
  elseif A1_53 < 0 then
    if L7_59 > 1 and L11_62 == L5_57 then
      A0_52.cursor_top = A0_52.cursor_top + A1_53
    end
    A0_52.cursor = A0_52.cursor + A1_53
    if 1 > A0_52.cursor then
      A0_52.cursor = L2_54
      A0_52.cursor_top = L2_54 - L3_55 + 1
    end
  end
end
dbgCommon.exit_list = {}
function dbgCommon.add_exit_func(A0_63)
  table.insert(dbgCommon.exit_list, A0_63)
end
function dbgCommon.exit_cb()
  local L1_64, L2_65
  for _FORV_3_ = 1, #L2_65 do
    dbgCommon.exit_list[_FORV_3_]()
  end
  L1_64.exit_list = L2_65
end
