dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  waitSeconds(8)
  Fn_tutorialCaption("map")
  _map_cap_pad = invokeTask(function()
    repeat
      wait()
    until Pad:getButton(Pad.kButton_LR)
    Fn_tutorialCaptionKill()
    _map_cap_timer:abort()
  end)
  _map_cap_timer = EventHelper:timerCallback("map caption", 5, function()
    Fn_tutorialCaptionKill()
    _map_cap_pad:abort()
  end)
end
function Finalize()
  local L0_2, L1_3
end
