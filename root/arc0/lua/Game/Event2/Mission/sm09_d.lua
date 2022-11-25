dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm09_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
dofile("/Game/Misc/pdemo.lua")
import("Vehicle")
_puppet_tbl = {}
_soldierName = {}
_guardName = {}
_soldierInstance = {}
_guardInstance = {}
_npcTable = {}
_soldierTable = {}
_mechsky = {}
_enmgen = {}
_sdemo_end = false
PHOTO_SPOT_RANGE = 20
_is_photo_spot_change = false
_is_photo_spot_find = false
_is_photo_spot_number = 0
_is_setup_photo = false
_pdemo_change_npc = false
TRADE_START_TIME = 500
TRADE_END_TIME = 700
_trade_timeout = false
_photo_hdl = nil
_polydemo = nil
_TRADE_PHOTO_POINT_FOUND_TIME = 60
_viewPointTask = nil
enmgen2_mechsky_d_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_01",
      name = "mechsky_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_01",
      name = "mechsky_sol01",
      target_vehicle = "mechsky_01"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
enmgen2_mechsky_d_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_02",
      name = "mechsky_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_02",
      name = "mechsky_sol02",
      target_vehicle = "mechsky_02"
    }
  },
  getEnemyName = function(A0_16, A1_17)
    local L2_18
    L2_18 = A0_16.spawnSet
    L2_18 = L2_18[A1_17]
    L2_18 = L2_18.name
    return L2_18
  end
}
enmgen2_mechsky_d_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_03",
      name = "mechsky_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_03",
      name = "mechsky_sol03",
      target_vehicle = "mechsky_03"
    }
  },
  getEnemyName = function(A0_19, A1_20)
    local L2_21
    L2_21 = A0_19.spawnSet
    L2_21 = L2_21[A1_20]
    L2_21 = L2_21.name
    return L2_21
  end
}
enmgen2_mechsky_d_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_04",
      name = "mechsky_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_04",
      name = "mechsky_sol04",
      target_vehicle = "mechsky_04"
    }
  },
  getEnemyName = function(A0_22, A1_23)
    local L2_24
    L2_24 = A0_22.spawnSet
    L2_24 = L2_24[A1_23]
    L2_24 = L2_24.name
    return L2_24
  end
}
enmgen2_mechsky_d_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_05",
      name = "mechsky_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_05",
      name = "mechsky_sol05",
      target_vehicle = "mechsky_05"
    }
  },
  getEnemyName = function(A0_25, A1_26)
    local L2_27
    L2_27 = A0_25.spawnSet
    L2_27 = L2_27[A1_26]
    L2_27 = L2_27.name
    return L2_27
  end
}
enmgen2_mechsky_d_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_06",
      name = "mechsky_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_06",
      name = "mechsky_sol06",
      target_vehicle = "mechsky_06"
    }
  },
  getEnemyName = function(A0_28, A1_29)
    local L2_30
    L2_30 = A0_28.spawnSet
    L2_30 = L2_30[A1_29]
    L2_30 = L2_30.name
    return L2_30
  end
}
enmgen2_mechsky_d_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_07",
      name = "mechsky_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_07",
      name = "mechsky_sol07",
      target_vehicle = "mechsky_07"
    }
  },
  getEnemyName = function(A0_31, A1_32)
    local L2_33
    L2_33 = A0_31.spawnSet
    L2_33 = L2_33[A1_32]
    L2_33 = L2_33.name
    return L2_33
  end
}
enmgen2_mechsky_d_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_d_08",
      name = "mechsky_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_d_08",
      name = "mechsky_sol08",
      target_vehicle = "mechsky_08"
    }
  },
  getEnemyName = function(A0_34, A1_35)
    local L2_36
    L2_36 = A0_34.spawnSet
    L2_36 = L2_36[A1_35]
    L2_36 = L2_36.name
    return L2_36
  end
}
function Initialize()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42
  L0_37 = Fn_pcSensorOff
  L0_37(L1_38)
  L0_37 = Fn_pcSensorOff
  L0_37(L1_38)
  L0_37 = Fn_pcSensorOff
  L0_37(L1_38)
  L0_37 = Fn_pcSensorOff
  L0_37(L1_38)
  L0_37 = {
    L1_38,
    L2_39,
    L3_40,
    L4_41,
    L5_42,
    {
      name = "sm09_soldier_03",
      type = "soldier",
      node = "locator2_soldier_d_03",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_04",
      type = "soldier",
      node = "locator2_soldier_d_04",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_05",
      type = "soldier",
      node = "locator2_soldier_d_05",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_06",
      type = "soldier",
      node = "locator2_soldier_d_06",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_07",
      type = "soldier",
      node = "locator2_soldier_d_07",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_08",
      type = "soldier",
      node = "locator2_soldier_d_08",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_09",
      type = "soldier",
      node = "locator2_soldier_d_09",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_10",
      type = "soldier",
      node = "locator2_soldier_d_10",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_11",
      type = "soldier",
      node = "locator2_soldier_d_11",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_12",
      type = "soldier",
      node = "locator2_soldier_d_12",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_13",
      type = "soldier",
      node = "locator2_soldier_d_13",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_14",
      type = "soldier",
      node = "locator2_soldier_d_14",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_15",
      type = "soldier",
      node = "locator2_soldier_d_15",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_soldier_16",
      type = "soldier",
      node = "locator2_soldier_d_16",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_01",
      type = "soldier",
      node = "locator2_guard_d_01",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_02",
      type = "soldier",
      node = "locator2_guard_d_02",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_03",
      type = "soldier",
      node = "locator2_guard_d_03",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_04",
      type = "soldier",
      node = "locator2_guard_d_04",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_05",
      type = "soldier",
      node = "locator2_guard_d_05",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_06",
      type = "soldier",
      node = "locator2_guard_d_06",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_07",
      type = "soldier",
      node = "locator2_guard_d_07",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_08",
      type = "soldier",
      node = "locator2_guard_d_08",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_09",
      type = "soldier",
      node = "locator2_guard_d_09",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_10",
      type = "soldier",
      node = "locator2_guard_d_10",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_11",
      type = "soldier",
      node = "locator2_guard_d_11",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_12",
      type = "soldier",
      node = "locator2_guard_d_12",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_13",
      type = "soldier",
      node = "locator2_guard_d_13",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_14",
      type = "soldier",
      node = "locator2_guard_d_14",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_15",
      type = "soldier",
      node = "locator2_guard_d_15",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_16",
      type = "soldier",
      node = "locator2_guard_d_16",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_17",
      type = "soldier",
      node = "locator2_guard_d_17",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_18",
      type = "soldier",
      node = "locator2_guard_d_18",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_19",
      type = "soldier",
      node = "locator2_guard_d_19",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_20",
      type = "soldier",
      node = "locator2_guard_d_20",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_21",
      type = "soldier",
      node = "locator2_guard_d_21",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_22",
      type = "soldier",
      node = "locator2_guard_d_22",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_23",
      type = "soldier",
      node = "locator2_guard_d_23",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_24",
      type = "soldier",
      node = "locator2_guard_d_24",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_25",
      type = "soldier",
      node = "locator2_guard_d_25",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_26",
      type = "soldier",
      node = "locator2_guard_d_26",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_guard_27",
      type = "soldier",
      node = "locator2_guard_d_27",
      active = true,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_waru_01",
      type = "man46",
      node = "locator2_waru_01",
      active = false,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_waru_02",
      type = "man45",
      node = "locator2_waru_02",
      active = false,
      not_mob = true,
      attach = false
    },
    {
      name = "sm09_waru_03",
      type = "man47",
      node = "locator2_waru_03",
      active = false,
      not_mob = true,
      attach = false
    }
  }
  L1_38.name = "sm09_gun_01"
  L1_38.type = "man56"
  L1_38.node = "locator2_gunjin_d_01"
  L1_38.active = true
  L1_38.not_mob = true
  L1_38.attach = false
  L2_39.name = "sm09_gun_02"
  L2_39.type = "soldier"
  L2_39.node = "locator2_gunjin_d_02"
  L2_39.active = true
  L2_39.not_mob = true
  L2_39.attach = false
  L3_40.name = "sm09_gun_03"
  L3_40.type = "soldier"
  L3_40.node = "locator2_gunjin_d_03"
  L3_40.active = true
  L3_40.not_mob = true
  L3_40.attach = false
  L4_41 = {}
  L4_41.name = "sm09_soldier_01"
  L4_41.type = "soldier"
  L4_41.node = "locator2_soldier_d_01"
  L4_41.active = true
  L4_41.not_mob = true
  L4_41.attach = false
  L5_42 = {}
  L5_42.name = "sm09_soldier_02"
  L5_42.type = "soldier"
  L5_42.node = "locator2_soldier_d_02"
  L5_42.active = true
  L5_42.not_mob = true
  L5_42.attach = false
  L1_38(L2_39)
  for L4_41, L5_42 in L1_38(L2_39) do
    _puppet_tbl[L5_42.name] = Fn_findNpcPuppet(L5_42.name)
  end
  for L4_41 = 1, SOLDIER_MAX do
    L5_42 = "sm09_soldier_"
    L5_42 = L5_42 .. string.format("%02d", L4_41)
    table.insert(_soldierName, L5_42)
    Fn_loadNpcEventMotion(L5_42, SOL_MOTION_LIST)
  end
  for L4_41 = 1, GUARD_MAX do
    L5_42 = "sm09_guard_"
    L5_42 = L5_42 .. string.format("%02d", L4_41)
    table.insert(_guardName, L5_42)
    Fn_loadNpcEventMotion(L5_42, SOL_MOTION_LIST)
  end
  L1_38(L2_39)
  L1_38()
  _sdemo_celeb_ship = L1_38
  _sdemo_enemy_increase = L1_38
  _sdemo_cut05 = L1_38
  L4_41 = "Node"
  L5_42 = "locator2_pdemo_01"
  L4_41 = {}
  L4_41.camera = false
  L4_41.scene_param = false
  _polydemo = L1_38
end
function Ingame()
  local L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56
  L0_43 = Fn_sendEventComSb
  L1_44 = "getMissionPart"
  L0_43 = L0_43(L1_44)
  _part = L0_43
  L0_43 = setupAreaModel
  L0_43()
  L0_43 = npcInit_soldier
  L1_44 = _part
  L0_43(L1_44)
  L0_43 = Player
  L1_44 = L0_43
  L0_43 = L0_43.setSituation
  L2_45 = Player
  L2_45 = L2_45.kSituation_Normal
  L3_46 = true
  L0_43(L1_44, L2_45, L3_46, L4_47, L5_48, L6_49)
  L0_43 = createGameObject2
  L1_44 = "GimmickBg"
  L0_43 = L0_43(L1_44)
  L2_45 = L0_43
  L1_44 = L0_43.setDrawModelName
  L3_46 = "ciattachecase01_base"
  L1_44(L2_45, L3_46)
  L1_44 = start_game_obj
  L1_44()
  L1_44 = Fn_findNpc
  L2_45 = "sm09_waru_01"
  L1_44 = L1_44(L2_45)
  L2_45 = L1_44
  L1_44 = L1_44.setProp
  L3_46 = "bag"
  L1_44(L2_45, L3_46, L4_47)
  L1_44 = Fn_warpNpc
  L2_45 = "sm09_client"
  L3_46 = "locator2_reset_client_02"
  L1_44(L2_45, L3_46)
  L1_44 = Player
  L2_45 = L1_44
  L1_44 = L1_44.setStay
  L3_46 = true
  L1_44(L2_45, L3_46, L4_47)
  L1_44 = setupDpartMechSkyTask
  L1_44()
  L1_44 = Fn_missionStart
  L1_44()
  L1_44 = Fn_setCatWarpCheckPoint
  L2_45 = "locator2_pc_start_pos"
  L1_44(L2_45)
  while true do
    L1_44 = Vehicle
    L2_45 = L1_44
    L1_44 = L1_44.isReady
    L1_44 = L1_44(L2_45)
    if not L1_44 then
      L1_44 = wait
      L1_44()
    end
  end
  L1_44 = {
    L2_45,
    [13] = L3_46(L4_47)
  }
  L2_45 = findGameObject2
  L3_46 = "Node"
  L2_45 = L2_45(L3_46, L4_47)
  L3_46 = L2_45
  L2_45 = L2_45.getWorldPos
  L2_45 = L2_45(L3_46)
  L3_46 = findGameObject2
  L3_46 = L3_46(L4_47, L5_48)
  L3_46 = L3_46.getWorldPos
  L13_56 = L3_46(L4_47)
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[2] = L3_46
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[3] = L4_47
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[4] = L5_48
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[5] = L6_49
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[6] = L7_50
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[7] = L8_51
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[8] = L9_52
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[9] = L10_53
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[10] = L11_54
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[11] = L12_55
  ;({
    L2_45,
    [13] = L3_46(L4_47)
  })[12] = L13_56
  L2_45 = {
    L3_46,
    [12] = L4_47(L5_48)
  }
  L3_46 = findGameObject2
  L3_46 = L3_46(L4_47, L5_48)
  L3_46 = L3_46.getWorldPos
  L3_46 = L3_46(L4_47)
  L13_56 = L4_47(L5_48)
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[2] = L4_47
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[3] = L5_48
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[4] = L6_49
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[5] = L7_50
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[6] = L8_51
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[7] = L9_52
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[8] = L10_53
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[9] = L11_54
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[10] = L12_55
  ;({
    L3_46,
    [12] = L4_47(L5_48)
  })[11] = L13_56
  L3_46 = Mv_createScriptVehicle
  L3_46 = L3_46(L4_47, L5_48, L6_49, L7_50)
  _ship_hdl_01 = L3_46
  L3_46 = _ship_hdl_01
  L3_46 = L3_46.setMomentRate
  L3_46(L4_47, L5_48)
  L3_46 = _ship_hdl_01
  L3_46 = L3_46.setBaseSpeed
  L3_46(L4_47, L5_48)
  L3_46 = waitSeconds
  L3_46(L4_47)
  L3_46 = Fn_fadein
  L3_46()
  L3_46 = Fn_userCtrlOn
  L3_46()
  L3_46 = Fn_kaiwaDemoView
  L3_46(L4_47)
  L3_46 = invokeTask
  L3_46(L4_47)
  L3_46 = Player
  L3_46 = L3_46.setLookAtIk
  L13_56 = L7_50(L8_51)
  L3_46(L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L7_50(L8_51))
  L3_46 = moveDpartMechSkyTask
  L3_46()
  L3_46 = Mv_createScriptVehicle
  L3_46 = L3_46(L4_47, L5_48, L6_49, L7_50)
  _ship_hdl_02 = L3_46
  L3_46 = _ship_hdl_02
  L3_46 = L3_46.setMomentRate
  L3_46(L4_47, L5_48)
  L3_46 = _ship_hdl_02
  L3_46 = L3_46.setBaseSpeed
  L3_46(L4_47, L5_48)
  L3_46 = _sdemo_celeb_ship
  L3_46 = L3_46.set
  L3_46(L4_47, L5_48, L6_49, L7_50)
  L3_46 = _sdemo_celeb_ship
  L3_46 = L3_46.play
  L3_46(L4_47)
  L3_46 = {L4_47}
  L4_47.pos = "locator2_mob_ship_aim_02"
  L4_47.time = 4
  L4_47(L5_48, L6_49, L7_50)
  L4_47(L5_48)
  L13_56 = L8_51(L9_52)
  L4_47(L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L8_51(L9_52))
  L4_47(L5_48)
  L4_47(L5_48)
  L13_56 = L9_52(L10_53, L11_54, L12_55)
  L4_47(L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L9_52(L10_53, L11_54, L12_55))
  L4_47(L5_48, L6_49)
  L13_56 = L8_51(L9_52)
  L4_47(L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L8_51(L9_52))
  L4_47(L5_48, L6_49)
  L4_47(L5_48, L6_49, L7_50)
  L4_47(L5_48, L6_49, L7_50)
  L4_47(L5_48)
  for L7_50 = 1, 2 do
    L8_51(L9_52)
    L8_51[L7_50] = nil
  end
  L4_47(L5_48)
  L4_47(L5_48, L6_49)
  _sdemo_end = true
  L4_47(L5_48, L6_49, L7_50)
  L13_56 = L8_51(L9_52)
  L4_47(L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L8_51(L9_52))
  L4_47(L5_48, L6_49)
  L4_47(L5_48)
  L4_47(L5_48, L6_49)
  repeat
    if not L5_48 then
      if not L5_48 then
        if not L5_48 then
          L5_48(L6_49)
          L5_48(L6_49)
          L13_56 = L6_49(L7_50, L8_51)
          L5_48(L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L6_49(L7_50, L8_51))
          repeat
            if L7_50 <= 100 and L6_49 == 0 then
              L8_51(L9_52)
            elseif L7_50 >= 70 and L6_49 == 1 then
              L8_51(L9_52)
            elseif L8_51 then
              if not L8_51 then
                if not L8_51 then
                  L8_51()
                  L8_51()
                  L8_51(L9_52, L10_53, L11_54)
                  L8_51(L9_52, L10_53, L11_54, L12_55)
                  L8_51(L9_52)
                  L8_51(L9_52)
                  L8_51(L9_52)
                  L9_52.pos = "locator2_trade_spot_aim_02"
                  L9_52.time = 8
                  L9_52(L10_53, L11_54, L12_55)
                  L9_52(L10_53)
                  L9_52(L10_53)
                  L9_52(L10_53)
                  L9_52(L10_53, L11_54)
                  L9_52(L10_53)
                  L9_52(L10_53)
                  L9_52(L10_53)
                  L9_52(L10_53)
                  break
                end
              end
            end
            L8_51()
          until L8_51
          repeat
            if L7_50 == L8_51 then
              if L8_51 then
                L13_56 = L9_52(L10_53, L11_54)
                L8_51(L9_52, L10_53, L11_54, L12_55, L13_56, L9_52(L10_53, L11_54))
              elseif L8_51 then
                L13_56 = L9_52(L10_53, L11_54)
                L8_51(L9_52, L10_53, L11_54, L12_55, L13_56, L9_52(L10_53, L11_54))
              elseif L8_51 then
                L13_56 = L9_52(L10_53, L11_54)
                L8_51(L9_52, L10_53, L11_54, L12_55, L13_56, L9_52(L10_53, L11_54))
              else
                for L13_56 = 1, 3 do
                  if L8_51 > Fn_getDistanceToPlayer("locator2_photo_spot_" .. string.format("%02d", L13_56)) then
                  end
                end
                L13_56 = "locator2_photo_spot_"
                L13_56 = L13_56 .. string.format("%02d", L9_52)
                L13_56 = L11_54(L12_55, L13_56)
                L10_53(L11_54, L12_55, L13_56, L11_54(L12_55, L13_56))
              end
              L8_51(L9_52)
            elseif L8_51 then
              L13_56 = 0.5
              if L8_51 then
                L8_51(L9_52, L10_53, L11_54)
                L8_51()
                L8_51()
                L8_51()
                L8_51()
                _viewPointTask = L8_51
                L8_51(L9_52, L10_53)
                L8_51(L9_52)
                L8_51(L9_52)
                L8_51(L9_52)
                break
              end
            end
            L8_51(L9_52)
          until L8_51
        end
      end
    end
    L5_48()
  until L5_48
  L5_48(L6_49)
  L5_48(L6_49)
  while true do
    if L5_48 == false then
      L5_48()
    end
  end
  for L8_51 = 1, CELEBRITY_MAX do
    L13_56 = L8_51
    L9_52(L10_53, L11_54)
    L13_56 = L8_51
    L13_56 = "%02d"
    L9_52(L10_53, L11_54)
  end
  L5_48(L6_49, L7_50, L8_51, L9_52)
  L5_48(L6_49, L7_50)
  L6_49(L7_50)
  L6_49(L7_50)
  L6_49(L7_50)
  L7_50(L8_51, L9_52)
  L7_50(L8_51, L9_52, L10_53)
  L7_50(L8_51, L9_52)
  L7_50()
  L7_50()
  _is_photo_success = false
  repeat
    repeat
      if not L7_50 then
        if L7_50 then
          repeat
            L7_50(L8_51)
            repeat
              L7_50()
              if L7_50 ~= nil then
              end
            until L7_50
            if L10_53 ~= nil then
            end
            if L9_52 ~= nil then
              if L10_53 == "table" then
                if L10_53 ~= "table" then
                  L11_54.state = L9_52
                end
                for L13_56, _FORV_14_ in L10_53(L11_54) do
                  if _polydemo:getCurrentFrame() >= TRADE_START_TIME and _FORV_14_.state == kPHOTO_OK or _FORV_14_.state == kPHOTO_ANGLE or _FORV_14_.state == kPHOTO_BACK or _FORV_14_.state == kPHOTO_NEAR then
                    print("OK", L9_52)
                  else
                    do break end
                    print("NO", L9_52)
                  end
                end
              end
            else
            end
            if L8_51 == true then
              _is_photo_success = true
              L10_53(L11_54, L12_55)
              L10_53(L11_54)
            elseif L8_51 == false then
              if L10_53 < L11_54 then
                if L10_53 == 0 then
                  L11_54(L12_55)
                else
                  L11_54(L12_55)
                end
              end
            end
            L10_53()
          until L10_53
          if L7_50 >= L8_51 then
            if not L7_50 then
              if L7_50 then
                return
              end
              _trade_timeout = true
              L7_50(L8_51)
              L7_50(L8_51)
              L7_50(L8_51)
            end
          end
        end
      end
      L7_50()
    until L7_50
  until not L7_50
  L7_50(L8_51, L9_52)
  L7_50(L8_51)
  L7_50(L8_51)
  _photo_hdl = L7_50
  L7_50(L8_51)
  L7_50()
  L7_50(L8_51, L9_52)
  L7_50(L8_51)
  L7_50(L8_51)
  L7_50()
  L7_50(L8_51)
  for L10_53 = 1, VILLAIN_MAX do
    L13_56 = string
    L13_56 = L13_56.format
    L13_56 = L13_56("%02d", L10_53)
    L11_54(L12_55)
  end
  for L10_53 = 1, SOLDIER_MAX do
    L13_56 = string
    L13_56 = L13_56.format
    L13_56 = L13_56("%02d", L10_53)
    L11_54(L12_55)
  end
  for L10_53 = 1, GUARD_MAX do
    L13_56 = string
    L13_56 = L13_56.format
    L13_56 = L13_56("%02d", L10_53)
    L11_54(L12_55)
  end
  for L10_53 = 1, CELEBRITY_MAX do
    L13_56 = string
    L13_56 = L13_56.format
    L13_56 = L13_56("%02d", L10_53)
    L11_54(L12_55)
  end
  L7_50(L8_51)
  _ship_hdl_02 = L7_50
  L7_50(L8_51, L9_52)
  L7_50()
  L7_50(L8_51)
  L7_50()
  L7_50()
  L7_50()
  L7_50()
end
function Finalize()
  local L0_57, L1_58
end
function pccubesensormulti2_trade_spot_01_OnEnter()
  Fn_naviKill()
  _is_photo_spot_change = true
  Fn_pcSensorOff("pccubesensormulti2_trade_spot_01")
end
function pccubesensor2_photo_spot_01_OnEnter()
  _is_photo_spot_find = true
  _is_photo_spot_number = 1
  if _viewPointTask == nil then
    _viewPointTask = Fn_lookAtObject("locator2_photoPoint_tradeSite_01", 0.3)
  end
end
function pccubesensor2_photo_spot_02_OnEnter()
  _is_photo_spot_find = true
  _is_photo_spot_number = 2
  if _viewPointTask == nil then
    _viewPointTask = Fn_lookAtObject("locator2_photoPoint_tradeSite_01", 0.3)
  end
end
function pccubesensor2_photo_spot_03_OnEnter()
  _is_photo_spot_find = true
  _is_photo_spot_number = 3
  if _viewPointTask == nil then
    _viewPointTask = Fn_lookAtObject("locator2_photoPoint_tradeSite_01", 0.3)
  end
end
function pccubesensor2_photo_spot_OnLeave()
  _is_photo_spot_find = false
  _is_photo_spot_number = 0
  _viewPointTask = Mv_safeTaskAbort(_viewPointTask)
end
function pccubesensor2_capture_sensor_OnEnter()
  if not _is_photo_success then
    _mechsky_retry = true
    invokeTask(function()
      Retry("mechsky_04")
    end)
  end
end
function photoStart()
  _photo_hdl = Mv_safeObjectKill(_photo_hdl)
  _photo_hdl = Photo.create(kPHOTO_CAPTION_ON, kPHOTO_TYPE_ALL, true, {near = 5, far = 35}, {
    left = -1,
    right = 1,
    top = -1,
    bottom = 1
  }, "sm09_user_photo02")
  _photo_hdl:set("locator2_photoPoint_tradeSite_01")
  _photo_hdl:set("locator2_photoPoint_waru_face_01")
  _photo_hdl:set("locator2_photoPoint_gun_face_01")
  Fn_missionView("sm09_00126")
  waitSeconds(1.3)
  Fn_captionViewWait("sm09_00114")
  _is_setup_photo = true
end
function setupDpartMechSkyTask()
  local L0_59
  L0_59 = 1
  if _sdemo_end then
    L0_59 = 3
  end
  _mechskytask = invokeTask(function()
    local L0_60, L1_61, L2_62, L3_63
    for L3_63 = L0_59, 8 do
      _enmgen[L3_63] = findGameObject2("EnemyGenerator", "enmgen2_mechsky_d_" .. string.format("%02d", L3_63))
      _mechsky[L3_63] = findGameObject2("EnemyBrain", "mechsky_" .. string.format("%02d", L3_63))
      repeat
        wait()
      until _mechsky[L3_63]:isReadyEnemy()
      _mechsky[L3_63]:setEnableHomingTarget(false)
      _enmgen[L3_63]:setEnemyMarker(false)
      _enmgen[L3_63]:requestIdlingEnemy(true)
    end
    for _FORV_4_ = L0_59, 8 do
      _enmgen[_FORV_4_]:setEventListener("TargetEnemyReport", L0_60)
    end
  end)
end
function moveDpartMechSkyTask()
  local L0_64, L1_65, L2_66
  L0_64 = {}
  L0_64.speed = 18
  L0_64.loop = false
  L0_64.search = false
  L1_65 = {}
  L1_65.invincible = true
  L1_65.speed = 4
  L1_65.loop = true
  L1_65.search = true
  L2_66 = {
    {
      "locator2_mechsky_01_d_move_pos_01",
      "locator2_mechsky_01_d_move_pos_02"
    },
    {
      "locator2_mechsky_02_d_move_pos_01",
      "locator2_mechsky_02_d_move_pos_02"
    },
    {
      "locator2_mechsky_03_d_move_pos_01",
      "locator2_mechsky_03_d_move_pos_02",
      "locator2_mechsky_03_d_move_pos_03",
      "locator2_mechsky_03_d_move_pos_04",
      "locator2_mechsky_03_d_move_pos_05",
      "locator2_mechsky_03_d_move_pos_06"
    },
    {
      "locator2_mechsky_04_d_move_pos_01",
      "locator2_mechsky_04_d_move_pos_02",
      "locator2_mechsky_04_d_move_pos_03",
      "locator2_mechsky_04_d_move_pos_04",
      "locator2_mechsky_04_d_move_pos_05",
      "locator2_mechsky_04_d_move_pos_06"
    },
    {
      "locator2_mechsky_05_d_move_pos_01",
      "locator2_mechsky_05_d_move_pos_02",
      "locator2_mechsky_05_d_move_pos_03",
      "locator2_mechsky_05_d_move_pos_04",
      "locator2_mechsky_05_d_move_pos_05",
      "locator2_mechsky_05_d_move_pos_06"
    },
    {
      "locator2_mechsky_06_d_move_pos_01",
      "locator2_mechsky_06_d_move_pos_02",
      "locator2_mechsky_06_d_move_pos_03",
      "locator2_mechsky_06_d_move_pos_04",
      "locator2_mechsky_06_d_move_pos_05",
      "locator2_mechsky_06_d_move_pos_06"
    },
    {
      "locator2_mechsky_07_d_move_pos_01",
      "locator2_mechsky_07_d_move_pos_02",
      "locator2_mechsky_07_d_move_pos_03",
      "locator2_mechsky_07_d_move_pos_04",
      "locator2_mechsky_07_d_move_pos_05",
      "locator2_mechsky_07_d_move_pos_06"
    },
    {
      "locator2_mechsky_08_d_move_pos_01",
      "locator2_mechsky_08_d_move_pos_02",
      "locator2_mechsky_08_d_move_pos_03",
      "locator2_mechsky_08_d_move_pos_04",
      "locator2_mechsky_08_d_move_pos_05",
      "locator2_mechsky_08_d_move_pos_06"
    }
  }
  if not _sdemo_end then
    _mechsky[1]:move(L2_66[1], L0_64)
    _mechsky[2]:move(L2_66[2], L0_64)
  end
  for _FORV_6_ = 3, 8 do
    _mechsky[_FORV_6_]:move(L2_66[_FORV_6_], L1_65)
  end
  sensor_obj = createGameObject2("PlayerSensor")
  sensor_obj:setDetectBehavior(1)
  sensor_obj:addBox(Vector(15, 15, 15))
  sensor_obj:setPos(Vector(0, 0, 0))
  sensor_obj:setOnEnter("pccubesensor2_capture_sensor_OnEnter")
  sensor_obj:setActive(true)
  findGameObject2("Puppet", "mechsky_04"):appendChild(sensor_obj)
  sensor_obj:try_init()
  sensor_obj:waitForReady()
  sensor_obj:try_start()
end
function Retry(A0_67)
  if _now_retry then
    return
  end
  if _is_photo_success then
    return
  end
  _now_retry = true
  Fn_naviKill()
  HUD:setPhotoMode(false)
  _photo_hdl = Mv_safeObjectKill(_photo_hdl)
  invokeTask(function()
    local L0_68, L1_69, L2_70, L3_71
    L3_71 = false
    L0_68(L1_69, L2_70, L3_71)
    L0_68(L1_69)
    L0_68()
    _mechskytask = L0_68
    if L0_68 then
      if not L0_68 then
        L0_68()
      end
    end
    if not L0_68 then
      L0_68()
      L0_68()
      L0_68(L1_69)
    end
    L0_68()
    if not L0_68 then
      L0_68(L1_69)
    end
    L0_68(L1_69)
    L0_68()
    L0_68(L1_69)
    if L0_68 then
      for L3_71 = 1, 3 do
        Fn_warpNpc("sm09_waru_" .. string.format("%02d", L3_71), "locator2_waruiyatu_trade_" .. string.format("%02d", L3_71))
      end
    end
    L0_68()
    if L0_68 == 0 then
      L0_68(L1_69)
    elseif L0_68 == 1 then
      L0_68(L1_69)
    elseif L0_68 == 2 then
      L0_68(L1_69)
    elseif L0_68 == 3 then
      L0_68(L1_69)
    end
    L0_68(L1_69)
    L0_68()
    L0_68()
    _pdemo_change_npc = true
    _found_to_enemy = false
    _is_seen_the_enemy = false
    _is_photo_spot_change = false
    _is_setup_photo = false
    _trade_timeout = false
    _now_retry = false
    L0_68()
    if L0_68 then
      if L0_68 then
        L0_68(L1_69, L2_70)
        L0_68(L1_69, L2_70)
        L0_68(L1_69)
      end
    end
    L0_68()
    L0_68(L1_69, L2_70)
    if L0_68 then
      L0_68()
    end
    if L0_68 ~= nil then
      L0_68()
    end
    L0_68()
    L0_68(L1_69)
  end)
end
