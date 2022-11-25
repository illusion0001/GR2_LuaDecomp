dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_002"
_floor_num = 2
_REQUEST_COUNT = 5
_photo = nil
_photo_no_guide = false
_isSuccess = false
_enemy_info = {}
function InitializeBody()
  local L0_0
  L0_0 = {}
  L0_0.mineOreEvdName = "mine01_ore"
  L0_0.instance_flg = true
  L0_0.manager_name = g_own:getName()
  L0_0.deploy_areas = getElectedAreaNames()
  L0_0.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_0
end
function IngameBody()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  _photo_no_guide = false
  L0_1 = {}
  _enemy_info = L0_1
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    L6_7
  }
  L1_2()
  L1_2()
  L1_2()
  L1_2(L2_3)
  _isSuccess = false
  if L1_2 then
    L1_2(L2_3)
    L1_2(L2_3)
  else
    L1_2(L2_3)
    repeat
      L1_2()
    until L1_2
    L1_2()
    L1_2(L2_3, L3_4, L4_5, L5_6)
    for L4_5, L5_6 in L1_2(L2_3) do
      L7_8 = L5_6
      L6_7(L7_8)
    end
    _total_enemy_count = 0
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2.near = 3
    L1_2.far = 20
    _photo = L2_3
    L2_3(L3_4, L4_5)
    _photoed = L2_3
    while true do
      if L2_3 then
        L4_5.near = 3
        L4_5.far = 20
        L2_3(L3_4, L4_5, L5_6, L6_7)
      end
      L2_3(L3_4)
      while true do
        if L2_3 then
          if L2_3 then
            L2_3(L3_4, L4_5)
          elseif not L2_3 then
            L2_3(L3_4)
          end
        end
        if not L2_3 then
          L2_3()
        end
      end
      _photo_no_guide = true
      if L2_3 then
        _isSuccess = false
        break
      else
        if L3_4 == "table" then
          for L7_8, L8_9 in L4_5(L5_6) do
            L9_10 = L8_9.target
            L9_10 = L9_10.getName
            L9_10 = L9_10(L9_10)
            if _enemy_info[L9_10].photoed then
              print(string.format("%s \227\129\175 \230\151\162\227\129\171\230\146\174\229\189\177\230\184\136\227\129\191\227\129\167\227\129\153\227\128\130", L9_10))
            elseif L8_9.state == kPHOTO_OK then
              print(string.format("%s \227\129\175 OK \227\129\167\227\129\153\227\128\130", L9_10))
              _enemy_info[L9_10].photoed = true
            elseif L8_9.state == kPHOTO_NEAR then
              print(string.format("%s \227\129\175\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153\227\128\130", L9_10))
            elseif L8_9.state == kPHOTO_FAR then
              print(string.format("%s \227\129\175\233\129\160\227\129\153\227\129\142\227\129\190\227\129\153\227\128\130", L9_10))
            elseif L8_9.state == kPHOTO_ANGLE then
              if L8_9.dist <= L1_2.near then
                print(string.format("%s \227\129\175\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153\227\128\130", L9_10))
              elseif L8_9.dist >= L1_2.far then
                print(string.format("%s \227\129\175\233\129\160\227\129\153\227\129\142\227\129\190\227\129\153\227\128\130", L9_10))
              else
                print(string.format("%s \227\129\175\232\167\146\229\186\166\227\129\164\227\129\141\233\129\142\227\129\142\227\129\160\227\129\145\227\129\169OK\227\129\167\227\129\153\227\128\130", L9_10))
                _enemy_info[L9_10].photoed = true
              end
            elseif L8_9.state == kPHOTO_OUT then
              print(string.format("%s \227\129\175\227\131\149\227\131\172\227\131\188\227\131\160\229\164\150\227\129\167\227\129\153\227\128\130", L9_10))
            elseif L8_9.state == kPHOTO_BACK then
              if L8_9.dist <= L1_2.near then
                print(string.format("%s \227\129\175\232\191\145\227\129\153\227\129\142\227\129\167\227\129\153\227\128\130", L9_10))
              elseif L8_9.dist >= L1_2.far then
                print(string.format("%s \227\129\175\233\129\160\227\129\153\227\129\142\227\129\190\227\129\153\227\128\130", L9_10))
              else
                print(string.format("%s \227\129\175\229\144\145\227\129\141\227\129\140\230\130\170\227\129\132\227\129\145\227\129\169OK\227\129\167\227\129\153\227\128\130", L9_10))
                _enemy_info[L9_10].photoed = true
              end
            else
              if L8_9.state == kPHOTO_NO_TERGET then
                print(string.format("%s \227\129\175\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\167\227\129\175\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\128\130", L9_10))
              else
              end
            end
          end
          L4_5(L5_6)
        end
        _total_enemy_count = L3_4
        L3_4(L4_5, L5_6)
        if L3_4 >= L4_5 then
          _isSuccess = true
          break
        end
      end
      L2_3()
    end
    L2_3(L3_4, L4_5)
    L2_3(L3_4)
    L2_3()
    if L2_3 then
      L2_3()
      repeat
        L2_3()
      until L2_3
      L2_3()
      L3_4(L4_5)
      _photo = nil
      L3_4()
      L3_4(L4_5)
    else
      L2_3()
      L2_3(L3_4, L4_5)
      L2_3(L3_4)
    end
  end
end
function FinalizeBody()
  HUD:counter99_99SetVisible(false)
  killPhoto()
  HUD:captionEnd(0)
end
function killPhoto()
  if _photo ~= nil then
    _photo:kill()
    _photo = nil
  end
end
function resultCaptionView(A0_11)
  print(string.format("resultCaptionView : %d", A0_11))
  if A0_11 > 127 then
    Sound:playSE("success")
    Fn_captionView("ic_pi_mine99_02_001")
  elseif A0_11 > 63 then
    Fn_captionView("ic_pi_mine99_02_004")
    Sound:playSE("success")
  elseif A0_11 > 31 then
    Fn_captionView("ic_pi_mine99_02_006")
    Sound:playSE("success")
  elseif A0_11 > 15 then
    Fn_captionView("ic_pi_mine99_02_011")
  elseif A0_11 == 8 then
    Fn_captionView("ic_pi_mine99_02_002")
  elseif A0_11 == 4 then
    Fn_captionView("ic_pi_mine99_02_003")
  elseif A0_11 == 2 then
    Fn_captionView("ic_pi_mine99_02_005")
  elseif A0_11 == 1 then
    Fn_captionView("ic_pi_mine99_02_007")
  else
    Fn_captionView("ic_pi_mine99_02_005")
  end
end
function requestEnemySpawn(A0_12)
  local L1_13
  L1_13 = Fn_findAreaHandle
  L1_13 = L1_13(A0_12)
  if L1_13 ~= nil then
    L1_13 = "enmgen2_"
    L1_13 = L1_13 .. A0_12
    if findGameObject2("EnemyGenerator", L1_13) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", L1_13))
      findGameObject2("EnemyGenerator", L1_13):requestSpawn()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_13))
    end
  else
    L1_13 = print
    L1_13(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_12))
  end
end
function requestEnemyKill(A0_14)
  local L1_15
  L1_15 = Fn_findAreaHandle
  L1_15 = L1_15(A0_14)
  if L1_15 ~= nil then
    L1_15 = "enmgen2_"
    L1_15 = L1_15 .. A0_14
    if findGameObject2("EnemyGenerator", L1_15) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L1_15))
      findGameObject2("EnemyGenerator", L1_15):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_15))
    end
  else
    L1_15 = print
    L1_15(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_14))
  end
end
function requestEnemyRandomSpawn(A0_16, A1_17)
  local L2_18
  L2_18 = RandI
  L2_18 = L2_18(1, A1_17)
  if findGameObject2("EnemyGenerator", A0_16) ~= nil and findGameObject2("EnemyGenerator", A0_16):getSpecTable() ~= nil and findGameObject2("EnemyGenerator", A0_16):getSpecTable().setData ~= nil then
    if L2_18 > table.maxn(findGameObject2("EnemyGenerator", A0_16):getSpecTable().setData) then
      L2_18 = table.maxn(findGameObject2("EnemyGenerator", A0_16):getSpecTable().setData)
    end
    if findGameObject2("EnemyGenerator", A0_16):getSpecTable().setData[L2_18] ~= nil then
      findGameObject2("EnemyGenerator", A0_16):getSpecTable().spawnSet = findGameObject2("EnemyGenerator", A0_16):getSpecTable().setData[L2_18]
      findGameObject2("EnemyGenerator", A0_16):requestSpawn()
    end
  else
    print("\230\149\181\233\133\141\231\189\174\227\131\134\227\131\188\227\131\150\227\131\171\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
  end
  return L2_18
end
function getPhotoedCount()
  local L0_19, L1_20, L2_21, L3_22, L4_23
  L0_19 = 0
  for L4_23, _FORV_5_ in L1_20(L2_21) do
    if _FORV_5_.photoed then
      print(string.format("%s is photoed.", L4_23))
      L0_19 = L0_19 + 1
    else
      print(string.format("%s is not photoed yet.", L4_23))
    end
  end
  return L0_19
end
function getLeftTarget()
  for _FORV_4_, _FORV_5_ in pairs(_enemy_info) do
    if _FORV_5_.photoed or _FORV_5_.dead then
    else
    end
  end
  return 0 + 1
end
enmgen2_pi_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker_strong",
        locator = "locator_pi_a_01_01",
        name = "ene001"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_01_02",
        name = "ene002"
      },
      {
        type = "runner_strong",
        locator = "locator_pi_a_01_03",
        name = "ene003"
      },
      {
        type = "imp_strong",
        locator = "locator_pi_a_01_04",
        name = "ene004"
      },
      {
        type = "guardcore_strong",
        locator = "locator_pi_a_01_05",
        name = "ene005"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_01_06",
        name = "ene006"
      },
      {
        type = "giant",
        locator = "locator_pi_a_01_07",
        name = "ene007"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_01_08",
        name = "ene008",
        ai_spawn_option = "Stalker/Stalker_Hide"
      }
    },
    {
      {
        type = "stalker_strong",
        locator = "locator_pi_a_01_01",
        name = "ene001"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_01_02",
        name = "ene002"
      },
      {
        type = "runner_strong",
        locator = "locator_pi_a_01_03",
        name = "ene003"
      },
      {
        type = "imp_strong",
        locator = "locator_pi_a_01_04",
        name = "ene004"
      },
      {
        type = "guardcore_strong",
        locator = "locator_pi_a_01_05",
        name = "ene005"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_01_06",
        name = "ene006"
      },
      {
        type = "giant",
        locator = "locator_pi_a_01_07",
        name = "ene007"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_01_09",
        name = "ene009",
        ai_spawn_option = "Gellyfish/gellyfish_strong_Hide"
      }
    }
  },
  onSpawn = function(A0_24, A1_25)
    local L2_26, L3_27
    L3_27 = A1_25
    L2_26 = A1_25.getName
    L2_26 = L2_26(L3_27)
    L3_27 = _enemy_info
    L3_27 = L3_27[L2_26]
    if L3_27 == nil then
      L3_27 = _enemy_info
      L3_27[L2_26] = {}
      L3_27 = _enemy_info
      L3_27 = L3_27[L2_26]
      L3_27.photoed = false
      L3_27 = _enemy_info
      L3_27 = L3_27[L2_26]
      L3_27.dead = false
      L3_27 = findGameObject2
      L3_27 = L3_27("Puppet", L2_26)
      if _photo:set(L3_27) then
        print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_26))
      end
    end
  end,
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectAsh = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
    _enemy_info[A1_37:getName()].dead = true
  end
}
enmgen2_pi_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_01",
      name = "ene_pi_a_03_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_02",
      name = "ene_pi_a_03_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_03",
      name = "ene_pi_a_03_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_04",
      name = "ene_pi_a_03_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_05",
      name = "ene_pi_a_03_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_06",
      name = "ene_pi_a_03_06"
    }
  },
  onUpdate = function(A0_38)
    local L1_39
  end,
  onEnter = function(A0_40)
    local L1_41
  end,
  onLeave = function(A0_42)
    local L1_43
  end,
  onPopGem = function(A0_44, A1_45)
    EnemeyDropGem(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
  end,
  onObjectDead = function(A0_48, A1_49)
  end
}
enmgen2_pi_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_01",
      name = "ene_pi_a_06_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_02",
      name = "ene_pi_a_06_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_03",
      name = "ene_pi_a_06_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_04",
      name = "ene_pi_a_06_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_05",
      name = "ene_pi_a_06_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_06",
      name = "ene_pi_a_06_06"
    }
  },
  onUpdate = function(A0_50)
    local L1_51
  end,
  onEnter = function(A0_52)
    local L1_53
  end,
  onLeave = function(A0_54)
    local L1_55
  end,
  onPopGem = function(A0_56, A1_57)
    EnemeyDropGem(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
  end,
  onObjectDead = function(A0_60, A1_61)
  end
}
enmgen2_pi_a_13 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_13_01",
      name = "ene_pi_a_13_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_13_02",
      name = "ene_pi_a_13_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_13_03",
      name = "ene_pi_a_13_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_13_04",
      name = "ene_pi_a_13_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_13_05",
      name = "ene_pi_a_13_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_13_06",
      name = "ene_pi_a_13_06"
    }
  },
  onUpdate = function(A0_62)
    local L1_63
  end,
  onEnter = function(A0_64)
    local L1_65
  end,
  onLeave = function(A0_66)
    local L1_67
  end,
  onPopGem = function(A0_68, A1_69)
    EnemeyDropGem(A0_68, A1_69)
  end,
  onObjectAsh = function(A0_70, A1_71)
  end,
  onObjectDead = function(A0_72, A1_73)
  end
}
enmgen2_pi_a_16 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_01",
      name = "ene_pi_a_16_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_02",
      name = "ene_pi_a_16_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_03",
      name = "ene_pi_a_16_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_04",
      name = "ene_pi_a_16_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_05",
      name = "ene_pi_a_16_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_06",
      name = "ene_pi_a_16_06"
    }
  },
  onUpdate = function(A0_74)
    local L1_75
  end,
  onEnter = function(A0_76)
    local L1_77
  end,
  onLeave = function(A0_78)
    local L1_79
  end,
  onPopGem = function(A0_80, A1_81)
    EnemeyDropGem(A0_80, A1_81)
  end,
  onObjectAsh = function(A0_82, A1_83)
  end,
  onObjectDead = function(A0_84, A1_85)
  end
}
enmgen2_pi_a_23 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_01",
      name = "ene_pi_a_23_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_02",
      name = "ene_pi_a_23_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_03",
      name = "ene_pi_a_23_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_04",
      name = "ene_pi_a_23_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_05",
      name = "ene_pi_a_23_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_06",
      name = "ene_pi_a_23_06"
    }
  },
  onUpdate = function(A0_86)
    local L1_87
  end,
  onEnter = function(A0_88)
    local L1_89
  end,
  onLeave = function(A0_90)
    local L1_91
  end,
  onPopGem = function(A0_92, A1_93)
    EnemeyDropGem(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
  end,
  onObjectDead = function(A0_96, A1_97)
  end
}
enmgen2_pi_a_25 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_01",
      name = "ene_pi_a_25_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_02",
      name = "ene_pi_a_25_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_03",
      name = "ene_pi_a_25_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_04",
      name = "ene_pi_a_25_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_05",
      name = "ene_pi_a_25_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_06",
      name = "ene_pi_a_25_06"
    }
  },
  onUpdate = function(A0_98)
    local L1_99
  end,
  onEnter = function(A0_100)
    local L1_101
  end,
  onLeave = function(A0_102)
    local L1_103
  end,
  onPopGem = function(A0_104, A1_105)
    EnemeyDropGem(A0_104, A1_105)
  end,
  onObjectAsh = function(A0_106, A1_107)
  end,
  onObjectDead = function(A0_108, A1_109)
  end
}
