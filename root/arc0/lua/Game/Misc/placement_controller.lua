import("Debug")
import("EventData")
dofile("/Game/Event2/Table/PlacementObjectTable.lua")
PlacementCtrl = {}
function PlacementCtrl.create()
  local L0_0
  L0_0 = {}
  L0_0.player = Player:getPuppet()
  L0_0.root_areas = {}
  L0_0.all_areas = {}
  L0_0.use_areas = {}
  L0_0.placement = {
    gimmick_bg = {},
    grabbed_obj = {},
    effect = {},
    gem = {},
    event = {},
    area_reg = {}
  }
  L0_0.is_object_start = false
  L0_0.update_main_task = nil
  L0_0.update_dist_task = nil
  L0_0.update_dist_on = false
  L0_0.update_gimmick_task = nil
  L0_0.update_grabbed_task = nil
  L0_0.update_effect_task = nil
  L0_0.update_gem_task = nil
  L0_0.update_area_reg_task = nil
  L0_0.area_cnt = 3
  L0_0.gem_cnt = 15
  L0_0.eff_cnt = 15
  L0_0.grb_cnt = 15
  L0_0.gmk_cnt = 15
  L0_0.dist_use_area = 600
  L0_0.dist_gimmick = {min = 500, max = 550}
  L0_0.dist_grabbed = {min = 200, max = 250}
  L0_0.dist_effect = {min = 200, max = 250}
  L0_0.dist_area_reg = {min = 300, max = 350}
  L0_0.dist_gem = {min = 150, max = 200}
  L0_0.gimmick_bg_on = true
  L0_0.grabbed_obj_on = true
  L0_0.effect_on = true
  L0_0.area_reg_on = true
  L0_0.gem_on = false
  L0_0.update_start = false
  L0_0.dbg_on = false
  L0_0.dbg_line = 1
  L0_0.dbg_line2 = 1
  L0_0.dbg_state_list = {"All", "Create"}
  L0_0.dbg_state_id = 2
  L0_0.dbg_type_list = {
    "GimmickBg",
    "GrabbedObject",
    "Effect",
    "Gem",
    "AreaReg"
  }
  L0_0.dbg_type_id = 1
  L0_0.dbg_info_list = {}
  L0_0.dbg_info_id = 1
  L0_0.dbg_info_set = true
  L0_0.dbg_disp_area = 1
  PlacementCtrl._installMethods(L0_0)
  return L0_0
end
function PlacementCtrl.run(A0_1)
  A0_1.update_main_task = invokeTask(function()
    A0_1:_updateMain()
  end)
  A0_1.update_dist_task = invokeTask(function()
    A0_1:_updateDistance()
  end)
  if Debug:isMasterBuild() then
  else
    A0_1:debug()
  end
end
function PlacementCtrl.kill(A0_2)
  A0_2.update_main_task = A0_2:_abortTask(A0_2.update_main_task)
  A0_2.update_dist_task = A0_2:_abortTask(A0_2.update_dist_task)
  A0_2.update_dist_on = false
  A0_2.update_gimmick_task = A0_2:_abortTask(A0_2.update_gimmick_task)
  A0_2.update_grabbed_task = A0_2:_abortTask(A0_2.update_grabbed_task)
  A0_2.update_effect_task = A0_2:_abortTask(A0_2.update_effect_task)
  A0_2.update_gem_task = A0_2:_abortTask(A0_2.update_gem_task)
  A0_2.update_area_reg_task = A0_2:_abortTask(A0_2.update_area_reg_task)
  A0_2.gimmick_bg_on = true
  A0_2.grabbed_obj_on = true
  A0_2.effect_on = true
  A0_2.area_reg_on = true
  A0_2.gem_on = false
end
function PlacementCtrl.swtichGem(A0_3, A1_4)
  A0_3.gem_on = A1_4
end
function PlacementCtrl.setAreaRegularBg(A0_5, A1_6)
  for _FORV_5_, _FORV_6_ in ipairs(A1_6) do
    if A0_5.all_areas[_FORV_6_.area] == nil and findGameObject2("Area", _FORV_6_.area) then
      A0_5.all_areas[_FORV_6_.area] = {
        hdl = findGameObject2("Area", _FORV_6_.area),
        dist = -1,
        active = false,
        hide = false,
        ofs_y = _FORV_6_.ofs_y,
        ofs_dist = -1
      }
    end
    A0_5.placement.area_reg[_FORV_6_.area] = {
      node = _FORV_6_.node,
      name = _FORV_6_.name,
      hdl = nil,
      lod = _FORV_6_.lod,
      lod_hdl = nil
    }
  end
end
function PlacementCtrl.updateEnable(A0_7)
  local L1_8
  A0_7.update_start = true
end
function PlacementCtrl._isValid(A0_9)
  local L1_10
  if A0_9 == nil then
    L1_10 = false
    return L1_10
  end
  L1_10 = true
  return L1_10
end
function PlacementCtrl._installMethods(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  for L4_15, L5_16 in L1_12(L2_13) do
    if type(L5_16) == "function" then
      A0_11[L4_15] = L5_16
    end
  end
end
function PlacementCtrl._updateMain(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34
  L1_18 = A0_17._findRootAreaHandle
  L1_18(L2_19, L3_20)
  L1_18 = wait
  L1_18()
  L1_18 = 0
  for L5_22, L6_23 in L2_19(L3_20) do
    L8_25 = A0_17
    L7_24 = A0_17._findSubAreaHandleAndSetPlacementObject
    L9_26 = L6_23.hdl
    L10_27 = _placement_object_list
    L11_28 = L6_23.index
    L10_27 = L10_27[L11_28]
    L7_24(L8_25, L9_26, L10_27)
    L1_18 = L1_18 + 1
    if L1_18 >= 10 then
      L1_18 = 0
      L7_24 = wait
      L7_24()
    end
  end
  L6_23 = "gem_lo"
  L6_23 = "mi_a_root"
  L7_24 = "gem_mi"
  L6_23 = {L7_24, L8_25}
  L7_24 = "up_a_root"
  L8_25 = "gem_up"
  L7_24 = {
    L8_25,
    L9_26,
    L10_27
  }
  L8_25 = "cc_a_root"
  L9_26 = "gem_cc"
  L10_27 = "cc_a_01"
  L8_25 = {
    L9_26,
    L10_27,
    L11_28
  }
  L9_26 = "ed_a_root"
  L10_27 = "gem_ed"
  L11_28 = "ed_a_01"
  L9_26 = {
    L10_27,
    L11_28,
    L12_29
  }
  L10_27 = "id_a_root"
  L11_28 = "gem_id"
  L10_27 = {
    L11_28,
    L12_29,
    L13_30
  }
  L11_28 = "dt_a_root"
  for L6_23, L7_24 in L3_20(L4_21) do
    L8_25 = findGameObject2
    L9_26 = "Area"
    L10_27 = L7_24[1]
    L8_25 = L8_25(L9_26, L10_27)
    if L8_25 then
      L9_26 = loadFileAsset
      L10_27 = "evb"
      L11_28 = "evx/"
      L11_28 = L11_28 .. L12_29
      L9_26 = L9_26(L10_27, L11_28)
      if L9_26 then
        L11_28 = L9_26
        L10_27 = L9_26.wait
        L10_27(L11_28)
        L10_27 = L7_24[3]
        if L10_27 then
          L10_27 = findGameObject2
          L11_28 = "Area"
          L10_27 = L10_27(L11_28, L12_29)
          if L10_27 then
            L11_28 = L9_26.findBundle
            L11_28 = L11_28(L12_29, L13_30)
            if L11_28 then
              if L12_29 == nil then
                L14_31.hdl = L10_27
                L14_31.dist = -1
                L14_31.active = false
                L14_31.hide = false
                L12_29[L13_30] = L14_31
              end
              L15_32 = "evarea2_gem_"
              L16_33 = L7_24[3]
              L15_32 = L15_32 .. L16_33
              L14_31.name = L15_32
              L14_31.hdl = nil
              L14_31.bundle = L11_28
              L14_31.aadd = false
              L12_29[L13_30] = L14_31
            end
          end
        end
        L11_28 = L9_26
        L10_27 = L9_26.findBundle
        L10_27 = L10_27(L11_28, L12_29)
        if L10_27 then
          L11_28 = A0_17.all_areas
          L11_28 = L11_28[L12_29]
          if L11_28 == nil then
            L11_28 = A0_17.all_areas
            L13_30.hdl = L14_31
            L13_30.dist = -1
            L13_30.active = false
            L13_30.hide = false
            L11_28[L12_29] = L13_30
          end
          L11_28 = A0_17.placement
          L11_28 = L11_28.gem
          L15_32 = L7_24[1]
          L13_30.name = L14_31
          L13_30.hdl = nil
          L13_30.bundle = L10_27
          L13_30.aadd = false
          L11_28[L12_29] = L13_30
        end
        L11_28 = L8_25.getDescendant
        L11_28 = L11_28(L12_29)
        for L15_32, L16_33 in L12_29(L13_30) do
          L17_34 = L16_33.getName
          L17_34 = L17_34(L16_33)
          if string.find(L17_34, "lod") == nil and L9_26:findBundle("evarea2_" .. L17_34) then
            if A0_17.all_areas[L17_34] == nil then
              A0_17.all_areas[L17_34] = {
                hdl = L16_33,
                dist = -1,
                active = false,
                hide = false
              }
            end
            A0_17.placement.gem[L17_34] = {
              name = "evarea2_gem_" .. L17_34,
              hdl = nil,
              bundle = L9_26:findBundle("evarea2_" .. L17_34),
              aadd = false
            }
          end
        end
      end
    end
    L9_26 = wait
    L9_26()
  end
  repeat
    L3_20()
  until L3_20
  A0_17.update_dist_on = true
  L3_20(L4_21)
  L3_20(L4_21)
  L3_20(L4_21)
  L3_20(L4_21)
  L3_20(L4_21)
  while true do
    if L3_20 then
      L3_20()
      while true do
        if not L3_20 then
          L3_20()
          L3_20()
        end
      end
      L3_20()
      A0_17.is_object_start = false
    end
    L3_20()
  end
end
function PlacementCtrl._updateDistance(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48
  while true do
    L1_36 = A0_35.update_dist_on
    if L1_36 then
      L1_36 = Area
      L2_37 = L1_36
      L1_36 = L1_36.getActiveAreas
      L3_38 = 5
      L1_36 = L1_36(L2_37, L3_38)
      L2_37 = A0_35.player
      L3_38 = L2_37
      L2_37 = L2_37.getWorldPos
      L2_37 = L2_37(L3_38)
      L3_38 = nil
      L4_39 = 1
      for L8_43, L9_44 in L5_40(L6_41) do
        if L10_45 then
          L3_38 = L10_45
          L9_44.dist = L10_45
          if L10_45 < 0 then
            L9_44.dist = L10_45
          end
          if L10_45 then
            L3_38.y = L10_45
            L9_44.ofs_dist = L10_45
            if L10_45 < 0 then
              L9_44.ofs_dist = L10_45
            end
          end
          for L13_48, _FORV_14_ in L10_45(L11_46) do
            L9_44.active = false
            if _FORV_14_ == L8_43 then
              if L9_44.hdl:isEffectiveness() == true then
                L9_44.hide = false
              else
                L9_44.hide = true
              end
              L9_44.active = true
              table.remove(L1_36, L13_48)
              break
            end
          end
          if not (L10_45 < L11_46) then
          else
            if L10_45 then
              if L10_45 == nil then
                L10_45[L8_43] = L9_44
              end
          end
          elseif L10_45 then
            L10_45[L8_43] = nil
          end
        end
        if L10_45 == 0 then
          L10_45()
        end
        L4_39 = L4_39 + 1
      end
    end
    L1_36 = wait
    L1_36()
  end
end
function PlacementCtrl._findRootAreaHandle(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60
  for L5_54, L6_55 in L2_51(L3_52) do
    for L10_59, L11_60 in L7_56(L8_57) do
      if findGameObject2("Area", L11_60) then
        if A0_49.root_areas[L11_60] == nil then
          A0_49.root_areas[L11_60] = {
            hdl = findGameObject2("Area", L11_60),
            index = L5_54
          }
        end
        if A0_49.all_areas[L11_60] == nil then
          A0_49.all_areas[L11_60] = {
            hdl = findGameObject2("Area", L11_60),
            dist = -1,
            active = false,
            hide = false
          }
        end
        break
      end
    end
  end
end
function PlacementCtrl._findSubAreaHandleAndSetPlacementObject(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  if A2_63 == nil then
    return
  end
  function L3_64(A0_75, A1_76, A2_77, A3_78)
    local L4_79
    L4_79 = nil
    if A1_76 == A0_75:getName() then
      L4_79 = A0_75
    else
      L4_79 = A0_75:findSubArea(A1_76)
    end
    if L4_79 then
      A0_61:_setPlacementObject(L4_79, A1_76, A2_77, A3_78)
      if A0_61.all_areas[A1_76] == nil then
        A0_61.all_areas[A1_76] = {
          hdl = L4_79,
          dist = -1,
          active = false,
          hide = false
        }
      end
    elseif A2_77.AreaRegularBg then
      A0_61:_setPlacementObject(nil, A1_76, A2_77, A3_78)
    end
  end
  for L7_68, L8_69 in L4_65(L5_66) do
    if L9_70 then
      for L12_73, L13_74 in L9_70(L10_71) do
        L3_64(A1_62, L7_68 .. L13_74, L8_69, L7_68)
      end
    else
      L12_73 = L8_69
      L13_74 = L7_68
      L9_70(L10_71, L11_72, L12_73, L13_74)
    end
  end
end
function PlacementCtrl._setPlacementObject(A0_80, A1_81, A2_82, A3_83, A4_84)
  local L5_85, L6_86, L7_87, L8_88, L9_89, L10_90, L11_91, L12_92, L13_93, L14_94, L15_95, L16_96, L17_97, L18_98, L19_99
  L5_85 = A3_83.gimmick_bg
  if L5_85 then
    L5_85 = {}
    for L9_89, L10_90 in L6_86(L7_87) do
      if L12_92 == "table" then
        for L15_95, L16_96 in L12_92(L13_93) do
          L18_98 = L5_85
          L19_99 = {}
          L19_99.name = L10_90.name
          L19_99.hdl = nil
          L19_99.node = L16_96
          L17_97(L18_98, L19_99)
        end
      else
        for L15_95 = 1, L10_90.cnt do
          L18_98 = "%02d"
          L19_99 = L15_95
          L18_98 = L11_91
          L19_99 = L16_96
          L17_97(L18_98, L19_99)
          L18_98 = L5_85
          L19_99 = {}
          L19_99.name = L10_90.name
          L19_99.hdl = nil
          L19_99.node = L16_96
          L17_97(L18_98, L19_99)
        end
      end
      L12_92(L13_93, L14_94, L15_95)
    end
    if L6_86 == nil then
      L7_87.hdl = A1_81
      L7_87.objs = L5_85
      L6_86[A2_82] = L7_87
    end
  end
  L5_85 = A3_83.grabbed_obj
  if L5_85 then
    L5_85 = {}
    for L9_89, L10_90 in L6_86(L7_87) do
      if L11_91 then
        for L14_94, L15_95 in L11_91(L12_92) do
          L18_98 = {}
          L19_99 = L10_90.name
          L18_98.name = L19_99
          L18_98.hdl = nil
          L19_99 = L15_95.pos
          L18_98.pos = L19_99
          L19_99 = L15_95.rot
          L18_98.rot = L19_99
          L16_96(L17_97, L18_98)
        end
      else
        L13_93.name = L14_94
        L13_93.hdl = nil
        L11_91(L12_92, L13_93)
      end
    end
    if L6_86 == nil then
      L7_87.hdl = A1_81
      L7_87.objs = L5_85
      L6_86[A2_82] = L7_87
    end
  end
  L5_85 = A3_83.effect
  if L5_85 then
    L5_85 = {}
    if L7_87 ~= nil and L8_88 ~= nil then
    end
    for L12_92, L13_93 in L9_89(L10_90) do
      for L18_98 = 1, L13_93 do
        L19_99 = L6_86
        L19_99 = L19_99 .. "_" .. L12_92 .. "_" .. string.format("%02d", L18_98)
        table.insert(L14_94, L19_99)
        if L5_85[L12_92] == nil then
          L5_85[L12_92] = {}
        end
        table.insert(L5_85[L12_92], {
          name = L12_92,
          hdl = nil,
          node = L19_99
        })
      end
      L18_98 = L14_94
      L15_95(L16_96, L17_97, L18_98)
    end
    if L9_89 == nil then
      L10_90.hdl = A1_81
      L10_90.objs = L5_85
      L9_89[A2_82] = L10_90
    end
  end
end
function PlacementCtrl._updateGimmickBg(A0_100)
  if A0_100:_isTableEmpty(A0_100.placement.gimmick_bg) then
    A0_100:debugPrint("\231\174\161\231\144\134\227\129\153\227\130\139GimmickBg\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167_updateGimmickBg\227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    return
  end
  A0_100.update_gimmick_task = invokeTask(function()
    local L0_101, L1_102
    while true do
      L0_101 = A0_100.placement
      L0_101 = L0_101.gimmick_bg
      L1_102 = 0
      for _FORV_5_, _FORV_6_ in pairs(L0_101) do
        if A0_100.use_areas[_FORV_5_] then
          if A0_100.use_areas[_FORV_5_].hide == false and A0_100.gimmick_bg_on then
            if not (A0_100.use_areas[_FORV_5_].dist <= -1) then
              for _FORV_13_, _FORV_14_ in ipairs(_FORV_6_.objs) do
                if _FORV_14_.hdl == nil then
                  if A0_100.use_areas[_FORV_5_].active or A0_100.use_areas[_FORV_5_].dist < A0_100.dist_gimmick.min then
                    _FORV_14_.hdl = A0_100:_createGimmickBg(_FORV_14_.name, _FORV_6_.hdl, _FORV_14_.node)
                    A0_100.is_object_start = true
                  end
                elseif not A0_100.use_areas[_FORV_5_].active and A0_100.use_areas[_FORV_5_].dist > A0_100.dist_gimmick.max then
                  _FORV_14_.hdl = A0_100:_termGameObj(_FORV_14_.hdl)
                end
                L1_102 = L1_102 + 1
                if L1_102 >= A0_100.gmk_cnt then
                  L1_102 = 0
                  wait()
                  while A0_100.is_object_start do
                    wait()
                  end
                end
              end
              else
                for _FORV_11_, _FORV_12_ in ipairs(_FORV_6_.objs) do
                  _FORV_12_.hdl = A0_100:_termGameObj(_FORV_12_.hdl)
                end
              end
              else
                for _FORV_11_, _FORV_12_ in ipairs(_FORV_6_.objs) do
                  _FORV_12_.hdl = A0_100:_termGameObj(_FORV_12_.hdl)
                end
              end
              L1_102 = L1_102 + 1
              if L1_102 >= A0_100.grb_cnt then
                L1_102 = 0
                while A0_100.is_object_start do
                  wait()
                end
                wait()
              end
            end
      end
      wait()
    end
  end)
end
function PlacementCtrl._updateGrabbedObject(A0_103)
  if A0_103:_isTableEmpty(A0_103.placement.grabbed_obj) then
    A0_103:debugPrint("\231\174\161\231\144\134\227\129\153\227\130\139GrabbedObject\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167 _updateGrabbedObject() \227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    return
  end
  A0_103.update_grabbed_task = invokeTask(function()
    local L0_104, L1_105
    while true do
      L0_104 = A0_103.placement
      L0_104 = L0_104.grabbed_obj
      L1_105 = 0
      for _FORV_5_, _FORV_6_ in pairs(L0_104) do
        if A0_103.use_areas[_FORV_5_] then
          if A0_103.use_areas[_FORV_5_].hide == false and A0_103.grabbed_obj_on then
            if not (A0_103.use_areas[_FORV_5_].dist <= -1) then
              for _FORV_13_, _FORV_14_ in ipairs(_FORV_6_.objs) do
                if _FORV_14_.hdl == nil then
                  if A0_103.use_areas[_FORV_5_].active or A0_103.use_areas[_FORV_5_].dist < A0_103.dist_grabbed.min then
                    _FORV_14_.hdl = A0_103:_createGrabbedObject(_FORV_14_.name, _FORV_6_.hdl, _FORV_14_.pos, _FORV_14_.rot)
                    A0_103.is_object_start = true
                  end
                elseif not A0_103.use_areas[_FORV_5_].active and A0_103.use_areas[_FORV_5_].dist > A0_103.dist_grabbed.max then
                  _FORV_14_.hdl = A0_103:_termGameObj(_FORV_14_.hdl)
                end
                L1_105 = L1_105 + 1
                if L1_105 >= A0_103.grb_cnt then
                  L1_105 = 0
                  wait()
                  while A0_103.is_object_start do
                    wait()
                  end
                end
              end
              else
                for _FORV_11_, _FORV_12_ in ipairs(_FORV_6_.objs) do
                  _FORV_12_.hdl = A0_103:_termGameObj(_FORV_12_.hdl)
                end
              end
              else
                for _FORV_11_, _FORV_12_ in ipairs(_FORV_6_.objs) do
                  _FORV_12_.hdl = A0_103:_termGameObj(_FORV_12_.hdl)
                end
              end
              L1_105 = L1_105 + 1
              if L1_105 >= A0_103.grb_cnt then
                L1_105 = 0
                wait()
                while A0_103.is_object_start do
                  wait()
                end
              end
            end
      end
      wait()
    end
  end)
end
function PlacementCtrl._updateEffect(A0_106)
  if A0_106:_isTableEmpty(A0_106.placement.effect) then
    A0_106:debugPrint("\231\174\161\231\144\134\227\129\153\227\130\139Effect\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167 _updateEffect() \227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    return
  end
  A0_106.update_effect_task = invokeTask(function()
    local L0_107, L1_108, L2_109, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115, L9_116, L10_117, L11_118, L12_119, L13_120, L14_121, L15_122, L16_123
    while true do
      L0_107 = A0_106.placement
      L0_107 = L0_107.effect
      L1_108 = 0
      for L5_112, L6_113 in L2_109(L3_110) do
        L7_114 = A0_106.use_areas
        L7_114 = L7_114[L5_112]
        if L7_114 then
          if L8_115 == false then
            if L8_115 then
              if not (L8_115 <= -1) then
                for L14_121, L15_122 in L11_118(L12_119) do
                  L16_123 = L10_117.queryLocatorDistance
                  L16_123 = L16_123(L10_117, L14_121)
                  if L16_123 ~= nil then
                    for _FORV_20_, _FORV_21_ in ipairs(L16_123) do
                      if L15_122[_FORV_20_].hdl == nil then
                        if _FORV_21_ < A0_106.dist_effect.min then
                          L15_122[_FORV_20_].hdl = A0_106:_createEffect(L15_122[_FORV_20_].name, L10_117, L15_122[_FORV_20_].node)
                          A0_106.is_object_start = true
                        end
                      elseif _FORV_21_ > A0_106.dist_effect.max then
                        L15_122[_FORV_20_].hdl = A0_106:_termEffect(L15_122[_FORV_20_].hdl)
                      end
                      L1_108 = L1_108 + 1
                      if L1_108 >= A0_106.eff_cnt then
                        L1_108 = 0
                        wait()
                        while A0_106.is_object_start do
                          wait()
                        end
                      end
                    end
                  end
                end
                else
                  for L11_118, L12_119 in L8_115(L9_116) do
                    for L16_123, _FORV_17_ in L13_120(L14_121) do
                      _FORV_17_.hdl = A0_106:_termEffect(_FORV_17_.hdl)
                    end
                  end
                end
                else
                  for L11_118, L12_119 in L8_115(L9_116) do
                    for L16_123, _FORV_17_ in L13_120(L14_121) do
                      _FORV_17_.hdl = A0_106:_termEffect(_FORV_17_.hdl)
                    end
                  end
                end
                L1_108 = L1_108 + 1
                if L1_108 >= L8_115 then
                  L1_108 = 0
                  L8_115()
                  while true do
                    if L8_115 then
                      L8_115()
                    end
                  end
                end
              end
            end
      end
      L2_109()
    end
  end)
end
function PlacementCtrl._updateGem(A0_124)
  if A0_124:_isTableEmpty(A0_124.placement.gem) then
    A0_124:debugPrint("\231\174\161\231\144\134\227\129\153\227\130\139Gem\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167 _updateGem() \227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    return
  end
  A0_124.update_gem_task = invokeTask(function()
    local L0_125, L1_126, L2_127, L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134, L10_135, L11_136, L12_137
    while true do
      L0_125 = Aabb
      L1_126 = Vector
      L2_127 = -60
      L1_126 = L1_126(L2_127, L3_128, L4_129)
      L2_127 = Vector
      L12_137 = L2_127(L3_128, L4_129, L5_130)
      L0_125 = L0_125(L1_126, L2_127, L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134, L10_135, L11_136, L12_137, L2_127(L3_128, L4_129, L5_130))
      L1_126 = A0_124.placement
      L1_126 = L1_126.gem
      L2_127 = 0
      for L6_131, L7_132 in L3_128(L4_129) do
        L8_133 = A0_124.use_areas
        L8_133 = L8_133[L6_131]
        if L8_133 then
          L9_134 = L8_133.hide
          if L9_134 == false then
            L9_134 = A0_124.gem_on
            if L9_134 then
              L9_134 = L8_133.dist
              L10_135 = L8_133.active
              if not (L9_134 <= -1) then
                L11_136 = L7_132.hdl
                if L11_136 == nil then
                  if not L10_135 then
                    L11_136 = A0_124.dist_gem
                    L11_136 = L11_136.min
                  elseif L9_134 < L11_136 then
                    L11_136 = A0_124
                    L12_137 = L11_136
                    L11_136 = L11_136._createEventData
                    L11_136 = L11_136(L12_137, L7_132.name, L7_132.bundle)
                    L7_132.hdl = L11_136
                    A0_124.is_object_start = true
                  end
                else
                  L11_136 = L7_132.aadd
                  if L11_136 == false then
                    L11_136 = findGameObject2
                    L12_137 = "EventData"
                    L11_136 = L11_136(L12_137, L7_132.name)
                    if L11_136 then
                      L12_137 = L7_132.hdl
                      L12_137 = L12_137.getLocalAabb
                      L12_137 = L12_137(L12_137)
                      L12_137.max.x = L12_137.max.x + L0_125.max.x
                      L12_137.max.y = L12_137.max.y + L0_125.max.y
                      L12_137.max.z = L12_137.max.z + L0_125.max.z
                      L12_137.min.x = L12_137.min.x + L0_125.min.x
                      L12_137.min.y = L12_137.min.y + L0_125.min.y
                      L12_137.min.z = L12_137.min.z + L0_125.min.z
                      L7_132.hdl:setLocalAabb(L12_137)
                      L7_132.aadd = true
                    end
                  end
                  if not L10_135 then
                    L11_136 = A0_124.dist_gem
                    L11_136 = L11_136.max
                    if L9_134 > L11_136 then
                      L11_136 = A0_124
                      L12_137 = L11_136
                      L11_136 = L11_136._termGameObj
                      L11_136 = L11_136(L12_137, L7_132.hdl)
                      L7_132.hdl = L11_136
                      L7_132.aadd = false
                    end
                  end
                end
                else
                  L9_134 = A0_124
                  L10_135 = L9_134
                  L9_134 = L9_134._termGameObj
                  L11_136 = L7_132.hdl
                  L9_134 = L9_134(L10_135, L11_136)
                  L7_132.hdl = L9_134
                  L7_132.aadd = false
                end
                else
                  L9_134 = A0_124
                  L10_135 = L9_134
                  L9_134 = L9_134._termGameObj
                  L11_136 = L7_132.hdl
                  L9_134 = L9_134(L10_135, L11_136)
                  L7_132.hdl = L9_134
                  L7_132.aadd = false
                end
                L2_127 = L2_127 + 1
                L9_134 = A0_124.gem_cnt
                if L2_127 >= L9_134 then
                  L2_127 = 0
                  L9_134 = wait
                  L9_134()
                  while true do
                    L9_134 = A0_124.is_object_start
                    if L9_134 then
                      L9_134 = wait
                      L9_134()
                    end
                  end
                end
              end
            end
      end
      L3_128()
    end
  end)
end
function PlacementCtrl._updateAreaRegulerBg(A0_138)
  if A0_138:_isTableEmpty(A0_138.placement.area_reg) then
    A0_138:debugPrint("\231\174\161\231\144\134\227\129\153\227\130\139AreaRegulerBg\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167 _updateAreaRegulerBg() \227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    return
  end
  A0_138.update_area_reg_task = invokeTask(function()
    local L0_139, L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149
    while true do
      L0_139 = A0_138.placement
      L0_139 = L0_139.area_reg
      L1_140 = 0
      for L5_144, L6_145 in L2_141(L3_142) do
        L7_146 = A0_138.use_areas
        L7_146 = L7_146[L5_144]
        if L7_146 then
          L8_147 = L7_146.hide
          if L8_147 == false then
            L8_147 = A0_138.area_reg_on
            if L8_147 then
              L8_147 = L7_146.dist
              L9_148 = L7_146.active
              L10_149 = L7_146.ofs_dist
              if L10_149 then
                L10_149 = L7_146.ofs_dist
                if L10_149 > 0 then
                  L8_147 = L7_146.ofs_dist
                end
              end
              if not (L8_147 <= -1) then
                if not L9_148 then
                  L10_149 = A0_138.dist_area_reg
                  L10_149 = L10_149.min
                else
                  if L8_147 < L10_149 then
                    L10_149 = L6_145.hdl
                    if L10_149 == nil then
                      L10_149 = true
                      if L6_145.lod then
                        L10_149 = false
                      end
                      L6_145.hdl = A0_138:_createAreaRegularBg(L6_145.name, L7_146.hdl, L6_145.node, L10_149)
                      A0_138.all_areas[L6_145.name] = {
                        hdl = L6_145.hdl,
                        dist = -1,
                        active = false,
                        hide = false
                      }
                      if A0_138.placement.grabbed_obj[L6_145.name] then
                        A0_138.placement.grabbed_obj[L6_145.name].hdl = L6_145.hdl
                      end
                    end
                    L10_149 = L6_145.lod_hdl
                    if L10_149 then
                      L10_149 = A0_138
                      L10_149 = L10_149._termGameObj
                      L10_149 = L10_149(L10_149, L6_145.lod_hdl)
                      L6_145.lod_hdl = L10_149
                    end
                end
                elseif not L9_148 then
                  L10_149 = A0_138.dist_area_reg
                  L10_149 = L10_149.max
                  if L8_147 > L10_149 then
                    L10_149 = L6_145.lod_hdl
                    if L10_149 == nil then
                      L10_149 = A0_138
                      L10_149 = L10_149._createTerrainBg
                      L10_149 = L10_149(L10_149, L6_145.lod, L7_146.hdl, L6_145.node)
                      L6_145.lod_hdl = L10_149
                    end
                    L10_149 = L6_145.hdl
                    if L10_149 then
                      L10_149 = A0_138
                      L10_149 = L10_149._termGameObj
                      L10_149 = L10_149(L10_149, L6_145.hdl)
                      L6_145.hdl = L10_149
                      L10_149 = A0_138.placement
                      L10_149 = L10_149.grabbed_obj
                      L10_149 = L10_149[L6_145.name]
                      if L10_149 then
                        L10_149 = A0_138.placement
                        L10_149 = L10_149.grabbed_obj
                        L10_149 = L10_149[L6_145.name]
                        L10_149.hdl = nil
                      end
                      L10_149 = A0_138.all_areas
                      L10_149 = L10_149[L6_145.name]
                      if L10_149 then
                        L10_149 = A0_138.all_areas
                        L10_149[L6_145.name] = nil
                      end
                      L10_149 = A0_138.use_areas
                      L10_149 = L10_149[L6_145.name]
                      if L10_149 then
                        L10_149 = A0_138.use_areas
                        L10_149[L6_145.name] = nil
                      end
                    end
                  end
                end
                else
                  L8_147 = L6_145.lod_hdl
                  if L8_147 then
                    L8_147 = A0_138
                    L9_148 = L8_147
                    L8_147 = L8_147._termGameObj
                    L10_149 = L6_145.lod_hdl
                    L8_147 = L8_147(L9_148, L10_149)
                    L6_145.lod_hdl = L8_147
                  end
                  L8_147 = L6_145.hdl
                  if L8_147 then
                    L8_147 = A0_138
                    L9_148 = L8_147
                    L8_147 = L8_147._termGameObj
                    L10_149 = L6_145.hdl
                    L8_147 = L8_147(L9_148, L10_149)
                    L6_145.hdl = L8_147
                    L8_147 = A0_138.placement
                    L8_147 = L8_147.grabbed_obj
                    L9_148 = L6_145.name
                    L8_147 = L8_147[L9_148]
                    if L8_147 then
                      L8_147 = A0_138.placement
                      L8_147 = L8_147.grabbed_obj
                      L9_148 = L6_145.name
                      L8_147 = L8_147[L9_148]
                      L8_147.hdl = nil
                    end
                    L8_147 = A0_138.all_areas
                    L9_148 = L6_145.name
                    L8_147 = L8_147[L9_148]
                    if L8_147 then
                      L8_147 = A0_138.all_areas
                      L9_148 = L6_145.name
                      L8_147[L9_148] = nil
                    end
                    L8_147 = A0_138.use_areas
                    L9_148 = L6_145.name
                    L8_147 = L8_147[L9_148]
                    if L8_147 then
                      L8_147 = A0_138.use_areas
                      L9_148 = L6_145.name
                      L8_147[L9_148] = nil
                    end
                  end
                end
                else
                  L8_147 = A0_138.all_areas
                  L8_147 = L8_147[L5_144]
                  if L8_147 then
                    L9_148 = L6_145.lod_hdl
                    if L9_148 == nil then
                      L9_148 = L8_147.hide
                      if L9_148 == false then
                        L9_148 = A0_138
                        L10_149 = L9_148
                        L9_148 = L9_148._createTerrainBg
                        L9_148 = L9_148(L10_149, L6_145.lod, L8_147.hdl, L6_145.node)
                        L6_145.lod_hdl = L9_148
                      else
                        L9_148 = A0_138
                        L10_149 = L9_148
                        L9_148 = L9_148._termGameObj
                        L9_148 = L9_148(L10_149, L6_145.lod_hdl)
                        L6_145.lod_hdl = L9_148
                      end
                    end
                  else
                    L9_148 = A0_138
                    L10_149 = L9_148
                    L9_148 = L9_148._termGameObj
                    L9_148 = L9_148(L10_149, L6_145.lod_hdl)
                    L6_145.lod_hdl = L9_148
                  end
                  L9_148 = L6_145.hdl
                  if L9_148 then
                    L9_148 = A0_138
                    L10_149 = L9_148
                    L9_148 = L9_148._termGameObj
                    L9_148 = L9_148(L10_149, L6_145.hdl)
                    L6_145.hdl = L9_148
                    L9_148 = A0_138.placement
                    L9_148 = L9_148.grabbed_obj
                    L10_149 = L6_145.name
                    L9_148 = L9_148[L10_149]
                    if L9_148 then
                      L9_148 = A0_138.placement
                      L9_148 = L9_148.grabbed_obj
                      L10_149 = L6_145.name
                      L9_148 = L9_148[L10_149]
                      L9_148.hdl = nil
                    end
                    L9_148 = A0_138.all_areas
                    L10_149 = L6_145.name
                    L9_148 = L9_148[L10_149]
                    if L9_148 then
                      L9_148 = A0_138.all_areas
                      L10_149 = L6_145.name
                      L9_148[L10_149] = nil
                    end
                    L9_148 = A0_138.use_areas
                    L10_149 = L6_145.name
                    L9_148 = L9_148[L10_149]
                    if L9_148 then
                      L9_148 = A0_138.use_areas
                      L10_149 = L6_145.name
                      L9_148[L10_149] = nil
                    end
                  end
                end
                L8_147 = wait
                L8_147()
              end
            end
      end
      L2_141()
    end
  end)
end
function PlacementCtrl._createGimmickBg(A0_150, A1_151, A2_152, A3_153, A4_154)
  local L5_155
  if A1_151 == nil then
    return
  end
  L5_155 = A0_150.debugPrint
  L5_155(A0_150, "GimmickBg > " .. A2_152:getName() .. " \227\129\174 " .. A3_153 .. " \227\129\171 " .. A1_151 .. " \227\130\146\228\189\156\230\136\144")
  L5_155 = createGameObject2
  L5_155 = L5_155("GimmickBg")
  L5_155:setName(A3_153)
  L5_155:setDrawModelName(A1_151)
  L5_155:setAttributeName(A1_151)
  L5_155:setCollisionName(A1_151)
  A2_152:appendChild(L5_155)
  L5_155:setTransform(A2_152:getNodeLocalPosRot(A3_153))
  if A4_154 then
    if not GameDatabase:get(A4_154) then
      L5_155:setEventListener("broken", function(A0_156)
        GameDatabase:set(A4_154, true)
      end)
    else
      L5_155:requestBrokenStart(true)
    end
  end
  return L5_155
end
function PlacementCtrl._createGrabbedObject(A0_157, A1_158, A2_159, A3_160, A4_161)
  local L5_162
  if A1_158 == nil and A2_159 == nil then
    L5_162 = A0_157.debugPrint
    L5_162(A0_157, "GrabbedObject > name \227\129\139 area \227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\228\189\156\230\136\144\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
    return
  end
  L5_162 = A0_157.debugPrint
  L5_162(A0_157, "GrabbedObject > " .. A2_159:getName() .. " \227\129\171 " .. A1_158 .. " \227\130\146\228\189\156\230\136\144 pos :" .. tostring(A3_160) .. " rot : " .. tostring(A4_161))
  L5_162 = createGameObject2
  L5_162 = L5_162("GrabbedObjectGenerator")
  L5_162:setName(A1_158)
  L5_162:setCollisionFileName(A1_158)
  L5_162:setGenertionObjectName("grab_water")
  L5_162:setGenerationObjectIsWater(true)
  L5_162:setEffectName("ef_com_wtr_02", GrabbedObjectGenerator.kEffectPosition_Fixied)
  L5_162:setEffectName("ef_com_wtr_01", GrabbedObjectGenerator.kEffectPosition_Object)
  A2_159:appendChild(L5_162)
  if A3_160 then
    L5_162:setTransform(A3_160, A4_161)
  end
  return L5_162
end
function PlacementCtrl._createAreaRegularBg(A0_163, A1_164, A2_165, A3_166, A4_167)
  local L5_168, L6_169
  if A1_164 == nil then
    return
  end
  L5_168 = A1_164
  if L5_168 == "g1_base_dt_f1_clocktower" then
    L6_169 = A0_163._isClockTowerBloken
    L6_169 = L6_169(A0_163)
    if L6_169 then
      L5_168 = "g1_base_dt_f1_clocktower_af"
    end
  end
  L6_169 = A0_163.debugPrint
  L6_169(A0_163, "AreaRegularBg > " .. A2_165:getName() .. " \227\129\174 " .. A3_166 .. " \227\129\171 " .. L5_168 .. " \227\130\146\228\189\156\230\136\144")
  L6_169 = createGameObject2
  L6_169 = L6_169("AreaRegularBg")
  L6_169:setName(L5_168)
  L6_169:setModelName(L5_168)
  L6_169:setEventRange(200)
  L6_169:setVisible(false)
  L6_169:setActive(false)
  L6_169:try_init()
  if A4_167 then
    invokeTask(function()
      local L0_170, L1_171
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.waitForReady
      L0_170(L1_171)
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.try_start
      L0_170(L1_171)
      while true do
        L0_170 = L6_169
        L1_171 = L0_170
        L0_170 = L0_170.isLoading
        L0_170 = L0_170(L1_171)
        if L0_170 then
          L0_170 = wait
          L0_170()
        end
      end
      L0_170 = A2_165
      L1_171 = L0_170
      L0_170 = L0_170.appendChild
      L0_170(L1_171, L6_169)
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.setTransform
      L0_170(L1_171, A2_165:getNodeLocalPosRot(A3_166))
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.setForceMove
      L0_170(L1_171)
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.setActive
      L0_170(L1_171, true)
      L0_170 = L6_169
      L1_171 = L0_170
      L0_170 = L0_170.setVisible
      L0_170(L1_171, true)
      L0_170 = A1_164
      if L0_170 ~= "g1_base_cc_sign" then
        L0_170 = A1_164
      elseif L0_170 == "g1_base_cc_sign_af" then
        L0_170 = findGameObject2
        L1_171 = "GimmickBg"
        L0_170 = L0_170(L1_171, "g1_monument_sn_01_water_01")
        if L0_170 then
          L1_171 = L0_170.getLocalAabb
          L1_171 = L1_171(L0_170)
          L1_171.max.x = L1_171.max.x + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).max.x
          L1_171.max.y = L1_171.max.y + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).max.y
          L1_171.max.z = L1_171.max.z + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).max.z
          L1_171.min.x = L1_171.min.x + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).min.x
          L1_171.min.y = L1_171.min.y + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).min.y
          L1_171.min.z = L1_171.min.z + Aabb(Vector(-150, -150, -150), Vector(150, 150, 150)).min.z
          L0_170:setLocalAabb(L1_171)
        end
      end
    end)
  else
    L6_169:waitForReady()
    L6_169:try_start()
    while L6_169:isLoading() do
      wait()
    end
    A2_165:appendChild(L6_169)
    L6_169:setTransform(A2_165:getNodeLocalPosRot(A3_166))
    L6_169:setForceMove()
    L6_169:setActive(true)
    L6_169:setVisible(true)
  end
  return L6_169
end
function PlacementCtrl._createEffect(A0_172, A1_173, A2_174, A3_175)
  local L4_176
  if A1_173 == nil then
    return
  end
  L4_176 = A0_172.debugPrint
  L4_176(A0_172, "Effect > " .. A2_174:getName() .. " \227\129\174 " .. A3_175 .. " \227\129\171 " .. A1_173 .. " \227\130\146\228\189\156\230\136\144")
  L4_176 = createGameObject2
  L4_176 = L4_176("Effect")
  L4_176:setName(A1_173)
  L4_176:setModelName(A1_173)
  L4_176:play()
  L4_176:setLoop(true)
  A2_174:appendChild(L4_176)
  L4_176:setTransform(A2_174:getNodeLocalPosRot(A3_175))
  return L4_176
end
function PlacementCtrl._createTerrainBg(A0_177, A1_178, A2_179, A3_180)
  local L4_181, L5_182
  if A1_178 == nil or A1_178 ~= "g1_base_dt_f1_clocktower_low" then
    return
  end
  L5_182 = A0_177
  L4_181 = A0_177.debugPrint
  L4_181(L5_182, "TerrainBg > " .. A2_179:getName() .. " \227\129\174 " .. A3_180 .. " \227\129\171 " .. A1_178 .. " \227\130\146\228\189\156\230\136\144")
  L4_181 = "g1_base_dt_f1_clocktower_merged"
  L5_182 = A0_177._isClockTowerBloken
  L5_182 = L5_182(A0_177)
  if L5_182 then
    L4_181 = "g1_base_dt_f1_clocktower_af_merged"
  end
  L5_182 = createGameObject2
  L5_182 = L5_182("TerrainBg")
  L5_182:setName(A1_178)
  L5_182:setModelName(A1_178)
  L5_182:setCollisionName(L4_181)
  A2_179:appendChild(L5_182)
  L5_182:setTransform(A2_179:getNodeLocalPosRot(A3_180))
  L5_182:try_init()
  L5_182:waitForReady()
  L5_182:try_start()
  return L5_182
end
function PlacementCtrl._createEventData(A0_183, A1_184, A2_185)
  A0_183:debugPrint("Gem > " .. A1_184 .. " \227\130\146\228\189\156\230\136\144")
  return EventData:create(A1_184, nil, A2_185)
end
function PlacementCtrl._termGameObj(A0_186, A1_187)
  if A1_187 then
    A0_186:debugPrint(A1_187:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_187:isRunning() then
      A1_187:try_term()
    else
      A1_187:kill()
    end
  end
  return nil
end
function PlacementCtrl._termEffect(A0_188, A1_189)
  if A1_189 then
    A0_188:debugPrint(A1_189:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_189:isRunning() then
      for _FORV_5_ = 1, 0, -0.1 do
        A1_189:setAlpha(1 - _FORV_5_ / 10)
        wait()
      end
      _FOR_(_FOR_)
    else
      A1_189:kill()
    end
  end
  return nil
end
function PlacementCtrl._abortTask(A0_190, A1_191)
  if A1_191 and A1_191:isRunning() then
    A1_191:abort()
  end
  return nil
end
function PlacementCtrl._isTableEmpty(A0_192, A1_193)
  local L2_194
  if A1_193 == nil then
    L2_194 = true
    return L2_194
  end
  L2_194 = true
  for _FORV_6_, _FORV_7_ in pairs(A1_193) do
    if _FORV_6_ then
      L2_194 = false
    end
    break
  end
  return L2_194
end
function PlacementCtrl._isClockTowerBloken(A0_195)
  local L1_196
  L1_196 = GameDatabase
  L1_196 = L1_196.get
  L1_196 = L1_196(L1_196, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if L1_196 == "ep24_00400m" or L1_196 == "ep24_c" or string.match(L1_196, "(.-)_()") == "ep25" then
    return true
  end
  return false
end
function PlacementCtrl.tremClockTower(A0_197)
  local L1_198
  L1_198 = A0_197.placement
  L1_198 = L1_198.area_reg
  L1_198 = L1_198.g1_base_dt_f1_road_01
  if L1_198 then
    L1_198.hdl = A0_197:_termGameObj(L1_198.hdl)
    L1_198.lod_hdl = A0_197:_termGameObj(L1_198.lod_hdl)
    if A0_197.placement.grabbed_obj[L1_198.name] then
      A0_197.placement.grabbed_obj[L1_198.name].hdl = nil
    end
    if A0_197.all_areas[L1_198.name] then
      A0_197.all_areas[L1_198.name] = nil
    end
    if A0_197.use_areas[L1_198.name] then
      A0_197.use_areas[L1_198.name] = nil
    end
  end
end
function PlacementCtrl.debugPrint(A0_199, A1_200)
  print(" [ placement ] " .. A1_200)
end
function PlacementCtrl.debugCheckNode(A0_201, A1_202, A2_203)
  local L3_204, L4_205, L5_206, L6_207, L7_208
  for L6_207, L7_208 in L3_204(L4_205) do
    if A1_202:getNodeWorldPosRot(L7_208) ~= nil then
      A0_201:debugPrint(A1_202:getName() .. " : " .. L7_208 .. " \227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\153")
    else
      A0_201:debugPrint(A1_202:getName() .. " : " .. L7_208 .. " \227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
    end
  end
end
function PlacementCtrl.debug(A0_209)
  invokeTask(function()
    local L0_210, L1_211, L2_212, L3_213, L4_214, L5_215, L6_216, L7_217, L8_218, L9_219, L10_220, L11_221, L12_222, L13_223, L14_224, L15_225, L16_226, L17_227, L18_228, L19_229
    L0_210 = 0
    L1_211 = 0
    L2_212 = 1
    function L3_213(A0_230)
      local L1_231
      L1_231 = L1_211
      L1_231 = 20 + L1_231
      if Debug:isDebugMenuOpen() then
        L1_231 = L1_231 + 200
      end
      Font:debugPrint(L1_231, 20 + 18 * L0_210, A0_230)
      L0_210 = L0_210 + 1
    end
    function L4_214(A0_232, A1_233)
      local L2_234, L3_235, L4_236, L5_237, L6_238, L7_239, L8_240
      L2_234 = A0_209.all_areas
      L2_234 = L2_234[A0_232]
      if L2_234 then
        L2_234 = 0
        L3_235 = 0
        for L7_239, L8_240 in L4_236(L5_237) do
          for _FORV_12_, _FORV_13_ in ipairs(L8_240) do
            L3_235 = L3_235 + 1
            if _FORV_13_.hdl then
              L2_234 = L2_234 + 1
            end
          end
        end
        if L4_236 == 1 then
          if L4_236 then
            L4_236(L5_237, L6_238)
          end
          L7_239 = A0_232
          L7_239 = tostring
          L8_240 = A0_209.all_areas
          L8_240 = L8_240[A0_232]
          L8_240 = L8_240.hide
          L7_239 = L7_239(L8_240)
          L8_240 = " ] max ["
          L4_236(L5_237)
          return L4_236
        elseif L2_234 >= 1 then
          if L4_236 then
            L4_236(L5_237, L6_238)
          end
          L7_239 = A0_232
          L7_239 = tostring
          L8_240 = A0_209.all_areas
          L8_240 = L8_240[A0_232]
          L8_240 = L8_240.hide
          L7_239 = L7_239(L8_240)
          L8_240 = " ] max ["
          L4_236(L5_237)
          return L4_236
        end
      end
      L2_234 = false
      return L2_234
    end
    function L5_215(A0_241, A1_242)
      local L2_243
      L2_243 = A0_209.all_areas
      L2_243 = L2_243[A0_241]
      if L2_243 then
        L2_243 = 0
        for _FORV_6_, _FORV_7_ in ipairs(A1_242.objs) do
          if _FORV_7_.hdl then
            L2_243 = L2_243 + 1
          end
        end
        if A0_209.dbg_state_id == 1 then
          if A0_209.dbg_info_set then
            table.insert(A0_209.dbg_info_list, A0_241)
          end
          L3_213(string.format("%-12s", A0_241) .. ": hide [ " .. tostring(A0_209.all_areas[A0_241].hide) .. " ] max [" .. string.format("%-2s", #A1_242.objs) .. "] create [" .. string.format("%-2s", L2_243) .. "]")
          return true
        elseif L2_243 >= 1 then
          if A0_209.dbg_info_set then
            table.insert(A0_209.dbg_info_list, A0_241)
          end
          L3_213(string.format("%-12s", A0_241) .. ": hide [ " .. tostring(A0_209.all_areas[A0_241].hide) .. " ] max [" .. string.format("%-2s", #A1_242.objs) .. "] create [" .. string.format("%-2s", L2_243) .. "]")
          return true
        end
      end
      L2_243 = false
      return L2_243
    end
    while true do
      if L6_216 then
        L0_210 = 0
        L2_212 = 1
        L1_211 = 0
        if L6_216 == 1 then
          L6_216(L7_217)
          for L9_219, L10_220 in L6_216(L7_217) do
            if L2_212 >= L11_221 then
              if L11_221 then
                if L11_221 == L9_219 then
                  for L14_224, L15_225 in L11_221(L12_222) do
                    if L16_226 then
                      L19_229 = ":"
                      L16_226(L17_227)
                    end
                  end
                end
              end
            end
            L2_212 = L2_212 + 1
          end
        elseif L6_216 == 2 then
          L6_216(L7_217)
          for L9_219, L10_220 in L6_216(L7_217) do
            if L2_212 >= L11_221 then
              if L11_221 then
                if L11_221 == L9_219 then
                  for L14_224, L15_225 in L11_221(L12_222) do
                    if L16_226 then
                      L19_229 = ":"
                      L16_226(L17_227)
                    end
                  end
                end
              end
            end
            L2_212 = L2_212 + 1
          end
        elseif L6_216 == 3 then
          L6_216(L7_217)
          for L9_219, L10_220 in L6_216(L7_217) do
            if L2_212 >= L11_221 then
              if L11_221 then
                if L11_221 == L9_219 then
                  for L14_224, L15_225 in L11_221(L12_222) do
                    for L19_229, _FORV_20_ in L16_226(L17_227) do
                      if _FORV_20_.hdl then
                        L3_213("  " .. L19_229 .. ":" .. _FORV_20_.hdl:getName() .. " : " .. _FORV_20_.node)
                      end
                    end
                  end
                end
              end
            end
            L2_212 = L2_212 + 1
          end
        elseif L6_216 == 4 then
          L6_216(L7_217)
          if L6_216 then
            A0_209.dbg_info_list = L6_216
          end
          for L9_219, L10_220 in L6_216(L7_217) do
            if L0_210 < 27 then
              if L2_212 >= L11_221 then
                if L11_221 == 1 then
                  if L12_222 then
                  end
                  L14_224 = "g1_base_"
                  L14_224 = L9_219
                  if L12_222 ~= nil and L13_223 ~= nil then
                    L15_225 = string
                    L15_225 = L15_225.sub
                    L15_225 = L15_225(L16_226, L17_227, L18_228)
                    L14_224 = L15_225
                  end
                  L15_225 = L3_213
                  L19_229 = "%-12s"
                  L19_229 = ": hide [ "
                  L15_225(L16_226)
                elseif L11_221 then
                  if L11_221 ~= nil and L12_222 ~= nil then
                    L14_224 = string
                    L14_224 = L14_224.sub
                    L15_225 = L9_219
                    L14_224 = L14_224(L15_225, L16_226, L17_227)
                  end
                  L14_224 = L3_213
                  L15_225 = string
                  L15_225 = L15_225.format
                  L15_225 = L15_225(L16_226, L17_227)
                  L19_229 = L13_223
                  L19_229 = tostring
                  L19_229 = L19_229(A0_209.all_areas[L9_219].hide)
                  L15_225 = L15_225 .. L16_226 .. L17_227 .. L18_228 .. L19_229 .. " ]"
                  L14_224(L15_225)
                end
              end
            end
            L2_212 = L2_212 + 1
          end
        elseif L6_216 == 5 then
          L6_216(L7_217)
          for L9_219, L10_220 in L6_216(L7_217) do
            if L0_210 < 27 then
              if L2_212 >= L11_221 then
                if L11_221 == 1 then
                  if not L12_222 then
                  elseif L12_222 then
                  end
                  L14_224 = "g1_base_"
                  if L12_222 ~= nil and L13_223 ~= nil then
                    L14_224 = string
                    L14_224 = L14_224.sub
                    L15_225 = L9_219
                    L14_224 = L14_224(L15_225, L16_226, L17_227)
                    L9_219 = L14_224
                  end
                  L14_224 = L10_220.hdl
                  if L14_224 then
                    L14_224 = L3_213
                    L15_225 = string
                    L15_225 = L15_225.format
                    L15_225 = L15_225(L16_226, L17_227)
                    L19_229 = L9_219
                    L19_229 = L11_221
                    L15_225 = L15_225 .. L16_226 .. L17_227 .. L18_228 .. L19_229 .. "] : " .. tostring(L10_220.name)
                    L14_224(L15_225)
                  end
                  L14_224 = L10_220.lod_hdl
                  if L14_224 then
                    L14_224 = L3_213
                    L15_225 = string
                    L15_225 = L15_225.format
                    L15_225 = L15_225(L16_226, L17_227)
                    L19_229 = L9_219
                    L19_229 = L11_221
                    L15_225 = L15_225 .. L16_226 .. L17_227 .. L18_228 .. L19_229 .. "] : " .. tostring(L10_220.lod)
                    L14_224(L15_225)
                  end
                elseif not L11_221 then
                elseif L11_221 then
                  if L11_221 ~= nil and L12_222 ~= nil then
                    L14_224 = L9_219
                    L15_225 = L12_222 + 1
                    L9_219 = L13_223
                  end
                  if L13_223 then
                    L14_224 = string
                    L14_224 = L14_224.format
                    L15_225 = "%-3s"
                    L14_224 = L14_224(L15_225, L16_226)
                    L15_225 = " : "
                    L19_229 = L10_220.name
                    L14_224 = L14_224 .. L15_225 .. L16_226 .. L17_227 .. L18_228
                    L13_223(L14_224)
                  end
                  if L13_223 then
                    L14_224 = string
                    L14_224 = L14_224.format
                    L15_225 = "%-3s"
                    L14_224 = L14_224(L15_225, L16_226)
                    L15_225 = " : "
                    L19_229 = L10_220.lod
                    L14_224 = L14_224 .. L15_225 .. L16_226 .. L17_227 .. L18_228
                    L13_223(L14_224)
                  end
                end
              end
            end
            L2_212 = L2_212 + 1
          end
        else
          L6_216(L7_217)
        end
        A0_209.dbg_info_set = false
        L0_210 = 1
        L1_211 = 410
        L2_212 = 1
        if L6_216 == 1 then
          for L9_219, L10_220 in L6_216(L7_217) do
            if L0_210 < 27 then
              if L2_212 >= L11_221 then
                L14_224 = L2_212
                L14_224 = string
                L14_224 = L14_224.format
                L15_225 = "%-3s"
                L19_229 = L17_227(L18_228)
                L19_229 = L16_226(L17_227, L18_228, L19_229, L17_227(L18_228))
                L14_224 = L14_224(L15_225, L16_226, L17_227, L18_228, L19_229, L16_226(L17_227, L18_228, L19_229, L17_227(L18_228)))
                L15_225 = " ] "
                L11_221(L12_222)
              end
            end
            L2_212 = L2_212 + 1
          end
        else
          for L9_219, L10_220 in L6_216(L7_217) do
            if L0_210 < 27 then
              if L2_212 >= L11_221 then
                L14_224 = L2_212
                L14_224 = string
                L14_224 = L14_224.format
                L15_225 = "%-3s"
                L19_229 = L17_227(L18_228)
                L19_229 = L16_226(L17_227, L18_228, L19_229, L17_227(L18_228))
                L14_224 = L14_224(L15_225, L16_226, L17_227, L18_228, L19_229, L16_226(L17_227, L18_228, L19_229, L17_227(L18_228)))
                L15_225 = " ] "
                L11_221(L12_222)
              end
            end
            L2_212 = L2_212 + 1
          end
        end
        L0_210 = 0
        L1_211 = 410
        L6_216(L7_217)
      end
      L6_216()
    end
  end)
end
debugPlacementMenu = {
  name = "Placement",
  children = {
    {
      name = "disp",
      get = function()
        local L1_244
        L1_244 = _placement_ctrl
        L1_244 = L1_244.dbg_on
        return L1_244
      end,
      up = function()
        local L1_245
        L1_245 = _placement_ctrl
        L1_245.dbg_on = not _placement_ctrl.dbg_on
      end,
      down = function()
        local L1_246
        L1_246 = _placement_ctrl
        L1_246.dbg_on = not _placement_ctrl.dbg_on
      end
    },
    {
      name = "line",
      get = function()
        local L1_247
        L1_247 = _placement_ctrl
        L1_247 = L1_247.dbg_line
        return L1_247
      end,
      up = function()
        local L0_248, L1_249
        L0_248 = _placement_ctrl
        L1_249 = _placement_ctrl
        L1_249 = L1_249.dbg_line
        L1_249 = L1_249 + 1
        L0_248.dbg_line = L1_249
        L0_248 = _placement_ctrl
        L0_248 = L0_248.dbg_line
        if L0_248 > 500 then
          L0_248 = _placement_ctrl
          L0_248.dbg_line = 1
        end
      end,
      down = function()
        local L0_250, L1_251
        L0_250 = _placement_ctrl
        L1_251 = _placement_ctrl
        L1_251 = L1_251.dbg_line
        L1_251 = L1_251 - 1
        L0_250.dbg_line = L1_251
        L0_250 = _placement_ctrl
        L0_250 = L0_250.dbg_line
        if L0_250 <= 0 then
          L0_250 = _placement_ctrl
          L0_250.dbg_line = 500
        end
      end
    },
    {
      name = "state",
      get = function()
        local L0_252, L1_253
        L0_252 = _placement_ctrl
        L0_252 = L0_252.dbg_state_list
        L1_253 = _placement_ctrl
        L1_253 = L1_253.dbg_state_id
        L0_252 = L0_252[L1_253]
        return L0_252
      end,
      up = function()
        local L0_254, L1_255
        L0_254 = _placement_ctrl
        L1_255 = _placement_ctrl
        L1_255 = L1_255.dbg_state_id
        L1_255 = L1_255 + 1
        L0_254.dbg_state_id = L1_255
        L0_254 = _placement_ctrl
        L0_254 = L0_254.dbg_state_id
        L1_255 = _placement_ctrl
        L1_255 = L1_255.dbg_state_list
        L1_255 = #L1_255
        if L0_254 > L1_255 then
          L0_254 = _placement_ctrl
          L0_254.dbg_state_id = 1
        end
      end,
      down = function()
        local L0_256, L1_257
        L0_256 = _placement_ctrl
        L1_257 = _placement_ctrl
        L1_257 = L1_257.dbg_state_id
        L1_257 = L1_257 - 1
        L0_256.dbg_state_id = L1_257
        L0_256 = _placement_ctrl
        L0_256 = L0_256.dbg_state_id
        if L0_256 <= 0 then
          L0_256 = _placement_ctrl
          L1_257 = _placement_ctrl
          L1_257 = L1_257.dbg_state_list
          L1_257 = #L1_257
          L0_256.dbg_state_id = L1_257
        end
      end
    },
    {
      name = "type",
      get = function()
        local L0_258, L1_259
        L0_258 = _placement_ctrl
        L0_258 = L0_258.dbg_type_list
        L1_259 = _placement_ctrl
        L1_259 = L1_259.dbg_type_id
        L0_258 = L0_258[L1_259]
        return L0_258
      end,
      up = function()
        local L0_260, L1_261
        L0_260 = _placement_ctrl
        L1_261 = _placement_ctrl
        L1_261 = L1_261.dbg_type_id
        L1_261 = L1_261 + 1
        L0_260.dbg_type_id = L1_261
        L0_260 = _placement_ctrl
        L0_260 = L0_260.dbg_type_id
        L1_261 = _placement_ctrl
        L1_261 = L1_261.dbg_type_list
        L1_261 = #L1_261
        if L0_260 > L1_261 then
          L0_260 = _placement_ctrl
          L0_260.dbg_type_id = 1
        end
        L0_260 = _placement_ctrl
        L0_260.dbg_info_set = true
        L0_260 = _placement_ctrl
        L0_260.dbg_info_id = 1
        L0_260 = _placement_ctrl
        L0_260.dbg_line = 1
        L0_260 = _placement_ctrl
        L1_261 = {}
        L0_260.dbg_info_list = L1_261
      end,
      down = function()
        local L0_262, L1_263
        L0_262 = _placement_ctrl
        L1_263 = _placement_ctrl
        L1_263 = L1_263.dbg_type_id
        L1_263 = L1_263 - 1
        L0_262.dbg_type_id = L1_263
        L0_262 = _placement_ctrl
        L0_262 = L0_262.dbg_type_id
        if L0_262 <= 0 then
          L0_262 = _placement_ctrl
          L1_263 = _placement_ctrl
          L1_263 = L1_263.dbg_type_list
          L1_263 = #L1_263
          L0_262.dbg_type_id = L1_263
        end
        L0_262 = _placement_ctrl
        L0_262.dbg_info_set = true
        L0_262 = _placement_ctrl
        L0_262.dbg_info_id = 1
        L0_262 = _placement_ctrl
        L0_262.dbg_line = 1
        L0_262 = _placement_ctrl
        L1_263 = {}
        L0_262.dbg_info_list = L1_263
      end
    },
    {
      name = "info",
      get = function()
        local L0_264, L1_265
        L0_264 = _placement_ctrl
        L0_264 = L0_264.dbg_info_list
        L1_265 = _placement_ctrl
        L1_265 = L1_265.dbg_info_id
        L0_264 = L0_264[L1_265]
        return L0_264
      end,
      up = function()
        local L0_266, L1_267
        L0_266 = _placement_ctrl
        L1_267 = _placement_ctrl
        L1_267 = L1_267.dbg_info_id
        L1_267 = L1_267 + 1
        L0_266.dbg_info_id = L1_267
        L0_266 = _placement_ctrl
        L0_266 = L0_266.dbg_info_id
        L1_267 = _placement_ctrl
        L1_267 = L1_267.dbg_info_list
        L1_267 = #L1_267
        if L0_266 > L1_267 then
          L0_266 = _placement_ctrl
          L0_266.dbg_info_id = 1
        end
      end,
      down = function()
        local L0_268, L1_269
        L0_268 = _placement_ctrl
        L1_269 = _placement_ctrl
        L1_269 = L1_269.dbg_info_id
        L1_269 = L1_269 - 1
        L0_268.dbg_info_id = L1_269
        L0_268 = _placement_ctrl
        L0_268 = L0_268.dbg_info_id
        if L0_268 <= 0 then
          L0_268 = _placement_ctrl
          L1_269 = _placement_ctrl
          L1_269 = L1_269.dbg_info_list
          L1_269 = #L1_269
          L0_268.dbg_info_id = L1_269
        end
      end
    },
    {
      name = "GimmickBg",
      get = function()
        local L1_270
        L1_270 = _placement_ctrl
        L1_270 = L1_270.gimmick_bg_on
        return L1_270
      end,
      up = function()
        local L1_271
        L1_271 = _placement_ctrl
        L1_271.gimmick_bg_on = not _placement_ctrl.gimmick_bg_on
      end,
      down = function()
        local L1_272
        L1_272 = _placement_ctrl
        L1_272.gimmick_bg_on = not _placement_ctrl.gimmick_bg_on
      end
    },
    {
      name = "GrabbedObj",
      get = function()
        local L1_273
        L1_273 = _placement_ctrl
        L1_273 = L1_273.grabbed_obj_on
        return L1_273
      end,
      up = function()
        local L1_274
        L1_274 = _placement_ctrl
        L1_274.grabbed_obj_on = not _placement_ctrl.grabbed_obj_on
      end,
      down = function()
        local L1_275
        L1_275 = _placement_ctrl
        L1_275.grabbed_obj_on = not _placement_ctrl.grabbed_obj_on
      end
    },
    {
      name = "Effect",
      get = function()
        local L1_276
        L1_276 = _placement_ctrl
        L1_276 = L1_276.effect_on
        return L1_276
      end,
      up = function()
        local L1_277
        L1_277 = _placement_ctrl
        L1_277.effect_on = not _placement_ctrl.effect_on
      end,
      down = function()
        local L1_278
        L1_278 = _placement_ctrl
        L1_278.effect_on = not _placement_ctrl.effect_on
      end
    },
    {
      name = "Gem",
      get = function()
        local L1_279
        L1_279 = _placement_ctrl
        L1_279 = L1_279.gem_on
        return L1_279
      end,
      up = function()
        local L1_280
        L1_280 = _placement_ctrl
        L1_280.gem_on = not _placement_ctrl.gem_on
      end,
      down = function()
        local L1_281
        L1_281 = _placement_ctrl
        L1_281.gem_on = not _placement_ctrl.gem_on
      end
    },
    {
      name = "AreaReg",
      get = function()
        local L1_282
        L1_282 = _placement_ctrl
        L1_282 = L1_282.area_reg_on
        return L1_282
      end,
      up = function()
        local L1_283
        L1_283 = _placement_ctrl
        L1_283.area_reg_on = not _placement_ctrl.area_reg_on
      end,
      down = function()
        local L1_284
        L1_284 = _placement_ctrl
        L1_284.area_reg_on = not _placement_ctrl.area_reg_on
      end
    },
    {
      name = "GimmickBgWait",
      get = function()
        local L1_285
        L1_285 = _placement_ctrl
        L1_285 = L1_285.gmk_cnt
        return L1_285
      end,
      up = function()
        local L1_286
        L1_286 = _placement_ctrl
        L1_286.gmk_cnt = _placement_ctrl.gmk_cnt + 1
      end,
      down = function()
        local L0_287, L1_288
        L0_287 = _placement_ctrl
        L1_288 = _placement_ctrl
        L1_288 = L1_288.gmk_cnt
        L1_288 = L1_288 - 1
        L0_287.gmk_cnt = L1_288
        L0_287 = _placement_ctrl
        L0_287 = L0_287.gmk_cnt
        if L0_287 <= 0 then
          L0_287 = _placement_ctrl
          L0_287.gmk_cnt = 1
        end
      end
    },
    {
      name = "GrabbedObjWait",
      get = function()
        local L1_289
        L1_289 = _placement_ctrl
        L1_289 = L1_289.grb_cnt
        return L1_289
      end,
      up = function()
        local L1_290
        L1_290 = _placement_ctrl
        L1_290.grb_cnt = _placement_ctrl.grb_cnt + 1
      end,
      down = function()
        local L0_291, L1_292
        L0_291 = _placement_ctrl
        L1_292 = _placement_ctrl
        L1_292 = L1_292.grb_cnt
        L1_292 = L1_292 - 1
        L0_291.grb_cnt = L1_292
        L0_291 = _placement_ctrl
        L0_291 = L0_291.grb_cnt
        if L0_291 <= 0 then
          L0_291 = _placement_ctrl
          L0_291.grb_cnt = 1
        end
      end
    },
    {
      name = "EffectWait",
      get = function()
        local L1_293
        L1_293 = _placement_ctrl
        L1_293 = L1_293.eff_cnt
        return L1_293
      end,
      up = function()
        local L1_294
        L1_294 = _placement_ctrl
        L1_294.eff_cnt = _placement_ctrl.eff_cnt + 1
      end,
      down = function()
        local L0_295, L1_296
        L0_295 = _placement_ctrl
        L1_296 = _placement_ctrl
        L1_296 = L1_296.eff_cnt
        L1_296 = L1_296 - 1
        L0_295.eff_cnt = L1_296
        L0_295 = _placement_ctrl
        L0_295 = L0_295.eff_cnt
        if L0_295 <= 0 then
          L0_295 = _placement_ctrl
          L0_295.eff_cnt = 1
        end
      end
    },
    {
      name = "GemWait",
      get = function()
        local L1_297
        L1_297 = _placement_ctrl
        L1_297 = L1_297.gem_cnt
        return L1_297
      end,
      up = function()
        local L1_298
        L1_298 = _placement_ctrl
        L1_298.gem_cnt = _placement_ctrl.gem_cnt + 1
      end,
      down = function()
        local L0_299, L1_300
        L0_299 = _placement_ctrl
        L1_300 = _placement_ctrl
        L1_300 = L1_300.gem_cnt
        L1_300 = L1_300 - 1
        L0_299.gem_cnt = L1_300
        L0_299 = _placement_ctrl
        L0_299 = L0_299.gem_cnt
        if L0_299 <= 0 then
          L0_299 = _placement_ctrl
          L0_299.gem_cnt = 1
        end
      end
    },
    {
      name = "Area",
      get = function()
        local L1_301
        L1_301 = _placement_ctrl
        L1_301 = L1_301.dbg_disp_area
        return L1_301
      end,
      up = function()
        local L0_302, L1_303
        L0_302 = _placement_ctrl
        L1_303 = _placement_ctrl
        L1_303 = L1_303.dbg_disp_area
        L1_303 = L1_303 + 1
        L0_302.dbg_disp_area = L1_303
        L0_302 = _placement_ctrl
        L0_302 = L0_302.dbg_disp_area
        if L0_302 > 2 then
          L0_302 = _placement_ctrl
          L0_302.dbg_disp_area = 1
        end
      end,
      down = function()
        local L0_304, L1_305
        L0_304 = _placement_ctrl
        L1_305 = _placement_ctrl
        L1_305 = L1_305.dbg_disp_area
        L1_305 = L1_305 - 1
        L0_304.dbg_disp_area = L1_305
        L0_304 = _placement_ctrl
        L0_304 = L0_304.dbg_disp_area
        if L0_304 <= 0 then
          L0_304 = _placement_ctrl
          L0_304.dbg_disp_area = 1
        end
      end
    },
    {
      name = "line2",
      get = function()
        local L1_306
        L1_306 = _placement_ctrl
        L1_306 = L1_306.dbg_line2
        return L1_306
      end,
      up = function()
        local L0_307, L1_308
        L0_307 = _placement_ctrl
        L1_308 = _placement_ctrl
        L1_308 = L1_308.dbg_line2
        L1_308 = L1_308 + 1
        L0_307.dbg_line2 = L1_308
        L0_307 = _placement_ctrl
        L0_307 = L0_307.dbg_line2
        if L0_307 > 500 then
          L0_307 = _placement_ctrl
          L0_307.dbg_line2 = 1
        end
      end,
      down = function()
        local L0_309, L1_310
        L0_309 = _placement_ctrl
        L1_310 = _placement_ctrl
        L1_310 = L1_310.dbg_line2
        L1_310 = L1_310 - 1
        L0_309.dbg_line2 = L1_310
        L0_309 = _placement_ctrl
        L0_309 = L0_309.dbg_line2
        if L0_309 <= 0 then
          L0_309 = _placement_ctrl
          L0_309.dbg_line2 = 500
        end
      end
    }
  }
}
