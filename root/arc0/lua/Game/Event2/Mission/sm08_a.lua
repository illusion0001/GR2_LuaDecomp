dofile("/Game/Event2/Common/EventCommon.lua")
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "pre_01",
      type = "man40",
      node = "locator2_president",
      reset = false,
      use_gravity = false
    },
    {
      name = "sol_01",
      type = "man57",
      node = "locator2_soldier_01",
      reset = false,
      use_gravity = false
    },
    {
      name = "sol_02",
      type = "man57",
      node = "locator2_soldier_02",
      reset = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm08_a_cut01")
  _sdemo_cut02 = SDemo.create("sm08_a_cut02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1, L1_2 = nil, nil
  L2_3 = GameDatabase
  L3_4 = L2_3
  L2_3 = L2_3.get
  L4_5 = ggd
  L4_5 = L4_5.EventFlags__sm08__flag01
  L2_3 = L2_3(L3_4, L4_5)
  if L2_3 ~= 1 then
    L2_3 = Fn_repeatPlayMotion
    L3_4 = "sm08_client"
    L4_5 = "talk_angry_00"
    L5_6 = {L6_7}
    L6_7 = "talk_angry_00"
    L2_3 = L2_3(L3_4, L4_5, L5_6)
    L0_1 = L2_3
    L2_3 = Fn_repeatPlayMotion
    L3_4 = "sm08_phi_01"
    L4_5 = "talk_00"
    L5_6 = {L6_7}
    L6_7 = "talk_00"
    L2_3 = L2_3(L3_4, L4_5, L5_6)
    L1_2 = L2_3
    L2_3 = GameDatabase
    L3_4 = L2_3
    L2_3 = L2_3.set
    L4_5 = ggd
    L4_5 = L4_5.EventFlags__sm08__flag01
    L5_6 = 1
    L2_3(L3_4, L4_5, L5_6)
  end
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = waitSeconds
  L3_4 = 2
  L2_3(L3_4)
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "sm08_00100k"
  L2_3(L3_4)
  if L0_1 ~= nil then
    L3_4 = L0_1
    L2_3 = L0_1.abort
    L2_3(L3_4)
  end
  if L1_2 ~= nil then
    L3_4 = L1_2
    L2_3 = L1_2.abort
    L2_3(L3_4)
  end
  L0_1, L1_2 = nil, nil
  L2_3 = Fn_playMotionNpc
  L3_4 = "sm08_client"
  L4_5 = "stay"
  L5_6 = false
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_playMotionNpc
  L3_4 = "sm08_phi_01"
  L4_5 = "stay"
  L5_6 = false
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = Fn_blackout
  L2_3()
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestBoxSpawn"
  L2_3(L3_4)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestAreaLoad01"
  L2_3(L3_4)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isShipAnimLoadingNum"
    L2_3 = L2_3(L3_4)
    if L2_3 ~= 1 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestWarpArea"
  L2_3(L3_4)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isShipWarp01"
    L2_3 = L2_3(L3_4)
    if not L2_3 then
      L2_3 = print
      L3_4 = "\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173"
      L2_3(L3_4)
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_resetPcPos
  L3_4 = "locator2_pc_ship_pos"
  L2_3(L3_4)
  L2_3 = Fn_warpNpc
  L3_4 = "sm08_client"
  L4_5 = "locator2_vog_ship_pos"
  L2_3(L3_4, L4_5)
  L2_3 = Fn_warpNpc
  L3_4 = "sm08_phi_01"
  L4_5 = "locator2_phi_ship_pos"
  L2_3(L3_4, L4_5)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestNpcOnLandingShip"
  L4_5 = _puppet_tbl
  L4_5 = L4_5.pre_01
  L5_6 = _puppet_tbl
  L5_6 = L5_6.sol_01
  L6_7 = _puppet_tbl
  L6_7 = L6_7.sol_02
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestSpawnEnemy"
  L4_5 = "enmgen2_phase01_start_f_01"
  L2_3(L3_4, L4_5)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isSpawnEnemyEnd"
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestSpawnEnemy"
  L4_5 = "enmgen2_phase01_start_c_01"
  L2_3(L3_4, L4_5)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isSpawnEnemyEnd"
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Player
  L3_4 = L2_3
  L2_3 = L2_3.setSituation
  L4_5 = Player
  L4_5 = L4_5.kSituation_Normal
  L5_6 = true
  L6_7 = 0
  L7_8 = true
  L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, false)
  L2_3 = _sdemo_cut01
  L3_4 = L2_3
  L2_3 = L2_3.set
  L4_5 = "locator2_sdemo_cam_a_01"
  L5_6 = "locator2_sdemo_aim_a_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = _sdemo_cut01
  L3_4 = L2_3
  L2_3 = L2_3.play
  L2_3(L3_4)
  L2_3 = Fn_fadein
  L2_3()
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestMoveArea"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "sm08_00200k"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_sdemo_aim_a_02"
  L2_3 = L2_3(L3_4, L4_5)
  L3_4 = L2_3
  L2_3 = L2_3.getWorldPos
  L2_3 = L2_3(L3_4)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setLookAtIk
  L5_6 = true
  L6_7 = 1
  L7_8 = L2_3
  L3_4(L4_5, L5_6, L6_7, L7_8)
  L3_4 = {}
  L3_4.degree_h = 90
  L3_4.degree_v = 90
  L3_4.in_length = 100
  L3_4.out_length = 100
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_sdemo_aim_a_02"
  L4_5 = L4_5(L5_6, L6_7)
  L3_4.target = L4_5
  L3_4.valid = true
  L3_4.watchTarget = true
  L4_5 = Fn_findNpc
  L5_6 = "sm08_client"
  L4_5 = L4_5(L5_6)
  L5_6 = Fn_findNpc
  L6_7 = "sm08_phi_01"
  L5_6 = L5_6(L6_7)
  L7_8 = L4_5
  L6_7 = L4_5.setSightParam
  L6_7(L7_8, L3_4)
  L7_8 = L5_6
  L6_7 = L5_6.setSightParam
  L6_7(L7_8, L3_4)
  L6_7 = waitSeconds
  L7_8 = 0.5
  L6_7(L7_8)
  L6_7 = Fn_sendEventComSb
  L7_8 = "requestLandingShipSettingB01"
  L6_7(L7_8)
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo_cam_a_06"
  L7_8.time = 2
  L7_8 = {
    {
      pos = "locator2_sdemo_aim_a_02",
      time = 2
    }
  }
  _sdemo_cut01:play(L6_7, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  L4_5:resetSightParam()
  L5_6:resetSightParam()
  waitSeconds(1.3)
  L6_7 = {
    {
      pos = "locator2_sdemo_president_cam",
      time = 2
    }
  }
  L7_8 = {
    {
      pos = "locator2_sdemo_president_aim",
      time = 2
    }
  }
  _sdemo_cut01:play(L6_7, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  Fn_setNpcActive("sm08_client")
  Fn_setNpcActive("sm08_phi_01")
  Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_01")
  while Fn_sendEventComSb("isSpawnFiEnd") do
    wait()
  end
  Fn_sendEventComSb("requestFiAIChange", 1, true)
  waitSeconds(0.5)
  Fn_kaiwaDemoView("sm08_00300k")
  L6_7 = {
    {
      pos = "locator2_sdemo_cam_a_02",
      time = 1.5
    }
  }
  L7_8 = {
    {
      pos = "locator2_sdemo_aim_a_02",
      time = 1.5
    }
  }
  _sdemo_cut01:play(L6_7, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  L6_7 = {
    {
      pos = "locator2_sdemo_cam_a_03",
      time = 1.5
    }
  }
  L7_8 = {
    {
      pos = "locator2_sdemo_aim_a_03",
      time = 1.5
    }
  }
  _sdemo_cut01:play(nil, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  waitSeconds(0.5)
  L6_7 = {
    {
      pos = "locator2_sdemo_cam_a_04",
      time = 1
    }
  }
  L7_8 = {
    {
      pos = "locator2_sdemo_aim_a_04",
      time = 1
    }
  }
  _sdemo_cut01:play(L6_7, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  _sdemo_cut01:stop()
  _sdemo_cut02:set("locator2_sdemo_cam_a_05", "locator2_sdemo_aim_a_05")
  _sdemo_cut02:play()
  while Fn_sendEventComSb("isLandingShipSettingB", 1) == false do
    wait()
  end
  Fn_setNpcActive("phi_01")
  Fn_kaiwaDemoView("sm08_00400k")
  Fn_sendEventComSb("requestEnemyIdling", true)
  _sdemo_cut02:stop(2)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Player:setSituation(Player.kSituation_InCombat, true, 3, true, false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
