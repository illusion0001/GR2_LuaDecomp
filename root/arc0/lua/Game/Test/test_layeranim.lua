import("math")
import("common")
import("Debug")
import("EventData")
import("DeltaTimer")
function main()
  DeltaTimer:new():start()
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, false)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "Debug Draw GameObject"
  }, true)
  info = {
    modelName = "nvgia01_base",
    yureName = "nbgia01_base"
  }
  createGameObject2("Puppet"):setName("test01")
  createGameObject2("Puppet"):loadModel(info.modelName, info.modelName)
  createGameObject2("Puppet"):loadBaseSkeleton(info.modelName, info.yureName)
  createGameObject2("Puppet"):loadPoseAnimation("test", "nvgia01_punch_b_00")
  if not createGameObject2("Puppet"):loadPoseAnimation("test_add", "nvgia01_damage_small_hand_00_add") then
    print("ANIM FILE LOAD ERROR")
  else
    print("ANIM FILE LOAD SUCCESS")
  end
  createGameObject2("Puppet"):waitForLoading()
  DeltaTimer:new():stop()
  print("ELAPSED TIME(MSEC) = " .. DeltaTimer:new():getMSecond())
  print("ELAPSED TIME(SEC) = " .. DeltaTimer:new():getSecond())
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  if not createGameObject2("Puppet"):playPoseAnimation("test", -1) then
    print("ANIM PLAY ERROR")
  else
    print("ANIM PLAY SUCCESS")
  end
  createGameObject2("Puppet"):setUseAnimLocomotion(false)
  createGameObject2("Puppet"):setUsePhysicsMove(false)
  createGameObject2("Puppet"):setPoseAnimLayerAlpha(1, 1)
  createGameObject2("Puppet"):setPoseAnimLayerBlendOp(1, 1)
  if not createGameObject2("Puppet"):playPoseAnimationLayer(1, "test_add", -1) then
    print("LAYER ANIM PLAY ERROR")
  else
    print("LAYER ANIM PLAY SUCCESS")
  end
end
