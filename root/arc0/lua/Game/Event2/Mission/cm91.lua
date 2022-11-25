dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Share/em01.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = setLivestock
  L0_0()
  L0_0 = {}
  L0_0.key_guide = "ui_keyguide_ac_01"
  L0_0.ad_main = nil
  L0_0.ad_sub = "ui_acdialog_sub_01"
  L0_0.map_main = nil
  L0_0.map_sub = "ui_map_msinfo_header_01"
  cm91_sensor_hdl, cm91_marker_hdl, cm91_target_hdl = Fn_setSimpleMaker("locator2_pc_start_pos", L0_0, retry_func, retire_func, Vector(2, 4, 2))
  cm91_marker_hdl:setActive(false)
  cm91_sensor_hdl:setActive(false)
end
function Ingame()
  HUD:setMenuMissionCallback("retire_func", "retry_func")
  GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Challenge)
  GameDatabase:set(ggd.Menu__IsActiveCallback, true)
  Fn_missionStart()
  Fn_countDownWithTimer()
  Fn_userCtrlOn()
  runLivestock(true)
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  Fn_userCtrlOff()
  Fn_missionViewWait("cm91_00200")
  HUD:delMenuMissionCallback()
  Fn_blackout()
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_fadein()
  Fn_userCtrlOn()
  cm91_marker_hdl:setActive(true)
  cm91_sensor_hdl:setActive(true)
end
function retire_func()
  GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_blackout()
    Fn_resetPcPos("locator2_pc_restart_pos")
    Fn_setKeepPlayerPos()
    Fn_setNextMissionFlag(event_name)
    Fn_nextMission()
    Fn_exitSandbox()
  end)
end
function retry_func()
  GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
  GameDatabase:set(ggd.Menu__IsActiveCallback, false)
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_blackout()
    Fn_nextMission()
    Fn_exitSandbox()
  end)
end
function Finalize()
  endLivestock()
end
