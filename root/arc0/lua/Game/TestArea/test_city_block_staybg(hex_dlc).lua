import("GameDatabase")
GameDatabase:set(ggd.Debug__TitleSkip, true)
GameDatabase:set(ggd.Debug__StartMission, "city_block_hex_dlc")
GameDatabase:set(ggd.Debug__AreaDrift, false)
GameDatabase:set(ggd.Debug__PlayerStartPos, Vector(90, 51, 0))
GameDatabase:set(ggd.Debug__PlayerStartArea, "cc_b_root")
dofile("/Game/LaunchScript/root.lua")
