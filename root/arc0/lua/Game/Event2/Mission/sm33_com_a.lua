dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Mob/mob_event_util.lua")
_retry_phase = false
function Initialize()
  Mob:restrictFromEnteringSchool(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  local L0_0, L1_1, L2_2
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictFromEnteringSchool
  L2_2 = false
  L0_0(L1_1, L2_2)
  _retry_phase = true
  L0_0 = print
  L1_1 = "\226\151\134\226\151\134_retry_phase = true!!!!!"
  L0_0(L1_1)
  L0_0 = Fn_findAreaHandle
  L1_1 = "ed_a_root"
  L0_0 = L0_0(L1_1)
  L1_1, L2_2 = nil, nil
  if L0_0 then
    L1_1 = L0_0:findChildNode("g1_fence_sk_06_01", true)
    if L1_1 then
      L1_1:setRot(Quaternion(0, -0.86, 0, 0.52))
      L1_1:setForceMove()
    end
    L2_2 = L0_0:findChildNode("g1_fence_sk_06_02", true)
    if L2_2 then
      L2_2:setRot(Quaternion(0, -0.86, 0, 0.52))
      L2_2:setForceMove()
    end
  end
end
function isRetryPhaseFlag()
  local L0_3, L1_4
  L0_3 = _retry_phase
  return L0_3
end
