dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5
  L0_2(L1_3)
  L0_2(L1_3)
  for L3_5 = 1, 8 do
    Fn_changeNpcToMob("sm15_extra_0" .. L3_5)
  end
  while true do
    if L0_2 == false then
      L0_2(L1_3)
      L0_2(L1_3)
      break
    end
    L0_2(L1_3)
  end
end
function Finalize()
  local L0_6, L1_7
end
