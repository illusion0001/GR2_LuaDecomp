import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
import("GlobalGem")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  createSandbox2("father2"):setString("g_filename", "/Game/Event2/father2.lua")
  createSandbox2("father2"):try_init()
  createSandbox2("father2"):waitForReady()
  createSandbox2("father2"):try_start()
  while not createSandbox2("father2"):sendEvent("isPcSpawned") do
    wait()
  end
  createGameObject2("Area"):setName("test_kudo")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  _loadEventData("test_shigi2")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function _loadEventData(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = loadFileAsset
  L2_2 = "evb"
  L3_3 = "evx/"
  L3_3 = L3_3 .. A0_0
  L1_1 = L1_1(L2_2, L3_3)
  L2_2, L3_3 = nil, nil
  if L1_1 ~= nil then
    L1_1:wait()
    L2_2 = L1_1:getRoot()
    L3_3 = EventData:create(A0_0, nil, L2_2)
    L3_3:try_init()
    L3_3:waitForReady()
    L3_3:try_start()
  end
end
