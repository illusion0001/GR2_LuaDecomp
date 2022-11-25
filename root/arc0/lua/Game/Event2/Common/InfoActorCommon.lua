import("GameDatabase")
import("Area")
function isMissionClear(A0_0)
  local L1_1, L2_2
  L1_1 = false
  L2_2 = ggd
  L2_2 = L2_2["Savedata__EventFinishedFlags__" .. A0_0]
  if L2_2 and GameDatabase:get(L2_2) == 1 then
    L1_1 = true
  end
  return L1_1
end
function isValidSpawnTrigger(A0_3)
  local L1_4
  L1_4 = true
  if A0_3 ~= "" and A0_3 ~= nil and isMissionClear(A0_3) == false then
    L1_4 = false
  end
  return L1_4
end
function isValidExclusionTrigger(A0_5)
  local L1_6
  L1_6 = true
  if A0_5 ~= "" and A0_5 ~= nil and isMissionClear(A0_5) == 1 then
    L1_6 = false
  end
  return L1_6
end
function isValidSpawnTerm(A0_7)
  for _FORV_6_, _FORV_7_ in pairs(A0_7) do
    if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentFreeMode) == _FORV_7_ then
      break
    end
  end
  return true
end
function isValidSpawnGameFlag(A0_8)
  local L1_9
  L1_9 = nil
  if A0_8 ~= "" and A0_8 ~= nil then
    L1_9 = GameDatabase:get(ggd["InfoActorFlags__" .. A0_8])
  end
  return L1_9
end
function isValidExclusionNPC(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17
  L1_11 = true
  L2_12 = mother2
  L2_12 = L2_12.findGameObject2
  L2_12 = L2_12(L3_13, L4_14, L5_15)
  if L2_12 ~= nil then
    for L6_16, L7_17 in L3_13(L4_14) do
      if L2_12:findGameObject2("NpcGenerator", L7_17) ~= nil then
        L1_11 = false
        break
      end
    end
  end
  return L1_11
end
function isValidEnableKaiwa(A0_18, A1_19)
  local L2_20
  L2_20 = true
  if A1_19 ~= "" and A1_19 ~= nil and GameDatabase:get(ggd[string.format("Savedata__InfoActor__kaiwa_%03d", A0_18)]) == true then
    L2_20 = false
  end
  return L2_20
end
function setEventManageFlags(A0_21)
  __exclusionFlag = A0_21
  GameDatabase:set(ggd.GlobalSystemFlags__ExclusionFlag, A0_21)
end
