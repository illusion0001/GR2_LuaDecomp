import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("HUD")
import("Player")
enmgen2_pi_a_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker_boss",
      locator = "locator_boss",
      name = "faker_01",
      ai_spawn_option = "Faker/faker_boss"
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
    local L3_10
    L3_10 = enmgen2_pi_a_10
    L3_10.enemyDeadNum = enmgen2_pi_a_10.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_11, L1_12
    L0_11 = enmgen2_pi_a_10
    L0_11 = L0_11.spawnSet
    L0_11 = #L0_11
    return L0_11
  end,
  getEnemyName = function(A0_13)
    local L1_14
    L1_14 = enmgen2_pi_a_10
    L1_14 = L1_14.spawnSet
    L1_14 = L1_14[A0_13]
    L1_14 = L1_14.name
    return L1_14
  end
}
function main()
  local L0_15, L1_16, L2_17, L3_18
  L0_15 = createSandbox2
  L1_16 = "father2"
  L0_15 = L0_15(L1_16)
  L2_17 = L0_15
  L1_16 = L0_15.setString
  L3_18 = "g_filename"
  L1_16(L2_17, L3_18, "/Game/Event2/father2.lua")
  L2_17 = L0_15
  L1_16 = L0_15.try_init
  L1_16(L2_17)
  L2_17 = L0_15
  L1_16 = L0_15.waitForReady
  L1_16(L2_17)
  L2_17 = L0_15
  L1_16 = L0_15.try_start
  L1_16(L2_17)
  while true do
    L2_17 = L0_15
    L1_16 = L0_15.sendEvent
    L3_18 = "isPcSpawned"
    L1_16 = L1_16(L2_17, L3_18)
    if not L1_16 then
      L1_16 = wait
      L1_16()
    end
  end
  L1_16 = Debug
  L2_17 = L1_16
  L1_16 = L1_16.setSwitch
  L3_18 = {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }
  L1_16(L2_17, L3_18, true)
  L1_16 = Debug
  L2_17 = L1_16
  L1_16 = L1_16.setSwitch
  L3_18 = {
    "Game Objects",
    "Player",
    "GravityPower: Infinite"
  }
  L1_16(L2_17, L3_18, true)
  L1_16 = createGameObject2
  L2_17 = "Area"
  L1_16 = L1_16(L2_17)
  L3_18 = L1_16
  L2_17 = L1_16.setName
  L2_17(L3_18, "pi_a_root")
  L3_18 = L1_16
  L2_17 = L1_16.setDriftEnable
  L2_17(L3_18, false)
  L2_17 = createGameObject2
  L3_18 = "Area"
  L2_17 = L2_17(L3_18)
  L3_18 = L2_17.setName
  L3_18(L2_17, "test_cubemap_sky_01")
  L3_18 = L2_17.setDriftEnable
  L3_18(L2_17, false)
  L3_18 = Fn_fatalInit
  L3_18()
  L3_18 = initializeAllGameObjects
  L3_18()
  L3_18 = waitForReadyAllGameObjects
  L3_18()
  L3_18 = startAllGameObjects
  L3_18()
  L3_18 = HUD
  L3_18 = L3_18.grgDispReq_FadeIn
  L3_18(L3_18)
  L3_18 = HUD
  L3_18 = L3_18.spgDispReq_FadeIn
  L3_18(L3_18)
  L3_18 = HUD
  L3_18 = L3_18.hpgDispReq_FadeIn
  L3_18(L3_18)
  L3_18 = _loadEventData
  L3_18("test_enemy_type_05")
  L3_18 = Player
  L3_18 = L3_18.reset
  L3_18(L3_18, Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  L3_18 = findGameObject2
  L3_18 = L3_18("Puppet", "faker_01")
  while not L3_18:isRunning() do
    wait()
  end
  Fn_bossGauge(L3_18)
  Fn_fatalRun(L3_18, "loc_setCore07", nil)
  while not Fn_getFatalFinish() do
    wait()
  end
end
function _loadEventData(A0_19)
  local L1_20, L2_21, L3_22
  L1_20 = loadFileAsset
  L2_21 = "evb"
  L3_22 = "evx/"
  L3_22 = L3_22 .. A0_19
  L1_20 = L1_20(L2_21, L3_22)
  L2_21, L3_22 = nil, nil
  if L1_20 ~= nil then
    L1_20:wait()
    L2_21 = L1_20:getRoot()
    L3_22 = EventData:create(A0_19, nil, L2_21)
    L3_22:try_init()
    L3_22:waitForReady()
    L3_22:try_start()
  end
end
__fatal_finish = false
__fatal_puppet = nil
__fatal_brain = nil
__boss_gauge = nil
function Fn_fatalInit(A0_23)
  local L1_24, L2_25
  L1_24 = "fatal_marker01"
  if A0_23 == true then
    L1_24 = "fatal_marker02"
  end
  L2_25 = "CharDefs/npc/"
  L2_25 = L2_25 .. L1_24
  __fatal_puppet = createGameObject2("Puppet")
  __fatal_puppet:setName(L1_24)
  __fatal_brain = createGameObject2("ActorBrain")
  __fatal_brain:setName(L1_24)
  loadFileAsset("evd", L2_25):wait()
  __fatal_puppet:setDescription(loadFileAsset("evd", L2_25):getRoot())
  __fatal_brain:try_init()
  __fatal_puppet:try_init()
  __fatal_brain:waitForReady()
  __fatal_puppet:waitForReady()
  __fatal_puppet:setBrain(__fatal_brain)
  __fatal_puppet:setIgnoreGrab(true)
  __fatal_puppet:setActive(false)
  __fatal_puppet:loadAnimationSet(L2_25)
  while __fatal_puppet:isLoading() do
    wait()
  end
end
function Fn_fatalRun(A0_26, A1_27, A2_28)
  local L3_29
  if A0_26 ~= nil then
    L3_29 = A0_26.getBrain
    L3_29 = L3_29(A0_26)
    if L3_29:isInstance("EnemyBrain") then
      invokeTask(function()
        local L0_30, L1_31, L2_32
        L0_30, L1_31 = nil, nil
        while true do
          L2_32 = __fatal_finish
          if not L2_32 then
            L2_32 = L3_29
            L2_32 = L2_32.isFatalAction
            L2_32 = L2_32(L2_32)
            if L2_32 then
              if L0_30 == nil then
                L2_32 = HUD
                L2_32 = L2_32.createFatalMarker
                L2_32(L2_32, {
                  obj = A0_26,
                  joint = A1_27,
                  len_fs = 40,
                  pobj = A2_28,
                  len_ps = 10
                })
                L2_32 = A2_28
                if L2_32 ~= nil then
                  L2_32 = A2_28
                  L2_32 = L2_32.getBrain
                  L2_32 = L2_32(L2_32)
                  L2_32:requestFatal(true)
                  L2_32:setKeepDistanceOfFatal(3)
                end
                L2_32 = __boss_gauge
                L2_32 = L2_32.setActive
                L2_32(L2_32, false)
                L2_32 = invokeTask
                L2_32 = L2_32(function()
                  local L0_33
                  L0_33 = A0_26
                  L0_33 = L0_33.appendChildToJoint
                  L0_33(L0_33, __fatal_puppet, A1_27, false)
                  L0_33 = {}
                  L0_33 = {
                    {
                      blendDuration = 0,
                      endTimeOffset = 0,
                      name = "in",
                      numLoops = 0
                    }
                  }
                  __fatal_brain:playAnimSequence(L0_33, true)
                  wait()
                  __fatal_puppet:setActive(true)
                  wait()
                  while not __fatal_puppet:isPoseAnimEnd() do
                    wait()
                  end
                  L0_33 = {
                    {
                      blendDuration = 0.3,
                      endTimeOffset = 0,
                      name = "loop",
                      numLoops = 1
                    }
                  }
                  __fatal_brain:playAnimSequence(L0_33, true)
                  while true do
                    wait()
                  end
                end)
                L1_31 = L2_32
                L2_32 = invokeTask
                L2_32 = L2_32(function()
                  local L0_34, L1_35, L2_36
                  L0_34, L1_35, L2_36 = nil, nil, nil
                  while not _boss_end do
                    L0_34 = nil
                    L2_36 = nil
                    if HUD:getFatalState() == HUD.kFatalState_None then
                    elseif HUD:getFatalState() == HUD.kFatalState_OutRangeTarget then
                      L0_34 = "ui_object_fin_02"
                    elseif HUD:getFatalState() == HUD.kFatalState_OutRangeNpc then
                    elseif HUD:getFatalState() == HUD.kFatalState_OutScreenTarget then
                    elseif HUD:getFatalState() == HUD.kFatalState_Visible then
                      L2_36 = "ui_keyguide_fin_01"
                      if Pad:getButton(Pad.kButton_TouchPad) then
                        __fatal_finish = true
                      end
                    end
                    if L0_34 ~= L1_35 then
                      L1_35 = L0_34
                      if L0_34 ~= nil then
                        Fn_missionView(L0_34, 0)
                      else
                        HUD:missionEnd(1)
                      end
                    end
                    if L2_36 ~= nil then
                      if L2_36 == nil then
                        HUD:setTextCommonCtrlGuide()
                      else
                        HUD:setTextCommonCtrlGuide(L2_36)
                      end
                    end
                    wait()
                  end
                end)
                L0_30 = L2_32
                L2_32 = wait
                L2_32()
              end
            else
              if L0_30 ~= nil then
                L2_32 = L0_30.isRunning
                L2_32 = L2_32(L0_30)
                if L2_32 then
                  L2_32 = L0_30.abort
                  L2_32(L0_30)
                  L2_32 = __boss_gauge
                  if L2_32 ~= nil then
                    L2_32 = __boss_gauge
                    L2_32 = L2_32.setActive
                    L2_32(L2_32, true)
                  end
                  L2_32 = HUD
                  L2_32 = L2_32.deleteFatalMarker
                  L2_32(L2_32)
                  L2_32 = HUD
                  L2_32 = L2_32.setTextCommonCtrlGuide
                  L2_32(L2_32)
                  L2_32 = A2_28
                  if L2_32 ~= nil then
                    L2_32 = A2_28
                    L2_32 = L2_32.getBrain
                    L2_32 = L2_32(L2_32)
                    L2_32:requestFatal(false)
                  end
                  L0_30 = nil
                end
              end
              if L1_31 ~= nil then
                L2_32 = L1_31.isRunning
                L2_32 = L2_32(L1_31)
                if L2_32 then
                  L2_32 = L1_31.abort
                  L2_32(L1_31)
                  L1_31 = nil
                  L2_32 = {
                    {
                      blendDuration = 0.3,
                      endTimeOffset = 0,
                      name = "out",
                      numLoops = 0
                    }
                  }
                  __fatal_brain:playAnimSequence(L2_32, true)
                  wait()
                  while not __fatal_puppet:isPoseAnimEnd() do
                    wait()
                  end
                  __fatal_puppet:setActive(false)
                end
              end
            end
            L2_32 = wait
            L2_32()
          end
        end
      end)
    end
  else
  end
end
function Fn_getFatalFinish()
  local L0_37, L1_38
  L0_37 = __fatal_finish
  return L0_37
end
function Fn_bossGauge(A0_39)
  local L1_40
  if A0_39 ~= nil then
    L1_40 = A0_39.getBrain
    L1_40 = L1_40(A0_39)
    if L1_40:isInstance("EnemyBrain") then
      invokeTask(function()
        __boss_gauge = HUD:createBossHpGauge({obj = A0_39})
        __boss_gauge:setActive(true)
        while A0_39:isRunning() do
          __boss_gauge:setHp(L1_40:getHealth() / L1_40:getMaxHealth())
          wait()
        end
      end)
      wait()
    end
  else
  end
end
