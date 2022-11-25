dofile("/Game/Event2/Mission/ep04_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
EP04_DEBUG_FLAG = false
function Initialize()
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  if EP04_DEBUG_FLAG then
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
  end
end
function Ingame()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_setCatWarp
  L0_0(false)
  L0_0 = Fn_setCatWarpCheckPoint
  L0_0(nil)
  L0_0 = Player
  L0_0 = L0_0.setTargetingPriority
  L0_0(L0_0, Player.kTargetingPrio_GimmickBgFirst)
  L0_0 = Fn_resetPcPos
  L0_0("locator2_pc_start_pos")
  L0_0 = Fn_sendEventComSb
  L0_0("NpcResetPos")
  L0_0 = Fn_sendEventComSb
  L0_0("SetOutFiledNpcsGamePos")
  L0_0 = Fn_coercionPoseBattle
  L0_0()
  L0_0 = Fn_sendEventComSb
  L0_0("SetGageUiVisible", false)
  L0_0 = Fn_sendEventComSb
  L0_0("SetDemoFlagGetUp", false)
  L0_0 = Fn_sendEventComSb
  L0_0("ResetScore")
  L0_0 = wait
  L0_0()
  L0_0 = Fn_missionStart
  L0_0()
  while true do
    L0_0 = Fn_sendEventComSb
    L0_0 = L0_0("GetPhase")
    if L0_0 == 2 then
    elseif L0_0 == 3 then
    end
    Fn_sendEventComSb("SetEp04FlagFightState", EP04_FLAG_FIGHT_STATE.PLAY)
    wait()
    while Fn_sendEventComSb("GetEp04FlagFightState") == EP04_FLAG_FIGHT_STATE.PLAY do
      wait()
    end
    if L0_0 == 2 then
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
    elseif L0_0 == 3 then
      if true ~= Fn_sendEventComSb("CheckHiddenVictoryConditions", L0_0) then
        GameDatabase:set({
          [ggd.Savedata__EventFlags__ep04__flag01] = 0,
          [ggd.Savedata__EventFlags__ep04__flag02] = 0,
          [ggd.Savedata__EventFlags__ep04__flag03] = 0
        })
        wait(30)
        Fn_missionRetry()
        Fn_sendEventComSb("Finalize")
        return
      end
    end
  end
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = wait
  L0_0(30)
  L0_0 = Player
  L0_0 = L0_0.setTargetingPriority
  L0_0(L0_0, Player.kTargetingPrio_Default)
  L0_0 = Fn_resetCoercionPose
  L0_0()
  L0_0 = Fn_setNextMissionFlag
  L0_0()
  L0_0 = Fn_nextMission
  L0_0()
  L0_0 = Fn_exitSandbox
  L0_0()
end
function Finalize()
  Fn_sendEventComSb("SetEp04FlagFightState", EP04_FLAG_FIGHT_STATE.END)
  if EP04_DEBUG_FLAG then
    Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
  end
  Fn_sendEventComSb("SetGageUiVisible", false)
end
