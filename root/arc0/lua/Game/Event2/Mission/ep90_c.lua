dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_crate_cnt = 0
_count_flag = false
_haze_value = true
_vogo_crate = {}
enmgen2_a = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_a_01",
      name = "ene_a_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_a_02",
      name = "ene_a_02"
    },
    {
      type = "stalker",
      locator = "locator_ene_a_03",
      name = "ene_a_03"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"ene_a_01", "ene_a_02"}, 2, 5, "A")
    Fn_enemyPopGemSetup(A0_0, {"ene_a_03"}, 1, 4, "B")
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3, {"A", "B"})
  end
}
enmgen2_b = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_b_01",
      name = "ene_b_01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_02",
      name = "ene_b_02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_03",
      name = "ene_b_03"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"ene_b_01"}, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_4, {"ene_b_02"}, 1, 5, "B")
    Fn_enemyPopGemSetup(A0_4, {"ene_b_03"}, 1, 6, "C")
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7, {
      "A",
      "B",
      "C"
    })
  end
}
enmgen2_c = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_ene_c_01",
      name = "ene_c_01"
    },
    {
      type = "imp",
      locator = "locator_ene_c_02",
      name = "ene_c_02"
    },
    {
      type = "imp",
      locator = "locator_ene_c_03",
      name = "ene_c_03"
    },
    {
      type = "imp",
      locator = "locator_ene_c_04",
      name = "ene_c_04"
    }
  },
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "ene_c_01",
      "ene_c_02",
      "ene_c_03",
      "ene_c_04"
    }, 2, 2)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
function Initialize()
  local L0_12, L1_13
  L0_12 = Fn_userCtrlOff
  L0_12()
  L0_12 = {
    L1_13,
    "evarea2_po_a_15_crate",
    "evarea2_po_a_15_haze",
    "evarea2_po_a_15_gem_vital"
  }
  L1_13 = "evarea2_po_a_04_common"
  L1_13 = Fn_loadEventData
  L1_13("evx/ep90_common", L0_12)
  L1_13 = Fn_loadEventData
  L1_13("evx/ep90_common", {
    "evarea2_po_a_02_common"
  }, true)
  L1_13 = {
    "evarea2_po_a_04",
    "evarea2_po_a_15"
  }
  L0_12 = L1_13
  L1_13 = Fn_loadEventData
  L1_13("evx/ep90", L0_12, true)
  L1_13 = {
    {
      name = "thief",
      type = "ep90_thief",
      node = "locator2_thief",
      reset = false,
      attach = false,
      anim_name = "check"
    },
    {
      name = "ve02",
      type = "ve02",
      node = "locator2_ve02",
      reset = false,
      attach = false,
      anim_name = "stay_01",
      use_gravity = false
    }
  }
  Fn_setupNpc(L1_13)
  _sdemo = SDemo.create("ep90_c_01")
end
function Ingame()
  local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24
  L0_14 = Fn_findNpc
  L1_15 = "thief"
  L0_14 = L0_14(L1_15)
  L2_16 = L0_14
  L1_15 = L0_14.getPuppet
  L1_15 = L1_15(L2_16)
  L2_16 = Fn_findNpc
  L3_17 = "ve02"
  L2_16 = L2_16(L3_17)
  L4_18 = L0_14
  L3_17 = L0_14.playMotion
  L5_19 = "check"
  L3_17(L4_18, L5_19)
  L4_18 = L2_16
  L3_17 = L2_16.playMotion
  L5_19 = "stay_01"
  L3_17(L4_18, L5_19)
  L3_17 = vogo_crate_append_mnavi
  L3_17()
  L3_17 = create_haze
  L3_17 = L3_17()
  L4_18 = findGameObject2
  L5_19 = "Node"
  L6_20 = "locator2_po_a_15_crate"
  L4_18 = L4_18(L5_19, L6_20)
  L5_19 = _sdemo
  L6_20 = L5_19
  L5_19 = L5_19.set
  L7_21 = "locator2_cut_02_cam01"
  L8_22 = "locator2_cut_02_aim01"
  L5_19(L6_20, L7_21, L8_22)
  L5_19 = _sdemo
  L6_20 = L5_19
  L5_19 = L5_19.play
  L5_19(L6_20)
  L5_19 = Fn_missionStart
  L5_19()
  L5_19 = 0
  L6_20 = false
  while true do
    if L5_19 == 0 then
      L7_21 = Fn_setCatWarpCheckPoint
      L8_22 = "locator2_pc_start_pos"
      L7_21(L8_22)
      L7_21 = {L8_22}
      L8_22 = {}
      L8_22.time = 6
      L8_22.pos = "locator2_thief"
      L8_22 = {L9_23}
      L9_23.time = 6
      L9_23.pos = "locator2_cut_02_cam02"
      L9_23(L10_24, L8_22, L7_21)
      while true do
        if L9_23 then
          L9_23()
        end
      end
      L9_23(L10_24)
      L9_23(L10_24)
      L9_23(L10_24, "locator2_cut_04_cam01", "locator2_cut_04_aim01")
      L10_24.time = 3
      L10_24.pos = "locator2_cut_04_cam02"
      L8_22 = L9_23
      L10_24.time = 3
      L10_24.pos = "locator2_cut_04_aim02"
      L7_21 = L9_23
      L9_23(L10_24, L8_22, L7_21)
      for _FORV_12_, _FORV_13_ in L9_23(L10_24) do
        _FORV_13_:setActive(true)
      end
      L9_23(L10_24)
      L10_24(L9_23, false)
      L10_24(L9_23)
      L10_24()
      L10_24("battle")
      L10_24(L9_23, true)
      L10_24(function()
        local L0_25, L1_26
        L0_25 = L0_14
        L1_26 = L0_25
        L0_25 = L0_25.playMotion
        L0_25(L1_26, "surprise")
        L0_25 = waitSeconds
        L1_26 = 2.5
        L0_25(L1_26)
        L0_25 = {}
        L1_26 = 1
        while findGameObject2("Node", "locator2_escape_e_" .. string.format("%02d", L1_26)) ~= nil do
          L0_25[L1_26] = findGameObject2("Node", "locator2_escape_e_" .. string.format("%02d", L1_26)):getName()
          do break end
          do break end
          L1_26 = L1_26 + 1
        end
        while Fn_moveNpc("thief", L0_25, {
          arrivedLength = 1,
          runLength = -1,
          anim_run_speed = 1.5,
          anim_speed_over = true
        }):isRunning() do
          wait()
        end
        L6_20 = true
      end)
      while true do
        if L10_24 then
          L10_24()
        end
      end
      L7_21 = L10_24
      L10_24(L10_24, nil, L7_21)
      while true do
        while true do
          if L10_24 then
            L10_24()
          end
        end
      end
      while L6_20 == false do
        L10_24()
      end
      L10_24(function()
        L2_16:setPilot(L1_15, "ve02", "fly")
        waitSeconds(1)
        Fn_warpNpc(L2_16, "locator2_escape_f_start")
        escape_tbl = {}
        idx = 1
        while findGameObject2("Node", "locator2_escape_f_" .. string.format("%02d", idx)) ~= nil do
          escape_tbl[idx] = {}
          escape_tbl[idx].pos = findGameObject2("Node", "locator2_escape_f_" .. string.format("%02d", idx)):getName()
          escape_tbl[idx].attr = "fly"
          do break end
          do break end
          idx = idx + 1
        end
        Fn_fly(L2_16, escape_tbl, {moveSpeed = 10, escape = false})
        Fn_setNpcAlpha(L2_16, false)
        Fn_setNpcAlpha(L0_14, false)
      end)
      L10_24(L10_24, 2)
      L10_24(2)
      L10_24()
      L10_24(0.5)
      L10_24(L9_23, false)
      L10_24(L9_23, true)
      L10_24("ep90_00800")
      L10_24("escape")
      while true do
        if L10_24 > 0 then
          L10_24()
        end
      end
      L10_24()
      L5_19 = 1
    elseif L5_19 == 1 then
      L7_21 = findGameObject2
      L8_22 = "EnemyGenerator"
      L7_21 = L7_21(L8_22, L9_23)
      enmgen_b = L7_21
      L7_21 = enmgen_b
      L8_22 = L7_21
      L7_21 = L7_21.requestSpawn
      L7_21(L8_22)
      L7_21 = wait
      L7_21()
      L7_21 = {
        L8_22,
        L9_23,
        [4] = L10_24("Puppet", "ene_b_03")
      }
      L8_22 = findGameObject2
      L8_22 = L8_22(L9_23, L10_24)
      ;({
        L8_22,
        L9_23,
        [4] = L10_24("Puppet", "ene_b_03")
      })[3] = L10_24
      L8_22 = invokeTask
      L8_22(L9_23)
      L8_22 = Fn_setBgmPoint
      L8_22(L9_23)
      L8_22 = waitSeconds
      L8_22(L9_23)
      L8_22 = Fn_captionViewWait
      L8_22(L9_23)
      L8_22 = HUD
      L8_22 = L8_22.info
      L8_22(L9_23, L10_24, true, 15)
      L8_22 = Fn_tutorialCaption
      L8_22(L9_23)
      while true do
        L8_22 = enmgen_b
        L8_22 = L8_22.getEnemyCount
        L8_22 = L8_22(L9_23)
        if L8_22 > 0 then
          L8_22 = wait
          L8_22()
        end
      end
      L8_22 = {}
      L7_21 = L8_22
      L8_22 = Fn_tutorialCaptionKill
      L8_22()
      L5_19 = 2
      break
    elseif L5_19 == 2 then
      L7_21 = findGameObject2
      L8_22 = "EnemyGenerator"
      L7_21 = L7_21(L8_22, L9_23)
      enmgen_c = L7_21
      L7_21 = enmgen_c
      L8_22 = L7_21
      L7_21 = L7_21.requestSpawn
      L7_21(L8_22)
      L7_21 = wait
      L7_21()
      L7_21 = {
        L8_22,
        L9_23,
        L10_24,
        findGameObject2("Puppet", "ene_c_04")
      }
      L8_22 = findGameObject2
      L8_22 = L8_22(L9_23, L10_24)
      L8_22 = invokeTask
      L8_22(L9_23)
      L8_22 = Fn_setBgmPoint
      L8_22(L9_23)
      L8_22 = invokeTask
      L8_22(L9_23)
      L8_22 = false
      invokeTask(function()
        local L1_27, L2_28, L3_29
        for _FORV_3_ = 1, 30 do
          if L10_24 ~= enmgen_c:getEnemyCount() then
            L8_22 = true
            break
          end
          waitSeconds(1)
        end
        L9_23 = L1_27
      end)
      Fn_tutorialCaption("attack")
      while L8_22 == false and L9_23 == false do
        wait()
      end
      L7_21 = {}
      Fn_tutorialCaptionKill()
      waitSeconds(0.5)
      Player:setStay(true)
      Player:setStay(false)
      Fn_userCtrlOff()
      enmgen_c:requestIdlingEnemy(true)
      if L8_22 == true then
        Fn_captionViewWait("ep90_00905")
      else
        Fn_captionViewWait("ep90_00910")
      end
      waitSeconds(0.5)
      Player:setAbility({
        Player.kAbility_AttrTuneSwitch,
        Player.kAbility_SwitchToMars
      }, true)
      Fn_tutorialCaption("marsgrav_kick")
      repeat
        wait()
      until Fn_isLunarStyle()
      Fn_unLockPlayerAbility({
        Player.kAbility_AttrTuneSwitch,
        Player.kAbility_SwitchToMars
      })
      waitSeconds(0.5)
      HUD:info("ep90_info_01", true, 15)
      enmgen_c:requestIdlingEnemy(false)
      while 0 < enmgen_c:getEnemyCount() do
        wait()
      end
      Fn_tutorialCaptionKill()
      waitSeconds(0.5)
      Fn_userCtrlOff()
      Fn_captionViewWait("ep90_00915")
      waitSeconds(0.5)
      Player:setAbility({
        Player.kAbility_AttrTuneSwitch
      }, true)
      Player:setAbility({
        Player.kAbility_SwitchToMars,
        Player.kAbility_SwitchToJupiter
      }, false)
      Fn_tutorialCaption("normal")
      repeat
        wait()
      until Fn_isNormalStyle()
      Fn_tutorialCaptionKill()
      L5_19 = 3
      break
    elseif L5_19 == 3 then
      L7_21 = invokeTask
      function L8_22()
        local L0_30, L1_31, L2_32, L3_33, L4_34
        while true do
          if L0_30 > 0 then
            L0_30()
          end
        end
        L0_30(L1_31)
        for L3_33, L4_34 in L0_30(L1_31) do
          invokeTask(function()
            Fn_setAlpha(L4_34, false, 3, 10)
            L4_34:setVisible(false)
          end)
          break
        end
        L0_30(L1_31)
        _haze_value = false
      end
      L7_21(L8_22)
      L7_21 = Fn_userCtrlOn
      L7_21()
      L7_21 = _crate_cnt
      if L7_21 > 0 then
        L7_21 = Fn_getDistanceToPlayer
        L8_22 = L4_18
        L7_21 = L7_21(L8_22)
        if L7_21 > 8 then
          L7_21 = look_at_target_input
          L8_22 = L4_18
          L7_21(L8_22)
        end
        L7_21 = waitSeconds
        L8_22 = 0.5
        L7_21(L8_22)
        L7_21 = Fn_captionViewWait
        L8_22 = "ep90_00808"
        L7_21(L8_22)
        L7_21 = Fn_missionViewWait
        L8_22 = "ep90_00807"
        L7_21(L8_22)
        L7_21 = lockon_vogo_crate
        L8_22 = "bg2_crate_po_a_15"
        L7_21(L8_22)
        L7_21 = HUD
        L8_22 = L7_21
        L7_21 = L7_21.counter99_99SetTextID
        L7_21(L8_22, L9_23)
        L7_21 = HUD
        L8_22 = L7_21
        L7_21 = L7_21.counter99_99SetMax
        L7_21(L8_22, L9_23)
        L7_21 = HUD
        L8_22 = L7_21
        L7_21 = L7_21.counter99_99SetNum
        L7_21(L8_22, L9_23)
        L7_21 = HUD
        L8_22 = L7_21
        L7_21 = L7_21.counter99_99SetVisible
        L7_21(L8_22, L9_23)
        _count_flag = true
        L7_21 = vogo_crate_active_mnavi
        L8_22 = 5
        L7_21 = L7_21(L8_22, L9_23)
        while true do
          L8_22 = _crate_cnt
          if L8_22 > 0 then
            L8_22 = wait
            L8_22()
          end
        end
        if L7_21 ~= nil then
          L8_22 = L7_21.isRunning
          L8_22 = L8_22(L9_23)
          if L8_22 == true then
            L8_22 = L7_21.abort
            L8_22(L9_23)
          end
        end
        L7_21 = nil
        L8_22 = waitSeconds
        L8_22(L9_23)
        L8_22 = HUD
        L8_22 = L8_22.counter99_99SetVisible
        L8_22(L9_23, L10_24)
        L8_22 = Fn_setBgmPoint
        L8_22(L9_23)
        L8_22 = Fn_getDistanceToPlayer
        L8_22 = L8_22(L9_23)
        if L8_22 > 8 then
          L8_22 = look_at_target_input
          L8_22(L9_23)
        end
      end
      break
    end
    L7_21 = wait
    L7_21()
  end
  L7_21 = waitSeconds
  L8_22 = 2
  L7_21(L8_22)
  L7_21 = Fn_kaiwaDemoView
  L8_22 = "ep90_01300k"
  L7_21(L8_22)
  while true do
    L7_21 = _haze_value
    if L7_21 == true then
      L7_21 = wait
      L7_21()
    end
  end
  L7_21 = Fn_setKeepPlayerPos
  L7_21()
  L7_21 = Fn_setNextMissionFlag
  L7_21()
  L7_21 = Fn_nextMission
  L7_21()
  L7_21 = Fn_exitSandbox
  L7_21()
end
function Finalize()
  local L0_35, L1_36
  _vogo_crate = nil
end
function vogo_crate_append_mnavi()
  local L0_37, L1_38, L2_39, L3_40
  L0_37 = 1
  while true do
    L1_38 = "bg2_crate_po_a_15_"
    L2_39 = string
    L2_39 = L2_39.format
    L3_40 = "%02d"
    L2_39 = L2_39(L3_40, L0_37)
    L1_38 = L1_38 .. L2_39
    L2_39 = findGameObject2
    L3_40 = "Node"
    L2_39 = L2_39(L3_40, L1_38)
    if L2_39 ~= nil then
      L3_40 = _crate_cnt
      L3_40 = L3_40 + 1
      _crate_cnt = L3_40
      L3_40 = _vogo_crate
      L3_40[L1_38] = {
        node_hdl = nil,
        navi_hdl = nil,
        broken = false
      }
      L3_40 = L2_39.setEventListener
      L3_40(L2_39, "broken", function(A0_41)
        _vogo_crate[A0_41:getName()].broken = true
        if _vogo_crate[A0_41:getName()].navi_hdl ~= nil then
          _vogo_crate[A0_41:getName()].navi_hdl:setActive(false)
          _vogo_crate[A0_41:getName()].navi_hdl:del()
          _vogo_crate[A0_41:getName()].navi_hdl = nil
        end
        _crate_cnt = _crate_cnt - 1
        if _count_flag == true then
          HUD:counter99_99AddNum()
        end
      end)
      L3_40 = create_append_nodo
      L3_40 = L3_40("vogo_crate_navi_" .. string.format("%02d", L0_37), L2_39, Vector(0, 0.25, 0))
      _vogo_crate[L1_38].node_hdl = L3_40
      L2_39:setEventListener("dynamic", function(A0_42)
        A0_42:getDynamicObject():appendChild(L3_40)
      end)
      break
    else
      break
    end
    L0_37 = L0_37 + 1
  end
end
function vogo_crate_active_mnavi(A0_43, A1_44)
  return invokeTask(function()
    local L0_45
    while true do
      L0_45 = _crate_cnt
      if L0_45 > 0 then
        L0_45 = _crate_cnt
        if L0_45 <= A0_43 then
          L0_45 = waitSeconds
          L0_45(A1_44)
          L0_45 = 1
          for _FORV_4_, _FORV_5_ in pairs(_vogo_crate) do
            if _FORV_5_.broken == false then
              _FORV_5_.navi_hdl = HUD:mnaviNew({
                name = "mnavi_" .. string.format("%02d", L0_45)
              })
              _FORV_5_.navi_hdl:setTarget(_FORV_5_.node_hdl)
              _FORV_5_.navi_hdl:setActive(true)
              L0_45 = L0_45 + 1
            end
          end
          break
        end
      end
      L0_45 = wait
      L0_45()
    end
  end)
end
function cubesensor2_crate_OnLeave(A0_46, A1_47)
  local L2_48, L3_49, L4_50, L5_51
  if L2_48 == true then
    if L2_48 == true then
      if L2_48 == false then
        for L5_51, _FORV_6_ in L2_48(L3_49) do
          if _FORV_6_.node_hdl ~= nil and A1_47:findChildNode(_FORV_6_.node_hdl:getName()) ~= nil then
            if findGameObject2("Node", L5_51) ~= nil then
              A1_47:setWorldTransform(findGameObject2("Node", L5_51):getWorldTransform())
              A1_47:setForceMove()
            end
            break
          end
        end
      end
    end
  end
end
