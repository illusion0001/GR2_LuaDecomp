dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_loadEventData
  L0_0("evx/sm17_setup", {
    "evarea2_lo_a_07_19"
  }, true)
  L0_0 = Fn_createGimmickBg
  L0_0 = L0_0("locator2_box_header_01", "bag_01", "box_ms_02", false, "box_ms_02_event_01")
  Fn_createEffect("nasty_effect", "ef_ev_smk_05", L0_0, true)
end
function Ingame()
  local L0_1
  L0_1 = Fn_waitStartedNpc
  L0_1("sm17_client")
  L0_1 = {}
  L0_1.GROGGY_U_00 = "man01_groggy_u_00"
  L0_1.DOWN_B_00 = "man01_down_b_00"
  Fn_loadNpcEventMotion("sm17_client", L0_1)
  Fn_playMotionNpc("sm17_client", "man01_groggy_u_00", false, {isRandom = true, isRepeat = true})
  GameDatabase:set(ggd.EventFlags__sm17__flag01, 1)
  repeat
    if findGameObject2("GimmickBg", "bag_01"):isStarted() then
      findGameObject2("GimmickBg", "bag_01"):setMoveThreshold(0)
      break
    end
    wait()
  until false
end
function Finalize()
  local L0_2
  L0_2 = {
    "sm17_client"
  }
  Fn_finalizeNpcKill("sm17", L0_2)
end
