import("math")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  createGameObject2("AreaRegularBg"):setModelName("gm_armarea_a")
  createGameObject2("AreaRegularBg"):setVisible(false)
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  while createGameObject2("AreaRegularBg"):isLoading() do
    wait()
  end
  createGameObject2("AreaRegularBg"):setVisible(true)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end