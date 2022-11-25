dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm04_common.lua")
dofile("/Game/Misc/sdemo.lua")
FIELD_01 = 1
FIELD_02 = 2
FIELD_03 = 3
FIELD_04 = 4
FIELD_05 = 5
FIELD_MAX = FIELD_05
_enmgen_lumino = nil
_enmgen_white_tbl = {}
_black_field_hdl_tbl = {}
_white_field_hdl_tbl = {}
_enm_respawn_task = nil
_powerup_first_success = true
_sdemo = nil
enmgen2_lumino = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino",
      locator = "locator_lumino",
      name = "lumino",
      ai_spawn_option = "Lumino/dm04_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
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
  end
}
enmgen2_white_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w01_01",
      name = "whitenevi_01_01"
    },
    {
      type = "stalker_shine",
      locator = "locator_w01_02",
      name = "whitenevi_01_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_10, A1_11)
  end,
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
    A0_20:getSpecTable().dead_count = A0_20:getSpecTable().dead_count + 1
  end
}
enmgen2_white_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w02_01",
      name = "whitenevi_02_01"
    },
    {
      type = "stalker_shine",
      locator = "locator_w02_02",
      name = "whitenevi_02_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_22, A1_23)
  end,
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
    A0_32:getSpecTable().dead_count = A0_32:getSpecTable().dead_count + 1
  end
}
enmgen2_white_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w03_01",
      name = "whitenevi_03_01"
    },
    {
      type = "stalker_shine",
      locator = "locator_w03_02",
      name = "whitenevi_03_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_34, A1_35)
  end,
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().dead_count = A0_44:getSpecTable().dead_count + 1
  end
}
enmgen2_white_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w04_01",
      name = "whitenevi_04_01"
    },
    {
      type = "stalker_shine",
      locator = "locator_w04_02",
      name = "whitenevi_04_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_46, A1_47)
  end,
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onObjectDead = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
    A0_56:getSpecTable().dead_count = A0_56:getSpecTable().dead_count + 1
  end
}
enmgen2_white_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w05_01",
      name = "whitenevi_05_01"
    },
    {
      type = "stalker_shine",
      locator = "locator_w05_02",
      name = "whitenevi_05_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_58, A1_59)
  end,
  onUpdate = function(A0_60)
    local L1_61
  end,
  onEnter = function(A0_62)
    local L1_63
  end,
  onLeave = function(A0_64)
    local L1_65
  end,
  onObjectDead = function(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
    A0_68:getSpecTable().dead_count = A0_68:getSpecTable().dead_count + 1
  end
}
function Initialize()
  local L0_70, L1_71, L2_72, L3_73
  _enmgen_lumino = L0_70
  for L3_73 = 1, FIELD_MAX do
    _black_field_hdl_tbl[L3_73] = findGameObject2("GimmickBg", "bg2_field_b" .. string.format("%02d", L3_73))
    _white_field_hdl_tbl[L3_73] = findGameObject2("GimmickBg", "bg2_field_w" .. string.format("%02d", L3_73))
    _black_field_hdl_tbl[L3_73]:setActive(true)
    _white_field_hdl_tbl[L3_73]:setActive(false)
    _enmgen_white_tbl[L3_73] = findGameObject2("EnemyGenerator", "enmgen2_white_" .. string.format("%02d", L3_73))
  end
  _sdemo = L0_70
  L0_70(L1_71)
end
function Ingame()
  local L0_74, L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82
  L0_74 = Fn_userCtrlAllOff
  L0_74()
  L0_74 = Fn_missionStart
  L0_74()
  L0_74 = _enmgen_lumino
  L1_75 = L0_74
  L0_74 = L0_74.requestIdlingEnemy
  L2_76 = true
  L0_74(L1_75, L2_76)
  L0_74 = _enmgen_lumino
  L1_75 = L0_74
  L0_74 = L0_74.requestSpawn
  L0_74(L1_75)
  L0_74 = findGameObject2
  L1_75 = "Puppet"
  L2_76 = "lumino"
  L0_74 = L0_74(L1_75, L2_76)
  L1_75 = findGameObject2
  L2_76 = "EnemyBrain"
  L3_77 = "lumino"
  L1_75 = L1_75(L2_76, L3_77)
  L2_76 = Fn_setBgmPoint
  L3_77 = "event"
  L4_78 = "boss"
  L2_76(L3_77, L4_78)
  L2_76 = Fn_lookAtObjectWait
  L3_77 = "locator2_lumino_view"
  L2_76(L3_77)
  L2_76 = Fn_kaiwaDemoView
  L3_77 = "dm04_00205k"
  L2_76(L3_77)
  L2_76 = Fn_missionView
  L3_77 = "dm04_02000"
  L2_76(L3_77)
  L2_76 = Fn_userCtrlOn
  L2_76()
  L2_76 = _enmgen_lumino
  L3_77 = L2_76
  L2_76 = L2_76.requestIdlingEnemy
  L4_78 = false
  L2_76(L3_77, L4_78)
  L2_76 = HUD
  L3_77 = L2_76
  L2_76 = L2_76.createBossHpGauge
  L4_78 = {}
  L4_78.obj = L0_74
  L2_76 = L2_76(L3_77, L4_78)
  L4_78 = L2_76
  L3_77 = L2_76.setActive
  L3_77(L4_78, L5_79)
  L3_77 = invokeTask
  L4_78 = waitSeconds
  L3_77 = L3_77(L4_78, L5_79)
  while true do
    L4_78 = L3_77.isRunning
    L4_78 = L4_78(L5_79)
    if L4_78 then
      L4_78 = wait
      L4_78()
      L4_78 = L2_76.setHp
      L8_82 = L1_75
      L4_78(L5_79, L6_80)
      L4_78 = L1_75.isFatalAction
      L4_78 = L4_78(L5_79)
    end
    if L4_78 ~= true then
    end
  end
  L4_78 = L3_77.abort
  L4_78(L5_79)
  L3_77 = nil
  L4_78 = L1_75
  L3_77 = L1_75.isFatalAction
  L3_77 = L3_77(L4_78)
  if L3_77 == false then
    L3_77 = playSdemo01
    L3_77()
    L3_77 = invokeBossBattleEnemyRespawnTask
    L4_78 = _white_field_hdl_tbl
    L8_82 = true
    L3_77 = L3_77(L4_78, L5_79, L6_80, L7_81, L8_82)
    L4_78 = {}
    for L8_82 = 1, FIELD_MAX do
      L4_78[L8_82] = "locator2_powerup_pos_" .. string.format("%02d", L8_82)
    end
    L8_82 = _black_field_hdl_tbl
    repeat
      L6_80()
      L8_82 = L1_75.getHealth
      L8_82 = L8_82(L1_75)
      L8_82 = L8_82 / L1_75:getMaxHealth()
      L6_80(L7_81, L8_82)
    until L6_80 == true
    L6_80(L7_81)
    L6_80(L7_81)
    L3_77 = nil
  end
  L4_78 = L2_76
  L3_77 = L2_76.setActive
  L3_77(L4_78, L5_79)
  L3_77 = Fn_whiteout
  L3_77()
  L3_77 = _powerup_first_success
  if L3_77 == false then
    L3_77 = GameDatabase
    L4_78 = L3_77
    L3_77 = L3_77.set
    L3_77(L4_78, L5_79, L6_80)
  end
  L3_77 = Fn_setNextMissionFlag
  L3_77()
  L3_77 = Fn_nextMission
  L3_77()
  L3_77 = Fn_exitSandbox
  L3_77()
end
function Finalize()
  local L0_83, L1_84
end
function powerUpEventCallback(A0_85)
  if A0_85.eventType == "charge_start" then
    Fn_captionView(({
      "dm04_02002",
      "dm04_02003",
      "dm04_02004"
    })[RandI(1, #{
      "dm04_02002",
      "dm04_02003",
      "dm04_02004"
    })])
  elseif A0_85.eventType == "charge_result" then
    if A0_85.chargeResult == true then
      if _powerup_first_success == true then
        _powerup_first_success = false
        invokeTask(function()
          Fn_kaiwaDemoView("dm04_00208k")
          HUD:info("dm04_info_04", false)
        end)
      else
        Fn_captionView(({
          "dm04_02005",
          "dm04_02006",
          "dm04_02007"
        })[RandI(#{
          "dm04_02005",
          "dm04_02006",
          "dm04_02007"
        })])
      end
    else
      Fn_captionView(({
        "dm04_02008",
        "dm04_02009",
        "dm04_02010"
      })[RandI(1, #{
        "dm04_02008",
        "dm04_02009",
        "dm04_02010"
      })])
    end
  elseif A0_85.eventType == "power_down" then
    Fn_captionView(({
      "dm04_02011",
      "dm04_02012",
      "dm04_02013"
    })[RandI(1, #{
      "dm04_02011",
      "dm04_02012",
      "dm04_02013"
    })])
  end
end
function playSdemo01()
  local L0_86
  L0_86 = FIELD_03
  Fn_userCtrlAllOff()
  _enmgen_lumino:requestIdlingEnemy(true)
  Fn_blackout()
  Fn_resetPcPos("warppoint2_pc_01")
  findGameObject2("EnemyBrain", "lumino"):reset(findGameObject2("Node", "warppoint2_lumino_01"):getWorldTransform())
  Fn_getPlayer():setActive(false)
  Fn_setXiiActive(false)
  findGameObject2("Puppet", "lumino"):setActive(false)
  _enmgen_lumino:setEnemyMarker(false)
  _enmgen_white_tbl[L0_86]:requestPrepare()
  while _enmgen_white_tbl[L0_86]:isPrepared() == false do
    wait()
  end
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_01_cam_01", "locator2_sdemo_01_aim_01")
  _sdemo:play()
  Fn_fadein()
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_02",
      time = 2,
      hashfunc = "Linear"
    }
  }, nil)
  while _sdemo:isPlay() do
    wait()
  end
  _white_field_hdl_tbl[L0_86]:setActive(true)
  _black_field_hdl_tbl[L0_86]:setActive(false)
  Sound:playSE("dm04_floar_dark_to_light", 1, "", _white_field_hdl_tbl[L0_86]:getWorldPos())
  waitSeconds(2)
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_01_cam_03", "locator2_sdemo_01_aim_02")
  _sdemo:play()
  Fn_getPlayer():setActive(true)
  Fn_setXiiActive(true)
  findGameObject2("Puppet", "lumino"):setActive(true)
  _enmgen_white_tbl[L0_86]:getSpecTable().dead_count = 0
  _enmgen_white_tbl[L0_86]:requestSpawn()
  _enmgen_white_tbl[L0_86]:requestIdlingEnemy(true)
  _enmgen_white_tbl[L0_86]:setEnemyMarker(false)
  waitSeconds(4)
  _sdemo:stop(1)
  _enmgen_lumino:requestIdlingEnemy(false)
  _enmgen_white_tbl[L0_86]:requestIdlingEnemy(false)
  _enmgen_white_tbl[L0_86]:setEnemyMarker(true)
  _enmgen_lumino:setEnemyMarker(true)
  Fn_userCtrlOn()
end
function outrange_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("cro_260", 1)
    Fn_captionViewWait("dm04_02001")
  end)
end
