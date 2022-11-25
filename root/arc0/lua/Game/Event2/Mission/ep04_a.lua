dofile("/Game/Event2/Mission/ep04_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
_EP04_DEBUG_FLAG = false
function Initialize()
  Fn_captionViewEnd()
  if _EP04_DEBUG_FLAG then
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
  end
  _demo01_cut05 = SDemo.create("Ep04Demo01_Cut05")
end
function Ingame()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_setCatWarp
  L1_1 = false
  L0_0(L1_1)
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = nil
  L0_0(L1_1)
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setTargetingPriority
  L0_0(L1_1, Player.kTargetingPrio_GimmickBgFirst)
  L0_0 = Fn_sendEventComSb
  L1_1 = "SetNpcEnemyMarkerVisible"
  L0_0(L1_1, false)
  L0_0 = Fn_sendEventComSb
  L1_1 = "GetLoadedEp04SaveData"
  L0_0 = L0_0(L1_1, ggd.GlobalSystemFlags__GameRetry)
  if L0_0 == false then
    L1_1 = Ep04ScriptDemo01Run
    L1_1()
    L1_1 = Ep04ScriptFightPreparation
    L1_1()
  else
    L1_1 = Ep04ScriptFightPreparation
    L1_1()
    L1_1 = Fn_missionStart
    L1_1()
  end
  while true do
    while true do
      L1_1 = Fn_sendEventComSb
      L1_1 = L1_1("GetPhase")
      if L1_1 == 1 then
      elseif L1_1 == 2 then
      end
      Fn_sendEventComSb("SetEp04FlagFightState", EP04_FLAG_FIGHT_STATE.PLAY)
      wait()
      while Fn_sendEventComSb("GetEp04FlagFightState") == EP04_FLAG_FIGHT_STATE.PLAY do
        wait()
      end
      if L1_1 == 1 then
        if not (Fn_sendEventComSb("GetPcWinNum") > Fn_sendEventComSb("GetNpcWinNum")) then
          if L1_1 == 2 then
            wait(30)
            if Fn_sendEventComSb("GetNpcWinNum") == 2 then
              GameDatabase:set({
                [ggd.Savedata__EventFlags__ep04__flag01] = 0,
                [ggd.Savedata__EventFlags__ep04__flag02] = 0,
                [ggd.Savedata__EventFlags__ep04__flag03] = 0
              })
              wait(30)
              Fn_missionRetry()
              Fn_sendEventComSb("Finalize")
            end
            break
          end
        end
      end
    end
  end
  L1_1 = Fn_sendEventComSb
  L1_1("SetGageUiVisible")
  L1_1 = wait
  L1_1(10)
  L1_1 = {}
  L1_1[ggd.EventFlags__ep04__flag01] = 1
  L1_1[ggd.EventFlags__ep04__flag04] = 0
  GameDatabase:set(L1_1)
  Player:setTargetingPriority(Player.kTargetingPrio_Default)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _EP04_DEBUG_FLAG then
    Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
  end
  Fn_sendEventComSb("SetGageUiVisible")
end
function Ep04ScriptDemo01Run()
  Fn_resetPcPos("locator2_pc_start_pos_03")
  Fn_coercionPoseNomal()
  Fn_sendEventComSb("SetOutFiledNpcsDemPos")
  Fn_sendEventComSb("SetDemoFlagGetUp", true)
  _demo01_cut05:reset()
  _demo01_cut05:set("locator2_demo_cam_eye_03", "locator2_demo_cam_at_03", true)
  _demo01_cut05:play({
    {
      pos = "locator2_demo_cam_eye_02",
      time = 2
    }
  }, {
    {
      pos = "locator2_demo_cam_at_02",
      time = 2
    }
  })
  wait()
  Fn_missionStart()
  while _demo01_cut05:isPlay() do
    wait()
  end
  waitSeconds(0.5)
  Fn_kaiwaDemoView("ep04_00110k")
  waitSeconds(0.75)
  Fn_blackout(1)
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  _demo01_cut05:stop()
end
function Ep04ScriptFightPreparation()
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_coercionPoseBattle()
  Fn_sendEventComSb("SetOutFiledNpcsGamePos")
  Fn_sendEventComSb("SetDemoFlagGetUp", false)
  waitSeconds(0.5)
end
