dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_REMOVE_NPC_DISTANCE = 100
_turn_end_01 = false
_turn_end_02 = false
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_loadEventData
  L1_1 = "evx/sm21_c"
  L0_0(L1_1, {
    "evarea2_up_a_00"
  }, true)
  L0_0 = {}
  L0_0.photo = "wom01_photo_sm21_00"
  L1_1 = Fn_loadNpcEventMotion
  L1_1("gf01", L0_0)
  L1_1 = {}
  L1_1.laugh = "man01_talk_laugh_03"
  Fn_loadNpcEventMotion("sm21_client", L1_1)
end
function Ingame()
  local L0_2
  L0_2 = Fn_playNpcEventMotion
  L0_2("gf01", "wom01_photo_sm21_00", true, 0, false)
  function L0_2()
    waitSeconds(0.5)
    while Fn_moveNpc("bf01", {
      "locator2_bf_photo_03"
    }, {
      recast = true,
      navimesh = false,
      arrivedLength = 0
    }):isRunning() do
      wait()
    end
    while Fn_moveNpc("sm21_client", {
      "locator2_dad_photo_03"
    }, {
      recast = true,
      navimesh = false,
      arrivedLength = 0
    }):isRunning() do
      wait()
    end
    Fn_playLoopMotionRand("gf01", {"talk_01"}, 5, 10)
    invokeTask(function()
      waitSeconds(0.5)
      Fn_turnNpc("sm21_client", "locator2_bf_photo_03")
      Fn_playLoopMotionRand("sm21_client", {
        "man01_talk_laugh_03"
      }, 5, 10)
      _turn_end_01 = true
    end)
    invokeTask(function()
      Fn_turnNpc("bf01", "locator2_dad_photo_03")
      Fn_playLoopMotionRand("bf01", {
        "talk_laugh_02"
      }, 5, 10)
      _turn_end_02 = true
    end)
    while not _turn_end_01 or not _turn_end_02 do
      wait()
    end
    _turn_end_01 = false
    _turn_end_02 = false
  end
  L0_2()
  while true do
    if Fn_isValidNpc("sm21_client", 40) == false then
      Fn_disappearNpc("sm21_client")
      Fn_disappearNpc("bf01")
      Fn_disappearNpc("gf01")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_3, L1_4
end
