L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Game/Event2/Common/SuppoterCommon.lua")
L0_0 = {}
L0_0.root = {
  {
    type = dbgCommon.kTypeInteger,
    data_name = "len_fs",
    data_label = "fatal_visible_length",
    step = 1,
    min = 1,
    max = 300,
    num = 30
  },
  {
    type = dbgCommon.kTypeInteger,
    data_name = "len_ps",
    data_label = "parallel_visible_length",
    step = 1,
    min = 1,
    max = 30,
    num = 5
  }
}
function L0_0.root.update()
  local L0_1, L1_2
  L0_1 = {}
  TextParam = L0_1
  L0_1 = dbgCommon
  L0_1 = L0_1.get_param
  L1_2 = TextParam
  L0_1(L1_2, L0_0.root)
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.setFatalParam
  L0_1(L1_2, TextParam)
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.isFatalVisible
  L0_1 = L0_1(L1_2)
  if L0_1 then
    L0_1 = Debug
    L1_2 = L0_1
    L0_1 = L0_1.screenPrint
    L0_1(L1_2, 30, 30, "Fatal:ON")
  else
    L0_1 = Debug
    L1_2 = L0_1
    L0_1 = L0_1.screenPrint
    L0_1(L1_2, 30, 30, "Fatal:OFF")
  end
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.getFatalState
  L0_1 = L0_1(L1_2)
  L1_2 = nil
  if L0_1 == HUD.kFatalState_None then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_None")
    HUD:setTextCommonCtrlGuide()
  elseif L0_1 == HUD.kFatalState_OutRangeTarget then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_OutRangeTarget")
    L1_2 = "ui_object_fin_02"
  elseif L0_1 == HUD.kFatalState_OutRangeNpc then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_OutRangeNpc")
  elseif L0_1 == HUD.kFatalState_OutScreenTarget then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_OutScreenTarget")
    L1_2 = "\231\133\167\230\186\150\227\130\146\229\144\136\227\130\143\227\129\155\227\130\141"
  elseif L0_1 == HUD.kFatalState_NoneLock then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_NoneLock")
    L1_2 = "\231\133\167\230\186\150\227\130\146\229\144\136\227\130\143\227\129\155\227\130\141"
  elseif L0_1 == HUD.kFatalState_Visible then
    Debug:screenPrint(30, 50, "Fatal:kFatalState_Visible")
    L1_2 = "ui_object_fin_01"
  end
  if L0_0.root.fatal_str ~= L1_2 then
    L0_0.root.fatal_str = L1_2
    if L1_2 then
      HUD:missionBegin(L1_2, 3)
      if L1_2 == "ui_object_fin_01" then
        HUD:setTextCommonCtrlGuide("ui_keyguide_fin_01")
      else
        HUD:setTextCommonCtrlGuide()
      end
    else
      HUD:missionEnd()
    end
  end
end
function test_fatal_marker()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  localtest_create_enemy_async2(true, Vector(-10, 0, 17.6).x, Vector(-10, 0, 17.6).y, Vector(-10, 0, 17.6).z, 1, "boss/unica/unica", "ui_boss_hp_03")
  dbgCommon.TreeExecute(L0_0.root)
end
function test_fatal_multi()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  localtest_create_enemy_async2(true, Vector(-10, 0, 17.6).x, Vector(-10, 0, 17.6).y, Vector(-10, 0, 17.6).z, 1, "boss/unica/unica", "ui_boss_hp_03")
  localtest_create_enemy_async2(true, Vector(-15, 0, 17.6).x, Vector(-15, 0, 17.6).y, Vector(-15, 0, 17.6).z, 1, "boss/permet/permet", "ui_boss_hp_04")
  dbgCommon.TreeExecute(L0_0.root)
end
function test_fatal_parallel()
  local L0_3, L1_4
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L0_3(L1_4, {"Display", "Debug Draw"}, true)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L0_3(L1_4, {
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L0_3(L1_4, {
    "Display",
    "File Asset Status"
  }, false)
  L0_3 = Vector
  L1_4 = -10
  L0_3 = L0_3(L1_4, 0, 17.6)
  L1_4 = localtest_create_enemy_async2
  L1_4(true, L0_3.x, L0_3.y, L0_3.z, 1, "boss/durga/durga", "ui_boss_hp_06")
  L1_4 = Fn_spawnSuppotCrow
  L1_4 = L1_4()
  L1_4:setForceMove()
  L1_4:getBrain():setIdling(false)
  HUD:setFatalNpc(L1_4)
  dbgCommon.TreeExecute(L0_0.root)
end
function localtest_create_enemy_async2(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11)
  for _FORV_11_ = 1, A4_9 do
    invokeTask(localtest_create_enemy2, A0_5, Vector(A1_6 + math.random() * 6, A2_7, A3_8 + math.random() * 6).x, Vector(A1_6 + math.random() * 6, A2_7, A3_8 + math.random() * 6).y, Vector(A1_6 + math.random() * 6, A2_7, A3_8 + math.random() * 6).z, A5_10, A6_11)
    Vector(A1_6 + math.random() * 6, A2_7, A3_8 + math.random() * 6).x = Vector(A1_6 + math.random() * 6, A2_7, A3_8 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy2(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18, L7_19, L8_20, L9_21
  L6_18 = print
  L7_19 = "x "
  L8_20 = A1_13
  L7_19 = L7_19 .. L8_20
  L6_18(L7_19)
  L6_18 = print
  L7_19 = "y "
  L8_20 = A2_14
  L7_19 = L7_19 .. L8_20
  L6_18(L7_19)
  L6_18 = print
  L7_19 = "z "
  L8_20 = A3_15
  L7_19 = L7_19 .. L8_20
  L6_18(L7_19)
  L6_18 = print
  L7_19 = "classification "
  L8_20 = A4_16
  L7_19 = L7_19 .. L8_20
  L6_18(L7_19)
  L6_18 = "enemyA"
  L7_19 = createGameObject2
  L8_20 = "Puppet"
  L7_19 = L7_19(L8_20)
  L9_21 = L7_19
  L8_20 = L7_19.setEnableDebugDraw
  L8_20(L9_21, true)
  L9_21 = L7_19
  L8_20 = L7_19.setName
  L8_20(L9_21, L6_18)
  L8_20 = loadFileAsset
  L9_21 = "evd"
  L8_20 = L8_20(L9_21, "CharDefs/" .. A4_16)
  L9_21 = L8_20.wait
  L9_21(L8_20)
  L9_21 = L7_19.setDescription
  L9_21(L7_19, L8_20:getRoot())
  L9_21 = L7_19.setPos
  L9_21(L7_19, Vector(A1_13, A2_14, A3_15))
  L9_21 = L7_19.setRot
  L9_21(L7_19, YRotQuaternion(Deg2Rad(90)))
  L9_21 = L7_19.registerIntoGroup
  L9_21(L7_19, "enemy")
  L9_21 = L7_19.setVisible
  L9_21(L7_19, false)
  L9_21 = createGameObject2
  L9_21 = L9_21("EnemyBrain")
  L9_21:setEnableDebugDraw(true)
  L9_21:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A4_16 .. "_exported_brain"):wait()
  L9_21:setDescription(loadFileAsset("evd", "CharDefs/" .. A4_16 .. "_exported_brain"):getRoot())
  L7_19:try_init()
  L9_21:try_init()
  L7_19:waitForReady()
  L9_21:waitForReady()
  L7_19:try_start()
  L9_21:try_start()
  L7_19:setBrain(L9_21)
  L7_19:setVisible(true)
  while L7_19:isLoading() do
    wait()
  end
  HUD:createBossHpGauge({obj = L7_19, text = A5_17}):setActive(true)
  HUD:addFatalTarget(L7_19, "bn_root")
end
