L0_0 = import
L0_0("Debug")
L0_0 = dofile
L0_0("/Game/Event2/Mission/rac_common.lua")
L0_0 = dofile
L0_0("/Game/Event2/Common/EventCommon.lua")
L0_0 = {}
L0_0.sad = "man01_talk_sad_02"
L0_0.angry_m = "man01_talk_angry_02"
L0_0.angry_w = "wom01_reply_unknown_00"
puppets = {}
function Initialize()
  local L0_1
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = puppets
  L0_1.man73 = Fn_findNpcPuppet("man73")
  L0_1 = Fn_setNpcActive
  L0_1("man73", false)
  L0_1 = {
    {
      name = "npc_01",
      type = "man73",
      node = "locator2_npc_01",
      attach = false
    },
    {
      name = "npc_02",
      type = "man83",
      node = "locator2_npc_02",
      attach = false
    },
    {
      name = "npc_03",
      type = "wom46",
      node = "locator2_npc_03",
      attach = false
    },
    {
      name = "npc_04",
      type = "chi20",
      node = "locator2_npc_04",
      attach = false
    },
    {
      name = "npc_05",
      type = "man02",
      node = "locator2_npc_05",
      attach = false
    }
  }
  Fn_setupNpc(L0_1)
  for _FORV_4_, _FORV_5_ in pairs(L0_1) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    Fn_loadNpcEventMotion(_FORV_5_.name, L0_0)
  end
end
function Ingame()
  local L0_2
  L0_2 = Fn_userCtrlAllOff
  L0_2()
  L0_2 = {}
  L0_2.targetOffset = Vector(0, 1.5, 0)
  L0_2.watchTarget = true
  RAC_setSightParam("npc_01", "locator2_npc_04", L0_2)
  RAC_setSightParam("npc_02", "locator2_npc_01", L0_2)
  RAC_setSightParam("npc_03", "locator2_npc_01", L0_2)
  RAC_setSightParam("npc_04", "locator2_npc_01", L0_2)
  RAC_setSightParam("npc_05", "locator2_npc_01", L0_2)
  Fn_missionStart()
  Fn_kaiwaDemoView("sm28_00600k")
  Fn_findNpc("npc_02"):resetSightParam()
  Fn_findNpc("npc_03"):resetSightParam()
  Fn_findNpc("npc_04"):resetSightParam()
  Fn_findNpc("npc_05"):resetSightParam()
  Fn_playMotionNpc("npc_01", L0_0.sad, false, {isStop = true, animBlendDuration = 0.3})
  Sound:playSEHandle("m31_921", 1, "", puppets.npc_05)
  Sound:playSEHandle("w22_921", 1, "", puppets.npc_04)
  RAC_invokeMoveCharaTask("npc_05", "locator2_npc_05_move", {runLength = 10000})
  RAC_invokeMoveCharaTask("npc_04", "locator2_npc_04_move", {runLength = 10000})
  waitSeconds(0.5)
  invokeTask(function()
    Sound:playSEHandle("m31_921", 1, "", puppets.npc_02)
    Fn_playMotionNpc("npc_02", L0_0.angry_m, true, {isStop = true, animBlendDuration = 0.3})
    RAC_invokeMoveCharaTask("npc_02", "locator2_npc_02_move", {runLength = 10000})
  end)
  waitSeconds(1)
  invokeTask(function()
    Sound:playSEHandle("w17_921", 1, "", puppets.npc_03)
    Fn_playMotionNpc("npc_03", L0_0.angry_w, true, {isStop = true, animBlendDuration = 0.3})
    RAC_invokeMoveCharaTask("npc_03", "locator2_npc_03_move", {runLength = 10000})
  end)
  waitSeconds(7)
  Fn_kaiwaDemoView("sm28_00610k")
  Fn_blackout()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
