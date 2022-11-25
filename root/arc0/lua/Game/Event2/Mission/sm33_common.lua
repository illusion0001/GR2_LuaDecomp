local L1_1
function L0_0(A0_2, A1_3)
  npc_watch_node = createGameObject2("Node")
  npc_watch_node:setName(A0_2 .. "_watch_node")
  npc_watch_node:try_init()
  npc_watch_node:waitForReady()
  npc_watch_node:try_start()
  Fn_findNpcPuppet(A0_2):appendChild(npc_watch_node)
  npc_watch_node:setPos(A1_3)
  npc_watch_node:leaveFromParent(true)
  Fn_findNpc(A0_2):setSightParam({
    valid = true,
    target = npc_watch_node,
    watchTarget = true
  })
  return npc_watch_node
end
createNpcWatchNode = L0_0
_ed_a_root_hdl = nil
function L0_0()
  local L0_4, L1_5
  L0_4, L1_5 = nil, nil
  if _ed_a_root_hdl == nil then
    _ed_a_root_hdl = Fn_findAreaHandle("ed_a_root")
  end
  while true do
    while true do
      L0_4 = _ed_a_root_hdl:findChildNode("g1_fence_sk_06_01", true)
      if L0_4 == nil then
        wait()
      end
    end
  end
  while true do
    L1_5 = _ed_a_root_hdl:findChildNode("g1_fence_sk_06_02", true)
    if L1_5 == nil then
      wait()
    end
  end
  L0_4:setRot(XYZRotQuaternionEular(0, 152, 0))
  L1_5:setRot(XYZRotQuaternionEular(0, -28, 0))
  L0_4:setForceMove()
  L1_5:setForceMove()
  print("++++++++++++++++++++++++++++closeSchoolGates")
end
closeSchoolGates = L0_0
