dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
ENABLE_NAVI_BAG_NUM = 5
_bag = {}
BAG_LIST_SPECIAL = {
  {
    node = "locator2_box_09",
    model = "woodbox_ms_01",
    collision = nil
  },
  {
    node = "locator2_box_10",
    model = "woodbox_ms_01",
    collision = nil
  }
}
BAG_LIST_HIGH = {
  {
    node = "locator2_box_05",
    model = "table_sk_02",
    collision = nil
  },
  {
    node = "locator2_box_06",
    model = "table_sk_02",
    collision = nil
  },
  {
    node = "locator2_box_07",
    model = "bench_kk_03_brk_dy",
    collision = "bench_kk_03_brk_dy"
  },
  {
    node = "locator2_box_08",
    model = "piano_md_01",
    collision = nil
  }
}
BAG_LIST_NORMAL = {
  {
    node = "locator2_box_01",
    model = "chair_yj_01_brk_dy",
    collision = "chair_yj_01_brk_dy"
  },
  {
    node = "locator2_box_02",
    model = "chair_yj_01_brk_dy",
    collision = "chair_yj_01_brk_dy"
  },
  {
    node = "locator2_box_03",
    model = "chair_yj_04_brk_dy",
    collision = "chair_yj_04_brk_dy"
  },
  {
    node = "locator2_box_04",
    model = "woodbox_sk_01",
    collision = nil
  }
}
BAG_LIST_LOW = {
  {
    node = "locator2_box_11",
    model = "woodbox_kk_05",
    collision = nil
  },
  {
    node = "locator2_box_12",
    model = "woodbox_kk_05",
    collision = nil
  },
  {
    node = "locator2_box_13",
    model = "woodbox_kk_05",
    collision = nil
  },
  {
    node = "locator2_box_14",
    model = "woodbox_kk_02",
    collision = nil
  },
  {
    node = "locator2_box_15",
    model = "woodbox_kk_02",
    collision = nil
  }
}
SPECIAL_SCORE = 300
HIGH_SCORE = 250
NORMAL_SCORE = 150
LOW_SCORE = 100
BAG_NAME = {
  SPECIAL = "bag_special",
  HIGH = "bag_high",
  NORMAL = "bag_normal",
  LOW = "bag_low"
}
EXTEND_SCORE = {
  {COUNT = 3, SCORE = 300},
  {COUNT = 6, SCORE = 300},
  {COUNT = 9, SCORE = 300},
  {COUNT = 10, SCORE = 300}
}
EXTEND_MAX_TIME = {
  0,
  59,
  59,
  99
}
EXTEND_TIME = {
  {
    COUNT = 3,
    TIME = {
      0,
      0,
      20,
      0
    }
  },
  {
    COUNT = 6,
    TIME = {
      0,
      0,
      15,
      0
    }
  },
  {
    COUNT = 9,
    TIME = {
      0,
      0,
      10,
      0
    }
  },
  {
    COUNT = 10,
    TIME = {
      0,
      0,
      5,
      0
    }
  }
}
function Initialize()
  local L0_0, L1_1
  L0_0 = {L1_1}
  L1_1 = {}
  L1_1.name = "driver"
  L1_1.type = "man63"
  L1_1.node = "locator2_driver"
  L1_1.disable_collision = true
  L1_1 = Fn_setupNpc
  L1_1(L0_0)
  L1_1 = Fn_userCtrlOff
  L1_1()
  L1_1 = {}
  L1_1.timer = {
    max = EXTEND_MAX_TIME,
    start = {
      0,
      1,
      0,
      0
    }
  }
  L1_1.score = {
    text = "ui_hud_counter_score_01",
    start = 0
  }
  Fn_challengeInitialize(L1_1)
  HUD:counter999SetIcon(HUD.kCount999IconType_Checkbox)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18
  L0_2 = {}
  L1_3 = BAG_LIST_SPECIAL
  L1_3 = #L1_3
  L0_2.special = L1_3
  L1_3 = BAG_LIST_HIGH
  L1_3 = #L1_3
  L0_2.high = L1_3
  L1_3 = BAG_LIST_NORMAL
  L1_3 = #L1_3
  L0_2.normal = L1_3
  L1_3 = BAG_LIST_LOW
  L1_3 = #L1_3
  L0_2.low = L1_3
  L1_3 = 0
  L2_4 = EXTEND_SCORE
  L2_4 = L2_4[1]
  L2_4 = L2_4.SCORE
  L3_5 = createShip
  L3_5 = L3_5()
  L4_6 = Fn_findNpcPuppet
  L5_7 = "driver"
  L4_6 = L4_6(L5_7)
  L6_8 = L4_6
  L5_7 = L4_6.setWorldTransform
  L7_9 = findGameObject2
  L8_10 = "Node"
  L9_11 = "locator2_driver"
  L7_9 = L7_9(L8_10, L9_11)
  L8_10 = L7_9
  L7_9 = L7_9.getWorldTransform
  L11_13 = L7_9(L8_10)
  L5_7(L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L7_9(L8_10))
  L6_8 = L3_5
  L5_7 = L3_5.appendChild
  L7_9 = L4_6
  L5_7(L6_8, L7_9)
  L6_8 = L4_6
  L5_7 = L4_6.setForceMove
  L5_7(L6_8)
  L5_7 = Fn_playMotionNpc
  L6_8 = "driver"
  L7_9 = "sit_00"
  L8_10 = false
  L5_7(L6_8, L7_9, L8_10)
  L5_7 = findGameObject2
  L6_8 = "Node"
  L7_9 = "locator2_marker_01"
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = createGameObject2
  L7_9 = "MapMarker"
  L6_8 = L6_8(L7_9)
  L8_10 = L6_8
  L7_9 = L6_8.setAssetName
  L9_11 = "gui_marker_30"
  L7_9(L8_10, L9_11)
  L8_10 = L6_8
  L7_9 = L6_8.setPos
  L9_11 = Vector
  L10_12 = 0
  L11_13 = 1.4
  L11_13 = L9_11(L10_12, L11_13, L12_14)
  L7_9(L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L9_11(L10_12, L11_13, L12_14))
  L8_10 = L6_8
  L7_9 = L6_8.setupPattern
  L9_11 = "C"
  L10_12 = Vector
  L11_13 = 3
  L11_13 = L10_12(L11_13, L12_14, L13_15)
  L7_9(L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L10_12(L11_13, L12_14, L13_15))
  L8_10 = L6_8
  L7_9 = L6_8.setActive
  L9_11 = true
  L7_9(L8_10, L9_11)
  L8_10 = L3_5
  L7_9 = L3_5.appendChild
  L9_11 = L6_8
  L7_9(L8_10, L9_11)
  L7_9 = nil
  L8_10 = createGameObject2
  L9_11 = "Sensor"
  L8_10 = L8_10(L9_11)
  L7_9 = L8_10
  L9_11 = L7_9
  L8_10 = L7_9.setName
  L10_12 = "bag_static_sensor"
  L8_10(L9_11, L10_12)
  L9_11 = L7_9
  L8_10 = L7_9.setDetectBehavior
  L10_12 = 0
  L8_10(L9_11, L10_12)
  L9_11 = L7_9
  L8_10 = L7_9.setFilterType
  L10_12 = "DNode"
  L8_10(L9_11, L10_12)
  L9_11 = L7_9
  L8_10 = L7_9.addBox
  L10_12 = Vector
  L11_13 = 3
  L11_13 = L10_12(L11_13, L12_14, L13_15)
  L8_10(L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L10_12(L11_13, L12_14, L13_15))
  L9_11 = L7_9
  L8_10 = L7_9.setPos
  L10_12 = Vector
  L11_13 = 0
  L11_13 = L10_12(L11_13, L12_14, L13_15)
  L8_10(L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L10_12(L11_13, L12_14, L13_15))
  L9_11 = L7_9
  L8_10 = L7_9.setOnEnter
  L10_12 = "bag_static_sensor_OnEnter"
  L8_10(L9_11, L10_12)
  L9_11 = L7_9
  L8_10 = L7_9.setOnLeave
  L10_12 = "bag_static_sensor_OnLeave"
  L8_10(L9_11, L10_12)
  L9_11 = L3_5
  L8_10 = L3_5.appendChild
  L10_12 = L7_9
  L8_10(L9_11, L10_12)
  L8_10 = start_game_obj
  L8_10()
  L8_10 = addSpecialBag
  L9_11 = false
  L8_10(L9_11)
  L8_10 = addHighBag
  L9_11 = false
  L8_10(L9_11)
  L8_10 = addNormalBag
  L9_11 = false
  L8_10(L9_11)
  L8_10 = addLowBag
  L9_11 = false
  L8_10(L9_11)
  L8_10 = {
    L9_11,
    L10_12,
    L11_13,
    L12_14,
    L13_15
  }
  L9_11 = BAG_NAME
  L9_11 = L9_11.SPECIAL
  L10_12 = BAG_NAME
  L10_12 = L10_12.HIGH
  L11_13 = BAG_NAME
  L11_13 = L11_13.NORMAL
  L9_11 = Player
  L10_12 = L9_11
  L9_11 = L9_11.setGrabExceptionalObject
  L11_13 = L8_10
  L9_11(L10_12, L11_13)
  L9_11 = Player
  L10_12 = L9_11
  L9_11 = L9_11.setGrabAttractRadius
  L11_13 = 7
  L9_11(L10_12, L11_13)
  L9_11 = Fn_challengeStart
  L10_12 = {}
  L10_12.timer = true
  L10_12.score = true
  L11_13 = nil
  L9_11(L10_12, L11_13, L12_14)
  L9_11 = {}
  L9_11.special = 0
  L9_11.high = 0
  L9_11.normal = 0
  L9_11.low = 0
  L10_12 = invokeTask
  function L11_13()
    local L0_19
    repeat
      L0_19 = 0
      for _FORV_4_, _FORV_5_ in pairs(_bag) do
        if _FORV_5_.is_place_fixed == true then
          if _FORV_5_.gimmickbg_hdl:getName() == BAG_NAME.SPECIAL then
            L0_19 = L0_19 + SPECIAL_SCORE
            if _FORV_5_.is_count_fixed == false then
              L9_11.special = L9_11.special + 1
              _bag[_FORV_4_].is_count_fixed = true
            end
          elseif _FORV_5_.gimmickbg_hdl:getName() == BAG_NAME.HIGH then
            L0_19 = L0_19 + HIGH_SCORE
            if _FORV_5_.is_count_fixed == false then
              L9_11.high = L9_11.high + 1
              _bag[_FORV_4_].is_count_fixed = true
            end
          elseif _FORV_5_.gimmickbg_hdl:getName() == BAG_NAME.NORMAL then
            L0_19 = L0_19 + NORMAL_SCORE
            if _FORV_5_.is_count_fixed == false then
              L9_11.normal = L9_11.normal + 1
              _bag[_FORV_4_].is_count_fixed = true
            end
          elseif _FORV_5_.gimmickbg_hdl:getName() == BAG_NAME.LOW then
            L0_19 = L0_19 + LOW_SCORE
            if _FORV_5_.is_count_fixed == false then
              L9_11.low = L9_11.low + 1
              _bag[_FORV_4_].is_count_fixed = true
            end
          end
        end
      end
      HUD:counter999SetNum(L0_19)
      wait()
    until false
  end
  L10_12 = L10_12(L11_13)
  L11_13 = {}
  repeat
    for L15_17, L16_18 in L12_14(L13_15) do
      if L16_18.gimmickbg_hdl ~= nil and L16_18.mnavi_hdl ~= nil then
        if L16_18.gimmickbg_hdl:getDynamicObject() ~= nil then
          L16_18.mnavi_hdl:setTarget(L16_18.gimmickbg_hdl:getDynamicObject())
        end
        if L16_18.is_place_fixed == false then
          if L16_18.gimmickbg_hdl:isGrabbed() == true then
            L11_13[L15_17] = {id = L15_17, value = 10000}
          else
            L11_13[L15_17] = {
              id = L15_17,
              value = Fn_get_distance((L16_18.gimmickbg_hdl:getDynamicObject() or L16_18.gimmickbg_hdl):getWorldPos(), Fn_getPlayerWorldPos())
            }
          end
        else
          L11_13[L15_17] = {id = L15_17, value = 10000}
          L16_18.mnavi_hdl:setActive(false, false)
        end
      end
      if L16_18.mnavi_hdl ~= nil and L16_18.gimmickbg_hdl:isGrabbed() == false and L16_18.gimmickbg_hdl:isBroken() == true then
        print("\232\141\183\231\137\169\227\129\140\229\163\138\227\130\140\227\129\159\239\188\154", L15_17)
        Mv_restoreGimmickBgForTransport(L16_18)
        L16_18.mnavi_hdl = HUD:mnaviNew({
          name = "mnavi",
          PochFadeLen0 = 5,
          PochFadeLen100 = 20
        })
        L16_18.mnavi_hdl:setTarget(L16_18.gimmickbg_hdl)
      end
      Mv_checkTransportBagStatic(L16_18, L3_5)
    end
    L12_14(L13_15, L14_16)
    for L15_17, L16_18 in L12_14(L13_15) do
      _bag[L16_18.id].mnavi_hdl:setActive(true, false)
      print("\232\161\168\231\164\186id", L11_13[L15_17].id)
      if L15_17 > ENABLE_NAVI_BAG_NUM or L16_18.value >= 10000 then
        _bag[L16_18.id].mnavi_hdl:setActive(false, false)
        print("\233\157\158\232\161\168\231\164\186id", L11_13[L15_17].id)
      end
    end
    if L2_4 <= L12_14 then
      for L16_18, _FORV_17_ in L13_15(L14_16) do
        if L1_3 <= _FORV_17_.COUNT then
          break
        end
      end
      if L14_16 > 0 then
        L15_17(L16_18)
        L15_17(L16_18, "sys_info", 1)
        L15_17(L16_18)
        L1_3 = L1_3 + 1
        for _FORV_18_ = 1, L1_3 do
          for _FORV_23_, _FORV_24_ in pairs(EXTEND_SCORE) do
            if L1_3 <= _FORV_24_.COUNT then
              break
            end
          end
          L2_4 = L2_4 + _FORV_24_.SCORE
        end
      end
    end
    if L12_14 == L13_15 then
      L0_2.special = L12_14
      L12_14(L13_15)
    elseif L12_14 == L13_15 then
      L0_2.high = L12_14
      L12_14(L13_15)
    elseif L12_14 == L13_15 then
      L0_2.normal = L12_14
      L12_14(L13_15)
    elseif L12_14 == L13_15 then
      L0_2.low = L12_14
      L12_14(L13_15)
    end
    if L12_14 == true then
      repeat
        L12_14()
      until L12_14 == false
      for L15_17, L16_18 in L12_14(L13_15) do
        if L16_18.is_place_fixed == false then
          Mv_restoreGimmickBgForTransport(L16_18)
          L16_18.mnavi_hdl = HUD:mnaviNew({
            name = "mnavi",
            PochFadeLen0 = 5,
            PochFadeLen100 = 20
          })
          L16_18.mnavi_hdl:setTarget(L16_18.gimmickbg_hdl)
        end
      end
    end
    L12_14()
  until L12_14 <= 0
  L10_12 = L12_14
  L12_14(L13_15)
  while true do
    if not L12_14 then
      L12_14()
    end
  end
  L12_14(L13_15)
  for L15_17, L16_18 in L12_14(L13_15) do
    if L16_18.mnavi_hdl ~= nil then
      L16_18.mnavi_hdl:setActive(false)
      L16_18.mnavi_hdl:del()
      L16_18.mnavi_hdl = nil
    end
  end
  L12_14()
end
function Finalize()
  _bag = {}
  Player:setGrabExceptionalObject({})
  Player:setGrabAttractRadius(-1)
  Fn_challengeFinalize()
  Player:setForcedNormalGrab(false)
end
function bag_static_sensor_OnEnter(A0_20, A1_21)
  local L2_22
  L2_22 = _bag
  L2_22 = L2_22[tonumber(A1_21:getName())]
  L2_22.is_in_static_range = true
end
function bag_static_sensor_OnLeave(A0_23, A1_24)
  local L2_25
  L2_25 = _bag
  L2_25 = L2_25[tonumber(A1_24:getName())]
  L2_25.is_in_static_range = false
end
function addSpecialBag(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  for L4_30, L5_31 in L1_27(L2_28) do
    L6_32 = Fn_createGimmickBg
    L6_32 = L6_32(L5_31.node, BAG_NAME.SPECIAL, L5_31.model, true, "box_ms_02_event_02", L5_31.collision)
    table.insert(_bag, {
      gimmickbg_hdl = L6_32,
      mnavi_hdl = Mv_initializeGimmickBgForTransportWithNavi(L6_32, "d_bag", A0_26, #_bag + 1).navi,
      in_range_dnode = Mv_initializeGimmickBgForTransportWithNavi(L6_32, "d_bag", A0_26, #_bag + 1).in_range_obj,
      is_place_fixed = false,
      is_in_static_range = false,
      is_count_fixed = false
    })
  end
end
function addHighBag(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39
  for L4_37, L5_38 in L1_34(L2_35) do
    L6_39 = Fn_createGimmickBg
    L6_39 = L6_39(L5_38.node, BAG_NAME.HIGH, L5_38.model, true, "box_ms_02_event_02", L5_38.collision)
    table.insert(_bag, {
      gimmickbg_hdl = L6_39,
      mnavi_hdl = Mv_initializeGimmickBgForTransportWithNavi(L6_39, "d_bag", A0_33, #_bag + 1).navi,
      in_range_dnode = Mv_initializeGimmickBgForTransportWithNavi(L6_39, "d_bag", A0_33, #_bag + 1).in_range_obj,
      is_place_fixed = false,
      is_in_static_range = false,
      is_count_fixed = false
    })
  end
end
function addNormalBag(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46
  for L4_44, L5_45 in L1_41(L2_42) do
    L6_46 = Fn_createGimmickBg
    L6_46 = L6_46(L5_45.node, BAG_NAME.NORMAL, L5_45.model, true, "box_ms_02_event_02", L5_45.collision)
    table.insert(_bag, {
      gimmickbg_hdl = L6_46,
      mnavi_hdl = Mv_initializeGimmickBgForTransportWithNavi(L6_46, "d_bag", A0_40, #_bag + 1).navi,
      in_range_dnode = Mv_initializeGimmickBgForTransportWithNavi(L6_46, "d_bag", A0_40, #_bag + 1).in_range_obj,
      is_place_fixed = false,
      is_in_static_range = false,
      is_count_fixed = false
    })
  end
end
function addLowBag(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53
  for L4_51, L5_52 in L1_48(L2_49) do
    L6_53 = Fn_createGimmickBg
    L6_53 = L6_53(L5_52.node, BAG_NAME.LOW, L5_52.model, true, "box_ms_02_event_02", L5_52.collision)
    table.insert(_bag, {
      gimmickbg_hdl = L6_53,
      mnavi_hdl = Mv_initializeGimmickBgForTransportWithNavi(L6_53, "d_bag", A0_47, #_bag + 1).navi,
      in_range_dnode = Mv_initializeGimmickBgForTransportWithNavi(L6_53, "d_bag", A0_47, #_bag + 1).in_range_obj,
      is_place_fixed = false,
      is_in_static_range = false,
      is_count_fixed = false
    })
  end
end
function createShip()
  local L0_54, L1_55
  L0_54 = createGameObject2
  L1_55 = "Area"
  L0_54 = L0_54(L1_55)
  L1_55 = L0_54.setName
  L1_55(L0_54, "ve_a")
  L1_55 = L0_54.try_init
  L1_55(L0_54)
  L1_55 = L0_54.waitForReady
  L1_55(L0_54)
  L1_55 = L0_54.try_start
  L1_55(L0_54)
  L1_55 = L0_54.setWorldTransform
  L1_55(L0_54, findGameObject2("Node", "locator2_ve_a_01"):getWorldTransform())
  L1_55 = L0_54.setActive
  L1_55(L0_54, true)
  L1_55 = {}
  L1_55.xz = {
    rand = 1,
    sign = 1,
    max_a = 1,
    min_a = 0.5,
    max_t = 50,
    min_t = 40
  }
  L1_55.y = {
    rand = 0.5,
    sign = 1,
    max_a = 0.2,
    min_a = 0.1,
    max_t = 5,
    min_t = 3
  }
  L1_55.angle = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 60,
    min_t = 50
  }
  L0_54:setDriftParams(L1_55)
  return L0_54
end
