dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/ElektricityCommon.lua")
function Initialize()
  Fn_loadEventData("evx/dt_brk_eff_ep25", "evarea2_dt_a_root", true)
end
function Ingame()
  invokeTask(function()
    local L0_0, L1_1, L2_2, L3_3
    for L3_3 = 1, 24 do
      Fn_createEffect("exp", "ef_ev_smk_04", findGameObject2("Node", "locator2_smk_" .. string.format("%02d", L3_3)):getWorldPos(), false)
      if L3_3 % 5 == 0 then
        wait()
      end
    end
    for L3_3 = 1, 20 do
      Fn_createEffect("exp", "ef_ev_fir_04", findGameObject2("Node", "locator2_fir_" .. string.format("%02d", L3_3)):getWorldPos(), false)
      if L3_3 % 6 == 0 then
        wait()
      end
    end
  end)
  setMissile()
  respawnMissile()
  while true do
    wait()
  end
end
function Finalize()
  local L0_4, L1_5
end
