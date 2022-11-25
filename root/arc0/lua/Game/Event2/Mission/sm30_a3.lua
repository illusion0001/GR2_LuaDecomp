dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm30_common.lua")
STAFF_SHIP_START_PHASE_INDEX_1 = 2
STAFF_SHIP_START_PHASE_INDEX_2 = 5
_scene2_time_limit = {
  0,
  1,
  0,
  0
}
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_staff_car_move_task = nil
_staffShipWork = {}
_scene2_container_hdl_tbl = {}
enmgen2_scene2_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "scene2_enemy_01",
      variation = "man80_aa"
    },
    {
      type = "gorotuki04",
      locator = "locator_02",
      name = "scene2_enemy_01_2",
      variation = "man79_aa",
      hair = true
    }
  }
}
enmgen2_scene2_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "scene2_enemy_02",
      variation = "man80_cc",
      hair = true
    }
  }
}
enmgen2_scene2_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "scene2_enemy_04",
      variation = "man79_dd"
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  L1_1 = {}
  L1_1.name = "sm30_director_01"
  L1_1.type = "man18"
  L1_1.node = "locator2_director_01"
  L1_1.active = false
  L2_2 = {}
  L2_2.name = "sm30_assistant_01"
  L2_2.type = "man17"
  L2_2.node = "locator2_assistant_01"
  L2_2.active = false
  L3_3.name = "sm30_assi_wom_01"
  L3_3.type = "wom01"
  L3_3.node = "locator2_assi_wom_01"
  L3_3.active = false
  L1_1 = Fn_setupNpc
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = 1
  while true do
    L2_2 = findGameObject2
    L6_6 = "%02d"
    L7_7 = L1_1
    L2_2 = L2_2(L3_3, L4_4)
    if L2_2 ~= nil then
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
    else
      break
    end
    L1_1 = L1_1 + 1
  end
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_vctrlOff
  L2_2(L3_3)
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    "bg2_scene2_chair_01",
    "bg2_scene3_chair_01",
    "bg2_scene4_chair_01",
    "bg2_scene5_chair_01"
  }
  L6_6 = "bg2_scene4_parasol_01"
  L7_7 = "bg2_scene1_chair_01"
  for L6_6, L7_7 in L3_3(L4_4) do
    if findGameObject2("GimmickBg", L7_7) ~= nil then
      findGameObject2("GimmickBg", L7_7):setVisiblePermission(false)
      _staff_bg_tbl[L7_7] = findGameObject2("GimmickBg", L7_7)
    end
  end
  if L3_3 ~= nil then
    L4_4(L5_5)
    if L4_4 ~= nil then
      L6_6 = L4_4
      L7_7 = L3_3
      L5_5(L6_6, L7_7)
    end
  end
  L4_4(L5_5)
  L4_4(L5_5)
end
function Ingame()
  Fn_disableCostumeChange(true)
  Fn_userCtrlOff()
  LoadPlayerCommonMotionTable()
  scene2Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _staff_car_move_task ~= nil then
    _staff_car_move_task:abort()
    _staff_car_move_task = nil
  end
  ReleaseShipWork(_staffShipWork)
  Fn_disableCostumeChange(false)
end
function scene2Main()
  local L0_8, L1_9, L2_10, L3_11, L4_12
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10, L3_11)
  L0_8(L1_9, L2_10, L3_11)
  L0_8(L1_9, L2_10, L3_11)
  L0_8()
  L0_8()
  L0_8(L1_9, L2_10)
  for L3_11, L4_12 in L0_8(L1_9) do
    _scene2_container_hdl_tbl[L3_11]:setVisiblePermission(true)
  end
  for L4_12 = 1, 3 do
    findGameObject2("EnemyGenerator", "enmgen2_scene2_" .. string.format("%02d", L4_12)):requestIdlingEnemy(true)
    L0_8[L4_12] = findGameObject2("EnemyGenerator", "enmgen2_scene2_" .. string.format("%02d", L4_12))
  end
  L4_12 = Player
  L4_12 = L4_12.getEnergyMax
  L4_12 = L4_12(L4_12, Player.kEnergy_Life)
  L1_9(L2_10, L3_11, L4_12, L4_12(L4_12, Player.kEnergy_Life))
  L4_12 = "warppoint2_scene2_staff_car_01"
  _staffShipWork = L1_9
  L1_9()
  L1_9(L2_10)
  L3_11.navi = "locator2_navi_scene2_01"
  L3_11.sensor = "pccubesensor2_scene2_01"
  L3_11.marker_kill_enmgen_idx = 1
  L3_11.vctrl = nil
  L4_12 = {}
  L4_12.navi = "locator2_navi_scene2_02"
  L4_12.sensor = "pccubesensor2_scene2_02"
  L4_12.marker_kill_enmgen_idx = nil
  L4_12.vctrl = nil
  function L4_12()
    local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23
    L0_13(L1_14)
    L0_13(L1_14)
    L0_13(L1_14, L2_15)
    L0_13()
    L0_13(L1_14, L2_15)
    L0_13(L1_14)
    L0_13(L1_14, L2_15)
    L0_13(L1_14)
    for L3_16, L4_17 in L0_13(L1_14) do
      L5_18 = L0_8[L3_16]
      L5_18 = L5_18.requestIdlingEnemy
      L5_18(L6_19, L7_20)
    end
    L0_13(L1_14, L2_15)
    _is_out_of_range = false
    L0_13(L1_14)
    for L4_17, L5_18 in L1_14(L2_15) do
      L9_22 = L5_18.navi
      L10_23 = L7_20(L8_21, L9_22)
      L6_19(L7_20, L8_21, L9_22, L10_23, L7_20(L8_21, L9_22))
      _is_in_sensor = false
      L6_19(L7_20)
      if L6_19 ~= nil then
        for L9_22, L10_23 in L6_19(L7_20) do
          Fn_vctrlOn(L10_23)
        end
      end
      if L4_17 == L6_19 then
        _staff_car_move_task = L6_19
      end
      if L4_17 == L6_19 then
        L9_22 = findGameObject2
        L10_23 = "Node"
        L9_22 = L9_22(L10_23, "warppoint2_scene2_staff_car_02")
        L10_23 = L9_22
        L9_22 = L9_22.getWorldPos
        L9_22 = L9_22(L10_23)
        L10_23 = findGameObject2
        L10_23 = L10_23("Node", "warppoint2_scene2_staff_car_03")
        L10_23 = L10_23.getWorldPos
        L10_23 = L10_23(L10_23)
        ;({
          L9_22,
          [3] = L10_23(L10_23)
        })[2] = L10_23
        _staffShipWork = L6_19
        _staff_car_move_task = L6_19
      end
      if L4_17 >= L0_13 then
        while true do
          if L6_19 < 1 then
            if L7_20 == false then
              L9_22 = Player
              L9_22 = L9_22.kEnergy_Life
              if L7_20 == L8_21 then
                if L7_20 > 0 then
                  L7_20()
                  if L7_20 == true then
                    if L7_20 ~= L8_21 then
                    end
                  end
                  while true do
                    else
                      if L6_19 == false then
                        if L6_19 == false then
                          if L6_19 == L7_20 then
                          end
                        end
                      end
                      if L6_19 > 0 then
                        L6_19()
                      end
                    end
                  end
                end
              end
            end
          end
        end
      if L6_19 ~= nil then
        for L9_22, L10_23 in L6_19(L7_20) do
          Fn_vctrlOff(L10_23)
        end
      end
      L6_19(L7_20)
      _is_in_sensor = false
      if L6_19 ~= nil then
        if L6_19 ~= nil then
          L6_19(L7_20, L8_21)
        end
      end
      if L6_19 ~= true then
        if L6_19 == L7_20 then
        end
      end
      if not (L6_19 <= 0) then
        if L4_17 ~= L6_19 then
          L6_19(L7_20)
        end
      end
    end
    L1_14()
    L1_14(L2_15)
    L1_14(L2_15)
    L1_14(L2_15, L3_16)
    if L1_14 ~= true then
    else
      if L1_14 ~= L2_15 then
        L1_14(L2_15)
        return L1_14
    end
    elseif L1_14 <= 0 then
      L1_14(L2_15)
      return L1_14
    end
    _is_out_of_range = false
    return L1_14
  end
  while true do
    if L4_12() == false then
    end
  end
  Fn_setBgmPoint("event", "cut2_end")
  Fn_userCtrlOff()
  PcAppeal()
  Fn_kaiwaDemoView("sm30_00700k")
  Fn_blackout()
  for _FORV_8_, _FORV_9_ in ipairs(_scene2_container_hdl_tbl) do
    _scene2_container_hdl_tbl[_FORV_8_]:setVisiblePermission(false)
  end
  _scene2_container_hdl_tbl = {}
  for _FORV_8_, _FORV_9_ in ipairs(L0_8) do
    L0_8[_FORV_8_]:requestAllEnemyKill()
  end
  _staff_bg_tbl.bg2_scene2_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene2_chair_01:setVisiblePermission(false)
end
function pccubesensor2_scene2_01_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00109")
end
function pccubesensor2_scene2_01_OnLeave()
  local L0_24, L1_25
  _is_in_sensor = false
end
function pccubesensor2_scene2_02_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00110")
end
function pccubesensor2_scene2_02_OnLeave()
  local L0_26, L1_27
  _is_in_sensor = false
end
function pccubesensor2_scene2_03_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00111")
end
function pccubesensor2_scene2_03_OnLeave()
  local L0_28, L1_29
  _is_in_sensor = false
end
function pccubesensor2_scene2_04_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00112")
end
function pccubesensor2_scene2_04_OnLeave()
  local L0_30, L1_31
  _is_in_sensor = false
end
function pccubesensor2_scene2_05_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00113")
end
function pccubesensor2_scene2_05_OnLeave()
  local L0_32, L1_33
  _is_in_sensor = false
end
function pccubesensor2_scene2_06_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00114")
end
function pccubesensor2_scene2_06_OnLeave()
  local L0_34, L1_35
  _is_in_sensor = false
end
function pccubesensor2_scene2_07_OnEnter()
  local L0_36, L1_37
  _is_in_sensor = true
end
function pccubesensor2_scene2_07_OnLeave()
  local L0_38, L1_39
  _is_in_sensor = false
end
function pccubesensormulti2_scene2_out_01_OnEnter()
  local L0_40, L1_41
  _is_out_of_range = false
end
function pccubesensormulti2_scene2_out_01_OnLeave()
  local L0_42, L1_43
  _is_out_of_range = true
end
