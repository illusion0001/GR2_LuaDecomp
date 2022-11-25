import("Font")
dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  debugTextDemo(true)
end
function Ingame()
  Fn_missionStart()
  Fn_blackout(0)
  Fn_captionViewWait("dm03_00100c\239\188\154\227\130\168\227\131\148\227\130\189\227\131\188\227\131\137\227\130\191\227\130\164\227\131\136\227\131\171", 5, 5, Font.kLayerFront)
  debugTextAdd("\239\189\158\227\131\152\227\130\173\227\130\181\227\131\180\227\130\163\227\131\171\227\129\140\230\173\162\227\129\190\227\129\163\227\129\159\231\158\172\233\150\147\239\189\158")
  waitSeconds(3)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_userCtrlOn()
end
