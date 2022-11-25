import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_next_phase = false
_puppet_tbl = {}
_hdl_tbl = {}
_is_area_distant = false
_box_hdl_tbl = {}
_event_motion_table = {
  fight_in = "kit01_stay_fighting_in_00",
  fighting = "kit01_stay_fighting_00",
  lookaround = "kit01_lookaround_00"
}
_suspect_motion_table = {
  run_afraid_00 = "man01_run_afraid_00",
  scared_in = "man01_scared_in_00",
  scared = "man01_scared_00",
  scared_out = "man01_scared_out_00"
}
_ship_hdl = nil
enmgen2_change_enemy = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "sm36_enemy_01",
      type = "gorotuki04",
      locator = "locator_enemy_01",
      use_fall = true
    },
    {
      name = "sm36_enemy_02",
      type = "gorotuki05",
      locator = "locator_enemy_02",
      use_fall = true
    },
    {
      name = "sm36_enemy_03",
      type = "gorotuki04",
      locator = "locator_enemy_03",
      use_fall = true
    },
    {
      name = "sm36_enemy_04",
      type = "gorotuki05",
      locator = "locator_enemy_04",
      use_fall = true
    },
    {
      name = "sm36_enemy_05",
      type = "gorotuki04",
      locator = "locator_enemy_05",
      use_fall = true
    },
    {
      name = "sm36_enemy_06",
      type = "gorotuki05",
      locator = "locator_enemy_06",
      use_fall = true
    },
    {
      name = "sm36_enemy_07",
      type = "gorotuki04",
      locator = "locator_enemy_07",
      use_fall = true
    },
    {
      name = "sm36_enemy_08",
      type = "gorotuki05",
      locator = "locator_enemy_08",
      use_fall = true
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
    print("\230\173\187\227\130\147\227\129\160NPC\227\129\174\229\144\141\229\137\141\227\129\175\239\188\159", A1_11:getName())
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    print("\230\149\181\227\130\146\230\146\131\231\160\180\239\188\136\229\128\146\227\129\151\227\129\159\239\188\137", A0_10:getSpecTable().enemyDeadNum)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
function Initialize()
  local L0_17
  L0_17 = {
    {
      name = "sm36_organization_01",
      type = "thug04",
      node = "locator2_organization_d_01",
      start = true
    },
    {
      name = "sm36_organization_02",
      type = "thug05",
      node = "locator2_organization_d_02"
    },
    {
      name = "sm36_organization_03",
      type = "thug04",
      node = "locator2_organization_d_03",
      color_variation = 1,
      start = true
    },
    {
      name = "sm36_organization_04",
      type = "thug05",
      node = "locator2_organization_d_04",
      color_variation = 1,
      start = true
    },
    {
      name = "sm36_organization_05",
      type = "thug04",
      node = "locator2_organization_d_05",
      hair_variation = 1,
      start = true
    },
    {
      name = "sm36_organization_06",
      type = "thug05",
      node = "locator2_organization_d_06",
      hair_variation = 1,
      start = true
    },
    {
      name = "sm36_organization_07",
      type = "thug04",
      node = "locator2_organization_d_07",
      color_variation = 1,
      hair_variation = 1,
      start = true
    },
    {
      name = "sm36_organization_08",
      type = "thug05",
      node = "locator2_organization_d_08",
      color_variation = 1,
      hair_variation = 1,
      start = true
    },
    {
      name = "sm36_suspect",
      type = "man26",
      node = "locator2_suspect_d",
      reset = false,
      attach = false
    },
    {
      name = "sm36_gurigo_01",
      type = "mcgri",
      node = "locator2_gurigo_d_01",
      active = false,
      attach = false,
      use_gravity = false
    },
    {
      name = "sm36_gurigo_02",
      type = "mcgri",
      node = "locator2_gurigo_d_02",
      active = false,
      attach = false,
      use_gravity = false
    },
    {
      name = "sm36_gurigo_03",
      type = "mcgri",
      node = "locator2_gurigo_d_03",
      active = false,
      attach = false,
      use_gravity = false
    },
    {
      name = "sm36_burubosa",
      type = "bul01",
      node = "locator2_burubosa",
      active = false,
      attach = false
    },
    {
      name = "sm36_police_01",
      type = "man31",
      node = "locator2_police_01",
      active = false,
      attach = false
    },
    {
      name = "sm36_police_02",
      type = "man31",
      node = "locator2_police_02",
      active = false,
      attach = false
    },
    {
      name = "sm36_police_03",
      type = "man31",
      node = "locator2_police_03",
      active = false,
      attach = false
    },
    {
      name = "sm36_police_04",
      type = "man31",
      node = "locator2_police_04",
      active = false,
      attach = false
    }
  }
  Fn_setupNpc(L0_17)
  for _FORV_4_, _FORV_5_ in pairs(L0_17) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _puppet_tbl.sm36_client = Fn_findNpcPuppet("sm36_client")
  _hdl_tbl.sm36_client = Fn_findNpc("sm36_client")
  _sdemo_cut01 = SDemo.create("sm36_d_cut01")
  _sdemo_cut02 = SDemo.create("sm36_d_cut02")
  Fn_pcSensorOff("pccubesensor2_area_distant_d")
  Fn_pcSensorOff("pccubesensor2_catwarp_d_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_d_02")
  Fn_sensorOff("cubesensor2_enemy_fall_d_01")
end
function Ingame()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37, L20_38, L21_39, L22_40, L23_41, L24_42, L25_43, L26_44, L27_45, L28_46, L29_47, L30_48, L31_49
  L0_18 = {
    L1_19,
    L2_20,
    L3_21,
    L4_22,
    L5_23,
    L6_24,
    L7_25,
    L8_26
  }
  L1_19 = {}
  L1_19.name = "sm36_organization_01"
  L1_19.type = "thug04"
  L1_19.node = "locator2_organization_d_01"
  L1_19.start = true
  L2_20 = {}
  L2_20.name = "sm36_organization_02"
  L2_20.type = "thug05"
  L2_20.node = "locator2_organization_d_02"
  L2_20.start = true
  L3_21.name = "sm36_organization_03"
  L3_21.type = "thug04"
  L3_21.node = "locator2_organization_d_03"
  L3_21.color_variation = 1
  L3_21.start = true
  L4_22.name = "sm36_organization_04"
  L4_22.type = "thug05"
  L4_22.node = "locator2_organization_d_04"
  L4_22.color_variation = 1
  L4_22.start = true
  L5_23.name = "sm36_organization_05"
  L5_23.type = "thug04"
  L5_23.node = "locator2_organization_d_05"
  L5_23.hair_variation = 1
  L5_23.start = true
  L6_24.name = "sm36_organization_06"
  L6_24.type = "thug05"
  L6_24.node = "locator2_organization_d_06"
  L6_24.hair_variation = 1
  L6_24.start = true
  L7_25.name = "sm36_organization_07"
  L7_25.type = "thug04"
  L7_25.node = "locator2_organization_d_07"
  L7_25.color_variation = 1
  L7_25.hair_variation = 1
  L7_25.start = true
  L8_26.name = "sm36_organization_08"
  L8_26.type = "thug05"
  L8_26.node = "locator2_organization_d_08"
  L8_26.color_variation = 1
  L8_26.hair_variation = 1
  L8_26.start = true
  L1_19 = findGameObject2
  L2_20 = "EnemyGenerator"
  L1_19 = L1_19(L2_20, L3_21)
  L2_20 = {}
  for L6_24 = 1, #L4_22 do
    L2_20[L6_24] = false
  end
  if L3_21 then
    L3_21(L4_22)
    _box_hdl_tbl = L3_21
    L3_21()
  else
    L3_21(L4_22)
    L3_21()
  end
  L11_29 = "bg2_box_ms_02_d_08"
  for L8_26, L9_27 in L5_23(L6_24) do
    L11_29 = "Node"
    L12_30 = L9_27
    L4_22[L8_26] = L10_28
    L11_29 = L10_28
    L12_30 = false
    L10_28(L11_29, L12_30)
  end
  for L11_29, L12_30 in L8_26(L9_27) do
    L13_31 = findGameObject2
    L14_32 = "Gem"
    L15_33 = L12_30
    L13_31 = L13_31(L14_32, L15_33)
    L6_24[L11_29] = L13_31
    L13_31 = findGameObject2
    L14_32 = "Gem"
    L15_33 = L12_30
    L13_31 = L13_31(L14_32, L15_33)
    L7_25[L11_29] = L13_31
    L13_31 = print
    L14_32 = "\227\130\184\227\130\167\227\131\160\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\231\162\186\228\191\157"
    L13_31(L14_32)
  end
  L8_26(L9_27, L10_28)
  L11_29 = false
  L8_26(L9_27, L10_28, L11_29)
  _ship_hdl = L8_26
  if L8_26 == nil then
    L8_26(L9_27, L10_28)
    repeat
      _ship_hdl = L8_26
      L8_26()
    until L8_26 ~= nil
    L11_29 = "Node"
    L12_30 = "locator2_ship_d"
    L11_29 = L10_28
    L31_49 = L10_28(L11_29)
    L8_26(L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37, L20_38, L21_39, L22_40, L23_41, L24_42, L25_43, L26_44, L27_45, L28_46, L29_47, L30_48, L31_49, L10_28(L11_29))
    L8_26(L9_27)
  end
  L8_26(L9_27)
  for L11_29, L12_30 in L8_26(L9_27) do
    L13_31 = _hdl_tbl
    L14_32 = L12_30.name
    L13_31 = L13_31[L14_32]
    L14_32 = L13_31
    L13_31 = L13_31.changeEnemy
    L13_31(L14_32)
    L13_31 = _hdl_tbl
    L14_32 = L12_30.name
    L13_31 = L13_31[L14_32]
    L14_32 = L13_31
    L13_31 = L13_31.setEnemyGenerator
    L15_33 = L1_19
    L13_31(L14_32, L15_33)
    L13_31 = _hdl_tbl
    L14_32 = L12_30.name
    L13_31 = L13_31[L14_32]
    L14_32 = L13_31
    L13_31 = L13_31.isEnemy
    L13_31 = L13_31(L14_32)
    if L13_31 then
      L13_31 = print
      L14_32 = "\227\130\168\227\131\141\227\131\159\227\131\188\227\129\171\227\129\170\227\129\163\227\129\166\227\130\139"
      L15_33 = L11_29
      L13_31(L14_32, L15_33)
    else
      L13_31 = print
      L14_32 = "\227\130\168\227\131\141\227\131\159\227\131\188\227\129\171\227\129\170\227\129\163\227\129\166\227\129\170\227\129\132\239\188\129"
      L15_33 = L11_29
      L13_31(L14_32, L15_33)
    end
  end
  L8_26()
  L8_26()
  L8_26(L9_27)
  L8_26(L9_27)
  L8_26(L9_27)
  L8_26(L9_27)
  L8_26(L9_27)
  L8_26(L9_27)
  L11_29 = 0
  L12_30 = false
  L13_31 = false
  L14_32 = false
  L15_33 = {}
  L16_34 = invokeTask
  function L17_35()
    while not _next_phase do
      if L10_28 > 0 and not L12_30 then
        waitSeconds(1)
        L10_28 = L10_28 - 1
      elseif L10_28 == 0 then
        L12_30 = true
      end
      wait()
    end
  end
  L16_34(L17_35)
  L16_34 = invokeTask
  function L17_35()
    local L0_50, L1_51, L2_52, L3_53
    L0_50 = {}
    L0_50.isStop = true
    L0_50.animBlendDuration = 0.1
    while true do
      L1_51 = _next_phase
      if not L1_51 then
        L1_51 = L10_28
        if L1_51 > 0 then
          L1_51 = L12_30
          if not L1_51 then
            L1_51 = 5
            L2_52 = math
            L2_52 = L2_52.floor
            L3_53 = L10_28
            L3_53 = L3_53 / (L9_27 / L1_51)
            L2_52 = L2_52(L3_53)
            L2_52 = L1_51 - L2_52
            L3_53 = L11_29
            if L3_53 ~= L2_52 then
              L11_29 = L2_52
              L3_53 = {
                {
                  pos = string.format("locator2_suspect_escape_path_d_%02d", L2_52)
                }
              }
              Fn_playMotionNpc("sm36_suspect", "scared_out_00", true, L0_50)
              Fn_moveNpc("sm36_suspect", L3_53, {
                noTurn = true,
                anim_run = "man01_run_afraid_00",
                runLength = -1
              }, {goalDirection = false})
              repeat
                wait()
              until _hdl_tbl.sm36_suspect:isMoveEnd()
              Fn_playMotionNpc("sm36_suspect", "scared_in_00", false, L0_50)
              invokeTask(function()
                Sound:playSE("m31_936b", 1, _hdl_tbl.sm36_suspect)
              end)
              wait()
              Fn_playMotionNpc("sm36_suspect", "scared_00", false)
            end
          end
        end
        L1_51 = wait
        L1_51()
      end
    end
  end
  L16_34(L17_35)
  L16_34 = invokeTask
  function L17_35()
    local L0_54, L1_55, L2_56, L3_57
    while true do
      if not L0_54 then
        for L3_57 = 1, #L1_55 do
          if L15_33[L3_57] ~= nil and L15_33[L3_57]:isStopped() then
            print("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136try_term\230\184\136\227\129\191\239\188\154", L3_57)
            L15_33[L3_57] = nil
          end
        end
        L0_54()
      end
    end
  end
  L16_34(L17_35)
  while true do
    L16_34 = _next_phase
    if not L16_34 then
      L16_34 = enmgen2_change_enemy
      L17_35 = L16_34
      L16_34 = L16_34.isEnemyAllDead
      L16_34 = L16_34(L17_35)
      if L16_34 then
        _next_phase = true
        break
      end
    end
    L16_34 = 0
    L17_35 = 5
    for L21_39 = 1, #L19_37 do
      if L22_40 ~= nil then
        if not L22_40 then
          L16_34 = L16_34 + 1
        end
      end
    end
    for L21_39 = 1, #L19_37 do
      if not L22_40 then
        if L22_40 then
          L16_34 = L16_34 + 1
          L2_20[L21_39] = true
          if L17_35 > L16_34 then
            for L25_43 = 1, 10 do
              L26_44 = Sound
              L27_45 = L26_44
              L26_44 = L26_44.playSE
              L28_46 = "ene_human_rocket_hit"
              L26_44(L27_45, L28_46)
              L26_44 = Sound
              L27_45 = L26_44
              L26_44 = L26_44.playSE
              L28_46 = "ene_robot_missile_hit"
              L26_44(L27_45, L28_46)
            end
            if L22_40 ~= nil then
              L25_43 = L22_40
              L31_49 = L24_42(L25_43)
              L15_33[L21_39] = L23_41
            else
              L25_43 = L24_42
              L31_49 = L24_42(L25_43)
              L15_33[L21_39] = L23_41
            end
            L25_43 = string
            L25_43 = L25_43.format
            L26_44 = "box_%02d"
            L27_45 = L21_39
            L31_49 = L25_43(L26_44, L27_45)
            L23_41(L24_42, L25_43, L26_44, L27_45, L28_46, L29_47, L30_48, L31_49, L25_43(L26_44, L27_45))
            L13_31 = true
          end
        end
      end
    end
    if L13_31 and not L14_32 then
      L18_36(L19_37)
      L18_36(L19_37)
      L18_36(L19_37)
      L14_32 = true
    end
    if L12_30 then
      L18_36(L19_37)
      L18_36(L19_37, L20_38)
      L19_37(L20_38)
      L19_37(L20_38, L21_39, L22_40, L23_41)
      L19_37(L20_38)
      L19_37(L20_38)
      L20_38(L21_39, L22_40)
      L20_38(L21_39, L22_40)
      L20_38(L21_39)
      L20_38(L21_39, L22_40)
      L12_30 = false
      L11_29 = 0
      for L23_41 = 1, #L21_39 do
        L2_20[L23_41] = false
      end
      L15_33 = L20_38
      L20_38.enemyDeadNum = 0
      L20_38(L21_39)
    end
    L18_36()
  end
  L16_34 = print
  L17_35 = "\227\130\164\227\131\179\227\130\178\227\131\188\227\131\160\231\181\130\227\130\143\227\129\163\227\129\159"
  L16_34(L17_35)
  L16_34 = waitSeconds
  L17_35 = 1.3
  L16_34(L17_35)
  L16_34 = Fn_captionViewWait
  L17_35 = "sm36_03004"
  L16_34(L17_35)
  L16_34 = 5
  L17_35 = 1
  for L22_40 = 1, L16_34 do
    L25_43 = "Node"
    L26_44 = string
    L26_44 = L26_44.format
    L27_45 = "locator2_suspect_escape_path_d_%02d"
    L28_46 = L22_40
    L31_49 = L26_44(L27_45, L28_46)
    L25_43 = L24_42
    L25_43 = Fn_get_distance
    L26_44 = L23_41
    L27_45 = L24_42
    L25_43 = L25_43(L26_44, L27_45)
    if L18_36 > L25_43 then
      L17_35 = L22_40
    end
  end
  L20_38(L21_39, L22_40)
  L20_38()
  L20_38(L21_39)
  L20_38(L21_39)
  L20_38(L21_39, L22_40, L23_41)
  L20_38(L21_39)
  L20_38(L21_39)
  L20_38(L21_39)
  L21_39(L22_40)
  L21_39(L22_40)
  L25_43 = {}
  L25_43.runLength = -1
  suspect_move_task = L22_40
  L23_41.pos = "locator2_escape_cam_d_01"
  L23_41.time = 1.5
  L24_42.pos = "locator2_escape_aim_d_01"
  L24_42.time = 1.5
  L25_43 = L24_42
  L26_44 = L22_40
  L27_45 = L23_41
  L24_42(L25_43, L26_44, L27_45)
  L25_43 = _puppet_tbl
  L25_43 = L25_43.sm36_suspect
  L26_44 = L25_43
  L25_43 = L25_43.getWorldPos
  L25_43 = L25_43(L26_44)
  L26_44 = findGameObject2
  L27_45 = "Node"
  L28_46 = "locator2_suspect_capture_path_d_02"
  L26_44 = L26_44(L27_45, L28_46)
  L27_45 = L26_44
  L26_44 = L26_44.getWorldPos
  L31_49 = L26_44(L27_45)
  L25_43 = 5
  while L24_42 > L25_43 do
    L26_44 = Fn_get_distance
    L27_45 = _puppet_tbl
    L27_45 = L27_45.sm36_suspect
    L28_46 = L27_45
    L27_45 = L27_45.getWorldPos
    L27_45 = L27_45(L28_46)
    L28_46 = findGameObject2
    L29_47 = "Node"
    L30_48 = "locator2_suspect_capture_path_d_02"
    L28_46 = L28_46(L29_47, L30_48)
    L29_47 = L28_46
    L28_46 = L28_46.getWorldPos
    L31_49 = L28_46(L29_47)
    L26_44 = L26_44(L27_45, L28_46, L29_47, L30_48, L31_49, L28_46(L29_47))
    L26_44 = wait
    L26_44()
  end
  L26_44 = _sdemo_cut02
  L27_45 = L26_44
  L26_44 = L26_44.set
  L28_46 = "locator2_capture_cam_d_02"
  L29_47 = "locator2_capture_aim_d_02"
  L26_44(L27_45, L28_46, L29_47)
  L26_44 = _sdemo_cut02
  L27_45 = L26_44
  L26_44 = L26_44.play
  L26_44(L27_45)
  L26_44 = waitSeconds
  L27_45 = 0.2
  L26_44(L27_45)
  L26_44 = Fn_warpNpc
  L27_45 = "sm36_client"
  L28_46 = "locator2_client_warp_pos_d_01"
  L26_44(L27_45, L28_46)
  L26_44 = Fn_findNpc
  L27_45 = "sm36_client"
  L26_44 = L26_44(L27_45)
  L27_45 = L26_44
  L26_44 = L26_44.setSightParam
  L28_46 = {}
  L28_46.valid = true
  L29_47 = _puppet_tbl
  L29_47 = L29_47.sm36_suspect
  L28_46.target = L29_47
  L29_47 = Vector
  L30_48 = 0
  L31_49 = 1.5
  L29_47 = L29_47(L30_48, L31_49, 0)
  L28_46.targetOffset = L29_47
  L28_46.watchTarget = true
  L28_46.forceTarget = true
  L26_44(L27_45, L28_46)
  L26_44 = Fn_moveNpc
  L27_45 = "sm36_client"
  L28_46 = {L29_47}
  L29_47 = {}
  L29_47.pos = "locator2_client_capture_path_d_01"
  L29_47 = {}
  L29_47.runLength = -1
  L30_48 = {}
  L30_48.goalDirection = false
  L26_44 = L26_44(L27_45, L28_46, L29_47, L30_48)
  client_move_task = L26_44
  L26_44 = invokeTask
  function L27_45()
    repeat
      wait()
    until _hdl_tbl.sm36_client:isMoveEnd()
    Mv_safeTaskAbort(client_move_task)
  end
  L26_44(L27_45)
  L26_44 = waitSeconds
  L27_45 = 0.2
  L26_44(L27_45)
  L26_44 = {L27_45}
  L27_45 = {}
  L27_45.pos = "locator2_capture_cam_d_03"
  L27_45.time = 0.8
  L27_45 = {L28_46}
  L28_46 = {}
  L28_46.pos = "locator2_capture_aim_d_03"
  L28_46.time = 0.8
  L28_46 = _sdemo_cut02
  L29_47 = L28_46
  L28_46 = L28_46.play
  L30_48 = L26_44
  L31_49 = L27_45
  L28_46(L29_47, L30_48, L31_49)
  L28_46 = waitSeconds
  L29_47 = 0.8
  L28_46(L29_47)
  L28_46 = Mv_safeTaskAbort
  L29_47 = suspect_move_task
  L28_46(L29_47)
  L28_46 = Fn_playMotionNpc
  L29_47 = "sm36_suspect"
  L30_48 = "surprise"
  L31_49 = false
  L28_46(L29_47, L30_48, L31_49)
  L28_46 = Fn_captionViewWait
  L29_47 = "sm36_03007"
  L28_46(L29_47)
  L28_46 = Fn_kaiwaDemoView
  L29_47 = "sm36_01600k"
  L28_46(L29_47)
  L28_46 = Fn_setNpcActive
  L29_47 = "sm36_gurigo_01"
  L30_48 = true
  L28_46(L29_47, L30_48)
  L28_46 = Fn_setNpcActive
  L29_47 = "sm36_gurigo_02"
  L30_48 = true
  L28_46(L29_47, L30_48)
  L28_46 = Fn_setNpcActive
  L29_47 = "sm36_gurigo_03"
  L30_48 = true
  L28_46(L29_47, L30_48)
  L28_46 = invokeTask
  function L29_47()
    local L0_58
    L0_58 = {
      {
        pos = "locator2_gurigo_path_d_03_01"
      },
      {
        pos = "locator2_gurigo_path_d_03_02"
      },
      {
        pos = "locator2_gurigo_path_d_03_03"
      }
    }
    Fn_moveNpc("sm36_gurigo_03", L0_58, {anim_walk_speed = 0.7})
    repeat
      wait()
    until Fn_findNpc("sm36_gurigo_03"):isMoveEnd()
    wait(5)
    Fn_turnNpc("sm36_gurigo_03", _puppet_tbl.sm36_suspect)
    Fn_playMotionNpc("sm36_gurigo_03", "stay", true)
  end
  L28_46(L29_47)
  L28_46 = waitSeconds
  L29_47 = 0.5
  L28_46(L29_47)
  L28_46 = invokeTask
  function L29_47()
    local L0_59
    L0_59 = {
      {
        pos = "locator2_gurigo_path_d_01"
      }
    }
    Fn_moveNpc("sm36_gurigo_01", L0_59)
    repeat
      wait()
    until Fn_findNpc("sm36_gurigo_01"):isMoveEnd()
    wait(5)
    Fn_turnNpc("sm36_gurigo_01", _puppet_tbl.sm36_suspect)
    Fn_playMotionNpc("sm36_gurigo_01", "stay", true)
  end
  L28_46(L29_47)
  L28_46 = invokeTask
  function L29_47()
    local L0_60
    L0_60 = {
      {
        pos = "locator2_gurigo_path_d_02"
      }
    }
    Fn_moveNpc("sm36_gurigo_02", L0_60)
    repeat
      wait()
    until Fn_findNpc("sm36_gurigo_02"):isMoveEnd()
    wait(5)
    Fn_turnNpc("sm36_gurigo_02", _puppet_tbl.sm36_suspect)
    Fn_playMotionNpc("sm36_gurigo_02", "stay", true)
  end
  L28_46(L29_47)
  L28_46 = waitSeconds
  L29_47 = 0.3
  L28_46(L29_47)
  L28_46 = {L29_47}
  L29_47 = {}
  L29_47.pos = "locator2_capture_cam_d_04"
  L29_47.time = 2.5
  L26_44 = L28_46
  L28_46 = {L29_47}
  L29_47 = {}
  L29_47.pos = "locator2_capture_aim_d_04"
  L29_47.time = 2.5
  L27_45 = L28_46
  L28_46 = _sdemo_cut02
  L29_47 = L28_46
  L28_46 = L28_46.play
  L30_48 = nil
  L31_49 = L27_45
  L28_46(L29_47, L30_48, L31_49)
  L28_46 = {}
  L28_46.degree_h = 270
  L28_46.degree_v = 180
  L28_46.in_length = 10
  L28_46.out_length = 10
  L28_46.valid = true
  L28_46.watchTarget = true
  L29_47 = Vector
  L30_48 = 0
  L31_49 = 1
  L29_47 = L29_47(L30_48, L31_49, 0)
  L28_46.targetOffset = L29_47
  L29_47 = _puppet_tbl
  L29_47 = L29_47.sm36_gurigo_03
  L28_46.target = L29_47
  L29_47 = Fn_findNpc
  L30_48 = "sm36_client"
  L29_47 = L29_47(L30_48)
  L30_48 = L29_47
  L29_47 = L29_47.setSightParam
  L31_49 = L28_46
  L29_47(L30_48, L31_49)
  L29_47 = waitSeconds
  L30_48 = 0.5
  L29_47(L30_48)
  L29_47 = _puppet_tbl
  L29_47 = L29_47.sm36_gurigo_02
  L28_46.target = L29_47
  L29_47 = Fn_findNpc
  L30_48 = "sm36_suspect"
  L29_47 = L29_47(L30_48)
  L30_48 = L29_47
  L29_47 = L29_47.setSightParam
  L31_49 = L28_46
  L29_47(L30_48, L31_49)
  L29_47 = waitSeconds
  L30_48 = 1
  L29_47(L30_48)
  L29_47 = _puppet_tbl
  L29_47 = L29_47.sm36_gurigo_01
  L28_46.target = L29_47
  L29_47 = Fn_findNpc
  L30_48 = "sm36_suspect"
  L29_47 = L29_47(L30_48)
  L30_48 = L29_47
  L29_47 = L29_47.setSightParam
  L31_49 = L28_46
  L29_47(L30_48, L31_49)
  L29_47 = waitSeconds
  L30_48 = 0.5
  L29_47(L30_48)
  L29_47 = Fn_findNpc
  L30_48 = "sm36_client"
  L29_47 = L29_47(L30_48)
  L30_48 = L29_47
  L29_47 = L29_47.setSightParam
  L31_49 = L28_46
  L29_47(L30_48, L31_49)
  L29_47 = waitSeconds
  L30_48 = 1
  L29_47(L30_48)
  L29_47 = _puppet_tbl
  L29_47 = L29_47.sm36_gurigo_02
  L28_46.target = L29_47
  L29_47 = Fn_findNpc
  L30_48 = "sm36_suspect"
  L29_47 = L29_47(L30_48)
  L30_48 = L29_47
  L29_47 = L29_47.setSightParam
  L31_49 = L28_46
  L29_47(L30_48, L31_49)
  L29_47 = waitSeconds
  L30_48 = 0.5
  L29_47(L30_48)
  L29_47 = Fn_kaiwaDemoView
  L30_48 = "sm36_01700k"
  L29_47(L30_48)
  L29_47 = {
    L30_48,
    L31_49,
    {
      name = "sm36_police_03",
      motion = "check_00"
    },
    {
      name = "sm36_police_04",
      motion = "count_00"
    }
  }
  L30_48 = {}
  L30_48.name = "sm36_police_01"
  L30_48.motion = "talk_03"
  L31_49 = {}
  L31_49.name = "sm36_police_02"
  L31_49.motion = "talk_01"
  L30_48 = {}
  function L31_49()
    local L0_61
    L0_61(L0_61)
    L0_61(L0_61, 0)
    L0_61("sm36_ship", false)
    for _FORV_3_ = 1, #_box_hdl_tbl do
      if _box_hdl_tbl[_FORV_3_] ~= nil then
        if _box_hdl_tbl[_FORV_3_]:getDynamicObject() ~= nil then
          print("\227\130\130\227\129\142\229\143\150\227\130\137\227\130\140\227\129\159\227\130\170\227\131\150\227\130\184\227\130\167\227\130\175\227\131\136\239\188\154kill")
          _box_hdl_tbl[_FORV_3_]:getDynamicObject():kill()
          _box_hdl_tbl[_FORV_3_] = nil
        else
          print("\227\130\130\227\129\142\229\143\150\227\130\137\227\130\140\227\129\166\227\129\170\227\129\132\227\130\170\227\131\150\227\130\184\227\130\167\227\130\175\227\131\136\239\188\154kill")
          _box_hdl_tbl[_FORV_3_]:kill()
          _box_hdl_tbl[_FORV_3_] = nil
        end
        print("\232\167\163\230\148\190\231\181\144\230\158\156 \226\134\146 ", _box_hdl_tbl[_FORV_3_])
      end
    end
    for _FORV_3_, _FORV_4_ in L0_61(L5_23) do
      if L6_24[_FORV_3_] ~= nil then
        L6_24[_FORV_3_]:kill()
        L6_24[_FORV_3_] = nil
        print("\227\130\184\227\130\167\227\131\160\230\182\136\227\129\151\227\129\159")
      end
    end
    L0_61("sm36_client", "locator2_client_warp_pos_d_02")
    L0_61("sm36_suspect", false)
    L0_61("sm36_gurigo", false)
    L0_61("sm36_burubosa", true)
    L0_61:setDrawModelName("cimemo01_base")
    L0_61:setCollidablePermission(false)
    L0_61:try_init()
    L0_61:waitForReady()
    L0_61:try_start()
    Fn_attachJoint(L0_61, Fn_findNpcPuppet("sm36_police_04"), "loc_l_hand")
    for _FORV_4_, _FORV_5_ in pairs(L29_47) do
      Fn_setNpcActive(_FORV_5_.name, true)
      L30_48[_FORV_4_] = Fn_repeatPlayMotion(_FORV_5_.name, _FORV_5_.motion, {
        _FORV_5_.motion
      })
    end
    for _FORV_4_, _FORV_5_ in pairs(L3_21) do
      L4_22[_FORV_4_]:setActive(true)
    end
    Fn_resetPcPos("locator2_pc_warp_pos_d_02")
    waitSeconds(2)
  end
  L31_49 = Fn_sceneConversion
  L31_49("locator2_pc_warp_pos_d_02", L19_37)
  L31_49 = Fn_userCtrlAllOff
  L31_49()
  L31_49 = waitSeconds
  L31_49(3)
  L31_49 = Fn_kaiwaDemoView
  L31_49("sm36_01800k")
  L31_49 = Fn_moveNpc
  L31_49 = L31_49("sm36_client", {
    "locator2_client_leave_path_01"
  }, {runLength = 1000, recast = true})
  client_move_task = L31_49
  L31_49 = findGameObject2
  L31_49 = L31_49("Node", "locator2_pc_turn_target_d")
  L31_49 = L31_49.getWorldPos
  L31_49 = L31_49(L31_49)
  invokeTask(function()
    Player:setLookAtIk(true, 1, L31_49)
  end)
  waitSeconds(1)
  invokeTask(function()
    Fn_turnNpc("sm36_burubosa", _puppet_tbl.sm36_client)
  end)
  waitSeconds(3)
  Fn_setNpcActive("sm36_client", false)
  Fn_kaiwaDemoView("sm36_01900k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_62, L1_63
end
function warningAreaDistant(A0_64, A1_65)
  task = invokeTask(function()
    while true do
      if _is_area_distant then
        if A1_65 ~= nil then
          if type(A1_65) == "string" then
            Fn_naviSet(findGameObject2("Node", A1_65))
          else
            Fn_naviSet(A1_65)
          end
        end
        Fn_captionViewWait(A0_64)
        while _is_area_distant do
          wait()
        end
        if A1_65 ~= nil then
          Fn_naviKill()
        end
      end
      wait()
    end
  end)
  return task
end
function warningCatWarp(A0_66, A1_67)
  invokeTask(function()
    print("================\232\173\166\229\145\138\227\130\168\227\131\170\227\130\162\231\170\129\231\160\180================")
    Player:setStay(true)
    if A0_66 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_66))
    end
    if A1_67 ~= nil then
      Fn_captionViewLock(A1_67)
    else
      Fn_captionViewLock("sm36_03008")
    end
    Player:setStay(false)
  end)
end
function createGem(A0_68, A1_69)
  local L2_70, L3_71, L4_72
  L3_71 = A0_68
  L2_70 = A0_68.getName
  L2_70 = L2_70(L3_71)
  L3_71 = createGameObject2
  L4_72 = "Gem"
  L3_71 = L3_71(L4_72)
  L4_72 = L3_71.setGemModelNo
  L4_72(L3_71, A1_69)
  L4_72 = A0_68.getWorldPos
  L4_72 = L4_72(A0_68)
  L4_72 = L4_72 + Vector(0, 0, 0)
  L3_71:setWorldPos(L4_72)
  L3_71:setForceMove()
  L3_71:setVisible(true)
  L3_71:try_init()
  L3_71:waitForReadyAsync(function()
    L3_71:try_start()
  end)
  return L3_71
end
function pccubesensor2_area_distant_OnEnter()
  local L0_73, L1_74
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_75, L1_76
  _is_area_distant = true
end
function pccubesensor2_catwarp_d_01_OnLeave()
  warningCatWarp("locator2_navi_battle_area_d")
end
function pccubesensor2_catwarp_d_02_OnLeave()
  invokeTask(function()
    if not _next_phase then
      Fn_catWarp()
    end
  end)
end
function cubesensor2_enemy_fall_01_OnEnter(A0_77, A1_78)
  local L2_79, L3_80, L4_81, L5_82, L6_83, L7_84
  for L5_82, L6_83 in L2_79(L3_80) do
    L7_84 = A1_78.getName
    L7_84 = L7_84(A1_78)
    if string.match(L7_84, "sm36_organization_") ~= nil then
      findGameObject2("EnemyGenerator", "enmgen2_change_enemy"):getSpecTable().enemyDeadNum = findGameObject2("EnemyGenerator", "enmgen2_change_enemy"):getSpecTable().enemyDeadNum + 1
      Fn_disappearNpc(L7_84)
      break
    end
  end
end
function boxExplode(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = createGameObject2
  L2_87 = "BulletShockwave"
  L1_86 = L1_86(L2_87)
  L2_87 = {}
  L2_87.type = "normal"
  L2_87.damage = 50
  L2_87.time = 0.5
  L2_87.interval = -1
  L2_87.pos = A0_85
  L2_87.radius = 1
  L3_88 = L1_86.setName
  L3_88(L1_86, "boxExplode")
  L3_88 = L1_86.attack
  L3_88(L1_86, L2_87)
  L3_88 = Fn_createEffect
  L3_88 = L3_88("bom", "ef_com_exp_02", A0_85, false)
  Fn_finishedTremEffect(L3_88, 3)
  return L3_88
end
function effectTerminate(A0_89)
  local L1_90, L2_91, L3_92, L4_93
  for L4_93, _FORV_5_ in L1_90(L2_91) do
    if A0_89[L4_93] ~= nil then
      A0_89[L4_93]:kill()
      A0_89[L4_93] = nil
      print("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\231\160\180\230\163\132:", L4_93)
    end
  end
end
function createBox()
  Fn_sendEventComSb("requestCreateBox")
  while Fn_sendEventComSb("isCreateBoxEnd") do
    wait()
  end
  _box_hdl_tbl = {}
  _box_hdl_tbl = Fn_sendEventComSb("requestBoxHandle")
  setBoxEventListener()
end
function setBoxEventListener()
  print("#_box_hdl_tbl", #_box_hdl_tbl)
  for _FORV_3_ = 1, #_box_hdl_tbl do
    _box_hdl_tbl[_FORV_3_]:setEventListener("judge", judgeCallback)
    _box_hdl_tbl[_FORV_3_]:setEventListener("dynamic", function(A0_94)
      local L1_95, L2_96
      L2_96 = A0_94
      L1_95 = A0_94.setEventListener
      L1_95(L2_96, "judge", nil)
      L2_96 = A0_94
      L1_95 = A0_94.getDynamicObject
      L1_95 = L1_95(L2_96)
      function L2_96(A0_97, A1_98, A2_99, A3_100)
        return judgeCallback(A0_97, A1_98, A2_99, A3_100)
      end
      L1_95:setEventListener("judge", L2_96)
    end)
  end
end
function judgeCallback(A0_101, A1_102, A2_103, A3_104)
  if A3_104:getName() ~= nil then
    if A3_104:getName() == "boxExplode" then
      return 0
    elseif string.find(A3_104:getName(), "sm36_organization") ~= nil then
      print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154\230\149\181\227\129\174\230\148\187\230\146\131\227\129\175\231\174\177\227\129\171\227\129\175\231\132\161\229\138\185\227\129\171\227\129\153\227\130\139 sender:" .. A3_104:getName())
      return 0
    else
      print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154\233\128\154\229\184\184\229\135\166\231\144\134 sender:" .. A3_104:getName())
      return 3
    end
  else
    print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154sender:getName\227\129\140nil")
    return 3
  end
end
