import("math")
import("Area")
dofile("/Game/UXpdemo/pdemo_ux_common.lua")
restore_task = nil
restore_task2 = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function task_restore_bkobj2(A0_1)
  A0_1:requestRestore()
  restore_task2 = nil
end
effect_table = {
  [0] = "ux003_c01_eff",
  [1] = "ux003_c02_eff"
}
bg_table = {}
bgobj_table = {}
function main()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L0_2 = print
  L1_3 = "main start---------------------------"
  L0_2(L1_3)
  L0_2 = createGameObject2
  L1_3 = "PolyDemo"
  L0_2 = L0_2(L1_3)
  L1_3 = LayoutPosYaw
  L2_4 = Vector
  L3_5 = 312.2
  L4_6 = -7.75
  L5_7 = -19.68
  L2_4 = L2_4(L3_5, L4_6, L5_7)
  L3_5 = 0
  L1_3 = L1_3(L2_4, L3_5)
  L2_4 = createEntity2
  L3_5 = "Player"
  L4_6 = {}
  L4_6.name = "player"
  L4_6.character_name = "kit"
  L4_6.asset_name = "kit"
  L4_6.layout = L1_3
  L4_6.autoRun = true
  L2_4 = L2_4(L3_5, L4_6)
  player = L2_4
  L2_4 = createEntity2
  L3_5 = "PlayerCamera"
  L4_6 = {}
  L4_6.name = "_cam:_main"
  L4_6.autoRun = true
  L2_4(L3_5, L4_6)
  L2_4 = Area
  L3_5 = L2_4
  L2_4 = L2_4.createArea
  L4_6 = "base_all_area_05"
  L2_4(L3_5, L4_6)
  L2_4 = loadFileAsset
  L3_5 = "evd"
  L4_6 = "/pdemo/ux003"
  L2_4 = L2_4(L3_5, L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.wait
  L3_5(L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.getRoot
  L3_5 = L3_5(L4_6)
  L3_5 = L3_5.pdemo
  polydemo_init_args = L3_5
  L4_6 = L0_2
  L3_5 = L0_2.setDescription
  L6_8 = L2_4
  L5_7 = L2_4.getRoot
  L6_8 = L5_7(L6_8)
  L3_5(L4_6, L5_7, L6_8, L5_7(L6_8))
  L3_5 = {}
  L4_6 = createGameObject2
  L5_7 = "GimmickBg"
  L4_6 = L4_6(L5_7)
  L6_8 = L4_6
  L5_7 = L4_6.setDrawModelName
  L5_7(L6_8, "bridge_md_01")
  L6_8 = L4_6
  L5_7 = L4_6.setCollisionName
  L5_7(L6_8, "bridge_md_01")
  L6_8 = L4_6
  L5_7 = L4_6.setAttributeName
  L5_7(L6_8, "bridge_md_01")
  L6_8 = L4_6
  L5_7 = L4_6.setPos
  L5_7(L6_8, Vector(331.1719, -11.975, -63.3323))
  L5_7 = {}
  L6_8 = createGameObject2
  L6_8 = L6_8("GimmickBg")
  L6_8:setDrawModelName("bridge_md_01_db_02")
  L6_8:setCollisionName("bridge_md_02")
  L6_8:setAttributeName("bridge_md_02")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  initializeAllCutEffects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(function()
    while true do
      player:setPos(Vector(312.2, -7.75, -19.68))
      L6_8:setPos(Vector(0, 0, 0))
      if restore_task == nil and L4_6:isBroken() then
        restore_task = invokeTask(task_restore_bkobj, L4_6)
      end
      if restore_task2 == nil and L6_8:isBroken() then
        restore_task2 = invokeTask(task_restore_bkobj2, L6_8)
      end
      wait(90)
      L0_2:play()
      while not L0_2:isDemoEnd() do
        playCutEffects(L0_2:getCurrentCutIndex())
        if L0_2:getCurrentCutIndex() == 1 and L0_2:getCurrentCutFrame() == 0 then
          player:setPos(Vector(326.6, -122, -63.83))
        end
        if L0_2:getCurrentCutIndex() == 1 and L0_2:getCurrentCutFrame() == 134 then
          L4_6:requestBreak(Vector(334.2, 10.5, -62.1), 30)
          L6_8:setPos(Vector(331.1719, -11.975, -63.3323))
        end
        if L0_2:getCurrentCutIndex() == 1 and L0_2:getCurrentCutFrame() == 137 then
          L6_8:requestBreak(Vector(336.2, 2.5, -60.1), 21)
        end
        Debug:screenPrint(0, 500, {
          "CUT " .. L0_2:getCurrentCutIndex(),
          "Frame " .. L0_2:getCurrentCutFrame()
        })
        wait()
      end
      L0_2:stop()
      L0_2:reset()
      resetCutEffects()
    end
  end)
  while true do
    wait()
  end
end
