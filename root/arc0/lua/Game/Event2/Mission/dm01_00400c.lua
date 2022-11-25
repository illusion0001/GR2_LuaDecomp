import("Font")
dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  debugTextDemo(true)
end
function Ingame()
  Fn_missionStart()
  Fn_blackout(0)
  Fn_captionViewWait("dm01_00400c\239\188\154\227\131\150\227\131\172\227\131\149\227\131\158\227\131\179\227\129\174\229\174\159\233\168\147\227\130\179\227\131\159\227\131\131\227\130\175\227\131\135\227\131\162", 5, 5, Font.kLayerFront)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_userCtrlOn()
end
