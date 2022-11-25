import("Font")
dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  debugTextDemo(true)
end
function Ingame()
  Fn_blackout(0)
  Fn_captionViewWait("\227\130\185\227\130\191\227\131\131\227\131\149\227\131\173\227\131\188\227\131\171", 5, 5, Font.kLayerFront)
  debugTextAdd("\230\156\172\231\183\168\227\129\171\227\129\164\227\129\170\227\129\140\227\130\139\227\130\168\227\131\148\227\130\189\227\131\188\227\131\137\227\130\146\229\134\153\231\156\159\227\129\167\232\166\139\227\129\155\227\130\139\239\188\136\227\130\175\227\131\173\227\130\166\227\129\140\233\137\132\228\187\174\233\157\162\227\130\146\227\130\130\227\130\137\227\129\134\229\160\180\233\157\162\227\129\170\227\129\169\239\188\137")
  waitSeconds(3)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_userCtrlOn()
end
