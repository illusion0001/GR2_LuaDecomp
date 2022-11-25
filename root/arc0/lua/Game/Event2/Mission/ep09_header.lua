dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
enmgen = nil
enmbra = {}
_scPuppet = nil
_scBrain = nil
enmgen2_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator2_mechsmall_01",
      name = "soldier_01"
    },
    {
      type = "mechsmall",
      locator = "locator2_mechsmall_02",
      name = "soldier_02"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_01",
      name = "soldier_03"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_02",
      name = "soldier_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_01",
      name = "soldier_05",
      target_vehicle = "soldier_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_02",
      name = "soldier_06",
      target_vehicle = "soldier_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_03",
      name = "soldier_07",
      target_vehicle = "soldier_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_04",
      name = "soldier_08",
      target_vehicle = "soldier_04"
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  enmgen = L0_0
  if L0_0 ~= nil then
    L0_0(L1_1, L2_2)
    L0_0(L1_1, L2_2)
  end
  for L3_3 = 1, 8 do
    enmbra[L3_3] = findGameObject2("EnemyBrain", string.format("soldier_%02d", L3_3))
    if enmbra[L3_3] ~= nil then
      enmbra[L3_3]:setInvincibility(true)
      enmbra[L3_3]:setEnableTarget(false)
      enmbra[L3_3]:setEnableHomingTarget(false)
    end
  end
  L3_3 = ggd
  L3_3 = L3_3.Savedata__EventFlags__eps09__flag01
  L3_3 = Supporter
  L3_3 = L3_3.FirstAction
  L3_3 = L3_3.Ground
  _scPuppet = L1_1
  _scBrain = L1_1
  L3_3 = true
  L1_1(L2_2, L3_3)
  L3_3 = findGameObject2
  L3_3 = L3_3("Node", L0_0)
  L1_1(L2_2, L3_3, Supporter.FirstAction.Ground)
  L3_3 = Supporter
  L3_3 = L3_3.Ability
  L3_3 = L3_3.Avoid
  L1_1(L2_2, L3_3, false)
  L3_3 = Supporter
  L3_3 = L3_3.Ability
  L3_3 = L3_3.Damaged
  L1_1(L2_2, L3_3, false)
  L1_1()
end
function Ingame()
  while HUD:faderAlpha() > 0 or GameDatabase:get(ggd.GlobalSystemFlags__Demo) do
    wait()
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__eps09__flag01) == 0 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
    GameDatabase:set(ggd.Menu__TopBaloonDisp, false)
    waitSeconds(6)
    Fn_kaiwaDemoView("ft09_00010k")
    invokeTask(function()
      local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12
      L0_4 = _scBrain
      L1_5 = L0_4
      L0_4 = L0_4.setIdling
      L2_6 = false
      L0_4(L1_5, L2_6)
      L0_4 = _scBrain
      L1_5 = L0_4
      L0_4 = L0_4.unlockToWarp
      L0_4(L1_5)
      L0_4 = findGameObject2
      L1_5 = "Node"
      L2_6 = "locator2_crow_start_pos"
      L0_4 = L0_4(L1_5, L2_6)
      L1_5 = L0_4
      L0_4 = L0_4.getWorldPos
      L0_4 = L0_4(L1_5)
      L1_5 = findGameObject2
      L2_6 = "Node"
      L3_7 = "locator2_crow_move_pos_01"
      L1_5 = L1_5(L2_6, L3_7)
      L2_6 = L1_5
      L1_5 = L1_5.getWorldPos
      L1_5 = L1_5(L2_6)
      L2_6 = findGameObject2
      L3_7 = "Node"
      L4_8 = "locator2_crow_move_pos_02"
      L2_6 = L2_6(L3_7, L4_8)
      L3_7 = L2_6
      L2_6 = L2_6.getWorldPos
      L2_6 = L2_6(L3_7)
      L3_7 = findGameObject2
      L4_8 = "Node"
      L5_9 = "locator2_crow_move_pos_03"
      L3_7 = L3_7(L4_8, L5_9)
      L4_8 = L3_7
      L3_7 = L3_7.getWorldPos
      L3_7 = L3_7(L4_8)
      L4_8 = findGameObject2
      L5_9 = "Node"
      L6_10 = "locator2_crow_move_pos_04"
      L4_8 = L4_8(L5_9, L6_10)
      L5_9 = L4_8
      L4_8 = L4_8.getWorldPos
      L4_8 = L4_8(L5_9)
      L5_9 = findGameObject2
      L6_10 = "Node"
      L7_11 = "locator2_crow_move_pos_05"
      L5_9 = L5_9(L6_10, L7_11)
      L6_10 = L5_9
      L5_9 = L5_9.getWorldPos
      L5_9 = L5_9(L6_10)
      L6_10 = findGameObject2
      L7_11 = "Node"
      L8_12 = "locator2_crow_move_pos_06"
      L6_10 = L6_10(L7_11, L8_12)
      L7_11 = L6_10
      L6_10 = L6_10.getWorldPos
      L6_10 = L6_10(L7_11)
      L7_11 = findGameObject2
      L8_12 = "Node"
      L7_11 = L7_11(L8_12, "locator2_crow_move_pos_07")
      L8_12 = L7_11
      L7_11 = L7_11.getWorldPos
      L7_11 = L7_11(L8_12)
      L8_12 = {
        {
          pos = L0_4,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_4,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L1_5,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L2_6,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L3_7,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L4_8,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L5_9,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L6_10,
          action = Supporter.MovePoint.Air,
          vel = 30
        },
        {
          pos = L7_11,
          action = Supporter.MovePoint.Alight
        }
      }
      _scBrain:setMovePoints(L8_12)
      _scBrain:startMovePoint()
      while true do
        if _scBrain:isMovePointEnd() then
          _scBrain:clearMovePoint()
          _scBrain:setIdling(true)
          _scBrain:lockToWarp(findGameObject2("Node", "locator2_crow_move_pos_07"), Supporter.FirstAction.Ground)
          break
        end
        wait()
      end
    end)
    Fn_captionView("ep09_00000")
    GameDatabase:set(ggd.Savedata__EventFlags__eps09__flag01, 1)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, true)
    GameDatabase:set(ggd.Menu__TopBaloonDisp, true)
    _autoSaveReq()
  end
  Fn_userCtrlOn()
end
function Finalize()
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
  end
end
