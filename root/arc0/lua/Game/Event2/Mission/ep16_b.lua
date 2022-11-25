dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
ep16_sdemo = nil
function Initialize()
  local L0_0
  _npc_kali = "_kali_01"
  _npc_sdemo_stingray01 = "sdemo_stingray01"
  _npc_sdemo_terrorist01 = "sdemo_terrorist01"
  _npc_sdemo_stingray02 = "sdemo_stingray02"
  _npc_sdemo_terrorist02 = "sdemo_terrorist02"
  _npc_sdemo_stingray03 = "sdemo_stingray03"
  _npc_sdemo_terrorist03 = "sdemo_terrorist03"
  L0_0 = puppets
  L0_0.ep16_Adicca = Fn_findNpcPuppet("ep16_Adicca")
  L0_0 = {
    {
      name = _npc_kali,
      type = "cow01",
      node = "locator2_kali_pos",
      attach = false,
      active = false
    },
    {
      name = _npc_sdemo_stingray01,
      type = "mcstg",
      node = "locator2_sdemo_stingray01_pos",
      attach = false,
      active = false,
      use_gravity = false
    },
    {
      name = _npc_sdemo_terrorist01,
      type = "man61",
      node = "locator2_sdemo_terrorist01_pos",
      attach = false,
      active = false,
      use_gravity = false
    },
    {
      name = _npc_sdemo_stingray02,
      type = "mcstg",
      node = "locator2_sdemo_stingray02_pos",
      attach = false,
      active = false,
      use_gravity = false
    },
    {
      name = _npc_sdemo_terrorist02,
      type = "man61",
      node = "locator2_sdemo_terrorist02_pos",
      attach = false,
      active = false,
      use_gravity = false
    },
    {
      name = _npc_sdemo_stingray03,
      type = "mcstg",
      node = "locator2_sdemo_stingray03_pos",
      attach = false,
      active = false,
      use_gravity = false
    },
    {
      name = _npc_sdemo_terrorist03,
      type = "man61",
      node = "locator2_sdemo_terrorist03_pos",
      attach = false,
      active = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  ep16_sdemo = SDemo.create("ep16_sdemo")
end
function Ingame()
  local L0_1, L1_2
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSection"
  L0_1(L1_2, "b1")
  L0_1 = waitComNextPhase
  L1_2 = "b1"
  L0_1(L1_2)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setStay
  L0_1(L1_2, false)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_missionStart
  function L1_2()
    Fn_sendEventComSb("start_skyChase")
  end
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSection"
  L0_1(L1_2, "b2")
  L0_1 = waitComNextPhase
  L1_2 = "b2"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSection"
  L0_1(L1_2, "b4")
  L0_1 = waitComNextPhase
  L1_2 = "b4"
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView2
  L1_2 = "ep16_00210k"
  L0_1(L1_2, function()
    Fn_sendEventComSb("requestSection", "b5")
    Fn_resetPcPos("locator2_sdemo1_pc_01")
    Fn_setNpcActive(_npc_kali, true)
    Fn_playMotionNpc(_npc_kali, "stay_01", false)
    Fn_setNpcActive(_npc_sdemo_stingray01, true)
    Fn_setNpcActive(_npc_sdemo_stingray02, true)
    Fn_setNpcActive(_npc_sdemo_stingray03, true)
    Fn_setNpcActive(_npc_sdemo_terrorist01, true)
    Fn_setNpcActive(_npc_sdemo_terrorist02, true)
    Fn_setNpcActive(_npc_sdemo_terrorist03, true)
    Fn_findNpc(_npc_sdemo_stingray01):setPilots({
      {
        pilot = puppets[_npc_sdemo_terrorist01],
        attach = "loc_driver"
      }
    })
    Fn_findNpc(_npc_sdemo_stingray02):setPilots({
      {
        pilot = puppets[_npc_sdemo_terrorist02],
        attach = "loc_driver"
      }
    })
    Fn_findNpc(_npc_sdemo_stingray03):setPilots({
      {
        pilot = puppets[_npc_sdemo_terrorist03],
        attach = "loc_driver"
      }
    })
    ep16_sdemo:reset()
    ep16_sdemo:set("locator2_sdemo2_camera_01", "locator2_sdemo2_target_01", false)
    ep16_sdemo:play()
  end, true)
  L0_1 = Sound
  L1_2 = L0_1
  L0_1 = L0_1.playSE
  L0_1(L1_2, "m39_011", 1, "")
  L0_1 = Fn_captionView
  L1_2 = "ep16_01000"
  L0_1(L1_2)
  L0_1 = invokeTask
  function L1_2()
    local L0_3, L1_4, L2_5, L3_6, L4_7
    L0_3 = {}
    L0_3.anim_walk = "walk"
    L0_3.anim_run = "run"
    L0_3.anim_walk_speed = 1
    L0_3.anim_run_speed = 1
    L0_3.anim_speed_over = false
    L0_3.arrivedLength = 0
    L0_3.runLength = -1
    L0_3.recast = true
    L1_4 = {L2_5, L3_6}
    L2_5 = {}
    L2_5.pos = "locator2_sdemo2_kali_01"
    L3_6 = moveOption2
    L2_5.opt = L3_6
    L3_6 = {}
    L3_6.pos = "locator2_sdemo2_kali_02"
    L4_7 = moveOption2
    L3_6.opt = L4_7
    L2_5 = {}
    L2_5.anim_in = "jump"
    L2_5.anim_lp = "fall"
    L2_5.anim_out = "landing"
    L2_5.anim_stay = "stay_01"
    L2_5.height = 2
    L3_6 = {}
    L3_6.anim_in = "jump"
    L3_6.anim_lp = "fall"
    L3_6.anim_out = "landing"
    L3_6.anim_stay = "stay_01"
    L3_6.height = 5
    L4_7 = {}
    L4_7.anim_in = "jump"
    L4_7.anim_lp = "fall"
    L4_7.anim_out = "landing"
    L4_7.anim_stay = "stay_01"
    L4_7.height = 8
    Fn_findNpc(_npc_kali):setTurnParam(90)
    Fn_findNpc(_npc_kali):setMoveOption(L0_3)
    Fn_findNpc(_npc_kali):move(L1_4)
    waitNpcMoveEnd(_npc_kali)
    Fn_findNpc(_npc_kali):jump("locator2_sdemo2_kali_03", L3_6)
    waitNpcJumpEnd(_npc_kali)
    Fn_findNpc(_npc_kali):jump("locator2_sdemo2_kali_04", L4_7)
    waitNpcJumpEnd(_npc_kali)
    waitSeconds(0.5)
    Fn_disappearNpc(_npc_kali, 0)
  end
  L0_1(L1_2)
  L0_1 = invokeTask
  function L1_2()
    local L0_8, L1_9, L2_10
    L0_8 = {
      L1_9,
      L2_10,
      {
        pos = "locator2_sdemo2_stingray01_03",
        attr = "fly"
      }
    }
    L1_9 = {}
    L1_9.pos = "locator2_sdemo2_stingray01_01"
    L1_9.attr = "fly"
    L2_10 = {}
    L2_10.pos = "locator2_sdemo2_stingray01_02"
    L2_10.attr = "fly"
    L1_9 = {
      L2_10,
      {
        pos = "locator2_sdemo2_stingray02_02",
        attr = "fly"
      },
      {
        pos = "locator2_sdemo2_stingray02_03",
        attr = "fly"
      }
    }
    L2_10 = {}
    L2_10.pos = "locator2_sdemo2_stingray02_01"
    L2_10.attr = "fly"
    L2_10 = {
      {
        pos = "locator2_sdemo2_stingray03_01",
        attr = "fly"
      },
      {
        pos = "locator2_sdemo2_stingray03_02",
        attr = "fly"
      },
      {
        pos = "locator2_sdemo2_stingray03_03",
        attr = "fly"
      }
    }
    waitSeconds(5)
    flyNpc(_npc_sdemo_stingray01, L0_8, {moveSpeed = 26})
    flyNpc(_npc_sdemo_stingray02, L1_9, {moveSpeed = 26})
    flyNpc(_npc_sdemo_stingray03, L2_10, {moveSpeed = 26})
    stingray01_se_handle = Sound:playSEHandle("ene_stingray_move", 1, "", _npc_sdemo_stingray01)
    stingray02_se_handle = Sound:playSEHandle("ene_stingray_move", 1, "", _npc_sdemo_stingray02)
    stingray03_se_handle = Sound:playSEHandle("ene_stingray_move", 1, "", _npc_sdemo_stingray03)
  end
  L0_1(L1_2)
  L0_1 = {L1_2}
  L1_2 = {}
  L1_2.pos = "locator2_sdemo2_camera_02"
  L1_2.time = 8
  L1_2.hashfunc = "EaseInOut"
  L1_2 = {
    {
      pos = "locator2_sdemo2_target_02",
      time = 2
    },
    {
      pos = "locator2_sdemo2_target_03",
      time = 3
    }
  }
  ep16_sdemo:play(L0_1, L1_2)
  while ep16_sdemo:isPlay() do
    wait()
  end
  Fn_resetPcPos("locator2_sdemo2_pc_01")
  waitSeconds(2)
  ep16_sdemo:stop(1)
  Sound:stopSEHandle(stingray01_se_handle)
  Sound:stopSEHandle(stingray02_se_handle)
  Sound:stopSEHandle(stingray03_se_handle)
  stingray01_se_handle = nil
  stingray02_se_handle = nil
  stingray03_se_handle = nil
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if stingray01_se_handle ~= nil then
    Sound:stopSEHandle(stingray01_se_handle)
    stingray01_se_handle = nil
  end
  if stingray02_se_handle ~= nil then
    Sound:stopSEHandle(stingray02_se_handle)
    stingray02_se_handle = nil
  end
  if stingray03_se_handle ~= nil then
    Sound:stopSEHandle(stingray03_se_handle)
    stingray03_se_handle = nil
  end
end
