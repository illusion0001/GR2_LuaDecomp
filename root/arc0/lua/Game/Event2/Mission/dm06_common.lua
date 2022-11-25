local L1_1
function L0_0(A0_2)
  for _FORV_4_, _FORV_5_ in ipairs(A0_2:getSpecTable().spawnSet) do
    if findGameObject2("EnemyBrain", _FORV_5_.name) ~= nil then
      findGameObject2("EnemyBrain", _FORV_5_.name):setScriptAttackTarget(Fn_sendEventComSb("getActiveArk"))
    end
  end
end
setEnemyTarget = L0_0
function L0_0(A0_3)
  for _FORV_4_, _FORV_5_ in ipairs(A0_3:getSpecTable().spawnSet) do
    if findGameObject2("EnemyBrain", _FORV_5_.name) ~= nil then
      findGameObject2("EnemyBrain", _FORV_5_.name):setScriptAttackTarget()
    end
  end
end
resetEnemyTarget = L0_0
