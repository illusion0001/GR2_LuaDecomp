dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_crow_puppet = nil
_litho_theme = nil
_enemy_cnt = 0
enmgen2_battle_b_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_strong",
      locator = "locator2_b4_01",
      name = "specialb41"
    },
    {
      type = "stalker_strong",
      locator = "locator2_b4_02",
      name = "specialb42"
    },
    {
      type = "stalker_strong",
      locator = "locator2_b4_03",
      name = "specialb43"
    },
    {
      type = "imp_strong",
      locator = "locator2_b4_06",
      name = "specialb46"
    },
    {
      type = "imp_strong",
      locator = "locator2_b4_07",
      name = "specialb47"
    },
    {
      type = "imp_strong",
      locator = "locator2_b4_08",
      name = "specialb48"
    },
    {
      type = "parasite_nest",
      locator = "locator2_b4_10",
      name = "specialb50"
    },
    {
      type = "parasite_nest",
      locator = "locator2_b4_11",
      name = "specialb51"
    }
  },
  addParasiteSpawnSetName0 = "spawnSetParasite0",
  spawnSetParasite0 = {
    {
      type = "parasite",
      locator = "locator2_b4_11",
      name = "call_parasite0_01"
    },
    {
      type = "parasite",
      locator = "locator2_b4_10",
      name = "call_parasite0_02"
    }
  },
  addParasiteSpawnSetName1 = "spawnSetParasite1",
  spawnSetParasite1 = {
    {
      type = "parasite",
      locator = "locator2_b4_11",
      name = "call_parasite0_01"
    },
    {
      type = "parasite",
      locator = "locator2_b4_10",
      name = "call_parasite0_02"
    }
  },
  addParasiteSpawnSetName2 = "spawnSetParasite2",
  spawnSetParasite2 = {
    {
      type = "parasite",
      locator = "locator2_b4_11",
      name = "call_parasite0_01"
    },
    {
      type = "parasite",
      locator = "locator2_b4_10",
      name = "call_parasite0_02"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"specialb51"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end,
  onUpdate = function(A0_4)
    local L1_5
  end,
  onEnter = function(A0_6)
    local L1_7
  end,
  onLeave = function(A0_8)
    local L1_9
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum - 1
    if A0_10:getSpecTable().enemyDeadNum < 0 then
      A0_10:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
function Initialize()
  Fn_loadEventData("evx/ep21_beans", "evarea2_co_a_01", true)
  move_area_beans()
end
function Ingame()
  local L0_21, L1_22
  L0_21 = Fn_sendEventComSb
  L1_22 = "stop_stormse_01"
  L0_21(L1_22)
  L0_21 = Fn_createEffect
  L1_22 = "gravity"
  L0_21 = L0_21(L1_22, "ef_ev_dscbk_01", "pccubesensor2_nekostorm_02", true)
  L1_22 = GravPowConsumDown
  L1_22()
  L1_22 = Fn_setCatWarpCheckPoint
  L1_22("locator2_reset_02")
  while true do
    while true do
      L1_22 = _crow_puppet
      if L1_22 == nil then
        L1_22 = Fn_sendEventComSb
        L1_22 = L1_22("crow_name")
        _crow_puppet = L1_22
        L1_22 = wait
        L1_22()
      end
    end
  end
  while true do
    while true do
      L1_22 = _brain_crow
      if L1_22 == nil then
        L1_22 = _crow_puppet
        L1_22 = L1_22.getBrain
        L1_22 = L1_22(L1_22)
        _brain_crow = L1_22
        L1_22 = wait
        L1_22()
      end
    end
  end
  while true do
    L1_22 = _brain_crow
    L1_22 = L1_22.isRunning
    L1_22 = L1_22(L1_22)
    if not L1_22 then
      L1_22 = wait
      L1_22()
    end
  end
  L1_22 = Fn_userCtrlOn
  L1_22()
  L1_22 = Fn_missionStart
  L1_22()
  repeat
    L1_22 = wait
    L1_22()
    L1_22 = Fn_sendEventComSb
    L1_22 = L1_22("isLithographStart")
  until L1_22
  L1_22 = Fn_sendEventComSb
  L1_22("setFirstHalfProcessEnd")
  repeat
    L1_22 = wait
    L1_22()
    L1_22 = Fn_sendEventComSb
    L1_22 = L1_22("isFirstHalfProcessEnd")
  until L1_22
  L1_22 = _brain_crow
  L1_22 = L1_22.setIdling
  L1_22(L1_22, false)
  L1_22 = Fn_missionView
  L1_22("ep21_09001", nil, nil, true)
  L1_22 = findGameObject2
  L1_22 = L1_22("EnemyGenerator", "enmgen2_b_04")
  if L1_22 ~= nil then
    L1_22:requestSpawn()
  end
  waitSeconds(1)
  invokeTask(function()
    repeat
      repeat
        print(L1_22:getEnemyCount())
        wait()
      until L1_22:getEnemyCount() <= 0
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end)
  repeat
    if _litho_theme == false then
    end
    wait()
  until _litho_theme
  Fn_sendEventComSb("crowVisible")
  Fn_sendEventComSb("stop_stormse_02")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("crowVisible")
  Fn_captionViewWait("ep21_04001")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_23, L1_24
end
function navi_on()
  local L0_25, L1_26
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_nekostorm_02_OnEnter(A0_27)
  invokeTask(function()
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
