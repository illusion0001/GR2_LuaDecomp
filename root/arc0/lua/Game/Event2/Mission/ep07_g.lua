dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_crow_pup = nil
function Initialize()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
  Fn_pcSensorOff("pccubesensor2_battle_range_01")
  Fn_pcSensorOff("pccubesensor2_battle_range_02")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = Fn_setCatWarp
  L1_1 = true
  L0_0(L1_1)
  L0_0 = Fn_spawnSuppotCrow
  L1_1 = true
  L0_0 = L0_0(L1_1)
  _crow_pup = L0_0
  L0_0 = _crow_pup
  L1_1 = L0_0
  L0_0 = L0_0.getBrain
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setIdling
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = {}
  L1_1.enable = true
  L2_2 = findGameObject2
  L3_3 = "Node"
  L2_2 = L2_2(L3_3, "locator2_crow_fatal_pos_01")
  L3_3 = L2_2
  L2_2 = L2_2.getWorldPos
  L2_2 = L2_2(L3_3)
  L1_1.pos = L2_2
  L3_3 = L0_0
  L2_2 = L0_0.setFatalRceiveInfo
  L2_2(L3_3, L1_1)
  L2_2 = invokeMobPanicTask
  L3_3 = L0_0
  L2_2 = L2_2(L3_3)
  L3_3 = Fn_missionStart
  L3_3()
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = Fn_missionView
  L3_3("ep07_06000")
  L3_3 = L0_0.setIdling
  L3_3(L0_0, false)
  L3_3 = HUD
  L3_3 = L3_3.createBossHpGauge
  L3_3 = L3_3(L3_3, {
    obj = _crow_pup,
    text = nil
  })
  L3_3:setActive(true)
  Fn_pcSensorOn("pccubesensor2_battle_range_01")
  Fn_pcSensorOn("pccubesensor2_battle_range_02")
  L0_0:setEnemyBossNavi(true)
  while true do
    wait()
    if L0_0:getHealth() <= 0 then
      while 5 < Fn_get_distance(_crow_pup:getWorldPos(), L1_1.pos) do
        wait(2)
      end
      FatalMarker.create(kFATAL_TYPE_ASH, nil, nil, L3_3):set(_crow_pup, "bn_pelvis", false)
      FatalMarker.create(kFATAL_TYPE_ASH, nil, nil, L3_3):run()
      while L0_0:getHealth() <= 0 and FatalMarker.create(kFATAL_TYPE_ASH, nil, nil, L3_3):isFatalFinish() == false do
        wait()
      end
      FatalMarker.create(kFATAL_TYPE_ASH, nil, nil, L3_3):kill()
    end
    if FatalMarker.create(kFATAL_TYPE_ASH, nil, nil, L3_3):isFatalFinish() ~= true then
    end
  end
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_battle_range_01")
  Fn_pcSensorOff("pccubesensor2_battle_range_02")
  invokeCaptionTask(L0_0):abort()
  Fn_captionViewEnd()
  invokeTask(function()
    while true do
      L3_3:setHp(L0_0:getHealth() / L0_0:getMaxHealth())
      wait()
    end
  end):abort()
  L3_3:setActive(false)
  L2_2:abort()
  L2_2 = nil
  Fn_whiteout(0.3)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function invokeMobPanicTask(A0_4)
  return invokeTask(function()
    while Player:getLastFrameDamagePoint() <= 0 and A0_4:getHealth() == A0_4:getHealth() do
      wait()
    end
    Mob:makeSituationPanic(true)
  end)
end
function invokeCaptionTask(A0_5)
  return invokeTask(function()
    Fn_captionView("ep07_06001")
    while true do
      wait()
      if true == true and (0 < Player:getLastFrameDamagePoint() or A0_5:getHealth() ~= A0_5:getHealth()) then
        Fn_captionView("ep07_06002")
      end
      if true == true then
        if A0_5:getHealth() <= A0_5:getMaxHealth() * 0.8 then
          Fn_captionView("ep07_06003")
        end
      elseif true == true then
        if A0_5:getHealth() <= A0_5:getMaxHealth() * 0.5 then
          Fn_captionView("ep07_06004")
        end
      elseif true == true then
        if A0_5:getHealth() <= A0_5:getMaxHealth() * 0.2 then
          Fn_captionView("ep07_06005")
        end
      elseif true == true and A0_5:getHealth() <= A0_5:getMaxHealth() * 0 then
        Fn_captionView("ep07_06006")
      end
    end
  end)
end
function pccubesensor2_battle_range_01_OnEnter()
  local L0_6, L1_7
end
function pccubesensor2_battle_range_01_OnLeave()
  Fn_captionView("ep07_06007")
end
function pccubesensor2_battle_range_02_OnEnter()
  local L0_8, L1_9
end
function pccubesensor2_battle_range_02_OnLeave()
  invokeTask(function()
    Fn_userCtrlOff()
    Player:setNoDamageMode(Player.kNoDamage_All, true)
    if _crow_pup ~= nil then
      _crow_pup:getBrain():setIdling(true)
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      _crow_pup:getBrain():warpToNode(findGameObject2("Node", "locator2_crow_start_pos"), Supporter.FirstAction.Ground)
      Fn_catWarpOut()
      _crow_pup:getBrain():setIdling(false)
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
    else
      Fn_catWarp()
    end
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Fn_userCtrlOn()
  end)
end
