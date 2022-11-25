dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm34_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5
  if L0_2 == "ft14" then
    while true do
      L3_5 = 100
      if L0_2 == false then
        for L3_5 = 1, 30 do
          Fn_disappearNpc("passer_05_" .. string.format("%02d", L3_5))
        end
        L0_2(L1_3)
        break
      end
      L0_2(L1_3)
    end
    L0_2(L1_3, L2_4)
  end
end
function Finalize()
  Mob:restrict_sm34_00(false)
end
