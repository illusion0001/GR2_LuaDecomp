dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_crow_request = ""
_crow_node = ""
_crow_hdl = nil
_crow_task = nil
_mob_panic = false
function Initialize()
  Fn_loadEventData("evx/ep91_common", {
    "evarea2_po_a_01_crow",
    "evarea2_po_a_01_gem",
    "evarea2_po_a_04_gem"
  })
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
end
function Ingame()
  Debug:setValue({
    "Game Objects",
    "Mob",
    "Human",
    "m_footRaycastType"
  }, 1)
  Player:setPowerUpLevel(Player.kPowUpCateg_Base, 5)
  Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 5)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life), true)
  _crow_task = invokeTask(function()
    local L0_0
    repeat
      L0_0 = _crow_request
      if L0_0 == "spawn" then
        L0_0 = _crow_hdl
        if L0_0 == nil then
          L0_0 = Fn_spawnSuppotCrow
          L0_0 = L0_0(nil, Supporter.FirstAction.Ground, _crow_node)
          _crow_hdl = L0_0
        end
        _crow_request = ""
      else
        L0_0 = _crow_request
        if L0_0 == "spawn_mot" then
          L0_0 = _crow_hdl
          if L0_0 == nil then
            L0_0 = Fn_spawnSuppotCrow
            L0_0 = L0_0(nil, Supporter.FirstAction.Air, _crow_node)
            _crow_hdl = L0_0
            L0_0 = _crow_hdl
            L0_0 = L0_0.getBrain
            L0_0 = L0_0(L0_0)
            L0_0:setIdling(true)
            wait(2)
            _crow_hdl:setUseAnimLocomotion(true)
            _crow_hdl:loadPoseAnimation("crow_ep91_mot", "pgw2015_c_c01_cro01_c01", 0)
            while _crow_hdl:isPoseAnimationLoaded("crow_ep91_mot") == false do
              wait()
            end
          end
          _crow_request = ""
        else
          L0_0 = _crow_request
          if L0_0 == "kill" then
            L0_0 = _crow_hdl
            if L0_0 ~= nil then
              L0_0 = _crow_hdl
              L0_0 = L0_0.kill
              L0_0(L0_0)
              _crow_hdl = nil
            end
            _crow_request = ""
          else
            L0_0 = _crow_request
            if L0_0 == "move" then
              L0_0 = _crow_hdl
              if L0_0 ~= nil then
                L0_0 = {
                  {
                    pos = _crow_hdl:getWorldPos(),
                    action = Supporter.MovePoint.Takeoff,
                    vel = 25
                  },
                  {
                    pos = _crow_hdl:getWorldPos(),
                    action = Supporter.MovePoint.Air,
                    vel = 25
                  },
                  {
                    pos = findGameObject2("Node", "locator2_crow_route_01"):getWorldPos(),
                    action = Supporter.MovePoint.Air,
                    vel = 25
                  },
                  {
                    pos = findGameObject2("Node", "locator2_crow_route_02"):getWorldPos(),
                    action = Supporter.MovePoint.Air,
                    vel = 25
                  },
                  {
                    pos = findGameObject2("Node", "locator2_crow_route_03"):getWorldPos(),
                    action = Supporter.MovePoint.Air,
                    vel = 25
                  },
                  {
                    pos = findGameObject2("Node", "locator2_crow_route_03"):getWorldPos(),
                    action = Supporter.MovePoint.Landing,
                    vel = 25
                  }
                }
                _crow_hdl:getBrain():setMovePoints(L0_0)
                _crow_hdl:getBrain():startMovePoint()
                repeat
                  wait()
                until _crow_hdl:getBrain():isMovePointEnd()
                _crow_hdl:getBrain():clearMovePoint()
                _crow_hdl:getBrain():setIdling(true)
              end
              _crow_request = ""
            end
          end
        end
      end
      L0_0 = wait
      L0_0()
      L0_0 = false
    until L0_0
  end)
  repeat
    wait()
  until false
end
function Finalize()
  if _crow_hdl ~= nil then
    _crow_hdl:kill()
  end
  _crow_hdl = nil
  if _crow_task ~= nil and _crow_task:isRunning() == true then
    _crow_task:abort()
  end
  _crow_task = nil
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, false)
end
function setCrowSpawn(A0_1)
  local L1_2
  _crow_node = A0_1
  _crow_request = "spawn"
end
function setCrowSpawnMot(A0_3)
  local L1_4
  _crow_node = A0_3
  _crow_request = "spawn_mot"
end
function setCrowKill()
  local L0_5, L1_6
  _crow_request = "kill"
end
function setCrowMove()
  local L0_7, L1_8
  _crow_request = "move"
end
function getCrowRequest()
  local L0_9, L1_10
  L0_9 = _crow_request
  return L0_9
end
function getCrowBrain()
  return _crow_hdl:getBrain()
end
function getCrowPuppet()
  local L0_11, L1_12
  L0_11 = _crow_hdl
  return L0_11
end
function setActorModeGroundEnd()
  _crow_hdl:getBrain():setActorMode(false, Supporter.FirstAction.Ground)
end
function getMobPanic()
  local L0_13, L1_14
  L0_13 = _mob_panic
  return L0_13
end
function setMobPanic(A0_15)
  local L1_16
  _mob_panic = A0_15
end
