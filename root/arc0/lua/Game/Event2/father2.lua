import("math")
import("GameDatabase")
import("Debug")
import("Player")
import("HUD")
import("GameFlow")
import("Camera")
import("Analytics")
import("GlobalGem")
import("Area")
import("Debug")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Event2/Table/PlayerAbilityTable.lua")
dofile("/Game/Param/Player/PlayerLevel.lua")
dofile("/Game/Misc/felgar.lua")
_exit_sandbox = false
_initialize_comp = false
_player_ability = true
_player_ability_unlock = {}
_player_ability_lock = {}
_player_ctrl_all = true
_player_l_stick = true
_player_r_stick = true
_player_v_inf = nil
_player_g_inf = nil
_player_s_inf = nil
_player_all_off = false
_player_debug = {}
_player_costume = "None"
_player_event_mot = {}
_player_load_mot = false
_player_energy = true
_player_tuto = false
_player_v_inf_back = false
_player_g_inf_back = false
_player_s_inf_back = false
_player_load_crow_seresource = false
_player_damage_type = nil
_photomode_costumechange_flag = false
_photomode_costume_changed = false
_costume = nil
_player = nil
_cat = nil
_raven = nil
_cat_active = true
_is_my_home = false
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L0_0 = print
  L1_1 = " < father2 > start"
  L0_0(L1_1)
  L0_0 = createGameObject2
  L1_1 = "Player"
  L0_0 = L0_0(L1_1)
  _player = L0_0
  L0_0 = _player
  L1_1 = L0_0
  L0_0 = L0_0.setName
  L2_2 = "player"
  L0_0(L1_1, L2_2)
  L0_0 = _player
  L1_1 = L0_0
  L0_0 = L0_0.setWorldTransform
  L2_2 = Vector
  L3_3 = 0
  L8_8 = L2_2(L3_3, L4_4, L5_5)
  L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L2_2(L3_3, L4_4, L5_5))
  L0_0 = print
  L1_1 = " < father2 > player create"
  L0_0(L1_1)
  L0_0 = g_own
  L1_1 = L0_0
  L0_0 = L0_0.getGameObject
  L2_2 = "mother2"
  L0_0 = L0_0(L1_1, L2_2)
  if L0_0 then
    L2_2 = L0_0
    L1_1 = L0_0.getGameObject
    L3_3 = "enemyManager"
    L1_1 = L1_1(L2_2, L3_3)
    if L1_1 then
      L3_3 = L1_1
      L2_2 = L1_1.effectResCashStart
      L2_2(L3_3)
    end
  end
  L0_0 = Supporter
  L0_0 = L0_0.Spawner
  L0_0 = L0_0.create_supporter_cat
  L1_1 = LayoutPosYaw
  L2_2 = Vector
  L3_3 = 0
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = Deg2Rad
  L8_8 = L3_3(L4_4)
  L8_8 = L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L3_3(L4_4))
  L0_0 = L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L3_3(L4_4)))
  _cat = L0_0
  L0_0 = print
  L1_1 = " < father2 > cat create"
  L0_0(L1_1)
  L0_0 = createGameObject2
  L1_1 = "PlayerCamera2"
  L2_2 = {}
  L2_2.name = "_cam:_main"
  L2_2.autoRun = true
  L0_0 = L0_0(L1_1, L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "playerCamera2"
  L1_1(L2_2, L3_3)
  L1_1 = print
  L2_2 = " < father2 > player camera create"
  L1_1(L2_2)
  L1_1 = Felgar
  L2_2 = L1_1
  L1_1 = L1_1.create
  L3_3 = _player
  L2_2 = L1_1(L2_2, L3_3)
  L3_3 = _player
  L3_3 = L3_3.bindFelineHaunter
  L3_3(L4_4, L5_5)
  L3_3 = _player
  L3_3 = L3_3.bindFelineLeopard
  L3_3(L4_4, L5_5)
  L3_3 = _setCostume
  L3_3(L4_4, L5_5)
  L3_3 = HUD
  L3_3 = L3_3.menuSetCallback
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = print
  L3_3(L4_4)
  L3_3 = initializeAllGameObjects
  L3_3()
  L3_3 = Player
  L3_3 = L3_3.setBuddy
  L8_8 = L5_5(L6_6)
  L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L5_5(L6_6))
  L3_3 = waitForReadyAllGameObjects
  L3_3()
  L3_3 = startAllGameObjects
  L3_3()
  L3_3 = Player
  L3_3 = L3_3.setControl
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = GlobalGem
  L3_3 = L3_3.SetEnableGemGet
  L3_3(L4_4, L5_5)
  _initialize_comp = true
  L3_3 = HUD
  L3_3 = L3_3.naviSetUsersNearDistance
  L3_3(L4_4, L5_5)
  L3_3 = print
  L3_3(L4_4)
  L3_3 = Player
  L3_3 = L3_3.setPowerUpLevel
  L7_7 = L6_6
  L8_8 = ggd
  L8_8 = L8_8.Savedata__Player__Level
  L8_8 = L6_6(L7_7, L8_8)
  L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L6_6(L7_7, L8_8))
  L3_3 = GameDatabase
  L3_3 = L3_3.get
  L3_3 = L3_3(L4_4, L5_5)
  if L3_3 then
    L3_3 = GameDatabase
    L3_3 = L3_3.get
    L3_3 = L3_3(L4_4, L5_5)
    if L3_3 ~= "eventheader" then
      L7_7 = 2
    elseif L4_4 == "sm" then
      L7_7 = L4_4
      L8_8 = "%d+"
      L8_8 = L6_6(L7_7, L8_8)
      if L5_5 == 28 then
        L3_3 = "ep27"
      else
        L7_7 = L5_5
        L3_3 = L6_6 .. L7_7
      end
    end
    L7_7 = 3
    if L4_4 == "eps" then
      L7_7 = "%d+"
      L8_8 = L5_5(L6_6, L7_7)
      if L4_4 == 28 then
        L3_3 = "ep27"
      else
        L3_3 = L5_5 .. L6_6
      end
    end
    L7_7 = 1
    L8_8 = 4
    if L4_4 then
      L7_7 = L3_3
      L8_8 = 1
      for L7_7, L8_8 in L4_4(L5_5) do
        if L7_7 == "base" then
          Player:setPowerUpLevel(Player.kPowUpCateg_Base, L8_8)
          GameDatabase:set(ggd.Savedata__Player__Level, L8_8)
          if L8_8 == 0 then
            GameDatabase:set(ggd.Savedata__Player__Experience, 0)
          else
            GameDatabase:set(ggd.Savedata__Player__Experience, _level[L8_8])
          end
          GameDatabase:backup(ggd.Savedata__Player__Level)
          GameDatabase:backup(ggd.Savedata__Player__Experience)
        elseif L7_7 == "combat" then
          Player:setPowerUpLevel(Player.kPowUpCateg_Combat, L8_8)
        elseif L7_7 == "dodge" then
          Player:setPowerUpLevel(Player.kPowUpCateg_Dodge, L8_8)
        elseif L7_7 == "gravity_kick" then
          Player:setPowerUpLevel(Player.kPowUpCateg_GravityKick, L8_8)
        elseif L7_7 == "grab" then
          Player:setPowerUpLevel(Player.kPowUpCateg_Grab, L8_8)
        elseif L7_7 == "slider" then
          Player:setPowerUpLevel(Player.kPowUpCateg_Slider, L8_8)
        elseif L7_7 == "special_atk" then
          Player:setPowerUpLevel(Player.kPowUpCateg_SpecialAtk, L8_8)
        end
      end
    end
  end
  L3_3 = g_own
  L3_3 = L3_3.getBool
  L3_3 = L3_3(L4_4, L5_5)
  if L3_3 then
    L3_3 = _setPlayerAbility
    L3_3(L4_4)
  end
  L3_3 = Debug
  L3_3 = L3_3.isMasterBuild
  L3_3 = L3_3(L4_4)
  if not L3_3 then
    L3_3 = debugDisp
    L3_3()
  end
  L3_3 = wait
  L3_3()
  L3_3 = _recoverEnergyFully
  L3_3()
  L3_3 = GameDatabase
  L3_3 = L3_3.get
  L3_3 = L3_3(L4_4, L5_5)
  if L3_3 then
    L3_3 = Debug
    L3_3 = L3_3.disableGameOver
    L3_3(L4_4, L5_5)
    L3_3 = invokeTask
    L3_3(L4_4)
  else
    L3_3 = invokeTask
    L3_3(L4_4)
  end
  L3_3 = invokeTask
  L3_3(L4_4)
  L3_3 = GameDatabase
  L3_3 = L3_3.set
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = print
  L3_3(L4_4)
end
function exitsandbox()
  GameFlow:suspendSensorOnGameOver(false)
  GameDatabase:set(ggd.GlobalSystemFlags__PlayerSpawned, false)
  Player:setGestureEventMode(false)
  Finalize()
  _debugSystemTask = false
  _exit_sandbox = true
end
setExitCallback(exitsandbox)
function initialized()
  local L0_9, L1_10
  L0_9 = _initialize_comp
  return L0_9
end
function Finalize()
  local L0_11, L1_12
end
function isPcSpawned()
  return GameDatabase:get(ggd.GlobalSystemFlags__PlayerSpawned)
end
function _gameOver()
  local L0_13
  while true do
    L0_13 = GameDatabase
    L0_13 = L0_13.get
    L0_13 = L0_13(L0_13, ggd.GlobalSystemFlags__GameOverEnable)
    if L0_13 then
      L0_13 = GameDatabase
      L0_13 = L0_13.get
      L0_13 = L0_13(L0_13, ggd.GlobalSystemFlags__Demo)
      if not L0_13 then
        L0_13 = Player
        L0_13 = L0_13.getEnergy
        L0_13 = L0_13(L0_13, Player.kEnergy_Life)
        if not (L0_13 <= 0) then
          L0_13 = Player
          L0_13 = L0_13.getDeathState
          L0_13 = L0_13(L0_13)
          if L0_13 ~= Player.kDeath_Dead then
            L0_13 = GameDatabase
            L0_13 = L0_13.get
            L0_13 = L0_13(L0_13, ggd.GlobalSystemFlags__GameOver)
          end
        elseif L0_13 then
          L0_13 = print
          L0_13(" < father2 > \227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\227\130\146\229\174\159\232\161\140\227\129\151\227\129\190\227\129\153")
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__GameOverFlow, true)
          L0_13 = GameFlow
          L0_13 = L0_13.suspendAllSensor
          L0_13(true)
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__DeadOutrangeLock, true)
          L0_13 = GlobalGem
          L0_13 = L0_13.SetEnableGemGet
          L0_13(L0_13, false)
          while true do
            L0_13 = GameDatabase
            L0_13 = L0_13.get
            L0_13 = L0_13(L0_13, ggd.GlobalSystemFlags__GameOverWait)
            if L0_13 then
              L0_13 = wait
              L0_13()
            end
          end
          L0_13 = Analytics
          L0_13 = L0_13.gameover
          L0_13(L0_13, GameDatabase:get(ggd.GlobalSystemFlags__StrewCnt))
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__StrewCnt, 0)
          L0_13 = GameDatabase
          L0_13 = L0_13.get
          L0_13 = L0_13(L0_13, ggd.GlobalSystemFlags__GameOverNoTime)
          if L0_13 then
            L0_13 = GameFlow
            L0_13 = L0_13.setGameOver
            L0_13(L0_13, true, 0)
          else
            L0_13 = GameFlow
            L0_13 = L0_13.setGameOver
            L0_13(L0_13, true, 3)
          end
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__GameOverNoTime, false)
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__GameOver, true)
          L0_13 = GameDatabase
          L0_13 = L0_13.set
          L0_13(L0_13, ggd.GlobalSystemFlags__ObjectRestore, true)
          L0_13 = GameDatabase
          L0_13 = L0_13.get
          L0_13 = L0_13(L0_13, ggd.Savedata__StatisticalChart__GameOverCount)
          L0_13 = L0_13 + 1
          if L0_13 > 9999999 then
            L0_13 = 9999999
          end
          GameDatabase:set(ggd.Savedata__StatisticalChart__GameOverCount, L0_13)
          GameDatabase:backup(ggd.Savedata__StatisticalChart__GameOverCount)
          repeat
            wait()
          until not GameFlow:isGameOver()
          repeat
            wait()
          until not GameDatabase:get(ggd.GlobalSystemFlags__IsRetryProsess)
          _recoverEnergyFully()
          Player:setSituation(Player.kSituation_Normal, true, 0.01, false, false)
          GameFlow.suspendAllSensor(false)
          GameFlow:setGameOver(false, 1)
          GameDatabase:set(ggd.GlobalSystemFlags__GameOver, false)
          GameDatabase:set(ggd.GlobalSystemFlags__DeadOutrangeLock, false)
          GameDatabase:set(ggd.GlobalSystemFlags__GameOverFlow, false)
          GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
          print(" < father2 > \227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\227\130\146\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
        end
      end
    end
    L0_13 = wait
    L0_13()
  end
end
function _recoverEnergyFully()
  local L0_14, L1_15, L2_16
  L0_14 = Player
  L1_15 = L0_14
  L0_14 = L0_14.setEnergy
  L2_16 = Player
  L2_16 = L2_16.kEnergy_Life
  L0_14(L1_15, L2_16, Player:getEnergyMax(Player.kEnergy_Life))
  L0_14 = Player
  L1_15 = L0_14
  L0_14 = L0_14.setEnergy
  L2_16 = Player
  L2_16 = L2_16.kEnergy_Gravity
  L0_14(L1_15, L2_16, Player:getEnergyMax(Player.kEnergy_Gravity))
end
function _setEnergy()
  local L0_17, L1_18, L2_19, L3_20
  L0_17 = print
  L1_18 = " < father2 > \226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189 "
  L0_17(L1_18)
  L0_17 = GameDatabase
  L1_18 = L0_17
  L0_17 = L0_17.get
  L2_19 = ggd
  L2_19 = L2_19.Savedata__EventManageFlags__CurrentMissionName
  L0_17 = L0_17(L1_18, L2_19)
  L1_18 = GameDatabase
  L2_19 = L1_18
  L1_18 = L1_18.get
  L3_20 = ggd
  L3_20 = L3_20.Savedata__EventManageFlags__CurrentFreeMode
  L1_18 = L1_18(L2_19, L3_20)
  L2_19 = string
  L2_19 = L2_19.sub
  L3_20 = L0_17
  L2_19 = L2_19(L3_20, 1, 2)
  L3_20 = GameDatabase
  L3_20 = L3_20.get
  L3_20 = L3_20(L3_20, ggd.Savedata__EventManageFlags__CurrentMissionType)
  if L3_20 ~= "g_play" then
    L3_20 = GameDatabase
    L3_20 = L3_20.get
    L3_20 = L3_20(L3_20, ggd.Savedata__EventManageFlags__ReadyMissionName)
    if L3_20 ~= "None" then
      print(" < father2 > _setEnergy()\227\128\128\227\131\135\227\131\162\228\184\173\227\129\170\227\129\174\227\129\167ready\227\129\174\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\130\146\229\143\130\231\133\167\227\129\151\227\129\190\227\129\153\227\128\130" .. L3_20)
      L0_17 = L3_20
    end
  end
  if L2_19 == "sm" or L2_19 == "cm" then
    L3_20 = player_ability
    L3_20 = L3_20[L0_17]
    if L3_20 == nil and L1_18 ~= "" then
      L0_17 = L1_18
    end
  elseif L0_17 == "eventheader" then
    _player_energy = true
    if L1_18 ~= "" then
      L0_17 = L1_18
    end
  end
  L3_20 = print
  L3_20(" < father2 > setEnergy table_id " .. tostring(L0_17))
  if L0_17 then
    L3_20 = player_ability
    L3_20 = L3_20[L0_17]
    if L3_20 then
      L3_20 = player_ability
      L3_20 = L3_20[L0_17]
      L3_20 = L3_20.vital_energy
      if _player_energy then
        if L3_20 == true then
          print(" < father2 > \228\189\147\229\138\155\229\155\158\229\190\169")
          Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
          GameDatabase:set(ggd.GlobalSystemFlags__GameOver, false)
        end
        if player_ability[L0_17].gravity_energy ~= nil then
          print(" < father2 > " .. (player_ability[L0_17].gravity_energy and "\233\135\141\229\138\155\229\155\158\229\190\169" or "\233\135\141\229\138\1550"))
          Player:setEnergy(Player.kEnergy_Gravity, player_ability[L0_17].gravity_energy and Player:getEnergyMax(Player.kEnergy_Gravity) or 0)
        end
        if player_ability[L0_17].special_energy ~= nil then
          print(" < father2 > " .. (player_ability[L0_17].special_energy and "\229\191\133\230\174\186\230\138\128\229\155\158\229\190\169" or "\229\191\133\230\174\186\230\138\1280"))
          Player:setEnergy(Player.kEnergy_SpAttack, player_ability[L0_17].special_energy and Player:getEnergyMax(Player.kEnergy_SpAttack) or 0)
        end
        if L2_19 == "sm" or L2_19 == "cm" then
          print(" < father2 > \229\191\133\230\174\186\230\138\1280")
          Player:setEnergy(Player.kEnergy_SpAttack, 0)
          _player_energy = false
        end
      else
        print(" < father2 > \227\130\168\227\131\141\227\131\171\227\130\174\227\131\188\227\129\174\229\164\137\229\139\149\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147")
      end
      _player_debug.g_eng = player_ability[L0_17].gravity_energy
      _player_debug.s_eng = player_ability[L0_17].special_energy
      _player_debug.v_eng = L3_20
    end
  end
  L3_20 = print
  L3_20(" < father2 > \226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179\226\150\179 ")
end
function _copyTable(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
  if A0_21 then
    L1_22 = {}
    for L5_26, L6_27 in L2_23(L3_24) do
      if type(L6_27) == "table" then
        L1_22[L5_26] = _copyTable(L6_27)
      else
        L1_22[L5_26] = L6_27
      end
    end
    return L1_22
  end
  L1_22 = nil
  return L1_22
end
function _resetPlayerAbility()
  local L0_28, L1_29
  L0_28 = {}
  _player_ability_unlock = L0_28
  L0_28 = {}
  _player_ability_lock = L0_28
  _player_ctrl_all = true
  _player_l_stick = true
  _player_r_stick = true
  _player_v_inf = nil
  _player_g_inf = nil
  _player_s_inf = nil
  _player_all_off = false
end
function _getPlayerAbility()
  local L0_30, L1_31
  L0_30 = _player_ability
  return L0_30
end
function _setPlayerAbility(A0_32, A1_33, A2_34)
  local L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L18_50, L19_51, L20_52, L21_53, L22_54, L23_55
  L3_35 = print
  L4_36 = " < father2 > \226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189\226\150\189 "
  L3_35(L4_36)
  _player_ability = A0_32
  _player_ctrl_all = A0_32
  L3_35 = {
    L4_36,
    L5_37,
    L6_38,
    L7_39,
    L8_40,
    L9_41,
    L10_42,
    L11_43,
    L12_44,
    L13_45,
    L14_46,
    L15_47,
    L16_48,
    L17_49,
    L18_50,
    L19_51,
    L20_52,
    L21_53,
    L22_54,
    L23_55,
    Player.kAbility_SwitchToMars,
    Player.kAbility_SwitchToJupiter,
    Player.kAbility_FelineStart,
    Player.kAbility_FelineEnd,
    Player.kAbility_SpCrowDestroyer,
    Player.kAbility_FirstPersonView,
    Player.kAbility_WallJump,
    Player.kAbility_Hang
  }
  L4_36 = Player
  L4_36 = L4_36.kAbility_Walk
  L5_37 = Player
  L5_37 = L5_37.kAbility_Run
  L6_38 = Player
  L6_38 = L6_38.kAbility_Jump
  L7_39 = Player
  L7_39 = L7_39.kAbility_RocketJump
  L8_40 = Player
  L8_40 = L8_40.kAbility_Dodge
  L9_41 = Player
  L9_41 = L9_41.kAbility_KickCombo
  L10_42 = Player
  L10_42 = L10_42.kAbility_GravityShift
  L11_43 = Player
  L11_43 = L11_43.kAbility_GravityRevert
  L12_44 = Player
  L12_44 = L12_44.kAbility_GravityKick
  L18_50 = Player
  L18_50 = L18_50.kAbility_SliderKick
  L19_51 = Player
  L19_51 = L19_51.kAbility_SpAttack
  L4_36 = nil
  L5_37 = false
  L6_38 = false
  L7_39 = _player_r_stick
  L8_40 = _player_l_stick
  L9_41 = _player_v_inf
  L9_41 = L9_41 or _player_v_inf_back
  L10_42 = _player_g_inf
  L10_42 = L10_42 or _player_g_inf_back
  L11_43 = _player_s_inf
  L11_43 = L11_43 or _player_s_inf_back
  L12_44 = _player_all_off
  if L12_44 then
    L7_39 = false
    L8_40 = false
  end
  L12_44 = _player_tuto
  if L12_44 then
    L8_40 = false
    _player_ctrl_all = true
  end
  L12_44 = _player_debug
  L12_44.r_stick = L7_39
  L12_44 = _player_debug
  L12_44.l_stick = L8_40
  L12_44 = GameDatabase
  L12_44 = L12_44.get
  L12_44 = L12_44(L13_45, L14_46)
  if L13_45 ~= "g_play" then
    if L13_45 ~= "None" then
      if A0_32 then
        L14_46(L15_47)
        L14_46(L15_47)
        return
      else
        L12_44 = L13_45
      end
    end
  end
  if A0_32 then
    if L14_46 == "sm" or L14_46 == "cm" or L14_46 == "mi" or L14_46 == "tr" then
      if L15_47 == nil and L13_45 ~= "" then
        L12_44 = L13_45
      end
    elseif L12_44 == "eventheader" and L13_45 ~= "" then
      L12_44 = L13_45
    end
    L18_50 = L12_44
    L15_47(L16_48)
    if L12_44 then
      if L15_47 then
        L3_35 = L15_47
        L4_36 = L15_47
        L5_37 = L15_47 or false
        L6_38 = L15_47 or false
        if L15_47 ~= nil then
        else
          L10_42 = L15_47 or L15_47 or false
        end
        if L15_47 ~= nil then
        else
          L11_43 = L15_47 or L15_47 or false
        end
        if L15_47 ~= nil then
        else
          L9_41 = L15_47 or L15_47 or false
        end
        _player_g_inf_back = L10_42
        _player_s_inf_back = L11_43
        _player_v_inf_back = L9_41
      end
    else
      L5_37 = true
      L6_38 = true
    end
    if L4_36 then
      if L15_47 then
        for L18_50, L19_51 in L15_47(L16_48) do
          for L23_55, _FORV_24_ in L20_52(L21_53) do
            if L19_51 == _FORV_24_ then
              for _FORV_29_, _FORV_30_ in ipairs(L3_35) do
                if L19_51 == _FORV_30_ then
                  break
                end
              end
              if false then
                print(" < father2 > " .. L19_51 .. "\227\129\175\227\131\149\227\131\170\227\131\188\227\130\191\227\130\164\227\131\160\227\129\167\230\156\137\229\138\185\227\129\171\227\129\170\227\129\163\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\230\156\137\229\138\185\230\137\177\227\129\132\227\129\171\227\129\170\227\130\138\227\129\190\227\129\153\227\128\130")
                table.insert(L3_35, L19_51)
              end
              break
            end
          end
        end
      end
    end
    if L15_47 > 0 then
      for L18_50, L19_51 in L15_47(L16_48) do
        for _FORV_24_, _FORV_25_ in L21_53(L22_54) do
          if L19_51 == _FORV_25_ then
            break
          end
        end
        if L20_52 then
          L21_53(L22_54, L23_55)
        end
      end
    end
    if L15_47 > 0 then
      for L18_50, L19_51 in L15_47(L16_48) do
        for L23_55, _FORV_24_ in L20_52(L21_53) do
          if L19_51 == _FORV_24_ then
            table.remove(L3_35, L23_55)
            break
          end
        end
      end
    end
    if L15_47 then
      for L18_50, L19_51 in L15_47(L16_48) do
        if L19_51 ~= L20_52 then
        elseif L19_51 == L20_52 and not L11_43 then
          L20_52(L21_53)
          L20_52(L21_53, L22_54)
        end
        if L19_51 == L20_52 and not L10_42 then
          L20_52(L21_53)
          L20_52(L21_53, L22_54)
          L20_52(L21_53)
        end
      end
      if not L9_41 then
        L15_47(L16_48)
      end
    end
    if L15_47 then
      L15_47(L16_48, L17_49)
      L15_47(L16_48, L17_49)
      L15_47(L16_48)
      L15_47(L16_48)
      L15_47(L16_48)
    end
    L15_47(L16_48)
  else
    L13_45(L14_46)
    L13_45(L14_46)
    L13_45(L14_46)
    L13_45(L14_46)
    L13_45(L14_46, L15_47)
    L13_45(L14_46, L15_47)
  end
  L13_45.photo_mode = L5_37
  L13_45.gesture = L6_38
  if A2_34 ~= true then
    L13_45(L14_46, L15_47, L16_48)
    L13_45(L14_46)
    if L13_45 and L8_40 == false then
      L13_45(L14_46, L15_47, L16_48)
      L13_45(L14_46)
    end
    L13_45(L14_46, L15_47, L16_48, L17_49)
    L13_45(L14_46)
    if L7_39 == false then
      for L16_48, L17_49 in L13_45(L14_46) do
        L18_50 = Player
        L18_50 = L18_50.kAbility_FirstPersonView
        if L18_50 == L17_49 then
          L18_50 = print
          L19_51 = " < father2 > FirstPersonView remove "
          L18_50(L19_51)
          L18_50 = table
          L18_50 = L18_50.remove
          L19_51 = L3_35
          L18_50(L19_51, L20_52)
          break
        end
      end
    end
  end
  L13_45(L14_46, L15_47)
  L13_45(L14_46, L15_47)
  L14_46(L15_47, L16_48, L17_49)
  L14_46(L15_47)
  if A0_32 then
    if L14_46 then
      L14_46(L15_47, L16_48, L17_49)
      L14_46(L15_47)
    end
  end
  L14_46(L15_47, L16_48, L17_49)
  L14_46(L15_47)
  if not L14_46 then
    L14_46(L15_47, L16_48, L17_49)
    L14_46(L15_47)
  end
  L14_46(L15_47, L16_48, L17_49)
  L14_46(L15_47)
  if L14_46 > 0 then
    L14_46(L15_47, L16_48, L17_49)
  end
  if L14_46 then
    if L14_46 then
      if L14_46 then
        L14_46(L15_47, L16_48, L17_49)
        L18_50 = true
        L14_46(L15_47, L16_48, L17_49, L18_50)
      end
    end
  end
  L18_50 = 2
  if L15_47 == "cm" then
    if L16_48 then
      if L16_48 then
        L18_50 = player_ability
        L18_50 = L18_50[L12_44]
        L18_50 = L18_50.tune
        L19_51 = true
        L16_48(L17_49, L18_50, L19_51)
        L16_48(L17_49)
      end
    else
      L18_50 = Player
      L18_50 = L18_50.kAttrTune_Normal
      L19_51 = true
      L16_48(L17_49, L18_50, L19_51)
      L16_48(L17_49)
    end
  end
  if L15_47 == "sm" then
    if L16_48 then
      if L16_48 then
        L18_50 = player_ability
        L18_50 = L18_50[L12_44]
        L18_50 = L18_50.tune
        L19_51 = true
        L16_48(L17_49, L18_50, L19_51)
        L16_48(L17_49)
      end
    end
  end
  L16_48(L17_49)
end
function _lockPlayerAbility(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66, L11_67, L12_68, L13_69, L14_70, L15_71
  L2_58 = print
  L3_59 = " < father2 > \239\189\158\239\189\158\239\189\158 lock ability start \239\189\158\239\189\158\239\189\158\239\189\158\239\189\158\239\189\158\239\189\158 "
  L2_58(L3_59)
  L2_58 = type
  L3_59 = A0_56
  L2_58 = L2_58(L3_59)
  L3_59 = nil
  L4_60 = false
  L5_61 = true
  if L2_58 == "table" then
    L3_59 = A0_56
  else
    L3_59 = L6_62
  end
  if L6_62 == "table" then
    L4_60 = true
    if L6_62 == true then
      _player_r_stick = false
    end
    if L6_62 == true then
      _player_l_stick = false
    end
    if L6_62 == true then
      _player_v_inf = true
    end
    if L6_62 == true then
      _player_g_inf = true
    end
    if L6_62 == true then
      _player_s_inf = true
    end
    if L6_62 == false then
      L5_61 = false
    end
  end
  if L6_62 > 0 then
    if L5_61 then
      for L9_65, L10_66 in L6_62(L7_63) do
        L11_67 = Player
        L11_67 = L11_67.kAbility_Jump
        if L10_66 == L11_67 then
          L11_67 = table
          L11_67 = L11_67.insert
          L11_67(L12_68, L13_69)
          break
        end
      end
    end
    for L9_65, L10_66 in L6_62(L7_63) do
      L11_67 = true
      for L15_71, _FORV_16_ in L12_68(L13_69) do
        if L10_66 == _FORV_16_ then
          L11_67 = false
          break
        end
      end
      if L11_67 then
        L12_68(L13_69, L14_70)
      end
      for L15_71, _FORV_16_ in L12_68(L13_69) do
        if L10_66 == _FORV_16_ then
          table.remove(_player_ability_unlock, L15_71)
          break
        end
      end
    end
    L4_60 = true
  end
  if L4_60 then
    L9_65 = true
    L6_62(L7_63, L8_64, L9_65)
    L6_62(L7_63)
  end
  L6_62(L7_63)
end
function _unLockPlayerAbility(A0_72, A1_73)
  local L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87
  L2_74 = print
  L3_75 = " < father2 > \239\189\158\239\189\158\239\189\158 unlock ability start \239\189\158\239\189\158\239\189\158\239\189\158\239\189\158\239\189\158 "
  L2_74(L3_75)
  L2_74 = type
  L3_75 = A0_72
  L2_74 = L2_74(L3_75)
  L3_75 = nil
  L4_76 = false
  L5_77 = true
  if L2_74 == "table" then
    L3_75 = A0_72
  else
    L3_75 = L6_78
  end
  if L6_78 == "table" then
    L4_76 = true
    if L6_78 == true then
      _player_r_stick = true
    end
    if L6_78 == true then
      _player_l_stick = true
    end
    if L6_78 == true then
      _player_v_inf = false
    end
    if L6_78 == true then
      _player_g_inf = false
    end
    if L6_78 == true then
      _player_s_inf = false
    end
    if L6_78 == false then
      L5_77 = false
    end
  end
  if L6_78 > 0 then
    if L5_77 then
      for L9_81, L10_82 in L6_78(L7_79) do
        L11_83 = Player
        L11_83 = L11_83.kAbility_Jump
        if L10_82 == L11_83 then
          L11_83 = table
          L11_83 = L11_83.insert
          L11_83(L12_84, L13_85)
          break
        end
      end
    end
    for L9_81, L10_82 in L6_78(L7_79) do
      L11_83 = true
      for L15_87, _FORV_16_ in L12_84(L13_85) do
        if L10_82 == _FORV_16_ then
          L11_83 = false
          break
        end
      end
      if L11_83 then
        L12_84(L13_85, L14_86)
      end
      for L15_87, _FORV_16_ in L12_84(L13_85) do
        if L10_82 == _FORV_16_ then
          table.remove(_player_ability_lock, L15_87)
          break
        end
      end
    end
    L4_76 = true
  end
  if L4_76 then
    L9_81 = true
    L6_78(L7_79, L8_80, L9_81)
    L6_78(L7_79)
  end
  L6_78(L7_79)
end
function _setPlayerOpt(A0_88, A1_89, A2_90)
  local L3_91
  _player_all_off = A0_88
  L3_91 = A1_89 == nil or A1_89 or true
  _player_l_stick = L3_91
  _player_tuto = A2_90
end
function _setNoDamegeMode(A0_92, A1_93)
  Player:setNoDamageMode(A0_92, A1_93)
  if A1_93 then
    _player_damage_type = A0_92
  else
    _player_damage_type = nil
  end
end
function _playCostumeChangeEffect()
  local L0_94, L1_95
  L0_94 = Player
  L1_95 = L0_94
  L0_94 = L0_94.getPuppet
  L0_94 = L0_94(L1_95)
  if L0_94 then
    while true do
      L1_95 = L0_94.getVisible
      L1_95 = L1_95(L0_94)
      if not L1_95 then
        L1_95 = L0_94.getActive
        L1_95 = L1_95(L0_94)
      end
      if not L1_95 then
        L1_95 = wait
        L1_95()
      end
    end
    L1_95 = print
    L1_95(" < father2 > play costume change effect")
    L1_95 = createGameObject2
    L1_95 = L1_95("Effect")
    L1_95:setName("ef_ui_par_01")
    L1_95:setModelName("ef_ui_par_01")
    L0_94:appendChild(L1_95)
    L1_95:try_init()
    L1_95:waitForReady()
    L1_95:try_start()
    L1_95:play()
    wait()
    while not L1_95:isEnd() do
      wait()
    end
    L1_95:try_term()
    print(" < father2 > end costume change effect")
  end
end
function _costumeChangeCallback(A0_96)
  _photomode_costume_changed = false
  invokeSystemTask(function()
    local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102
    _photomode_costumechange_flag = true
    L0_97 = _setCostume
    L1_98 = A0_96
    L0_97(L1_98)
    L0_97 = _is_my_home
    if not L0_97 then
      L0_97 = invokeTask
      L1_98 = _playCostumeChangeEffect
      L0_97(L1_98)
    end
    L0_97 = HUD
    L1_98 = L0_97
    L0_97 = L0_97.costumeChangeEnd
    L0_97(L1_98)
    while true do
      L0_97 = Player
      L1_98 = L0_97
      L0_97 = L0_97.getCostumeChangePhase
      L0_97 = L0_97(L1_98)
      L1_98 = Player
      L1_98 = L1_98.kCostuemChange_Changing
      if L0_97 ~= L1_98 then
        L0_97 = Player
        L1_98 = L0_97
        L0_97 = L0_97.getCostumeChangePhase
        L0_97 = L0_97(L1_98)
        L1_98 = Player
        L1_98 = L1_98.kCostuemChange_Changed
        if L0_97 ~= L1_98 then
          L0_97 = Player
          L1_98 = L0_97
          L0_97 = L0_97.getCostumeChangePhase
          L0_97 = L0_97(L1_98)
          L1_98 = Player
          L1_98 = L1_98.kCostuemChange_NoOpe
        end
      end
      if L0_97 ~= L1_98 then
        L0_97 = _exit_sandbox
        if L0_97 then
          return
        end
        L0_97 = wait
        L0_97()
      end
    end
    L0_97 = 0
    while true do
      L1_98 = Player
      L1_98 = L1_98.getCostumeChangePhase
      L1_98 = L1_98(L2_99)
      if L1_98 ~= L2_99 then
        L1_98 = _exit_sandbox
        if L1_98 then
          return
        end
        L1_98 = wait
        L1_98()
      end
      if not (L0_97 > 90) then
        L0_97 = L0_97 + 1
      end
    end
    L1_98 = {}
    for L5_102, _FORV_6_ in L2_99(L3_100) do
      if type(L5_102) == "string" then
        table.insert(L1_98, L5_102)
      end
    end
    if L2_99 > 0 then
      L2_99(L3_100)
      L2_99(L3_100)
    else
      _photomode_costume_changed = true
    end
  end)
end
function _getMissionCostume()
  local L0_103
  L0_103 = GameDatabase
  L0_103 = L0_103.get
  L0_103 = L0_103(L0_103, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if GameDatabase:get(ggd.GlobalSystemFlags__Demo) and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= "None" then
    L0_103 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName)
  end
  if player_ability[L0_103] and player_ability[L0_103].costume then
    return player_ability[L0_103].costume
  end
  return GameDatabase:get(ggd.Savedata__Player__Costume)
end
function _resetCostume()
  local L0_104
  L0_104 = print
  L0_104("father : _resetCostume")
  L0_104 = _getMissionCostume
  L0_104 = L0_104()
  if L0_104 ~= "None" then
    print("father : mission costume change ", L0_104)
    if _setCostume(L0_104) and HUD:faderAlpha() == 0 and not GameDatabase:get(ggd.GlobalSystemFlags__Demo) then
      invokeTask(_playCostumeChangeEffect)
    end
    invokeTask(function()
      local L0_105
      L0_105 = 0
      while true do
        if Player:getCostumeChangePhase() == Player.kCostuemChange_Changed then
          print(" < father2 > \227\130\179\227\130\185\227\131\129\227\131\165\227\131\188\227\131\160\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\231\181\130\228\186\134\227\129\151\227\129\159\227\129\174\227\129\167\227\128\129\227\130\168\227\131\141\227\131\171\227\130\174\227\131\188\227\130\146\229\134\141\229\186\166\227\128\129\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\153")
          _setEnergy()
          break
        elseif Player:getCostumeChangePhase() == Player.kCostuemChange_NoOpe then
          if L0_105 == 10 then
            print(" < father2 > \227\130\179\227\130\185\227\131\129\227\131\165\227\131\188\227\131\160\227\129\175\229\164\137\227\130\143\227\129\163\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
            break
          end
          L0_105 = L0_105 + 1
        end
        wait()
      end
    end)
  end
end
function _setCostume(A0_106, A1_107, A2_108)
  local L3_109
  L3_109 = false
  if _costume ~= A0_106 then
    print("\231\143\190\229\156\168\227\129\168\233\129\149\227\129\134\227\130\179\227\130\185\227\131\129\227\131\165\227\131\188\227\131\160\227\129\174\227\130\187\227\131\131\227\131\136\227\129\140\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159 old/new > ", _costume, "/", A0_106)
    _costume = A0_106
    L3_109 = true
  end
  if A0_106 == "None" or A0_106 == "" or A0_106 == nil then
    print("\232\168\173\229\174\154\227\129\167\227\129\141\227\129\170\227\129\132\227\130\179\227\130\185\227\131\129\227\131\165\227\131\188\227\131\160\229\144\141\227\129\140\230\157\165\227\129\190\227\129\151\227\129\159 " .. tostring(A0_106) .. " kit01\227\129\171\229\188\183\229\136\182\231\154\132\227\129\171\229\164\137\230\155\180\227\129\151\227\129\190\227\129\153\227\128\130")
    A0_106 = "kit01"
  end
  Player:setCostume(A0_106)
  GameDatabase:set(ggd.Savedata__Player__Costume, A0_106)
  if A2_108 or _photomode_costumechange_flag == true then
    GameDatabase:backup(ggd.Savedata__Player__Costume)
    GameDatabase:set(ggd.Savedata__FreeTimeFlags__Costume, A0_106)
    GameDatabase:backup(ggd.Savedata__FreeTimeFlags__Costume)
    _photomode_costumechange_flag = false
  end
  print(" < father2 > set costume : " .. tostring(A0_106))
  if A0_106 == "cro01" or A0_106 == "cro06" then
    _player_load_crow_seresource = true
    _cat:setActive(false)
    _cat:getBrain():setActive(false)
    if _raven == nil then
      invokeTask(function()
        while Player:getPuppet() == nil do
          wait()
        end
        _createRaven()
      end)
    end
  elseif A0_106 == "sac01" then
    _cat:setActive(false)
    _cat:getBrain():setActive(false)
    _termRaven()
  else
    if _player_load_crow_seresource then
      _player_load_crow_seresource = false
    end
    if _cat_active then
      _cat:setActive(true)
      _cat:getBrain():setActive(true)
      _cat:getBrain():reset()
    end
    Player:setBuddy(_cat:getBrain())
    _termRaven()
  end
  return L3_109
end
function _createRaven(A0_110, A1_111)
  local L2_112, L3_113
  L2_112 = Vector
  L3_113 = 0
  L2_112 = L2_112(L3_113, 0, 0)
  L3_113 = Quaternion
  L3_113 = L3_113(0, 0, 0, 1)
  if A0_110 then
    L2_112.x = A0_110.x
    L2_112.y = A0_110.y
    L2_112.z = A0_110.z
  else
    L2_112 = Player:getPuppet():getWorldPos()
  end
  if A1_111 then
    L3_113.x = A1_111.x
    L3_113.y = A1_111.y
    L3_113.z = A1_111.z
    L3_113.w = A1_111.w
  else
    L3_113 = YRotQuaternion(0)
  end
  _raven = Supporter.Spawner.create_supporter_raven(L2_112, L3_113, false)
  _raven:getBrain():setOwner(_player)
  Player:setBuddy(_raven:getBrain())
  print(" < father2 > raven create")
end
function _termRaven()
  if _raven then
    _raven:getBrain():try_term()
    _raven:try_term()
  end
  _raven = nil
end
function _setCatActive(A0_114)
  local L1_115
  _cat_active = A0_114
end
function warpXii(A0_116, A1_117)
  invokeTask(function()
    _termRaven()
    _createRaven(A0_116, A1_117)
  end)
end
function _loadEventMotion(A0_118)
  _player_load_mot = true
  invokeSystemTask(function()
    local L0_119, L1_120, L2_121, L3_122, L4_123, L5_124, L6_125, L7_126, L8_127
    L0_119 = {}
    _player_event_mot = L0_119
    L0_119 = Player
    L1_120 = L0_119
    L0_119 = L0_119.getPuppet
    L0_119 = L0_119(L1_120)
    while true do
      L2_121 = L0_119
      L1_120 = L0_119.isLoading
      L1_120 = L1_120(L2_121)
      if L1_120 then
        L1_120 = _exit_sandbox
        if L1_120 then
          return
        end
        L1_120 = wait
        L1_120()
      end
    end
    L1_120 = 1
    L2_121 = "event_mot_01"
    for L6_125, L7_126 in L3_122(L4_123) do
      L8_127 = L0_119.loadPoseAnimation
      L8_127 = L8_127(L0_119, L2_121, L7_126)
      print(" < father2 > " .. L7_126 .. " : " .. tostring(L8_127))
      _player_event_mot[L7_126] = L2_121
      L1_120 = L1_120 + 1
      L2_121 = "event_mot_" .. string.format("%02d", L1_120)
      if L1_120 > 10 then
        print(" < father2 > \227\131\151\227\131\172\227\130\164\227\131\164\227\129\17110\229\128\139\228\187\165\228\184\138\227\129\175\232\170\173\227\129\191\232\190\188\227\129\191\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
        break
      end
    end
    while true do
      if L3_122 then
        if L3_122 then
          return
        end
        L3_122()
      end
    end
    L3_122(L4_123)
    _player_load_mot = false
    _photomode_costume_changed = true
  end)
end
function _isLoadEventMotion()
  local L0_128, L1_129
  L0_128 = _player_load_mot
  return L0_128
end
function _isPhotoModeCostumeChanged()
  local L0_130, L1_131
  L0_130 = _photomode_costume_changed
  return L0_130
end
function _playEventMotion(A0_132, A1_133, A2_134, A3_135)
  if A3_135 == true then
    A3_135 = Player:isMirroring()
  end
  if _player_event_mot[A0_132] then
    return (Player:getPuppet():playPoseAnimation(_player_event_mot[A0_132], A1_133 or 0, A2_134, A3_135))
  end
  print(" < father2 > " .. A0_132 .. " \227\129\175\232\170\173\227\129\191\232\190\188\227\129\191\227\130\146\227\129\151\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  return false
end
function _isPlayEventMotion(A0_136)
  if _player_event_mot[A0_136] then
    return not Player:getPuppet():isPoseAnimPlaying(_player_event_mot[A0_136])
  end
  print(" < father2 > " .. A0_136 .. " \227\129\175\232\170\173\227\129\191\232\190\188\227\129\191\227\130\146\227\129\151\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  return false
end
function setMyhome(A0_137)
  local L1_138
  _is_my_home = A0_137
end
import("Font")
_debugSystemTask = true
_debugLine = 0
_debugDispAbility = false
_debugDispEvMotion = false
_debugDispX = 0
function debugDispPrint(A0_139, A1_140)
  local L2_141
  L2_141 = _debugDispX
  L2_141 = 50 + L2_141
  if Debug:isDebugMenuOpen() then
    L2_141 = 250 + _debugDispX
  end
  if string.len(A0_139) > 0 then
    Font:debugPrint(L2_141, 10 + 16 * _debugLine, A0_139)
  end
  _debugLine = _debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_142, L1_143, L2_144, L3_145, L4_146, L5_147
    L0_142 = Player
    L0_142 = L0_142.getPuppet
    L0_142 = L0_142(L1_143)
    while true do
      if L1_143 then
        if L1_143 then
          _debugDispX = 0
          _debugLine = 0
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Walk)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Walk
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Run)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Run
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Jump)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Jump
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_RocketJump)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_RocketJump
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Dodge)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Dodge
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_KickCombo)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_KickCombo
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_GravityShift)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_GravityShift
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_GravityRevert)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_GravityRevert
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_GravityKick)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_GravityKick
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_GravityBoost)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_GravityBoost
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Grab)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Grab
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Throw)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Throw
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Slider)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Slider
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SpAttack)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SpAttack
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SpTornado)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SpTornado
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SpTyphoon)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SpTyphoon
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SpBlackHole)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SpBlackHole
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_AttrTuneSwitch)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_AttrTuneSwitch
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SwitchToMars)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SwitchToMars
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SwitchToJupiter)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SwitchToJupiter
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_FelineStart)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_FelineStart
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_FelineEnd)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_FelineEnd
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_SpCrowDestroyer)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_SpCrowDestroyer
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_FirstPersonView)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_FirstPersonView
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_WallJump)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_WallJump
          L1_143(L2_144)
          L4_146 = Player
          L5_147 = L4_146
          L4_146 = L4_146.getAbility
          L5_147 = L4_146(L5_147, Player.kAbility_Hang)
          L4_146 = " ] :"
          L5_147 = Player
          L5_147 = L5_147.kAbility_Hang
          L1_143(L2_144)
          _debugDispX = L1_143
          if L1_143 ~= nil then
            _debugLine = 0
            L1_143(L2_144)
            L4_146 = _player_ctrl_all
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.l_stick
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.r_stick
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_g_inf_back
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_s_inf_back
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_v_inf_back
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.g_eng
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.s_eng
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.v_eng
            L4_146 = " ]"
            L1_143(L2_144)
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.photo_mode
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_debug
            L4_146 = L4_146.gesture
            L4_146 = " ]"
            L1_143(L2_144)
            L1_143(L2_144)
            L5_147 = L0_142
            L4_146 = L0_142.getWorldPos
            L5_147 = L4_146(L5_147)
            L4_146 = " ]"
            L1_143(L2_144)
            L4_146 = _player_costume
            L4_146 = " ]"
            L1_143(L2_144)
          end
        end
        if L1_143 then
          _debugDispX = 0
          _debugLine = 0
          for L4_146, L5_147 in L1_143(L2_144) do
            debugDispPrint(L5_147 .. " = [ " .. L4_146 .. " ]")
          end
        end
        L1_143()
      end
    end
  end)
end
g_customDebugMenu = {
  {
    name = "DebugDispAbility",
    callback = function()
      local L1_148
      L1_148 = _debugDispAbility
      L1_148 = not L1_148
      _debugDispAbility = L1_148
      _debugDispEvMotion = false
    end
  },
  {
    name = "DebugDispEvMotion",
    callback = function()
      local L1_149
      L1_149 = _debugDispEvMotion
      L1_149 = not L1_149
      _debugDispEvMotion = L1_149
      _debugDispAbility = false
    end
  }
}
