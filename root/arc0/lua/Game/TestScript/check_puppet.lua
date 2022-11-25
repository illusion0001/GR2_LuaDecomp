dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Table/TestPuppetTable.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L0_2 = {}
  for L4_6 = 1, 100 do
    L5_7 = findGameObject2
    L9_11 = "%02d"
    L10_12 = L4_6
    L5_7 = L5_7(L6_8, L7_9)
    if L5_7 ~= nil then
      L0_2[L4_6] = L5_7
    else
      break
    end
  end
  for L4_6, L5_7 in L1_3(L2_4) do
    for L9_11, L10_12 in L6_8(L7_9) do
      L11_13 = createGameObject2
      L12_14 = "Puppet"
      L11_13 = L11_13(L12_14)
      L12_14 = L10_12
      L12_14 = L12_14 .. "_base"
      L11_13:loadModel(L12_14, L12_14)
      L11_13:loadBaseSkeleton(L12_14, L12_14)
      L11_13:loadPoseAnimationSet(L4_6)
      L11_13:setEnableDebugDraw(true)
      L11_13:setPos(Vector(RandF(-2, 2), 0, RandF(-2, 2)))
      L11_13:setRot(YRotQuaternion(RandI(-180, 180)))
      idx = RandI(1, #L0_2)
      if L0_2[idx] ~= nil then
        L0_2[idx]:appendChild(L11_13)
      end
      while L11_13:isLoading() do
        wait()
      end
      L11_13:playPoseAnimation("stay")
    end
  end
  L1_3()
  L1_3()
end
function create_puppet_only(A0_15, A1_16)
  createGameObject2("Puppet"):setEnableDebugDraw(true)
  createGameObject2("Puppet"):setName(A0_15)
  loadFileAsset("evd", "CharDefs/npc/" .. A1_16):wait()
  createGameObject2("Puppet"):setDescription(loadFileAsset("evd", "CharDefs/npc/" .. A1_16):getRoot())
  createGameObject2("Puppet"):setVisible(true)
  return (createGameObject2("Puppet"))
end
function Finalize()
  local L0_17, L1_18
end
