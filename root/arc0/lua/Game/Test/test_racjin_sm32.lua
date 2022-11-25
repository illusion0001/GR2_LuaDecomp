import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Misc/sdemo.lua")
puppets = {}
chara_table = {
  {
    name = "phase01_select_01",
    type = "man80",
    node = "locator2_phase01_select_npc_01",
    attach = false,
    pose_action = "man27_sit_00",
    pose_frame = 10
  },
  {
    name = "phase01_select_02",
    type = "man01",
    node = "locator2_phase01_select_npc_02",
    attach = false,
    pose_action = "kit01_jump_fall_00",
    pose_frame = 20
  },
  {
    name = "phase01_select_03",
    type = "man31",
    node = "locator2_phase01_select_npc_03",
    attach = false,
    pose_action = "man01_handclap_00",
    pose_frame = 30
  },
  {
    name = "phase01_select_04",
    type = "wom01",
    node = "locator2_phase01_select_npc_04",
    attach = false,
    pose_action = "man01_bye_00",
    pose_frame = 40
  },
  {
    name = "phase01_select_05",
    type = "man44",
    node = "locator2_phase01_select_npc_05",
    attach = false,
    pose_action = "chi01_talk_angry_00",
    pose_frame = 50
  },
  {
    name = "phase01_select_06",
    type = "man46",
    node = "locator2_phase01_select_npc_06",
    attach = false,
    pose_action = "man01_stretch_00",
    pose_frame = 60
  }
}
function Initialize()
  Fn_userCtrlOff()
  Fn_setupNpc(chara_table)
  for _FORV_3_ = 1, #chara_table do
    puppets[_FORV_3_] = Fn_findNpcPuppet(chara_table[_FORV_3_].name)
  end
  for _FORV_3_ = 1, #puppets do
    Fn_loadNpcEventMotion(chara_table[_FORV_3_].name, {
      pose_action = chara_table[_FORV_3_].pose_action
    })
  end
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0()
  L0_0()
  L0_0(L1_1)
  for L3_3 = 1, #L1_1 do
    invokeTask(function()
      Fn_playMotionNpc(chara_table[L3_3].name, chara_table[L3_3].pose_action, true)
      for _FORV_3_ = 1, chara_table[L3_3].pose_frame do
        wait()
      end
    end)
    break
  end
  L0_0()
  L0_0()
  while true do
    L0_0()
  end
  L0_0()
end
function main()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4 = Debug
  L1_5 = L0_4
  L0_4 = L0_4.setSwitch
  L2_6 = {
    L3_7,
    L4_8,
    "Script"
  }
  L3_7 = "Development"
  L4_8 = "Console"
  L3_7 = true
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = Debug
  L1_5 = L0_4
  L0_4 = L0_4.setSwitch
  L2_6 = {L3_7, L4_8}
  L3_7 = "Display"
  L4_8 = "Screen Console"
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = Debug
  L1_5 = L0_4
  L0_4 = L0_4.setSwitch
  L2_6 = {L3_7, L4_8}
  L3_7 = "Display"
  L4_8 = "File Asset Status"
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = Debug
  L1_5 = L0_4
  L0_4 = L0_4.setSwitch
  L2_6 = {L3_7, L4_8}
  L3_7 = "Display"
  L4_8 = "Warning Indicator"
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = createSandbox2
  L1_5 = "father2"
  L0_4 = L0_4(L1_5)
  L2_6 = L0_4
  L1_5 = L0_4.setString
  L3_7 = "g_filename"
  L4_8 = "/Game/Event2/father2.lua"
  L1_5(L2_6, L3_7, L4_8)
  L2_6 = L0_4
  L1_5 = L0_4.try_init
  L1_5(L2_6)
  L2_6 = L0_4
  L1_5 = L0_4.waitForReady
  L1_5(L2_6)
  L2_6 = L0_4
  L1_5 = L0_4.try_start
  L1_5(L2_6)
  while true do
    L2_6 = L0_4
    L1_5 = L0_4.sendEvent
    L3_7 = "isPcSpawned"
    L1_5 = L1_5(L2_6, L3_7)
    if not L1_5 then
      L1_5 = wait
      L1_5()
    end
  end
  L1_5 = GameDatabase
  L2_6 = L1_5
  L1_5 = L1_5.reset
  L3_7 = ggd
  L3_7 = L3_7.GlobalSystemFlags
  L1_5(L2_6, L3_7)
  L1_5 = GameDatabase
  L2_6 = L1_5
  L1_5 = L1_5.set
  L3_7 = ggd
  L3_7 = L3_7.GlobalSystemFlags__AreaRootTree
  L4_8 = 1
  L1_5(L2_6, L3_7, L4_8)
  L1_5 = GameDatabase
  L2_6 = L1_5
  L1_5 = L1_5.set
  L3_7 = ggd
  L3_7 = L3_7.GlobalSystemFlags__AreaDrift
  L4_8 = false
  L1_5(L2_6, L3_7, L4_8)
  L1_5 = createGameObject2
  L2_6 = "Area"
  L1_5 = L1_5(L2_6)
  L3_7 = L1_5
  L2_6 = L1_5.setName
  L4_8 = "dt_a_root"
  L2_6(L3_7, L4_8)
  L3_7 = L1_5
  L2_6 = L1_5.setDriftEnable
  L4_8 = false
  L2_6(L3_7, L4_8)
  L2_6 = loadFileAsset
  L3_7 = "evb"
  L4_8 = "evx/test_racjin_sm32"
  L2_6 = L2_6(L3_7, L4_8)
  L3_7, L4_8 = nil, nil
  if L2_6 ~= nil then
    L2_6:wait()
    L3_7 = L2_6:getRoot()
    L4_8 = EventData:create("test_racjin_sm32", nil, L3_7)
    L4_8:try_init()
    L4_8:waitForReady()
    L4_8:try_start()
  end
  Initialize()
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(function()
    Ingame()
  end)
end
