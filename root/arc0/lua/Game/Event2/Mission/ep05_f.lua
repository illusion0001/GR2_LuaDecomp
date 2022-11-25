dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
NPC_NUM_MAX = 7
_alive_enemy_cnt = 10
_puppet_tbl = {}
_event_motion_table = {
  label01 = "kit01_touch_00"
}
enmgen2_gorotsuki_d_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki06",
      locator = "locator_enm_gorotuki_d_01_01",
      name = "enm_gorotuki_d_01_01",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man42_ab"
    },
    {
      type = "gorotuki07",
      locator = "locator_enm_gorotuki_d_01_02",
      name = "enm_gorotuki_d_01_02",
      ai_spawn_option = "Gorotuki/pipe"
    },
    {
      type = "gorotuki08",
      locator = "locator_enm_gorotuki_d_01_03",
      name = "enm_gorotuki_d_01_03",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man44_ab"
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
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    _alive_enemy_cnt = _alive_enemy_cnt - 1
    print("_alive_enemy_cnt = " .. _alive_enemy_cnt)
  end
}
function Initialize()
  local L0_12
  L0_12 = Fn_userCtrlOff
  L0_12()
  L0_12 = Fn_pcSensorOff
  L0_12("pccubesensor2_catwarp_warning_f_01")
  L0_12 = Fn_pcSensorOff
  L0_12("pccubesensor2_catwarp_area_f_01")
  L0_12 = Fn_pcSensorOff
  L0_12("pccubesensor2_catwarp_navi_kill_f_01")
  L0_12 = {
    {
      name = "demo_gorotsuki01",
      type = "thug06",
      node = "locator2_demo_gorotsuki01_f_01",
      attach = false
    },
    {
      name = "demo_gorotsuki02",
      type = "thug08",
      node = "locator2_demo_gorotsuki02_f_01",
      attach = false
    },
    {
      name = "demo_gorotsuki03",
      type = "thug08",
      node = "locator2_demo_gorotsuki03_f_01",
      color_variation = 2,
      hair_variation = 1,
      attach = false
    },
    {
      name = "demo_gorotsuki04",
      type = "thug07",
      node = "locator2_demo_gorotsuki04_f_01",
      color_variation = 1,
      attach = false
    },
    {
      name = "demo_gorotsuki05",
      type = "thug08",
      node = "locator2_demo_gorotsuki05_f_01",
      color_variation = 1,
      hair_variation = 1,
      attach = false
    },
    {
      name = "demo_gorotsuki06",
      type = "thug06",
      node = "locator2_demo_gorotsuki06_f_01",
      color_variation = 2,
      hair_variation = 1,
      attach = false
    },
    {
      name = "demo_gorotsuki07",
      type = "thug07",
      node = "locator2_demo_gorotsuki07_f_01",
      color_variation = 2,
      hair_variation = 1,
      attach = false
    }
  }
  Fn_setupNpc(L0_12)
  for _FORV_4_, _FORV_5_ in pairs(L0_12) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("cut01")
  Fn_loadPlayerMotion(_event_motion_table)
end
function Ingame()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22
  L0_13 = Fn_setCatWarp
  L1_14 = false
  L0_13(L1_14)
  L0_13 = Fn_pcSensorOn
  L1_14 = "pccubesensor2_catwarp_warning_f_01"
  L0_13(L1_14)
  L0_13 = Fn_pcSensorOn
  L1_14 = "pccubesensor2_catwarp_area_f_01"
  L0_13(L1_14)
  L0_13 = Fn_pcSensorOn
  L1_14 = "pccubesensor2_catwarp_navi_kill_f_01"
  L0_13(L1_14)
  L0_13 = Fn_setCatWarpCheckPoint
  L1_14 = "locator2_pc_start_pos"
  L0_13(L1_14)
  L0_13 = Fn_resetPcPos
  L1_14 = "locator2_pc_start_pos"
  L0_13(L1_14)
  L0_13 = findGameObject2
  L1_14 = "EnemyGenerator"
  L0_13 = L0_13(L1_14, L2_15)
  L1_14 = L0_13.setEnemyMarker
  L1_14(L2_15, L3_16)
  L1_14 = L0_13.requestIdlingEnemy
  L1_14(L2_15, L3_16)
  L1_14 = Fn_setBgmPoint
  L1_14(L2_15)
  L1_14 = {}
  for L5_18 = 1, NPC_NUM_MAX do
    L6_19 = Fn_findNpc
    L7_20 = "demo_gorotsuki"
    L8_21 = string
    L8_21 = L8_21.format
    L8_21 = L8_21(L9_22, L5_18)
    L7_20 = L7_20 .. L8_21
    L6_19 = L6_19(L7_20)
    L1_14[L5_18] = L6_19
    L6_19 = Fn_setGrabNpc
    L7_20 = "demo_gorotsuki"
    L8_21 = string
    L8_21 = L8_21.format
    L8_21 = L8_21(L9_22, L5_18)
    L7_20 = L7_20 .. L8_21
    L8_21 = false
    L6_19(L7_20, L8_21, L9_22)
    L6_19 = L1_14[L5_18]
    L7_20 = L6_19
    L6_19 = L6_19.setIgnoreGrabThrow
    L8_21 = false
    L6_19(L7_20, L8_21)
  end
  L2_15(L3_16)
  L5_18 = "talk_00"
  L6_19 = {L7_20}
  L7_20 = "stay"
  L7_20 = 5
  L8_21 = 5
  L2_15[1] = L3_16
  L5_18 = "talk_01"
  L6_19 = {L7_20}
  L7_20 = "reply_yes"
  L7_20 = 5
  L8_21 = 5
  L2_15[2] = L3_16
  L4_17.pos = "locator2_demo_trap_cam_01a"
  L4_17.time = 5.4
  L4_17.hashfunc = "Linear"
  L5_18 = {}
  L5_18.pos = "locator2_demo_trap_cam_01b"
  L5_18.time = 0.3
  L5_18 = L4_17
  L6_19 = "locator2_demo_trap_cam_01"
  L7_20 = "locator2_demo_trap_aim_01"
  L8_21 = false
  L4_17(L5_18, L6_19, L7_20, L8_21)
  L5_18 = L4_17
  L4_17(L5_18)
  L5_18 = L4_17
  L6_19 = L3_16
  L7_20 = nil
  L4_17(L5_18, L6_19, L7_20)
  L4_17()
  L5_18 = L4_17
  L6_19 = "lo_a_root_battle"
  L4_17(L5_18, L6_19)
  L4_17()
  L5_18 = "ep05_03001"
  L4_17(L5_18)
  L5_18 = Mv_safeTaskAbort
  L6_19 = L2_15[2]
  L5_18 = L5_18(L6_19)
  L2_15[2] = L5_18
  L5_18 = invokeTask
  function L6_19()
    Fn_turnNpc("demo_gorotsuki02", "locator2_demo_trap_cam_01")
    Sound:playSE("m12_001")
    Fn_captionViewWait("ep05_03002")
    L4_17 = true
    Fn_playMotionNpc("demo_gorotsuki02", "stay", false)
  end
  L5_18(L6_19)
  L5_18 = Mv_safeTaskAbort
  L6_19 = L2_15[1]
  L5_18 = L5_18(L6_19)
  L2_15[1] = L5_18
  L5_18 = waitSeconds
  L6_19 = 0.7
  L5_18(L6_19)
  L5_18 = invokeTask
  function L6_19()
    Fn_turnNpc("demo_gorotsuki01", "locator2_demo_trap_cam_01")
    Sound:playSE("m11_001")
    Fn_playMotionNpc("demo_gorotsuki01", "stay_01", false)
  end
  L5_18(L6_19)
  L5_18 = invokeTask
  function L6_19()
    local L0_23, L1_24
    L0_23 = waitSeconds
    L1_24 = 1
    L0_23(L1_24)
    L0_23 = Fn_moveNpc
    L1_24 = "demo_gorotsuki03"
    L0_23 = L0_23(L1_24, {
      "locator2_demo_gorotsuki03_move_01"
    }, {arrivedLength = 0})
    L1_24 = Fn_moveNpc
    L1_24 = L1_24("demo_gorotsuki04", {
      "locator2_demo_gorotsuki04_move_01"
    }, {arrivedLength = 0})
    invokeTask(function()
      while L0_23:isRunning() do
        wait()
      end
      wait()
      L0_23 = Mv_safeTaskAbort(L0_23)
      Fn_turnNpc("demo_gorotsuki03")
      Fn_playMotionNpc("demo_gorotsuki03", "talk_sad_02", false)
    end)
    invokeTask(function()
      while L1_24:isRunning() do
        wait()
      end
      wait()
      L1_24 = Mv_safeTaskAbort(L1_24)
      Fn_turnNpc("demo_gorotsuki04")
      Fn_playMotionNpc("demo_gorotsuki04", "stay_02", false)
    end)
  end
  L5_18(L6_19)
  while L4_17 == false do
    L5_18 = wait
    L5_18()
  end
  L5_18 = waitSeconds
  L6_19 = 0.2
  L5_18(L6_19)
  L5_18 = 1
  L6_19 = {L7_20}
  L7_20 = {}
  L7_20.pos = "locator2_demo_trap_cam_02"
  L7_20.time = L5_18
  L7_20 = {L8_21}
  L8_21 = {}
  L8_21.pos = "locator2_demo_trap_aim_02"
  L8_21.time = L5_18
  L8_21 = _sdemo_cut01
  L8_21 = L8_21.play
  L8_21(L9_22, L6_19, L7_20)
  L8_21 = Fn_playMotionNpc
  L8_21(L9_22, "sit_00", false)
  while true do
    L8_21 = _sdemo_cut01
    L8_21 = L8_21.isPlay
    L8_21 = L8_21(L9_22)
    if L8_21 then
      L8_21 = wait
      L8_21()
    end
  end
  L8_21 = Fn_moveNpc
  L8_21 = L8_21(L9_22, {
    "locator2_demo_gorotsuki05_move_01"
  }, {runLength = -1, arrivedLength = 0})
  move_05_task = L8_21
  L8_21 = nil
  L9_22(function()
    waitSeconds(0.3)
    L8_21 = Fn_moveNpc("demo_gorotsuki06", {
      "locator2_demo_gorotsuki06_move_01"
    }, {runLength = -1, arrivedLength = 0})
  end)
  L9_22(_event_motion_table.label01, 0)
  L9_22()
  L9_22("ep05_03003")
  while true do
    if L9_22 then
      L9_22()
    end
  end
  L9_22("ep05_00140k")
  for _FORV_12_ = 1, NPC_NUM_MAX do
    if L1_14[_FORV_12_]:isRunning() then
      L1_14[_FORV_12_]:changeEnemy()
      L1_14[_FORV_12_]:setEnemyGenerator(L0_13)
      L1_14[_FORV_12_]:setEnemyGeneratorBattle(L0_13)
    end
  end
  L9_22(L9_22)
  L9_22(L9_22, true)
  L9_22("ep05_03000")
  print("_alive_enemy_cnt = " .. L9_22)
  L0_13:setEnemyMarker(true)
  L0_13:requestIdlingEnemy(false)
  Fn_userCtrlOn()
  while 0 < _alive_enemy_cnt do
    wait()
  end
  waitSeconds(1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_naviKill()
  _puppet_tbl = {}
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
  end
  Area:setForceSceneParams()
end
function pccubesensor2_catwarp_warning_f_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
    Fn_captionViewWait("ep05_09001")
  end)
end
function pccubesensor2_catwarp_area_f_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_f_01_OnEnter()
  Fn_naviKill()
end
