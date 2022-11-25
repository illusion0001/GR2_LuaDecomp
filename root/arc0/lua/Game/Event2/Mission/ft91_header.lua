dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  if GameDatabase:get(ggd.Savedata__EventFlags__ep90__flag01) == 1 then
    Fn_captionViewWait("ep90_00010")
    Fn_captionViewWait("ep90_00020")
    GameDatabase:set(ggd.Savedata__EventFlags__ep90__flag01, 0)
  end
end
function Finalize()
  local L0_2, L1_3
end
