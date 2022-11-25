import("math")
import("Debug")
import("HUD")
import("Font")
import("Pad")
dofile("/Debug/Hud/debugCommon.lua")
dofile("/Debug/Hud/debugViewerParam.lua")
function debugViewerLocal()
  dofile("/Debug/Hud/debugViewerParamLocal.lua")
  debugViewer()
end
function debugViewerExit()
  HUD:testViewerExit()
end
function debugViewerSetPers(A0_0)
  HUD:testViewerSetPersParam(A0_0)
end
function debugViewer()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = 7
  L1_2 = 1
  L2_3 = 1
  L3_4 = 1
  for _FORV_7_ = 1, #L5_6 do
    if asset_table[_FORV_7_].node == nil then
      asset_table[_FORV_7_].node = {}
      asset_table[_FORV_7_].node[1] = {}
    end
    if asset_table[_FORV_7_].node.cursor == nil then
      asset_table[_FORV_7_].node.cursor = 1
    end
    for _FORV_11_ = 1, #asset_table[_FORV_7_].node do
      if asset_table[_FORV_7_].node[_FORV_11_].anim == nil then
        asset_table[_FORV_7_].node[_FORV_11_].anim = {}
      end
      if asset_table[_FORV_7_].node[_FORV_11_].anim.cursor == nil then
        asset_table[_FORV_7_].node[_FORV_11_].anim.cursor = 1
      end
    end
  end
  L4_5.fov = 50
  L4_5.dist = 12
  invokeTask(function()
    local L0_8, L1_9, L2_10, L3_11, L4_12
    while true do
      L0_8 = dbgCommon
      L0_8 = L0_8.pad_update
      L0_8()
      L0_8 = asset_table
      L1_9 = L2_3
      L0_8 = L0_8[L1_9]
      L1_9 = L0_8.node
      L2_10 = L1_9.cursor
      L2_10 = L1_9[L2_10]
      L3_11 = L2_10.anim
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 250, "ASSET NAME : " .. string.format("%s", L0_8.asset_name))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 266, "ANIM NODE  : " .. string.format("%s", L2_10.name or ""))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 282, "ANIM NAME  : " .. string.format("%s", L3_11[L3_11.cursor]))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 298, "PLAY SPEED : " .. string.format("%f", asset_table.play_speed_tbl[L3_4]))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 314, "PERS FOV   : " .. string.format("%f", L4_5.fov))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 330, "PERS DIST  : " .. string.format("%f", L4_5.dist))
      L4_12 = Debug
      L4_12 = L4_12.screenPrint
      L4_12(L4_12, 100, 346, "STEP_FRAME : " .. string.format("%d", L5_6))
      L4_12 = HUD
      L4_12 = L4_12.testViewerGetAnimFrame
      L4_12 = L4_12(L4_12, L2_10.name, L3_11[L3_11.cursor])
      if L4_12 ~= nil then
        Debug:screenPrint(100, 362, "TOTAL_FRAME  : " .. string.format("%d", L4_12))
      end
      Debug:screenPrint(92, 250 + 16 * (L1_2 - 1), ">")
      if dbgCommon.is_repeat_button(Pad.kButton_LU) then
        L1_2 = L1_2 - 1
        if L1_2 < 1 then
          L1_2 = L0_1
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LD) then
        L1_2 = L1_2 + 1
        if L0_1 < L1_2 then
          L1_2 = 1
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LL) then
        if L1_2 == 1 then
          HUD:testViewerExit()
          L6_7 = false
          L2_3 = L2_3 - 1
          if L2_3 < 1 then
            L2_3 = #asset_table
          end
        elseif L1_2 == 2 then
          L1_9.cursor = L1_9.cursor - 1
          if L1_9.cursor < 1 then
            L1_9.cursor = #L1_9
          end
        elseif L1_2 == 3 then
          L3_11.cursor = L3_11.cursor - 1
          if L3_11.cursor < 1 then
            L3_11.cursor = #L3_11
          end
        elseif L1_2 == 4 then
          L3_4 = L3_4 - 1
          if L3_4 < 1 then
            L3_4 = #asset_table.play_speed_tbl
          end
        elseif L1_2 == 5 then
          L4_5.fov = L4_5.fov - 1
          HUD:testViewerSetPersParam(L4_5)
        elseif L1_2 == 6 then
          L4_5.dist = L4_5.dist - 0.1
          HUD:testViewerSetPersParam(L4_5)
        elseif L1_2 == 7 then
          L5_6 = L5_6 - 1
          if L5_6 < -1 then
            if L4_12 ~= nil then
              L5_6 = L4_12
            else
              L5_6 = -1
            end
          end
          HUD:testViewerSetAnimFrame(L2_10.name, L3_11[L3_11.cursor], L5_6)
        end
      elseif dbgCommon.is_repeat_button(Pad.kButton_LR) then
        if L1_2 == 1 then
          L6_7 = false
          HUD:testViewerExit()
          L2_3 = L2_3 + 1
          if #asset_table < L2_3 then
            L2_3 = 1
          end
        elseif L1_2 == 2 then
          L1_9.cursor = L1_9.cursor + 1
          if #L1_9 < L1_9.cursor then
            L1_9.cursor = 1
          end
        elseif L1_2 == 3 then
          L3_11.cursor = L3_11.cursor + 1
          if #L3_11 < L3_11.cursor then
            L3_11.cursor = 1
          end
        elseif L1_2 == 4 then
          L3_4 = L3_4 + 1
          if #asset_table.play_speed_tbl < L3_4 then
            L3_4 = 1
          end
        elseif L1_2 == 5 then
          L4_5.fov = L4_5.fov + 1
          HUD:testViewerSetPersParam(L4_5)
        elseif L1_2 == 6 then
          L4_5.dist = L4_5.dist + 0.1
          HUD:testViewerSetPersParam(L4_5)
        elseif L1_2 == 7 then
          L5_6 = L5_6 + 1
          if L4_12 ~= nil then
            if L4_12 < L5_6 then
              L5_6 = -1
            end
          else
            L5_6 = -1
          end
          HUD:testViewerSetAnimFrame(L2_10.name, L3_11[L3_11.cursor], L5_6)
        end
      elseif HUD:testViewerGetKey("Square") then
        if L6_7 == true then
          HUD:testViewerPlayAnim(L2_10.name, L3_11[L3_11.cursor], asset_table.play_speed_tbl[L3_4])
        else
          L6_7 = true
          HUD:testViewerExit()
          HUD:testViewerCreate(L0_8.asset_name, L0_8.inout_anim_node, L0_8.in_anim_name, L0_8.out_anim_name, L2_10.name, L3_11[L3_11.cursor], asset_table.play_speed_tbl[L3_4])
          HUD:testViewerSetPersParam(L4_5)
          if L0_8.db_value ~= nil then
            for _FORV_8_ = 1, #L0_8.db_value do
              HUD:testViewerAddDBValue(L0_8.db_value[_FORV_8_].key, L0_8.db_value[_FORV_8_].value)
            end
          end
          if _FOR_ ~= nil then
            for _FORV_8_ = 1, #L0_8.text do
              HUD:testViewerAddText(L0_8.text[_FORV_8_].node, L0_8.text[_FORV_8_].text_id, L0_8.text[_FORV_8_].is_prev, L0_8.text[_FORV_8_].is_bloom)
            end
          end
          _FOR_:testViewerInit()
        end
      end
      wait()
    end
  end)
end
