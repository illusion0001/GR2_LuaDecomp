dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
function Initialize()
  local L0_0
  L0_0 = 1
  while findGameObject2("GimmickBg", "bg2_woodbox_" .. string.format("%02d", L0_0)) ~= nil do
    findGameObject2("GimmickBg", "bg2_woodbox_" .. string.format("%02d", L0_0)):setActive(false)
    do break end
    do break end
    L0_0 = L0_0 + 1
  end
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  local L0_1, L1_2
end
function sm40_findGameObject2(A0_3, A1_4)
  return findGameObject2(A0_3, A1_4)
end
