dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_039"
_floor_num = 39
_gen_01 = nil
DROP_TALISMAN_MIN = 6
DROP_TALISMAN_MAX = 9
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "runner_rare_01",
      type = "runner_rare",
      locator = "locator_01"
    },
    {
      name = "runner_rare_02",
      type = "runner_rare",
      locator = "locator_02"
    },
    {
      name = "runner_rare_03",
      type = "runner_rare",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyNum = A0_0:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_2, A1_3)
    A0_2:getSpecTable().enemyNum = A0_2:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_4)
    if A0_4.enemyNum == 0 then
      return true
    end
    return false
  end
}
function InitializeBody()
  local L0_5, L1_6
end
function IngameBody()
  local L0_7
  L0_7 = Fn_missionStart
  L0_7()
  L0_7 = Fn_showMineName
  L0_7()
  L0_7 = Fn_userCtrlOn
  L0_7()
  L0_7 = Fn_getMine99FloorClear
  L0_7 = L0_7()
  if L0_7 then
    L0_7 = print
    L0_7("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    L0_7 = missionTextVisible
    L0_7(true)
    repeat
      L0_7 = wait
      L0_7()
      L0_7 = isLithographStart
      L0_7 = L0_7()
    until L0_7
    L0_7 = setFirstHalfProcessEnd
    L0_7()
    L0_7 = Fn_missionView
    L0_7("ic_pi_monument_obj_00390", 0, nil, true)
    L0_7 = findGameObject2
    L0_7 = L0_7("EnemyGenerator", "enmgen2_01")
    _gen_01 = L0_7
    L0_7 = _gen_01
    L0_7 = L0_7.requestSpawn
    L0_7(L0_7)
    repeat
      L0_7 = wait
      L0_7()
      L0_7 = isEnemyAllDead
      L0_7 = L0_7()
    until L0_7
    L0_7 = waitSeconds
    L0_7(2)
    L0_7 = Fn_missionInfoEnd
    L0_7()
    L0_7 = missionComplete
    L0_7()
    repeat
      L0_7 = wait
      L0_7()
      L0_7 = isSecondHalfProcessWait
      L0_7 = L0_7()
    until L0_7
    L0_7 = setSecondHalfProcessEnd
    L0_7()
    L0_7 = Fn_setMine99FloorClear
    L0_7()
    L0_7 = wait
    L0_7(20)
    L0_7 = math
    L0_7 = L0_7.random
    L0_7 = L0_7(DROP_TALISMAN_MIN, DROP_TALISMAN_MAX)
    for _FORV_4_ = 1, L0_7 do
      Fn_dropGraviryOre("locator2_goal_pos")
      wait(_FORV_4_ * 3)
    end
  end
  L0_7 = Fn_setGravityGateActive
  L0_7(true)
end
function FinalizeBody()
  local L0_8, L1_9
end
function isEnemyAllDead()
  if _gen_01 ~= nil and _gen_01:getEnemyCount() == 0 then
    return true
  end
  return false
end
