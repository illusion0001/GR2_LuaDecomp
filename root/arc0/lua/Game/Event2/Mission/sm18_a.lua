import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm18_common.lua")
puppets = {}
puppet_task = {}
sm18_pc_out_task = nil
sm18_sdemo = nil
SM18_FAME_MAX = 1000
SM18_FAME_DAMAGE = 3
SM18_FAME_ARMOR_DAMAGE = 10
SM18_FAME_FIRST_DAMAGE = 20
SM18_RUFFIAN_SPEED_RATE = 1
SM18_FAME_TASK_INTERVAL = 3
SM18_RUFFIAN_WAVE_TABLE = {
  {
    {
      type = "thug01",
      group = 2,
      route = 1,
      style = "walk",
      event_no = 1,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      event_no = 2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      event_no = 3
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
      route = 1,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
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
      route = 2,
      style = "walk",
      delay = 3,
      navi = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "walk",
      delay = 3.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 4
    },
    {
      type = "thug_jil",
      group = 1,
      route = 4,
      style = "walk",
      delay = 4.5
    }
  },
  {
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 1
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "walk",
      delay = 1.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 3,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      delay = 3.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 4
    },
    {
      type = "thug_jil",
      group = 2,
      route = 1,
      style = "walk",
      delay = 4.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 3,
      style = "walk",
      delay = 5
    }
  },
  {
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "walk",
      delay = 1
    },
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 1.5
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "walk",
      delay = 2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 4,
      style = "walk",
      delay = 2.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 5,
      navi = true,
      last = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 5.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 6
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 6.5
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "walk",
      delay = 7
    },
    {
      type = "thug_jil",
      group = 1,
      route = 3,
      style = "walk",
      delay = 7.5
    }
  }
}
SM18_DAMAGE_TASK_INTERVAL = 300
SM18_MAN_MOTION = {
  damage = "man01_damage_middle_b_00",
  run_afraid = "man01_run_afraid_00"
}
SM18_WOM_MOTION = {
  surprise_00 = "wom01_surprise_00",
  run_afraid = "wom01_run_afraid_00"
}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {L1_1}
  L1_1 = "evarea2_po_a_01"
  L1_1 = Fn_loadEventData
  L1_1("evx/sm18_common", L0_0, true)
  L1_1 = sm18_InitGame
  L1_1(1, SM18_FAME_MAX, SM18_FAME_DAMAGE, SM18_RUFFIAN_SPEED_RATE, SM18_FAME_ARMOR_DAMAGE, SM18_FAME_FIRST_DAMAGE, SM18_RUFFIAN_WAVE_TABLE)
  L1_1 = puppets
  L1_1.sm18_client = Fn_findNpcPuppet("sm18_client")
  L1_1 = {
    {
      name = "sm18_npc_01",
      type = "man36",
      node = "locator2_npc_01",
      attach = false,
      active = true
    },
    {
      name = "sm18_npc_02",
      type = "wom17",
      node = "locator2_npc_02",
      attach = false,
      active = true
    }
  }
  Fn_setupNpc(L1_1)
  for _FORV_5_, _FORV_6_ in pairs(L1_1) do
    puppets[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  Fn_loadNpcEventMotion("sm18_npc_01", SM18_MAN_MOTION)
  Fn_loadNpcEventMotion("sm18_npc_02", SM18_WOM_MOTION)
  puppets.sm18_npc_01:setUseAnimLocomotion(true)
  puppets.sm18_npc_02:setUseAnimLocomotion(true)
  Fn_sendEventComSb("sm18_EnablePlayerSensor", false)
  sm18_sdemo = SDemo.create("sm18_sdemo")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6
  L0_2 = sm18_WaitInitBox
  L0_2()
  L0_2 = sm18_WaitInitRuffian
  L0_2()
  L0_2 = Fn_userCtrlAllOff
  L0_2()
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L0_2(L1_3)
  L0_2 = Fn_blackout
  L0_2()
  L0_2 = Fn_setNpcActive
  L0_2(L1_3, L2_4)
  L0_2 = Fn_resetPcPos
  L0_2(L1_3)
  L0_2 = Player
  L0_2 = L0_2.setEnergy
  L4_6 = L3_5
  L4_6 = false
  L0_2(L1_3, L2_4, L3_5, L4_6)
  L0_2 = Fn_fadein
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L0_2(L1_3)
  L0_2 = sm18_sdemo
  L0_2 = L0_2.reset
  L0_2(L1_3)
  L0_2 = sm18_sdemo
  L0_2 = L0_2.set
  L4_6 = false
  L0_2(L1_3, L2_4, L3_5, L4_6, Vector(0, 0, 0))
  L0_2 = sm18_sdemo
  L0_2 = L0_2.play
  L0_2(L1_3)
  while true do
    L0_2 = sm18_sdemo
    L0_2 = L0_2.isPlay
    L0_2 = L0_2(L1_3)
    if L0_2 then
      L0_2 = wait
      L0_2()
    end
  end
  L0_2 = waitSeconds
  L0_2(L1_3)
  L0_2 = {}
  for L4_6 = 1, 3 do
    L0_2[L4_6] = RAC_invokeMoveCharaTask2("ruffian02_01" .. string.format("%02d", L4_6), {
      "locator2_ruffian02_event" .. string.format("%02d", L4_6) .. "_pos02"
    }, {runLength = 10000, arrivedLength = 0.1})
  end
  L4_6 = {
    {
      pos = "locator2_aim_02",
      time = 4,
      hashfunc = "EaseOut"
    }
  }
  L1_3(L2_4, L3_5, L4_6)
  L1_3(L2_4)
  L1_3(L2_4)
  L1_3(L2_4)
  L4_6 = {}
  L4_6.pos = "locator2_cam_03"
  L4_6.time = 0.5
  L4_6.hashfunc = "Linear"
  L4_6 = {
    {
      pos = "locator2_aim_03",
      time = 0.5,
      hashfunc = "Linear"
    }
  }
  L1_3(L2_4, L3_5, L4_6)
  L1_3(L2_4)
  L1_3(L2_4)
  while true do
    if L1_3 then
      L1_3()
    end
  end
  L1_3(L2_4)
  L4_6 = {}
  L4_6.pos = "locator2_cam_04"
  L4_6.time = 1
  L4_6.hashfunc = "Linear"
  L4_6 = {
    {
      pos = "locator2_aim_04",
      time = 1,
      hashfunc = "Linear"
    }
  }
  L1_3(L2_4, L3_5, L4_6)
  while true do
    if L1_3 then
      L1_3()
    end
  end
  L1_3(L2_4)
  L1_3(L2_4)
  L1_3(L2_4, L3_5)
  for L4_6 = 1, #L0_2 do
    if L0_2[L4_6] ~= nil then
      L0_2[L4_6]:abort()
      L0_2[L4_6] = nil
    end
  end
  L0_2 = waitSeconds
  L0_2(L1_3)
  L0_2 = RAC_infoView
  L0_2(L1_3)
  L0_2 = sm18_LoopGame
  L0_2(L1_3, L2_4)
  L0_2 = Fn_userCtrlAllOff
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L0_2(L1_3)
  L0_2 = Fn_blackout
  L0_2()
  L0_2 = sm18_FinalGame
  L0_2(L1_3)
  L0_2 = Fn_setNextMissionFlag
  L0_2()
  L0_2 = Fn_nextMission
  L0_2()
  L0_2 = Fn_exitSandbox
  L0_2()
end
function Finalize()
  if sm18_pc_out_task ~= nil then
    sm18_pc_out_task:abort()
    sm18_pc_out_task = nil
  end
  sm18_FinalGame(false)
  Mob:makeSituationPanic(false)
end
