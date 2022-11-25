import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm18_common.lua")
puppets = {}
puppet_task = {}
sm18_pc_out_task = nil
sm18_sdemo = nil
sdemo_move_task = nil
sdemo_se_hdl = nil
SM18_FAME_MAX = 1000
SM18_FAME_DAMAGE = 3
SM18_FAME_ARMOR_DAMAGE = 1000
SM18_FAME_FIRST_DAMAGE = 20
SM18_RUFFIAN_SPEED_RATE = 1
SM18_FAME_TASK_INTERVAL = 3
SM18_RUFFIAN_WAVE_TABLE = {
  {
    {
      type = "tkg05",
      group = 2,
      route = 1,
      style = "walk",
      event_no = 1,
      navi = true
    }
  },
  {
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 5,
      navi = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 5.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 6
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "run",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "run",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "run",
      delay = 1
    },
    {
      type = "tkg05",
      group = 4,
      route = 5,
      style = "walk",
      delay = 0,
      navi = true
    }
  },
  {
    {
      type = "tkg05",
      group = 3,
      route = 5,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "tkg05",
      group = 3,
      route = 6,
      style = "walk",
      delay = 1,
      navi = true
    },
    {
      type = "tkg05",
      group = 3,
      route = 7,
      style = "walk",
      delay = 2,
      navi = true
    }
  },
  {
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 1
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 1.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 2
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 2.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 3
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 5,
      navi = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "walk",
      delay = 5.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 6
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "walk",
      delay = 6.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 7
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "walk",
      delay = 7.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 8
    }
  },
  {
    {
      type = "thug_jil",
      group = 4,
      route = 1,
      style = "run",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 4,
      route = 4,
      style = "run",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 1
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 1.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 2
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 2.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      delay = 1
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 1.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      delay = 2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 2.5
    },
    {
      type = "tkg05",
      group = 1,
      route = 5,
      style = "walk",
      delay = 10,
      navi = true
    },
    {
      type = "tkg05",
      group = 1,
      route = 6,
      style = "walk",
      delay = 11,
      navi = true,
      last = true
    }
  }
}
SM18_DAMAGE_TASK_INTERVAL = 300
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    "evarea2_po_a_01"
  }
  Fn_loadEventData("evx/sm18_common", L0_0, true)
  sm18_InitGame(3, SM18_FAME_MAX, SM18_FAME_DAMAGE, SM18_RUFFIAN_SPEED_RATE, SM18_FAME_ARMOR_DAMAGE, SM18_FAME_FIRST_DAMAGE, SM18_RUFFIAN_WAVE_TABLE)
  puppets.sm18_client = Fn_findNpcPuppet("sm18_client")
  Fn_sendEventComSb("sm18_EnablePlayerSensor", false)
  sm18_sdemo = SDemo.create("sm18_sdemo")
end
function Ingame()
  Fn_setNpcActive("sm18_client", false)
  sm18_WaitInitBox()
  sm18_WaitInitRuffian()
  Fn_userCtrlAllOff()
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), false)
  Fn_missionStart()
  Fn_kaiwaDemoView("sm18_00305k")
  Fn_blackout()
  sm18_sdemo:reset()
  sm18_sdemo:set("locator2_cam_01", "locator2_aim_01", true, Vector(0, 0, 0))
  sm18_sdemo:play()
  while sm18_sdemo:isPlay() do
    wait()
  end
  sdemo_move_task = RAC_invokeMoveCharaTask2("ruffian02_0101", {
    "locator2_ruffian02_event01_pos02"
  }, {runLength = 10000, arrivedLength = 0.1})
  sdemo_se_hdl = Sound:playSEHandle("npc_suit_foot", 1, nil, Fn_findNpcPuppet("ruffian02_0101"))
  Fn_fadein()
  while sdemo_move_task:isRunning() do
    wait()
  end
  if sdemo_se_hdl ~= nil then
    Sound:stopSEHandle(sdemo_se_hdl)
    sdemo_se_hdl = nil
  end
  if sdemo_move_task ~= nil then
    sdemo_move_task:abort()
    sdemo_move_task = nil
  end
  waitSeconds(0.5)
  sm18_sdemo:play({
    {
      pos = "locator2_cam_02",
      time = 0.5,
      hashfunc = "EaseOut"
    }
  }, {
    {
      pos = "locator2_aim_02",
      time = 0.5,
      hashfunc = "EaseOut"
    }
  })
  while sm18_sdemo:isPlay() do
    wait()
  end
  Sound:setGlobalVariable("voice_type", "normal")
  sdemo_se_hdl = Sound:playSEHandle("npc_drill_idling", 1, nil, Fn_findNpcPuppet("ruffian02_0101"))
  Fn_playMotionNpc("ruffian02_0101", {"dig_00", "dig_out_00"}, true, {
    isRepeat = false,
    isStop = true,
    animBlendDuration = 0.5
  })
  Fn_playMotionNpc("ruffian02_0101", "stay", false, {animBlendDuration = 0.5})
  if sdemo_se_hdl ~= nil then
    Sound:stopSEHandle(sdemo_se_hdl)
    sdemo_se_hdl = nil
  end
  waitSeconds(0.5)
  Fn_kaiwaDemoView("sm18_00310k")
  sm18_sdemo:play({
    {
      pos = "locator2_cam_03",
      time = 1,
      hashfunc = "Linear"
    }
  }, {
    {
      pos = "locator2_aim_03",
      time = 1,
      hashfunc = "Linear"
    }
  })
  while sm18_sdemo:isPlay() do
    wait()
  end
  sm18_sdemo:stop(1)
  waitSeconds(1)
  RAC_infoView("sm18_info_04")
  waitSeconds(1)
  sm18_LoopGame(3, "locator2_pc_start_pos")
  Fn_blackout()
  Fn_userCtrlAllOff()
  sm18_FinalGame(true)
  Fn_setNpcActive("sm18_client", true)
  Area:requestBreak(findGameObject2("Node", "locator2_player_pos_01"):getWorldPos(), 15)
  Fn_resetPcPos("locator2_player_pos_01")
  Fn_fadein()
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if sdemo_se_hdl ~= nil then
    Sound:stopSEHandle(sdemo_se_hdl)
    sdemo_se_hdl = nil
  end
  if sm18_pc_out_task ~= nil then
    sm18_pc_out_task:abort()
    sm18_pc_out_task = nil
  end
  sm18_FinalGame(false)
end
