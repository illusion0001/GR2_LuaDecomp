import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
next_phase = false
_crate_cnt = 0
_count_flag = false
_vogo_crate = {}
_enemy_near = false
_jupiter_out = false
_vogo_task = nil
enmgen2_a = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_a_01",
      name = "ene_a_01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_a_02",
      name = "ene_a_02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_a_03",
      name = "ene_a_03"
    },
    {
      type = "imp",
      locator = "locator_ene_a_04",
      name = "ene_a_04"
    },
    {
      type = "imp",
      locator = "locator_ene_a_05",
      name = "ene_a_05"
    },
    {
      type = "imp",
      locator = "locator_ene_a_06",
      name = "ene_a_06"
    },
    {
      type = "imp",
      locator = "locator_ene_a_07",
      name = "ene_a_07"
    }
  }
}
enmgen2_b = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_01",
      name = "ene_b_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_02",
      name = "ene_b_02"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_03",
      name = "ene_b_03"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_04",
      name = "ene_b_04"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_05",
      name = "ene_b_05"
    }
  }
}
enmgen2_ep90_d_e = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_01",
      name = "ene_c_01"
    },
    {
      type = "runner",
      locator = "locator_02",
      name = "ene_c_02"
    },
    {
      type = "runner",
      locator = "locator_03",
      name = "ene_c_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "ene_c_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "ene_c_05"
    },
    {
      type = "gellyfish",
      locator = "locator_06",
      name = "ene_c_06"
    },
    {
      type = "gellyfish",
      locator = "locator_07",
      name = "ene_c_07"
    },
    {
      type = "imp",
      locator = "locator_08",
      name = "ene_c_08"
    },
    {
      type = "imp",
      locator = "locator_09",
      name = "ene_c_09"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = {
    "evarea2_po_a_04_crate_after",
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_haze",
    "evarea2_po_a_04_common",
    "evarea2_po_a_15_gem_vital",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_vogo_escape",
    "evarea2_po_a_04_ep90_d_e"
  }
  Fn_loadEventData("evx/ep90_common", L0_0)
  Fn_loadEventData("evx/ep90_common", {
    "evarea2_po_a_02_common"
  }, true)
  Fn_pcSensorOff("pccubesensor2_navi")
  Fn_pcSensorOff("pccubesensor2_enemy")
  Fn_pcSensorOff("pccubesensor2_jupiter_in")
  Fn_pcSensorOff("pccubesensor2_jupiter_out")
  Fn_loadEventData("evx/ep90", {
    "evarea2_po_a_04"
  }, true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Fn_warpNpc
  L0_1(L1_2, L2_3)
  L0_1 = vogo_crate_append_mnavi
  L0_1()
  L0_1 = create_haze
  L0_1 = L0_1()
  for L4_5, L5_6 in L1_2(L2_3) do
    L8_9 = true
    L6_7(L7_8, L8_9)
  end
  L4_5 = "enmgen2_b"
  L4_5 = "EnemyGenerator"
  L4_5 = Fn_missionStart
  L4_5()
  L4_5 = 0
  while true do
    if L4_5 == 0 then
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7, L7_8)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6()
      L5_6(L6_7)
      _vogo_task = L5_6
      L5_6(L6_7)
      L5_6(L6_7, L7_8)
      L5_6(L6_7, L7_8)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7, L7_8)
      L5_6(L6_7)
      while true do
        if L5_6 > 0 then
          L5_6()
        end
      end
      L5_6(L6_7)
      L5_6()
      L4_5 = 1
    elseif L4_5 == 1 then
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6()
      if L5_6 > 0 then
        L5_6(L6_7)
        L5_6(L6_7)
        L5_6(L6_7)
        L5_6(L6_7, L7_8)
      else
        L5_6(L6_7)
        L5_6(L6_7)
      end
      L5_6(L6_7, L7_8)
      L5_6(L6_7)
      L8_9 = "warppoint2_pc_jupiter"
      L9_10 = L6_7(L7_8, L8_9)
      L5_6(L6_7, L7_8, L8_9, L9_10, L6_7(L7_8, L8_9))
      while true do
        if L7_8 == false then
          if L6_7 > 0 then
          else
            if L7_8 > 0 then
              L8_9 = "ep90_00830"
              L7_8(L8_9)
            else
              L8_9 = "ep90_00832"
              L7_8(L8_9)
            end
            L8_9 = 2
            L7_8(L8_9)
          end
          L8_9 = 0.1
          L7_8(L8_9)
        end
      end
      L8_9 = L7_8
      L9_10 = true
      L7_8(L8_9, L9_10)
      L8_9 = L7_8
      L9_10 = false
      L7_8(L8_9, L9_10)
      L8_9 = {
        L9_10,
        Player.kAbility_SwitchToMars
      }
      L9_10 = Player
      L9_10 = L9_10.kAbility_AttrTuneSwitch
      L7_8(L8_9)
      L7_8()
      L8_9 = L0_1[1]
      L9_10 = 1
      L7_8(L8_9, L9_10)
      L8_9 = 0.5
      L7_8(L8_9)
      L8_9 = L7_8
      L9_10 = "ep90_info_02"
      L7_8(L8_9, L9_10, true, 15)
      L8_9 = L7_8
      L9_10 = {
        Player.kAbility_AttrTuneSwitch,
        Player.kAbility_SwitchToJupiter
      }
      L7_8(L8_9, L9_10, true)
      L8_9 = "jupiter"
      L7_8(L8_9)
      repeat
        L7_8()
      until L7_8
      while true do
        _jupiter_out = false
        L8_9 = Fn_pcSensorOn
        L9_10 = "pccubesensor2_jupiter_out"
        L8_9(L9_10)
        L8_9 = Fn_userCtrlOn
        L8_9()
        L8_9 = Player
        L9_10 = L8_9
        L8_9 = L8_9.setAbility
        L8_9(L9_10, {
          Player.kAbility_AttrTuneSwitch
        }, false)
        L8_9 = _crate_cnt
        if L8_9 > 0 then
          L8_9 = Fn_missionView
          L9_10 = "ep90_00840"
          L8_9(L9_10)
          L8_9 = HUD
          L9_10 = L8_9
          L8_9 = L8_9.counter99_99SetTextID
          L8_9(L9_10, "ep90_00803")
          L8_9 = HUD
          L9_10 = L8_9
          L8_9 = L8_9.counter99_99SetMax
          L8_9(L9_10, _crate_cnt)
          L8_9 = HUD
          L9_10 = L8_9
          L8_9 = L8_9.counter99_99SetNum
          L8_9(L9_10, 0)
          L8_9 = HUD
          L9_10 = L8_9
          L8_9 = L8_9.counter99_99SetVisible
          L8_9(L9_10, true)
          _count_flag = true
        else
          L8_9 = Fn_missionView
          L9_10 = "ep90_00842"
          L8_9(L9_10)
        end
        while true do
          L8_9 = _jupiter_out
          if L8_9 == false then
            L8_9 = wait
            L8_9()
          end
        end
        L8_9 = Player
        L9_10 = L8_9
        L8_9 = L8_9.getGravityKickChargeLv
        L8_9 = L8_9(L9_10)
        if L8_9 < 100 then
          L8_9 = Player
          L9_10 = L8_9
          L8_9 = L8_9.setStay
          L8_9(L9_10, true)
          L8_9 = Player
          L9_10 = L8_9
          L8_9 = L8_9.setStay
          L8_9(L9_10, false)
          L8_9 = Fn_userCtrlOff
          L8_9()
          L8_9 = Fn_blackout
          L8_9()
          L8_9 = HUD
          L9_10 = L8_9
          L8_9 = L8_9.counter99_99SetVisible
          L8_9(L9_10, false)
          L8_9 = Fn_resetPcPos
          L9_10 = "warppoint2_pc_jupiter"
          L8_9(L9_10, Player.kReset_Floating)
          L8_9 = Fn_fadein
          L8_9()
          L8_9 = Fn_lookAtObject
          L9_10 = L0_1[1]
          L8_9 = L8_9(L9_10, 2)
          while true do
            L9_10 = Fn_isInSightTarget
            L9_10 = L9_10(L0_1[1], 0.2)
            if L9_10 == false then
              L9_10 = wait
              L9_10()
            end
          end
          if L8_9 ~= nil then
            L9_10 = L8_9.isRunning
            L9_10 = L9_10(L8_9)
            if L9_10 == true then
              L9_10 = L8_9.abort
              L9_10(L8_9)
            end
          end
          L8_9 = nil
          L9_10 = HUD
          L9_10 = L9_10.info
          L9_10(L9_10, "ep90_info_02", false)
        else
          break
        end
      end
      L8_9 = Fn_pcSensorOff
      L9_10 = "pccubesensor2_jupiter_out"
      L8_9(L9_10)
      L8_9 = _crate_cnt
      if L8_9 > 0 then
        while true do
          L8_9 = _crate_cnt
          if L8_9 > 0 then
            L8_9 = wait
            L8_9()
          end
        end
        L8_9 = HUD
        L9_10 = L8_9
        L8_9 = L8_9.counter99_99SetVisible
        L8_9(L9_10, false)
      while true do
        else
          L9_10 = L2_3
          L8_9 = L2_3.getEnemyCount
          L8_9 = L8_9(L9_10)
          if L8_9 > 0 then
            L8_9 = wait
            L8_9()
          end
        end
      end
      L8_9 = Fn_tutorialCaptionKill
      L8_9()
      L4_5 = 2
    elseif L4_5 == 2 then
      L5_6(L6_7)
      L8_9 = Player
      L8_9 = L8_9.kAbility_SwitchToMars
      L9_10 = Player
      L9_10 = L9_10.kAbility_SwitchToJupiter
      L5_6(L6_7)
      L5_6(L6_7, L7_8)
      for L8_9, L9_10 in L5_6(L6_7) do
        invokeTask(function()
          Fn_setAlpha(L9_10, false, 3, 10)
          L9_10:setVisible(false)
        end)
        break
      end
      L5_6(L6_7)
      if L5_6 > 0 then
        L5_6(L6_7)
        while true do
          if L5_6 > 0 then
            L5_6()
          end
        end
      end
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      if L5_6 == false then
        L5_6(L6_7)
        L8_9 = Player
        L8_9 = L8_9.kAbility_AttrTuneSwitch
        L8_9 = true
        L5_6(L6_7, L7_8, L8_9)
        L8_9 = Player
        L8_9 = L8_9.kAbility_SwitchToMars
        L9_10 = Player
        L9_10 = L9_10.kAbility_SwitchToJupiter
        L8_9 = false
        L5_6(L6_7, L7_8, L8_9)
        L5_6(L6_7)
        repeat
          L5_6()
        until L5_6
        L5_6()
      end
      L5_6(L6_7)
      L5_6(L6_7, L7_8)
      for L8_9, L9_10 in L5_6(L6_7) do
        invokeTask(function()
          L9_10:setVisible(true)
          Fn_setAlpha(L9_10, true, 3, 10)
        end)
        break
      end
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      L5_6(L6_7)
      break
    end
  end
  L5_6()
  if L5_6 ~= nil then
    if L5_6 == true then
      L5_6(L6_7)
    end
  end
  _vogo_task = nil
  L5_6()
  L5_6()
  L5_6()
  L5_6()
end
function Finalize()
  _vogo_crate = nil
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  Mob:makeSituationPanic(false)
end
function waitPhace()
  while not next_phase do
    wait()
  end
  next_phase = false
end
function pccubesensor2_navi_OnEnter(A0_11)
  next_phase = true
  Fn_naviKill()
  A0_11:setActive(false)
end
function pccubesensor2_enemy_OnEnter(A0_12)
  A0_12:setActive(false)
  _enemy_near = true
end
function pccubesensor2_jupiter_OnLeave(A0_13)
  local L1_14
  _jupiter_out = true
end
function vogo_crate_append_mnavi()
  local L0_15, L1_16, L2_17, L3_18
  L0_15 = 1
  while true do
    L1_16 = "bg2_crate_after_"
    L2_17 = string
    L2_17 = L2_17.format
    L3_18 = "%02d"
    L2_17 = L2_17(L3_18, L0_15)
    L1_16 = L1_16 .. L2_17
    L2_17 = findGameObject2
    L3_18 = "Node"
    L2_17 = L2_17(L3_18, L1_16)
    if L2_17 ~= nil then
      L3_18 = _crate_cnt
      L3_18 = L3_18 + 1
      _crate_cnt = L3_18
      L3_18 = _vogo_crate
      L3_18[L1_16] = {
        node_hdl = nil,
        navi_hdl = nil,
        broken = false
      }
      L3_18 = L2_17.setEventListener
      L3_18(L2_17, "broken", function(A0_19)
        _vogo_crate[A0_19:getName()].broken = true
        if _vogo_crate[A0_19:getName()].navi_hdl ~= nil then
          _vogo_crate[A0_19:getName()].navi_hdl:setActive(false)
          _vogo_crate[A0_19:getName()].navi_hdl:del()
          _vogo_crate[A0_19:getName()].navi_hdl = nil
        end
        _crate_cnt = _crate_cnt - 1
        if _count_flag == true then
          HUD:counter99_99AddNum()
        end
      end)
      L3_18 = create_append_nodo
      L3_18 = L3_18("vogo_crate_navi_" .. string.format("%02d", L0_15), L2_17, Vector(0, 0.25, 0))
      _vogo_crate[L1_16].node_hdl = L3_18
      L2_17:setEventListener("dynamic", function(A0_20)
        A0_20:getDynamicObject():appendChild(L3_18)
      end)
      break
    else
      break
    end
    L0_15 = L0_15 + 1
  end
end
function vogo_crate_active_mnavi(A0_21, A1_22)
  invokeTask(function()
    local L0_23
    while true do
      L0_23 = _crate_cnt
      if L0_23 > 0 then
        L0_23 = _crate_cnt
        if L0_23 <= A0_21 then
          L0_23 = waitSeconds
          L0_23(A1_22)
          L0_23 = 1
          for _FORV_4_, _FORV_5_ in pairs(_vogo_crate) do
            if _FORV_5_.broken == false then
              _FORV_5_.navi_hdl = HUD:mnaviNew({
                name = "mnavi_" .. string.format("%02d", L0_23)
              })
              _FORV_5_.navi_hdl:setTarget(_FORV_5_.node_hdl)
              _FORV_5_.navi_hdl:setActive(true)
              L0_23 = L0_23 + 1
            end
          end
          break
        end
      end
      L0_23 = wait
      L0_23()
    end
  end)
end
function cubesensor2_crate_OnLeave(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29
  if L2_26 == true then
    if L2_26 == true then
      if L2_26 == false then
        for L5_29, _FORV_6_ in L2_26(L3_27) do
          if _FORV_6_.node_hdl ~= nil and A1_25:findChildNode(_FORV_6_.node_hdl:getName()) ~= nil then
            if findGameObject2("Node", L5_29) ~= nil then
              A1_25:setWorldTransform(findGameObject2("Node", L5_29):getWorldTransform())
              A1_25:setForceMove()
            end
            break
          end
        end
      end
    end
  end
end
