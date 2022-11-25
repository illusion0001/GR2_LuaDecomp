dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
_battle_clearDeadNum_wave1 = 4
enmgen = nil
enmbra = {}
enmgen2_nevi_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_nevi_01",
      name = "enemy_01"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_02",
      name = "enemy_02"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_03",
      name = "enemy_03"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_04",
      name = "enemy_04"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_2)
    local L1_3
    L1_3 = A0_2.enemyDeadNum
    return L1_3
  end,
  isEnemyAllDead = function(A0_4)
    local L2_5
    L2_5 = A0_4.enemyDeadNum
    L2_5 = L2_5 >= #A0_4.spawnSet
    return L2_5
  end
}
function Initialize()
  local L0_6, L1_7, L2_8, L3_9
  L0_6(L1_7)
  L0_6(L1_7)
  L0_6(L1_7)
  L0_6(L1_7)
  enmgen = L0_6
  if L0_6 ~= nil then
    L0_6(L1_7, L2_8)
  end
  for L3_9 = 1, 4 do
    enmbra[L3_9] = findGameObject2("EnemyBrain", string.format("enemy_%02d", L3_9))
    if enmbra[L3_9] ~= nil then
      enmbra[L3_9]:setEnableHomingTarget(false)
      enmbra[L3_9]:setEnableTarget(false)
    end
  end
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18
  repeat
    L0_10 = wait
    L0_10()
    L0_10 = Fn_sendEventComSb
    L1_11 = "requestCrowSpawn"
    L0_10 = L0_10(L1_11)
  until L0_10
  L0_10 = findGameObject2
  L1_11 = "Node"
  L2_12 = "locator2_sol_g_02"
  L0_10 = L0_10(L1_11, L2_12)
  L1_11 = false
  L2_12 = invokeTask
  function L3_13()
    local L0_19
    L0_19 = 0
    while L1_11 == false do
      Sound:playSE("m26_011", 1, "", L0_10)
      L0_19 = RandI(5, 15)
      waitSeconds(L0_19)
    end
  end
  L2_12 = L2_12(L3_13)
  L3_13 = Fn_setCatWarpCheckPoint
  L4_14 = "locator2_restart_pos_ep09_g"
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "setSensorVisible"
  L3_13(L4_14, L5_15)
  L3_13 = Fn_missionStart
  L3_13()
  L3_13 = Fn_userCtrlOn
  L3_13()
  L3_13 = Fn_missionView
  L4_14 = "ep09_06000"
  L3_13(L4_14)
  L3_13 = waitSeconds
  L4_14 = 1.3
  L3_13(L4_14)
  L3_13 = Fn_naviSet
  L4_14 = L0_10
  L3_13(L4_14)
  L3_13 = findGameObject2
  L4_14 = "Node"
  L3_13 = L3_13(L4_14, L5_15)
  while true do
    L4_14 = is_check_eye_node
    L4_14 = L4_14(L5_15, L6_16, L7_17)
    if not L4_14 then
      L4_14 = wait
      L4_14()
    end
  end
  L4_14 = Fn_naviKill
  L4_14()
  L4_14 = Player
  L4_14 = L4_14.setStay
  L4_14(L5_15, L6_16)
  L4_14 = Fn_setCatWarpCheckPoint
  L4_14(L5_15)
  L4_14 = Fn_sendEventComSb
  L4_14(L5_15, L6_16)
  L4_14 = Fn_sendEventComSb
  L4_14(L5_15, L6_16)
  L4_14 = Fn_pcSensorOn
  L4_14(L5_15)
  L4_14 = Fn_pcSensorOn
  L4_14(L5_15)
  L4_14 = Fn_setBgmPoint
  L4_14(L5_15)
  L4_14 = Fn_lookAtObject
  L4_14 = L4_14(L5_15)
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15(L6_16, L7_17)
  L5_15(L6_16)
  L5_15(L6_16)
  if L5_15 ~= nil then
    L5_15(L6_16, L7_17)
  end
  for L8_18 = 1, 4 do
    enmbra[L8_18] = findGameObject2("EnemyBrain", string.format("enemy_%02d", L8_18))
    if enmbra[L8_18] ~= nil then
      enmbra[L8_18]:setEnableHomingTarget(true)
      enmbra[L8_18]:setEnableTarget(true)
    end
  end
  L5_15(L6_16, L7_17)
  L5_15(L6_16, L7_17)
  L5_15(L6_16, L7_17)
  L5_15(L6_16, L7_17)
  return_task = L5_15
  repeat
    L5_15()
  until L5_15
  L5_15(L6_16)
  return_task = nil
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15(L6_16, L7_17)
  L5_15(L6_16, L7_17)
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15(L6_16, L7_17)
  L5_15(L6_16, L7_17)
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15(L6_16)
  L5_15()
  L5_15(L6_16, L7_17)
  L5_15()
  L5_15(L6_16)
  L5_15(L6_16)
  L2_12 = nil
  L5_15(L6_16)
  L5_15(L6_16, L7_17)
  L5_15(L6_16)
  L5_15()
  L5_15()
  L5_15(L6_16, L7_17)
  L5_15(L6_16)
  L8_18 = Supporter
  L8_18 = L8_18.Ability
  L8_18 = L8_18.ServantLinkage
  L6_16(L7_17, L8_18, false)
  L6_16(L7_17)
  L8_18 = nil
  L6_16(L7_17, L8_18, 2)
  L6_16(L7_17)
  L8_18 = nil
  L6_16(L7_17, L8_18, 2)
  L6_16(L7_17)
  L6_16(L7_17)
  L6_16()
  L8_18 = true
  L6_16(L7_17, L8_18)
  L6_16()
  L6_16()
  L6_16()
  L6_16()
end
function Finalize()
  local L0_20, L1_21
end
function pcsensor2_ep09_g_OnEnter()
  Fn_pcSensorOff("pccubesensor2_02")
  Fn_captionView("ep09_06006")
end
function pccubesensor2_caution_ep09_g_OnLeave()
  print("pccubesensor2_caution_ep09_g_OnLeave")
  invokeTask(function()
    if return_flag == false then
      return_flag = true
      Fn_naviSet(findGameObject2("Node", "locator2_navi_01"))
    end
    if Player:getAbility(Player.kAbility_GravityShift) then
      Fn_coercionGravityShift()
    end
    if not Fn_isCaptionView("ep09_06002") then
      Fn_captionViewLock("ep09_06002")
    end
  end)
end
