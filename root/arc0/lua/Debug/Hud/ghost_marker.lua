import("HUD")
import("GameDatabase")
import("Time")
import("Font")
import("EventData")
import("Replay")
import("Pad")
import("Player")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
function test_ghost_marker()
  local L0_0
  L0_0 = {
    {
      id = "q-c4a58f9f-JP-ja",
      asset = "ghost01",
      label = "Ghost:blue",
      color = HUD.kGhostColor_Blue
    },
    {
      id = "q-56f4249e-JP-ja",
      asset = "ghost02",
      label = "Ghost:green",
      color = HUD.kGhostColor_Green
    },
    {
      id = "hiropong",
      asset = "ghost03",
      label = "Ghost:yellow",
      color = HUD.kGhostColor_Yellow
    }
  }
  invokeTask(function()
    local L0_1
    L0_1 = Player
    L0_1 = L0_1.getPuppet
    L0_1 = L0_1(L0_1)
    L0_1 = L0_1.getWorldPos
    L0_1 = L0_1(L0_1)
    for _FORV_4_ = 1, #L0_0 do
      L0_0[_FORV_4_].obj = createGameObject2("GhostPuppet")
      L0_0[_FORV_4_].obj:setName(L0_0[_FORV_4_].id)
      L0_0[_FORV_4_].obj:setAssetName(L0_0[_FORV_4_].asset)
      L0_0[_FORV_4_].obj:setGhostType(0)
      L0_0[_FORV_4_].obj:try_init()
      L0_0[_FORV_4_].obj:waitForReady()
      L0_0[_FORV_4_].obj:try_start()
      L0_1.x = L0_1.x + RandF(-15, 15)
      L0_1.z = L0_1.z + RandF(-15, 15)
      L0_0[_FORV_4_].obj:getPuppet():setWorldPos(L0_1)
      L0_0[_FORV_4_].marker = HUD:createGhostMarker({
        id = L0_0[_FORV_4_].id,
        obj = L0_0[_FORV_4_].obj,
        joint = "bn_root",
        color = L0_0[_FORV_4_].color
      })
      L0_0[_FORV_4_].marker:setActive(true)
    end
  end)
end
