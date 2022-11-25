dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm14_common.lua")
GEM_GOAL = 60
ADD_ENEMY_TRIGGER_GEM_NUM = 10
_puppet_crow = nil
_brain_crow = nil
enmgen2_add_c2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_add_enemy_c2_01",
      type = "runner",
      locator = "locator_add_enemy_01"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end
}
function Initialize()
  _sdemo_cut01 = SDemo.create("sm14_cut_c2_01")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_c_02")
  Fn_pcSensorOff("pccubesensor2_mining_area_warning_c2")
  Fn_pcSensorOff("pccubesensor2_mining_area_warp_c2")
  Fn_userCtrlOff()
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14
  L0_10 = Fn_setCatWarpCheckPoint
  L1_11 = "locator2_pc_start_pos_c2"
  L0_10(L1_11)
  _crow_warp_node = "locator2_crow_reset_pos_c2"
  L0_10 = nil
  L1_11 = Fn_coercionPoseNomal
  L1_11()
  L1_11 = Fn_warpCageMineArea
  L1_11()
  L1_11 = Fn_sendEventComSb
  L2_12 = "changeAreaNum"
  L3_13 = 3
  L1_11(L2_12, L3_13)
  L1_11 = Fn_sendEventComSb
  L2_12 = "resetAllOre"
  L1_11(L2_12)
  L1_11 = Fn_sendEventComSb
  L2_12 = "resetAllCountFlag"
  L1_11(L2_12)
  L1_11 = print
  L2_12 = "\227\130\175\227\131\173\227\130\166\231\148\159\230\136\144\233\150\139\229\167\139"
  L1_11(L2_12)
  L1_11 = Fn_sendEventComSb
  L2_12 = "isSpawnCrow"
  L1_11 = L1_11(L2_12)
  if not L1_11 then
    L1_11 = Fn_sendEventComSb
    L2_12 = "requestSpawnCrow"
    L3_13 = true
    L1_11(L2_12, L3_13)
    while true do
      L1_11 = _puppet_crow
      if L1_11 == nil then
        L1_11 = _brain_crow
      end
      if L1_11 == nil then
        L1_11 = print
        L2_12 = "\227\130\175\227\131\173\227\130\166\228\189\156\227\130\137\227\130\140\227\129\166\227\129\170\227\129\132"
        L1_11(L2_12)
        L1_11 = Fn_sendEventComSb
        L2_12 = "crowPuppetHandle"
        L1_11 = L1_11(L2_12)
        _puppet_crow = L1_11
        L1_11 = Fn_sendEventComSb
        L2_12 = "crowBrainHandle"
        L1_11 = L1_11(L2_12)
        _brain_crow = L1_11
        L1_11 = wait
        L1_11()
        else
          L1_11 = Fn_sendEventComSb
          L2_12 = "crowPuppetHandle"
          L1_11 = L1_11(L2_12)
          _puppet_crow = L1_11
          L1_11 = Fn_sendEventComSb
          L2_12 = "crowBrainHandle"
          L1_11 = L1_11(L2_12)
          _brain_crow = L1_11
          L1_11 = print
          L2_12 = "\227\130\130\227\129\134\227\130\175\227\131\173\227\130\166\228\189\156\227\129\163\227\129\166\227\130\139"
          L1_11(L2_12)
        end
      end
    end
  L1_11 = findGameObject2
  L2_12 = "Node"
  L3_13 = "locator2_crow_reset_pos"
  L1_11 = L1_11(L2_12, L3_13)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.setIdling
  L4_14 = true
  L2_12(L3_13, L4_14)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.setAbility
  L4_14 = Supporter
  L4_14 = L4_14.Ability
  L4_14 = L4_14.ActionInAir
  L2_12(L3_13, L4_14, false)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.warpToNode
  L4_14 = L1_11
  L2_12(L3_13, L4_14, Supporter.FirstAction.Ground)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.lockToWarp
  L4_14 = L1_11
  L2_12(L3_13, L4_14)
  L2_12 = Supporter
  L2_12 = L2_12.Area
  L2_12 = L2_12.sm14_c
  L3_13 = Fn_createSuppotArea
  L4_14 = L2_12
  L3_13(L4_14, _brain_crow)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.requestFatal
  L3_13(L4_14, false)
  L3_13 = print
  L4_14 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\131\145\227\131\169\227\131\172\227\131\171\227\131\149\227\130\167\227\131\188\227\130\191\227\131\171OFF\239\188\129\239\188\129"
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "requestChangeEnemyMarker"
  L3_13(L4_14, false)
  L3_13 = Fn_sendEventComSb
  L4_14 = "requestIdleEnemy"
  L3_13(L4_14, true)
  function L3_13()
    local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
    L0_15 = Fn_getGameObject
    L1_16 = "MineManager"
    L0_15 = L0_15(L1_16)
    L1_16 = {}
    L2_17.evarea = nil
    L2_17.aabb = nil
    L1_16.pi_a_06_01 = L2_17
    L2_17.evarea = nil
    L2_17.aabb = nil
    L1_16.pi_a_11 = L2_17
    if L0_15 then
      for L5_20, L6_21 in L2_17(L3_18) do
        L8_23 = L0_15
        L6_21.evarea = L7_22
        if L7_22 then
          L8_23 = L7_22
          L6_21.aabb = L7_22
          L8_23 = Vector
          L8_23 = L8_23(-1, -1, -1)
          L8_23 = Aabb
          L8_23 = L8_23(Vector(-150, -150, -150), Vector(150, 150, 150))
          L7_22.max.x = L6_21.aabb.max.x + L8_23.max.x
          L7_22.max.y = L6_21.aabb.max.y + L8_23.max.y
          L7_22.max.z = L6_21.aabb.max.z + L8_23.max.z
          L7_22.min.x = L6_21.aabb.min.x + L8_23.min.x
          L7_22.min.y = L6_21.aabb.min.y + L8_23.min.y
          L7_22.min.z = L6_21.aabb.min.z + L8_23.min.z
          L6_21.evarea:setLocalAabb(L8_23)
        end
      end
    end
    L3_18(L4_19, L5_20)
    L3_18(L4_19, L5_20, L6_21, L7_22)
    L3_18(L4_19)
    L3_18()
    L3_18(L4_19)
    L4_19.pos = "locator2_cam_c2_02"
    L4_19.time = 4
    L5_20.pos = "locator2_cam_c2_03"
    L5_20.time = 4
    L6_21.pos = "locator2_cam_c2_04"
    L6_21.time = 3
    L5_20.pos = "locator2_aim_c2_02"
    L5_20.time = 4
    L6_21.pos = "locator2_aim_c2_03"
    L6_21.time = 4
    L7_22.pos = "locator2_aim_c2_04"
    L7_22.time = 3
    L8_23 = L4_19
    L5_20(L6_21, L7_22, L8_23)
    while true do
      if L5_20 then
        L5_20()
      end
    end
    L5_20(L6_21)
    L5_20(L6_21)
    L5_20(L6_21, L7_22)
    for L8_23, _FORV_9_ in L5_20(L6_21) do
      if _FORV_9_.evarea then
        _FORV_9_.evarea:setLocalAabb(_FORV_9_.aabb)
      end
    end
    L5_20(L6_21, L7_22)
  end
  L4_14 = Fn_skipMissionRetryAtProcessing
  L4_14 = L4_14(L3_13)
  if not L4_14 then
    L4_14 = Fn_missionStart
    L4_14()
  end
  L4_14 = Fn_sendEventComSb
  L4_14("requestChangeEnemyMarker", true)
  L4_14 = Fn_sendEventComSb
  L4_14("requestIdleEnemy", false)
  L4_14 = SetCounterStart
  L4_14(GEM_GOAL)
  L4_14 = createMineTimer
  L4_14 = L4_14()
  Fn_userCtrlOn()
  Fn_resetCoercionPose()
  Fn_sendEventComSb("crowSetMineObjects")
  wait()
  _brain_crow:requestFatal(false)
  print("\227\130\175\227\131\173\227\130\166\239\188\154\227\131\145\227\131\169\227\131\172\227\131\171\227\131\149\227\130\167\227\131\188\227\130\191\227\131\171OFF\239\188\129\239\188\129")
  _brain_crow:startMine()
  _crow_mine = true
  _brain_crow:unlockToWarp()
  _brain_crow:setAbility(Supporter.Ability.ActionInAir, true)
  CrowJumpEnd(_brain_crow)
  Fn_pcSensorOn("pccubesensor2_mining_area_distant_c_02")
  Fn_pcSensorOn("pccubesensor2_mining_area_warning_c2")
  Fn_pcSensorOn("pccubesensor2_mining_area_warp_c2")
  Fn_captionViewWait("sm14_02005")
  Fn_missionViewWait("sm14_02006")
  while true do
    if GlobalGem:GetOtherPreciousGemNum() >= GEM_GOAL then
      SetCounterEnd()
      Fn_captionViewWait("sm14_02007")
      break
    end
    if getMineTime() >= MINE_EXIT_TIME then
      SetCounterEnd()
      break
    end
    if L0_10 == nil and GlobalGem:GetOtherPreciousGemNum() >= ADD_ENEMY_TRIGGER_GEM_NUM then
      print("\227\130\168\227\131\141\227\131\159\227\131\188\232\191\189\229\138\160\233\150\139\229\167\139===========================================")
      L0_10 = findGameObject2("EnemyGenerator", "enmgen2_add_c2_01")
      if L0_10 ~= nil then
        L0_10:setEnemyMarker(true)
        L0_10:requestSpawn()
        while not L0_10:isPrepared() do
          wait()
        end
        L0_10:requestIdlingEnemy(false)
        print("\227\130\168\227\131\141\227\131\159\227\131\188\232\191\189\229\138\160\229\174\140\228\186\134")
      end
    end
    if Fn_sendEventComSb("crowOreBrokenCount") - Fn_sendEventComSb("kitOreBrokenCount") >= RETRY_ORE_GAP then
      Fn_userCtrlAllOff()
      CrowJumpPrepare(_brain_crow)
      Fn_sendEventComSb("requestIdleEnemy", true)
      waitSeconds(1)
      Fn_kaiwaDemoView("sm14_00440k")
      print("\227\131\170\227\131\136\227\131\169\227\130\164\229\174\159\232\161\140")
      Fn_missionRetry()
      break
    end
    wait()
  end
  L4_14 = Mv_safeTaskAbort(L4_14)
  resetMineTime()
  _crow_mine = true
  Fn_sendEventComSb("crowEndMine")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_c_02")
  Fn_pcSensorOff("pccubesensor2_mining_area_warning_c2")
  Fn_pcSensorOff("pccubesensor2_mining_area_warp_c2")
  SetCounterEnd()
  waitSeconds(3)
  Fn_captionViewEnd()
  CrowJumpPrepare(_brain_crow)
  Fn_sendEventComSb("requestIdleEnemy", true)
  Fn_userCtrlAllOff()
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_deleteSuppotArea(_brain_crow)
end
function pccubesensor2_mining_area_distant_OnEnter()
  Mv_setLeaveArea(false)
end
function pccubesensor2_mining_area_distant_OnLeave()
  Mv_setLeaveArea(true)
end
function pccubesensor2_catwarp_warning_OnLeave()
  warningCatWarp("locator2_navi_mining_c_01")
end
function pccubesensor2_catwarp_OnLeave()
  catWarp()
end
