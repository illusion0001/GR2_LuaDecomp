dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_next_phase = false
_porter_move = true
_part_chara = {}
_porter_task = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    L1_1,
    "evarea2_po_a_02",
    "evarea2_po_a_15"
  }
  L1_1 = "evarea2_po_a_04"
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90", L0_0, true)
  L1_1 = {
    "evarea2_po_a_02_common",
    "evarea2_po_a_04_common"
  }
  L0_0 = L1_1
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90_common", L0_0, true)
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_02_in")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_02_out")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_navi_03")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_navi_04")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_navi_05")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_lost")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_porter")
  L1_1 = {
    {
      name = "sis01",
      type = "sis01",
      node = "locator2_sis01"
    },
    {
      name = "man_00900k",
      type = "man34",
      node = "locator2_man_00900k",
      anim_name = "sit_00"
    },
    {
      name = "man_01000k",
      type = "man40",
      node = "locator2_man_01000k"
    },
    {
      name = "man_01100k",
      type = "man38",
      node = "locator2_man_01100k"
    },
    {
      name = "porter",
      type = "man39",
      node = "locator2_porter",
      attach = false
    },
    {
      name = "thief",
      type = "ep90_thief",
      node = "locator2_thief",
      reset = false
    }
  }
  Fn_setupNpc(L1_1)
  _part_chara = {
    "sis01",
    "man_00900k",
    "man_01000k",
    "man_01100k"
  }
  sdemo = SDemo.create("ep90_b_01")
  Fn_sendEventComSb("requestAreaWarp", "locator2_route_start")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22
  L0_2 = Fn_findNpc
  L1_3 = "thief"
  L0_2 = L0_2(L1_3)
  L2_4 = L0_2
  L1_3 = L0_2.getPuppet
  L1_3 = L1_3(L2_4)
  L2_4, L3_5 = nil, nil
  L4_6 = Fn_missionStart
  L4_6()
  L4_6 = 0
  while true do
    if L4_6 == 0 then
      L5_7 = Fn_setCatWarpCheckPoint
      L6_8 = "locator2_pc_start_pos"
      L5_7(L6_8)
      L5_7 = {}
      L6_8 = 1
      while true do
        L7_9 = findGameObject2
        L8_10 = "Node"
        L7_9 = L7_9(L8_10, L9_11)
        if L7_9 ~= nil then
          L8_10 = L7_9.getName
          L8_10 = L8_10(L9_11)
          L5_7[L6_8] = L8_10
        else
          break
        end
        L6_8 = L6_8 + 1
      end
      L7_9 = Fn_moveNpc
      L8_10 = "thief"
      L10_12.runLength = 20
      L7_9(L8_10, L9_11, L10_12)
      L7_9 = true
      L8_10 = invokeTask
      L8_10(L9_11)
      L8_10 = true
      L9_11(L10_12)
      L9_11()
      while true do
        if L10_12 == false then
          L10_12()
        end
      end
      L10_12(L11_13)
      L11_13(L12_14, L13_15)
      L20_22 = L13_15(L14_16)
      L11_13(L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L13_15(L14_16))
      L11_13(L12_14)
      L11_13(L12_14)
      L11_13(L12_14)
      L11_13(L12_14)
      L11_13(L12_14, L13_15, L14_16, L15_17)
      L20_22 = L14_16(L15_17, L16_18, L17_19)
      L11_13(L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L14_16(L15_17, L16_18, L17_19))
      L11_13(L12_14)
      L11_13(L12_14)
      L11_13(L12_14)
      L11_13(L12_14, L13_15)
      L7_9 = false
      L5_7 = L11_13
      L6_8 = 1
      while true do
        if L11_13 ~= nil then
          L5_7[L6_8] = L12_14
        else
          break
        end
        L6_8 = L6_8 + 1
      end
      L14_16.arrivedLength = 5
      L14_16.runLength = -1
      L14_16.anim_run_speed = 1.5
      L14_16.anim_speed_over = true
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L8_10 = false
      L12_14()
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L12_14(L13_15, L14_16)
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L12_14()
      if L9_11 ~= nil then
        if L12_14 == true then
          L12_14(L13_15)
        end
      end
      L12_14(L13_15, L14_16)
      if L11_13 ~= nil then
        if L12_14 == true then
          L12_14(L13_15)
        end
      end
      _porter_move = false
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L0_2, L1_3 = nil, nil
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L4_6 = 1
      break
    elseif L4_6 == 1 then
      L5_7 = Fn_setCatWarpCheckPoint
      L6_8 = "locator2_ep90_b_thief_lost"
      L5_7(L6_8)
      L5_7 = Fn_pcSensorOn
      L6_8 = "pccubesensor2_po_a_02_in"
      L5_7(L6_8)
      L5_7 = Fn_pcSensorOn
      L6_8 = "pccubesensor2_po_a_02_out"
      L5_7(L6_8)
      L5_7 = Fn_missionView
      L6_8 = "ep90_00772"
      L5_7(L6_8)
      L5_7 = invokeTask
      function L6_8()
        waitSeconds(2)
        Fn_captionView("ep90_00774")
      end
      L5_7(L6_8)
      L5_7 = waitSeconds
      L6_8 = 4
      L5_7(L6_8)
      L5_7 = {}
      L6_8 = {}
      L7_9 = 1
      while true do
        L8_10 = findGameObject2
        L8_10 = L8_10(L9_11, L10_12)
        if L8_10 ~= nil then
          L5_7[L7_9] = L8_10
          L6_8[L7_9] = false
        else
          break
        end
        L7_9 = L7_9 + 1
      end
      L8_10 = Fn_get_shuffle_teble
      L8_10 = L8_10(L9_11)
      while true do
        for L13_15, L14_16 in L10_12(L11_13) do
          if L15_17 == false then
            if L15_17 == true then
              L6_8[L13_15] = true
              if not (L9_11 > L15_17) then
                L15_17(L16_18)
                L15_17(L16_18)
              end
            end
          end
        end
        if not (L9_11 >= L10_12) then
          L10_12()
        end
      end
      L4_6 = 2
    elseif L4_6 == 2 then
      L5_7 = {}
      L6_8 = 1
      L7_9 = Fn_getPcPosRot
      L7_9 = L7_9()
      L8_10 = {
        L9_11,
        L10_12,
        L11_13
      }
      for L12_14, L13_15 in L9_11(L10_12) do
        while true do
          L18_20 = L13_15
          L19_21 = "_start_"
          L20_22 = string
          L20_22 = L20_22.format
          L20_22 = L20_22("%02d", L14_16)
          if L15_17 ~= nil then
            L5_7[L6_8] = L16_18
            L16_18.hdl = L15_17
            L18_20 = L7_9
            L20_22 = L15_17
            L19_21 = L15_17.getWorldPos
            L20_22 = L19_21(L20_22)
            L16_18.dist = L17_19
            L16_18.route = L13_15
          else
            break
          end
          L6_8 = L6_8 + 1
        end
      end
      L9_11(L10_12, L11_13)
      L10_12.sec = 5
      L10_12.cap = "ep90_00861"
      L9_11.high = L10_12
      L10_12.sec = 5
      L10_12.cap = "ep90_00862"
      L9_11.middle = L10_12
      L10_12.sec = 5
      L10_12.cap = "ep90_00863"
      L9_11.low = L10_12
      L10_12.sec = 5
      L10_12.cap = "ep90_00864"
      L9_11.lowest = L10_12
      find_range_cap = L10_12
      if L11_13 == "middle" then
        L12_14(L13_15)
        L12_14(L13_15)
      elseif L11_13 == "high" then
        L12_14(L13_15)
        L12_14(L13_15)
      elseif L11_13 == "low" or L11_13 == "lowest" then
        L12_14(L13_15)
        L12_14(L13_15)
      end
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      while L12_14 == false do
        L13_15(L14_16)
        if L11_13 == "middle" then
          for L16_18, L17_19 in L13_15(L14_16) do
            L18_20 = is_check_eye_node
            L19_21 = L17_19.hdl
            L20_22 = 100
            L18_20 = L18_20(L19_21, L20_22)
            if L18_20 == true then
              break
            end
          end
        end
        L13_15(L14_16)
      end
      for L18_20, L19_21 in L15_17(L16_18) do
        L20_22 = Fn_isInSightTarget
        L20_22 = L20_22(L19_21.hdl, 1)
        if L20_22 == false then
          break
        end
      end
      L17_19.name = "thief"
      L17_19.type = "ep90_thief"
      L17_19.node = "locator2_thief"
      L17_19.start = true
      L17_19.attach = false
      L18_20 = {}
      L18_20.name = "ve02"
      L18_20.type = "ve02"
      L18_20.node = L15_17
      L18_20.use_gravity = false
      L18_20.start = true
      L18_20.attach = false
      L18_20 = L16_18
      L17_19(L18_20)
      L18_20 = "thief"
      L0_2 = L17_19
      L18_20 = L0_2
      L1_3 = L17_19
      L18_20 = "ve02"
      L2_4 = L17_19
      L18_20 = L2_4
      L3_5 = L17_19
      L18_20 = "thief"
      L19_21 = true
      L17_19(L18_20, L19_21)
      L18_20 = "ve02"
      L19_21 = true
      L17_19(L18_20, L19_21)
      L18_20 = L2_4
      L19_21 = L1_3
      L20_22 = "ve02"
      L17_19(L18_20, L19_21, L20_22, "fly")
      L18_20 = "ep90_00778"
      L17_19(L18_20)
      L18_20 = 0.5
      L17_19(L18_20)
      L18_20 = L1_3
      while true do
        L18_20 = Fn_isInSightTarget
        L19_21 = L1_3
        L20_22 = 1
        L18_20 = L18_20(L19_21, L20_22)
        if L18_20 ~= true then
          L18_20 = wait
          L18_20()
        end
      end
      L18_20 = Fn_pcSensorOff
      L19_21 = "pccubesensor2_po_a_02_in"
      L18_20(L19_21)
      L18_20 = Fn_pcSensorOff
      L19_21 = "pccubesensor2_po_a_02_out"
      L18_20(L19_21)
      L18_20 = invokeTask
      function L19_21()
        Fn_captionView("ep90_00780")
        waitSeconds(1)
        if L17_19 ~= nil and L17_19:isRunning() == true then
          L17_19:abort()
        end
        L17_19 = nil
        Fn_missionView("ep90_00781")
        Fn_setBgmPoint("event", "thief_escape2")
        HUD:naviSetPochiDistanceDensity0(25)
        HUD:naviSetPochiDistanceDensity100(30)
        Fn_naviSet(L3_5)
      end
      L18_20(L19_21)
      L18_20 = {}
      escape_tbl = L18_20
      L6_8 = 1
      L18_20 = 1
      L19_21 = true
      while true do
        L20_22 = "locator2_route_"
        L20_22 = L20_22 .. L14_16 .. "_start_" .. string.format("%02d", L18_20)
        if L19_21 == false then
          if findGameObject2("Node", L20_22) ~= nil then
            escape_tbl[L6_8] = {}
            escape_tbl[L6_8].pos = findGameObject2("Node", L20_22):getName()
            escape_tbl[L6_8].attr = "fly"
            L6_8 = L6_8 + 1
          else
            break
          end
        elseif L13_15:getName() == L20_22 then
          L19_21 = false
        end
        L18_20 = L18_20 + 1
      end
      L20_22 = escape_tbl
      if L20_22 ~= nil then
        L20_22 = escape_tbl
        L20_22 = #L20_22
        if L20_22 ~= 0 then
          L20_22 = Fn_fly
          L20_22(L2_4, escape_tbl, {moveSpeed = 8})
        end
      end
      L20_22 = {}
      escape_tbl = L20_22
      L6_8 = 1
      while true do
        L20_22 = findGameObject2
        L20_22 = L20_22("Node", "locator2_escape_c_" .. string.format("%02d", L6_8))
        if L20_22 ~= nil then
          escape_tbl[L6_8] = {}
          escape_tbl[L6_8].pos = L20_22:getName()
          escape_tbl[L6_8].attr = "fly"
        else
          break
        end
        L6_8 = L6_8 + 1
      end
      L20_22 = Fn_fly
      L20_22(L2_4, escape_tbl, {moveSpeed = 10})
      L20_22 = Fn_naviKill
      L20_22()
      L20_22 = Fn_setNpcAlpha
      L20_22("thief", false)
      L20_22 = Fn_setNpcAlpha
      L20_22("ve02", false)
      L20_22 = Fn_naviSet
      L20_22(findGameObject2("Node", "locator2_navi_03"))
      L20_22 = Fn_pcSensorOn
      L20_22("pccubesensor2_navi_03")
      L20_22 = waitPhace
      L20_22()
      L4_6 = 3
      break
    elseif L4_6 == 3 then
      L5_7 = Fn_setCatWarpCheckPoint
      L6_8 = "locator2_ep90_b_ve02_lost"
      L5_7(L6_8)
      L5_7 = Fn_warpNpc
      L6_8 = L2_4
      L7_9 = "locator2_escape_d_start"
      L5_7(L6_8, L7_9)
      L5_7 = Fn_setNpcAlpha
      L6_8 = "thief"
      L7_9 = true
      L5_7(L6_8, L7_9)
      L5_7 = Fn_setNpcAlpha
      L6_8 = "ve02"
      L7_9 = true
      L5_7(L6_8, L7_9)
      L5_7 = {L6_8}
      L6_8 = "evarea2_po_a_15_crate"
      L6_8 = Fn_loadEventData
      L7_9 = "evx/ep90_common"
      L8_10 = L5_7
      L6_8(L7_9, L8_10, L9_11)
      L6_8 = invokeTask
      function L7_9()
        waitSeconds(2)
        Fn_naviSet(findGameObject2("Node", "locator2_navi_04"))
      end
      L6_8(L7_9)
      L6_8 = Fn_pcSensorOn
      L7_9 = "pccubesensor2_navi_04"
      L6_8(L7_9)
      L6_8 = waitPhace
      L6_8()
      L6_8 = invokeTask
      function L7_9()
        local L0_23
        L0_23 = look_at_target_input
        L0_23(findGameObject2("Node", "locator2_vctrl_04"))
      end
      L6_8 = L6_8(L7_9)
      L7_9 = invokeTask
      function L8_10()
        waitSeconds(2)
        Fn_naviSet(L3_5)
      end
      L7_9(L8_10)
      L7_9 = Fn_sendEventComSb
      L8_10 = "requestAreaMove"
      L7_9(L8_10)
      L7_9 = {}
      escape_tbl = L7_9
      idx = 1
      while true do
        L7_9 = findGameObject2
        L8_10 = "Node"
        L7_9 = L7_9(L8_10, L9_11)
        if L7_9 ~= nil then
          L8_10 = escape_tbl
          L8_10[L9_11] = L10_12
          L8_10 = escape_tbl
          L8_10 = L8_10[L9_11]
          L8_10.pos = L9_11
          L8_10 = escape_tbl
          L8_10 = L8_10[L9_11]
          L8_10.attr = "fly"
        else
          break
        end
        L8_10 = idx
        L8_10 = L8_10 + 1
        idx = L8_10
      end
      if L6_8 ~= nil then
        L8_10 = L6_8
        L7_9 = L6_8.isRunning
        L7_9 = L7_9(L8_10)
        if L7_9 == true then
          L8_10 = L6_8
          L7_9 = L6_8.abort
          L7_9(L8_10)
        end
      end
      L6_8 = nil
      L7_9 = Fn_fly
      L8_10 = L2_4
      L10_12.moveSpeed = 10
      L7_9(L8_10, L9_11, L10_12)
      L7_9 = Fn_naviKill
      L7_9()
      L8_10 = L2_4
      L7_9 = L2_4.releasePilot
      L7_9(L8_10, L9_11)
      L7_9 = Fn_findNpc
      L8_10 = "thief"
      L7_9 = L7_9(L8_10)
      L8_10 = Fn_warpNpc
      L8_10(L9_11, L10_12)
      L8_10 = Fn_warpNpc
      L8_10(L9_11, L10_12)
      L8_10 = L7_9.playMotion
      L8_10(L9_11, L10_12)
      L8_10 = invokeTask
      L8_10(L9_11)
      L8_10 = Fn_pcSensorOn
      L8_10(L9_11)
      L8_10 = waitPhace
      L8_10()
      L8_10 = Fn_naviKill
      L8_10()
      break
    end
    L5_7 = wait
    L5_7()
  end
  L5_7 = Fn_blackout
  L6_8 = 1
  L5_7(L6_8)
  L5_7 = Fn_setNextMissionFlag
  L5_7()
  L5_7 = Fn_nextMission
  L5_7()
  L5_7 = Fn_exitSandbox
  L5_7()
end
function Finalize()
  local L0_24, L1_25, L2_26, L3_27, L4_28
  for L3_27, L4_28 in L0_24(L1_25) do
    Fn_disappearNpc(L4_28)
  end
end
function pccubesensor2_navi_OnEnter(A0_29)
  Fn_naviKill()
  Fn_pcSensorOff(A0_29)
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function setup_porter()
  local L0_30, L1_31, L2_32, L3_33
  L0_30 = createGameObject2
  L1_31 = "GimmickBg"
  L0_30 = L0_30(L1_31)
  L2_32 = L0_30
  L1_31 = L0_30.setDrawModelName
  L3_33 = "woodbox_kk_03"
  L1_31(L2_32, L3_33)
  L2_32 = L0_30
  L1_31 = L0_30.setAttributeName
  L3_33 = "woodbox_kk_03"
  L1_31(L2_32, L3_33)
  L2_32 = L0_30
  L1_31 = L0_30.setFloaterParams
  L1_31(L2_32)
  L2_32 = L0_30
  L1_31 = L0_30.setIgnoreGrab
  L3_33 = true
  L1_31(L2_32, L3_33)
  L2_32 = L0_30
  L1_31 = L0_30.try_init
  L1_31(L2_32)
  L2_32 = L0_30
  L1_31 = L0_30.waitForReady
  L1_31(L2_32)
  L2_32 = L0_30
  L1_31 = L0_30.try_start
  L1_31(L2_32)
  L1_31 = Fn_findNpc
  L2_32 = "porter"
  L1_31 = L1_31(L2_32)
  L3_33 = L1_31
  L2_32 = L1_31.getPuppet
  L2_32 = L2_32(L3_33)
  L3_33 = Fn_attachJoint
  L3_33(L0_30, L2_32, "bn_spine0")
  L3_33 = L0_30.setPos
  L3_33(L0_30, Vector(0, -0.5, -0.15))
  L3_33 = Fn_findNpc
  L3_33 = L3_33("porter")
  L3_33:playMotion("porter_stay")
  Fn_pcSensorOn("pccubesensor2_porter")
  function _G.pccubesensor2_porter_OnEnter(A0_34)
    _porter_task = invokeTask(function()
      local L0_35, L1_36
      L0_35 = false
      L1_36 = L3_33
      L1_36 = L1_36.setMoveOption
      L1_36(L1_36, {
        anim_walk = "porter_walk",
        arrivedLength = 1,
        runLength = 30
      })
      while true do
        L1_36 = _porter_move
        if L1_36 == true then
          L1_36 = Fn_getPcPosRot
          L1_36 = L1_36()
          L3_33:move({
            {pos = L1_36}
          })
          repeat
            L1_36 = Fn_getPcPosRot()
            npc_pos = L2_32:getWorldPos()
            if 1 > Fn_get_distance(L1_36, npc_pos) then
              L3_33:pauseMove(true)
              L3_33:playMotion("surprise")
              L0_30:setCollisionName("barrel_kk_01")
              L0_30:requestBreak(L1_36, 1)
              repeat
                wait()
              until L3_33:isMotionEnd()
              L3_33:playMotion("talk_angry_00")
              repeat
                wait()
              until L3_33:isMotionEnd()
              L3_33:playMotion("stay_01")
              L0_35 = true
              break
            end
            wait()
          until L3_33:isMoveEnd()
        end
        if L0_35 ~= true then
          wait()
        end
      end
      if L0_35 == false then
        L1_36 = L3_33
        L1_36 = L1_36.playMotion
        L1_36(L1_36, "porter_stay")
      end
    end)
    Fn_pcSensorOff(A0_34)
  end
end
_po_a_02_navi = false
function pccubesensor2_po_a_02_OnEnter()
  if _po_a_02_navi == true then
    Fn_captionView("ep90_00785")
    Fn_naviKill()
    _po_a_02_navi = true
  end
end
function pccubesensor2_po_a_02_OnLeave()
  invokeTask(function()
    Fn_captionView("ep90_00786")
    waitSeconds(1)
    Fn_naviSet(findGameObject2("PlayerSensor", "pccubesensor2_po_a_02_in"))
    _po_a_02_navi = true
  end)
end
function get_find_range_cap(A0_37)
  if Fn_getPcPosRot().y < A0_37.y + 40 then
    if Fn_getPcPosRot().y < A0_37.y + 5 then
    elseif Fn_getPcPosRot().y < A0_37.y + 20 then
    else
    end
  end
  return "middle"
end
