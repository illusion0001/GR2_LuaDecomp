import("math")
import("Debug")
import("HUD")
import("Pad")
import("Player")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function put_barrel(A0_1, A1_2)
  createGameObject2("TerrainBg"):setModelName("stone_imap_yy_22")
  createGameObject2("TerrainBg"):setCollisionName("stone_imap_yy_22")
  createGameObject2("TerrainBg"):setPos(A0_1)
  createGameObject2("TerrainBg"):setName(A1_2)
  return (createGameObject2("TerrainBg"))
end
function StepCnt(A0_3, A1_4)
  A0_3 = A0_3 + A1_4
  if A0_3 >= 1 then
    A0_3 = A0_3 - 1
  end
  return A0_3
end
function CalSinWave(A0_5)
  return Sin(A0_5 * 2 * PI)
end
function CalCosWave(A0_6)
  return Cos(A0_6 * 2 * PI)
end
function CalTrapezoidWave(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  if A0_7 >= 1 then
    A0_7 = A0_7 - 1
  end
  L2_9 = A0_7 * 2
  if L2_9 >= 1 then
    L2_9 = L2_9 - 1
  end
  L3_10 = nil
  if A1_8 <= L2_9 then
    L3_10 = 1
  else
    L4_11 = L2_9 / A1_8
    L4_11 = L4_11 * 2
    L3_10 = L4_11 - 1
  end
  if A0_7 > 0.5 then
    L3_10 = -L3_10
  end
  return L3_10
end
function reset_pc_pos_rot(A0_12, A1_13, A2_14)
  Player:reset(Player.kReset_Standing, A1_13, A2_14)
  wait(10)
end
function main()
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("motion_test_stage1")
  createGameObject2("TerrainBg"):setCollisionName("motion_test_stage1")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  Taru = {
    {
      name = "barrel_iy_01",
      posBase = Vector(1.3, 1.3, 12),
      range = 2,
      cnt = 0,
      cntPich = 0.003,
      obj = 0
    },
    {
      name = "barrel_iy_02",
      posBase = Vector(1.3, 2.3, 15),
      range = 2,
      cnt = 0,
      cntPich = 0.003,
      obj = 0
    },
    {
      name = "barrel_iy_03",
      posBase = Vector(1.3, 1.5, 25),
      range = 2,
      slope = 0.5,
      cnt = 0,
      cntPich = 0.01,
      obj = 0
    },
    {
      name = "barrel_iy_04",
      posBase = Vector(1.3, 1.5, 35),
      range = 2,
      slope = 0,
      cnt = 0,
      cntPich = 0.01,
      obj = 0
    },
    {
      name = "barrel_iy_05",
      posBase = Vector(-13, 1.5, 12),
      range = 1,
      slope = 0.5,
      cnt = 0,
      cntPich = 0.003,
      obj = 0
    },
    {
      name = "barrel_iy_06",
      posBase = Vector(-13, 1.5, 27),
      range = 0.5,
      slope = 0,
      cnt = 0,
      cntPich = 0.016,
      obj = 0
    },
    {
      name = "barrel_iy_07",
      posBase = Vector(-25, 1.5, 12),
      range = 0.5,
      slope = 0,
      cnt = 0,
      cntPich = 0.016,
      obj = 0
    }
  }
  Taru[1].obj = put_barrel(Taru[1].posBase, Taru[1].name)
  Taru[2].obj = put_barrel(Taru[2].posBase, Taru[2].name)
  Taru[3].obj = put_barrel(Taru[3].posBase, Taru[3].name)
  Taru[4].obj = put_barrel(Taru[4].posBase, Taru[4].name)
  Taru[5].obj = put_barrel(Taru[5].posBase, Taru[5].name)
  Taru[6].obj = put_barrel(Taru[6].posBase, Taru[6].name)
  Taru[7].obj = put_barrel(Taru[7].posBase, Taru[7].name)
  print("start all")
  startAllGameObjects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "TestParams",
    "isValidFormChangeUI"
  }, true)
  while true do
    taru = Taru[1]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setPos(Vector(taru.posBase.x + CalSinWave(taru.cnt) * taru.range, taru.posBase.y, taru.posBase.z + CalCosWave(taru.cnt) * taru.range))
    taru = Taru[2]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setPos(Vector(taru.posBase.x + CalCosWave(taru.cnt) * taru.range, taru.posBase.y + CalSinWave(taru.cnt) * taru.range, taru.posBase.z))
    taru = Taru[3]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setPos(Vector(taru.posBase.x, taru.posBase.y, taru.posBase.z + CalTrapezoidWave(taru.cnt, taru.slope) * taru.range))
    taru = Taru[4]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setPos(Vector(taru.posBase.x + CalTrapezoidWave(taru.cnt + 0.25, taru.slope * 0.5) * taru.range, taru.posBase.y, taru.posBase.z + CalTrapezoidWave(taru.cnt, taru.slope * 0.5) * taru.range))
    taru = Taru[5]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setRot(YRotQuaternion(CalTrapezoidWave(taru.cnt, taru.slope) * taru.range * PI))
    taru = Taru[6]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setRot(YRotQuaternion(CalTrapezoidWave(taru.cnt, taru.slope) * taru.range * PI))
    taru = Taru[7]
    taru.cnt = StepCnt(taru.cnt, taru.cntPich)
    taru.obj:setPos(Vector(taru.posBase.x, taru.posBase.y + CalTrapezoidWave(taru.cnt, taru.slope) * taru.range, taru.posBase.z))
    wait()
  end
end
