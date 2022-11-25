dofile("/Game/Event2/Common/EventCommon.lua")
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01",
      ai_spawn_option = "Demon/demon_boss"
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
    _enemy_cnt = _enemy_cnt - 1
  end
}
_kitMotionTable = {
  motion1 = "kit01_down_a_00",
  motion2 = "kit01_down_b_00"
}
function Initialize()
  Fn_loadPlayerMotion(_kitMotionTable)
  Fn_setCatActive(off)
  Fn_loadEventData("evx/ep26_boss", "evarea2_dt_c_root", true)
  Fn_loadEventData("evx/dt_brk_eff2", "evarea2_dt_c_root", true)
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L0_8 = Fn_lookAtObject
  L1_9 = "locator2_daemon_cam"
  L2_10 = 0
  L0_8 = L0_8(L1_9, L2_10)
  L1_9 = Player
  L2_10 = L1_9
  L1_9 = L1_9.setEnergyFakeLimit
  L3_11 = Player
  L3_11 = L3_11.kEnergy_Life
  L1_9(L2_10, L3_11, L4_12)
  L1_9 = Player
  L2_10 = L1_9
  L1_9 = L1_9.setAbility
  L3_11 = Player
  L3_11 = L3_11.kAbility_TalismanEffect
  L1_9(L2_10, L3_11, L4_12)
  L1_9 = GameDatabase
  L2_10 = L1_9
  L1_9 = L1_9.set
  L3_11 = ggd
  L3_11 = L3_11.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L1_9(L2_10, L3_11, L4_12)
  L1_9 = Player
  L2_10 = L1_9
  L1_9 = L1_9.getPuppet
  L1_9 = L1_9(L2_10)
  L3_11 = L1_9
  L2_10 = L1_9.getWorldPos
  L2_10 = L2_10(L3_11)
  L3_11 = Fn_findGimmickBgInBgset
  L3_11 = L3_11(L4_12)
  L7_15 = 100
  L4_12(L5_13, L6_14, L7_15)
  L4_12(L5_13)
  if L0_8 ~= nil then
    L4_12(L5_13)
    L0_8 = nil
  end
  L7_15 = Vector
  L7_15 = L7_15(0, 0, 0)
  L4_12(L5_13, L6_14, L7_15, IdentQuat(), Vector(1, 1, 1))
  L4_12(L5_13)
  for L7_15 = 51, 55 do
    Fn_createEffect("exp", "ef_ev_smk_04", findGameObject2("Node", "locator2_smk_" .. string.format("%02d", L7_15)):getWorldPos(), false)
  end
  for L7_15 = 51, 63 do
    Fn_createEffect("exp", "ef_ev_fir_04_ns", findGameObject2("Node", "locator2_fir_" .. string.format("%02d", L7_15)):getWorldPos(), false)
  end
  while true do
    if L4_12 == nil then
      _demon_puppet = L4_12
      L4_12()
    end
  end
  L5_13(L6_14)
  L5_13(L6_14)
  L5_13(L6_14)
  L5_13(L6_14)
  L5_13(L6_14)
  L7_15 = "kit_566"
  _kit566 = L5_13
  L7_15 = "catastrophic_009"
  _demon_001 = L5_13
  L7_15 = "ef_ev_fir_04"
  fire3 = L5_13
  L7_15 = Player
  L7_15 = L7_15.kSpecialTuning_Ep26Groggy
  L5_13(L6_14, L7_15)
  L5_13()
  L5_13()
  L5_13(L6_14)
  L7_15 = _kit566
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "kit_568"
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "kit_566"
  _kit566 = L5_13
  L5_13(L6_14)
  L7_15 = _demon_001
  L5_13(L6_14, L7_15)
  L7_15 = "catastrophic_001"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_005"
  L5_13(L6_14, L7_15)
  L7_15 = 3
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_002"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_007"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = _kit566
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "kit_567"
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "kit_566"
  _kit566 = L5_13
  L5_13(L6_14)
  L7_15 = "catastrophic_003"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_004"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_006"
  L5_13(L6_14, L7_15)
  L7_15 = 3
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_005"
  L5_13(L6_14, L7_15)
  L7_15 = 3
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_008"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_006"
  L5_13(L6_14, L7_15)
  L7_15 = 3
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_002"
  L5_13(L6_14, L7_15)
  L7_15 = 4
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_007"
  L5_13(L6_14, L7_15)
  L7_15 = 5
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = _kit566
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = _kit566
  L5_13(L6_14, L7_15)
  L7_15 = "kit_615"
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L5_13(L6_14)
  L7_15 = "kit_566"
  _kit566 = L5_13
  L5_13(L6_14)
  L7_15 = "catastrophic_008"
  L5_13(L6_14, L7_15)
  L7_15 = 3
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "stopSE_Body"
  L5_13(L6_14, L7_15)
  L7_15 = fire3
  L5_13(L6_14, L7_15)
  L7_15 = _kit566
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L7_15 = "catastrophic_001"
  L5_13(L6_14, L7_15)
  L7_15 = 6
  L5_13(L6_14, L7_15)
  L5_13(L6_14)
  L5_13(L6_14)
  L7_15 = 0
  L5_13(L6_14, L7_15)
  L5_13()
  L5_13()
  L5_13()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Player:setAbility(Player.kAbility_TalismanEffect, true)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
end
function navi_on()
  local L0_16, L1_17
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function push_trybutton()
  repeat
    wait()
  until Pad:getButton(Pad.kButton_RU) == true
end
