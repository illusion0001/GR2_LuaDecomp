dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_findNpc
  L1_3 = "child_01"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpc
  L1_3 = L1_3("father_02")
  while true do
    if Fn_isValidNpc(L0_2) == false and Fn_isValidNpc(L1_3) == false then
      if invokeTask(function()
        Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_child_move_01"))
        while Fn_moveNpc(L0_2, {
          "locator2_child_move_01"
        }, {
          arrivedLength = 0,
          anim_walk_speed = 1.2,
          anim_speed_over = true
        }):isRunning() do
          wait()
        end
        Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_father_move_02"))
      end) ~= nil and invokeTask(function()
        Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_child_move_01"))
        while Fn_moveNpc(L0_2, {
          "locator2_child_move_01"
        }, {
          arrivedLength = 0,
          anim_walk_speed = 1.2,
          anim_speed_over = true
        }):isRunning() do
          wait()
        end
        Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_father_move_02"))
      end):isRunning() == true then
        invokeTask(function()
          Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_child_move_01"))
          while Fn_moveNpc(L0_2, {
            "locator2_child_move_01"
          }, {
            arrivedLength = 0,
            anim_walk_speed = 1.2,
            anim_speed_over = true
          }):isRunning() do
            wait()
          end
          Fn_turnNpc(L0_2, findGameObject2("Node", "locator2_father_move_02"))
        end):abort()
      end
      if invokeTask(function()
        local L0_4, L1_5
        L0_4 = Fn_playMotionNpc
        L1_5 = L1_3
        L0_4(L1_5, "greeting", true)
        L0_4 = Fn_turnNpc
        L1_5 = L1_3
        L0_4(L1_5, findGameObject2("Node", "locator2_father_move_01"))
        L0_4 = Fn_moveNpc
        L1_5 = L1_3
        L0_4 = L0_4(L1_5, {
          "locator2_father_move_01"
        }, {arrivedLength = 0})
        while true do
          L1_5 = L0_4.isRunning
          L1_5 = L1_5(L0_4)
          if L1_5 then
            L1_5 = wait
            L1_5()
          end
        end
        L1_5 = {
          "locator2_father_move_02",
          "locator2_father_move_03",
          "locator2_father_move_04",
          "locator2_father_move_05",
          "locator2_father_move_06"
        }
        L0_4 = Fn_moveNpc(L1_3, L1_5, {arrivedLength = 0.5, runLength = -1})
        while L0_4:isRunning() do
          wait()
        end
        Fn_turnNpc(L1_3, findGameObject2("Node", "locator2_shop"))
        Fn_playMotionNpc(L1_3, "lookaround_01", false)
      end) ~= nil and invokeTask(function()
        local L0_6, L1_7
        L0_6 = Fn_playMotionNpc
        L1_7 = L1_3
        L0_6(L1_7, "greeting", true)
        L0_6 = Fn_turnNpc
        L1_7 = L1_3
        L0_6(L1_7, findGameObject2("Node", "locator2_father_move_01"))
        L0_6 = Fn_moveNpc
        L1_7 = L1_3
        L0_6 = L0_6(L1_7, {
          "locator2_father_move_01"
        }, {arrivedLength = 0})
        while true do
          L1_7 = L0_6.isRunning
          L1_7 = L1_7(L0_6)
          if L1_7 then
            L1_7 = wait
            L1_7()
          end
        end
        L1_7 = {
          "locator2_father_move_02",
          "locator2_father_move_03",
          "locator2_father_move_04",
          "locator2_father_move_05",
          "locator2_father_move_06"
        }
        L0_6 = Fn_moveNpc(L1_3, L1_7, {arrivedLength = 0.5, runLength = -1})
        while L0_6:isRunning() do
          wait()
        end
        Fn_turnNpc(L1_3, findGameObject2("Node", "locator2_shop"))
        Fn_playMotionNpc(L1_3, "lookaround_01", false)
      end):isRunning() == true then
        invokeTask(function()
          local L0_8, L1_9
          L0_8 = Fn_playMotionNpc
          L1_9 = L1_3
          L0_8(L1_9, "greeting", true)
          L0_8 = Fn_turnNpc
          L1_9 = L1_3
          L0_8(L1_9, findGameObject2("Node", "locator2_father_move_01"))
          L0_8 = Fn_moveNpc
          L1_9 = L1_3
          L0_8 = L0_8(L1_9, {
            "locator2_father_move_01"
          }, {arrivedLength = 0})
          while true do
            L1_9 = L0_8.isRunning
            L1_9 = L1_9(L0_8)
            if L1_9 then
              L1_9 = wait
              L1_9()
            end
          end
          L1_9 = {
            "locator2_father_move_02",
            "locator2_father_move_03",
            "locator2_father_move_04",
            "locator2_father_move_05",
            "locator2_father_move_06"
          }
          L0_8 = Fn_moveNpc(L1_3, L1_9, {arrivedLength = 0.5, runLength = -1})
          while L0_8:isRunning() do
            wait()
          end
          Fn_turnNpc(L1_3, findGameObject2("Node", "locator2_shop"))
          Fn_playMotionNpc(L1_3, "lookaround_01", false)
        end):abort()
      end
      Fn_disappearNpc(L0_2)
      Fn_disappearNpc(L1_3)
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_10, L1_11
end
