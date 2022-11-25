import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Npc/npc.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
puppet_task = {}
phase03_object = nil
phase03_photo = nil
puppet_task = {}
phase03_test_out = false
phase03_task = nil
phase03_effect = {}
phase03_sdemo = nil
__enemy_cnt = 0
enmgen2_phase03_01 = {
  spawnOnStart = false,
  autoPerpare = true,
  spawnSet = {
    {
      type = "gorotuki",
      locator = "locator_phase03_01_01",
      name = "phase03_01_01"
    },
    {
      type = "police",
      locator = "locator_phase03_01_01",
      name = "phase03_01_01"
    },
    {
      type = "terrorist",
      locator = "locator_phase03_01_01",
      name = "phase03_01_01"
    },
    {
      type = "gorotuki",
      locator = "locator_phase03_01_01",
      name = "phase03_01_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_phase03_01_01",
      name = "phase03_01_01"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
function Initialize()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15
  L0_10 = Fn_userCtrlAllOff
  L0_10()
  L0_10 = Fn_pcSensorOff
  L0_10(L1_11)
  L0_10 = Fn_pcSensorOff
  L0_10(L1_11)
  L0_10 = Fn_pcSensorOff
  L0_10(L1_11)
  L0_10 = Player
  L0_10 = L0_10.getPuppet
  L0_10 = L0_10(L1_11)
  L4_14 = "kit01_hail_00"
  L1_11(L2_12, L3_13, L4_14)
  L4_14 = "kit01_down_a_00"
  L1_11(L2_12, L3_13, L4_14)
  L4_14 = "kit01_damage_00"
  L1_11(L2_12, L3_13, L4_14)
  L0_10 = {L1_11}
  L1_11.name = "phase03_man_01"
  L1_11.type = "wom27"
  L1_11.node = "locator2_phase03_man_01"
  L1_11.attach = false
  L1_11.active = false
  L1_11(L2_12)
  for L4_14, L5_15 in L1_11(L2_12) do
    puppets[L5_15.name] = Fn_findNpcPuppet(L5_15.name)
    puppets[L5_15.name]:loadPoseAnimation("shock_in", "wom27_shock_in_00")
    puppets[L5_15.name]:loadPoseAnimation("shock", "wom27_shock_00")
    puppets[L5_15.name]:loadPoseAnimation("shock_out", "wom27_shock_out_00")
  end
  for L4_14, L5_15 in L1_11(L2_12) do
    Fn_disableKaiwaDemo(L5_15)
  end
  phase03_sdemo = L1_11
end
function Ingame_Photo()
  Fn_userCtrlOn()
  Fn_setNpcActive("phase03_man_01", true)
end
function Finalize()
  local L0_16, L1_17
end
function main()
  local L0_18, L1_19, L2_20, L3_21
  L0_18 = Debug
  L1_19 = L0_18
  L0_18 = L0_18.setSwitch
  L2_20 = {
    L3_21,
    "Console",
    "Script"
  }
  L3_21 = "Development"
  L3_21 = true
  L0_18(L1_19, L2_20, L3_21)
  L0_18 = Debug
  L1_19 = L0_18
  L0_18 = L0_18.setSwitch
  L2_20 = {
    L3_21,
    "Screen Console"
  }
  L3_21 = "Display"
  L3_21 = false
  L0_18(L1_19, L2_20, L3_21)
  L0_18 = Debug
  L1_19 = L0_18
  L0_18 = L0_18.setSwitch
  L2_20 = {
    L3_21,
    "File Asset Status"
  }
  L3_21 = "Display"
  L3_21 = false
  L0_18(L1_19, L2_20, L3_21)
  L0_18 = Debug
  L1_19 = L0_18
  L0_18 = L0_18.setSwitch
  L2_20 = {
    L3_21,
    "Warning Indicator"
  }
  L3_21 = "Display"
  L3_21 = false
  L0_18(L1_19, L2_20, L3_21)
  L0_18 = createSandbox2
  L1_19 = "father2"
  L0_18 = L0_18(L1_19)
  L2_20 = L0_18
  L1_19 = L0_18.setString
  L3_21 = "g_filename"
  L1_19(L2_20, L3_21, "/Game/Event2/father2.lua")
  L2_20 = L0_18
  L1_19 = L0_18.try_init
  L1_19(L2_20)
  L2_20 = L0_18
  L1_19 = L0_18.waitForReady
  L1_19(L2_20)
  L2_20 = L0_18
  L1_19 = L0_18.try_start
  L1_19(L2_20)
  while true do
    L2_20 = L0_18
    L1_19 = L0_18.sendEvent
    L3_21 = "isPcSpawned"
    L1_19 = L1_19(L2_20, L3_21)
    if not L1_19 then
      L1_19 = wait
      L1_19()
    end
  end
  L1_19 = DebugStage
  L2_20 = L1_19
  L1_19 = L1_19.createTestStage
  L1_19(L2_20)
  L1_19 = print
  L2_20 = "C\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139"
  L1_19(L2_20)
  L1_19 = loadFileAsset
  L2_20 = "evb"
  L3_21 = "evx/test_racjin99_c"
  L1_19 = L1_19(L2_20, L3_21)
  L2_20, L3_21 = nil, nil
  if L1_19 ~= nil then
    L1_19:wait()
    L2_20 = L1_19:getRoot()
    L3_21 = EventData:create("test_racjin99_c", nil, L2_20)
    L3_21:try_init()
    L3_21:waitForReady()
    L3_21:try_start()
  end
  Initialize()
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  GameDatabase:reset(ggd_GlobalSystemFlags)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  L1_19 = Fn_fadein
  L1_19()
  while true do
    L1_19 = wait
    L1_19()
  end
end
