dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
ENABLE_NAVI_BAG_NUM = 5
_bag = {}
_is_bag_out_area = false
_is_cat_warp = false
function Initialize()
  local L0_0
  L0_0 = {}
  L0_0.lie = "wom01_idle_up_00"
  Fn_loadNpcEventMotion("sm47_mad_01", L0_0)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = Fn_sendEventComSb
  L1_2 = "getVeHdl"
  L0_1 = L0_1(L1_2)
  if L0_1 == nil then
    L0_1 = print
    L1_2 = "\232\136\185\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\231\148\159\230\136\144"
    L0_1(L1_2)
    L0_1 = Fn_sendEventComSb
    L1_2 = "requestShipCreate"
    L0_1(L1_2)
    L0_1 = Fn_sendEventComSb
    L1_2 = "requestBagCreate"
    L0_1(L1_2)
    repeat
      L0_1 = wait
      L0_1()
      L0_1 = Fn_sendEventComSb
      L1_2 = "isBagCreateEnd"
      L0_1 = L0_1(L1_2)
    until L0_1
  else
    L0_1 = Fn_sendEventComSb
    L1_2 = "resetShipPosition"
    L0_1(L1_2)
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "getVeHdl"
  L0_1 = L0_1(L1_2)
  L1_2 = nil
  function L2_3()
    L1_2 = createGameObject2("MapMarker")
    L1_2:setAssetName("gui_marker_30")
    L1_2:setPos(Vector(0, 1.4, -1))
    L1_2:setupPattern("C", Vector(3, 0.1, 5))
    L1_2:setActive(true)
    L0_1:appendChild(L1_2)
    start_game_obj()
  end
  function L3_4()
    if L1_2 ~= nil then
      L1_2:playOut()
      while not L1_2:isOutEnd() do
        wait()
      end
      L1_2:try_term()
    end
  end
  L4_5 = nil
  L5_6 = createGameObject2
  L6_7 = "Sensor"
  L5_6 = L5_6(L6_7)
  L4_5 = L5_6
  L6_7 = L4_5
  L5_6 = L4_5.setName
  L7_8 = "bag_static_sensor"
  L5_6(L6_7, L7_8)
  L6_7 = L4_5
  L5_6 = L4_5.setDetectBehavior
  L7_8 = 0
  L5_6(L6_7, L7_8)
  L6_7 = L4_5
  L5_6 = L4_5.setFilterType
  L7_8 = "DNode"
  L5_6(L6_7, L7_8)
  L6_7 = L4_5
  L5_6 = L4_5.addBox
  L7_8 = Vector
  L21_22 = L7_8(L8_9, L9_10, L10_11)
  L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L7_8(L8_9, L9_10, L10_11))
  L6_7 = L4_5
  L5_6 = L4_5.setPos
  L7_8 = Vector
  L21_22 = L7_8(L8_9, L9_10, L10_11)
  L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L7_8(L8_9, L9_10, L10_11))
  L6_7 = L4_5
  L5_6 = L4_5.setOnEnter
  L7_8 = "bag_static_sensor_OnEnter"
  L5_6(L6_7, L7_8)
  L6_7 = L4_5
  L5_6 = L4_5.setOnLeave
  L7_8 = "bag_static_sensor_OnLeave"
  L5_6(L6_7, L7_8)
  L6_7 = L0_1
  L5_6 = L0_1.appendChild
  L7_8 = L4_5
  L5_6(L6_7, L7_8)
  L5_6 = start_game_obj
  L5_6()
  L5_6 = createGameObject2
  L6_7 = "Node"
  L5_6 = L5_6(L6_7)
  L7_8 = L5_6
  L6_7 = L5_6.setTransform
  L21_22 = L8_9(L9_10, L10_11)
  L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L8_9(L9_10, L10_11))
  L7_8 = L0_1
  L6_7 = L0_1.appendChild
  L6_7(L7_8, L8_9)
  L7_8 = L5_6
  L6_7 = L5_6.try_init
  L6_7(L7_8)
  L7_8 = L5_6
  L6_7 = L5_6.waitForReady
  L6_7(L7_8)
  L7_8 = L5_6
  L6_7 = L5_6.try_start
  L6_7(L7_8)
  L6_7 = Fn_findNpc
  L7_8 = "sm47_client"
  L6_7 = L6_7(L7_8)
  L7_8 = Fn_warpNpc
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = Fn_turnNpc
  L7_8(L8_9, L9_10)
  L7_8 = {}
  for L11_12 = 1, #L9_10 do
    L7_8[L11_12] = L12_13
    L14_15 = "bag_dynamic_obj"
    L15_16 = false
    L14_15 = _bag
    L15_16 = {}
    L15_16.gimmickbg_hdl = L16_17
    L15_16.mnavi_hdl = L16_17
    L15_16.in_range_dnode = L16_17
    L15_16.is_place_fixed = false
    L15_16.is_in_static_range = false
    L13_14(L14_15, L15_16)
  end
  for L12_13, L13_14 in L9_10(L10_11) do
    L14_15 = createGameObject2
    L15_16 = "DNode"
    L14_15 = L14_15(L15_16)
    L8_9[L12_13] = L14_15
    L14_15 = L8_9[L12_13]
    L15_16 = L14_15
    L14_15 = L14_15.setName
    L21_22 = L16_17(L17_18, L18_19)
    L14_15(L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L16_17(L17_18, L18_19))
    L14_15 = L8_9[L12_13]
    L15_16 = L14_15
    L14_15 = L14_15.setAsBox
    L21_22 = L16_17(L17_18, L18_19, L19_20)
    L14_15(L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L16_17(L17_18, L18_19, L19_20))
    L14_15 = L8_9[L12_13]
    L15_16 = L14_15
    L14_15 = L14_15.try_init
    L14_15(L15_16)
    L14_15 = L8_9[L12_13]
    L15_16 = L14_15
    L14_15 = L14_15.waitForReady
    L14_15(L15_16)
    L14_15 = L8_9[L12_13]
    L15_16 = L14_15
    L14_15 = L14_15.try_start
    L14_15(L15_16)
    L15_16 = L13_14
    L14_15 = L13_14.appendChild
    L14_15(L15_16, L16_17)
  end
  L10_11(L11_12)
  L10_11(L11_12)
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12()
  L11_12(L12_13)
  repeat
    L11_12(L12_13, L13_14)
    L11_12(L12_13)
    L14_15 = false
    L11_12(L12_13, L13_14, L14_15)
    L11_12()
    L11_12(L12_13, L13_14)
    L11_12()
    L11_12(L12_13, L13_14)
    L11_12()
    L11_12()
    L11_12(L12_13)
    L11_12(L12_13)
    L14_15 = 0
    L15_16 = 3
    L11_12(L12_13, L13_14)
    L11_12(L12_13, L13_14)
    L11_12(L12_13)
    L11_12(L12_13, L13_14)
    L11_12(L12_13, L13_14)
    L11_12(L12_13, L13_14)
    L11_12(L12_13, L13_14)
    L11_12(L12_13, L13_14)
    L14_15 = false
    L11_12(L12_13, L13_14, L14_15)
    for L14_15, L15_16 in L11_12(L12_13) do
      if L16_17 == nil then
        L18_19.name = "mnavi"
        L18_19.PochFadeLen0 = 5
        L18_19.PochFadeLen100 = 20
        L15_16.mnavi_hdl = L16_17
        L16_17(L17_18, L18_19)
      end
    end
    L13_14.THREE = 1
    L13_14.FIVE = 2
    L13_14.SEVEN = 3
    L13_14.END = 4
    L14_15 = L13_14.THREE
    L15_16 = {}
    repeat
      for L19_20, L20_21 in L16_17(L17_18) do
        L21_22 = L20_21.gimmickbg_hdl
        if L21_22 ~= nil then
          L21_22 = L20_21.mnavi_hdl
          if L21_22 ~= nil then
            L21_22 = L20_21.gimmickbg_hdl
            L21_22 = L21_22.getDynamicObject
            L21_22 = L21_22(L21_22)
            if L21_22 ~= nil then
              L21_22 = L20_21.mnavi_hdl
              L21_22 = L21_22.setTarget
              L21_22(L21_22, L20_21.gimmickbg_hdl:getDynamicObject())
              L21_22 = L20_21.gimmickbg_hdl
              L21_22 = L21_22.getDynamicObject
              L21_22 = L21_22(L21_22)
              L21_22 = L21_22.appendChild
              L21_22(L21_22, L8_9[L19_20])
            end
            L21_22 = L20_21.is_place_fixed
            if not L21_22 then
              L21_22 = L20_21.gimmickbg_hdl
              L21_22 = L21_22.isGrabbed
              L21_22 = L21_22(L21_22)
              if L21_22 then
                L21_22 = {}
                L21_22.id = L19_20
                L21_22.value = 10000
                L15_16[L19_20] = L21_22
              else
                L21_22 = L20_21.gimmickbg_hdl
                L21_22 = L21_22.getDynamicObject
                L21_22 = L21_22(L21_22)
                L21_22 = L21_22 or L20_21.gimmickbg_hdl
                L15_16[L19_20] = {
                  id = L19_20,
                  value = Fn_get_distance(L21_22:getWorldPos(), Fn_getPlayerWorldPos())
                }
              end
            else
              L21_22 = {}
              L21_22.id = L19_20
              L21_22.value = 10000
              L15_16[L19_20] = L21_22
              L21_22 = L20_21.mnavi_hdl
              L21_22 = L21_22.setActive
              L21_22(L21_22, false, false)
            end
          end
        end
        L21_22 = L20_21.gimmickbg_hdl
        L21_22 = L21_22.isGrabbed
        L21_22 = L21_22(L21_22)
        if not L21_22 then
          L21_22 = L20_21.gimmickbg_hdl
          L21_22 = L21_22.isBroken
          L21_22 = L21_22(L21_22)
          if L21_22 then
            L21_22 = L20_21.mnavi_hdl
            if L21_22 ~= nil then
              L21_22 = print
              L21_22("\232\141\183\231\137\169\227\129\140\229\163\138\227\130\140\227\129\159\239\188\154", L19_20)
              _is_bag_out_area = true
            end
          end
        end
        L21_22 = _is_bag_out_area
        if L21_22 == false then
          L21_22 = Mv_checkTransportBagStatic
          L21_22(L20_21, L0_1)
        end
      end
      L16_17(L17_18, L18_19)
      for L19_20, L20_21 in L16_17(L17_18) do
        L21_22 = _bag
        L21_22 = L21_22[L20_21.id]
        L21_22 = L21_22.mnavi_hdl
        L21_22 = L21_22.setActive
        L21_22(L21_22, true, false)
        L21_22 = print
        L21_22("\232\161\168\231\164\186id", L15_16[L19_20].id)
        L21_22 = ENABLE_NAVI_BAG_NUM
        if not (L19_20 > L21_22) then
          L21_22 = L20_21.value
        elseif L21_22 >= 10000 then
          L21_22 = _bag
          L21_22 = L21_22[L20_21.id]
          L21_22 = L21_22.mnavi_hdl
          L21_22 = L21_22.setActive
          L21_22(L21_22, false, false)
          L21_22 = print
          L21_22("\233\157\158\232\161\168\231\164\186id", L15_16[L19_20].id)
        end
      end
      if L16_17 == 3 then
        if L14_15 == L17_18 then
          L17_18(L18_19)
          L14_15 = L13_14.FIVE
        end
      elseif L16_17 == 5 then
        if L14_15 == L17_18 then
          L17_18(L18_19)
          L14_15 = L13_14.SEVEN
        end
      elseif L16_17 == 7 then
        if L14_15 == L17_18 then
          L17_18(L18_19)
          L14_15 = L13_14.END
        end
      end
      if L17_18 == true then
        L17_18()
        for L20_21, L21_22 in L17_18(L18_19) do
          if L21_22.is_place_fixed == false then
            Mv_restoreGimmickBgForTransport(L21_22)
            L21_22.gimmickbg_hdl:appendChild(L8_9[L20_21])
            L21_22.mnavi_hdl = HUD:mnaviNew({
              name = "mnavi",
              PochFadeLen0 = 5,
              PochFadeLen100 = 20
            })
            L21_22.mnavi_hdl:setTarget(L21_22.gimmickbg_hdl)
          end
        end
        _is_cat_warp = false
      end
      L17_18()
      if not (L17_18 <= 0) then
      end
    until L17_18 >= L18_19
    L16_17(L17_18)
    L16_17(L17_18)
    L16_17(L17_18)
    L16_17()
    L16_17(L17_18)
    L16_17(L17_18)
    L16_17()
    if L16_17 >= L17_18 then
      L16_17(L17_18, L18_19)
      L16_17()
      L16_17(L17_18)
      break
    elseif L16_17 == true then
      L16_17(L17_18, L18_19)
      L16_17(L17_18)
    else
      L16_17(L17_18, L18_19)
      L16_17(L17_18)
    end
    L16_17()
    for L19_20, L20_21 in L16_17(L17_18) do
      L21_22 = Mv_restoreGimmickBgForTransport
      L21_22(L20_21)
      L21_22 = L20_21.gimmickbg_hdl
      L21_22 = L21_22.appendChild
      L21_22(L21_22, L8_9[L19_20])
    end
    L16_17()
    L16_17(L17_18, L18_19)
    L16_17(L17_18, L18_19)
    L16_17(L17_18)
    L16_17(L17_18)
    L16_17()
    if L16_17 == true then
      L16_17(L17_18)
    else
      L16_17(L17_18)
    end
    _is_bag_out_area = false
  until L16_17
  L11_12()
  for L14_15, L15_16 in L11_12(L12_13) do
    L16_17(L17_18, L18_19, L19_20)
  end
  for L14_15, L15_16 in L11_12(L12_13) do
    if L16_17 ~= nil then
      L16_17(L17_18)
      L15_16.mnavi_hdl = nil
    end
  end
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12()
  L11_12()
  L11_12()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Player:setGrabAttractRadius(-1)
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_warning_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm47_01017")
  Player:setStay(false, false)
end
function pccubesensor2_away_from_site_OnLeave()
  local L0_23, L1_24
  _is_cat_warp = true
end
function cubesensor2_obj_OnLeave(A0_25, A1_26)
  if HUD:timerGetSecond() > 0 and not A1_26:getParent():isGrabbed() and _is_cat_warp == false and string.find(A1_26:getName(), "erea_over_dnode") ~= nil then
    print("\232\141\183\231\137\169\227\129\140\230\156\170\227\130\176\227\131\169\227\131\150\227\129\167\230\149\183\229\156\176\229\164\150\227\129\171\229\135\186\227\129\159", A1_26:getName(), A1_26:getWorldPos())
    _is_bag_out_area = true
  end
end
function bag_static_sensor_OnEnter(A0_27, A1_28)
  if string.find(A1_28:getName(), "erea_over_dnode") == nil then
    _bag[tonumber(A1_28:getName())].is_in_static_range = true
  end
end
function bag_static_sensor_OnLeave(A0_29, A1_30)
  if string.find(A1_30:getName(), "erea_over_dnode") == nil then
    _bag[tonumber(A1_30:getName())].is_in_static_range = false
  end
end
