import("math")
import("GameDatabase")
test_model = "stone_imap_yy_22"
function main()
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("current:")
  print(val)
  GameDatabase:set(ggd.Debug__StartFreeMode, true)
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("set true:")
  print(val)
  GameDatabase:backup(ggd.Debug__StartFreeMode)
  print("backup")
  GameDatabase:reset(ggd.Debug__StartFreeMode)
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("reset:")
  print(val)
  GameDatabase:restore(ggd.Debug__StartFreeMode)
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("restore:")
  print(val)
  GameDatabase:reset(ggd.Debug)
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("reset(table):")
  print(val)
  GameDatabase:restore(ggd.Debug)
  val = GameDatabase:get(ggd.Debug__StartFreeMode)
  print("restore(table):")
  print(val)
  createGameObject2("SimpleModel"):setModelName(test_model)
  createGameObject2("SimpleModel"):setPos(Vector(0, 0, 0))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  print("autoSave")
  Savedata:autoSave()
  while true do
    if Savedata:update() == 1 then
      print("save end")
      break
    elseif Savedata:update() == -1 then
      print("save already ended")
      break
    end
    wait()
  end
  print("save test end")
  print("listSave")
  Savedata:save()
  while true do
    if Savedata:update() == 1 then
      print("save end")
      break
    elseif Savedata:update() == -1 then
      print("save already ended")
      break
    end
    wait()
  end
  print("save test end")
  print("listLoad")
  Savedata:load()
  while true do
    if Savedata:update() == 1 then
      print("load end")
      break
    elseif Savedata:update() == -1 then
      print("load already ended")
      break
    end
    wait()
  end
  print("load test end")
end
