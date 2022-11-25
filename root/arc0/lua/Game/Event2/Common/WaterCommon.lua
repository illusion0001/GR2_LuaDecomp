dofile("/Game/Event2/Table/WaterTable.lua")
import("DeltaTimer")
function _creteWater(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5
  L5_5 = GameDatabase
  L5_5 = L5_5.get
  L5_5 = L5_5(L5_5, ggd.Menu__LockCredit)
  if L5_5 == true then
    return
  end
  L5_5 = createGameObject2
  L5_5 = L5_5("GrabbedObjectGenerator")
  L5_5:setName(A1_1)
  L5_5:setCollisionFileName(A2_2)
  L5_5:setGenertionObjectName("grab_water")
  L5_5:setGenerationObjectIsWater(true)
  L5_5:setEffectName("ef_com_wtr_02", GrabbedObjectGenerator.kEffectPosition_Fixied)
  L5_5:setEffectName("ef_com_wtr_01", GrabbedObjectGenerator.kEffectPosition_Object)
  A0_0:appendChild(L5_5)
  if A3_3 then
    if A4_4 then
      L5_5:setTransform(A3_3, A4_4)
    else
      L5_5:setPos(A3_3)
    end
    L5_5:setForceMove()
  end
  L5_5:try_init()
  L5_5:waitForReadyAsync(function()
    L5_5:try_start()
  end)
end
function createWaterGo()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11
  L0_6 = findGameObject2
  L1_7 = "Area"
  L0_6 = L0_6(L1_7, L2_8)
  if L0_6 then
    L1_7 = _creteWater
    L5_11 = Vector
    L5_11 = L5_11(0, 115.400429687, 15)
    L1_7(L2_8, L3_9, L4_10, L5_11, L5_11(0, 115.400429687, 15))
    L1_7 = {
      L2_8,
      L3_9,
      L4_10,
      L5_11,
      {
        Vector(-55.7057320737, 20.3622117244, -60.046810315),
        XYZRotQuatD(0, 256.578412953, 0)
      },
      {
        Vector(-63.0609676266, 56.4711316267, 33.3190032998),
        XYZRotQuatD(0, -63.7444149462, 0)
      },
      {
        Vector(64.8551263903, 27.7422373792, 66.1823637197),
        XYZRotQuatD(0, 68.1395285437, 0)
      },
      {
        Vector(-4.41978287896, 56.0715135042, -41.1953165508),
        XYZRotQuatD(0, 154.868815077, 0)
      },
      {
        Vector(68.3401369075, 58.9977540255, -42.3660537326),
        XYZRotQuatD(0, 116.255585054, 0)
      },
      {
        Vector(-38.3392439056, 21.9551598314, -69.1210326875),
        XYZRotQuatD(0, 183.344653685, 0)
      },
      {
        Vector(77.0418878254, 54.0025287531, 36.4317925193),
        XYZRotQuatD(0, 81.7330271751, 0)
      },
      {
        Vector(17.7184130706, 24.5251270951, 85.5309476116),
        XYZRotQuatD(0, -9.92588262565, 0)
      }
    }
    L5_11 = 18.644525479
    L5_11 = 0
    L5_11 = L4_10(L5_11, -82.7681834791, 0)
    ;({
      L3_9,
      [4] = L4_10(L5_11, -82.7681834791, 0)
    })[2] = L4_10
    ;({
      L3_9,
      [4] = L4_10(L5_11, -82.7681834791, 0)
    })[3] = L5_11
    L5_11 = 70.6014550193
    L5_11 = XYZRotQuatD
    L5_11 = L5_11(0, 88.9036789923, 0)
    ;({
      L4_10,
      [3] = L5_11(0, 88.9036789923, 0)
    })[2] = L5_11
    L5_11 = Vector
    L5_11 = L5_11(26.4751798864, 58.4405061227, 84.6351554758)
    L5_11 = {
      Vector(-16.4885977535, 25.3012207326, 79.7994222337),
      XYZRotQuatD(0, -22.5666182391, 0)
    }
    for L5_11 = 1, 12 do
      _creteWater(L0_6, "gog_go_waterway_a_water_0" .. L5_11, "go_waterway_a_water", L1_7[L5_11][1], L1_7[L5_11][2])
    end
  end
end
function createWaterUp()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17
  L0_12 = nil
  L0_12 = L1_13
  if L0_12 then
    L5_17 = Vector
    L5_17 = L5_17(11.4930932052, 51.205431297, -6.77615471086)
    L1_13(L2_14, L3_15, L4_16, L5_17, L5_17(11.4930932052, 51.205431297, -6.77615471086))
    L5_17 = Vector
    L5_17 = L5_17(-42.4120847127, 49.4464688616, 5.74313775443)
    L1_13(L2_14, L3_15, L4_16, L5_17, L5_17(-42.4120847127, 49.4464688616, 5.74313775443))
  end
  for L4_16 = 1, 2 do
    L5_17 = findGameObject2
    L5_17 = L5_17("Area", "up_a_02_0" .. L4_16)
    L0_12 = L5_17
    if L0_12 then
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_02_water_01_0" .. L4_16, "up_a_02_water_01")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_02_water_02_0" .. L4_16, "up_a_02_water_02")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_02_water_03_0" .. L4_16, "up_a_02_water_03")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_02_water_04_0" .. L4_16, "up_a_02_water_04")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_02_water_05_0" .. L4_16, "up_a_02_water_05")
    end
  end
  for L4_16 = 1, 3 do
    L5_17 = findGameObject2
    L5_17 = L5_17("Area", "up_a_04_0" .. L4_16)
    L0_12 = L5_17
    if L0_12 then
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_04_water_01_0" .. L4_16, "up_a_04_water_01")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_04_water_02_0" .. L4_16, "up_a_04_water_02")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_up_a_04_water_03_0" .. L4_16, "up_a_04_water_03")
      L5_17 = _creteWater
      L5_17(L0_12, "gog_04_garden_sk_10_0" .. L4_16, "garden_sk_10_water", Vector(33.3319379875, 32.3243927256, 0))
      L5_17 = _creteWater
      L5_17(L0_12, "gog_04_garden_sk_08_0" .. L4_16, "garden_sk_08_water", Vector(-34.0321952964, 21.9094149787, 66.0746514336))
    end
  end
  L0_12 = L1_13
  if L0_12 then
    L5_17 = Vector
    L5_17 = L5_17(-31.6973206659, 43.2783909764, -7.67497982498)
    L1_13(L2_14, L3_15, L4_16, L5_17, XYZRotQuatD(0, -97.8104957477, 0))
    L5_17 = Vector
    L5_17 = L5_17(0.33202253689, 42.6733452477, -18.3820039668)
    L1_13(L2_14, L3_15, L4_16, L5_17, L5_17(0.33202253689, 42.6733452477, -18.3820039668))
  end
  L0_12 = L1_13
  if L0_12 then
    L1_13(L2_14, L3_15, L4_16)
  end
  L0_12 = L1_13
  if L0_12 then
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L5_17 = 28.2833422431
    L5_17 = 8.36018008908
    L5_17 = 27.2055052607
    L5_17 = L4_16(L5_17, 31.855071108, -79.4310232141)
    ;({
      L2_14,
      L3_15,
      [5] = L4_16(L5_17, 31.855071108, -79.4310232141)
    })[3] = L4_16
    ;({
      L2_14,
      L3_15,
      [5] = L4_16(L5_17, 31.855071108, -79.4310232141)
    })[4] = L5_17
    for L5_17 = 1, 3 do
      _creteWater(L0_12, "gog_garden_sk_08_0" .. L5_17, "garden_sk_08_water", L1_13[L5_17])
    end
  end
  L0_12 = L1_13
  if L0_12 then
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
  end
  L0_12 = L1_13
  if L0_12 then
    L1_13(L2_14, L3_15, L4_16)
    L1_13(L2_14, L3_15, L4_16)
  end
end
function createWaterPo()
  local L0_18
  L0_18 = nil
  L0_18 = findGameObject2("Area", "po_a_02")
  if L0_18 then
    _creteWater(L0_18, "gog_fountain_kw_01_water", "fountain_kw_01_water", Vector(1.50885943917, 41.1796755138, -8.93668677245))
  end
  L0_18 = findGameObject2("Area", "po_a_03")
  if L0_18 then
    _creteWater(L0_18, "gog_fountain_oc_01_water", "fountain_oc_01_water", Vector(30, 34.1752491901, -1.14930287509E-14))
  end
end
function createWaterMi()
  local L0_19
  L0_19 = nil
  L0_19 = findGameObject2("Area", "mi_a_02")
  if L0_19 then
    _creteWater(L0_19, "gog_mi_a_02_water_01", "mi_a_02_water_01")
    _creteWater(L0_19, "gog_mi_a_02_water_02", "mi_a_02_water_02")
  end
  L0_19 = findGameObject2("Area", "mi_a_04")
  if L0_19 then
    _creteWater(L0_19, "gog_mi_statue_kw_03_water", "mi_statue_kw_03_water", Vector(-72.1574001123, 0.187574584011, 19.8069008936), XYZRotQuatD(0, -90, 0))
  end
end
function createWaterLo()
  local L0_20
  L0_20 = findGameObject2
  L0_20 = L0_20("Area", "lo_a_02")
  if L0_20 then
    _creteWater(L0_20, "gog_bowl_fl_01_water", "bowl_fl_01_water", Vector(-4.72375462482, 18.3474900078, -0.0208548240036), XYZRotQuatD(0, 0, 0))
    _creteWater(L0_20, "gog_bowl_fl_02_water_01", "bowl_fl_02_water", Vector(11.5002998747, 11.4701084556, -1.97634554898), XYZRotQuatD(1.53235533303, -4.75965861224, 2.42168376314))
    _creteWater(L0_20, "gog_bowl_fl_02_water_02", "bowl_fl_02_water", Vector(-10.2565893647, 21.0003619977, -6.97760329033), XYZRotQuatD(0, 0, 0))
    _creteWater(L0_20, "gog_bowl_fl_02_water_03", "bowl_fl_02_water", Vector(3.99521841188, 18.5354818092, -1.00502228016), XYZRotQuatD(-2, 3.25347121618, -2))
    _creteWater(L0_20, "gog_bowl_fl_02_water_04", "bowl_fl_02_water", Vector(-0.132696252703, 18.858500971, -7.32308386634), XYZRotQuatD(-2, 2.73799851022, -2))
    _creteWater(L0_20, "gog_bowl_fl_02_water_05", "bowl_fl_02_water", Vector(7.48492425527, 14.624970715, 8.05684484113), XYZRotQuatD(-2, 2.76312274824, 0.508598080387))
    _creteWater(L0_20, "gog_bowl_fl_02_water_06", "bowl_fl_02_water", Vector(2.85794864916, 18.0989145633, 4.49768073646), XYZRotQuatD(2, -2.87784440425, -2))
    _creteWater(L0_20, "gog_bowl_fl_02_water_07", "bowl_fl_02_water", Vector(-1.76888682198, 19.2374530012, 8.34113703672), XYZRotQuatD(-2, 1.86859601618, -0.043689639657))
    _creteWater(L0_20, "gog_bowl_fl_02_water_08", "bowl_fl_02_water", Vector(-8.47347950872, 21.2832103768, 7.19891353974), XYZRotQuatD(2, -85.3939983517, -2))
    _creteWater(L0_20, "gog_bowl_fl_02_water_09", "bowl_fl_02_water", Vector(-13.3867408991, 19.9683815661, 1.25521609457), XYZRotQuatD(0, 259.169001432, 2))
    _creteWater(L0_20, "gog_pool_fl_01_water", "pool_fl_01_water", Vector(7.092392317, 4.94038053801, -7.5770920247), XYZRotQuatD(0, -45.0543205716, 0))
    _creteWater(L0_20, "gog_pool_fl_02_water", "pool_fl_02_water", Vector(3.36482626793, 4.28594829111, 9.12115438201), XYZRotQuatD(0, -70.9344190691, 0))
  end
end
function createWaterCc()
  local L0_21
  L0_21 = nil
  L0_21 = findGameObject2("Area", "g1_base_cc_b1_road_07")
  if L0_21 then
    _creteWater(L0_21, "gog_g1_fountain_sk_01_water", "g1_fountain_sk_01_water", Vector(-3.41597787359, -2.01860351563, -7.06620708574))
  end
  L0_21 = findGameObject2("AreaRegularBg", "g1_base_cc_sign")
  if L0_21 then
    _creteWater(L0_21, "gog_g1_fountain_sk_01_water", "g1_monument_sn_01_water", Vector(96.0955861045, 50.6938329061, 0.907612717343))
  end
  L0_21 = findGameObject2("AreaRegularBg", "g1_base_cc_sign_af")
  if L0_21 then
    _creteWater(L0_21, "gog_g1_monument_sn_01_typeb_water", "g1_monument_sn_01_water", Vector(96.0955861045, 50.6938329061, 0.907612717343))
  end
end
function createWaterDt()
  local L0_22, L1_23
end
function createWaterEd()
  local L0_24
  L0_24 = findGameObject2
  L0_24 = L0_24("Area", "g1_base_ed_f1_c_road")
  if L0_24 then
    _creteWater(L0_24, "gog_g1_monument_sn_01_typeb_water", "g1_monument_sn_01_water", Vector(2.06758789063, 2.71506347656, -30.28875))
  end
end
function createWaterWa()
  local L0_25
  L0_25 = findGameObject2
  L0_25 = L0_25("Area", "wa_a_01")
  if L0_25 then
    _creteWater(L0_25, "gog_wa_a_01_water", "wa_a_01_water", Vector(-23.1513892599, 23.900137589, 25.2126182149))
  end
end
function pollingWater()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48
  L0_26 = nil
  L1_27 = {}
  L2_28 = {}
  L3_29 = 0
  function L4_30(A0_49, A1_50, A2_51)
    local L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62, L14_63, L15_64
    L3_52 = {}
    for L7_56, L8_57 in L4_53(L5_54) do
      L9_58 = {}
      L10_59 = {}
      for L14_63 = 1, L8_57 do
        L15_64 = A1_50
        L15_64 = L15_64 .. "_" .. L7_56 .. "_" .. string.format("%02d", L14_63)
        table.insert(L9_58, L15_64)
        table.insert(L10_59, {
          hdl = false,
          name = L15_64,
          eff_name = L7_56,
          play = false
        })
        L3_29 = L3_29 + 1
      end
      if L11_60 > 0 then
        L14_63 = L9_58
        L11_60(L12_61, L13_62, L14_63)
        if L11_60 == nil then
          L3_52[L7_56] = L11_60
        end
        for L14_63, L15_64 in L11_60(L12_61) do
          table.insert(L3_52[L7_56], L15_64)
        end
      end
    end
    return L3_52
  end
  function L5_31(A0_65, A1_66, A2_67, A3_68)
    local L4_69, L5_70
    if A3_68 == nil then
      L4_69 = nil
      return L4_69
    end
    L4_69 = nil
    L5_70 = A0_65.getName
    L5_70 = L5_70(A0_65)
    if L5_70 == A1_66 then
      L4_69 = A0_65
    else
      L5_70 = A0_65.findSubArea
      L5_70 = L5_70(A0_65, A1_66)
      L4_69 = L5_70
    end
    if L4_69 then
      L5_70 = A2_67
      if string.find(L5_70, "g1_base_") ~= nil and string.find(L5_70, "g1_base_") ~= nil then
        L5_70 = string.sub(L5_70, string.find(L5_70, "g1_base_") + 1, #L5_70)
      end
      if L4_30(L4_69, L5_70, A3_68) then
        return {
          name = A1_66,
          hdl = L4_69,
          param = L4_30(L4_69, L5_70, A3_68)
        }
      end
    end
    L5_70 = nil
    return L5_70
  end
  L0_26 = L6_32
  L6_32(L7_33)
  L6_32(L7_33)
  for L9_35, L10_36 in L6_32(L7_33) do
    L11_37 = nil
    for L15_41, L16_42 in L12_38(L13_39) do
      L11_37 = L17_43
      if not L11_37 then
      end
    end
    if L11_37 then
      for L15_41, L16_42 in L12_38(L13_39) do
        if L17_43 then
          for L20_46, L21_47 in L17_43(L18_44) do
            L22_48 = L5_31
            L22_48 = L22_48(L11_37, L15_41 .. L21_47, L15_41, L16_42.effect)
            if L22_48 then
              table.insert(L2_28, L22_48)
            end
          end
        else
          L21_47 = L16_42.effect
          if L17_43 then
            L18_44(L19_45, L20_46)
          end
        end
        L17_43()
      end
    end
  end
  L6_32(L7_33)
  L6_32(L7_33)
  L6_32(L7_33)
  L6_32(L7_33)
  L0_26 = nil
  while true do
    for L10_36, L11_37 in L7_33(L8_34) do
      for L15_41, L16_42 in L12_38(L13_39) do
        if L17_43 ~= nil then
          for L21_47, L22_48 in L18_44(L19_45) do
            if L22_48 < 0 then
              L22_48 = L22_48 * -1
            end
            if L16_42[L21_47].hdl then
              if L22_48 > 250 and L16_42[L21_47].hdl and L16_42[L21_47].hdl:isRunning() then
                for _FORV_27_ = 1, 0, -0.1 do
                  L16_42[L21_47].hdl:setAlpha(1 - _FORV_27_ / 10)
                  wait()
                end
                _FOR_:try_term()
                L16_42[L21_47].hdl = nil
                print(" |  water  | " .. L16_42[L21_47].name .. "\227\130\146\231\160\180\230\163\132\227\129\151\227\129\190\227\129\151\227\129\159")
              end
            elseif L11_37.hdl:isEffectiveness() == false then
              if L16_42[L21_47].hdl and L16_42[L21_47].hdl:isRunning() then
                for _FORV_27_ = 1, 0, -0.1 do
                  L16_42[L21_47].hdl:setAlpha(1 - _FORV_27_ / 10)
                  wait()
                end
                _FOR_:try_term()
                L16_42[L21_47].hdl = nil
                print(" |  water  | " .. L16_42[L21_47].name .. "\227\130\146\231\160\180\230\163\132\227\129\151\227\129\190\227\129\151\227\129\159")
              end
            elseif L22_48 < 200 then
              L16_42[L21_47].hdl = createEffect(L11_37.hdl, L16_42[L21_47].name, L16_42[L21_47].eff_name, L16_42[L21_47].name)
              L16_42[L21_47].hdl:try_init()
              L16_42[L21_47].hdl:waitForReadyAsync(function(A0_71)
                A0_71:try_start()
                A0_71:play()
                A0_71:setLoop(true)
              end)
              print(" |  water  | " .. L16_42[L21_47].name .. "\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159")
            end
            if L6_32 >= 30 then
              wait()
            end
          end
        end
      end
    end
    L7_33()
    L7_33()
  end
end
function pollingConainer(A0_72)
  local L1_73, L2_74
  L1_73 = {}
  L2_74 = {}
  L2_74.bridge_kw_01 = {
    container_kk_01 = {
      "container_kk_01_01"
    },
    container_kk_02 = {
      "container_kk_02_01",
      "container_kk_02_02"
    },
    container_kk_03 = {
      "container_kk_03_01",
      "container_kk_03_02"
    },
    container_ms_04 = {
      "container_ms_04_01"
    }
  }
  L2_74.bridge_kw_02 = {
    container_kk_01 = {
      "container_kk_01_01"
    },
    container_kk_02 = {
      "container_kk_02_01"
    },
    container_kk_03 = {
      "container_kk_03_01"
    },
    container_kk_05 = {
      "container_kk_05_01"
    },
    container_ms_03 = {
      "container_ms_03_01"
    },
    container_ms_04 = {
      "container_ms_04_01"
    }
  }
  L2_74.po_a_04a = {
    container_ms_04 = {
      "container_ms_04_01",
      "container_ms_04_02"
    },
    container_kk_01 = {
      "container_kk_01_07",
      "container_kk_01_09",
      "container_kk_01_010",
      "container_kk_01_011"
    },
    container_kk_02 = {
      "container_kk_02_09",
      "container_kk_02_013",
      "container_kk_02_016",
      "container_kk_02_017"
    },
    container_kk_03 = {
      "container_kk_03_05",
      "container_kk_03_06",
      "container_kk_03_08"
    },
    container_kk_05 = {
      "container_kk_05_01",
      "container_kk_05_02"
    }
  }
  L2_74.po_a_04c = {
    container_kk_01 = {
      "container_kk_01_01",
      "container_kk_01_02"
    },
    container_kk_02 = {
      "container_kk_02_01",
      "container_kk_02_02"
    },
    container_kk_03 = {
      "container_kk_03_01",
      "container_kk_03_02"
    }
  }
  L1_73.po_a_04 = L2_74
  L2_74 = {}
  L2_74.po_a_15 = {
    container_kk_02 = {
      "container_kk_02_01",
      "container_kk_02_02"
    },
    container_ms_03 = {
      "container_ms_03_06",
      "container_ms_03_05",
      "container_ms_03_04",
      "container_ms_03_03",
      "container_ms_03_02",
      "container_ms_03_01"
    },
    container_ms_04 = {
      "container_ms_04_11",
      "container_ms_04_10",
      "container_ms_04_09",
      "container_ms_04_08",
      "container_ms_04_07",
      "container_ms_04_06",
      "container_ms_04_05",
      "container_ms_04_04",
      "container_ms_04_03",
      "container_ms_04_02",
      "container_ms_04_01"
    }
  }
  L1_73.po_a_15 = L2_74
  L2_74 = {}
  L2_74.po_a_01a = {
    gate_md_01 = {
      "gate_md_01_01"
    }
  }
  L1_73.po_a_01 = L2_74
  L2_74 = {}
  invokeTask(function()
    local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89, L15_90, L16_91, L17_92, L18_93, L19_94, L20_95, L21_96, L22_97, L23_98, L24_99
    for L3_78, L4_79 in L0_75(L1_76) do
      L6_81.hdl = L5_80
      L6_81.active = false
      L6_81.objs = L7_82
      L6_81.sub = L7_82
      L2_74[L3_78] = L6_81
      for L9_84, L10_85 in L6_81(L7_82) do
        L11_86 = A0_72
        L12_87 = L11_86
        L11_86 = L11_86.findSubArea
        L13_88 = L9_84
        L11_86 = L11_86(L12_87, L13_88)
        L12_87 = L2_74[L3_78]
        L12_87 = L12_87.sub
        L12_87[L9_84] = L11_86
      end
    end
    while true do
      for L6_81, L7_82 in L3_78(L4_79) do
        L11_86 = L8_83
        if L10_85 then
          if L9_84 > 650 then
            L7_82.active = false
          end
        elseif L9_84 < 600 then
          L7_82.active = true
        end
      end
      for L6_81, L7_82 in L3_78(L4_79) do
        if L8_83 then
          if L8_83 == 0 then
            for L11_86, L12_87 in L8_83(L9_84) do
              L13_88 = L7_82.sub
              L13_88 = L13_88[L11_86]
              if L13_88 then
                for L17_92, L18_93 in L14_89(L15_90) do
                  for L22_97, L23_98 in L19_94(L20_95) do
                    L24_99 = createContainer
                    L24_99 = L24_99(L13_88, L17_92 .. "_" .. string.format("%02d", L22_97), L17_92, L23_98)
                    table.insert(L7_82.objs, L24_99)
                  end
                end
              end
            end
          end
        elseif L8_83 > 0 then
          for L11_86, L12_87 in L8_83(L9_84) do
            L13_88 = L12_87.try_term
            L13_88(L14_89)
          end
          L7_82.objs = L8_83
        end
      end
      if L1_76 then
        L3_78()
        L3_78()
        L3_78()
      end
      L3_78(L4_79)
    end
  end)
end
function createContainer(A0_100, A1_101, A2_102, A3_103)
  local L4_104
  L4_104 = createGameObject2
  L4_104 = L4_104("GimmickBg")
  L4_104:setName(A1_101)
  L4_104:setDrawModelName(A2_102)
  L4_104:setAttributeName(A2_102)
  L4_104:setCollisionName(A2_102)
  A0_100:appendChild(L4_104)
  L4_104:setTransform(A0_100:getNodeLocalPosRot(A3_103))
  return L4_104
end
function createAreaRegularBg(A0_105)
  createGameObject2("AreaRegularBg"):setName(A0_105)
  createGameObject2("AreaRegularBg"):setModelName(A0_105)
  createGameObject2("AreaRegularBg"):setEventRange(200)
  createGameObject2("AreaRegularBg"):setVisible(false)
  createGameObject2("AreaRegularBg"):setActive(false)
  return (createGameObject2("AreaRegularBg"))
end
function appendAreaRegularBg(A0_106, A1_107, A2_108, A3_109)
  local L4_110
  if A0_106 then
    L4_110 = nil
    if type(A1_107) == "string" then
      L4_110 = findGameObject2("Area", A1_107)
    else
      L4_110 = A1_107
    end
    L4_110:appendChild(A0_106)
    A0_106:setTransform(L4_110:getNodeLocalPosRot(A2_108))
    if A3_109 ~= false then
      invokeTask(function()
        while A0_106:isLoading() do
          wait()
        end
        A0_106:setActive(true)
        A0_106:setVisible(true)
      end)
    end
  end
end
function createEffect(A0_111, A1_112, A2_113, A3_114)
  local L4_115
  L4_115 = createGameObject2
  L4_115 = L4_115("Effect")
  L4_115:setName(A1_112)
  L4_115:setModelName(A2_113)
  A0_111:appendChild(L4_115)
  L4_115:setTransform(A0_111:getNodeLocalPosRot(A3_114))
  return L4_115
end
