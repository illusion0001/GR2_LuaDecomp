import("GameDatabase")
import("Time")
import("EventData")
import("Replay")
import("Pad")
import("Player")
import("Net")
import("QA")
import("Analytics")
import("GlobalGem")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
dofile("/Game/Event2/Common/SystemScriptCommon2.lua")
dofile("/Game/Event2/Common/BulletCommon.lua")
dofile("/Game/Event2/Common/MobCommon.lua")
dofile("/Game/Misc/cdemo.lua")
dofile("/Game/Event2/Table/FreeMissionTable.lua")
dofile("/Game/Event2/Table/MemoriesPhoto.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
event_name = nil
__initalized = false
__ready_object = false
__start_object = false
__start = false
__run = false
__area = false
__killing = false
__is_finalize = false
__start_floating = false
__ingame_task = nil
function __retry_func()
  local L0_0, L1_1
end
__mission_start = false
__ingame_run = false
__retry_mission = nil
__exit_sandbox = false
__sdemo = nil
__pdemo_sehandle = nil
__menuSetCallback = false
function main()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L0_2 = kDEBUG_MAIN_START
  __debug_phase = L0_2
  L0_2 = debugDisp
  L0_2()
  L0_2 = debugDispMission
  L0_2()
  L0_2 = GameDatabase
  L1_3 = L0_2
  L0_2 = L0_2.set
  L2_4 = ggd
  L2_4 = L2_4.GlobalSystemFlags__IsMissionStart
  L3_5 = false
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_getGameObject
  L1_3 = "father2"
  L0_2 = L0_2(L1_3)
  __sb_father2 = L0_2
  L0_2 = g_own
  L1_3 = L0_2
  L0_2 = L0_2.getName
  L0_2 = L0_2(L1_3)
  event_name = L0_2
  L0_2 = string
  L0_2 = L0_2.match
  L1_3 = event_name
  L2_4 = "(.-)_()"
  L0_2 = L0_2(L1_3, L2_4)
  L1_3 = string
  L1_3 = L1_3.match
  L2_4 = event_name
  L3_5 = "%l+"
  L1_3 = L1_3(L2_4, L3_5)
  L2_4 = string
  L2_4 = L2_4.match
  L3_5 = event_name
  L4_6 = "%d+"
  L2_4 = L2_4(L3_5, L4_6)
  if L0_2 == nil then
    L0_2 = event_name
  end
  L3_5 = g_own
  L4_6 = L3_5
  L3_5 = L3_5.getGameObject
  L5_7 = "soundManager"
  L3_5 = L3_5(L4_6, L5_7)
  if L3_5 then
    L4_6 = L0_2
    L5_7 = "_se"
    L4_6 = L4_6 .. L5_7
    if L0_2 == "eventheader" then
      L5_7 = "ep"
      L6_8 = string
      L6_8 = L6_8.match
      L6_8 = L6_8(L7_9, L8_10)
      L4_6 = L5_7 .. L6_8 .. L7_9
      if L4_6 == "ep28_se" then
        L4_6 = "ep21_se"
      end
    elseif L1_3 == "eps" then
      L5_7 = "ep"
      L6_8 = L2_4
      L4_6 = L5_7 .. L6_8 .. L7_9
    else
      if L1_3 == "mine" then
        L4_6 = event_name
      else
      end
    end
    L6_8 = L3_5
    L5_7 = L3_5.sendEvent
    L5_7(L6_8, L7_9, L8_10)
    repeat
      L5_7 = wait
      L5_7()
      L6_8 = L3_5
      L5_7 = L3_5.sendEvent
      L5_7 = L5_7(L6_8, L7_9)
    until not L5_7
    L5_7 = debugPrintEv
    L6_8 = L4_6
    L6_8 = L6_8 .. L7_9
    L5_7(L6_8)
  end
  L4_6 = HUD
  L5_7 = L4_6
  L4_6 = L4_6.faderAlpha
  L4_6 = L4_6(L5_7)
  if L4_6 >= 1 then
    L4_6 = _accessIndicatorBegin
    L4_6()
  end
  L4_6 = setAttachSandbox
  L5_7 = "npcManager"
  L4_6(L5_7)
  L4_6 = kDEBUG_CREATE_CHARA
  __debug_phase = L4_6
  if L1_3 == "ep" or L1_3 == "sm" then
    L4_6 = free_setting_tbl
    L4_6 = L4_6[L0_2]
    if L4_6 ~= nil then
      L4_6 = free_setting_tbl
      L4_6 = L4_6[L0_2]
      L5_7 = L4_6.chara
      if L5_7 then
        L5_7 = nil
        L6_8 = L4_6.chara
        L6_8 = L6_8[1]
        if L6_8 then
          L6_8 = {}
          for L10_12, L11_13 in L7_9(L8_10) do
            table.insert(L6_8, copyFreeSettingTable(L11_13))
          end
          L5_7 = L6_8
        else
          L6_8 = {
            [6] = L7_9(L8_10)
          }
          L11_13 = L7_9(L8_10)
          ;({
            [6] = L7_9(L8_10)
          })[1] = L7_9
          ;({
            [6] = L7_9(L8_10)
          })[2] = L8_10
          ;({
            [6] = L7_9(L8_10)
          })[3] = L9_11
          ;({
            [6] = L7_9(L8_10)
          })[4] = L10_12
          ;({
            [6] = L7_9(L8_10)
          })[5] = L11_13
          L5_7 = L6_8
        end
        L6_8 = true
        if L7_9 then
          for L10_12, L11_13 in L7_9(L8_10) do
            if event_name == L11_13 then
              L6_8 = false
              break
            end
          end
        end
        if L7_9 == true then
          L6_8 = false
        end
        if L6_8 then
          if L7_9 == nil then
            L10_12 = "evx/"
            L11_13 = L7_9
            L10_12 = L10_12 .. L11_13
            L10_12 = "create npc start ... "
            L11_13 = L7_9
            L10_12 = L10_12 .. L11_13
            L9_11(L10_12)
            if L8_10 ~= nil then
              L10_12 = L8_10
              L9_11(L10_12)
              L10_12 = L8_10
              L10_12 = EventData
              L11_13 = L10_12
              L10_12 = L10_12.create
              L10_12 = L10_12(L11_13, L7_9, nil, L9_11)
              L11_13 = L10_12.try_init
              L11_13(L10_12)
              L11_13 = L10_12.waitForReady
              L11_13(L10_12)
              L11_13 = L10_12.try_start
              L11_13(L10_12)
              L11_13 = L5_7
              Fn_setupNpc(L11_13)
              debugPrintEv("create npc finish!!")
              L10_12:try_term()
              L10_12 = nil
            else
              L10_12 = L7_9
              L11_13 = ".evb nil"
              L10_12 = L10_12 .. L11_13
              L9_11(L10_12)
            end
          end
        else
          L7_9(L8_10)
        end
      else
        L5_7 = debugPrintEv
        L6_8 = "chara table nil"
        L5_7(L6_8)
      end
      L5_7 = L4_6.evx
      if L5_7 then
        L5_7 = L4_6.evx
        L5_7 = L5_7.spawn
        L6_8 = event_name
        if L5_7 == L6_8 then
          L5_7 = Fn_getGameObject
          L6_8 = "bgManager"
          L5_7 = L5_7(L6_8)
          L6_8 = L5_7
          L5_7 = L5_7.sendEvent
          L8_10.create_evx = L9_11
          L5_7(L6_8, L7_9, L8_10)
        end
      end
    end
  end
  L4_6 = kDEBUG_EVD_INIT
  __debug_phase = L4_6
  L4_6 = event_name
  L5_7 = loadFileAsset
  L6_8 = "evb"
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = nil
  L7_9(L8_10)
  if L5_7 then
    L7_9(L8_10)
    L10_12 = L4_6
    L11_13 = nil
    L6_8 = L8_10
    L8_10(L9_11)
    L8_10(L9_11)
    L5_7 = nil
    L10_12 = ".evb finish!!"
    L8_10(L9_11)
  else
    L7_9(L8_10)
  end
  __debug_phase = L7_9
  if L7_9 ~= "free" then
  else
  end
  L8_10(L9_11)
  L8_10(L9_11)
  __initialized = true
  __debug_phase = L8_10
  repeat
    L8_10()
  until L8_10
  __debug_phase = L8_10
  L8_10()
  L8_10()
  L8_10()
  __ready_object = true
  __debug_phase = L8_10
  repeat
    L8_10()
  until L8_10
  __debug_phase = L8_10
  L10_12 = L8_10
  L11_13 = "requestStart"
  L9_11(L10_12, L11_13)
  if L6_8 then
    L10_12 = L6_8
    L9_11(L10_12)
  end
  L9_11()
  __start_object = true
  L10_12 = L9_11
  L11_13 = ggd
  L11_13 = L11_13.Savedata__EventManageFlags__Mob
  if L9_11 then
    L10_12 = "\227\131\162\227\131\150\227\129\174\230\180\187\229\139\149\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159"
    L9_11(L10_12)
    L10_12 = L9_11
    L11_13 = ggd
    L11_13 = L11_13.GlobalSystemFlags__Mob
    L9_11(L10_12, L11_13, true)
  end
  __debug_phase = L9_11
  repeat
    L9_11()
  until L9_11
  __debug_phase = L9_11
  L10_12 = L9_11
  L11_13 = "mission_retry"
  L9_11(L10_12, L11_13)
  if L0_2 == "eventheader" or L1_3 == "eps" or L1_3 == "mine" or L0_2 == "ep80" or L0_2 == "sm93" then
    L10_12 = "\231\181\182\229\175\190\227\131\170\227\130\191\227\130\164\227\130\162\227\129\167\227\129\141\227\129\170\227\129\132\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\167\227\129\153\227\128\130"
    L9_11(L10_12)
  else
    L10_12 = L9_11
    L11_13 = ggd
    L11_13 = L11_13.Savedata__EventManageFlags__MissionReplay
    if L9_11 == "None" and (L0_2 == "ep00" or L0_2 == "ep01" or L0_2 == "ep02" or L0_2 == "ep12" or L0_2 == "ep13" or L0_2 == "ep17" or L0_2 == "ep19" or L0_2 == "ep20" or L0_2 == "ep22" or L0_2 == "ep23" or L0_2 == "ep24" or L0_2 == "ep25" or L0_2 == "ep26" or L0_2 == "ep27") then
      L10_12 = "\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\131\170\227\131\151\227\131\172\227\130\164\227\129\167\227\129\175\231\132\161\227\129\132\227\129\174\227\129\167\227\131\170\227\130\191\227\130\164\227\130\162\227\129\167\227\129\141\227\129\170\227\129\132\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\167\227\129\153\227\128\130"
      L9_11(L10_12)
    else
      __menuSetCallback = true
    end
  end
  L10_12 = L9_11
  L11_13 = nil
  L9_11(L10_12, L11_13, nil)
  L10_12 = L9_11
  L11_13 = ggd
  L11_13 = L11_13.Menu__TopBaloonDisp
  L9_11(L10_12, L11_13, true)
  L10_12 = L9_11
  L11_13 = ggd
  L11_13 = L11_13.Menu__IsTalismanCounter
  L9_11(L10_12, L11_13, false)
  if L1_3 == "ep" or L1_3 == "sm" then
    L10_12 = L9_11
    L11_13 = "ui_topinfo_header_01"
    L9_11(L10_12, L11_13, "ui_topinfo_main_" .. L0_2)
    if L9_11 ~= "ep80_a" then
    elseif L9_11 == "ep80_c" then
      L10_12 = L9_11
      L11_13 = nil
      L9_11(L10_12, L11_13, nil)
      L10_12 = L9_11
      L11_13 = ggd
      L11_13 = L11_13.Menu__TopBaloonDisp
      L9_11(L10_12, L11_13, false)
    end
  elseif L1_3 == "eps" or L1_3 == "cm" or L1_3 == "dm" then
    L10_12 = L9_11
    L11_13 = ggd
    L11_13 = L11_13.Menu__TopBaloonDisp
    L9_11(L10_12, L11_13, false)
  elseif L1_3 == "treasure" then
    L10_12 = L9_11
    L11_13 = "ui_topinfo_header_12"
    L9_11(L10_12, L11_13, "ui_topinfo_main_2_13")
  else
    if L1_3 == "mine" then
      L10_12 = L9_11
      L11_13 = ggd
      L11_13 = L11_13.Menu__IsTalismanCounter
      L9_11(L10_12, L11_13, true)
      if L0_2 == "mine99" then
        L10_12 = L9_11
        L11_13 = "ui_topinfo_header_18"
        L9_11(L10_12, L11_13, "ui_topinfo_main_" .. event_name)
      else
        L10_12 = L9_11
        L11_13 = "ui_topinfo_header_17"
        L9_11(L10_12, L11_13, "ui_topinfo_main_" .. L0_2)
      end
    else
    end
  end
  if L1_3 == "cm" then
    L10_12 = L9_11
    L11_13 = HUD
    L11_13 = L11_13.kCallback_ChallengeReward
    L9_11(L10_12, L11_13, _challengeRewardCallback)
  end
  L9_11()
  L10_12 = L9_11
  L10_12 = __sb_father2
  L11_13 = L10_12
  L10_12 = L10_12.sendEvent
  L10_12(L11_13, "_resetCostume")
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.get
  L10_12 = L10_12(L11_13, ggd.GlobalSystemFlags__SkipResetAbility)
  if L10_12 == false then
    L10_12 = debugPrintEv
    L11_13 = "reset ability and energy start"
    L10_12(L11_13)
    L10_12 = __sb_father2
    L11_13 = L10_12
    L10_12 = L10_12.sendEvent
    L10_12(L11_13, "_resetPlayerAbility")
    L10_12 = event_name
    if L10_12 == "eventheader" then
      L10_12 = GameDatabase
      L11_13 = L10_12
      L10_12 = L10_12.get
      L10_12 = L10_12(L11_13, ggd.Savedata__EventManageFlags__MissionReplay)
      if L10_12 ~= "None" then
        L10_12 = __sb_father2
        L11_13 = L10_12
        L10_12 = L10_12.sendEvent
        L10_12(L11_13, "_setPlayerAbility", false, nil, true)
        L10_12 = debugPrintEv
        L11_13 = "episode replay free time ability off"
        L10_12(L11_13)
      end
    else
      L10_12 = __sb_father2
      L11_13 = L10_12
      L10_12 = L10_12.sendEvent
      L10_12 = L10_12(L11_13, "_getPlayerAbility")
      if L10_12 then
        L10_12 = __sb_father2
        L11_13 = L10_12
        L10_12 = L10_12.sendEvent
        L10_12(L11_13, "_setPlayerAbility", false, nil, true)
        L10_12 = __sb_father2
        L11_13 = L10_12
        L10_12 = L10_12.sendEvent
        L10_12(L11_13, "_setPlayerAbility", true)
      end
    end
    L10_12 = __sb_father2
    L11_13 = L10_12
    L10_12 = L10_12.sendEvent
    L10_12(L11_13, "_setEnergy")
    L10_12 = debugPrintEv
    L11_13 = "reset ability and energy end"
    L10_12(L11_13)
  end
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.get
  L10_12 = L10_12(L11_13, ggd.GlobalSystemFlags__GameRetry)
  if L10_12 then
    L10_12 = Player
    L11_13 = L10_12
    L10_12 = L10_12.setStay
    L10_12(L11_13, false)
  end
  L10_12 = HUD
  L11_13 = L10_12
  L10_12 = L10_12.faderAlpha
  L10_12 = L10_12(L11_13)
  if L10_12 >= 1 then
    L10_12 = Fn_naviKill
    L10_12()
  end
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.set
  L10_12(L11_13, ggd.GlobalSystemFlags__ActionDialogActive, false)
  L10_12 = menuLock
  L10_12()
  if L0_2 ~= "eventheader" then
    L10_12 = Fn_getGameObject
    L11_13 = "enemyManager"
    L10_12 = L10_12(L11_13)
    L11_13 = L10_12.requestIdlingEnemy
    L11_13(L10_12, true)
    L11_13 = debugPrintEv
    L11_13("NPC\231\148\159\230\136\144\229\190\133\230\169\159\228\184\173")
    L11_13 = 90
    while not L10_12:isReadyAllNpc() do
      if L11_13 <= 0 then
        if true then
          debugPrintEv("3\231\167\146\231\181\140\233\129\142\227\129\151\227\129\166\227\130\130\227\130\185\227\130\191\227\131\188\227\131\136\227\129\171\227\129\170\227\130\137\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129NPC\227\129\174\227\130\185\227\130\191\227\131\188\227\131\136\227\130\146npcManager\227\129\171\229\134\141\229\186\166\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159")
          Fn_getGameObject("npcManager"):sendEvent("requestReady")
          while Fn_getGameObject("npcManager"):sendEvent("isObjectReady") do
            wait()
          end
          Fn_getGameObject("npcManager"):sendEvent("requestStart")
          L11_13 = 60
        else
          debugPrintEv("\227\129\157\227\129\174\229\190\140\239\188\146\231\167\146\231\181\140\233\129\142\227\129\151\227\129\166\227\128\129npcManager\231\174\161\231\144\134\227\129\174NPC\227\129\175\231\148\159\230\136\144\227\129\149\227\130\140\227\129\159\227\129\175\227\129\154\227\129\170\227\129\174\227\129\167\227\128\129\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\171\229\189\177\233\159\191\227\129\170\227\129\132NPC\227\129\174\231\148\159\230\136\144\227\129\175\231\132\161\232\166\150\227\129\151\227\129\166\227\130\191\227\130\164\227\131\160\227\130\162\227\130\166\227\131\136\227\129\151\227\129\190\227\129\153")
          break
        end
      end
      wait()
      L11_13 = L11_13 - 1
    end
    debugPrintEv("NPC\231\148\159\230\136\144\229\190\133\230\169\159\231\181\130\228\186\134")
    L10_12 = nil
  else
    L10_12 = debugPrintEv
    L11_13 = "\227\131\149\227\131\170\227\131\188\227\130\191\227\130\164\227\131\160\227\129\167\227\129\175NPC\227\129\174\231\148\159\230\136\144\227\130\191\227\130\164\227\131\159\227\131\179\227\130\176\227\130\146\227\129\154\227\130\137\227\129\151\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\227\128\129NPC\227\129\174\231\148\159\230\136\144\229\190\133\227\129\161\227\130\146\227\129\151\227\129\190\227\129\155\227\130\147"
    L10_12(L11_13)
  end
  L10_12 = GlobalGem
  L11_13 = L10_12
  L10_12 = L10_12.SetEnableGemGet
  L10_12(L11_13, true)
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.get
  L10_12 = L10_12(L11_13, ggd.GlobalSystemFlags__Idling)
  if not L10_12 then
    L10_12 = HUD
    L11_13 = L10_12
    L10_12 = L10_12.faderAlpha
    L10_12 = L10_12(L11_13)
  else
    if L10_12 >= 1 then
      L10_12 = Player
      L11_13 = L10_12
      L10_12 = L10_12.getPuppet
      L10_12 = L10_12(L11_13)
      L11_13 = debugPrintEv
      L11_13("GameDeltaSec On")
      L11_13 = L10_12.setCollidable
      L11_13(L10_12, true)
      L11_13 = Time
      L11_13 = L11_13.resetInGameDeltaSec
      L11_13(L11_13)
      L11_13 = wait
      L11_13()
      L10_12 = nil
      L11_13 = debugPrintEv
      L11_13("Idling...")
      L11_13 = wait
      L11_13(30)
      L11_13 = GameDatabase
      L11_13 = L11_13.set
      L11_13(L11_13, ggd.GlobalSystemFlags__Idling, false)
      L11_13 = debugPrintEv
      L11_13("Idling finish")
  end
  else
    L10_12 = debugPrintEv
    L11_13 = "skip Idling"
    L10_12(L11_13)
  end
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.set
  L10_12(L11_13, ggd.GlobalSystemFlags__CatWarpRunning, false)
  L10_12 = kDEBUG_INGAME
  __debug_phase = L10_12
  L10_12 = invokeTask
  L11_13 = Ingame
  L10_12 = L10_12(L11_13)
  __ingame_task = L10_12
  L10_12 = wait
  L10_12()
  repeat
    L10_12 = wait
    L10_12()
    L10_12 = __ingame_task
  until not L10_12
  L10_12 = HUD
  L11_13 = L10_12
  L10_12 = L10_12.menuDelCallback
  L10_12(L11_13, HUD.kCallback_Retire)
  L10_12 = kDEBUG_FINALIZE
  __debug_phase = L10_12
  if L1_3 == "cm" then
    L10_12 = HUD
    L11_13 = L10_12
    L10_12 = L10_12.menuSetCallback
    L10_12(L11_13, HUD.kCallback_ChallengeReward)
  end
  L10_12 = Finalize
  L10_12()
  __is_finalize = true
  L10_12 = FinalizeHeaderSandbox
  L10_12()
  L10_12 = HUD
  L11_13 = L10_12
  L10_12 = L10_12.setListOrder
  L10_12(L11_13)
  L10_12 = kDEBUG_WAIT_EXIT_SANDBOX
  __debug_phase = L10_12
  repeat
    L10_12 = wait
    L10_12()
    L10_12 = __killing
  until L10_12
  if L6_8 then
    L11_13 = L6_8
    L10_12 = L6_8.try_term
    L10_12(L11_13)
  end
  L6_8 = nil
  L10_12 = GameDatabase
  L11_13 = L10_12
  L10_12 = L10_12.set
  L10_12(L11_13, ggd.GlobalSystemFlags__IsRetryProsess, false)
  L10_12 = __sdemo
  if L10_12 then
    L10_12 = __sdemo
    L11_13 = L10_12
    L10_12 = L10_12.stop
    L10_12(L11_13, 0)
  end
  L10_12 = exitSandbox
  L10_12()
end
function exitsandbox()
  if __is_finalize == false then
    Finalize()
  end
  FinalizeHeaderSandbox()
  __npc_list = nil
  __marker_set = nil
  __debugSystemTask = false
  __exit_sandbox = true
  Replay:recEnd()
  Replay:recFileClean()
  HUD:endNoticeGhost()
end
setExitCallback(exitsandbox)
function initializeHeaderNpc()
  local L0_14, L1_15
end
function FinalizeHeaderSandbox()
  local L0_16, L1_17
end
function copyFreeSettingTable(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  L1_19 = {}
  for L5_23, L6_24 in L2_20(L3_21) do
    if type(L6_24) == "table" then
      L1_19[L5_23] = copyFreeSettingTable(L6_24)
    else
      L1_19[L5_23] = L6_24
    end
  end
  return L1_19
end
function setMissionStartPcPos()
  local L0_25, L1_26, L2_27
  L0_25 = GameDatabase
  L1_26 = L0_25
  L0_25 = L0_25.get
  L2_27 = ggd
  L2_27 = L2_27.GlobalSystemFlags__SkipPlayerStartPos
  L0_25 = L0_25(L1_26, L2_27)
  if L0_25 then
    L0_25 = GameDatabase
    L1_26 = L0_25
    L0_25 = L0_25.set
    L2_27 = ggd
    L2_27 = L2_27.GlobalSystemFlags__SkipPlayerStartPos
    L0_25(L1_26, L2_27, false)
    L0_25 = debugPrintEv
    L1_26 = "keep pc pos"
    L0_25(L1_26)
    return
  end
  L0_25 = debugPrintEv
  L1_26 = "GameDeltaSec Off"
  L0_25(L1_26)
  L0_25 = Time
  L1_26 = L0_25
  L0_25 = L0_25.setInGameDeltaSec
  L2_27 = 0
  L0_25(L1_26, L2_27)
  L0_25 = wait
  L0_25()
  L0_25 = getMissionStartPcPos
  L1_26 = L0_25()
  L2_27 = __start_floating
  if L2_27 then
    L2_27 = Player
    L2_27 = L2_27.kReset_Floating
  elseif not L2_27 then
    L2_27 = Player
    L2_27 = L2_27.kReset_Standing
  end
  Player:reset(L2_27, L0_25, L1_26)
  GameDatabase:set(ggd.GlobalSystemFlags__Idling, true)
end
function getMissionStartPcPos()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34
  L0_28 = Vector
  L1_29 = 0
  L2_30 = 0
  L3_31 = 0
  L0_28 = L0_28(L1_29, L2_30, L3_31)
  L1_29 = Quaternion
  L2_30 = 0
  L3_31 = 0
  L4_32 = 0
  L5_33 = 1
  L1_29 = L1_29(L2_30, L3_31, L4_32, L5_33)
  L2_30 = nil
  L3_31 = event_name
  if L3_31 == "eventheader" then
    L3_31 = GameDatabase
    L4_32 = L3_31
    L3_31 = L3_31.get
    L5_33 = ggd
    L5_33 = L5_33.Savedata__EventManageFlags__LateMissionName
    L3_31 = L3_31(L4_32, L5_33)
    L4_32 = string
    L4_32 = L4_32.match
    L5_33 = L3_31
    L6_34 = "%l+"
    L4_32 = L4_32(L5_33, L6_34)
    L5_33 = GameDatabase
    L6_34 = L5_33
    L5_33 = L5_33.get
    L5_33 = L5_33(L6_34, ggd.Savedata__EventManageFlags__MissionReplay)
    if L5_33 ~= "None" then
      L5_33 = GameDatabase
      L6_34 = L5_33
      L5_33 = L5_33.get
      L5_33 = L5_33(L6_34, ggd.Savedata__EventManageFlags__MissionNotice)
      if not L5_33 then
        L5_33 = findGameObject2
        L6_34 = "Node"
        L5_33 = L5_33(L6_34, "locator2_home_warp")
        L2_30 = L5_33
      end
    elseif L4_32 == "mine" then
      L5_33 = bgManager
      L6_34 = L5_33
      L5_33 = L5_33.sendEvent
      L5_33 = L5_33(L6_34, "getCraneShipManagerHandle")
      if L5_33 then
        L6_34 = L5_33.findGameObject2
        L6_34 = L6_34(L5_33, "Node", "locator2_pc_ship_pos_02")
        L2_30 = L6_34
      end
    end
  end
  if L2_30 == nil then
    L3_31 = findGameObject2
    L4_32 = "Node"
    L5_33 = "locator2_pc_start_pos"
    L3_31 = L3_31(L4_32, L5_33)
    L2_30 = L3_31
  end
  if L2_30 then
    L4_32 = L2_30
    L3_31 = L2_30.getWorldPos
    L3_31 = L3_31(L4_32)
    L0_28 = L3_31
    L3_31 = debugPrintEv
    L4_32 = "start node name > "
    L6_34 = L2_30
    L5_33 = L2_30.getName
    L5_33 = L5_33(L6_34)
    L4_32 = L4_32 .. L5_33
    L3_31(L4_32)
    L3_31 = debugPrintEv
    L4_32 = "start pos before > "
    L5_33 = tostring
    L6_34 = L0_28
    L5_33 = L5_33(L6_34)
    L4_32 = L4_32 .. L5_33
    L3_31(L4_32)
    L4_32 = L2_30
    L3_31 = L2_30.setForceMove
    L3_31(L4_32)
    L3_31 = wait
    L3_31()
    L4_32 = L2_30
    L3_31 = L2_30.getWorldPos
    L3_31 = L3_31(L4_32)
    L0_28 = L3_31
    L4_32 = L2_30
    L3_31 = L2_30.getWorldRot
    L3_31 = L3_31(L4_32)
    L1_29 = L3_31
    L3_31 = debugPrintEv
    L4_32 = "start pos after > "
    L5_33 = tostring
    L6_34 = L0_28
    L5_33 = L5_33(L6_34)
    L4_32 = L4_32 .. L5_33
    L3_31(L4_32)
    L3_31 = findUpArea
    L4_32 = L2_30
    L3_31 = L3_31(L4_32)
    if L3_31 then
      L4_32 = g_own
      L5_33 = L4_32
      L4_32 = L4_32.getGameObject
      L6_34 = "soundManager"
      L4_32 = L4_32(L5_33, L6_34)
      if L4_32 then
        L6_34 = L3_31
        L5_33 = L3_31.getName
        L5_33 = L5_33(L6_34)
        L6_34 = string
        L6_34 = L6_34.match
        L6_34 = L6_34(L5_33, "(.-)_()")
        debugPrintEv("\227\131\175\227\131\188\227\131\151\229\133\136\227\129\174\227\130\181\227\130\166\227\131\179\227\131\137\227\131\135\227\131\188\227\130\191\227\129\174\229\133\136\232\161\140\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136 " .. L5_33 .. " : " .. tostring(L6_34))
        if L6_34 == "po" or L6_34 == "mi" or L6_34 == "lo" or L6_34 == "up" or L6_34 == "go" or L6_34 == "ar" then
          L4_32:sendEvent("setVoiceJirga")
        elseif L6_34 == "cc" or L6_34 == "ed" or L6_34 == "dt" or L6_34 == "id" or L5_33 == "g1_crane_root" then
          L4_32:sendEvent("setVoiceHex")
        elseif L6_34 == "az" or L6_34 == "az2" or L6_34 == "az3" or L6_34 == "az4" or L6_34 == "az5" or L6_34 == "az6" then
          L4_32:sendEvent("setVoiceAnotherzone")
        elseif L6_34 == "bu" or L5_33 == "ve_crane_root" then
          if GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) < 5 then
            L4_32:sendEvent("setVoiceBunga")
          else
            L4_32:sendEvent("setVoiceJirga")
          end
        end
      end
    end
  else
    L3_31 = debugPrintEv
    L4_32 = "start pos nil"
    L3_31(L4_32)
  end
  L2_30 = nil
  L3_31 = L0_28
  L4_32 = L1_29
  return L3_31, L4_32
end
function Fn_missionStart(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50
  L2_37 = debugPrintEv
  L3_38 = "Fn_missionStart"
  L2_37(L3_38)
  L2_37 = GameDatabase
  L3_38 = L2_37
  L2_37 = L2_37.get
  L4_39 = ggd
  L4_39 = L4_39.Savedata__EventManageFlags__CurrentMissionName
  L2_37 = L2_37(L3_38, L4_39)
  L3_38 = GameDatabase
  L4_39 = L3_38
  L3_38 = L3_38.get
  L5_40 = ggd
  L5_40 = L5_40.Savedata__EventManageFlags__ReadyMissionName
  L3_38 = L3_38(L4_39, L5_40)
  if L2_37 ~= "eventheader" then
    L4_39 = string
    L4_39 = L4_39.find
    L5_40 = L2_37
    L6_41 = "eps"
    L4_39 = L4_39(L5_40, L6_41)
    if not L4_39 and L3_38 ~= "eventheader" then
      L4_39 = string
      L4_39 = L4_39.find
      L5_40 = L3_38
      L6_41 = "eps"
      L4_39 = L4_39(L5_40, L6_41)
    end
  elseif L4_39 then
    L4_39 = Player
    L5_40 = L4_39
    L4_39 = L4_39.setSituation
    L6_41 = Player
    L6_41 = L6_41.kSituation_Normal
    L7_42 = true
    L8_43 = 0.01
    L9_44 = false
    L10_45 = false
    L4_39(L5_40, L6_41, L7_42, L8_43, L9_44, L10_45)
    L4_39 = debugPrintEv
    L5_40 = "\227\131\149\227\131\170\227\131\188\227\130\191\227\130\164\227\131\160\227\129\174\227\129\191Fn_missionStart\227\129\167\229\188\183\229\136\182\231\154\132\227\129\171\227\131\142\227\131\188\227\131\158\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\227\129\171\230\136\187\227\129\151\227\129\190\227\129\151\227\129\159"
    L4_39(L5_40)
    L4_39 = Player
    L5_40 = L4_39
    L4_39 = L4_39.setAttrTune
    L6_41 = Player
    L6_41 = L6_41.kAttrTune_Normal
    L7_42 = true
    L4_39(L5_40, L6_41, L7_42)
  end
  L4_39 = string
  L4_39 = L4_39.sub
  L5_40 = GameDatabase
  L6_41 = L5_40
  L5_40 = L5_40.get
  L7_42 = ggd
  L7_42 = L7_42.Savedata__EventManageFlags__CurrentMissionName
  L5_40 = L5_40(L6_41, L7_42)
  L6_41 = 1
  L7_42 = 4
  L4_39 = L4_39(L5_40, L6_41, L7_42)
  L5_40 = string
  L5_40 = L5_40.sub
  L6_41 = GameDatabase
  L7_42 = L6_41
  L6_41 = L6_41.get
  L8_43 = ggd
  L8_43 = L8_43.Savedata__EventManageFlags__ReadyMissionName
  L6_41 = L6_41(L7_42, L8_43)
  L7_42 = 1
  L8_43 = 4
  L5_40 = L5_40(L6_41, L7_42, L8_43)
  if L5_40 ~= "None" and L4_39 ~= L5_40 then
    L6_41 = print
    L7_42 = "\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\140\229\164\137\227\130\143\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\231\155\174\231\154\132\232\161\168\231\164\186\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159"
    L6_41(L7_42)
    L6_41 = Fn_missionViewEnd
    L6_41()
    L6_41 = Fn_missionInfoEnd
    L6_41()
  end
  L6_41 = Player
  L7_42 = L6_41
  L6_41 = L6_41.getPuppet
  L6_41 = L6_41(L7_42)
  L7_42 = debugPrintEv
  L8_43 = "GameDeltaSec On"
  L7_42(L8_43)
  L8_43 = L6_41
  L7_42 = L6_41.setCollidable
  L9_44 = true
  L7_42(L8_43, L9_44)
  L7_42 = Time
  L8_43 = L7_42
  L7_42 = L7_42.resetInGameDeltaSec
  L7_42(L8_43)
  L7_42 = wait
  L7_42()
  L6_41 = nil
  while true do
    L7_42 = Area
    L8_43 = L7_42
    L7_42 = L7_42.isSkyStable
    L7_42 = L7_42(L8_43)
    if not L7_42 then
      L7_42 = wait
      L7_42()
    end
  end
  if not A1_36 then
    L7_42 = Fn_mobWaitForReady
    L7_42()
  end
  L7_42 = _accessIndicatorKill
  L7_42()
  L7_42 = QA
  L8_43 = L7_42
  L7_42 = L7_42.BootTestFinishLoadMission
  L7_42(L8_43)
  __mission_start = true
  repeat
    L7_42 = wait
    L7_42()
    L7_42 = __ingame_run
  until L7_42
  L7_42 = g_own
  L8_43 = L7_42
  L7_42 = L7_42.getGameObject
  L9_44 = "soundManager"
  L7_42 = L7_42(L8_43, L9_44)
  if L7_42 then
    L9_44 = L7_42
    L8_43 = L7_42.sendEvent
    L10_45 = "request"
    L11_46 = event_name
    L12_47 = "mission"
    L13_48 = "start"
    L8_43(L9_44, L10_45, L11_46, L12_47, L13_48)
    L8_43 = wait
    L8_43()
  end
  if A0_35 then
    L8_43 = A0_35
    L8_43()
  end
  if A1_36 then
    L8_43 = Fn_blackout
    L8_43()
  else
    L8_43 = Fn_fadein
    L8_43()
  end
  if L2_37 ~= "eventheader" then
    L8_43 = string
    L8_43 = L8_43.find
    L9_44 = L2_37
    L10_45 = "eps"
    L8_43 = L8_43(L9_44, L10_45)
    if not L8_43 and L3_38 ~= "eventheader" then
      L8_43 = string
      L8_43 = L8_43.find
      L9_44 = L3_38
      L10_45 = "eps"
      L8_43 = L8_43(L9_44, L10_45)
    end
  elseif L8_43 then
    L8_43 = Fn_setCatWarp
    L9_44 = true
    L8_43(L9_44)
  end
  L8_43 = __menuSetCallback
  if L8_43 then
    L8_43 = HUD
    L9_44 = L8_43
    L8_43 = L8_43.menuSetCallback
    L10_45 = HUD
    L10_45 = L10_45.kCallback_Retire
    L11_46 = mission_retire
    L8_43(L9_44, L10_45, L11_46)
    __menuSetCallback = false
  end
  L8_43 = Fn_getGameObject
  L9_44 = "enemyManager"
  L8_43 = L8_43(L9_44)
  L10_45 = L8_43
  L9_44 = L8_43.requestIdlingEnemy
  L11_46 = false
  L9_44(L10_45, L11_46)
  L8_43 = nil
  L9_44 = Fn_getGameObject
  L10_45 = "bgManager"
  L9_44 = L9_44(L10_45)
  L11_46 = L9_44
  L10_45 = L9_44.sendEvent
  L12_47 = "getStateCraneShip"
  L13_48 = {}
  L14_49 = {}
  L14_49.is_move_end = true
  L13_48.cage = L14_49
  L10_45 = L10_45(L11_46, L12_47, L13_48)
  if L10_45 then
    L10_45 = Fn_getGameObject
    L11_46 = "mother2"
    L10_45 = L10_45(L11_46)
    L12_47 = L10_45
    L11_46 = L10_45.sendEvent
    L13_48 = "requestEnemyManager"
    L14_49 = {}
    L14_49.target_select_on = true
    L11_46(L12_47, L13_48, L14_49)
    L10_45 = nil
    L11_46 = debugPrintEv
    L12_47 = "requestEnemyTargetSelectAllOff\227\130\146\229\191\181\227\129\174\227\129\159\227\130\129false\227\129\171\227\129\153\227\130\139\227\130\136\227\129\134\227\129\171\229\174\159\232\161\140"
    L11_46(L12_47)
  end
  L10_45 = Analytics
  L11_46 = L10_45
  L10_45 = L10_45.missionStatus
  L12_47 = Analytics
  L12_47 = L12_47.kMissionStart
  L10_45(L11_46, L12_47)
  L10_45 = GameDatabase
  L11_46 = L10_45
  L10_45 = L10_45.get
  L12_47 = ggd
  L12_47 = L12_47.GlobalSystemFlags__Trophy
  L10_45 = L10_45(L11_46, L12_47)
  if L10_45 ~= 0 then
    L11_46 = Net
    L12_47 = L11_46
    L11_46 = L11_46.trophyUnlock
    L13_48 = L10_45
    L11_46(L12_47, L13_48)
    L11_46 = GameDatabase
    L12_47 = L11_46
    L11_46 = L11_46.set
    L13_48 = ggd
    L13_48 = L13_48.GlobalSystemFlags__Trophy
    L14_49 = 0
    L11_46(L12_47, L13_48, L14_49)
  end
  L11_46 = kDEBUG_MISSION_START
  __debug_phase = L11_46
  L11_46 = Fn_getGameObject
  L12_47 = "mother2"
  L11_46 = L11_46(L12_47)
  L13_48 = L11_46
  L12_47 = L11_46.sendEvent
  L14_49 = "DBG_deltaTimerStop"
  L12_47(L13_48, L14_49)
  L11_46 = nil
  L12_47 = false
  L13_48 = event_name
  if L13_48 == "eventheader" then
    L13_48 = Fn_digoutResultForMission
    L13_48()
    L13_48 = GameDatabase
    L14_49 = L13_48
    L13_48 = L13_48.get
    L15_50 = ggd
    L15_50 = L15_50.GlobalSystemFlags__SideEnd
    L13_48 = L13_48(L14_49, L15_50)
    if L13_48 ~= "None" then
      L14_49 = "ui_sm_main_"
      L15_50 = L13_48
      L14_49 = L14_49 .. L15_50
      L15_50 = "ui_sm_sub_04"
      if L13_48 == "sm93" then
        L15_50 = "ui_sm_sub_05"
      end
      if g_own:getGameObject("soundManager") then
        g_own:getGameObject("soundManager"):sendEvent("requestJingle", "mission_clear")
      end
      L12_47 = true
      HUD:sideMissionEndOpen(L14_49, L15_50)
      GameDatabase:set(ggd.GlobalSystemFlags__SideEnd, "None")
      waitSeconds(7)
    end
  end
  L13_48 = GameDatabase
  L14_49 = L13_48
  L13_48 = L13_48.get
  L15_50 = ggd
  L15_50 = L15_50.Savedata__Player__LevelUp
  L13_48 = L13_48(L14_49, L15_50)
  if L13_48 then
    L13_48 = GameDatabase
    L14_49 = L13_48
    L13_48 = L13_48.set
    L15_50 = ggd
    L15_50 = L15_50.Savedata__Player__LevelUp
    L13_48(L14_49, L15_50, false)
    if L12_47 ~= true then
      L12_47 = true
      L13_48 = g_own
      L14_49 = L13_48
      L13_48 = L13_48.getGameObject
      L15_50 = "soundManager"
      L13_48 = L13_48(L14_49, L15_50)
      if L13_48 then
        L15_50 = L13_48
        L14_49 = L13_48.sendEvent
        L14_49(L15_50, "requestJingle", "mission_clear")
      end
    end
    L13_48 = Fn_captionViewWait
    L14_49 = "ic_eventcommon_01"
    L13_48(L14_49)
  end
  L13_48 = GameDatabase
  L14_49 = L13_48
  L13_48 = L13_48.get
  L15_50 = ggd
  L15_50 = L15_50.Savedata__RewardFlags__Index
  L13_48 = L13_48(L14_49, L15_50)
  if L13_48 ~= "None" then
    L14_49 = GameDatabase
    L15_50 = L14_49
    L14_49 = L14_49.set
    L14_49(L15_50, ggd.Savedata__RewardFlags__Index, "None")
    L14_49 = GameDatabase
    L15_50 = L14_49
    L14_49 = L14_49.get
    L14_49 = L14_49(L15_50, ggd.Savedata__EventManageFlags__LateMissionName)
    L15_50 = string
    L15_50 = L15_50.match
    L15_50 = L15_50(L14_49, "%l+")
    L12_47 = true
    _rewardView(L15_50, L13_48, L12_47, nil, nil, ggd.Savedata__RewardFlags__Index)
  end
  L14_49 = event_name
  if L14_49 == "eventheader" then
    L14_49 = GameDatabase
    L15_50 = L14_49
    L14_49 = L14_49.get
    L14_49 = L14_49(L15_50, ggd.Savedata__RewardFlags__CmGold)
    if L14_49 ~= "None" then
      L15_50 = GameDatabase
      L15_50 = L15_50.set
      L15_50(L15_50, ggd.Savedata__RewardFlags__CmGold, "None")
      L15_50 = string
      L15_50 = L15_50.match
      L15_50 = L15_50(L14_49, "%l+")
      _rewardView(L15_50, L14_49, L12_47, nil, nil, ggd.Savedata__RewardFlags__CmGold)
    end
  else
    L14_49 = HUD
    L15_50 = L14_49
    L14_49 = L14_49.setUserControlLock
    L14_49(L15_50, false)
  end
  L14_49 = GameDatabase
  L15_50 = L14_49
  L14_49 = L14_49.set
  L14_49(L15_50, ggd.GlobalSystemFlags__IsMissionStart, true)
end
function Fn_exitSandbox()
  if HUD:isPhotoMode() or HUD:isPhotoModePlayingAnim() then
    HUD:setPhotoMode(false)
  end
  if Fn_getGameObject("eventheader") ~= nil then
    Fn_getGameObject("eventheader"):sendEvent("kill")
  end
  if g_own:getGameObject("soundManager") then
    g_own:getGameObject("soundManager"):sendEvent("resetCounter")
  end
  kill()
end
function Fn_sendEventComSb(...)
  return Fn_getGameObject("com_sb"):sendEvent(...)
end
function Fn_setNextMissionFlag(A0_51)
  if string.match(event_name, "%l+") ~= "cm" and (Player:getEnergy(Player.kEnergy_Life) <= 0 or Player:getDeathState() == Player.kDeath_Dead or GameDatabase:get(ggd.GlobalSystemFlags__GameOver)) then
    debugPrintEv("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\170\227\129\174\227\129\167 Fn_setNextMissionFlag \227\129\175\229\143\151\227\129\145\228\187\152\227\129\145\227\129\190\227\129\155\227\130\147")
  elseif Fn_getGameObject("eventManager") ~= nil and Fn_getGameObject("eventManager"):sendEvent("requestSetNextMissionName", A0_51) == false then
    debugPrintEv("setNextMissionFlag is failed!!!!!!")
  end
end
function Fn_nextMission()
  if string.match(event_name, "%l+") ~= "cm" and (Player:getEnergy(Player.kEnergy_Life) <= 0 or Player:getDeathState() == Player.kDeath_Dead or GameDatabase:get(ggd.GlobalSystemFlags__GameOver)) then
    debugPrintEv("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\170\227\129\174\227\129\167 Fn_nextMission \227\129\175\229\143\151\227\129\145\228\187\152\227\129\145\227\129\190\227\129\155\227\130\147")
  elseif Fn_getGameObject("eventManager") ~= nil then
    if Fn_getGameObject("eventManager"):sendEvent("requestNextMission") == false then
      debugPrintEv("nextMission is failed!!!!!!")
    elseif not __retry_mission then
      GameDatabase:set(ggd.GlobalSystemFlags__GameRetry, false)
    end
  end
end
function Fn_setKeepPlayerPos()
  if string.match(event_name, "%l+") ~= "cm" and (Player:getEnergy(Player.kEnergy_Life) <= 0 or Player:getDeathState() == Player.kDeath_Dead or GameDatabase:get(ggd.GlobalSystemFlags__GameOver)) then
    debugPrintEv("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\170\227\129\174\227\129\167 Fn_setKeepPlayerPos \227\129\175\229\143\151\227\129\145\228\187\152\227\129\145\227\129\190\227\129\155\227\130\147")
  else
    GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, true)
  end
end
function Fn_setPcFloatingStart()
  local L0_52, L1_53
  __start_floating = true
end
function Fn_setAreaWarp(A0_54, A1_55)
  local L2_56
  __area = false
  L2_56 = A1_55
  if type(L2_56) == "string" then
    L2_56 = findGameObject2("Node", A1_55)
  end
  Fn_getGameObject("bgManager"):sendEvent("setWarpArea", A0_54, L2_56)
end
function Fn_setCostume(A0_57, A1_58)
  __sb_father2:sendEvent("_setCostume", A0_57, nil, A1_58)
end
function Fn_getCostume()
  return GameDatabase:get(ggd.Savedata__Player__Costume)
end
function Fn_setMissionRetryFunc(A0_59)
  local L1_60
  __retry_func = A0_59
end
function Fn_missionRetry(A0_61)
  mission_retry(A0_61)
  repeat
    wait()
  until false
end
function Fn_skipMissionRetryAtProcessing(A0_62)
  if not GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) and A0_62 then
    A0_62()
    return true
  end
  return false
end
CDemo = {capture_wait = true, finish = false}
function Fn_playCDemo(A0_63)
  CDemo = getCDemoTable(A0_63)
  CDemo.capture_wait = false
  CDemo.capture_wait_notime = true
  HUD:cdemo(A0_63, tonumber(string.match(A0_63, "%d+")))
  HUD:menuOpen("CDemo")
  wait()
  PhotoMgr:DeleteAllItem()
  repeat
    wait()
  until CDemo.finish
end
function Fn_cityPlaceName(A0_64)
  GameDatabase:set(ggd.Savedata__EventManageFlags__CityPlaceName, A0_64)
end
function Fn_setRetryMissionName(A0_65)
  if type(A0_65) ~= "string" then
    return false
  end
  if A0_65 == "None" or A0_65 == "" then
    return false
  end
  __retry_mission = A0_65
end
function Fn_getBgsetHandle()
  if not Fn_getGameObject("bgManager") then
    return nil
  end
  if not Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle") then
    return nil
  end
  return (Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle"))
end
function Fn_requestVoiceHex()
  if g_own:getGameObject("soundManager") then
    g_own:getGameObject("soundManager"):sendEvent("setVoiceHex")
  end
end
function Fn_setDelaySDemoStop(A0_66)
  local L1_67
  __sdemo = A0_66
end
function isInitialized()
  local L0_68, L1_69
  L0_68 = __initialized
  return L0_68
end
function isReadyGameObject()
  local L0_70, L1_71
  L0_70 = __ready_object
  return L0_70
end
function isStartGameObject()
  local L0_72, L1_73
  L0_72 = __start_object
  return L0_72
end
function sbRun()
  local L0_74, L1_75
  __run = true
end
function sbKill()
  local L0_76, L1_77
  __killing = true
end
function areaWarpFinish()
  local L0_78, L1_79
  __area = true
end
function startGameObjects()
  local L0_80, L1_81
  __start = true
end
function isMissionStart()
  local L0_82, L1_83
  L0_82 = __mission_start
  return L0_82
end
function inGameRun()
  local L0_84, L1_85
  __ingame_run = true
end
function kill()
  if __ingame_task and __ingame_task:isRunning() then
    __ingame_task:abort()
  end
  __ingame_task = nil
end
function _retireMission(A0_86)
  if Fn_getGameObject("eventManager") ~= nil and Fn_getGameObject("eventManager"):sendEvent("requestRetireMission", A0_86) == false then
    print("----- eventManager:nextMission is failed!!!!!!")
  end
end
function _requestRetryMission()
  if Fn_getGameObject("eventManager") then
    Fn_getGameObject("eventManager"):sendEvent("requestRetryMission")
  end
end
function _requestRetireMission(A0_87)
  if Fn_getGameObject("eventManager") ~= nil and Fn_getGameObject("eventManager"):sendEvent("requestRetireMission") == false then
    debugPrintEv("eventManager:nextMission is failed!!!!!!")
  end
end
function _resetSoundParam()
  if g_own:getGameObject("soundManager") then
    g_own:getGameObject("soundManager"):sendEvent("resetParam")
  end
  debugPrintEv("\227\130\181\227\130\166\227\131\179\227\131\137\227\131\158\227\131\141\227\131\188\227\130\184\227\131\163\227\129\171\227\131\170\227\130\187\227\131\131\227\131\136\227\129\174\232\166\129\230\177\130")
end
function _termAllNpc()
  if Fn_getGameObject("npcManager") then
    Fn_getGameObject("npcManager"):sendEvent("requestTerm", 0)
  end
  debugPrintEv("NPC\227\131\158\227\131\141\227\131\188\227\130\184\227\131\163\231\174\161\231\144\134\227\129\174NPC\227\129\174\229\137\138\233\153\164\228\190\157\233\160\188")
end
function _resetFeline()
  if Player:isFeline() then
    Player:setFeline(false, false)
    Player:setEnergyInfinite(Player.kEnergy_FelineMP, false)
    debugPrintEv("\227\131\149\227\130\167\227\131\170\227\131\179\231\138\182\230\133\139\227\130\146\229\188\183\229\136\182\227\131\170\227\130\187\227\131\131\227\131\136")
  end
  Player:setEnergy(Player.kEnergy_Feline, 0)
end
function mission_retry(A0_88)
  GameDatabase:set(ggd.GlobalSystemFlags__GameRetry, true)
  GameDatabase:set(ggd.GlobalSystemFlags__IsRetryProsess, true)
  Time:setInGameDeltaSec(0)
  if A0_88 == true then
    HUD:whiteout(0.5)
  else
    HUD:blackout(0.5)
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  invokeSystemTask(function()
    repeat
      while not __exit_sandbox do
        wait()
      end
    until HUD:faderStability()
    GameDatabase:set(ggd.GlobalSystemFlags__ObjectRestore, true)
    Player:setGestureEventMode(false)
    Player:setGestureEventNpcNodes()
    Mob:enableNavigationSituation(false)
    Mob:registerNavigationCallback()
    _resetFeline()
    _resetHUD()
    __retry_func()
    _resetSoundParam()
    Fn_recoverEnergyFully()
    if MineManager and MineManager:isRunning() then
      MineManager:sendEvent("sendRequestRetryReset")
    end
    if Fn_getGameObject("eventManager") ~= nil then
      Fn_getGameObject("eventManager"):sendEvent("requestTermCommonSandbox")
    end
    if __retry_mission then
      Fn_setNextMissionFlag(__retry_mission)
      Fn_nextMission()
    else
      _requestRetryMission()
    end
    Fn_exitSandbox()
    __killing = true
    HUD:delGameoverCallback()
    HUD:menuDelCallback(HUD.kCallback_Retire)
  end)
  abortAllGameTasks()
  if Fn_getGameObject("com_sb") and Fn_getGameObject("com_sb"):isRunning() then
    Fn_getGameObject("com_sb"):sendEvent("sbAllAboutTask")
  end
end
function mission_retire()
  abortAllGameTasks()
  GameDatabase:set(ggd.GlobalSystemFlags__GameRetire, true)
  if Fn_getGameObject("com_sb") then
    Fn_getGameObject("com_sb"):sendEvent("sbAllAboutTask")
  end
  Time:setInGameDeltaSec(0)
  HUD:blackout(0)
  Fn_userCtrlAllOff()
  Player:setStay(true)
  if __pdemo_sehandle then
    Sound:stopSEHandle(__pdemo_sehandle)
    print("ev com pdemo : stopSE", __pdemo_sehandle)
    __pdemo_sehandle = nil
  end
  GameDatabase:set(ggd.GlobalSystemFlags__AreaResetAABB, true)
  GameDatabase:set(ggd.GlobalSystemFlags__ObjectRestore, true)
  Player:setGestureEventMode(false)
  Player:setGestureEventNpcNodes()
  Mob:enableNavigationSituation(false)
  Mob:registerNavigationCallback()
  _resetFeline()
  _resetHUD()
  _resetSoundParam()
  Fn_recoverEnergyFully()
  _requestRetireMission()
  if Fn_getGameObject("eventManager") ~= nil then
    Fn_getGameObject("eventManager"):sendEvent("requestTermCommonSandbox")
  end
  Fn_exitSandbox()
  HUD:delGameoverCallback()
  HUD:menuDelCallback(HUD.kCallback_Retire)
end
function menuLock()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) == 0 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) >= 1 and GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) < 3 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) == 3 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType) == "free" then
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
    else
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
    end
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) == 24 or GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) == 27 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) == 80 then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, false)
    if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName) == "ep80_a" then
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, false)
    else
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
    end
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SaveLoadSave, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SaveLoadLoad, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SystemResultList, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SystemDifficult, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SystemKeyControl, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SystemSound, false)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SystemPhoto, false)
  else
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
  end
  if g_own:getName() == "eventheader" then
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SaveLoadSave, true)
    GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SaveLoadLoad, true)
  end
end
function Fn_menuLock(A0_89)
  if string.match(event_name, "%l+") == "eps" then
    if tonumber(string.match(event_name, "%d+")) == 3 then
      if not A0_89 then
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, true)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
      else
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, false)
        GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
      end
    elseif tonumber(string.match(event_name, "%d+")) == 4 then
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, false)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, false)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, false)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, false)
      GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
    end
  end
end
function Fn_menuUnLockEp03()
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuInfo, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMap, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuMission, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSystem, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, true)
end
function _setMemoriesPhoto(A0_90)
  local L1_91, L2_92, L3_93, L4_94, L5_95, L6_96, L7_97
  L1_91 = 30
  L2_92 = _getMemoriesPictureSets
  L2_92 = L2_92()
  L3_93 = {}
  if nil ~= L4_94 then
    L3_93 = L2_92[A0_90]
  end
  for L7_97 = 1, L1_91 do
    if nil == L3_93[ggd["Savedata__HomeInfo__Photo__photo_a_" .. string.format("%02d", L7_97)]] then
      L3_93[ggd["Savedata__HomeInfo__Photo__photo_a_" .. string.format("%02d", L7_97)]] = false
    end
  end
  L4_94(L5_95, L6_96)
  L4_94(L5_95, L6_96)
end
function _autoMemoriesPhoto()
  local L0_98, L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109
  L0_98 = 30
  L1_99 = {}
  L1_99.ep = 10
  L1_99.ft = 20
  L1_99.eps = 30
  L2_100 = _getMemoriesPictureSets
  L2_100 = L2_100()
  L3_101 = GameDatabase
  L4_102 = L3_101
  L3_101 = L3_101.get
  L5_103 = ggd
  L5_103 = L5_103.Savedata__EventManageFlags__ClearEpisodeNum
  L3_101 = L3_101(L4_102, L5_103)
  L4_102 = GameDatabase
  L5_103 = L4_102
  L4_102 = L4_102.get
  L6_104 = ggd
  L6_104 = L6_104.Savedata__EventManageFlags__CurrentMissionName
  L4_102 = L4_102(L5_103, L6_104)
  if L4_102 == "eventheader" then
    L5_103 = GameDatabase
    L6_104 = L5_103
    L5_103 = L5_103.get
    L7_105 = ggd
    L7_105 = L7_105.Savedata__EventManageFlags__CurrentFreeMode
    L5_103 = L5_103(L6_104, L7_105)
    L4_102 = L5_103
  else
    L5_103 = string
    L5_103 = L5_103.match
    L6_104 = L4_102
    L7_105 = "%l+%d+"
    L5_103 = L5_103(L6_104, L7_105)
    L4_102 = L5_103
  end
  L5_103 = "ep00"
  L6_104 = "ep"
  L7_105 = 0
  for L11_109, _FORV_12_ in L8_106(L9_107) do
    if L11_109 == L4_102 then
      L5_103 = L11_109
      break
    elseif L3_101 >= tonumber(string.match(L11_109, "%d+")) then
      if L7_105 < tonumber(string.match(L11_109, "%d+")) then
        L5_103 = L11_109
        L7_105, L6_104 = tonumber(string.match(L11_109, "%d+")), string.match(L11_109, "%l+")
      elseif L1_99[string.match(L11_109, "%l+")] < L1_99[L6_104] then
        L5_103 = L11_109
        L7_105, L6_104 = tonumber(string.match(L11_109, "%d+")), string.match(L11_109, "%l+")
      end
    end
  end
  L8_106(L9_107)
end
function _challengeRewardCallback(A0_110, A1_111)
  GameDatabase:set(ggd.Savedata__RewardFlags__CmGold, event_name)
  GameDatabase:backup(ggd.Savedata__RewardFlags__CmGold)
end
import("Font")
import("Debug")
import("DeltaTimer")
kDEBUG_PHASE_EMP = 0
kDEBUG_MAIN_START = 1
kDEBUG_CREATE_CHARA = 2
kDEBUG_EVD_INIT = 3
kDEBUG_INITIALIZE_FUNC = 4
kDEBUG_WAIT_AREA_WARP = 5
kDEBUG_SET_PC_POS_AND_INIT_OBJECT = 6
kDEBUG_WAIT_OBJECT_START = 7
kDEBUG_OBJECT_START = 8
kDEBUG_WAIT_INGAME = 9
kDEBUG_INGAME_PREP = 10
kDEBUG_INGAME = 11
kDEBUG_MISSION_START = 12
kDEBUG_FINALIZE = 13
kDEBUG_WAIT_EXIT_SANDBOX = 14
__debugSystemTask = true
__debug_phase = kDEBUG_PHASE_EMP
__debugTxt = "\227\131\128\227\131\159\227\131\188"
__debugDispX = 0
__debugTxtArray = {}
__debugLine = 0
__debugDispMission = false
__debugDispMissionLine = 0
__debugDispMissionArray = {}
__debugUnder = false
__debugDemo = false
__debugDisp = false
__debugDispTime = false
__debugCreateTime = {
  {time = 0, name = "main_start"},
  {
    time = 0,
    name = "create_chara"
  },
  {time = 0, name = "evd_init"},
  {
    time = 0,
    name = "initialize_func"
  },
  {
    time = 0,
    name = "wait_area_warp"
  },
  {
    time = 0,
    name = "set_pos_and_object_init"
  },
  {
    time = 0,
    name = "wait_object_start"
  },
  {
    time = 0,
    name = "object_start"
  },
  {
    time = 0,
    name = "wait_ingame"
  },
  {
    time = 0,
    name = "ingame_prep"
  },
  {time = 0, name = "ingame"},
  {
    time = 0,
    name = "mission_start"
  },
  {time = 0, name = "finalize"},
  {
    time = 0,
    name = "wait_exit_sandbox"
  }
}
__debugDt = nil
function debugTextUnder(A0_112)
  local L1_113
  __debugUnder = false
  if A0_112 ~= false then
    __debugUnder = true
  end
end
function debugTextDemo(A0_114)
  local L1_115
  __debugDemo = false
  if A0_114 ~= false then
    __debugDemo = true
  end
end
function debugTextAdd(A0_116)
  table.insert(__debugTxtArray, A0_116)
end
function debugTextClear()
  local L0_117, L1_118
  L0_117 = {}
  __debugTxtArray = L0_117
end
function debugTextOneLine(A0_119, A1_120)
  debugTextClear()
  debugTextAdd(A0_119)
  waitSeconds(A1_120)
  debugTextClear()
end
function debugPrintEv(A0_121)
  print(" [  ev com ] : " .. g_own:getName() .. " : " .. A0_121)
end
function debugDispPrint(A0_122, A1_123)
  local L2_124
  L2_124 = __debugDispX
  L2_124 = 30 + L2_124
  if Debug:isDebugMenuOpen() then
    if __debugDispX == 0 then
      L2_124 = 230 + __debugDispX
    else
      L2_124 = 30 + __debugDispX
    end
  end
  if 0 < string.len(A0_122) then
    if A1_123 ~= nil then
      if __debugDemo == false then
        if __debugUnder == true then
          Font:testPrint(L2_124 + 240, 920 - 40 * #__debugTxtArray + 40 * __debugLine, A0_122, Font.kLayerFront)
        else
          Font:testPrint(L2_124 + 240, 120 + 40 * __debugLine, A0_122, Font.kLayerFront)
        end
      else
        Font:testPrint(L2_124 + 180, 300 + 40 * __debugLine, A0_122, Font.kLayerFront)
      end
    else
      Font:debugPrint(L2_124, 50 + 16 * __debugLine, A0_122)
    end
  end
  __debugLine = __debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_125, L1_126, L2_127, L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134
    L0_125 = kDEBUG_PHASE_EMP
    L1_126, L2_127 = nil, nil
    L3_128 = false
    L4_129 = 0
    while true do
      if L5_130 then
        if L5_130 == L6_131 then
          if L3_128 then
            L5_130(L6_131)
            L1_126 = nil
            L3_128 = false
          end
        elseif not L3_128 then
          L1_126 = L5_130
          L5_130(L6_131)
          L2_127 = L5_130
          L5_130(L6_131)
          L3_128 = true
        end
        if L0_125 ~= L5_130 then
          L5_130(L6_131)
          L8_133 = L0_125
          L6_131.name = L7_132
          L8_133 = L1_126
          L6_131.time = L7_132
          L5_130[L0_125] = L6_131
          if L5_130 ~= L6_131 then
            L1_126 = L5_130
            L5_130(L6_131)
          elseif L2_127 then
            L5_130(L6_131)
            L4_129 = L5_130
          end
          L0_125 = __debug_phase
          L9_134 = L6_131(L7_132)
          L5_130(L6_131, L7_132, L8_133, L9_134, L6_131(L7_132))
        end
        if L5_130 == true then
          __debugDispX = 600
          __debugLine = 0
          L5_130(L6_131)
          L8_133 = __debug_phase
          L8_133 = " ]"
          L5_130(L6_131)
        end
        if L5_130 then
          __debugDispX = 600
          L5_130(L6_131)
          L8_133 = "mission start"
          L8_133 = L4_129
          L5_130(L6_131)
          for L8_133, L9_134 in L5_130(L6_131) do
            debugDispPrint(" " .. string.format("%-23s", L9_134.name) .. " < " .. L9_134.time)
          end
        end
        if L5_130 then
          __debugLine = 0
          __debugDispX = 0
          for L8_133, L9_134 in L5_130(L6_131) do
            debugDispPrint(L9_134, true)
          end
        end
        L5_130()
      end
    end
  end)
end
function debugPhase(A0_135)
  local L1_136
  L1_136 = kDEBUG_MAIN_START
  if A0_135 == L1_136 then
    L1_136 = "main_start"
    return L1_136
  else
    L1_136 = kDEBUG_CREATE_CHARA
    if A0_135 == L1_136 then
      L1_136 = "create_chara"
      return L1_136
    else
      L1_136 = kDEBUG_EVD_INIT
      if A0_135 == L1_136 then
        L1_136 = "evd_init"
        return L1_136
      else
        L1_136 = kDEBUG_INITIALIZE_FUNC
        if A0_135 == L1_136 then
          L1_136 = "initialize_func"
          return L1_136
        else
          L1_136 = kDEBUG_WAIT_AREA_WARP
          if A0_135 == L1_136 then
            L1_136 = "wait_area_warp"
            return L1_136
          else
            L1_136 = kDEBUG_SET_PC_POS_AND_INIT_OBJECT
            if A0_135 == L1_136 then
              L1_136 = "set_pos_and_object_init"
              return L1_136
            else
              L1_136 = kDEBUG_WAIT_OBJECT_START
              if A0_135 == L1_136 then
                L1_136 = "wait_object_start"
                return L1_136
              else
                L1_136 = kDEBUG_OBJECT_START
                if A0_135 == L1_136 then
                  L1_136 = "object_start"
                  return L1_136
                else
                  L1_136 = kDEBUG_WAIT_INGAME
                  if A0_135 == L1_136 then
                    L1_136 = "wait_ingame"
                    return L1_136
                  else
                    L1_136 = kDEBUG_INGAME_PREP
                    if A0_135 == L1_136 then
                      L1_136 = "ingame_prep"
                      return L1_136
                    else
                      L1_136 = kDEBUG_INGAME
                      if A0_135 == L1_136 then
                        L1_136 = "ingame"
                        return L1_136
                      else
                        L1_136 = kDEBUG_MISSION_START
                        if A0_135 == L1_136 then
                          L1_136 = "mission_start"
                          return L1_136
                        else
                          L1_136 = kDEBUG_FINALIZE
                          if A0_135 == L1_136 then
                            L1_136 = "finalize"
                            return L1_136
                          else
                            L1_136 = kDEBUG_WAIT_EXIT_SANDBOX
                            if A0_135 == L1_136 then
                              L1_136 = "wait_exit_sandbox"
                              return L1_136
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_136 = "emp"
  return L1_136
end
function debugCreateLocater(A0_137, A1_138, A2_139)
  local L3_140, L4_141, L5_142, L6_143
  if A2_139 ~= "None" and A2_139 ~= nil then
    L3_140 = Fn_getGameObject
    L4_141 = "bgManager"
    L3_140 = L3_140(L4_141)
    if L3_140 ~= nil then
      L5_142 = L3_140
      L4_141 = L3_140.sendEvent
      L4_141 = L4_141(L5_142, L6_143)
      if L4_141 ~= nil then
        L5_142 = nil
        for _FORV_9_, _FORV_10_ in L6_143(L4_141) do
          if _FORV_10_:getTypeName() == "Area" then
            L5_142 = _FORV_10_:findSubArea(A2_139)
          end
          if L5_142 == nil then
          end
        end
        if L5_142 ~= nil then
          L6_143:setName(A0_137)
          L6_143:setTransform(A1_138, Quaternion(0, 0, 0, 1))
          L6_143:setForceMove()
          L5_142:appendChild(L6_143)
        end
      end
    end
    L3_140 = nil
  end
end
function setDebugDispMission()
  local L1_144
  L1_144 = __debugDispMission
  L1_144 = not L1_144
  __debugDispMission = L1_144
end
function setDebugDispMissionText(A0_145)
  table.insert(__debugDispMissionArray, A0_145)
end
function debugDispMissionPrint(A0_146)
  local L1_147
  L1_147 = Debug
  L1_147 = L1_147.isDebugMenuOpen
  L1_147 = L1_147(L1_147)
  if L1_147 then
    L1_147 = 250
  else
    L1_147 = L1_147 or 50
  end
  if string.len(A0_146) > 0 then
    Font:debugPrint(L1_147, 50 + 20 * __debugDispMissionLine, A0_146)
  end
  __debugDispMissionLine = __debugDispMissionLine + 1
end
function debugDispMission()
  invokeSystemTask(function()
    local L0_148, L1_149, L2_150, L3_151, L4_152
    while true do
      if L0_148 then
        if L0_148 then
          __debugDispMissionLine = 0
          L3_151 = " ==="
          L0_148(L1_149)
          for L3_151, L4_152 in L0_148(L1_149) do
            debugDispMissionPrint(L4_152)
          end
        end
        __debugDispMissionArray = L0_148
        L0_148()
      end
    end
  end)
end
g_customDebugMenu = {
  {
    name = "next part",
    callback = function()
      if g_own:getName() ~= "eventheader" then
        Fn_setNextMissionFlag()
        Fn_nextMission()
        Fn_exitSandbox()
      end
    end
  },
  {
    name = "DebugDisp",
    callback = function()
      local L1_153
      L1_153 = __debugDisp
      L1_153 = not L1_153
      __debugDisp = L1_153
    end
  },
  {
    name = "DebugDispTime",
    callback = function()
      local L1_154
      L1_154 = __debugDispTime
      L1_154 = not L1_154
      __debugDispTime = L1_154
    end
  },
  {
    name = "DebugDispMission",
    callback = function()
      local L1_155
      L1_155 = __debugDispMission
      L1_155 = not L1_155
      __debugDispMission = L1_155
    end
  }
}
