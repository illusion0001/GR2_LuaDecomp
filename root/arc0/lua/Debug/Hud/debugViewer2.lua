import("math")
import("Debug")
import("HUD")
import("Font")
import("Pad")
dofile("/Debug/Hud/debugCommon.lua")
dofile("/Debug/Hud/debugViewerParam2.lua")
function debugViewer2_play_anim(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5
  if A0_0 ~= nil then
    for L5_5 = 1, #A0_0 do
      HUD:testViewerPlayAnim(A0_0[L5_5].node, A0_0[L5_5].anim, asset_table2.play_speed_tbl[A1_1])
    end
  end
end
function debugViewer2_step_frame(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11
  if A0_6 ~= nil then
    for L5_11 = 1, #A0_6 do
      HUD:testViewerSetAnimFrame(A0_6[L5_11].node, A0_6[L5_11].anim, A1_7)
    end
  end
end
function debugViewer2()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20
  L0_12 = 6
  L1_13 = 1
  L2_14 = 1
  L3_15 = 1
  for L7_19 = 1, #L5_17 do
    L8_20 = asset_table2
    L8_20 = L8_20[L7_19]
    L8_20 = L8_20.anim
    if L8_20 == nil then
      L8_20 = asset_table2
      L8_20 = L8_20[L7_19]
      L8_20.anim = {}
      L8_20 = asset_table2
      L8_20 = L8_20[L7_19]
      L8_20 = L8_20.anim
      L8_20[1] = {}
    end
    L8_20 = asset_table2
    L8_20 = L8_20[L7_19]
    L8_20 = L8_20.anim
    L8_20 = L8_20.cursor
    if L8_20 == nil then
      L8_20 = asset_table2
      L8_20 = L8_20[L7_19]
      L8_20 = L8_20.anim
      L8_20.cursor = 1
    end
  end
  L4_16.fov = 50
  L4_16.dist = 12
  L7_19 = 250
  L8_20 = 16
  invokeTask(function()
    local L0_21, L1_22, L2_23, L3_24, L4_25
    while true do
      L0_21 = dbgCommon
      L0_21 = L0_21.pad_update
      L0_21()
      L0_21 = asset_table2
      L1_22 = L2_14
      L0_21 = L0_21[L1_22]
      L1_22 = L0_21.anim
      L2_23 = L1_22.cursor
      L2_23 = L1_22[L2_23]
      L3_24 = L2_23.name
      L3_24 = L3_24 or ""
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 0, "ASSET NAME : " .. string.format("%s", L0_21.asset_name))
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 1, "ANIM NAME  : " .. string.format("%s", L3_24))
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 2, "PLAY SPEED : " .. string.format("%f", asset_table2.play_speed_tbl[L3_15]))
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 3, "PERS FOV   : " .. string.format("%f", L4_16.fov))
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 4, "PERS DIST  : " .. string.format("%f", L4_16.dist))
      L4_25 = Debug
      L4_25 = L4_25.screenPrint
      L4_25(L4_25, L6_18, L7_19 + L8_20 * 5, "STEP_FRAME : " .. string.format("%d", L5_17))
      L4_25 = HUD
      L4_25 = L4_25.testViewerGetAnimFrame
      L4_25 = L4_25(L4_25, L2_23[1].node, L2_23[1].anim)
      if L4_25 ~= nil then
        Debug:screenPrint(L6_18, L7_19 + L8_20 * 6, "TOTAL_FRAME  : " .. string.format("%d", L4_25))
      end
      Debug:screenPrint(L6_18 - 8, L7_19 + L8_20 * (L1_13 - 1), ">")
      if dbgCommon.is_repeat_button(Pad.kButton_LU) then
        L1_13 = L1_13 - 1
        if L1_13 < 1 then
          L1_13 = L0_12
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LD) then
        L1_13 = L1_13 + 1
        if L0_12 < L1_13 then
          L1_13 = 1
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LL) then
        if L1_13 == 1 then
          HUD:testViewerExit()
          L2_14 = L2_14 - 1
          if L2_14 < 1 then
            L2_14 = #asset_table2
          end
        elseif L1_13 == 2 then
          L1_22.cursor = L1_22.cursor - 1
          if L1_22.cursor < 1 then
            L1_22.cursor = #L1_22
          end
        elseif L1_13 == 3 then
          L3_15 = L3_15 - 1
          if L3_15 < 1 then
            L3_15 = #asset_table2.play_speed_tbl
          end
        elseif L1_13 == 4 then
          L4_16.fov = L4_16.fov - 1
          HUD:testViewerSetPersParam(L4_16)
        elseif L1_13 == 5 then
          L4_16.dist = L4_16.dist - 0.1
          HUD:testViewerSetPersParam(L4_16)
        elseif L1_13 == 6 then
          L5_17 = L5_17 - 1
          if L5_17 < -1 then
            if L4_25 ~= nil then
              L5_17 = L4_25
            else
              L5_17 = -1
            end
          end
          debugViewer2_step_frame(L2_23, L5_17)
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LR) then
        if L1_13 == 1 then
          HUD:testViewerExit()
          L2_14 = L2_14 + 1
          if #asset_table2 < L2_14 then
            L2_14 = 1
          end
        elseif L1_13 == 2 then
          L1_22.cursor = L1_22.cursor + 1
          if #L1_22 < L1_22.cursor then
            L1_22.cursor = 1
          end
        elseif L1_13 == 3 then
          L3_15 = L3_15 + 1
          if #asset_table2.play_speed_tbl < L3_15 then
            L3_15 = 1
          end
        elseif L1_13 == 4 then
          L4_16.fov = L4_16.fov + 1
          HUD:testViewerSetPersParam(L4_16)
        elseif L1_13 == 5 then
          L4_16.dist = L4_16.dist + 0.1
          HUD:testViewerSetPersParam(L4_16)
        elseif L1_13 == 6 then
          L5_17 = L5_17 + 1
          if L4_25 ~= nil then
            if L4_25 < L5_17 then
              L5_17 = -1
            end
          else
            L5_17 = -1
          end
          debugViewer2_step_frame(L2_23, L5_17)
        end
      elseif HUD:testViewerGetKey("Square") then
        if Pad:getButton(Pad.kButton_L1) then
          debugViewer2_play_anim(L2_23, L3_15)
        else
          HUD:testViewerExit()
          HUD:testViewerCreate(L0_21.asset_name, nil, nil, nil, nil, nil, asset_table2.play_speed_tbl[L3_15])
          wait(5)
          if L0_21.db_value ~= nil then
            for _FORV_8_ = 1, #L0_21.db_value do
              HUD:testViewerAddDBValue(L0_21.db_value[_FORV_8_].key, L0_21.db_value[_FORV_8_].value)
            end
          end
          if _FOR_ ~= nil then
            for _FORV_8_ = 1, #L0_21.text do
              HUD:testViewerAddText(L0_21.text[_FORV_8_].node, L0_21.text[_FORV_8_].text_id, L0_21.text[_FORV_8_].is_prev, L0_21.text[_FORV_8_].is_bloom)
            end
          end
          _FOR_:testViewerInit()
          wait(5)
          debugViewer2_play_anim(L2_23, L3_15)
          HUD:testViewerSetPersParam(L4_16)
        end
      end
      wait()
    end
  end)
end
