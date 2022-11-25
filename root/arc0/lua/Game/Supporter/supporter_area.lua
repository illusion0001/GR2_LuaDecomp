import("math")
import("common")
Supporter.Area = {sm14_b = 0, sm14_c = 1}
function Supporter.Area.create_graphs(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L1_1 = {}
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = L6_6
    print(string.format("graph: name = %s", L6_6))
    if loadFileAsset("evd", L6_6) ~= nil then
      loadFileAsset("evd", L6_6):wait()
      createGameObject2("SupporterGraph"):setName("_graph_" .. L7_7)
      createGameObject2("SupporterGraph"):setDescription(loadFileAsset("evd", L6_6):getRoot())
      createGameObject2("SupporterGraph"):try_init()
      while not createGameObject2("SupporterGraph"):isReady() do
        wait()
      end
      createGameObject2("SupporterGraph"):try_start()
      L1_1[#L1_1 + 1] = createGameObject2("SupporterGraph")
    end
  end
  return L1_1
end
function Supporter.Area.create_graphs_to_supporter(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  L2_10 = nil
  L3_11 = print
  L3_11(L4_12)
  L3_11 = A1_9.clearGraph
  L3_11(L4_12)
  L3_11 = Supporter
  L3_11 = L3_11.Area
  L3_11 = L3_11.sm14_b
  if A0_8 == L3_11 then
    L3_11 = {}
    L3_11.use_graphs = L4_12
    L2_10 = L3_11
  else
    L3_11 = Supporter
    L3_11 = L3_11.Area
    L3_11 = L3_11.sm14_c
    if A0_8 == L3_11 then
      L3_11 = {}
      L7_15 = "supporter/Graph/pi_a_16_01"
      L8_16 = "supporter/Graph/pi_a_25"
      L9_17 = "supporter/Graph/pi_a_09_01"
      L3_11.use_graphs = L4_12
      L2_10 = L3_11
    else
      L3_11 = print
      L9_17 = L4_12(L5_13)
      L3_11(L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L4_12(L5_13))
    end
  end
  if L2_10 ~= nil then
    L3_11 = Supporter
    L3_11 = L3_11.Area
    L3_11 = L3_11.create_graphs
    L3_11 = L3_11(L4_12)
    for L7_15, L8_16 in L4_12(L5_13) do
      L9_17 = L8_16
      A1_9:addGraph(L9_17)
    end
    return L3_11
  end
end
function Supporter.Area.delete_graphs_to_supporter(A0_18)
  A0_18:clearGraph()
end
