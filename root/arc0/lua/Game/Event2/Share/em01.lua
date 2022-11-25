import("math")
import("EventData")
import("Font")
import("HUD")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
event_data = nil
timer_finish = false
function setLivestock()
  local L0_0, L1_1
  L0_0 = loadFileAsset
  L1_1 = "evb"
  L0_0 = L0_0(L1_1, "evx/em01")
  if L0_0 ~= nil then
    L1_1 = L0_0.wait
    L1_1(L0_0)
    L1_1 = L0_0.getRoot
    L1_1 = L1_1(L0_0)
    event_data = EventData:create("em01", nil, L1_1)
    event_data:try_init()
    event_data:waitForReady()
    event_data:try_start()
    L1_1 = nil
  end
  L0_0 = nil
  L1_1 = HUD
  L1_1 = L1_1.counter99_99SetTextID
  L1_1(L1_1, "ui_hud_counter_slash_02")
  L1_1 = HUD
  L1_1 = L1_1.counter99_99SetMax
  L1_1(L1_1, 5)
  L1_1 = HUD
  L1_1 = L1_1.counter99_99SetNum
  L1_1(L1_1, 0)
end
function runLivestock(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L1_3 = 5
  L2_4 = 10
  L3_5 = {}
  for L7_9 = 1, L2_4 do
    L3_5[L7_9] = L7_9
  end
  for L7_9 = 1, L2_4 do
    L3_5[L7_9] = L10_12
    L3_5[L9_11] = L8_10
  end
  for L8_10 = 1, L1_3 do
    L11_13(L12_14)
    L9_11.puppet = L11_13
    L9_11.brain = L11_13
    L9_11.spawner = L11_13
    L9_11.epilogue = L11_13
    L9_11.mnavi = L11_13
    L9_11.get = false
    L4_6[L8_10] = L9_11
    L12_14(L11_13, L4_6[L8_10].epilogue)
    L12_14(L12_14, "epilogue_livestock_" .. L10_12)
    L12_14(L12_14, L4_6[L8_10].spawner:getWorldPos(), L4_6[L8_10].spawner:getWorldRot())
    L12_14(L12_14)
    L12_14(L12_14, L4_6[L8_10].puppet)
  end
  L5_7()
  L5_7()
  L5_7()
  L5_7(L6_8, L7_9)
  L5_7(L6_8, L7_9)
  L6_8(L7_9, L8_10)
  if A0_2 then
    L6_8(L7_9)
  end
  while true do
    if L5_7 == 0 then
      for L10_12 = 1, L1_3 do
        L6_8[L10_12] = get_gameobj_node("locator2_livestock_" .. string.format("%02d", L3_5[L10_12]))
        L6_8[L10_12]:getParent():appendChild(L4_6[L10_12].spawner)
        L4_6[L10_12].spawner:setWorldTransform(L6_8[L10_12]:getWorldPos(), L6_8[L10_12]:getWorldRot())
        L4_6[L10_12].spawner:setForceMove()
        L4_6[L10_12].puppet:setWorldTransform(L11_13, L12_14)
        L4_6[L10_12].puppet:setForceMove()
        L4_6[L10_12].mnavi:setActive(true)
        invokeTask(function()
          local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25
          L0_15 = L10_12
          L0_15 = L4_6[L0_15]
          L0_15 = L0_15.puppet
          L1_16 = L0_15
          L0_15 = L0_15.getWorldPos
          L0_15 = L0_15(L1_16)
          L1_16 = L10_12
          L1_16 = L4_6[L1_16]
          L1_16 = L1_16.puppet
          L2_17 = L1_16
          L1_16 = L1_16.getWorldRot
          L1_16 = L1_16(L2_17)
          L2_17 = L10_12
          L2_17 = L6_8[L2_17]
          L3_18 = L2_17
          L2_17 = L2_17.getWorldPos
          L2_17 = L2_17(L3_18)
          L3_18 = L10_12
          L3_18 = L6_8[L3_18]
          L4_19 = L3_18
          L3_18 = L3_18.getWorldRot
          L3_18 = L3_18(L4_19)
          L4_19 = Fn_get_distance
          L5_20 = L0_15
          L6_21 = L2_17
          L4_19 = L4_19(L5_20, L6_21)
          L5_20 = RandI
          L6_21 = 6
          L7_22 = 10
          L5_20 = L5_20(L6_21, L7_22)
          L6_21 = L4_19 * L5_20
          L7_22 = get_move_pos
          L8_23 = L0_15
          L9_24 = L2_17
          L10_25 = L6_21
          L7_22 = L7_22(L8_23, L9_24, L10_25)
          L8_23 = get_move_rot
          L9_24 = L1_16
          L10_25 = L3_18
          L8_23 = L8_23(L9_24, L10_25, L6_21)
          L9_24 = 0
          while true do
            while true do
              L10_25 = L10_12
              L10_25 = L4_6[L10_25]
              L10_25 = L10_25.puppet
              L10_25 = L10_25.getWorldPos
              L10_25 = L10_25(L10_25)
              L0_15 = L10_25
              L10_25 = L10_12
              L10_25 = L4_6[L10_25]
              L10_25 = L10_25.puppet
              L10_25 = L10_25.getWorldRot
              L10_25 = L10_25(L10_25)
              L1_16 = L10_25
              if L6_21 < L9_24 then
                L10_25 = L10_12
                L10_25 = L4_6[L10_25]
                L10_25 = L10_25.puppet
                L10_25 = L10_25.setWorldTransform
                L10_25(L10_25, L2_17, L3_18)
              else
                L10_25 = L10_12
                L10_25 = L4_6[L10_25]
                L10_25 = L10_25.puppet
                L10_25 = L10_25.setWorldTransform
                L10_25(L10_25, L0_15 + L7_22, (Fn_add_rot(L1_16, L8_23.x, L8_23.y, L8_23.z)))
              end
              L10_25 = L10_12
              L10_25 = L4_6[L10_25]
              L10_25 = L10_25.puppet
              L10_25 = L10_25.setForceMove
              L10_25(L10_25)
              L10_25 = Fn_get_distance
              L10_25 = L10_25(L0_15, L2_17)
              if not (L10_25 <= 1) then
                L10_25 = L9_24 % 30
                if L10_25 == 0 then
                  L10_25 = L10_12
                  L10_25 = L6_8[L10_25]
                  L10_25 = L10_25.getWorldPos
                  L10_25 = L10_25(L10_25)
                  L2_17 = L10_25
                  L10_25 = L10_12
                  L10_25 = L6_8[L10_25]
                  L10_25 = L10_25.getWorldRot
                  L10_25 = L10_25(L10_25)
                  L3_18 = L10_25
                  L10_25 = Fn_get_distance
                  L10_25 = L10_25(L0_15, L2_17)
                  L4_19 = L10_25
                  L6_21 = L4_19 * L5_20
                  L10_25 = get_move_pos
                  L10_25 = L10_25(L0_15, L2_17, L6_21)
                  L7_22 = L10_25
                  L10_25 = get_move_rot
                  L10_25 = L10_25(L1_16, L3_18, L6_21)
                  L8_23 = L10_25
                  L9_24 = 0
                end
                L9_24 = L9_24 + 1
                L10_25 = wait
                L10_25()
              end
            end
          end
          while true do
            L10_25 = L10_12
            L10_25 = L6_8[L10_25]
            L10_25 = L10_25.getWorldPos
            L10_25 = L10_25(L10_25)
            L10_25 = Vector(RandI(L10_25.x - 3, L10_25.x + 3), L10_25.y, RandI(L10_25.z - 3, L10_25.z + 3))
            L4_6[L10_12].brain:moveToPointNM(L10_25)
            for _FORV_14_ = 1, 300 do
              if not (Fn_get_distance(L4_6[L10_12].puppet:getWorldPos(), L10_25) <= 1) then
                wait()
              end
            end
          end
        end)
        break
      end
      L7_9(L8_10)
      break
    else
      if L5_7 == 30 then
        for L12_14 = 1, L1_3 do
          L8_10[L12_14] = false
          invokeTask(function()
            local L0_26
            while true do
              L0_26 = Fn_getPcPosRot
              L0_26 = L0_26()
              if L6_8 == false and L7_9 == L12_14 and Fn_get_distance(L0_26, L4_6[L12_14].puppet:getWorldPos()) <= 10 and Fn_isInSightTarget(L4_6[L12_14].puppet) == true then
                Fn_captionView("em01_00250", 5)
                L6_8 = true
              end
              if Fn_get_distance(L0_26, L4_6[L12_14].puppet:getWorldPos()) <= 1 then
                L4_6[L12_14].puppet:setAlpha(0)
                L4_6[L12_14].mnavi:setActive(false)
                L4_6[L12_14].mnavi:del()
                L4_6[L12_14].mnavi = nil
                L8_10[L12_14] = true
                HUD:counter99_99AddNum()
                Fn_captionView("em01_00200")
                break
              end
              wait()
            end
          end)
          break
        end
        while true do
          for _FORV_13_ = 1, L1_3 do
            if L8_10[_FORV_13_] == false then
              break
            end
          end
          if L9_11 == true then
          else
            L10_12(L11_13)
            do break end
            elseif L5_7 == 40 then
              if A0_2 then
                L6_8(L7_9)
                while true do
                  if not L6_8 then
                    L6_8()
                    else
                      L6_8(L7_9)
                      L6_8(L7_9, L8_10, L9_11)
                      L6_8(L7_9)
                    end
                  end
                end
              timer_finish = true
              L6_8()
            elseif L5_7 == 100 then
              for L9_11 = 1, L1_3 do
                L11_13(L12_14, L4_6[L9_11].spawner)
                L4_6[L9_11].spawner:setWorldTransform(L11_13, L12_14)
                L4_6[L9_11].spawner:setForceMove()
                L4_6[L9_11].puppet:setWorldTransform(L11_13, L12_14)
                L4_6[L9_11].puppet:setForceMove()
                L4_6[L9_11].brain:moveToPointNM(L11_13)
                L4_6[L9_11].puppet:setAlpha(1)
              end
              L6_8(L7_9)
              L6_8(L7_9, L8_10)
            elseif L5_7 == 110 then
              break
            end
          end
        end
    end
    L6_8()
  end
end
function endLivestock()
  HUD:counter99_99SetVisible(false)
  HUD:timerSetVisible(false)
  if event_data ~= nil then
    event_data:kill()
  end
  event_data = nil
end
function isFinish()
  local L0_27, L1_28
end
