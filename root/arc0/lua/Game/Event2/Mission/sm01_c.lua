dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm01_common.lua")
TARGET_MAX = 30
TARGET_MAX_2 = 30
RETRY_BREAK_MAX = 39
RETRY_BREAK_MAX_02 = 13
_enemy_cnt = 0
_enemy_max_num = 0
_is_enemy_alive = {}
_enmgen_hdl = {}
_enemy_table_ref = {}
_miz_is_dead = false
_is_attacked = false
_is_retrying = false
_is_grab_guide = false
MIZ_ENEMY_ATTACK_WAIT = 300
MIZ_SKIP_CARRY_DISTANCE = 7
_land_03_near_flag = false
_area3_next_area_in = false
MIZ_RETURN_CAP_DISTANCE = 10
_grab_caption_wait = 0
GRAB_CAPTION_WAIT = 100
_is_take_down_inside = false
enmgen2_02_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_d1_01",
      name = "enemy01"
    },
    {
      type = "stalker",
      locator = "locator_d1_02",
      name = "enemy02"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_03",
      name = "enemy03"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_04",
      name = "enemy04"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_05",
      name = "enemy05"
    }
  },
  enemyDeadNum = 0,
  onObjectDead = function(A0_0, A1_1)
    _enemy_cnt = _enemy_cnt - 1
    commonDeadEnemy(A1_1:getName())
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
  end,
  onSpawn = function(A0_2, A1_3)
    _enemy_cnt = _enemy_cnt + 1
    _is_enemy_alive[A1_3:getName()] = true
    A0_2:getSpecTable().enemyDeadNum = A0_2:getSpecTable().enemyDeadNum - 1
    if A0_2:getSpecTable().enemyDeadNum < 0 then
      A0_2:getSpecTable().enemyDeadNum = 0
    end
  end,
  isEnemyAllDead = function(A0_4)
    local L2_5
    L2_5 = A0_4.enemyDeadNum
    L2_5 = L2_5 >= #A0_4.spawnSet
    return L2_5
  end
}
enmgen2_02_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_d1_06",
      name = "enemy06"
    },
    {
      type = "stalker",
      locator = "locator_d1_07",
      name = "enemy07"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_08",
      name = "enemy08"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_09",
      name = "enemy09"
    }
  },
  onObjectDead = function(A0_6, A1_7)
    local L2_8
    L2_8 = commonDeadEnemy
    L2_8(A1_7:getName())
  end
}
enmgen2_02_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_d1_10",
      name = "enemy10"
    },
    {
      type = "stalker",
      locator = "locator_d1_11",
      name = "enemy11"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_12",
      name = "enemy12"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_13",
      name = "enemy13"
    }
  },
  onObjectDead = function(A0_9, A1_10)
    local L2_11
    L2_11 = commonDeadEnemy
    L2_11(A1_10:getName())
  end
}
enmgen2_02_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_d1_14",
      name = "enemy14"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_15",
      name = "enemy15"
    },
    {
      type = "imp",
      locator = "locator_d1_16",
      name = "enemy16"
    }
  },
  onObjectDead = function(A0_12, A1_13)
    local L2_14
    L2_14 = commonDeadEnemy
    L2_14(A1_13:getName())
  end
}
enmgen2_02_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_d1_17",
      name = "enemy17"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_18",
      name = "enemy18"
    },
    {
      type = "imp",
      locator = "locator_d1_19",
      name = "enemy19"
    }
  },
  onObjectDead = function(A0_15, A1_16)
    local L2_17
    L2_17 = commonDeadEnemy
    L2_17(A1_16:getName())
  end
}
enmgen2_02_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_d2_01",
      name = "enemy20"
    },
    {
      type = "gellyfish",
      locator = "locator_d2_02",
      name = "enemy21"
    },
    {
      type = "imp",
      locator = "locator_d2_03",
      name = "enemy22"
    },
    {
      type = "imp",
      locator = "locator_d2_04",
      name = "enemy23"
    },
    {
      type = "stalker",
      locator = "locator_d2_05",
      name = "enemy24"
    },
    {
      type = "stalker",
      locator = "locator_d2_06",
      name = "enemy25"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 120,
  onObjectDead = function(A0_18, A1_19)
    local L2_20
    L2_20 = commonDeadEnemy
    L2_20(A1_19:getName())
  end
}
function Initialize()
  local L0_21
  L0_21 = {
    {
      name = MIZ_ID,
      type = "tkg05",
      node = "locator2_miz_c_01",
      reset = false,
      use_fall = true
    }
  }
  Fn_setupNpc(L0_21)
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_02_01"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_02_02"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_02_03"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_02_04"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_02_05"))
  table.insert(_enemy_table_ref, enmgen2_02_01)
  table.insert(_enemy_table_ref, enmgen2_02_02)
  table.insert(_enemy_table_ref, enmgen2_02_03)
  table.insert(_enemy_table_ref, enmgen2_02_04)
  table.insert(_enemy_table_ref, enmgen2_02_05)
  for _FORV_4_, _FORV_5_ in pairs(enmgen2_02_01.spawnSet) do
    _is_enemy_alive[_FORV_5_.name] = true
  end
  _enemy_max_num = #enmgen2_02_01.spawnSet
  Fn_pcSensorOff("pccubesensor2_can_see_land_02")
  Fn_pcSensorOff("pccubesensor2_can_see_land_03")
  Fn_pcSensorOff("pccubesensor2_arrive_land_03")
  Fn_pcSensorOff("pccubesensor2_arrive_land_04")
  Fn_pcSensorOff("pccubesensor2_catwarp_01")
  Fn_pcSensorOff("pccubesensor2_warning_01")
  Fn_pcSensorOff("pccubesensor2_navi_01")
end
function Ingame()
  local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, L18_40, L19_41, L20_42, L21_43, L22_44, L23_45, L24_46, L25_47, L26_48, L27_49, L28_50
  L0_22(L1_23)
  L0_22()
  L0_22()
  L4_26 = "locator2_c_escape_04"
  miz_escape_locate_talbe = L0_22
  for L3_25 = 1, #L1_23 do
    L4_26 = findGameObject2
    L5_27 = "Node"
    L6_28 = miz_escape_locate_talbe
    L6_28 = L6_28[L3_25]
    L4_26 = L4_26(L5_27, L6_28)
    if L4_26 ~= nil then
      L5_27 = Fn_sendEventComSb
      L6_28 = "addMizEscapePos"
      L8_30 = L4_26
      L7_29 = L4_26.getWorldPos
      L7_29 = L7_29(L8_30)
      L7_29 = L7_29.x
      L9_31 = L4_26
      L8_30 = L4_26.getWorldPos
      L8_30 = L8_30(L9_31)
      L8_30 = L8_30.y
      L10_32 = L4_26
      L9_31 = L4_26.getWorldPos
      L9_31 = L9_31(L10_32)
      L9_31 = L9_31.z
      L5_27(L6_28, L7_29, L8_30, L9_31)
    end
  end
  for L4_26 = 1, #L2_24 do
    L5_27 = _enmgen_hdl
    L5_27 = L5_27[L4_26]
    L6_28 = L5_27
    L5_27 = L5_27.setEnemyMarker
    L7_29 = false
    L5_27(L6_28, L7_29)
  end
  L1_23(L2_24, L3_25)
  L1_23(L2_24, L3_25)
  L1_23()
  L1_23(L2_24)
  L4_26 = L1_23
  L3_25(L4_26)
  L4_26 = createCatWarpTask
  L4_26 = L4_26()
  L5_27 = createMizWarpTask
  L5_27 = L5_27()
  L6_28 = createGrabCaptionWaitTask
  L6_28 = L6_28()
  L7_29 = createMizNearGrabTask
  L7_29 = L7_29()
  L8_30 = updateCatWarp
  L9_31 = "locator2_pc_start_pos"
  L10_32 = "locator2_miz_c_01"
  L11_33 = false
  L12_34 = true
  L8_30(L9_31, L10_32, L11_33, L12_34)
  L8_30 = findGameObject2
  L9_31 = "Node"
  L10_32 = "locator2_pc_start_pos"
  L8_30 = L8_30(L9_31, L10_32)
  L9_31 = L8_30
  L8_30 = L8_30.getWorldPos
  L8_30 = L8_30(L9_31)
  L9_31 = findGameObject2
  L10_32 = "Node"
  L11_33 = "locator2_navi_land_02"
  L9_31 = L9_31(L10_32, L11_33)
  L10_32 = L9_31
  L9_31 = L9_31.getWorldPos
  L9_31 = L9_31(L10_32)
  L10_32 = Vector
  L11_33 = L8_30.x
  L12_34 = L9_31.x
  L11_33 = L11_33 + L12_34
  L11_33 = L11_33 / 2
  L12_34 = L8_30.y
  L13_35 = L9_31.y
  L12_34 = L12_34 + L13_35
  L12_34 = L12_34 / 2
  L13_35 = L8_30.z
  L13_35 = L13_35 + L14_36
  L13_35 = L13_35 / 2
  L10_32 = L10_32(L11_33, L12_34, L13_35)
  sensor_pos = L10_32
  L10_32 = getCatWarpAreaSize
  L11_33 = L8_30
  L12_34 = L9_31
  L10_32 = L10_32(L11_33, L12_34)
  L11_33 = createCatWarpSensor
  L12_34 = sensor_pos
  L13_35 = L10_32
  L11_33 = L11_33(L12_34, L13_35, L14_36, L15_37)
  L12_34 = createCatWarpSensor
  L13_35 = sensor_pos
  L17_39 = L10_32.z
  L17_39 = L17_39 - 20
  L12_34 = L12_34(L13_35, L14_36, L15_37, L16_38)
  L13_35 = createGameObject2
  L13_35 = L13_35(L14_36)
  L14_36(L15_37, L16_38)
  L17_39 = 5
  L18_40 = 4
  L19_41 = 5
  L28_50 = L16_38(L17_39, L18_40, L19_41)
  L14_36(L15_37, L16_38, L17_39, L18_40, L19_41, L20_42, L21_43, L22_44, L23_45, L24_46, L25_47, L26_48, L27_49, L28_50, L16_38(L17_39, L18_40, L19_41))
  L14_36(L15_37, L16_38)
  L14_36(L15_37, L16_38)
  L14_36(L15_37)
  L14_36(L15_37)
  L14_36(L15_37)
  _is_grab_guide = true
  _ng_near_grab = false
  _grab_release = false
  L14_36(L15_37)
  L14_36(L15_37, L16_38)
  L14_36(L15_37)
  L14_36(L15_37, L16_38)
  if L14_36 == false then
    L14_36(L15_37)
  end
  while true do
    if L14_36 == false then
      L14_36()
    end
  end
  L14_36(L15_37, L16_38)
  L14_36()
  L17_39 = true
  L18_40 = true
  L19_41 = "locator2_navi_land_02"
  L20_42 = true
  L14_36(L15_37, L16_38, L17_39, L18_40, L19_41, L20_42)
  L14_36(L15_37, L16_38)
  L17_39 = "locator2_navi_land_02"
  L14_36(L15_37, L16_38)
  L14_36()
  L14_36(L15_37)
  L14_36(L15_37)
  _grab_release = true
  L17_39 = _grab_release
  L14_36(L15_37, L16_38, L17_39)
  L17_39 = "locator2_view_01"
  L14_36(L15_37, L16_38)
  L14_36(L15_37)
  L14_36()
  _is_grab_guide = false
  L14_36(L15_37)
  for L17_39 = 1, #L15_37 do
    L18_40 = _enmgen_hdl
    L18_40 = L18_40[L17_39]
    L19_41 = L18_40
    L18_40 = L18_40.setAutoRevirthSwitch
    L20_42 = false
    L18_40(L19_41, L20_42)
  end
  L14_36(L15_37, L16_38)
  L17_39 = false
  L18_40 = false
  L19_41 = "locator2_navi_land_02"
  L14_36(L15_37, L16_38, L17_39, L18_40, L19_41)
  sensor_pos = L14_36
  L17_39 = 80
  L18_40 = 100
  L19_41 = 110
  L17_39 = "catWarpSensor"
  L18_40 = L11_33
  L11_33 = L14_36
  L17_39 = 60
  L18_40 = 80
  L19_41 = 90
  L17_39 = "catWarpWarningSensor"
  L18_40 = L12_34
  L12_34 = L14_36
  L14_36(L15_37, L16_38)
  L14_36(L15_37, L16_38)
  L14_36(L15_37, L16_38)
  function L17_39()
    local L0_51, L1_52
    L0_51 = _is_attacked
    return L0_51
  end
  function L18_40()
    local L0_53, L1_54
    _is_attacked = false
  end
  function L19_41()
    local L0_55, L1_56
    L0_55 = _enemy_cnt
    return L0_55
  end
  L20_42 = true
  L17_39 = "enemy11"
  L18_40 = "enemy12"
  L19_41 = "enemy13"
  function L17_39()
    local L0_57, L1_58
    L0_57 = _is_retrying
    return L0_57
  end
  function L18_40()
    local L0_59, L1_60
    L0_59 = _miz_is_dead
    return L0_59
  end
  function L19_41()
    local L0_61, L1_62
    L0_61 = _is_enemy_alive
    return L0_61
  end
  function L20_42()
    local L0_63, L1_64
    L0_63 = _enemy_max_num
    return L0_63
  end
  L17_39 = Fn_missionView
  L18_40 = "sm01_01021"
  L17_39(L18_40)
  L17_39 = Player
  L18_40 = L17_39
  L17_39 = L17_39.setTargetingPriority
  L19_41 = Player
  L19_41 = L19_41.kTargetingPrio_GimmickBgFirst
  L17_39(L18_40, L19_41)
  L17_39 = Fn_sendEventComSb
  L18_40 = "changeMissionTerm"
  L19_41 = "MINING"
  L17_39(L18_40, L19_41)
  L17_39 = waitSeconds
  L18_40 = 1
  L17_39(L18_40)
  L17_39 = Fn_sendEventComSb
  L18_40 = "requestClearCounter"
  L17_39(L18_40)
  L17_39 = Fn_sendEventComSb
  L18_40 = "setCounterMax"
  L19_41 = TARGET_MAX
  L17_39(L18_40, L19_41)
  L17_39 = Fn_sendEventComSb
  L18_40 = "requestCounterOn"
  L17_39(L18_40)
  L17_39 = waitSeconds
  L18_40 = 2.8
  L17_39(L18_40)
  L17_39 = MIZ_ENEMY_ATTACK_WAIT
  while true do
    L18_40 = Player
    L19_41 = L18_40
    L18_40 = L18_40.getLastFrameDamagePoint
    L18_40 = L18_40(L19_41)
    if L18_40 > 0 then
      _is_attacked = true
    end
    L17_39 = L17_39 - 1
    if L17_39 == 0 then
      L18_40 = {L19_41, L20_42}
      L19_41 = "enemy01"
      L20_42 = "enemy02"
      L19_41 = RandI
      L20_42 = 1
      L19_41 = L19_41(L20_42, L21_43)
      L20_42 = _is_enemy_alive
      L20_42 = L20_42[L21_43]
      if L20_42 == true then
        L20_42 = Fn_sendEventComSb
        L28_50 = L22_44(L23_45, L24_46)
        L20_42(L21_43, L22_44, L23_45, L24_46, L25_47, L26_48, L27_49, L28_50, L22_44(L23_45, L24_46))
      end
      L17_39 = MIZ_ENEMY_ATTACK_WAIT
    end
    L18_40 = isRetry
    L19_41 = RETRY_BREAK_MAX
    L20_42 = L18_40(L19_41)
    if L18_40 == true then
      hint_cap = false
      L26_48 = L19_41
      L27_49 = L20_42
      L21_43(L22_44, L23_45, L24_46, L25_47, L26_48, L27_49)
      L21_43(L22_44)
      L17_39 = MIZ_ENEMY_ATTACK_WAIT
    end
    if not (L21_43 >= L22_44) then
      if L21_43 ~= 0 then
      end
    elseif L21_43 == true then
      L21_43(L22_44)
      break
    end
    L21_43()
  end
  L18_40 = Fn_sendEventComSb
  L19_41 = "requestCount"
  L18_40 = L18_40(L19_41)
  L19_41 = TARGET_MAX
  if L18_40 < L19_41 then
    L18_40 = _enemy_cnt
    if L18_40 == 0 then
      L19_41 = L1_23
      L18_40 = L1_23.isGrabbed
      L18_40 = L18_40(L19_41)
      if L18_40 == false then
        L18_40 = Fn_missionView
        L19_41 = "sm01_01021"
        L18_40(L19_41)
      end
    end
  end
  L18_40 = Fn_sendEventComSb
  L19_41 = "requestCount"
  L18_40 = L18_40(L19_41)
  L19_41 = TARGET_MAX
  if L18_40 >= L19_41 then
    L18_40 = Fn_sendEventComSb
    L19_41 = "requestCounterOff"
    L18_40(L19_41)
  end
  L18_40 = Fn_sendEventComSb
  L19_41 = "endEscapeEnemy"
  L18_40(L19_41)
  L18_40 = Fn_playMotionNpc
  L19_41 = L1_23
  L20_42 = "stay"
  L18_40(L19_41, L20_42, L21_43)
  L18_40 = Mv_safeTaskAbort
  L19_41 = L14_36
  L18_40 = L18_40(L19_41)
  L19_41 = L13_35
  L18_40 = L13_35.setActive
  L20_42 = false
  L18_40(L19_41, L20_42)
  L18_40 = false
  L19_41 = false
  L20_42 = _enemy_cnt
  if L20_42 ~= 0 then
    L20_42 = isEnemyGroupAllDead
    L20_42 = L20_42(L21_43)
  else
    if L20_42 == true then
      L20_42 = Fn_sendEventComSb
      L20_42 = L20_42(L21_43)
      if L20_42 < L21_43 then
        L20_42 = Fn_sendEventComSb
        L20_42(L21_43, L22_44)
        L20_42 = L1_23.isGrabbed
        L20_42 = L20_42(L21_43)
        if L20_42 == true then
          L20_42 = Fn_missionView
          L20_42(L21_43)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43, L22_44)
          L20_42 = waitSeconds
          L20_42(L21_43)
          L20_42 = GRAB_CAPTION_WAIT
          _grab_caption_wait = L20_42
          L20_42 = Fn_captionViewWait
          L20_42(L21_43)
        else
          L20_42 = Fn_playMotionNpc
          L20_42(L21_43, L22_44, L23_45)
          L20_42 = Fn_sendEventComSb
          L20_42 = L20_42(L21_43, L22_44)
          if L20_42 ~= nil then
            if L22_44 <= L23_45 then
              _ng_near_grab = true
              L26_48 = true
              L23_45(L24_46, L25_47, L26_48)
            end
          end
          if L23_45 > L24_46 then
            if L20_42 ~= nil then
            elseif L22_44 > L23_45 then
              L26_48 = L23_45
              L27_49 = L2_24
              L28_50 = L24_46
              L25_47(L26_48, L27_49, L28_50)
              L26_48 = L2_24
              L27_49 = false
              function L28_50()
                return Fn_sendEventComSb("requestCount") >= TARGET_MAX
              end
              L25_47(L26_48, L27_49, L28_50)
            end
          else
            L23_45(L24_46)
          end
          if L20_42 ~= nil then
          else
            if L22_44 > L23_45 then
              if L23_45 < L24_46 then
                L23_45(L24_46)
                L23_45(L24_46, L25_47)
                L23_45(L24_46)
              end
              L23_45(L24_46, L25_47)
              function L26_48()
                return Fn_sendEventComSb("requestCount") >= TARGET_MAX
              end
              L23_45(L24_46, L25_47, L26_48)
              while true do
                if L23_45 == false then
                  if L23_45 == true then
                    L26_48 = retry
                    L27_49 = false
                    L28_50 = "locator2_miz_ore_navi_02"
                    L26_48(L27_49, L28_50, "locator2_miz_move_c_01", true, L24_46, L25_47)
                  end
                  L26_48 = Fn_sendEventComSb
                  L27_49 = "requestCount"
                  L26_48 = L26_48(L27_49)
                  L27_49 = TARGET_MAX
                  if L26_48 >= L27_49 then
                    L26_48 = Fn_sendEventComSb
                    L27_49 = "requestCounterOff"
                    L26_48(L27_49)
                    break
                  end
                end
                L26_48 = wait
                L26_48()
              end
              L23_45()
              L20_42 = L23_45
              if L23_45 < L24_46 then
                if L20_42 ~= nil then
                elseif L22_44 > L23_45 then
                  _grab_caption_wait = L23_45
                  L23_45(L24_46)
                  L26_48 = "locator2_navi_land_02"
                  L28_50 = L24_46(L25_47, L26_48)
                  if L23_45 > 70 then
                    L26_48 = "locator2_navi_land_02"
                    L28_50 = L24_46(L25_47, L26_48)
                    L23_45(L24_46, L25_47, L26_48, L27_49, L28_50, L24_46(L25_47, L26_48))
                  end
                end
              end
          end
          else
            L23_45()
          end
        end
        L20_42 = Fn_sendEventComSb
        L20_42 = L20_42(L21_43)
        if L20_42 < L21_43 then
          L20_42 = createMizOreCarry
          L20_42 = L20_42(L21_43, L22_44, L23_45)
          while true do
            if L21_43 == true then
              if L21_43 == true then
                L26_48 = "locator2_miz_ore_navi_02"
                L27_49 = "locator2_miz_move_c_01"
                L28_50 = true
                L24_46(L25_47, L26_48, L27_49, L28_50, L22_44, L23_45)
              end
              if L24_46 >= L25_47 then
                L24_46(L25_47)
                break
              end
            end
            L24_46()
          end
          _ng_near_grab = true
          L21_43(L22_44, L23_45, L24_46)
          L20_42 = L21_43
        end
        L20_42 = L13_35.setActive
        L20_42(L21_43, L22_44)
        L20_42 = Fn_sendEventComSb
        L20_42 = L20_42(L21_43)
        if L20_42 < L21_43 then
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43, L22_44)
          L20_42 = Player
          L20_42 = L20_42.setTargetingPriority
          L20_42(L21_43, L22_44)
          L20_42 = waitSeconds
          L20_42(L21_43)
          L20_42 = MizDig
          L20_42()
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43, L22_44, L23_45, L24_46, L25_47)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43)
          while true do
            L20_42 = Fn_sendEventComSb
            L20_42 = L20_42(L21_43)
            if L20_42 == true then
              L20_42 = Fn_sendEventComSb
              L20_42 = L20_42(L21_43)
            end
            if not (L20_42 >= L21_43) then
              L20_42 = wait
              L20_42()
            end
          end
          L20_42 = waitSeconds
          L20_42(L21_43)
          L20_42 = MizDig
          L20_42()
          L20_42 = Fn_sendEventComSb
          L20_42 = L20_42(L21_43)
          if L20_42 == false then
            L20_42 = Fn_sendEventComSb
            L20_42 = L20_42(L21_43)
            if L20_42 ~= nil then
              if L21_43 ~= "L" then
                L22_44(L23_45, L24_46)
                L22_44(L23_45, L24_46, L25_47)
                L22_44(L23_45, L24_46)
                L22_44(L23_45, L24_46, L25_47)
              else
                L22_44(L23_45, L24_46)
                L22_44(L23_45, L24_46, L25_47)
                L22_44(L23_45, L24_46)
                L22_44(L23_45, L24_46, L25_47)
              end
            end
          end
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43)
          while true do
            L20_42 = Fn_sendEventComSb
            L20_42 = L20_42(L21_43)
            if L20_42 < L21_43 then
              L20_42 = isRetry
              L20_42 = L20_42(L21_43)
              if L20_42 == true then
                L26_48 = "locator2_miz_move_c_01"
                L27_49 = false
                L28_50 = L21_43
                L23_45(L24_46, L25_47, L26_48, L27_49, L28_50, L22_44)
              end
              L23_45()
            end
          end
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43, L22_44)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43)
          L20_42 = Fn_playMotionNpc
          L20_42(L21_43, L22_44, L23_45)
          _ng_near_grab = false
          _grab_release = false
          L20_42 = Fn_setGrabNpc
          L20_42(L21_43, L22_44, L23_45)
          L20_42 = L1_23.isGrabbed
          L20_42 = L20_42(L21_43)
          if L20_42 == false then
            L20_42 = Fn_turnNpc
            L20_42(L21_43, L22_44)
            L20_42 = Fn_getDistanceToPlayer
            L20_42 = L20_42(L21_43)
            if L20_42 > L21_43 then
              L20_42 = createMizGrabNaviKillTask
              L20_42 = L20_42()
              L23_45(L24_46)
              L23_45(L24_46)
              L19_41 = true
              L23_45(L24_46)
              L23_45(L24_46)
              L20_42 = L23_45
              if L23_45 == false then
                L23_45(L24_46)
                function L26_48()
                  return L1_23:isGrabbed()
                end
                L23_45(L24_46, L25_47, L26_48)
              end
            else
              L20_42 = Fn_naviSet
              L20_42(L21_43)
            end
          end
          L20_42 = createMizGrabNaviKillTask
          L20_42 = L20_42()
          L21_43(L22_44, L23_45, L24_46, L25_47)
          L21_43(L22_44)
          L19_41 = true
          L20_42 = L21_43
        else
          _ng_near_grab = false
          _grab_release = false
          L20_42 = Fn_setGrabNpc
          L20_42(L21_43, L22_44, L23_45)
          L20_42 = Fn_sendEventComSb
          L20_42(L21_43, L22_44)
          L20_42 = L1_23.isGrabbed
          L20_42 = L20_42(L21_43)
          if L20_42 == false then
            L20_42 = Fn_getDistanceToPlayer
            L20_42 = L20_42(L21_43)
            if L20_42 > L21_43 then
              L20_42 = createMizGrabNaviKillTask
              L20_42 = L20_42()
              L23_45(L24_46)
              L23_45(L24_46)
              L19_41 = true
              L23_45(L24_46)
              L23_45(L24_46)
              L20_42 = L23_45
              if L23_45 == false then
                L23_45(L24_46)
                L23_45(L24_46)
                L23_45()
              end
            end
            L20_42 = L1_23.isGrabbed
            L20_42 = L20_42(L21_43)
            if L20_42 == false then
              L20_42 = invokeTask
              L20_42(L21_43)
              L20_42 = waitSeconds
              L20_42(L21_43)
            end
          end
          L20_42 = L1_23.isGrabbed
          L20_42 = L20_42(L21_43)
          if L20_42 == true then
            L20_42 = Fn_naviKill
            L20_42()
          end
          L20_42 = Fn_userCtrlAllOff
          L20_42()
          L20_42 = GameDatabase
          L20_42 = L20_42.get
          L20_42 = L20_42(L21_43, L22_44)
          if L20_42 == true then
            repeat
              repeat
                L20_42 = wait
                L20_42()
                L20_42 = GameDatabase
                L20_42 = L20_42.get
                L20_42 = L20_42(L21_43, L22_44)
              until L20_42 == false
              L20_42 = Player
              L20_42 = L20_42.getAction
              L20_42 = L20_42(L21_43)
            until L20_42 ~= L21_43
          end
          L20_42 = Fn_kaiwaDemoView
          L20_42(L21_43)
          L18_40 = true
          L20_42 = Fn_userCtrlOn
          L20_42()
        end
      end
  end
  else
    _ng_near_grab = false
    _grab_release = false
    L20_42 = Fn_setGrabNpc
    L20_42(L21_43, L22_44, L23_45)
    L20_42 = Fn_sendEventComSb
    L20_42(L21_43, L22_44)
    L20_42 = createMizGrabNaviKillTask
    L20_42 = L20_42()
    if L21_43 == false then
      if L21_43 > L22_44 then
        L19_41 = true
        L26_48 = L22_44
        L27_49 = true
        L23_45(L24_46, L25_47, L26_48, L27_49)
        L23_45(L24_46, L25_47)
        L23_45()
      end
    end
    L20_42 = L21_43
    if L21_43 == false then
      L21_43(L22_44)
      L21_43(L22_44)
    else
      L21_43()
    end
    L21_43()
    if L21_43 == true then
      repeat
        repeat
          L21_43()
        until L21_43 == false
      until L21_43 ~= L22_44
    end
    L21_43(L22_44)
    L21_43()
    for L24_46 = 1, #L22_44 do
      L26_48 = L25_47
      L27_49 = false
      L25_47(L26_48, L27_49)
    end
  end
  L20_42 = Fn_sendEventComSb
  L20_42(L21_43)
  L20_42 = Mv_safeTaskAbort
  L20_42 = L20_42(L21_43)
  L20_42 = Fn_sendEventComSb
  L20_42(L21_43)
  L20_42 = Fn_sendEventComSb
  L20_42(L21_43)
  _ng_near_grab = false
  _grab_release = false
  L20_42 = Fn_setGrabNpc
  L20_42(L21_43, L22_44, L23_45)
  L20_42 = Fn_sendEventComSb
  L20_42(L21_43, L22_44)
  L20_42 = L1_23.isGrabbed
  L20_42 = L20_42(L21_43)
  if L20_42 == false then
    L20_42 = Fn_getDistanceToPlayer
    L20_42 = L20_42(L21_43)
    if L20_42 <= L21_43 and L19_41 == false then
      L20_42 = "sm01_02036"
      if L18_40 == false then
        L22_44(L23_45)
      end
      L22_44(L23_45)
      L22_44(L23_45)
    end
    L20_42 = Fn_naviSet
    L20_42(L21_43)
    L20_42 = Fn_getDistanceToPlayer
    L20_42 = L20_42(L21_43)
    if L20_42 > L21_43 and L19_41 == false then
      L20_42 = Fn_missionView
      L20_42(L21_43)
      L20_42 = waitSeconds
      L20_42(L21_43)
    end
    L20_42 = playerNearWait
    L20_42(L21_43)
  end
  L20_42 = Fn_naviKill
  L20_42()
  L20_42 = Fn_tutorialCaptionKill
  L20_42()
  L20_42 = L13_35.setActive
  L20_42(L21_43, L22_44)
  L20_42 = updateCatWarp
  L20_42(L21_43, L22_44, L23_45, L24_46)
  _ng_near_grab = false
  _grab_release = false
  L20_42 = Fn_setGrabNpc
  L20_42(L21_43, L22_44, L23_45)
  L20_42 = L13_35.setActive
  L20_42(L21_43, L22_44)
  L20_42 = Fn_missionView
  L20_42(L21_43)
  L20_42 = Fn_sendEventComSb
  L20_42(L21_43, L22_44)
  L20_42 = waitSeconds
  L20_42(L21_43)
  L20_42 = L1_23.isGrabbed
  L20_42 = L20_42(L21_43)
  if L20_42 == false then
    L20_42 = Fn_naviSet
    L20_42(L21_43)
  end
  while true do
    L20_42 = L1_23.isGrabbed
    L20_42 = L20_42(L21_43)
    if L20_42 == false then
      L20_42 = wait
      L20_42()
    end
  end
  L20_42 = updateCatWarp
  L26_48 = true
  L20_42(L21_43, L22_44, L23_45, L24_46, L25_47, L26_48)
  L20_42 = findGameObject2
  L20_42 = L20_42(L21_43, L22_44)
  L20_42 = L20_42.getWorldPos
  L20_42 = L20_42(L21_43)
  L8_30 = L20_42
  L20_42 = findGameObject2
  L20_42 = L20_42(L21_43, L22_44)
  L20_42 = L20_42.getWorldPos
  L20_42 = L20_42(L21_43)
  L9_31 = L20_42
  L20_42 = Vector
  L20_42 = L20_42(L21_43, L22_44, L23_45)
  sensor_pos = L20_42
  L20_42 = getCatWarpAreaSize
  L20_42 = L20_42(L21_43, L22_44)
  L10_32 = L20_42
  L20_42 = createCatWarpSensor
  L20_42 = L20_42(L21_43, L22_44, L23_45, L24_46)
  L11_33 = L20_42
  L20_42 = createCatWarpSensor
  L20_42 = L20_42(L21_43, L22_44, L23_45, L24_46)
  L12_34 = L20_42
  L20_42 = Fn_tutorialCaptionKill
  L20_42()
  L20_42 = Fn_naviKill
  L20_42()
  L20_42 = Fn_pcSensorOn
  L20_42(L21_43)
  L20_42 = Fn_pcSensorOn
  L20_42(L21_43)
  L20_42 = findGameObject2
  L20_42 = L20_42(L21_43, L22_44)
  L21_43(L22_44, L23_45)
  L21_43(L22_44, L23_45)
  L21_43(L22_44, L23_45)
  L21_43(L22_44)
  while true do
    if L22_44 == true then
      _grab_release = true
      L22_44(L23_45, L24_46, L25_47)
      if L22_44 == true then
        if L21_43 == false then
          L22_44(L23_45)
          L22_44(L23_45)
        end
      elseif L22_44 ~= true then
        if L22_44 == false and L21_43 == true then
          L22_44(L23_45)
          L22_44(L23_45)
        end
        else
          _grab_release = false
        end
        L22_44()
      end
  end
  _ng_near_grab = true
  L22_44(L23_45, L24_46, L25_47)
  L22_44(L23_45, L24_46)
  L22_44()
  L22_44()
  L22_44(L23_45)
  L22_44()
  L26_48 = false
  L22_44(L23_45, L24_46, L25_47, L26_48)
  sensor_pos = L22_44
  L26_48 = 100
  L27_49 = 110
  L26_48 = L11_33
  L11_33 = L22_44
  L26_48 = 80
  L27_49 = 90
  L26_48 = L12_34
  L12_34 = L22_44
  for L25_47 = 1, #L23_45 do
    L26_48 = _enmgen_hdl
    L26_48 = L26_48[L25_47]
    L27_49 = L26_48
    L26_48 = L26_48.requestAllEnemyKill
    L26_48(L27_49)
  end
  L22_44(L23_45, L24_46)
  for L26_48 = 0, 30 do
    L28_50 = L1_23
    L27_49 = L1_23.isFall
    L27_49 = L27_49(L28_50)
    if L27_49 == false then
      L28_50 = L2_24
      L27_49 = L2_24.getWorldPos
      L27_49 = L27_49(L28_50)
      L28_50 = L1_23.findArea
      L28_50 = L28_50(L1_23, L27_49)
      if L28_50 ~= nil and L28_50:getName() == "pi2_a_05_01" then
        L28_50:appendChild(L1_23)
        L1_23:setPos(Vector(0, 0, 0))
        L2_24:setWorldPos(L27_49)
        L2_24:setForceMove()
        break
      end
    end
    L27_49 = waitSeconds
    L28_50 = 0.1
    L27_49(L28_50)
  end
  L6_28 = L23_45
  L7_29 = L23_45
  if L22_44 == false then
    L23_45(L24_46, L25_47)
  end
  L23_45(L24_46)
  L23_45(L24_46)
  L23_45(L24_46, L25_47)
  L26_48 = false
  L27_49 = false
  L28_50 = "locator2_navi_land_04"
  L23_45(L24_46, L25_47, L26_48, L27_49, L28_50, true)
  L8_30 = L23_45
  L9_31 = L23_45
  L26_48 = L9_31.y
  L26_48 = L8_30.z
  L27_49 = L9_31.z
  L26_48 = L26_48 + L27_49
  L26_48 = L26_48 / 2
  sensor_pos = L23_45
  L10_32 = L23_45
  L26_48 = "catWarpSensor"
  L27_49 = L11_33
  L11_33 = L23_45
  L26_48 = L10_32.x
  L26_48 = L26_48 - 20
  L27_49 = L10_32.y
  L27_49 = L27_49 - 20
  L28_50 = L10_32.z
  L28_50 = L28_50 - 20
  L26_48 = "catWarpWarningSensor"
  L27_49 = L12_34
  L12_34 = L23_45
  L23_45(L24_46)
  if L23_45 ~= nil then
    L23_45(L24_46)
  end
  L23_45(L24_46)
  while true do
    if L23_45 == true then
      L26_48 = L23_45
      L27_49 = findGameObject2
      L28_50 = "Node"
      L27_49 = L27_49(L28_50, "locator2_navi_land_04")
      L28_50 = L24_46
      L25_47(L26_48, L27_49, L28_50, true)
      L26_48 = "requestBrokenCountReset"
      L25_47(L26_48)
      while true do
        L26_48 = isRetry
        L27_49 = RETRY_BREAK_MAX
        L28_50 = L26_48(L27_49)
        if L26_48 == true then
          retry(false, "locator2_resetpos_c_01", "locator2_miz_c_02", false, L27_49, L28_50)
          break
        end
        if Mv_isWaitPhase() ~= false then
          if L25_47 == false and Fn_getDistanceToPlayer("pccubesensor2_arrive_land_04") < 180 then
            Fn_captionViewWait("sm01_02026")
            L0_22:setAutoRevirthSwitch(false)
          end
          wait()
        end
      end
      L26_48 = wait
      L26_48()
    end
  end
  L23_45(L24_46)
  L23_45(L24_46)
  L26_48 = false
  L27_49 = false
  L28_50 = "locator2_navi_land_04"
  L23_45(L24_46, L25_47, L26_48, L27_49, L28_50)
  sensor_pos = L23_45
  L26_48 = 90
  L27_49 = 120
  L28_50 = 130
  L26_48 = "catWarpSensor"
  L27_49 = L11_33
  L11_33 = L23_45
  L26_48 = 70
  L27_49 = 100
  L28_50 = 110
  L26_48 = "catWarpWarningSensor"
  L27_49 = L12_34
  L12_34 = L23_45
  L23_45(L24_46, L25_47)
  L23_45(L24_46)
  L23_45(L24_46, L25_47)
  L23_45(L24_46)
  L23_45(L24_46)
  L23_45(L24_46, L25_47)
  while true do
    if L24_46 < L25_47 then
      if L24_46 == 1 then
        if L24_46 == false then
          L24_46(L25_47)
          L23_45[1] = true
        end
      end
      if L24_46 == 5 then
        if L24_46 == false then
          L24_46(L25_47)
          L23_45[2] = true
        end
      end
      L24_46()
    end
  end
  L24_46(L25_47)
  L24_46(L25_47)
  L24_46(L25_47)
  L24_46(L25_47)
  L24_46(L25_47)
  L24_46(L25_47)
  L4_26 = L24_46
  L5_27 = L24_46
  L24_46(L25_47)
  L26_48 = true
  L24_46(L25_47, L26_48)
  L24_46()
  L24_46()
  L24_46()
  L24_46()
end
function Finalize()
  local L0_65, L1_66
end
function client_sensor_OnLeave(A0_67)
  _grab_cap_wait = GRAB_CAPTION_WAIT
  if _is_grab_guide == true and Fn_findNpc(MIZ_ID):isGrabbed() == false then
    Fn_captionView("sm01_02031")
  end
end
function mizArea3OutGrabReleaseCaption()
  Fn_captionView("sm01_02039")
end
function pccubesensor2_can_see_land_02_OnEnter()
  if Fn_findNpc(MIZ_ID):isGrabbed() == true then
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_can_see_land_03_OnEnter()
  if Fn_findNpc(MIZ_ID):isGrabbed() == true then
    if _land_03_near_flag == false then
      mizArea3GrabReleaseCaption()
    end
    _land_03_near_flag = true
    _area3_next_area_in = true
    Fn_pcSensorOff("pccubesensor2_can_see_land_03")
    viewTarget(findGameObject2("Node", "locator2_navi_land_03"), 0.5)
  end
end
function pccubesensor2_can_see_land_03_OnLeave()
  local L0_68, L1_69
  _area3_next_area_in = false
end
function mizArea3GrabReleaseCaption()
  Fn_captionView("sm01_02033")
end
function pccubesensor2_arrive_land_03_OnEnter()
  _is_take_down_inside = true
  if _land_03_near_flag == true and Fn_findNpc(MIZ_ID):isGrabbed() == true then
    Fn_captionView("sm01_09018", 0)
  end
end
function pccubesensor2_arrive_land_03_OnLeave()
  Fn_captionViewEnd()
  _is_take_down_inside = false
  if _land_03_near_flag == true and Fn_findNpc(MIZ_ID):isGrabbed() == true then
    setNaviAndView(findGameObject2("Node", "locator2_navi_land_03"), 0.5)
  end
end
function pccubesensor2_arrive_land_04_OnEnter()
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function catWarpSensor_OnLeave()
  local L0_70, L1_71
  _cat_warp_request_flag = true
end
function catWarpWarningSensor_OnLeave()
  local L0_72, L1_73
  _cat_warp_request_warning_flag = true
end
function commonDeadEnemy(A0_74)
  _is_enemy_alive[A0_74] = false
  if A0_74 == "enemy01" or A0_74 == "enemy02" then
    Fn_sendEventComSb("endEnemyAttackMiz")
  end
end
function retry(A0_75, A1_76, A2_77, A3_78, A4_79, A5_80)
  local L6_81, L7_82
  L6_81 = Fn_findNpc
  L7_82 = MIZ_ID
  L6_81 = L6_81(L7_82)
  L7_82 = Fn_findNpcPuppet
  L7_82 = L7_82(L6_81)
  A3_78 = A3_78 or false
  _is_retrying = true
  Fn_sendEventComSb("endEscapeEnemy")
  Fn_sendEventComSb("endOreMining")
  Fn_blackout()
  setUserCtrlOn(false)
  waitSeconds(1)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  _miz_is_dead = false
  _is_attacked = false
  Fn_sendEventComSb("clearMizBattleJudge")
  clearMizFallFlag()
  Fn_resetPcPos(A1_76)
  waitSeconds(0.5)
  if A0_75 == true then
    invokeTask(function()
      local L0_83, L2_84, L3_85
      for _FORV_3_ = 1, #L2_84 do
        _enmgen_hdl[_FORV_3_]:requestAllEnemyKill()
        _enmgen_hdl[_FORV_3_]:requestPrepare()
        while not _enmgen_hdl[_FORV_3_]:isPrepared() and 100 - 1 ~= 0 do
          wait()
        end
        _enmgen_hdl[_FORV_3_]:requestSpawn()
      end
    end)
    for _FORV_11_, _FORV_12_ in pairs(enmgen2_02_01.spawnSet) do
      _is_enemy_alive[_FORV_12_.name] = true
    end
  end
  if A4_79 == false and A5_80 == false then
    Fn_sendEventComSb("requestOreSpawn", true)
    Fn_sendEventComSb("requestBrokenCountReset")
    Fn_sendEventComSb("requestClearCounter")
    Fn_sendEventComSb("setCounterMax", TARGET_MAX)
  end
  if A2_77 ~= nil then
    Fn_warpNpc(MIZ_ID, A2_77)
    if A3_78 == true then
      if A4_79 == false and A5_80 == false then
        Player:setGrabExceptionalObject({
          MIZ_ID
        })
        Fn_setGrabNpc(L6_81, false, _grab_release)
        while Player:setGrabObject(L7_82) == false do
          wait()
        end
        Player:setGrabExceptionalObject({})
      end
    else
      Fn_setGrabNpc(L6_81, true, true)
    end
  end
  Fn_fadein()
  setUserCtrlOn(true)
  _is_retrying = false
  Fn_sendEventComSb("retryHintCaption")
end
