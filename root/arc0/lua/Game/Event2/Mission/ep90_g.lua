dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    "evarea2_po_a_02_common",
    "evarea2_po_a_04_common",
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_crow"
  }
  Fn_loadEventData("evx/ep90_common", L0_0)
  Fn_loadEventData("evx/ep90", {
    "evarea2_po_a_04"
  }, true)
  _sdemo = SDemo.create("ep90_g")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = Fn_warpNpc
  L1_2 = "vogo_01"
  L2_3 = "warppoint2_vogo_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_findNpc
  L1_2 = "vogo_01"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.playMotion
  L2_3 = "stay"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_spawnSuppotCrow
  L1_2 = false
  L2_3 = Supporter
  L2_3 = L2_3.FirstAction
  L2_3 = L2_3.Ground
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setEnergy
  L3_4 = Player
  L3_4 = L3_4.kEnergy_Life
  L4_5 = Player
  L5_6 = L4_5
  L4_5 = L4_5.getEnergyMax
  L6_7 = Player
  L6_7 = L6_7.kEnergy_Life
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = true
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_findNpc
  L2_3 = "vogo_01"
  L1_2 = L1_2(L2_3)
  L2_3 = {}
  L3_4 = 1
  while true do
    L4_5 = findGameObject2
    L5_6 = "Node"
    L6_7 = "locator2_man57_"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8(L8_9, L9_10)
    L6_7 = L6_7 .. L7_8
    L4_5 = L4_5(L5_6, L6_7)
    if L4_5 ~= nil then
      L5_6 = {}
      L6_7 = "man57_"
      L7_8 = string
      L7_8 = L7_8.format
      L7_8 = L7_8(L8_9, L9_10)
      L6_7 = L6_7 .. L7_8
      L5_6.name = L6_7
      L5_6.type = "man57"
      L6_7 = "locator2_man57_"
      L7_8 = string
      L7_8 = L7_8.format
      L7_8 = L7_8(L8_9, L9_10)
      L6_7 = L6_7 .. L7_8
      L5_6.node = L6_7
      L5_6.start = true
      L2_3[L3_4] = L5_6
    else
      break
    end
    L3_4 = L3_4 + 1
  end
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_cut_08_cam01"
  L7_8 = "locator2_cut_08_aim01"
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6)
  L4_5 = Fn_missionStart
  L4_5()
  L4_5 = 0
  while true do
    if L4_5 == 0 then
      L5_6 = Fn_setCatWarpCheckPoint
      L6_7 = "locator2_pc_start_pos"
      L5_6(L6_7)
      L5_6 = waitSeconds
      L6_7 = 1
      L5_6(L6_7)
      L5_6 = Fn_kaiwaDemoView
      L6_7 = "ep90_02000k"
      L5_6(L6_7)
      L5_6 = {}
      escape_tbl = L5_6
      L5_6 = 1
      while true do
        L6_7 = findGameObject2
        L7_8 = "Node"
        L6_7 = L6_7(L7_8, L8_9)
        if L6_7 ~= nil then
          L7_8 = escape_tbl
          L7_8[L5_6] = L8_9
        else
          break
        end
        L5_6 = L5_6 + 1
      end
      L6_7 = Fn_moveNpc
      L7_8 = "vogo_01"
      L9_10.arrivedLength = 5
      L9_10.runLength = -1
      L6_7 = L6_7(L7_8, L8_9, L9_10)
      L7_8 = _sdemo
      L7_8 = L7_8.play
      L10_11.time = 5
      L10_11.pos = "locator2_cut_08_cam02"
      L11_12.time = 5
      L11_12.pos = "locator2_cut_08_aim02"
      L7_8(L8_9, L9_10, L10_11)
      while true do
        while true do
          L7_8 = _sdemo
          L7_8 = L7_8.isPlay
          L7_8 = L7_8(L8_9)
          if L7_8 then
            L7_8 = wait
            L7_8()
          end
        end
      end
      while true do
        L7_8 = L6_7.isRunning
        L7_8 = L7_8(L8_9)
        if L7_8 then
          L7_8 = wait
          L7_8()
        end
      end
      L6_7 = nil
      L7_8 = Fn_setupNpc
      L7_8(L8_9)
      L7_8 = {}
      for L11_12, _FORV_12_ in L8_9(L9_10) do
        L7_8[L11_12] = createGameObject2("GimmickBg")
        L7_8[L11_12]:setDrawModelName("cigun02_base")
        L7_8[L11_12]:setName("cigun02" .. L11_12)
        Fn_attachJoint(L7_8[L11_12], Fn_findNpc(_FORV_12_.name):getPuppet(), "loc_r_hand")
      end
      L8_9()
      L8_9(L9_10, L10_11)
      L8_9(L9_10)
      L8_9()
      L11_12.arrivedLength = 0
      L11_12.runLength = -1
      L6_7 = L8_9
      L8_9(L9_10)
      L8_9(L9_10)
      L5_6 = 1
      while true do
        if L9_10 ~= nil then
          L8_9[L5_6] = L10_11
        else
          break
        end
        L5_6 = L5_6 + 1
      end
      L5_6 = 1
      while true do
        if L11_12 ~= nil then
          L9_10[L10_11] = Fn_moveNpc(L10_11, {
            L8_9[RandI(1, table.maxn(L8_9))]
          }, {
            arrivedLength = RandF(0, 5),
            runLength = 5
          })
        else
          break
        end
        wait()
        L5_6 = L5_6 + 1
      end
      L10_11(L11_12, nil, {
        {
          time = 2,
          pos = "locator2_cut_08_aim03"
        }
      })
      while true do
        if L10_11 then
          L10_11()
        end
      end
      L10_11(L11_12)
      L10_11(L11_12, nil, {
        {
          time = 1.5,
          pos = "locator2_cut_08_aim04"
        }
      })
      while true do
        if L10_11 then
          L10_11()
        end
      end
      L10_11(L11_12)
      L10_11(L11_12, nil, {
        {
          time = 1,
          pos = "locator2_cut_08_aim05"
        }
      })
      while true do
        if L10_11 then
          L10_11()
        end
      end
      for _FORV_13_, _FORV_14_ in L10_11(L11_12) do
        if _FORV_14_ ~= nil and _FORV_14_:isRunning() == true then
          _FORV_14_:abort()
        end
      end
      for _FORV_13_, _FORV_14_ in L10_11(L11_12) do
        Fn_disappearNpc(_FORV_14_.name)
      end
      for _FORV_13_, _FORV_14_ in L10_11(L11_12) do
        _FORV_14_:try_term()
      end
      L10_11(L11_12, 1)
      L10_11(L11_12)
      L10_11(L11_12)
      break
    else
    end
    L5_6 = wait
    L5_6()
  end
  L5_6 = Fn_setKeepPlayerPos
  L5_6()
  L5_6 = Fn_setNextMissionFlag
  L5_6()
  L5_6 = Fn_nextMission
  L5_6()
  L5_6 = Fn_exitSandbox
  L5_6()
end
function Finalize()
  local L0_13, L1_14
end
