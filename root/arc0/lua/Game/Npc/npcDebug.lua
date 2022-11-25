import("math")
import("Player")
dofile("/Game/Npc/npc.lua")
function npcDebug_createNpc()
  local L0_0, L1_1
  L0_0 = npcTable_getTable
  L0_0 = L0_0()
  L1_1 = nil
  for _FORV_5_ = 1, #L0_0 do
    Npc.Load(L0_0[_FORV_5_].npcName, L1_1, L0_0[_FORV_5_].pos, L0_0[_FORV_5_].rot, L0_0[_FORV_5_].label)
  end
  _FOR_()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function findBelongSandbox(A0_2)
  local L1_3
  L1_3 = g_own
  L1_3 = L1_3.getGameObject
  L1_3 = L1_3(L1_3, "mother2")
  for _FORV_5_ = 1, #A0_2 do
    L1_3 = L1_3:findGameObject2("Sandbox2", A0_2[_FORV_5_])
  end
  return L1_3
end
function npcDebug_init(A0_4)
  local L1_5
  L1_5 = Npc
  L1_5 = L1_5.FindNpc
  L1_5 = L1_5(A0_4)
  npcDebug_initScript(L1_5)
  L1_5 = nil
end
function npcDebug_initScript(A0_6)
  local L1_7
end
function npcDebug_testScript()
  invokeTask(function()
    Npc.FindNpc(npcTable_getTable()[1].npcName):pursue(Player:getPuppet():getPos(), 0.1, 4, 0)
  end)
end
