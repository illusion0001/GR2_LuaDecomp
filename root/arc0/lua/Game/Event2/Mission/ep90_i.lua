dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    L1_1,
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_crow"
  }
  L1_1 = "evarea2_po_a_04_common"
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90_common", L0_0)
  L1_1 = {
    {
      name = "gull01",
      type = "gull01",
      node = "locator2_gull01",
      use_gravity = false,
      attach = false
    }
  }
  Fn_setupNpc(L1_1)
  _sdemo = SDemo.create("ep90_i")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11
  L0_2 = Fn_spawnSuppotCrow
  L1_3 = false
  L2_4 = Supporter
  L2_4 = L2_4.FirstAction
  L2_4 = L2_4.Ground
  L0_2 = L0_2(L1_3, L2_4)
  L1_3 = Fn_warpNpc
  L2_4 = "vogo_01"
  L3_5 = "warppoint2_vogo_01"
  L1_3(L2_4, L3_5)
  L1_3 = Fn_findNpc
  L2_4 = "vogo_01"
  L1_3 = L1_3(L2_4)
  L3_5 = L1_3
  L2_4 = L1_3.getPuppet
  L2_4 = L2_4(L3_5)
  L4_6 = L1_3
  L3_5 = L1_3.playMotion
  L5_7 = "hide_l_00"
  L3_5(L4_6, L5_7)
  L3_5 = createGameObject2
  L4_6 = "GimmickBg"
  L3_5 = L3_5(L4_6)
  L5_7 = L3_5
  L4_6 = L3_5.setDrawModelName
  L6_8 = "ciskewered01_base"
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setName
  L6_8 = "skewered01"
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setActive
  L6_8 = true
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.try_init
  L4_6(L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.waitForReady
  L4_6(L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.try_start
  L4_6(L5_7)
  L4_6 = Fn_findNpc
  L5_7 = "gull01"
  L4_6 = L4_6(L5_7)
  L6_8 = L4_6
  L5_7 = L4_6.getPuppet
  L5_7 = L5_7(L6_8)
  L6_8 = Fn_attachJoint
  L7_9 = L3_5
  L8_10 = L5_7
  L9_11 = "loc_ci00"
  L6_8(L7_9, L8_10, L9_11)
  L6_8 = _sdemo
  L7_9 = L6_8
  L6_8 = L6_8.set
  L8_10 = "locator2_cut_09_cam01"
  L9_11 = "locator2_cut_09_aim01"
  L6_8(L7_9, L8_10, L9_11, true)
  L6_8 = _sdemo
  L7_9 = L6_8
  L6_8 = L6_8.play
  L6_8(L7_9)
  L6_8 = Fn_missionStart
  L6_8()
  L6_8 = 0
  while true do
    if L6_8 == 0 then
      L7_9 = Fn_setCatWarpCheckPoint
      L8_10 = "locator2_pc_start_pos"
      L7_9(L8_10)
      L7_9 = waitSeconds
      L8_10 = 2
      L7_9(L8_10)
      L7_9 = _sdemo
      L8_10 = L7_9
      L7_9 = L7_9.play
      L9_11 = {
        {
          time = 3,
          pos = "locator2_cut_09_cam02"
        }
      }
      L7_9(L8_10, L9_11, {
        {
          time = 3,
          pos = "locator2_cut_09_aim02"
        }
      })
      while true do
        L7_9 = _sdemo
        L8_10 = L7_9
        L7_9 = L7_9.isPlay
        L7_9 = L7_9(L8_10)
        if L7_9 then
          L7_9 = wait
          L7_9()
        end
      end
      L7_9 = Fn_kaiwaDemoView
      L8_10 = "ep90_02040k"
      L7_9(L8_10)
      L7_9 = _sdemo
      L8_10 = L7_9
      L7_9 = L7_9.play
      L9_11 = {
        {
          time = 1,
          pos = "locator2_cut_10_cam01"
        }
      }
      L7_9(L8_10, L9_11, {
        {
          time = 1,
          pos = "locator2_cut_10_aim01"
        }
      })
      L7_9 = {L8_10, L9_11}
      L8_10 = {}
      L8_10.pos = "locator2_gull01"
      L8_10.attr = "fly"
      L9_11 = {}
      L9_11.pos = "locator2_gull01_lost_01"
      L9_11.attr = "land"
      L8_10 = invokeTask
      function L9_11()
        Fn_fly(L4_6, L7_9, {moveSpeed = 5, escape = false})
      end
      L8_10 = L8_10(L9_11)
      while true do
        L9_11 = _sdemo
        L9_11 = L9_11.isPlay
        L9_11 = L9_11(L9_11)
        if L9_11 then
          L9_11 = wait
          L9_11()
        end
      end
      L9_11 = _sdemo
      L9_11 = L9_11.play
      L9_11(L9_11, {
        {
          time = 5,
          pos = "locator2_cut_10_cam02"
        }
      }, {
        {
          time = 5,
          pos = "locator2_cut_10_aim02"
        }
      })
      L9_11 = waitSeconds
      L9_11(2)
      L9_11 = Sound
      L9_11 = L9_11.playSE
      L9_11(L9_11, "kit020b")
      L9_11 = Fn_captionView
      L9_11("ep90_02100")
      while true do
        while true do
          L9_11 = _sdemo
          L9_11 = L9_11.isPlay
          L9_11 = L9_11(L9_11)
          if L9_11 then
            L9_11 = wait
            L9_11()
          end
        end
      end
      while true do
        L9_11 = L8_10.isRunning
        L9_11 = L9_11(L8_10)
        if L9_11 then
          L9_11 = wait
          L9_11()
        end
      end
      L8_10 = nil
      L9_11 = {
        {
          pos = "locator2_gull01_lost_02",
          attr = "takeoff"
        },
        {
          pos = "locator2_gull01_lost_03",
          attr = "fly"
        },
        {
          pos = "locator2_gull01_lost_04",
          attr = "fly"
        }
      }
      L7_9 = L9_11
      L9_11 = invokeTask
      L9_11 = L9_11(function()
        Fn_fly(L4_6, L7_9, {moveSpeed = 12, escape = false})
      end)
      L8_10 = L9_11
      L9_11 = invokeTask
      L9_11(function()
        while L8_10:isRunning() do
          wait()
        end
        L8_10 = nil
        for _FORV_3_ = 1, 100 do
          L5_7:setAlpha(1 - _FORV_3_ / 100)
          wait()
        end
        _FOR_:setActive(false)
      end)
      L9_11 = waitSeconds
      L9_11(0.2)
      L9_11 = _sdemo
      L9_11 = L9_11.play
      L9_11(L9_11, {
        {
          time = 3,
          pos = "locator2_cut_10_cam03"
        }
      }, {
        {
          time = 3,
          pos = "locator2_cut_10_aim03"
        }
      })
      while true do
        L9_11 = _sdemo
        L9_11 = L9_11.isPlay
        L9_11 = L9_11(L9_11)
        if L9_11 then
          L9_11 = wait
          L9_11()
        end
      end
      L9_11 = _sdemo
      L9_11 = L9_11.set
      L9_11(L9_11)
      L9_11 = _sdemo
      L9_11 = L9_11.play
      L9_11(L9_11, nil, {
        {
          time = 2,
          pos = "locator2_cut_10_aim04"
        }
      })
      while true do
        L9_11 = _sdemo
        L9_11 = L9_11.isPlay
        L9_11 = L9_11(L9_11)
        if L9_11 then
          L9_11 = wait
          L9_11()
        end
      end
      L9_11 = Fn_warpNpc
      L9_11("vogo_01", "locator2_escape_vogo_start")
      L9_11 = Fn_resetPcPos
      L9_11("warppoint2_pc_01")
      L9_11 = _sdemo
      L9_11 = L9_11.play
      L9_11(L9_11, nil, {
        {
          time = 3,
          pos = "locator2_cut_10_aim05"
        }
      })
      L9_11 = {}
      escape_tbl = L9_11
      L9_11 = 1
      while findGameObject2("Node", "locator2_escape_vogo_" .. string.format("%02d", L9_11)) ~= nil do
        escape_tbl[L9_11] = findGameObject2("Node", "locator2_escape_vogo_" .. string.format("%02d", L9_11)):getName()
        do break end
        do break end
        L9_11 = L9_11 + 1
      end
      while _sdemo:isPlay() do
        wait()
      end
      Sound:playSE("kit051c")
      Fn_captionView("ep90_02110")
      _sdemo:stop(2)
      waitSeconds(2.5)
      Fn_kaiwaDemoView("ep90_02050k")
      Fn_blackout()
      if Fn_moveNpc("vogo_01", escape_tbl, {arrivedLength = 5, runLength = -1}):isRunning() == true then
        Fn_moveNpc("vogo_01", escape_tbl, {arrivedLength = 5, runLength = -1}):abort()
      end
      Fn_disappearNpc("vogo_01")
      break
    else
    end
    L7_9 = wait
    L7_9()
  end
  L7_9 = GameDatabase
  L8_10 = L7_9
  L7_9 = L7_9.set
  L9_11 = ggd
  L9_11 = L9_11.Savedata__EventFlags__ep90__flag01
  L7_9(L8_10, L9_11, 1)
  L7_9 = Fn_setKeepPlayerPos
  L7_9()
  L7_9 = Fn_setNextMissionFlag
  L7_9()
  L7_9 = Fn_nextMission
  L7_9()
  L7_9 = Fn_exitSandbox
  L7_9()
end
function Finalize()
  Fn_killNpcTask("vogo_01")
end
