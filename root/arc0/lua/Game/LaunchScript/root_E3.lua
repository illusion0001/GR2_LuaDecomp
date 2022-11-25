dofile("/Game/LaunchScript/root.lua")
import("Sound")
_tropyUpdate = false
_dlcCheak = false
_network = false
_do_cache = true
function setDebugFlags()
  GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, "ep80_re01")
  GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, "recoll")
  GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentEpisodeNum, 80)
  GameDatabase:set(ggd.Savedata__EventManageFlags__ClearEpisodeNum, 80)
  GameDatabase:set(ggd.Menu__ReturnTitleTime, 180)
  GameDatabase:set(ggd.Menu__AlwaysShowTitle, true)
  GameDatabase:set(ggd.Menu__LockCredit, true)
  GameDatabase:set(ggd.Menu__LockAllMap, true)
  GameDatabase:set(ggd.Menu__LockDustyTokenRanking, true)
  GameDatabase:set(ggd.Menu__LockNews, true)
  GameDatabase:set(ggd.Menu__TitleMovie, "ep00_00200m_e3,ep00_00300m,ep03_00300m,ep03_00400m,ep07_00400m,ep12_00400m")
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Map, true)
  GameDatabase:set(ggd.Debug__UserTest, false)
  GameDatabase:set(ggd.Debug__AutoSaveSkip, true)
  GameDatabase:set(ggd.Debug__PlayerLevel, true)
  Sound:loadResource("ep80_se")
  Sound:loadResource("ep07_se")
  return true
end
