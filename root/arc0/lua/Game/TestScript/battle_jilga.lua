dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
enmgen2_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "special01",
      navi_mesh_name = "po_a_02_wall"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end
}
function Initialize()
  local L0_8
  L0_8 = loadFileAsset
  L0_8 = L0_8("nvm", "po_a_02_wall")
  if L0_8 ~= nil then
    L0_8:wait()
    if Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_02") ~= nil then
      Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_02"):addNaviMeshAsset(L0_8)
    end
  end
  findGameObject2("EnemyGenerator", "enmgen2_03"):setNaviMeshName("po_a_02_wall")
end
function Ingame()
  Fn_missionStart()
end
function Finalize()
  local L0_9, L1_10
end
