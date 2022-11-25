dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm26_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  while true do
    if Fn_isValidNpc("sm26_client", 50, 100) == false then
      for _FORV_3_, _FORV_4_ in pairs(_clear_line_up_chara_table) do
        Fn_disappearNpc(_FORV_4_.name)
      end
      Fn_disappearNpc("sm26_client")
      break
    end
    waitSeconds(1)
  end
  Mob:restrict_sm26_00(false)
end
function Finalize()
  Mob:restrict_sm26_00(false)
end
