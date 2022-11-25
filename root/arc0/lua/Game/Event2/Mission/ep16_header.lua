dofile("/Game/Event2/Common/HeaderCommon.lua")
_npc_bulbosa = "eps16_bullbossa"
_npc_child = "eps16_child"
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4
  L0_2 = invokeTask
  function L1_3()
    local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10
    L0_5 = Fn_findNpc
    L1_6 = _npc_bulbosa
    L0_5 = L0_5(L1_6)
    L1_6 = Fn_findNpc
    L2_7 = _npc_child
    L1_6 = L1_6(L2_7)
    if L0_5 ~= nil and L1_6 ~= nil then
      L2_7 = Fn_findNpcPuppet
      L3_8 = _npc_bulbosa
      L2_7 = L2_7(L3_8)
      L3_8 = Fn_findNpcPuppet
      L4_9 = _npc_child
      L3_8 = L3_8(L4_9)
      L4_9 = {}
      L4_9.anim_walk_speed = 1
      L4_9.arrivedLength = 0.1
      L5_10 = {}
      L5_10.anim_walk_speed = 1
      L5_10.arrivedLength = 0.1
      L5_10.runLength = -1
      while invokeTask(function()
        local L0_11
        L0_11 = {
          {
            pos = "locator2_Bulbosa_02",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_03",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_04",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_05",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_11, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end) ~= nil and invokeTask(function()
        local L0_12
        L0_12 = {
          {
            pos = "locator2_Bulbosa_02",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_03",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_04",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_05",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_12, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end):isRunning() or invokeTask(function()
        local L0_13, L1_14
        L0_13 = {
          L1_14,
          {
            pos = "locator2_child_03",
            opt = nil
          }
        }
        L1_14 = {}
        L1_14.pos = "locator2_child_02"
        L1_14.opt = nil
        L1_14 = Fn_moveNpc
        L1_14(_npc_child, L0_13, {arrivedLength = 0.1})
        while true do
          L1_14 = L1_6
          L1_14 = L1_14.isMoveEnd
          L1_14 = L1_14(L1_14)
          if not L1_14 then
            L1_14 = wait
            L1_14()
          end
        end
        L1_14 = wait
        L1_14()
        L1_14 = {
          {
            pos = "locator2_child_04",
            opt = nil
          },
          {
            pos = "locator2_child_05",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L1_14, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_05")
      end) ~= nil and invokeTask(function()
        local L0_15, L1_16
        L0_15 = {
          L1_16,
          {
            pos = "locator2_child_03",
            opt = nil
          }
        }
        L1_16 = {}
        L1_16.pos = "locator2_child_02"
        L1_16.opt = nil
        L1_16 = Fn_moveNpc
        L1_16(_npc_child, L0_15, {arrivedLength = 0.1})
        while true do
          L1_16 = L1_6
          L1_16 = L1_16.isMoveEnd
          L1_16 = L1_16(L1_16)
          if not L1_16 then
            L1_16 = wait
            L1_16()
          end
        end
        L1_16 = wait
        L1_16()
        L1_16 = {
          {
            pos = "locator2_child_04",
            opt = nil
          },
          {
            pos = "locator2_child_05",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L1_16, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_05")
      end):isRunning() do
        wait()
      end
      while invokeTask(function()
        local L0_17
        L0_17 = {
          {
            pos = "locator2_Bulbosa_06",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_17, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end) ~= nil and invokeTask(function()
        local L0_18
        L0_18 = {
          {
            pos = "locator2_Bulbosa_06",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_18, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end):isRunning() or invokeTask(function()
        local L0_19
        L0_19 = {
          {
            pos = "locator2_child_06",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L0_19, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_06")
      end) ~= nil and invokeTask(function()
        local L0_20
        L0_20 = {
          {
            pos = "locator2_child_06",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L0_20, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_06")
      end):isRunning() do
        wait()
      end
      while invokeTask(function()
        local L0_21
        L0_21 = {
          {
            pos = "locator2_Bulbosa_07",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_08",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_21, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end) ~= nil and invokeTask(function()
        local L0_22
        L0_22 = {
          {
            pos = "locator2_Bulbosa_07",
            opt = nil
          },
          {
            pos = "locator2_Bulbosa_08",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_bulbosa, L0_22, L4_9)
        while not L0_5:isMoveEnd() do
          wait()
        end
      end):isRunning() or invokeTask(function()
        local L0_23
        L0_23 = {
          {
            pos = "locator2_child_07",
            opt = nil
          },
          {
            pos = "locator2_child_08",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L0_23, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_08")
      end) ~= nil and invokeTask(function()
        local L0_24
        L0_24 = {
          {
            pos = "locator2_child_07",
            opt = nil
          },
          {
            pos = "locator2_child_08",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_child, L0_24, L5_10)
        while not L1_6:isMoveEnd() do
          wait()
        end
        wait()
        Fn_turnNpc(_npc_child, "locator2_Bulbosa_08")
      end):isRunning() do
        wait()
      end
      while invokeTask(function()
        Fn_turnNpc(_npc_bulbosa, L3_8)
        Fn_playMotionNpc(_npc_bulbosa, "talk_00", false, {isRepeat = true})
      end) ~= nil and invokeTask(function()
        Fn_turnNpc(_npc_bulbosa, L3_8)
        Fn_playMotionNpc(_npc_bulbosa, "talk_00", false, {isRepeat = true})
      end):isRunning() or invokeTask(function()
        Fn_turnNpc(_npc_child, L2_7)
        Fn_playMotionNpc(_npc_child, "talk_00", false, {isRepeat = true})
      end) ~= nil and invokeTask(function()
        Fn_turnNpc(_npc_child, L2_7)
        Fn_playMotionNpc(_npc_child, "talk_00", false, {isRepeat = true})
      end):isRunning() do
        wait()
      end
      while not true or not true do
        wait()
      end
      Fn_disappearNpc(_npc_bulbosa)
      Fn_disappearNpc(_npc_child)
    else
    end
  end
  L0_2(L1_3)
  L0_2 = Fn_findNpc
  L1_3 = "ep16_Adicca"
  L0_2 = L0_2(L1_3)
  repeat
    L1_3 = wait
    L1_3()
    L2_4 = L0_2
    L1_3 = L0_2.isReadyNpc
    L1_3 = L1_3(L2_4)
  until L1_3
  L1_3 = Fn_findNpcPuppet
  L2_4 = "ep16_Adicca"
  L1_3 = L1_3(L2_4)
  L2_4 = {}
  L2_4.base = L1_3
  L2_4.target = Fn_getPlayer()
  L2_4.angle = 15
  L2_4.dist = 15
  L2_4.size = 0.1
  while HUD:faderAlpha() > 0 do
    wait()
  end
  while true do
    if Fn_findNpcPuppet("ep16_Adicca") and (15 >= Fn_getDistanceToPlayer(L1_3) and Fn_isEyeSight(L2_4) == false or Fn_getDistanceToPlayer(L1_3) <= 2 and Fn_isEyeSight(L2_4) == false) then
      Fn_turnNpc("ep16_Adicca")
    end
    wait(10)
  end
end
function Finalize()
  local L0_25
  L0_25 = {
    "ep16_Adicca"
  }
  Fn_finalizeNpcKill("ep16", L0_25)
end
