local L1_1
function L0_0()
  createGameObject2("Example"):setName("example man")
  createGameObject2("Example"):greeting()
  createGameObject2("Example"):greeting2()
  createGameObject2("ExampleAsync"):setName("async man")
  createGameObject2("ExampleAsync"):try_init()
  while not createGameObject2("ExampleAsync"):isReady() do
    wait()
  end
  createGameObject2("ExampleAsync"):try_start()
  createGameObject2("ExampleAsync"):thinkLongTime(100000)
  while not createGameObject2("ExampleAsync"):isThinkDone() do
    print("wait thinkLongTime")
    wait()
  end
  createGameObject2("ExampleAsync"):loadAsset("test_file")
  while not createGameObject2("ExampleAsync"):isLoadAssetDone() do
    print("wait loadAsset")
    wait()
  end
  while true do
    wait()
  end
end
main = L0_0
