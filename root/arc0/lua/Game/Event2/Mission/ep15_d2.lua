dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
import("GameDatabase")
ORDER_START = 4
ORDER_END = 5
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_disappearNpc("ep15_pol_01", 0)
  Fn_missionStart()
  Fn_setBgmPoint("battle")
  Fn_userCtrlOn()
  if Fn_sendEventComSb("isMissionView") == false then
    if 0 < Player:getEnergy(Player.kEnergy_Life) then
      RAC_missionNaviCaption("ep15_03000", nil, "ep15_03005", nil, nil, RAC_NAVI_DELAY_DEFAULT + RAC_CAPTION_DELAY_DEFAULT)
    end
    Fn_sendEventComSb("setMissionView")
  else
    invokeTask(function()
      waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
      if Player:getEnergy(Player.kEnergy_Life) > 0 then
        Fn_captionView("ep15_03005")
      end
    end)
  end
  requestSection("msl_game_init")
  waitSection("msl_game_init")
  requestSection("msl_game_loop", ORDER_START, ORDER_END)
  waitSection("msl_game_loop")
  waitSeconds(3)
  if 0 < Player:getEnergy(Player.kEnergy_Life) then
    Fn_captionViewWait("ep15_03002")
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
