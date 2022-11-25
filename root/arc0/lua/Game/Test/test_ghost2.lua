import("math")
import("Debug")
import("HUD")
import("Pad")
import("Player")
import("Replay")
import("Area")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
drift_params = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.8,
    min_a = 0.1,
    max_t = 30,
    min_t = 10
  },
  y = {
    rand = 1,
    sign = 0.85,
    max_a = 1,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
}
random_anim = {
  {anim_name = "stay"},
  {
    anim_name = "stay_fighting"
  },
  {anim_name = ""},
  {}
}
function main()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioTrans
  L2_2 = 1
  L0_0(L1_1, L2_2)
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioRot
  L2_2 = 1
  L0_0(L1_1, L2_2)
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "test_z_root2"
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setEnableDebugDraw
  L3_3 = false
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftParams
  L3_3 = drift_params
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftInherit
  L3_3 = true
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftEnable
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = DebugStage
  L2_2 = L1_1
  L1_1 = L1_1.createTestPlayer
  L3_3 = Vector
  L3_3 = L3_3(0, 1, 0)
  L1_1 = L1_1(L2_2, L3_3, YRotQuaternion(Deg2Rad(0)))
  L2_2 = Debug
  L3_3 = L2_2
  L2_2 = L2_2.setSwitch
  L2_2(L3_3, {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }, true)
  L2_2 = createGameObject2
  L3_3 = "GhostPuppet"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2.setName
  L3_3(L2_2, "ghost_replayOnly")
  L3_3 = L2_2.setAssetName
  L3_3(L2_2, "ghost01")
  L3_3 = Replay
  L3_3 = L3_3.getFile
  L3_3 = L3_3(L3_3)
  L2_2:setCopyFile(L3_3)
  L2_2:setGhostType(GhostPuppet.kGhostType_ReplayOnly)
  L2_2:setEnableGleam(true)
  L2_2:setOffsetVec(5, Vector(0, 1, 0))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  Area:setAnimMoveDriftEnable(true)
  L2_2:setFade(0, 1, 2)
  L2_2:play()
  while true do
    if Pad:getButton(Pad.kButton_RR) then
      L2_2:play()
      L2_2:setFade(0, 1, 2)
    end
    if Pad:getButton(Pad.kButton_RU) then
      L2_2:setOffsetVec(5, Vector(0, 1, 0))
    end
    wait()
  end
end
