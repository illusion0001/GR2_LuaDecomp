dofile("/Game/Event2/Common/HeaderCommon.lua")
_cliant_name = "sm11_client"
_son_name = "sm11_son"
_son_mot = {
  sm11_talk = "man01_talk_sm11_00"
}
function Initialize()
  Fn_loadNpcEventMotion(_son_name, _son_mot)
end
function Ingame()
  local L0_0, L1_1
  L0_0 = Fn_findNpc
  L1_1 = _cliant_name
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_findNpc
  L1_1 = L1_1(_son_name)
  Fn_repeatPlayMotion(L1_1, "talk_01", {
    "talk_00",
    "talk_laugh_01"
  }, 10, 20)
  while true do
    if Fn_isValidNpc(_cliant_name) == false then
      Fn_disappearNpc(_cliant_name)
      Fn_disappearNpc(_son_name)
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
