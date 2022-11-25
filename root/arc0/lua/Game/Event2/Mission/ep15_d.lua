dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
import("GameDatabase")
ORDER_START = 1
ORDER_END = 3
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_disappearNpc("ep15_pol_01", 0)
  Fn_missionStart()
  Fn_setBgmPoint("battle")
  Fn_skipMissionRetryAtProcessing(function()
    requestSection("msl_sdemo")
    waitSection("msl_sdemo")
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
    Fn_resetPcPos("locator2_pc_start_pos")
    Fn_fadein()
  end)
  RAC_infoView("ep15_info_04")
  Player:setStay(false)
  Fn_userCtrlOn()
  RAC_missionNaviCaption("ep15_03000", nil, "ep15_03001", nil, nil, RAC_NAVI_DELAY_DEFAULT + RAC_CAPTION_DELAY_DEFAULT)
  Fn_sendEventComSb("setMissionView")
  requestSection("msl_game_init")
  waitSection("msl_game_init")
  requestSection("msl_game_loop", ORDER_START, ORDER_END)
  waitSection("msl_game_loop")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
