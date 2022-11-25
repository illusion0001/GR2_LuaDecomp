dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_loadEventData("evx/sm21_setup", {
    "evarea2_up_a_01"
  }, true)
  Fn_createGimmickBg("locator2_ship_pos_01", "merchant_ship_01", "car_pd_01", true):setVisibleBlockEnable(false)
  Fn_createGimmickBg("locator2_ship_pos_01", "merchant_ship_01", "car_pd_01", true):setVisible(true)
  Fn_waitStartedNpc("sm21_guid")
  Fn_waitStartedNpc("sm21_client")
  Fn_repeatPlayMotion("sm21_guid", "talk_00", {"talk_00"}, 1, 5)
  Fn_repeatPlayMotion("sm21_client", "talk_01", {"talk_01"}, 1, 5)
end
function Finalize()
  local L0_2
  L0_2 = {
    "sm21_guid",
    "sm21_client"
  }
  Fn_finalizeNpcKill("sm21", L0_2)
end
