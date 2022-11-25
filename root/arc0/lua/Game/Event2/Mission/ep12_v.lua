dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_boss = false
_puppet_crow = nil
_brain_crow = nil
_boss_hdl = nil
enmgen_pre_boss = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "ghostcity_eng_inact",
      locator = "locator_boss",
      name = "enm_boss",
      ai_spawn_option = "GhostcityEng/ghostcityeng_inact"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
    A0_6:setEnemyMarker(false)
    A0_6:requestIdlingEnemy(true)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_sendEventComSb("aisleMissionView")
  while _boss == false do
    wait()
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_boss_OnEnter()
  local L1_17
  L1_17 = _boss
  if L1_17 == false then
    _boss = true
  end
end
function Finalize()
  local L0_18, L1_19
end
