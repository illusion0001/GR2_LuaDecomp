import("Debug")
import("math")
import("common")
import("Player")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Event2/Mission/ep91_com_a.lua")
function _create_crow(A0_0)
  local L1_1
  if A0_0 == nil then
    L1_1 = Supporter
    L1_1 = L1_1.FirstAction
    A0_0 = L1_1.Ground
  end
  L1_1 = Vector
  L1_1 = L1_1(-16, 0.06, 16)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  return (Supporter.Spawner.create_supporter_crow(L1_1, nil, false, A0_0))
end
function _create_raven()
  local L0_2
  L0_2 = Vector
  L0_2 = L0_2(-16, 0.06, 16)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  return (Supporter.Spawner.create_supporter_raven(L0_2))
end
function _create_cat()
  local L0_3
  L0_3 = Vector
  L0_3 = L0_3(-16, 0.06, 16)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  return (Supporter.Spawner.create_supporter_cat(L0_3))
end
function _create_grabed_object()
  local L0_4
  L0_4 = Vector
  L0_4 = L0_4(-16, 0.06, 30)
  createGameObject2("GimmickBg"):setDrawModelName("barrel_kk_01")
  createGameObject2("GimmickBg"):setCollisionName("barrel_kk_01")
  createGameObject2("GimmickBg"):setAttributeName("barrel_kk_01")
  createGameObject2("GimmickBg"):setPos(L0_4)
  createGameObject2("GimmickBg"):setAutoRestore(5)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  return (createGameObject2("GimmickBg"))
end
function _create_grabed_object(A0_5)
  createGameObject2("GimmickBg"):setDrawModelName("barrel_kk_01")
  createGameObject2("GimmickBg"):setCollisionName("barrel_kk_01")
  createGameObject2("GimmickBg"):setAttributeName("barrel_kk_01")
  createGameObject2("GimmickBg"):setPos(A0_5)
  createGameObject2("GimmickBg"):setAutoRestore(5)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  return (createGameObject2("GimmickBg"))
end
function Supporter.Common.Cat()
  local L0_6, L1_7
  L0_6 = {}
  L1_7 = {}
  L1_7.kNon = 0
  L1_7.kIdling = 1
  L0_6.state = L1_7
  L0_6.currentState = nil
  L0_6.puppet = nil
  L0_6.brain = nil
  L0_6.cnt = 0
  function L1_7(A0_8)
    puppet = _create_cat()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 500
    currentState = A0_8.state.kNon
  end
  L0_6.init = L1_7
  function L1_7(A0_9)
    local L1_10
    L1_10 = cnt
    if L1_10 > max_cnt then
      L1_10 = brain
      if L1_10 ~= nil then
        cnt = 0
      end
    end
    L1_10 = cnt
    L1_10 = L1_10 + 1
    cnt = L1_10
    L1_10 = cnt
    L1_10 = L1_10 % 10
    if L1_10 == 0 then
      L1_10 = print
      L1_10(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_6.step = L1_7
  function L1_7(A0_11)
    local L1_12
  end
  L0_6.term = L1_7
  return L0_6
end
function Supporter.Common.Raven()
  local L0_13, L1_14
  L0_13 = {}
  L1_14 = {}
  L1_14.kNon = 0
  L1_14.kIdling = 1
  L0_13.state = L1_14
  L0_13.currentState = nil
  L0_13.puppet = nil
  L0_13.brain = nil
  L0_13.cnt = 0
  function L1_14(A0_15)
    puppet = _create_raven()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 500
    currentState = A0_15.state.kNon
  end
  L0_13.init = L1_14
  function L1_14(A0_16)
    local L1_17
    L1_17 = cnt
    if L1_17 > max_cnt then
      L1_17 = brain
      if L1_17 ~= nil then
        cnt = 0
      end
    end
    L1_17 = cnt
    L1_17 = L1_17 + 1
    cnt = L1_17
    L1_17 = cnt
    L1_17 = L1_17 % 10
    if L1_17 == 0 then
      L1_17 = print
      L1_17(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_13.step = L1_14
  function L1_14(A0_18)
    local L1_19
  end
  L0_13.term = L1_14
  return L0_13
end
function Supporter.Common.Fatal()
  local L0_20, L1_21
  L0_20 = {}
  L1_21 = {}
  L1_21.kNon = 0
  L1_21.kFatal = 1
  L1_21.kContinue = 2
  L0_20.state = L1_21
  L0_20.currentState = nil
  L0_20.puppet = nil
  L0_20.brain = nil
  L0_20.cnt = 0
  function L1_21(A0_22)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 500
    currentState = A0_22.state.kNon
  end
  L0_20.init = L1_21
  function L1_21(A0_23)
    if cnt > max_cnt and brain ~= nil then
      if currentState == A0_23.state.kNon then
        print(string.format("requestFatal: ON, %d", cnt))
        brain:requestFatal(true)
        brain:setKeepDistanceOfFatal(10)
        currentState = A0_23.state.kContinue
      elseif currentState == A0_23.state.kFatal then
        print(string.format("requestFatal: OFF, %d", cnt))
        brain:requestFatal(false)
        currentState = A0_23.state.kNon
      end
      cnt = 0
    end
    cnt = cnt + 1
    if cnt % 10 == 0 then
      print(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_20.step = L1_21
  function L1_21(A0_24)
    local L1_25
  end
  L0_20.term = L1_21
  return L0_20
end
function Supporter.Common.Warp()
  local L0_26, L1_27
  L0_26 = {}
  L1_27 = {}
  L1_27.kNon = 0
  L1_27.kIdling = 1
  L0_26.state = L1_27
  L0_26.currentState = nil
  L0_26.puppet = nil
  L0_26.brain = nil
  L0_26.cnt = 0
  function L1_27(A0_28)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 500
    currentState = A0_28.state.kNon
  end
  L0_26.init = L1_27
  function L1_27(A0_29)
    if cnt > max_cnt and brain ~= nil then
      print(string.format("warp %d", cnt))
      brain:warp(pos)
      cnt = 0
    end
    cnt = cnt + 1
    if cnt % 10 == 0 then
      print(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_26.step = L1_27
  function L1_27(A0_30)
    local L1_31
  end
  L0_26.term = L1_27
  return L0_26
end
function Supporter.Common.Life()
  local L0_32, L1_33
  L0_32 = {}
  L1_33 = {}
  L1_33.kNon = 0
  L1_33.kIdling = 1
  L0_32.state = L1_33
  L0_32.currentState = nil
  L0_32.puppet = nil
  L0_32.brain = nil
  L0_32.cnt = 0
  L0_32.max_cnt = 50
  function L1_33(A0_34)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_34.state.kNon
  end
  L0_32.init = L1_33
  function L1_33(A0_35)
    local L1_36, L2_37
    L1_36 = cnt
    L2_37 = max_cnt
    if L1_36 > L2_37 then
      L1_36 = brain
      if L1_36 ~= nil then
        L1_36 = brain
        L2_37 = L1_36
        L1_36 = L1_36.getHealth
        L1_36 = L1_36(L2_37)
        L2_37 = brain
        L2_37 = L2_37.getMaxHealth
        L2_37 = L2_37(L2_37)
        print(string.format("health %d/%d\n", L1_36, L2_37))
        cnt = 0
      end
    end
    L1_36 = cnt
    L1_36 = L1_36 + 1
    cnt = L1_36
    L1_36 = cnt
    L1_36 = L1_36 % 10
    if L1_36 == 0 then
      L1_36 = print
      L2_37 = string
      L2_37 = L2_37.format
      L2_37 = L2_37("%d/%d", cnt, currentState)
      L1_36(L2_37, L2_37("%d/%d", cnt, currentState))
    end
  end
  L0_32.step = L1_33
  function L1_33(A0_38)
    local L1_39
  end
  L0_32.term = L1_33
  return L0_32
end
function Supporter.Common.Motion()
  local L0_40, L1_41
  L0_40 = {}
  L1_41 = {}
  L1_41.kNon = 0
  L1_41.kIdling = 1
  L1_41.kPlayAnimStart = 10
  L1_41.kPlayAnimLoop = 11
  L1_41.kPlayAnimEnd = 12
  L1_41.kPlayAnimEndEnd = 13
  L0_40.state = L1_41
  L0_40.currentState = nil
  L0_40.puppet = nil
  L0_40.brain = nil
  L0_40.cnt = 0
  function L1_41(A0_42)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_42.state.kNon
  end
  L0_40.init = L1_41
  function L1_41(A0_43)
    if cnt > max_cnt then
      if currentState == A0_43.state.kNon then
        print(string.format("state.kNon %d/%d", cnt, currentState))
        brain:setIdling(true)
        brain:setActorMode(true)
        currentState = A0_43.state.kIdling
      elseif currentState == A0_43.state.kIdling then
        print(string.format("state.kIdling %d/%d", cnt, currentState))
        if brain:isIdling() then
          currentState = A0_43.state.kPlayAnimStart
        end
      elseif currentState == A0_43.state.kPlayAnimStart then
        print(string.format("state.kPlayAnimStart %d/%d", cnt, currentState))
        brain:playAnim("sp_mbh_start", 0.25, 0)
        currentState = A0_43.state.kPlayAnimLoop
      elseif currentState == A0_43.state.kPlayAnimLoop then
        print(string.format("state.kPlayAnimLoop %d/%d", cnt, currentState))
        if brain:isAnimEnd() then
          brain:playAnim("sp_mbh_loop", 0.25, 10)
          currentState = A0_43.state.kPlayAnimEnd
        end
      elseif currentState == A0_43.state.kPlayAnimEnd then
        print(string.format("state.kPlayAnimEnd %d/%d", cnt, currentState))
        if brain:isAnimEnd() then
          brain:playAnim("sp_mbh_end", 0.25)
          currentState = A0_43.state.kPlayAnimEndEnd
        end
      elseif currentState == A0_43.state.kPlayAnimEndEnd then
        print(string.format("state.kPlayAnimEndEnd %d/%d", cnt, currentState))
        if brain:isAnimEnd() then
          currentState = A0_43.state.kNon
          brain:setIdling(false)
          cnt = 0
        end
      end
    end
    cnt = cnt + 1
    if cnt % 10 == 0 then
      print(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_40.step = L1_41
  function L1_41(A0_44)
    local L1_45
  end
  L0_40.term = L1_41
  return L0_40
end
function Supporter.Common.MovePoint()
  local L0_46, L1_47
  L0_46 = {}
  L1_47 = {}
  L1_47.kNon = 0
  L1_47.kIdling = 1
  L1_47.kMovePointBuild = 20
  L1_47.kMovePointMoving = 21
  L1_47.kMovePointEnd = 22
  L0_46.state = L1_47
  L0_46.currentState = nil
  L0_46.puppet = nil
  L0_46.brain = nil
  L0_46.cnt = 0
  L0_46.toWalk = true
  L0_46.threat_object = nil
  function L1_47(A0_48)
    local L1_49
    L1_49 = _create_crow
    L1_49 = L1_49()
    puppet = L1_49
    L1_49 = puppet
    L1_49 = L1_49.getBrain
    L1_49 = L1_49(L1_49)
    brain = L1_49
    cnt = 0
    max_cnt = 50
    L1_49 = A0_48.state
    L1_49 = L1_49.kNon
    currentState = L1_49
    toWalk = true
    L1_49 = Vector
    L1_49 = L1_49(-16, 0.06, 30)
    threat_object = _create_grabed_object(L1_49)
    threat_object:setLockonPermission(true)
    brain:setSlopeDegreeToRevertGravityColor(120)
  end
  L0_46.init = L1_47
  function L1_47(A0_50)
    local L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57
    L1_51 = cnt
    L2_52 = max_cnt
    if L1_51 > L2_52 then
      L1_51 = currentState
      L2_52 = A0_50.state
      L2_52 = L2_52.kNon
      if L1_51 == L2_52 then
        L1_51 = print
        L2_52 = string
        L2_52 = L2_52.format
        L3_53 = "state.kNon %d/%d"
        L4_54 = cnt
        L5_55 = currentState
        L7_57 = L2_52(L3_53, L4_54, L5_55)
        L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
        L1_51 = brain
        L2_52 = L1_51
        L1_51 = L1_51.setIdling
        L3_53 = true
        L1_51(L2_52, L3_53)
        L1_51 = A0_50.state
        L1_51 = L1_51.kIdling
        currentState = L1_51
      else
        L1_51 = currentState
        L2_52 = A0_50.state
        L2_52 = L2_52.kIdling
        if L1_51 == L2_52 then
          L1_51 = print
          L2_52 = string
          L2_52 = L2_52.format
          L3_53 = "state.kIdling %d/%d"
          L4_54 = cnt
          L5_55 = currentState
          L7_57 = L2_52(L3_53, L4_54, L5_55)
          L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
          L1_51 = brain
          L2_52 = L1_51
          L1_51 = L1_51.isIdling
          L1_51 = L1_51(L2_52)
          if L1_51 then
            L1_51 = math
            L1_51 = L1_51.random
            L2_52 = 0.5
            L3_53 = 1
            L1_51 = L1_51(L2_52, L3_53)
            L2_52 = brain
            L3_53 = L2_52
            L2_52 = L2_52.setMoveVelocityRatio
            L4_54 = L1_51
            L5_55 = 0.5
            L2_52(L3_53, L4_54, L5_55)
            L2_52 = A0_50.state
            L2_52 = L2_52.kMovePointBuild
            currentState = L2_52
          end
        else
          L1_51 = currentState
          L2_52 = A0_50.state
          L2_52 = L2_52.kMovePointBuild
          if L1_51 == L2_52 then
            L1_51 = print
            L2_52 = string
            L2_52 = L2_52.format
            L3_53 = "state.kMovePointBuild %d/%d"
            L4_54 = cnt
            L5_55 = currentState
            L7_57 = L2_52(L3_53, L4_54, L5_55)
            L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
            L1_51 = GetPlayer
            L1_51 = L1_51()
            L2_52 = puppet
            L3_53 = L2_52
            L2_52 = L2_52.getPos
            L2_52 = L2_52(L3_53)
            L3_53 = Vector
            L4_54 = -10.589704
            L5_55 = 0.060002
            L6_56 = 32.115818
            L3_53 = L3_53(L4_54, L5_55, L6_56)
            L4_54 = Vector
            L5_55 = -9.634599
            L6_56 = 0.060001
            L7_57 = 45.572002
            L4_54 = L4_54(L5_55, L6_56, L7_57)
            L5_55 = Vector
            L6_56 = 7.787806
            L7_57 = 0.060004
            L5_55 = L5_55(L6_56, L7_57, 50.047348)
            L6_56 = Vector
            L7_57 = 5.752637
            L6_56 = L6_56(L7_57, 0.059999, 27.413406)
            L7_57 = toWalk
            if L7_57 then
              L7_57 = {
                {
                  pos = L2_52,
                  action = Supporter.MovePoint.Ground,
                  vel = 10
                },
                {
                  pos = L3_53,
                  action = Supporter.MovePoint.Ground,
                  vel = 10
                },
                {
                  pos = L3_53,
                  action = Supporter.MovePoint.Idle,
                  duration = 3
                },
                {
                  pos = L3_53,
                  action = Supporter.MovePoint.Turn,
                  node_lookat = L1_51,
                  duration = 1
                },
                {
                  pos = L3_53,
                  action = Supporter.MovePoint.Idle,
                  duration = 3
                }
              }
              brain:setMovePoints(L7_57)
            else
              L7_57 = {
                {
                  pos = L2_52,
                  action = Supporter.MovePoint.Takeoff,
                  vel = 10
                },
                {
                  pos = L2_52,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L3_53,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L4_54,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L4_54,
                  action = Supporter.MovePoint.Idle,
                  duration = 3
                },
                {
                  pos = L4_54,
                  action = Supporter.MovePoint.Turn,
                  node_lookat = L1_51,
                  duration = 1
                },
                {
                  pos = L4_54,
                  action = Supporter.MovePoint.Idle,
                  duration = 3
                },
                {
                  pos = L4_54,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L5_55,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L6_56,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L6_56,
                  action = Supporter.MovePoint.FallKick,
                  vel = 2,
                  target = threat_object
                },
                {
                  pos = L6_56,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L5_55,
                  action = Supporter.MovePoint.Air,
                  vel = 10
                },
                {
                  pos = L5_55,
                  action = Supporter.MovePoint.Alight,
                  vel = 10
                }
              }
              brain:setMovePoints(L7_57)
              toWalk = true
            end
            L7_57 = A0_50.state
            L7_57 = L7_57.kMovePointMoving
            currentState = L7_57
          else
            L1_51 = currentState
            L2_52 = A0_50.state
            L2_52 = L2_52.kMovePointMoving
            if L1_51 == L2_52 then
              L1_51 = print
              L2_52 = string
              L2_52 = L2_52.format
              L3_53 = "state.kMovePointMoving %d/%d"
              L4_54 = cnt
              L5_55 = currentState
              L7_57 = L2_52(L3_53, L4_54, L5_55)
              L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
              L1_51 = brain
              L2_52 = L1_51
              L1_51 = L1_51.startMovePoint
              L1_51(L2_52)
              L1_51 = A0_50.state
              L1_51 = L1_51.kMovePointEnd
              currentState = L1_51
            else
              L1_51 = currentState
              L2_52 = A0_50.state
              L2_52 = L2_52.kMovePointEnd
              if L1_51 == L2_52 then
                L1_51 = print
                L2_52 = string
                L2_52 = L2_52.format
                L3_53 = "state.kMovePointEnd %d/%d"
                L4_54 = cnt
                L5_55 = currentState
                L7_57 = L2_52(L3_53, L4_54, L5_55)
                L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
                L1_51 = brain
                L2_52 = L1_51
                L1_51 = L1_51.isMovePointEnd
                L1_51 = L1_51(L2_52)
                if L1_51 then
                  L1_51 = brain
                  L2_52 = L1_51
                  L1_51 = L1_51.clearMovePoint
                  L1_51(L2_52)
                  L1_51 = A0_50.state
                  L1_51 = L1_51.kNon
                  currentState = L1_51
                  L1_51 = brain
                  L2_52 = L1_51
                  L1_51 = L1_51.setIdling
                  L3_53 = false
                  L1_51(L2_52, L3_53)
                  L1_51 = brain
                  L2_52 = L1_51
                  L1_51 = L1_51.getGravityBulletCount
                  L1_51 = L1_51(L2_52)
                  L2_52 = print
                  L3_53 = "aaaaa"
                  L2_52(L3_53)
                  L2_52 = print
                  L3_53 = L1_51
                  L2_52(L3_53)
                  if L1_51 == 0 then
                    L2_52 = print
                    L3_53 = "bbbb"
                    L2_52(L3_53)
                    L2_52 = brain
                    L3_53 = L2_52
                    L2_52 = L2_52.releaseAllGravityBullets
                    L2_52(L3_53)
                  end
                end
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_51 = cnt
    L1_51 = L1_51 + 1
    cnt = L1_51
    L1_51 = cnt
    L1_51 = L1_51 % 10
    if L1_51 == 0 then
      L1_51 = print
      L2_52 = string
      L2_52 = L2_52.format
      L3_53 = "%d/%d"
      L4_54 = cnt
      L5_55 = currentState
      L7_57 = L2_52(L3_53, L4_54, L5_55)
      L1_51(L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L2_52(L3_53, L4_54, L5_55))
    end
  end
  L0_46.step = L1_47
  function L1_47(A0_58)
    local L1_59
  end
  L0_46.term = L1_47
  return L0_46
end
function Supporter.Common.Grab()
  local L0_60, L1_61
  L0_60 = {}
  L1_61 = {}
  L1_61.kNon = 0
  L1_61.kIdling = 1
  L1_61.kGrabStart = 30
  L1_61.kGrabLoop = 31
  L1_61.kGrabEnd = 32
  L0_60.state = L1_61
  L0_60.currentState = nil
  L0_60.puppet = nil
  L0_60.brain = nil
  L0_60.cnt = 0
  L0_60.grabed_object = nil
  function L1_61(A0_62)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_62.state.kNon
    grabed_object = _create_grabed_object()
  end
  L0_60.init = L1_61
  function L1_61(A0_63)
    local L1_64
    L1_64 = cnt
    if L1_64 > max_cnt then
      L1_64 = currentState
      if L1_64 == A0_63.state.kNon then
        L1_64 = print
        L1_64(string.format("state.kNon %d/%d", cnt, currentState))
        L1_64 = brain
        L1_64 = L1_64.setIdling
        L1_64(L1_64, true)
        L1_64 = A0_63.state
        L1_64 = L1_64.kIdling
        currentState = L1_64
      else
        L1_64 = currentState
        if L1_64 == A0_63.state.kIdling then
          L1_64 = print
          L1_64(string.format("state.kIdling %d/%d", cnt, currentState))
          L1_64 = brain
          L1_64 = L1_64.isIdling
          L1_64 = L1_64(L1_64)
          if L1_64 then
            L1_64 = A0_63.state
            L1_64 = L1_64.kGrabStart
            currentState = L1_64
          end
        else
          L1_64 = currentState
          if L1_64 == A0_63.state.kGrabStart then
            L1_64 = print
            L1_64(string.format("state.kGrabStart %d/%d", cnt, currentState))
            L1_64 = brain
            L1_64 = L1_64.grabAround
            L1_64(L1_64)
            L1_64 = A0_63.state
            L1_64 = L1_64.kGrabLoop
            currentState = L1_64
          else
            L1_64 = currentState
            if L1_64 == A0_63.state.kGrabLoop then
              L1_64 = print
              L1_64(string.format("state.kGrabLoop %d/%d", cnt, currentState))
              L1_64 = grabed_object
              L1_64 = L1_64.isGrabbed
              L1_64 = L1_64(L1_64)
              if L1_64 and not brain:isGrabOwner(grabed_object) == true then
                print("is grabbed player")
              elseif L1_64 and brain:isGrabOwner(grabed_object) then
                print("is grabbed crow")
              else
                print("not grabbed")
              end
              currentState = A0_63.state.kGrabEnd
            else
              L1_64 = currentState
              if L1_64 == A0_63.state.kGrabEnd then
                L1_64 = print
                L1_64(string.format("state.kGrabEnd %d/%d", cnt, currentState))
                L1_64 = grabed_object
                brain:releaseGrabObject(L1_64)
                currentState = A0_63.state.kNon
                brain:setIdling(false)
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_64 = cnt
    L1_64 = L1_64 + 1
    cnt = L1_64
    L1_64 = cnt
    L1_64 = L1_64 % 10
    if L1_64 == 0 then
      L1_64 = print
      L1_64(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_60.step = L1_61
  function L1_61(A0_65)
    local L1_66
  end
  L0_60.term = L1_61
  return L0_60
end
function Supporter.Common.Ability()
  local L0_67, L1_68
  L0_67 = {}
  L0_67.puppet = nil
  L0_67.brain = nil
  function L1_68(A0_69)
    local L1_70
    L1_70 = _create_crow
    L1_70 = L1_70()
    puppet = L1_70
    L1_70 = puppet
    L1_70 = L1_70.getBrain
    L1_70 = L1_70(L1_70)
    brain = L1_70
    L1_70 = false
    brain:setAbility(Supporter.Ability.Parallel.Normal, L1_70)
    brain:setAbility(Supporter.Ability.Parallel.Mars, L1_70)
    brain:setAbility(Supporter.Ability.Parallel.Jupiter, L1_70)
    brain:setAbility(Supporter.Ability.Parallel.NormalSp, L1_70)
    brain:setAbility(Supporter.Ability.Parallel.MarsSp, L1_70)
    brain:setAbility(Supporter.Ability.Parallel.JupiterSp, L1_70)
    brain:setAbility(Supporter.Ability.Avoid, L1_70)
    brain:getAbility(Supporter.Ability.Parallel.Normal)
    brain:getAbility(Supporter.Ability.Parallel.Mars)
    brain:setAbility(Supporter.Ability.Damaged, false)
    brain:setAbility(Supporter.Ability.Follow, false)
  end
  L0_67.init = L1_68
  function L1_68(A0_71)
    local L1_72
  end
  L0_67.step = L1_68
  function L1_68(A0_73)
    local L1_74
  end
  L0_67.term = L1_68
  return L0_67
end
function Supporter.Common.FirstAction()
  local L0_75, L1_76
  L0_75 = {}
  L0_75.puppet = nil
  L0_75.brain = nil
  function L1_76(A0_77)
    local L1_78
    L1_78 = Supporter
    L1_78 = L1_78.FirstAction
    L1_78 = L1_78.Air
    puppet = _create_crow(L1_78)
    brain = puppet:getBrain()
  end
  L0_75.init = L1_76
  function L1_76(A0_79)
    local L1_80
  end
  L0_75.step = L1_76
  function L1_76(A0_81)
    local L1_82
  end
  L0_75.term = L1_76
  return L0_75
end
function Supporter.Common.Threat()
  local L0_83, L1_84
  L0_83 = {}
  L1_84 = {}
  L1_84.kNon = 0
  L1_84.kIdling = 1
  L1_84.kStart = 30
  L1_84.kLoop = 31
  L1_84.kEnd = 32
  L0_83.state = L1_84
  L0_83.currentState = nil
  L0_83.puppet = nil
  L0_83.brain = nil
  L0_83.cnt = 0
  L0_83.threat_object = nil
  function L1_84(A0_85)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_85.state.kNon
    threat_object = _create_grabed_object()
    threat_object:setLockonPermission(true)
  end
  L0_83.init = L1_84
  function L1_84(A0_86)
    local L1_87, L2_88, L3_89
    L1_87 = cnt
    L2_88 = max_cnt
    if L1_87 > L2_88 then
      L1_87 = currentState
      L2_88 = A0_86.state
      L2_88 = L2_88.kNon
      if L1_87 == L2_88 then
        L1_87 = print
        L2_88 = string
        L2_88 = L2_88.format
        L3_89 = "state.kNon %d/%d"
        L3_89 = L2_88(L3_89, cnt, currentState)
        L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
        L1_87 = brain
        L2_88 = L1_87
        L1_87 = L1_87.setIdling
        L3_89 = true
        L1_87(L2_88, L3_89)
        L1_87 = A0_86.state
        L1_87 = L1_87.kIdling
        currentState = L1_87
      else
        L1_87 = currentState
        L2_88 = A0_86.state
        L2_88 = L2_88.kIdling
        if L1_87 == L2_88 then
          L1_87 = print
          L2_88 = string
          L2_88 = L2_88.format
          L3_89 = "state.kIdling %d/%d"
          L3_89 = L2_88(L3_89, cnt, currentState)
          L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
          L1_87 = brain
          L2_88 = L1_87
          L1_87 = L1_87.isIdling
          L1_87 = L1_87(L2_88)
          if L1_87 then
            L1_87 = A0_86.state
            L1_87 = L1_87.kStart
            currentState = L1_87
          end
        else
          L1_87 = currentState
          L2_88 = A0_86.state
          L2_88 = L2_88.kStart
          if L1_87 == L2_88 then
            L1_87 = print
            L2_88 = string
            L2_88 = L2_88.format
            L3_89 = "state.kStart %d/%d"
            L3_89 = L2_88(L3_89, cnt, currentState)
            L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
            L1_87 = brain
            L2_88 = L1_87
            L1_87 = L1_87.setIdling
            L3_89 = false
            L1_87(L2_88, L3_89)
            L1_87 = threat_object
            L2_88 = brain
            L3_89 = L2_88
            L2_88 = L2_88.setThreatObject
            L2_88 = L2_88(L3_89, L1_87)
            L3_89 = Supporter
            L3_89 = L3_89.AttackAction
            L3_89 = L3_89.Auto
            brain:setThreatObjectAttackType(L3_89)
            if L2_88 == true then
              max_cnt = 200
              currentState = A0_86.state.kLoop
            else
              max_cnt = 50
              currentState = A0_86.state.kNon
            end
          else
            L1_87 = currentState
            L2_88 = A0_86.state
            L2_88 = L2_88.kLoop
            if L1_87 == L2_88 then
              L1_87 = print
              L2_88 = string
              L2_88 = L2_88.format
              L3_89 = "state.kLoop %d/%d"
              L3_89 = L2_88(L3_89, cnt, currentState)
              L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
              L1_87 = A0_86.state
              L1_87 = L1_87.kEnd
              currentState = L1_87
              max_cnt = 50
            else
              L1_87 = currentState
              L2_88 = A0_86.state
              L2_88 = L2_88.kEnd
              if L1_87 == L2_88 then
                L1_87 = print
                L2_88 = string
                L2_88 = L2_88.format
                L3_89 = "state.kEnd %d/%d"
                L3_89 = L2_88(L3_89, cnt, currentState)
                L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
                L1_87 = brain
                L2_88 = L1_87
                L1_87 = L1_87.clearThreatObject
                L1_87(L2_88)
                L1_87 = A0_86.state
                L1_87 = L1_87.kNon
                currentState = L1_87
                L1_87 = brain
                L2_88 = L1_87
                L1_87 = L1_87.setIdling
                L3_89 = false
                L1_87(L2_88, L3_89)
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_87 = cnt
    L1_87 = L1_87 + 1
    cnt = L1_87
    L1_87 = cnt
    L1_87 = L1_87 % 10
    if L1_87 == 0 then
      L1_87 = print
      L2_88 = string
      L2_88 = L2_88.format
      L3_89 = "%d/%d"
      L3_89 = L2_88(L3_89, cnt, currentState)
      L1_87(L2_88, L3_89, L2_88(L3_89, cnt, currentState))
    end
  end
  L0_83.step = L1_84
  function L1_84(A0_90)
    local L1_91
  end
  L0_83.term = L1_84
  return L0_83
end
function Supporter.Common.Threats()
  local L0_92, L1_93
  L0_92 = {}
  L1_93 = {}
  L1_93.kNon = 0
  L1_93.kIdling = 1
  L1_93.kStart = 30
  L1_93.kLoop = 31
  L1_93.kEnd = 32
  L0_92.state = L1_93
  L0_92.currentState = nil
  L0_92.puppet = nil
  L0_92.brain = nil
  L0_92.cnt = 0
  L0_92.threat_objects = nil
  function L1_93(A0_94)
    local L1_95, L2_96, L3_97, L4_98, L5_99
    puppet = L1_95
    brain = L1_95
    cnt = 0
    max_cnt = 0
    currentState = L1_95
    threat_objects = L1_95
    threat_objects_num = 10
    for L4_98 = 0, threat_objects_num do
      L5_99 = _create_grabed_object
      L5_99 = L5_99()
      table.insert(threat_objects, L5_99)
      L5_99:setLockonPermission(true)
    end
  end
  L0_92.init = L1_93
  function L1_93(A0_100)
    local L1_101, L2_102
    L1_101 = cnt
    L2_102 = max_cnt
    if L1_101 > L2_102 then
      L1_101 = currentState
      L2_102 = A0_100.state
      L2_102 = L2_102.kNon
      if L1_101 == L2_102 then
        L1_101 = print
        L2_102 = string
        L2_102 = L2_102.format
        L2_102 = L2_102("state.kNon %d/%d", cnt, currentState)
        L1_101(L2_102, L2_102("state.kNon %d/%d", cnt, currentState))
        L1_101 = brain
        L2_102 = L1_101
        L1_101 = L1_101.setIdling
        L1_101(L2_102, true)
        L1_101 = A0_100.state
        L1_101 = L1_101.kIdling
        currentState = L1_101
      else
        L1_101 = currentState
        L2_102 = A0_100.state
        L2_102 = L2_102.kIdling
        if L1_101 == L2_102 then
          L1_101 = print
          L2_102 = string
          L2_102 = L2_102.format
          L2_102 = L2_102("state.kIdling %d/%d", cnt, currentState)
          L1_101(L2_102, L2_102("state.kIdling %d/%d", cnt, currentState))
          L1_101 = brain
          L2_102 = L1_101
          L1_101 = L1_101.isIdling
          L1_101 = L1_101(L2_102)
          if L1_101 then
            L1_101 = A0_100.state
            L1_101 = L1_101.kStart
            currentState = L1_101
          end
        else
          L1_101 = currentState
          L2_102 = A0_100.state
          L2_102 = L2_102.kStart
          if L1_101 == L2_102 then
            L1_101 = print
            L2_102 = string
            L2_102 = L2_102.format
            L2_102 = L2_102("state.kStart %d/%d", cnt, currentState)
            L1_101(L2_102, L2_102("state.kStart %d/%d", cnt, currentState))
            L1_101 = brain
            L2_102 = L1_101
            L1_101 = L1_101.setIdling
            L1_101(L2_102, false)
            L1_101 = brain
            L2_102 = L1_101
            L1_101 = L1_101.setThreatObjects
            L1_101 = L1_101(L2_102, threat_objects)
            L2_102 = Supporter
            L2_102 = L2_102.AttackAction
            L2_102 = L2_102.ComboOnGround
            brain:setThreatObjectAttackType(L2_102)
            brain:setAbility(Supporter.Ability.ActionInAir, false)
            if L1_101 == true then
              max_cnt = 5000
              currentState = A0_100.state.kLoop
            else
              max_cnt = 0
              currentState = A0_100.state.kNon
            end
          else
            L1_101 = currentState
            L2_102 = A0_100.state
            L2_102 = L2_102.kLoop
            if L1_101 == L2_102 then
              L1_101 = print
              L2_102 = string
              L2_102 = L2_102.format
              L2_102 = L2_102("state.kLoop %d/%d", cnt, currentState)
              L1_101(L2_102, L2_102("state.kLoop %d/%d", cnt, currentState))
              L1_101 = A0_100.state
              L1_101 = L1_101.kEnd
              currentState = L1_101
              max_cnt = 50
            else
              L1_101 = currentState
              L2_102 = A0_100.state
              L2_102 = L2_102.kEnd
              if L1_101 == L2_102 then
                L1_101 = print
                L2_102 = string
                L2_102 = L2_102.format
                L2_102 = L2_102("state.kEnd %d/%d", cnt, currentState)
                L1_101(L2_102, L2_102("state.kEnd %d/%d", cnt, currentState))
                L1_101 = brain
                L2_102 = L1_101
                L1_101 = L1_101.clearThreatObject
                L1_101(L2_102)
                L1_101 = A0_100.state
                L1_101 = L1_101.kNon
                currentState = L1_101
                L1_101 = brain
                L2_102 = L1_101
                L1_101 = L1_101.setIdling
                L1_101(L2_102, false)
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_101 = cnt
    L1_101 = L1_101 + 1
    cnt = L1_101
    L1_101 = cnt
    L1_101 = L1_101 % 10
    if L1_101 == 0 then
      L1_101 = print
      L2_102 = string
      L2_102 = L2_102.format
      L2_102 = L2_102("%d/%d", cnt, currentState)
      L1_101(L2_102, L2_102("%d/%d", cnt, currentState))
    end
  end
  L0_92.step = L1_93
  function L1_93(A0_103)
    local L1_104
  end
  L0_92.term = L1_93
  return L0_92
end
function Supporter.Common.Warp()
  local L0_105, L1_106
  L0_105 = {}
  L1_106 = {}
  L1_106.kNon = 0
  L1_106.kIdling = 1
  L1_106.kWarp = 2
  L0_105.state = L1_106
  L0_105.currentState = nil
  L0_105.puppet = nil
  L0_105.brain = nil
  L0_105.cnt = 0
  function L1_106(A0_107)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_107.state.kNon
  end
  L0_105.init = L1_106
  function L1_106(A0_108)
    local L1_109
    L1_109 = cnt
    if L1_109 > max_cnt then
      L1_109 = currentState
      if L1_109 == A0_108.state.kNon then
        L1_109 = print
        L1_109(string.format("state.kNon %d/%d", cnt, currentState))
        L1_109 = brain
        L1_109 = L1_109.setIdling
        L1_109(L1_109, true)
        L1_109 = A0_108.state
        L1_109 = L1_109.kIdling
        currentState = L1_109
      else
        L1_109 = currentState
        if L1_109 == A0_108.state.kIdling then
          L1_109 = print
          L1_109(string.format("state.kIdling %d/%d", cnt, currentState))
          L1_109 = brain
          L1_109 = L1_109.isIdling
          L1_109 = L1_109(L1_109)
          if L1_109 then
            L1_109 = A0_108.state
            L1_109 = L1_109.kWarp
            currentState = L1_109
          end
        else
          L1_109 = currentState
          if L1_109 == A0_108.state.kWarp then
            L1_109 = print
            L1_109(string.format("state.kWarp %d/%d", cnt, currentState))
            L1_109 = Vector
            L1_109 = L1_109(0, 0, 0)
            brain:warp(L1_109)
            currentState = A0_108.state.kNon
          end
        end
      end
      cnt = 0
    end
    L1_109 = cnt
    L1_109 = L1_109 + 1
    cnt = L1_109
    L1_109 = cnt
    L1_109 = L1_109 % 10
    if L1_109 == 0 then
      L1_109 = print
      L1_109(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_105.step = L1_106
  function L1_106(A0_110)
    local L1_111
  end
  L0_105.term = L1_106
  return L0_105
end
function Supporter.Common.Reset()
  local L0_112, L1_113
  L0_112 = {}
  L1_113 = {}
  L1_113.kNon = 0
  L1_113.kIdling = 1
  L1_113.kReset = 2
  L0_112.state = L1_113
  L0_112.currentState = nil
  L0_112.puppet = nil
  L0_112.brain = nil
  L0_112.cnt = 0
  function L1_113(A0_114)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_114.state.kNon
  end
  L0_112.init = L1_113
  function L1_113(A0_115)
    local L1_116, L2_117, L3_118, L4_119, L5_120
    L1_116 = cnt
    L2_117 = max_cnt
    if L1_116 > L2_117 then
      L1_116 = currentState
      L2_117 = A0_115.state
      L2_117 = L2_117.kNon
      if L1_116 == L2_117 then
        L1_116 = print
        L2_117 = string
        L2_117 = L2_117.format
        L3_118 = "state.kNon %d/%d"
        L4_119 = cnt
        L5_120 = currentState
        L5_120 = L2_117(L3_118, L4_119, L5_120)
        L1_116(L2_117, L3_118, L4_119, L5_120, L2_117(L3_118, L4_119, L5_120))
        L1_116 = brain
        L2_117 = L1_116
        L1_116 = L1_116.setIdling
        L3_118 = false
        L1_116(L2_117, L3_118)
        L1_116 = A0_115.state
        L1_116 = L1_116.kIdling
        currentState = L1_116
      else
        L1_116 = currentState
        L2_117 = A0_115.state
        L2_117 = L2_117.kIdling
        if L1_116 == L2_117 then
          L1_116 = print
          L2_117 = string
          L2_117 = L2_117.format
          L3_118 = "state.kIdling %d/%d"
          L4_119 = cnt
          L5_120 = currentState
          L5_120 = L2_117(L3_118, L4_119, L5_120)
          L1_116(L2_117, L3_118, L4_119, L5_120, L2_117(L3_118, L4_119, L5_120))
          L1_116 = A0_115.state
          L1_116 = L1_116.kReset
          currentState = L1_116
        else
          L1_116 = currentState
          L2_117 = A0_115.state
          L2_117 = L2_117.kReset
          if L1_116 == L2_117 then
            L1_116 = print
            L2_117 = string
            L2_117 = L2_117.format
            L3_118 = "state.kReset %d/%d"
            L4_119 = cnt
            L5_120 = currentState
            L5_120 = L2_117(L3_118, L4_119, L5_120)
            L1_116(L2_117, L3_118, L4_119, L5_120, L2_117(L3_118, L4_119, L5_120))
            L1_116 = {
              L2_117,
              L3_118,
              L4_119,
              [5] = L5_120(20, 0, 40)
            }
            L2_117 = Vector
            L3_118 = 0
            L4_119 = 0
            L5_120 = 0
            L2_117 = L2_117(L3_118, L4_119, L5_120)
            L3_118 = Vector
            L4_119 = 0
            L5_120 = 0
            L3_118 = L3_118(L4_119, L5_120, 40)
            L4_119 = Vector
            L5_120 = 20
            L4_119 = L4_119(L5_120, 0, 0)
            L5_120 = Vector
            L5_120 = L5_120(20, 0, 40)
            ;({
              L2_117,
              L3_118,
              L4_119,
              [5] = L5_120(20, 0, 40)
            })[4] = L5_120
            L2_117 = #L1_116
            L3_118 = math
            L3_118 = L3_118.random
            L4_119 = 1
            L5_120 = L2_117
            L3_118 = L3_118(L4_119, L5_120)
            L4_119 = L1_116[L3_118]
            L5_120 = YRotQuaternion
            L5_120 = L5_120(Deg2Rad(90))
            brain:reset(L4_119, L5_120)
            currentState = A0_115.state.kNon
          end
        end
      end
      cnt = 0
    end
    L1_116 = cnt
    L1_116 = L1_116 + 1
    cnt = L1_116
    L1_116 = cnt
    L1_116 = L1_116 % 10
    if L1_116 == 0 then
      L1_116 = print
      L2_117 = string
      L2_117 = L2_117.format
      L3_118 = "%d/%d"
      L4_119 = cnt
      L5_120 = currentState
      L5_120 = L2_117(L3_118, L4_119, L5_120)
      L1_116(L2_117, L3_118, L4_119, L5_120, L2_117(L3_118, L4_119, L5_120))
    end
  end
  L0_112.step = L1_113
  function L1_113(A0_121)
    local L1_122
  end
  L0_112.term = L1_113
  return L0_112
end
function Supporter.Common.SpAction()
  local L0_123, L1_124
  L0_123 = {}
  L1_124 = {}
  L1_124.kNon = 0
  L1_124.kIdling = 1
  L1_124.kStart = 30
  L1_124.kLoop = 31
  L1_124.kEnd = 32
  L0_123.state = L1_124
  L0_123.currentState = nil
  L0_123.puppet = nil
  L0_123.brain = nil
  L0_123.cnt = 0
  function L1_124(A0_125)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_125.state.kNon
  end
  L0_123.init = L1_124
  function L1_124(A0_126)
    local L1_127, L2_128, L3_129, L4_130, L5_131, L6_132, L7_133
    L1_127 = cnt
    L2_128 = max_cnt
    if L1_127 > L2_128 then
      L1_127 = currentState
      L2_128 = A0_126.state
      L2_128 = L2_128.kNon
      if L1_127 == L2_128 then
        L1_127 = print
        L2_128 = string
        L2_128 = L2_128.format
        L3_129 = "state.kNon %d/%d"
        L4_130 = cnt
        L5_131 = currentState
        L7_133 = L2_128(L3_129, L4_130, L5_131)
        L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
        L1_127 = A0_126.state
        L1_127 = L1_127.kIdling
        currentState = L1_127
      else
        L1_127 = currentState
        L2_128 = A0_126.state
        L2_128 = L2_128.kIdling
        if L1_127 == L2_128 then
          L1_127 = print
          L2_128 = string
          L2_128 = L2_128.format
          L3_129 = "state.kIdling %d/%d"
          L4_130 = cnt
          L5_131 = currentState
          L7_133 = L2_128(L3_129, L4_130, L5_131)
          L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
          L1_127 = A0_126.state
          L1_127 = L1_127.kStart
          currentState = L1_127
        else
          L1_127 = currentState
          L2_128 = A0_126.state
          L2_128 = L2_128.kStart
          if L1_127 == L2_128 then
            L1_127 = print
            L2_128 = string
            L2_128 = L2_128.format
            L3_129 = "state.kStart %d/%d"
            L4_130 = cnt
            L5_131 = currentState
            L7_133 = L2_128(L3_129, L4_130, L5_131)
            L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
            L1_127 = Vector
            L2_128 = -14
            L3_129 = 0.06
            L4_130 = 1.57
            L1_127 = L1_127(L2_128, L3_129, L4_130)
            L2_128 = Vector
            L3_129 = -14
            L4_130 = 0.06
            L5_131 = 3.57
            L2_128 = L2_128(L3_129, L4_130, L5_131)
            L3_129 = Vector
            L4_130 = -14
            L5_131 = 0.06
            L6_132 = 5.57
            L3_129 = L3_129(L4_130, L5_131, L6_132)
            L4_130 = _create_grabed_object
            L5_131 = L1_127
            L4_130 = L4_130(L5_131)
            L5_131 = _create_grabed_object
            L6_132 = L2_128
            L5_131 = L5_131(L6_132)
            L6_132 = _create_grabed_object
            L7_133 = L3_129
            L6_132 = L6_132(L7_133)
            L7_133 = L6_132.setLockonPermission
            L7_133(L6_132, true)
            L7_133 = L5_131.setLockonPermission
            L7_133(L5_131, true)
            L7_133 = L4_130.setLockonPermission
            L7_133(L4_130, true)
            L7_133 = {}
            L7_133.action = Supporter.SpAction.StayForPlayerAttackHit
            L7_133.target_type = Supporter.TargetType.NearPlayerLockonTarget
            L7_133.target_type = Supporter.TargetType.TargetTable
            L7_133.targets = {
              L4_130,
              L5_131,
              L6_132
            }
            L7_133.forced = true
            L7_133.power = 1000
            if brain:setSpAction(L7_133) == true then
              currentState = A0_126.state.kLoop
            else
              currentState = A0_126.state.kEnd
            end
          else
            L1_127 = currentState
            L2_128 = A0_126.state
            L2_128 = L2_128.kLoop
            if L1_127 == L2_128 then
              L1_127 = print
              L2_128 = string
              L2_128 = L2_128.format
              L3_129 = "state.kLoop %d/%d"
              L4_130 = cnt
              L5_131 = currentState
              L7_133 = L2_128(L3_129, L4_130, L5_131)
              L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
            else
              L1_127 = currentState
              L2_128 = A0_126.state
              L2_128 = L2_128.kEnd
              if L1_127 == L2_128 then
                L1_127 = print
                L2_128 = string
                L2_128 = L2_128.format
                L3_129 = "state.kEnd %d/%d"
                L4_130 = cnt
                L5_131 = currentState
                L7_133 = L2_128(L3_129, L4_130, L5_131)
                L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
                L1_127 = A0_126.state
                L1_127 = L1_127.kNon
                currentState = L1_127
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_127 = cnt
    L1_127 = L1_127 + 1
    cnt = L1_127
    L1_127 = cnt
    L1_127 = L1_127 % 10
    if L1_127 == 0 then
      L1_127 = print
      L2_128 = string
      L2_128 = L2_128.format
      L3_129 = "%d/%d"
      L4_130 = cnt
      L5_131 = currentState
      L7_133 = L2_128(L3_129, L4_130, L5_131)
      L1_127(L2_128, L3_129, L4_130, L5_131, L6_132, L7_133, L2_128(L3_129, L4_130, L5_131))
    end
  end
  L0_123.step = L1_124
  function L1_124(A0_134)
    local L1_135
  end
  L0_123.term = L1_124
  return L0_123
end
function Supporter.Common.NodeGraph()
  local L0_136, L1_137
  L0_136 = {}
  L1_137 = {}
  L1_137.kNon = 0
  L1_137.kIdling = 1
  L1_137.kGraph_Build = 2
  L1_137.kGraph_Move = 3
  L1_137.kGraph_End = 4
  L0_136.state = L1_137
  L0_136.currentState = nil
  L0_136.puppet = nil
  L0_136.brain = nil
  L0_136.cnt = 0
  function L1_137(A0_138)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_138.state.kNon
  end
  L0_136.init = L1_137
  function L1_137(A0_139)
    local L1_140, L2_141, L3_142, L4_143, L5_144, L6_145
    L1_140 = cnt
    L2_141 = max_cnt
    if L1_140 > L2_141 then
      L1_140 = currentState
      L2_141 = A0_139.state
      L2_141 = L2_141.kNon
      if L1_140 == L2_141 then
        L1_140 = print
        L2_141 = string
        L2_141 = L2_141.format
        L3_142 = "state.kNon %d/%d"
        L4_143 = cnt
        L5_144 = currentState
        L6_145 = L2_141(L3_142, L4_143, L5_144)
        L1_140(L2_141, L3_142, L4_143, L5_144, L6_145, L2_141(L3_142, L4_143, L5_144))
        L1_140 = brain
        L2_141 = L1_140
        L1_140 = L1_140.setIdling
        L3_142 = false
        L1_140(L2_141, L3_142)
        L1_140 = A0_139.state
        L1_140 = L1_140.kIdling
        currentState = L1_140
      else
        L1_140 = currentState
        L2_141 = A0_139.state
        L2_141 = L2_141.kIdling
        if L1_140 == L2_141 then
          L1_140 = print
          L2_141 = string
          L2_141 = L2_141.format
          L3_142 = "state.kIdling %d/%d"
          L4_143 = cnt
          L5_144 = currentState
          L6_145 = L2_141(L3_142, L4_143, L5_144)
          L1_140(L2_141, L3_142, L4_143, L5_144, L6_145, L2_141(L3_142, L4_143, L5_144))
          L1_140 = A0_139.state
          L1_140 = L1_140.kGraph_Build
          currentState = L1_140
        else
          L1_140 = currentState
          L2_141 = A0_139.state
          L2_141 = L2_141.kGraph_Build
          if L1_140 == L2_141 then
            L1_140 = print
            L2_141 = string
            L2_141 = L2_141.format
            L3_142 = "state.kGraph_Build %d/%d"
            L4_143 = cnt
            L5_144 = currentState
            L6_145 = L2_141(L3_142, L4_143, L5_144)
            L1_140(L2_141, L3_142, L4_143, L5_144, L6_145, L2_141(L3_142, L4_143, L5_144))
            L1_140 = puppet
            L2_141 = L1_140
            L1_140 = L1_140.getPos
            L1_140 = L1_140(L2_141)
            L2_141 = Vector
            L3_142 = -10.589704
            L4_143 = 0.060002
            L5_144 = 32.115818
            L2_141 = L2_141(L3_142, L4_143, L5_144)
            L3_142 = Vector
            L4_143 = -9.634599
            L5_144 = 0.060001
            L6_145 = 45.572002
            L3_142 = L3_142(L4_143, L5_144, L6_145)
            L4_143 = Vector
            L5_144 = 7.787806
            L6_145 = 0.060004
            L4_143 = L4_143(L5_144, L6_145, 50.047348)
            L5_144 = Vector
            L6_145 = 5.752637
            L5_144 = L5_144(L6_145, 0.059999, 27.413406)
            L6_145 = {
              {
                pos = L1_140,
                action = Supporter.Graph.Start
              },
              {pos = L2_141},
              {pos = L3_142},
              {pos = L4_143},
              {
                pos = L5_144,
                action = Supporter.Graph.Goal
              }
            }
            brain:setGraphNodes(L6_145)
            brain:startMoveGraph()
            currentState = A0_139.state.kGraph_Move
          else
            L1_140 = currentState
            L2_141 = A0_139.state
            L2_141 = L2_141.kGraph_Move
            if L1_140 == L2_141 then
              L1_140 = print
              L2_141 = string
              L2_141 = L2_141.format
              L3_142 = "state.kGraph_Move %d/%d"
              L4_143 = cnt
              L5_144 = currentState
              L6_145 = L2_141(L3_142, L4_143, L5_144)
              L1_140(L2_141, L3_142, L4_143, L5_144, L6_145, L2_141(L3_142, L4_143, L5_144))
              L1_140 = brain
              L2_141 = L1_140
              L1_140 = L1_140.isMoveGraphEnd
              L1_140 = L1_140(L2_141)
              if L1_140 then
                L1_140 = brain
                L2_141 = L1_140
                L1_140 = L1_140.clearGraphNodes
                L1_140(L2_141)
                L1_140 = brain
                L2_141 = L1_140
                L1_140 = L1_140.setIdling
                L3_142 = false
                L1_140(L2_141, L3_142)
                L1_140 = A0_139.state
                L1_140 = L1_140.kGraph_End
                currentState = L1_140
              end
              L1_140 = print
              L2_141 = "... moving"
              L1_140(L2_141)
            else
              L1_140 = currentState
              L2_141 = A0_139.state
              L2_141 = L2_141.kGraph_End
              if L1_140 == L2_141 then
                L1_140 = A0_139.state
                L1_140 = L1_140.kNon
                currentState = L1_140
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_140 = cnt
    L1_140 = L1_140 + 1
    cnt = L1_140
    L1_140 = cnt
    L1_140 = L1_140 % 10
    if L1_140 == 0 then
      L1_140 = print
      L2_141 = string
      L2_141 = L2_141.format
      L3_142 = "%d/%d"
      L4_143 = cnt
      L5_144 = currentState
      L6_145 = L2_141(L3_142, L4_143, L5_144)
      L1_140(L2_141, L3_142, L4_143, L5_144, L6_145, L2_141(L3_142, L4_143, L5_144))
    end
  end
  L0_136.step = L1_137
  function L1_137(A0_146)
    local L1_147
  end
  L0_136.term = L1_137
  return L0_136
end
function Supporter.Common.CreateGraph()
  local L0_148, L1_149
  L0_148 = {}
  L1_149 = {}
  L1_149.kNon = 0
  L1_149.kIdling = 1
  L1_149.kGraph_Build = 2
  L1_149.kGraph_Detect = 3
  L1_149.kGraph_Move = 4
  L1_149.kGraph_End = 5
  L0_148.state = L1_149
  L0_148.currentState = nil
  L0_148.puppet = nil
  L0_148.brain = nil
  L0_148.cnt = 0
  function L1_149(A0_150)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_150.state.kNon
  end
  L0_148.init = L1_149
  function L1_149(A0_151)
    local L1_152, L2_153
    L1_152 = cnt
    L2_153 = max_cnt
    if L1_152 > L2_153 then
      L1_152 = currentState
      L2_153 = A0_151.state
      L2_153 = L2_153.kNon
      if L1_152 == L2_153 then
        L1_152 = print
        L2_153 = string
        L2_153 = L2_153.format
        L2_153 = L2_153("state.kNon %d/%d", cnt, currentState)
        L1_152(L2_153, L2_153("state.kNon %d/%d", cnt, currentState))
        L1_152 = brain
        L2_153 = L1_152
        L1_152 = L1_152.setIdling
        L1_152(L2_153, false)
        L1_152 = A0_151.state
        L1_152 = L1_152.kIdling
        currentState = L1_152
      else
        L1_152 = currentState
        L2_153 = A0_151.state
        L2_153 = L2_153.kIdling
        if L1_152 == L2_153 then
          L1_152 = print
          L2_153 = string
          L2_153 = L2_153.format
          L2_153 = L2_153("state.kIdling %d/%d", cnt, currentState)
          L1_152(L2_153, L2_153("state.kIdling %d/%d", cnt, currentState))
          L1_152 = A0_151.state
          L1_152 = L1_152.kGraph_Build
          currentState = L1_152
        else
          L1_152 = currentState
          L2_153 = A0_151.state
          L2_153 = L2_153.kGraph_Build
          if L1_152 == L2_153 then
            L1_152 = print
            L2_153 = string
            L2_153 = L2_153.format
            L2_153 = L2_153("state.kGraph_Build %d/%d", cnt, currentState)
            L1_152(L2_153, L2_153("state.kGraph_Build %d/%d", cnt, currentState))
            L1_152 = {L2_153}
            L2_153 = {}
            L2_153.center = Vector(0, 0, 0)
            L2_153.hext = Vector(50, 50, 50)
            L2_153.edge_length = 10
            L2_153 = brain
            L2_153 = L2_153.createGraph
            L2_153(L2_153, L1_152)
            L2_153 = brain
            L2_153 = L2_153.buildMoveGraph2
            L2_153(L2_153)
            L2_153 = A0_151.state
            L2_153 = L2_153.kGraph_Detect
            currentState = L2_153
          else
            L1_152 = currentState
            L2_153 = A0_151.state
            L2_153 = L2_153.kGraph_Detect
            if L1_152 == L2_153 then
              L1_152 = GetPlayer
              L1_152 = L1_152()
              L2_153 = L1_152
              L1_152 = L1_152.getWorldPos
              L1_152 = L1_152(L2_153)
              L2_153 = {
                {
                  pos = puppet:getWorldPos(),
                  action = Supporter.Graph.Start
                },
                {
                  pos = L1_152,
                  action = Supporter.Graph.Goal
                }
              }
              brain:setGraphStartAndGoal(L2_153)
              if brain:detectMoveGraph2() then
                brain:startMoveGraph2()
                currentState = A0_151.state.kGraph_Move
              else
              end
            else
              L1_152 = currentState
              L2_153 = A0_151.state
              L2_153 = L2_153.kGraph_Move
              if L1_152 == L2_153 then
                L1_152 = print
                L2_153 = string
                L2_153 = L2_153.format
                L2_153 = L2_153("state.kGraph_Move %d/%d", cnt, currentState)
                L1_152(L2_153, L2_153("state.kGraph_Move %d/%d", cnt, currentState))
                L1_152 = brain
                L2_153 = L1_152
                L1_152 = L1_152.isMoveGraphEnd
                L1_152 = L1_152(L2_153)
                if L1_152 then
                  L1_152 = brain
                  L2_153 = L1_152
                  L1_152 = L1_152.setIdling
                  L1_152(L2_153, false)
                  L1_152 = A0_151.state
                  L1_152 = L1_152.kGraph_Detect
                  currentState = L1_152
                end
                L1_152 = print
                L2_153 = "... moving"
                L1_152(L2_153)
              else
                L1_152 = currentState
                L2_153 = A0_151.state
                L2_153 = L2_153.kGraph_End
                if L1_152 == L2_153 then
                  L1_152 = A0_151.state
                  L1_152 = L1_152.kNon
                  currentState = L1_152
                end
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_152 = cnt
    L1_152 = L1_152 + 1
    cnt = L1_152
    L1_152 = cnt
    L1_152 = L1_152 % 10
    if L1_152 == 0 then
      L1_152 = print
      L2_153 = string
      L2_153 = L2_153.format
      L2_153 = L2_153("%d/%d", cnt, currentState)
      L1_152(L2_153, L2_153("%d/%d", cnt, currentState))
    end
  end
  L0_148.step = L1_149
  function L1_149(A0_154)
    local L1_155
  end
  L0_148.term = L1_149
  return L0_148
end
function Supporter.Common.CreateGraph2()
  local L0_156, L1_157
  L0_156 = {}
  L1_157 = {}
  L1_157.kNon = 0
  L1_157.kIdling = 1
  L1_157.kGraph_Build = 2
  L1_157.kGraph_Detect = 3
  L1_157.kGraph_Move = 4
  L1_157.kGraph_End = 5
  L0_156.state = L1_157
  L0_156.currentState = nil
  L0_156.puppet = nil
  L0_156.brain = nil
  L0_156.cnt = 0
  function L1_157(A0_158)
    puppet = _create_crow()
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    currentState = A0_158.state.kNon
  end
  L0_156.init = L1_157
  function L1_157(A0_159)
    local L1_160, L2_161
    L1_160 = cnt
    L2_161 = max_cnt
    if L1_160 > L2_161 then
      L1_160 = currentState
      L2_161 = A0_159.state
      L2_161 = L2_161.kNon
      if L1_160 == L2_161 then
        L1_160 = print
        L2_161 = string
        L2_161 = L2_161.format
        L2_161 = L2_161("state.kNon %d/%d", cnt, currentState)
        L1_160(L2_161, L2_161("state.kNon %d/%d", cnt, currentState))
        L1_160 = brain
        L2_161 = L1_160
        L1_160 = L1_160.setIdling
        L1_160(L2_161, false)
        L1_160 = A0_159.state
        L1_160 = L1_160.kIdling
        currentState = L1_160
      else
        L1_160 = currentState
        L2_161 = A0_159.state
        L2_161 = L2_161.kIdling
        if L1_160 == L2_161 then
          L1_160 = print
          L2_161 = string
          L2_161 = L2_161.format
          L2_161 = L2_161("state.kIdling %d/%d", cnt, currentState)
          L1_160(L2_161, L2_161("state.kIdling %d/%d", cnt, currentState))
          L1_160 = A0_159.state
          L1_160 = L1_160.kGraph_Build
          currentState = L1_160
        else
          L1_160 = currentState
          L2_161 = A0_159.state
          L2_161 = L2_161.kGraph_Build
          if L1_160 == L2_161 then
            L1_160 = print
            L2_161 = string
            L2_161 = L2_161.format
            L2_161 = L2_161("state.kGraph_Build %d/%d", cnt, currentState)
            L1_160(L2_161, L2_161("state.kGraph_Build %d/%d", cnt, currentState))
            L1_160 = {L2_161}
            L2_161 = {}
            L2_161.center = Vector(0, 0, 0)
            L2_161.hext = Vector(10, 10, 10)
            L2_161.edge_length = 10
            L2_161 = createGameObject2
            L2_161 = L2_161("SupporterGraph")
            L2_161:setName("test_graph")
            initializeAllGameObjects()
            waitForReadyAllGameObjects()
            startAllGameObjects()
            brain:setGraph(L2_161)
            currentState = A0_159.state.kGraph_Detect
          else
            L1_160 = currentState
            L2_161 = A0_159.state
            L2_161 = L2_161.kGraph_Detect
            if L1_160 == L2_161 then
            else
              L1_160 = currentState
              L2_161 = A0_159.state
              L2_161 = L2_161.kGraph_Move
              if L1_160 == L2_161 then
                L1_160 = print
                L2_161 = string
                L2_161 = L2_161.format
                L2_161 = L2_161("state.kGraph_Move %d/%d", cnt, currentState)
                L1_160(L2_161, L2_161("state.kGraph_Move %d/%d", cnt, currentState))
                L1_160 = brain
                L2_161 = L1_160
                L1_160 = L1_160.isMoveGraphEnd
                L1_160 = L1_160(L2_161)
                if L1_160 then
                  L1_160 = brain
                  L2_161 = L1_160
                  L1_160 = L1_160.setIdling
                  L1_160(L2_161, false)
                  L1_160 = A0_159.state
                  L1_160 = L1_160.kGraph_Detect
                  currentState = L1_160
                end
                L1_160 = print
                L2_161 = "... moving"
                L1_160(L2_161)
              else
                L1_160 = currentState
                L2_161 = A0_159.state
                L2_161 = L2_161.kGraph_End
                if L1_160 == L2_161 then
                  L1_160 = A0_159.state
                  L1_160 = L1_160.kNon
                  currentState = L1_160
                end
              end
            end
          end
        end
      end
      cnt = 0
    end
    L1_160 = cnt
    L1_160 = L1_160 + 1
    cnt = L1_160
    L1_160 = cnt
    L1_160 = L1_160 % 10
    if L1_160 == 0 then
      L1_160 = print
      L2_161 = string
      L2_161 = L2_161.format
      L2_161 = L2_161("%d/%d", cnt, currentState)
      L1_160(L2_161, L2_161("%d/%d", cnt, currentState))
    end
  end
  L0_156.step = L1_157
  function L1_157(A0_162)
    local L1_163
  end
  L0_156.term = L1_157
  return L0_156
end
function Supporter.Common.CommonSpawn()
  local L0_164, L1_165
  L0_164 = {}
  L1_165 = {}
  L1_165.kNon = 0
  L0_164.state = L1_165
  L0_164.currentState = nil
  L0_164.gobj_node = nil
  L0_164.brain = nil
  L0_164.cnt = 0
  L0_164.gobj_node = nil
  function L1_165(A0_166)
    local L1_167, L2_168, L3_169, L4_170
    L1_167 = "test_node"
    L2_168 = createGameObject2
    L3_169 = "Node"
    L2_168 = L2_168(L3_169)
    gobj_node = L2_168
    L2_168 = gobj_node
    L3_169 = L2_168
    L2_168 = L2_168.setName
    L4_170 = "test_node"
    L2_168(L3_169, L4_170)
    L2_168 = Vector
    L3_169 = -16
    L4_170 = 0.06
    L2_168 = L2_168(L3_169, L4_170, 16)
    L3_169 = YRotQuaternion
    L4_170 = 0
    L3_169 = L3_169(L4_170)
    L4_170 = YRotQuaternion
    L4_170 = L4_170(Deg2Rad(90))
    gobj_node:setWorldTransform(L2_168, L4_170)
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
    puppet = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, L1_167)
    brain = puppet:getBrain()
    cnt = 0
    max_cnt = 50
    brain:setIdling(true)
    currentState = A0_166.state.kNon
  end
  L0_164.init = L1_165
  function L1_165(A0_171)
    local L1_172, L2_173
    L1_172 = gobj_node
    L2_173 = puppet
    if L1_172 then
      print("node :" .. tostring(L1_172:getWorldPos()))
    end
    if L2_173 then
      print("corw :" .. tostring(L2_173:getWorldPos()))
    end
    if cnt > max_cnt then
      cnt = 0
    end
    cnt = cnt + 1
    if cnt % 10 == 0 then
      print(string.format("%d/%d", cnt, currentState))
    end
  end
  L0_164.step = L1_165
  function L1_165(A0_174)
    local L1_175
  end
  L0_164.term = L1_165
  return L0_164
end
