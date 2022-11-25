import("Replay")
dofile("/Game/Event2/Common/EventCommon.lua")
replay_run = true
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = createGameObject2
  L1_1 = "Puppet"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L1_1(L2_2, "test_ghost_chara")
  L1_1 = loadFileAsset
  L2_2 = "evd"
  L1_1 = L1_1(L2_2, "CharDefs/wom01")
  L2_2 = L1_1.wait
  L2_2(L1_1)
  L2_2 = L0_0.setDescription
  L2_2(L0_0, L1_1:getRoot())
  L2_2 = createGameObject2
  L2_2 = L2_2("ActorBrain")
  L2_2:setName("test_ghost_chara_brain")
  L2_2:try_init()
  L0_0:try_init()
  L2_2:waitForReady()
  L0_0:waitForReady()
  L0_0:setIgnoreGrab(true)
  L0_0:setBrain(L2_2)
  L0_0:setPos(Vector(1, 0, 0))
end
function Ingame()
  local L0_3
  L0_3 = 600
  invokeTask(function()
    local L0_4, L1_5, L2_6, L3_7
    L0_4 = Fn_getPlayer
    L0_4 = L0_4()
    L1_5 = findGameObject2
    L2_6 = "Puppet"
    L3_7 = "test_ghost_chara"
    L1_5 = L1_5(L2_6, L3_7)
    while true do
      L3_7 = L0_4
      L2_6 = L0_4.getWorldPos
      L2_6 = L2_6(L3_7)
      L3_7 = L1_5.getWorldPos
      L3_7 = L3_7(L1_5)
      Font:debugPrint(400, 60, "PC  pos : " .. tostring(L2_6))
      Font:debugPrint(400, 80, "NPC pos : " .. tostring(L3_7))
      wait()
    end
  end)
  Fn_missionStart()
  Fn_countDownWithTimer()
  Replay:setFileName("test_ghost")
  if false == true then
    Fn_captionView("\232\168\152\233\140\178\228\184\173", 0, false)
    Replay:recStart()
    wait(L0_3)
    HUD:captionEnd()
    Replay:recEnd()
    Fn_captionView("\232\168\152\233\140\178\231\181\130\228\186\134", 1, false)
  else
    Replay:repFileLoad()
    Replay:repStart()
    Fn_captionView("\229\134\141\231\148\159\228\184\173", 0, false)
    ghost_move()
    Replay:repEnd()
    Fn_captionView("\229\134\141\231\148\159\231\181\130\228\186\134", 1, false)
  end
end
function Finalize()
  local L0_8, L1_9
end
function ghost_move()
  local L0_10, L1_11, L2_12
  L0_10 = findGameObject2
  L1_11 = "Puppet"
  L2_12 = "test_ghost_chara"
  L0_10 = L0_10(L1_11, L2_12)
  L1_11, L2_12 = nil, nil
  while replay_run do
    L1_11 = Replay:getGhostPos()
    L2_12 = Replay:getGhostRot()
    if L1_11 ~= nil then
      L0_10:setWorldPos(L1_11)
    else
    end
    if true ~= true then
      if L2_12 ~= nil then
        L0_10:setWorldRot(L2_12)
      end
      L0_10:setForceMove()
      wait()
    end
  end
end
