L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = import
L0_0("Query")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = {}
L0_0.EnemyStay = HUD.kEMAct_DeactiveLoop
L0_0.EnemyFind = HUD.kEMAct_DeactiveLoop
L0_0.EnemyAttackPrepare = HUD.kEMAct_DeactiveLoop
L0_0.EnemyAttackStart = HUD.kEMAct_ActiveScaleOneShot
L0_0.EnemyAttacking = HUD.kEMAct_ActiveHighSpeedLoop
L0_0.EnemyAttackStart_Bullet = HUD.kEMAct_DeactiveLoop
L0_0.BulletStart = HUD.kEMAct_ActiveScaleOneShot
L0_0.BulletStay = HUD.kEMAct_ActiveHighSpeedLoop
L0_0.RangeMax = 300
L0_0.RangeMin = 50
function test_enemy_marker()
  HUD:enemymarkerSetAdjustParam(L0_0)
  HUD:enemymarkerSetRange(L0_0.RangeMax)
  HUD:enemymarkerSetRangeMin(L0_0.RangeMin)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  HUD:spgDispReq_FadeIn()
  localtest_create_enemy_async(true, Vector(-10, 4, 17.6).x, Vector(-10, 4, 17.6).y, Vector(-10, 4, 17.6).z, 1, "enemy/giant/giant")
end
function localtest_create_enemy_async(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  for _FORV_10_ = 1, A4_5 do
    invokeTask(localtest_create_enemy, A0_1, Vector(A1_2 + math.random() * 6, A2_3, A3_4 + math.random() * 6).x, Vector(A1_2 + math.random() * 6, A2_3, A3_4 + math.random() * 6).y, Vector(A1_2 + math.random() * 6, A2_3, A3_4 + math.random() * 6).z, A5_6)
    Vector(A1_2 + math.random() * 6, A2_3, A3_4 + math.random() * 6).x = Vector(A1_2 + math.random() * 6, A2_3, A3_4 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18
  L5_12 = print
  L6_13 = "x "
  L7_14 = A1_8
  L6_13 = L6_13 .. L7_14
  L5_12(L6_13)
  L5_12 = print
  L6_13 = "y "
  L7_14 = A2_9
  L6_13 = L6_13 .. L7_14
  L5_12(L6_13)
  L5_12 = print
  L6_13 = "z "
  L7_14 = A3_10
  L6_13 = L6_13 .. L7_14
  L5_12(L6_13)
  L5_12 = print
  L6_13 = "classification "
  L7_14 = A4_11
  L6_13 = L6_13 .. L7_14
  L5_12(L6_13)
  L5_12 = "enemyA"
  L6_13 = createGameObject2
  L7_14 = "Puppet"
  L6_13 = L6_13(L7_14)
  L8_15 = L6_13
  L7_14 = L6_13.setEnableDebugDraw
  L9_16 = true
  L7_14(L8_15, L9_16)
  L8_15 = L6_13
  L7_14 = L6_13.setName
  L9_16 = L5_12
  L7_14(L8_15, L9_16)
  L7_14 = loadFileAsset
  L8_15 = "evd"
  L9_16 = "CharDefs/"
  L10_17 = A4_11
  L9_16 = L9_16 .. L10_17
  L7_14 = L7_14(L8_15, L9_16)
  L9_16 = L7_14
  L8_15 = L7_14.wait
  L8_15(L9_16)
  L9_16 = L6_13
  L8_15 = L6_13.setDescription
  L11_18 = L7_14
  L10_17 = L7_14.getRoot
  L11_18 = L10_17(L11_18)
  L8_15(L9_16, L10_17, L11_18, L10_17(L11_18))
  L9_16 = L6_13
  L8_15 = L6_13.setPos
  L10_17 = Vector
  L11_18 = A1_8
  L11_18 = L10_17(L11_18, A2_9, A3_10)
  L8_15(L9_16, L10_17, L11_18, L10_17(L11_18, A2_9, A3_10))
  L9_16 = L6_13
  L8_15 = L6_13.setRot
  L10_17 = YRotQuaternion
  L11_18 = Deg2Rad
  L11_18 = L11_18(90)
  L11_18 = L10_17(L11_18, L11_18(90))
  L8_15(L9_16, L10_17, L11_18, L10_17(L11_18, L11_18(90)))
  L9_16 = L6_13
  L8_15 = L6_13.registerIntoGroup
  L10_17 = "enemy"
  L8_15(L9_16, L10_17)
  L9_16 = L6_13
  L8_15 = L6_13.setVisible
  L10_17 = false
  L8_15(L9_16, L10_17)
  L8_15 = createGameObject2
  L9_16 = "EnemyBrain"
  L8_15 = L8_15(L9_16)
  L10_17 = L8_15
  L9_16 = L8_15.setEnableDebugDraw
  L11_18 = true
  L9_16(L10_17, L11_18)
  L10_17 = L8_15
  L9_16 = L8_15.setName
  L11_18 = "enemyAI"
  L9_16(L10_17, L11_18)
  L9_16 = loadFileAsset
  L10_17 = "evd"
  L11_18 = "CharDefs/"
  L11_18 = L11_18 .. A4_11 .. "_exported_brain"
  L9_16 = L9_16(L10_17, L11_18)
  L11_18 = L6_13
  L10_17 = L6_13.try_init
  L10_17(L11_18)
  L11_18 = L8_15
  L10_17 = L8_15.try_init
  L10_17(L11_18)
  L11_18 = L6_13
  L10_17 = L6_13.waitForReady
  L10_17(L11_18)
  L11_18 = L8_15
  L10_17 = L8_15.waitForReady
  L10_17(L11_18)
  L11_18 = L6_13
  L10_17 = L6_13.try_start
  L10_17(L11_18)
  L11_18 = L8_15
  L10_17 = L8_15.try_start
  L10_17(L11_18)
  while true do
    L11_18 = L6_13
    L10_17 = L6_13.isLoading
    L10_17 = L10_17(L11_18)
    if L10_17 then
      L10_17 = wait
      L10_17()
    end
  end
  L11_18 = L9_16
  L10_17 = L9_16.wait
  L10_17(L11_18)
  L11_18 = L8_15
  L10_17 = L8_15.setDescription
  L10_17(L11_18, L9_16:getRoot())
  L11_18 = L6_13
  L10_17 = L6_13.setBrain
  L10_17(L11_18, L8_15)
  L11_18 = L6_13
  L10_17 = L6_13.setVisible
  L10_17(L11_18, true)
  L10_17 = HUD
  L11_18 = L10_17
  L10_17 = L10_17.createBossHpGauge
  L10_17 = L10_17(L11_18, {obj = L6_13})
  L11_18 = L10_17.setActive
  L11_18(L10_17, true)
  while true do
    L11_18 = L6_13.isRunning
    L11_18 = L11_18(L6_13)
    if L11_18 then
      L11_18 = L8_15.getHealth
      L11_18 = L11_18(L8_15)
      L11_18 = L11_18 / L8_15:getMaxHealth()
      L10_17:setHp(L11_18)
      if HUD:isPhotoFrameIn(L6_13:getPos()) then
        Debug:screenPrint(30, 30, "IN")
      else
        Debug:screenPrint(30, 30, "OUT")
      end
      if HUD:isPhotoMode() then
        Debug:screenPrint(30, 50, "ZOOM:" .. HUD:getPhotoZoomRate())
      end
      wait()
    end
  end
end
