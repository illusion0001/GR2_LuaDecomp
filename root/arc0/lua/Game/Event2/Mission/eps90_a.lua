import("Area")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_gull_fly_end = false
_gull_follow_end = false
function Initialize()
  buDescendant = Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", "bungua"):getDescendant()
  ryzahip = Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", "bungua"):findSubArea("bu_a_09")
  shiphandle = Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", "ship")
  for _FORV_5_, _FORV_6_ in pairs(buDescendant) do
    _FORV_6_:loadMotionFileAsset(_FORV_6_:getName() .. "_e_goto_po")
  end
  shiphandle:loadMotionFileAsset(shiphandle:getName() .. "_e_goto_po")
  for _FORV_5_, _FORV_6_ in pairs(buDescendant) do
    while _FORV_6_:isMotionLoading() do
      wait()
    end
  end
  while shiphandle:isMotionLoading() do
    wait()
  end
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
  L0_0 = Fn_lockPlayerAbility
  L1_1 = nil
  L2_2 = {}
  L2_2.r_stick = true
  L0_0(L1_1, L2_2)
  L0_0 = Camera
  L1_1 = L0_0
  L0_0 = L0_0.setYawInvert
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Camera
  L1_1 = L0_0
  L0_0 = L0_0.setPitchInvert
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = {}
  L1_1 = 1
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12
  }
  L11_11 = "bu_a_14_02"
  L12_12 = "bu_a_15"
  for L6_6, L7_7 in L3_3(L4_4) do
    for L11_11, L12_12 in L8_8(L9_9) do
      L13_13 = L12_12.getName
      L13_13 = L13_13(L12_12)
      if L13_13 == L7_7 then
        L13_13 = 1
        while findGameObject2("Node", "locator2_gull_" .. L7_7 .. "_" .. string.format("%02d", L13_13)) ~= nil do
          L0_0[L1_1] = {
            name = "gull02_" .. L1_1,
            type = "gull02",
            node = findGameObject2("Node", "locator2_gull_" .. L7_7 .. "_" .. string.format("%02d", L13_13)):getName(),
            use_gravity = false,
            node_base = findGameObject2("Node", "locator2_gull_" .. L7_7 .. "_" .. string.format("%02d", L13_13)),
            base_area = L7_7,
            start = true
          }
          L13_13 = L13_13 + 1
          L1_1 = L1_1 + 1
        end
        break
      end
    end
  end
  L3_3(L4_4)
  for L6_6, L7_7 in L3_3(L4_4) do
    L11_11 = L7_7.base_area
    L12_12 = L6_6
    L8_8(L9_9, L10_10, L11_11, L12_12)
  end
  for L7_7, L8_8 in L4_4(L5_5) do
    L11_11 = L3_3
    L9_9(L10_10, L11_11)
    L11_11 = 0
    L9_9(L10_10, L11_11)
  end
  L4_4(L5_5, L6_6)
  L4_4(L5_5, L6_6)
  L6_6()
  L6_6(L7_7)
  L6_6(L7_7, L8_8)
  L6_6(L7_7)
  L6_6(L7_7, L8_8, L9_9)
  L6_6(L7_7)
  _gull_follow_end = true
  L7_7(L8_8, L9_9)
  L7_7(L8_8)
  L7_7(L8_8, L9_9, L10_10)
  L7_7(L8_8)
  L7_7(L8_8, L9_9)
  L7_7(L8_8)
  L7_7(L8_8, L9_9, L10_10)
  L7_7(L8_8)
  if L6_6 ~= nil then
    if L7_7 == true then
      L7_7(L8_8)
    end
  end
  L7_7(L8_8)
  L7_7(L8_8)
  _gull_fly_end = true
  for L10_10, L11_11 in L7_7(L8_8) do
    L13_13 = L11_11
    L12_12 = L11_11.isMoveAnimEnd
    L12_12 = L12_12(L13_13)
    if L12_12 == false then
      L13_13 = L11_11
      L12_12 = L11_11.stopMoveAnim
      L12_12(L13_13)
    end
  end
  L7_7(L8_8)
  L7_7()
  L7_7(L8_8, L9_9)
  L7_7(L8_8, L9_9)
  L7_7(L8_8, L9_9, L10_10)
  L7_7(L8_8)
  L7_7(L8_8, L9_9)
  L9_9.r_stick = true
  L7_7(L8_8, L9_9)
  L7_7()
  L7_7()
  L7_7()
end
function Finalize()
  if bangq_se1 then
    Sound:stopSEHandle(bangq_se1)
  end
  if bangq_se2 then
    Sound:stopSEHandle(bangq_se2)
  end
end
function gull_follow(A0_14, A1_15, A2_16, A3_17)
  local L4_18
  L4_18 = invokeTask
  L4_18 = L4_18(function()
    local L0_19, L1_20, L2_21, L3_22, L4_23
    L0_19 = Fn_findNpc
    L1_20 = A0_14
    L0_19 = L0_19(L1_20)
    L2_21 = L0_19
    L1_20 = L0_19.getPuppet
    L1_20 = L1_20(L2_21)
    L2_21 = 0
    L3_22 = RandI
    L3_22 = L3_22(L4_23, 60)
    L4_23(L0_19, 3, 1, 5)
    while true do
      if L4_23 == false then
        L4_23()
      end
    end
    for _FORV_7_ = 1, L3_22 do
      wait()
    end
    L4_23(RandF(0, 2))
    L0_19:fly(L4_23, {
      moveSpeed = RandI(2, 3)
    })
    while L0_19:isFlyEnd() == false do
      wait()
    end
  end)
  invokeTask(function()
    while L4_18:isRunning() do
      if _gull_fly_end == true then
        L4_18:abort()
        L4_18 = nil
        break
      end
      wait()
    end
  end)
end
