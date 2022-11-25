import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
VGEM_MAX = 4
ENM_GROUP_MAX = 4
_puppet_tbl = {}
_enemy_cnt = 0
_alive_enemy_cnt01 = 0
_alive_enemy_cnt02 = 0
_xer_mot_list = {
  down = "xer01_down_00"
}
enmgen2_wave01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_high",
      locator = "locator_w1_01_01",
      name = "wave1_01_01"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_02",
      name = "wave1_01_02"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_03",
      name = "wave1_01_03"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_04",
      name = "wave1_01_04"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_05",
      name = "wave1_01_05"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_06",
      name = "wave1_01_06"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_07",
      name = "wave1_01_07"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_08",
      name = "wave1_01_08"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_09",
      name = "wave1_01_09"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_10",
      name = "wave1_01_10"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_11",
      name = "wave1_01_11"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_12",
      name = "wave1_01_12"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_13",
      name = "wave1_01_13"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_14",
      name = "wave1_01_14"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_15",
      name = "wave1_01_15"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_16",
      name = "wave1_01_16"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_17",
      name = "wave1_01_17"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_18",
      name = "wave1_01_18"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_19",
      name = "wave1_01_19"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_01_20",
      name = "wave1_01_20"
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
    _alive_enemy_cnt01 = _alive_enemy_cnt01 - 1
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "wave1_01_01",
      "wave1_01_02",
      "wave1_01_03",
      "wave1_01_04",
      "wave1_01_05",
      "wave1_01_06",
      "wave1_01_07",
      "wave1_01_08",
      "wave1_01_09",
      "wave1_01_10",
      "wave1_01_11",
      "wave1_01_12",
      "wave1_01_13",
      "wave1_01_14",
      "wave1_01_15",
      "wave1_01_16",
      "wave1_01_17",
      "wave1_01_18",
      "wave1_01_19",
      "wave1_01_20"
    }, 5, 5, "A")
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11, {"A"})
  end
}
enmgen2_wave01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore_high",
      locator = "locator_w1_02_02",
      name = "wave1_02_01"
    },
    {
      type = "runner_high",
      locator = "locator_w1_02_04",
      name = "wave1_02_03"
    },
    {
      type = "runner_high",
      locator = "locator_w1_02_05",
      name = "wave1_02_04"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_06",
      name = "wave1_02_06"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_07",
      name = "wave1_02_07"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_08",
      name = "wave1_02_08"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_09",
      name = "wave1_02_09"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_10",
      name = "wave1_02_10"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_11",
      name = "wave1_02_11"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_12",
      name = "wave1_02_12"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_13",
      name = "wave1_02_13"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_14",
      name = "wave1_02_14"
    },
    {
      type = "stalker_high",
      locator = "locator_w1_02_15",
      name = "wave1_02_15"
    }
  },
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
    _alive_enemy_cnt02 = _alive_enemy_cnt02 - 1
  end,
  onSetupGem = function(A0_20, A1_21)
    Fn_enemyPopGemSetup(A0_20, {
      "wave1_02_03",
      "wave1_02_04",
      "wave1_02_05"
    }, 3, 5, "A")
    Fn_enemyPopGemSetup(A0_20, {
      "wave1_02_06",
      "wave1_02_07",
      "wave1_02_08",
      "wave1_02_09",
      "wave1_02_10",
      "wave1_02_11",
      "wave1_02_12",
      "wave1_02_13",
      "wave1_02_14",
      "wave1_02_15"
    }, 5, 5, "B")
  end,
  onPopGem = function(A0_22, A1_23)
    Fn_enemyAshPopGem(A0_22, A1_23, {"A", "B"})
  end
}
enmgen2_wave02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lasercannon_high",
      locator = "locator_w2_02",
      name = "wave2_01"
    },
    {
      type = "imp_high",
      locator = "locator_w2_04",
      name = "wave2_04"
    },
    {
      type = "gellyfish_high",
      locator = "locator_w2_06",
      name = "wave2_06"
    },
    {
      type = "gellyfish_high",
      locator = "locator_w2_07",
      name = "wave2_07"
    },
    {
      type = "gellyfish_high",
      locator = "locator_w2_08",
      name = "wave2_08"
    },
    {
      type = "gellyfish_high",
      locator = "locator_w2_09",
      name = "wave2_09"
    },
    {
      type = "gellyfish_high",
      locator = "locator_w2_10",
      name = "wave2_10"
    },
    {
      type = "defender_high",
      locator = "locator_w2_11",
      name = "wave2_11"
    }
  },
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
    _alive_enemy_cnt01 = _alive_enemy_cnt01 - 1
  end,
  onSetupGem = function(A0_32, A1_33)
    Fn_enemyPopGemSetup(A0_32, {
      "wave2_01",
      "wave2_02",
      "wave2_03"
    }, 2, 5, "A")
    Fn_enemyPopGemSetup(A0_32, {
      "wave2_06",
      "wave2_07",
      "wave2_08",
      "wave2_09",
      "wave2_10"
    }, 5, 5, "B")
    Fn_enemyPopGemSetup(A0_32, {"wave2_11", "wave2_12"}, 2, 6, "C")
    Fn_enemyPopGemSetup(A0_32, {"wave2_04", "wave2_05"}, 2, 4, "D")
  end,
  onPopGem = function(A0_34, A1_35)
    Fn_enemyAshPopGem(A0_34, A1_35, {
      "A",
      "B",
      "C",
      "D"
    })
  end
}
enmgen2_wave03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_high",
      locator = "locator_w3_05",
      name = "wave3_05"
    },
    {
      type = "giant_high",
      locator = "locator_w3_06",
      name = "wave3_06"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_07",
      name = "wave3_07"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_08",
      name = "wave3_08"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_09",
      name = "wave3_09"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_10",
      name = "wave3_10"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_11",
      name = "wave3_11"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_12",
      name = "wave3_12"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_13",
      name = "wave3_13"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_14",
      name = "wave3_14"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_15",
      name = "wave3_15"
    },
    {
      type = "stalker_high",
      locator = "locator_w3_16",
      name = "wave3_16"
    }
  },
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
    _alive_enemy_cnt01 = _alive_enemy_cnt01 - 1
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {"wave3_01", "wave3_02"}, 2, 4, "A")
    Fn_enemyPopGemSetup(A0_44, {
      "wave3_03",
      "wave3_04",
      "wave3_05"
    }, 2, 4, "B")
    Fn_enemyPopGemSetup(A0_44, {"wave3_06"}, 1, 6, "C")
    Fn_enemyPopGemSetup(A0_44, {
      "wave3_07",
      "wave3_08",
      "wave3_09",
      "wave3_10",
      "wave3_11",
      "wave3_12",
      "wave3_13",
      "wave3_14",
      "wave3_15",
      "wave3_16"
    }, 5, 5, "D")
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47, {
      "A",
      "B",
      "C",
      "D"
    })
  end
}
function Initialize()
  local L0_48
  L0_48 = {
    {
      name = "ali_01",
      type = "ali01",
      node = "locator2_ali_03"
    },
    {
      name = "xer_01",
      type = "xer01",
      node = "locator2_xero_03"
    }
  }
  Fn_setupNpc(L0_48)
  for _FORV_4_, _FORV_5_ in pairs(L0_48) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadNpcEventMotion("xer_01", _xer_mot_list)
end
function Ingame()
  local L0_49, L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60
  L0_49 = print
  L0_49(L1_50)
  L0_49 = Wind
  L0_49 = L0_49.setIntensity
  L0_49(L1_50, L2_51)
  L0_49 = Fn_switchDayAndNight
  L0_49(L1_50)
  L0_49 = print
  L0_49(L1_50)
  L0_49 = {}
  for L4_53 = 1, VGEM_MAX do
    L5_54 = findGameObject2
    L6_55 = "Gem"
    L5_54 = L5_54(L6_55, L7_56)
    L0_49[L4_53] = L5_54
    L5_54 = L0_49[L4_53]
    L6_55 = L5_54
    L5_54 = L5_54.setActive
    L5_54(L6_55, L7_56)
  end
  L1_50[1] = L2_51
  L1_50[2] = L2_51
  L1_50[3] = L2_51
  L1_50[4] = L2_51
  for L5_54 = 1, ENM_GROUP_MAX do
    L6_55 = L1_50[L5_54]
    L6_55 = L6_55.requestPrepare
    L6_55(L7_56)
  end
  L5_54 = false
  L2_51(L3_52, L4_53, L5_54)
  L5_54 = false
  L2_51(L3_52, L4_53, L5_54)
  L2_51(L3_52, L4_53)
  while true do
    L5_54 = "Node"
    L6_55 = "locator2_haze_"
    L6_55 = L6_55 .. L7_56
    L5_54 = print
    L6_55 = L4_53
    L5_54(L6_55)
    if L4_53 ~= nil then
      L5_54 = createGameObject2
      L6_55 = "Effect"
      L5_54 = L5_54(L6_55)
      L6_55 = L5_54.setModelName
      L6_55(L7_56, L8_57)
      L6_55 = L5_54.setName
      L10_59 = "%02d"
      L11_60 = L3_52
      L6_55(L7_56, L8_57)
      L6_55 = L5_54.setLoop
      L6_55(L7_56, L8_57)
      L6_55 = L5_54.play
      L6_55(L7_56)
      L6_55 = L5_54.setActive
      L6_55(L7_56, L8_57)
      L6_55 = L5_54.try_init
      L6_55(L7_56)
      L6_55 = L5_54.waitForReady
      L6_55(L7_56)
      L6_55 = L5_54.try_start
      L6_55(L7_56)
      L6_55 = L4_53.appendChild
      L6_55(L7_56, L8_57)
      L2_51[L3_52] = L5_54
    else
      break
    end
  end
  L5_54 = "et2_a_root"
  L5_54, L6_55 = nil, nil
  while true do
    while true do
      L10_59 = true
      L5_54 = L7_56
      if L5_54 == nil then
        L7_56()
      end
    end
  end
  while true do
    L10_59 = true
    L6_55 = L7_56
    if L6_55 == nil then
      L7_56()
    end
  end
  L10_59 = 0
  L11_60 = 0
  L11_60 = L9_58(L10_59, L11_60, 0)
  L7_56(L8_57, L9_58, L10_59, L11_60, L9_58(L10_59, L11_60, 0))
  L10_59 = 0
  L11_60 = 0
  L11_60 = L9_58(L10_59, L11_60, 0)
  L7_56(L8_57, L9_58, L10_59, L11_60, L9_58(L10_59, L11_60, 0))
  L7_56()
  L7_56()
  L7_56(L8_57, L9_58)
  L7_56(L8_57)
  L7_56(L8_57)
  if L7_56 ~= nil then
    _alive_enemy_cnt01 = L7_56
    L7_56(L8_57)
  end
  L7_56(L8_57)
  L7_56(L8_57)
  for L10_59, L11_60 in L7_56(L8_57) do
    invokeTask(function()
      Fn_setAlpha(L11_60, false, 3, 10)
      L11_60:setVisible(false)
    end)
    break
  end
  L7_56(L8_57)
  for L10_59 = 1, VGEM_MAX do
    L11_60 = L0_49[L10_59]
    L11_60 = L11_60.setActive
    L11_60(L11_60, true)
  end
  while true do
    if not (L7_56 <= L8_57) then
      L7_56()
    end
  end
  _alive_enemy_cnt02 = L7_56
  L7_56(L8_57)
  L7_56(L8_57)
  while true do
    if L7_56 ~= 0 then
      L7_56()
    end
  end
  _alive_enemy_cnt01 = L7_56
  L7_56(L8_57)
  L7_56(L8_57)
  L8_57(L9_58)
  while true do
    if L8_57 > 0 then
      L8_57()
    end
  end
  _alive_enemy_cnt01 = L8_57
  L8_57(L9_58)
  L8_57(L9_58)
  L10_59 = "wave3_06"
  function L10_59()
    local L0_61
    L0_61 = Fn_lookAtObject
    L0_61 = L0_61(L8_57)
    for _FORV_4_ = 1, 90 do
      if not Fn_isInSightTarget(L8_57, 1) then
        wait()
      end
    end
    L0_61 = Mv_safeTaskAbort(L0_61)
    Fn_captionViewWait("ep22_03004")
    waitSeconds(2)
    Fn_captionView("ep22_03005")
  end
  L9_58(L10_59)
  while true do
    L10_59 = _alive_enemy_cnt02
    if L9_58 ~= 0 then
      L9_58()
    end
  end
  L10_59 = "xer_01"
  L9_58(L10_59)
  L10_59 = "ali_01"
  L9_58(L10_59)
  L9_58()
  L9_58()
  L9_58()
end
function Finalize()
  Wind:setWind()
end
