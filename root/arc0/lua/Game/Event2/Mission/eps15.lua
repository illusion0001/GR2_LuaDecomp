dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
function Initialize()
  Fn_userCtrlAllOff()
  _polydemo = PDemo.create("ep15_a_c01", Fn_findAreaHandle("cc_a_root"), {scene_param = false})
  HUD:furnitureReconfiguration("ft15")
end
function Ingame()
  Fn_setKittenAndCatActive(false)
  while _polydemo:isLoading() == false do
    wait()
  end
  _polydemo:switchCamera(true, 0)
  _polydemo:play("blackout")
  Fn_missionStart()
  Fn_kaiwaDemoView("eps15_00010k", nil, _polydemo.sehandle)
  while _polydemo:isEnd() == false do
    wait()
  end
  _polydemo:try_term()
  _polydemo = nil
  Fn_setKittenAndCatActive(true)
  wait(10)
  Fn_fadein()
  waitSeconds(1)
  RAC_infoView("eps15_info_01")
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
