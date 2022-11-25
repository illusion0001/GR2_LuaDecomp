import("Font")
import("Player")
import("Debug")
import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
Debug:setSwitch({
  "Development",
  "Console",
  "Script"
}, true)
pc_hp = 0
pc_hp_old = 0
npc_hp = 0
npc_hp_old = 0
pc_hp = 0
pc_state = 0
npc_state = 0
pc_state_old = 0
npc_state_old = 0
ringout_flag = false
pc_bell_cnt = 3
fi_bell_cnt = 3
phase_end = false
score = {}
ScoreClass = {}
function ScoreClass.new()
  local L0_0, L1_1
  L0_0 = {}
  L1_1 = {
    500,
    500,
    500,
    500,
    500
  }
  L0_0.max = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.pc = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.npc = L1_1
  L0_0.visible = true
  L0_0.ex = 1
  function L1_1(A0_2)
    local L1_3
    L1_3 = L0_0.max
    L1_3 = L1_3[A0_2]
    L1_3 = L1_3 / 2
    L0_0.pc = L1_3
    L1_3 = L0_0.max
    L1_3 = L1_3[A0_2]
    L1_3 = L1_3 / 2
    L0_0.npc = L1_3
  end
  L0_0.reset = L1_1
  function L1_1()
    while true do
      if L0_0.visible == true then
        Font:testPrint(700, 90, "\227\130\173\227\131\136\227\130\165\227\131\179\239\188\154" .. string.format("%02d", score.pc) .. " / " .. string.format("%02d", score.npc) .. "\239\188\154\227\131\149\227\130\163\227\131\188")
      end
      wait()
    end
  end
  L0_0.view = L1_1
  function L1_1()
    local L0_4, L1_5
    L0_0.visible = false
  end
  L0_0.off = L1_1
  function L1_1()
    local L0_6, L1_7
    L0_0.visible = true
  end
  L0_0.on = L1_1
  function L1_1(A0_8)
    local L1_9, L2_10
    L1_9 = L0_0.pc
    L2_10 = L0_0.ex
    L2_10 = A0_8 * L2_10
    L1_9 = L1_9 + L2_10
    L0_0.pc = L1_9
    L1_9 = L0_0.pc
    if L1_9 <= 0 then
      L0_0.pc = 0
    end
    L1_9 = L0_0.pc
    L2_10 = L0_0.max
    L2_10 = L2_10[1]
    if L1_9 >= L2_10 then
      L1_9 = L0_0.max
      L1_9 = L1_9[1]
      L0_0.pc = L1_9
    end
  end
  L0_0.updatepc = L1_1
  function L1_1(A0_11)
    local L1_12, L2_13
    L1_12 = L0_0.npc
    L2_13 = L0_0.ex
    L2_13 = A0_11 * L2_13
    L1_12 = L1_12 + L2_13
    L0_0.npc = L1_12
    L1_12 = L0_0.npc
    if L1_12 <= 0 then
      L0_0.npc = 0
    end
    L1_12 = L0_0.npc
    L2_13 = L0_0.max
    L2_13 = L2_13[1]
    if L1_12 >= L2_13 then
      L1_12 = L0_0.max
      L1_12 = L1_12[1]
      L0_0.npc = L1_12
    end
  end
  L0_0.updatenpc = L1_1
  function L1_1(A0_14)
    local L1_15, L2_16
    L1_15 = L0_0.max
    L1_15 = L1_15[A0_14]
    L2_16 = L0_0.pc
    if not (L1_15 <= L2_16) then
      L1_15 = L0_0.max
      L1_15 = L1_15[A0_14]
      L2_16 = L0_0.npc
    else
      if L1_15 <= L2_16 then
        L1_15 = false
        return L1_15
    end
    else
      L1_15 = true
      return L1_15
    end
  end
  L0_0.check = L1_1
  return L0_0
end
enmgen2_area_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator_01_01",
      name = "fi_01"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onObjectDead = function(A0_23, A1_24)
  end,
  onObjectAsh = function(A0_25, A1_26)
    local L3_27
    L3_27 = enmgen2_area_01
    L3_27.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_28, L1_29
    L0_28 = enmgen2_area_01
    L0_28 = L0_28.spawnSet
    L0_28 = #L0_28
    return L0_28
  end,
  getEnemyDeadNum = function()
    local L1_30
    L1_30 = enmgen2_area_01
    L1_30 = L1_30.enemyDeadNum
    return L1_30
  end,
  getEnemyName = function(A0_31)
    local L1_32
    L1_32 = enmgen2_area_01
    L1_32 = L1_32.spawnSet
    L1_32 = L1_32[A0_31]
    L1_32 = L1_32.name
    return L1_32
  end
}
function Initialize()
  score = ScoreClass.new()
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_33, L1_34, L2_35, L3_36
  function L0_33(A0_37)
    print("damage!")
  end
  function L1_34(A0_38)
    local L1_39
    L1_39 = pc_hp
    pc_hp_old = L1_39
    L1_39 = A0_38.player_hp
    pc_hp = L1_39
    L1_39 = npc_hp
    npc_hp_old = L1_39
    L1_39 = A0_38.fi_hp
    npc_hp = L1_39
    L1_39 = pc_state
    pc_state_old = L1_39
    L1_39 = A0_38.player_bell_state
    pc_state = L1_39
    L1_39 = npc_state
    npc_state_old = L1_39
    L1_39 = A0_38.fi_bell_state
    npc_state = L1_39
    L1_39 = pc_hp_old
    if L1_39 > pc_hp then
      L1_39 = pc_state
      if L1_39 == "equip" then
        L1_39 = npc_state
        if L1_39 == "equip" then
          L1_39 = score
          L1_39 = L1_39.updatepc
          L1_39(-1 * (pc_hp_old - pc_hp))
          L1_39 = score
          L1_39 = L1_39.updatenpc
          L1_39(pc_hp_old - pc_hp)
          L1_39 = score
          L1_39 = L1_39.npc
          L1_39 = L1_39 - score.pc
          L1_39 = L1_39 * 2
          L1_39 = L1_39 * 0.001
          A0_38.boarack_point = L1_39
        end
      end
      L1_39 = Player
      L1_39 = L1_39.getEnergyMax
      L1_39 = L1_39(L1_39, Player.kEnergy_Life)
      Player:setEnergy(Player.kEnergy_Life, L1_39)
    end
    L1_39 = npc_hp_old
    if L1_39 > npc_hp then
      L1_39 = pc_state
      if L1_39 == "equip" then
        L1_39 = npc_state
        if L1_39 == "equip" then
          L1_39 = score
          L1_39 = L1_39.updatepc
          L1_39(npc_hp_old - npc_hp)
          L1_39 = score
          L1_39 = L1_39.updatenpc
          L1_39(-1 * (npc_hp_old - npc_hp))
          L1_39 = score
          L1_39 = L1_39.npc
          L1_39 = L1_39 - score.pc
          L1_39 = L1_39 * 2
          L1_39 = L1_39 * 0.001
          A0_38.boarack_point = L1_39
        end
      end
    end
    L1_39 = A0_38.player_bell_state_trigger
    if L1_39 == "drop" then
    end
    L1_39 = A0_38.player_bell_state_trigger
    if L1_39 == "equip" then
      L1_39 = score
      L1_39 = L1_39.updatepc
      L1_39(score.max[1] * 0.1)
      L1_39 = score
      L1_39 = L1_39.updatenpc
      L1_39(score.max[1] * -0.1)
      L1_39 = score
      L1_39 = L1_39.npc
      L1_39 = L1_39 - score.pc
      L1_39 = L1_39 * 2
      L1_39 = L1_39 * 0.001
      A0_38.boarack_point = L1_39
    end
    L1_39 = A0_38.player_bell_state_trigger
    if L1_39 == "steal" then
      A0_38.boarack_reset_flag = true
      L1_39 = score
      L1_39 = L1_39.reset
      L1_39(1)
      L1_39 = pc_bell_cnt
      L1_39 = L1_39 - 1
      pc_bell_cnt = L1_39
    end
    L1_39 = A0_38.fi_bell_state_trigger
    if L1_39 == "drop" then
    end
    L1_39 = A0_38.fi_bell_state_trigger
    if L1_39 == "equip" then
      L1_39 = score
      L1_39 = L1_39.updatepc
      L1_39(score.max[1] * -0.1)
      L1_39 = score
      L1_39 = L1_39.updatenpc
      L1_39(score.max[1] * 0.1)
      L1_39 = score
      L1_39 = L1_39.npc
      L1_39 = L1_39 - score.pc
      L1_39 = L1_39 * 2
      L1_39 = L1_39 * 0.001
      A0_38.boarack_point = L1_39
    end
    L1_39 = A0_38.fi_bell_state_trigger
    if L1_39 == "steal" then
      A0_38.boarack_reset_flag = true
      L1_39 = score
      L1_39 = L1_39.reset
      L1_39(1)
      L1_39 = fi_bell_cnt
      L1_39 = L1_39 - 1
      fi_bell_cnt = L1_39
    end
    L1_39 = ringout_flag
    if L1_39 == true then
      A0_38.fi_ai_pause_flag = true
      A0_38.boarack_reset_flag = true
      L1_39 = score
      L1_39 = L1_39.reset
      L1_39(1)
    else
      A0_38.fi_ai_pause_flag = false
      L1_39 = fi_bell_cnt
      if L1_39 ~= 0 then
        L1_39 = pc_bell_cnt
      elseif L1_39 == 0 then
        phase_end = true
      end
    end
    return A0_38
  end
  L2_35 = Fn_setCatWarp
  L3_36 = false
  L2_35(L3_36)
  L2_35 = Fn_setCatWarpCheckPoint
  L3_36 = nil
  L2_35(L3_36)
  L2_35, L3_36 = nil, nil
  L2_35 = findGameObject2("EnemyGenerator", "enmgen2_area_01")
  L3_36 = findGameObject2("EnemyBrain", "fi_01")
  L3_36:setEventListener("damaged", L0_33)
  L3_36:setEventListener("boss_fi_BoarackJudgeReport", L1_34)
  print("enemy name " .. L3_36:getName())
  print("type name " .. L3_36:getTypeName())
  Fn_missionStart()
  invokeTask(function()
    score.view()
  end)
  invokeTask(function()
    while true do
      Font:asciiPrint(400, 90, string.format("%02d", pc_bell_cnt) .. " / " .. 3)
      Font:asciiPrint(1400, 90, string.format("%02d", fi_bell_cnt) .. " / " .. 3)
      wait()
    end
  end)
  Fn_countDown()
  Fn_userCtrlOn()
  Fn_userCtrlGravityOff()
  Fn_lockPlayerAbility({
    Player.kAbility_AttrTuneSwitch
  })
  while phase_end == false do
    wait()
  end
  Fn_Finish()
end
function Finalize()
  local L0_40, L1_41
end
function pccubesensor2_01_OnEnter(A0_42, A1_43)
end
function pccubesensor2_01_OnLeave(A0_44, A1_45)
end
function cubesensor2_01_OnEnter(A0_46, A1_47)
  print("sensor_in")
  invokeTask(function()
    ringout_flag = true
    Fn_blackout()
    Fn_resetPcPos("locator2_pc_start_pos")
    findGameObject2("EnemyBrain", "fi_01"):reset(get_gameobj_node_world_pos_rot("locator2_fi_pos"))
    print("gameobj name " .. A1_47:getName())
    if A1_47:getName() == "player" then
      pc_bell_cnt = pc_bell_cnt - 1
    end
    Fn_fadein()
    ringout_flag = false
  end)
end
function cubesensor2_01_OnLeave(A0_48, A1_49)
end
