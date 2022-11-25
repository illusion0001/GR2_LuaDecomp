import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm18_common.lua")
puppets = {}
puppet_task = {}
sm18_pc_out_task = nil
SM18_FAME_MAX = 1000
SM18_FAME_DAMAGE = 3
SM18_FAME_ARMOR_DAMAGE = 10
SM18_FAME_FIRST_DAMAGE = 20
SM18_RUFFIAN_SPEED_RATE = 1
SM18_FAME_TASK_INTERVAL = 5
SM18_RUFFIAN_WAVE_TABLE = {
  {},
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
      route = 1,
      style = "run",
      delay = 0.5
    },
    {
      type = "thug_jil",
      group = 4,
      route = 1,
      style = "run",
      delay = 1
    }
  },
  {
    {
      type = "thug_jil",
      group = 3,
      route = 1,
      style = "walk",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 0.1
    },
    {
      type = "thug_jil",
      group = 3,
      route = 3,
      style = "walk",
      delay = 0.2
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 0.3
    },
    {
      type = "thug_jil",
      group = 3,
      route = 1,
      style = "walk",
      delay = 3,
      navi = true
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 3.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 3,
      style = "walk",
      delay = 4
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 4.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 1,
      style = "walk",
      delay = 5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 2,
      style = "walk",
      delay = 5.5
    },
    {
      type = "thug_jil",
      group = 3,
      route = 3,
      style = "walk",
      delay = 6
    },
    {
      type = "thug_jil",
      group = 3,
      route = 4,
      style = "walk",
      delay = 6.5
    }
  },
  {
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 0,
      navi = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 0.1
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 0.2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "run",
      delay = 15,
      navi = true
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "run",
      delay = 15.1
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "run",
      delay = 15.2
    },
    {
      type = "thug_jil",
      group = 2,
      route = 2,
      style = "run",
      delay = 15.3
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "run",
      delay = 30,
      navi = true,
      last = true
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "run",
      delay = 30.1
    },
    {
      type = "thug_jil",
      group = 1,
      route = 2,
      style = "run",
      delay = 30.2
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 30.3
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 30.4
    },
    {
      type = "thug_jil",
      group = 1,
      route = 1,
      style = "run",
      delay = 30.5
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
  sm18_InitGame(2, SM18_FAME_MAX, SM18_FAME_DAMAGE, SM18_RUFFIAN_SPEED_RATE, SM18_FAME_ARMOR_DAMAGE, SM18_FAME_FIRST_DAMAGE, SM18_RUFFIAN_WAVE_TABLE)
  puppets.sm18_client = Fn_findNpcPuppet("sm18_client")
  Fn_sendEventComSb("sm18_EnablePlayerSensor", false)
end
function Ingame()
  Fn_setNpcActive("sm18_client", false)
  sm18_WaitInitBox()
  sm18_WaitInitRuffian()
  Fn_userCtrlAllOff()
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), false)
  Fn_missionStart()
  Fn_kaiwaDemoView("sm18_00220k")
  sm18_LoopGame(2, "locator2_pc_start_pos")
  Fn_userCtrlAllOff()
  Fn_kaiwaDemoView("sm18_00300k")
  Fn_blackout()
  sm18_FinalGame(true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if sm18_pc_out_task ~= nil then
    sm18_pc_out_task:abort()
    sm18_pc_out_task = nil
  end
  sm18_FinalGame(false)
end
