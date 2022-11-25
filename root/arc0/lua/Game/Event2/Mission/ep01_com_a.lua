dofile("/Game/Event2/Common/HeaderCommon.lua")
import("GlobalGem")
spown_b_01 = false
spown_b_02 = false
spown_b_11 = false
spown_b_12 = false
spown_b_13 = false
spown_c_01 = false
enemy_b_01 = false
enemy_b_02 = false
enemy_b_11 = false
enemy_b_12 = false
enemy_b_13 = false
enemy_c_01 = false
enemy_kill = false
kill_end = false
mizai_after = false
sisychace_on = false
spown_after = false
jump_on = false
outrange_bool = false
outrange_bool2 = false
outrange_bool3 = false
vitalgem_get = false
fall_1st = false
fall_fast = true
semiretry = false
miniretry = false
enmgen2_ep01_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_1_01",
      name = "ep01_b_1_01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_1_02",
      name = "ep01_b_1_02"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_ep01_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_2_01",
      name = "ep01_b_2_01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_2_02",
      name = "ep01_b_2_02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_2_03",
      name = "ep01_b_2_03"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_2_04",
      name = "ep01_b_2_04"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectDead = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyDeadNum = A0_17:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
enmgen2_ep01_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_c1_01",
      name = "ep01_c_1_01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_c1_02",
      name = "ep01_c_1_02"
    }
  },
  onUpdate = function(A0_22)
    local L1_23
  end,
  onEnter = function(A0_24)
    local L1_25
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onObjectDead = function(A0_28, A1_29)
    A0_28:getSpecTable().enemyDeadNum = A0_28:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyRest = function(A0_31)
    local L1_32
    L1_32 = A0_31.spawnSet
    L1_32 = #L1_32
    L1_32 = L1_32 - A0_31.enemyDeadNum
    return L1_32
  end
}
enmgen2_ep01_b_11 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_11_01",
      name = "ep01_b_11_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_11_02",
      name = "ep01_b_11_02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_2_03",
      name = "ep01_b_2_03"
    }
  },
  onUpdate = function(A0_33)
    local L1_34
  end,
  onEnter = function(A0_35)
    local L1_36
  end,
  onLeave = function(A0_37)
    local L1_38
  end,
  onObjectDead = function(A0_39, A1_40)
    A0_39:getSpecTable().enemyDeadNum = A0_39:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_41)
    return #A0_41.spawnSet
  end,
  getEnemyRest = function(A0_42)
    local L1_43
    L1_43 = A0_42.spawnSet
    L1_43 = #L1_43
    L1_43 = L1_43 - A0_42.enemyDeadNum
    return L1_43
  end
}
enmgen2_ep01_b_12 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_12_03",
      name = "ep01_b_12_03"
    },
    {
      type = "stalker",
      locator = "locator_ene_12_04",
      name = "ep01_b_12_04"
    }
  },
  onUpdate = function(A0_44)
    local L1_45
  end,
  onEnter = function(A0_46)
    local L1_47
  end,
  onLeave = function(A0_48)
    local L1_49
  end,
  onObjectDead = function(A0_50, A1_51)
    A0_50:getSpecTable().enemyDeadNum = A0_50:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_52)
    return #A0_52.spawnSet
  end,
  getEnemyRest = function(A0_53)
    local L1_54
    L1_54 = A0_53.spawnSet
    L1_54 = #L1_54
    L1_54 = L1_54 - A0_53.enemyDeadNum
    return L1_54
  end
}
enmgen2_ep01_b_13 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_12_06",
      name = "ep01_b_12_06"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_12_07",
      name = "ep01_b_12_07"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_12_08",
      name = "ep01_b_12_08"
    },
    {
      type = "stalker",
      locator = "locator_ene_13_01",
      name = "ep01_b_13_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_13_02",
      name = "ep01_b_13_02"
    }
  },
  onUpdate = function(A0_55)
    local L1_56
  end,
  onEnter = function(A0_57)
    local L1_58
  end,
  onLeave = function(A0_59)
    local L1_60
  end,
  onObjectDead = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyRest = function(A0_64)
    local L1_65
    L1_65 = A0_64.spawnSet
    L1_65 = #L1_65
    L1_65 = L1_65 - A0_64.enemyDeadNum
    return L1_65
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_outrange2")
  Fn_pcSensorOff("pccubesensor2_outrange3")
end
function Ingame()
  repeat
    if invokeTask(function()
      repeat
        if Player:getRecentAreaName() then
          areaName = Player:getRecentAreaName()
        end
        wait()
      until false
    end) then
      if sisychace_on == true and outrange_bool == false then
        Fn_pcSensorOff("pccubesensor2_outrange")
        print("\227\130\162\227\130\166\227\131\136\227\131\172\227\131\179\227\130\184\227\130\187\227\131\179\227\130\181\227\131\188\229\136\135\227\130\138\230\155\191\227\129\136")
        Fn_pcSensorOn("pccubesensor2_outrange2")
        outrange_bool = true
      elseif (Fn_getMissionPart() == "ep01_c" or jump_on == true) and outrange_bool2 == false then
        Fn_pcSensorOff("pccubesensor2_outrange")
        Fn_pcSensorOff("pccubesensor2_outrange2")
        print("\227\130\162\227\130\166\227\131\136\227\131\172\227\131\179\227\130\184\227\130\187\227\131\179\227\130\181\227\131\188\229\136\135\227\130\138\230\155\191\227\129\136")
        Fn_pcSensorOn("pccubesensor2_outrange3")
        outrange_bool2 = true
      elseif Fn_getMissionPart() == "ep01_d" and outrange_bool3 == false then
        Fn_pcSensorOff("pccubesensor2_outrange")
        Fn_pcSensorOff("pccubesensor2_outrange2")
        Fn_pcSensorOff("pccubesensor2_outrange3")
        outrange_bool3 = true
        invokeTask(function()
          repeat
            if Player:getRecentAreaName() then
              areaName = Player:getRecentAreaName()
            end
            wait()
          until false
        end):abort()
      end
    end
    if enemy_b_01 == true and spown_b_01 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_b_01") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_b_01"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_b_01"):setEnemyMarker(false)
      end
      spown_b_01 = true
    end
    if enemy_b_02 == true and spown_b_02 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_b_02") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_b_02"):setEnemyMarker(false)
      end
      spown_b_02 = true
    end
    brain_laser = findGameObject2("EnemyBrain", "ep01_b_2_04")
    if enemy_b_11 == true and spown_b_11 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_b_11") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_b_11"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_b_11"):setEnemyMarker(false)
      end
      spown_b_11 = true
    end
    if enemy_b_12 == true and spown_b_12 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_b_12") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_b_12"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_b_12"):setEnemyMarker(false)
      end
      spown_b_12 = true
    end
    if enemy_b_13 == true and spown_b_13 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_b_13") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_b_13"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_b_13"):setEnemyMarker(false)
      end
      spown_b_13 = true
    end
    if enemy_c_01 == true and spown_c_01 == false then
      if findGameObject2("EnemyGenerator", "enmgen2_c_01") ~= nil then
        findGameObject2("EnemyGenerator", "enmgen2_c_01"):requestSpawn()
        findGameObject2("EnemyGenerator", "enmgen2_c_01"):setEnemyMarker(false)
      end
      spown_c_01 = true
    end
    if enemy_kill == true and kill_end == false then
      findGameObject2("EnemyGenerator", "enmgen2_b_01"):requestAllEnemyKill()
      findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestAllEnemyKill()
      findGameObject2("EnemyGenerator", "enmgen2_b_11"):requestAllEnemyKill()
      findGameObject2("EnemyGenerator", "enmgen2_b_12"):requestAllEnemyKill()
      findGameObject2("EnemyGenerator", "enmgen2_b_13"):requestAllEnemyKill()
      findGameObject2("EnemyGenerator", "enmgen2_c_01"):requestAllEnemyKill()
      kill_end = true
      print("\230\149\181\227\129\145\227\129\151\227\129\159")
    end
    wait()
  until false
end
function Finalize()
  local L0_66, L1_67
end
function reqestMoveArea(A0_68)
  if not _move_reqest then
    _move_reqest = true
    _move_end = false
    _lithograph_id = A0_68
    return true
  end
  return false
end
function isAreaMoveEnd()
  local L0_69, L1_70
  L0_69 = _move_end
  return L0_69
end
function b_sisyChaceon()
  sisychace_on = true
  print("\227\130\183\227\130\183\227\130\163\227\130\146\232\191\189\227\129\132\229\167\139\227\130\129\227\129\159")
end
function b_jumpon()
  jump_on = true
  print("\227\130\183\227\130\183\227\130\163\231\153\186\232\166\139\229\190\140\227\130\172\227\131\172\229\160\180\227\129\190\227\129\167\232\161\140\227\129\163\227\129\159")
end
function enemy_b_01_call()
  enemy_b_01 = true
  print("\230\149\181\229\135\186\231\143\190\227\131\149\227\131\169\227\130\176\239\188\145on")
end
function enemy_b_02_call()
  local L0_71, L1_72
  enemy_b_02 = true
end
function enemy_b_11_call()
  local L0_73, L1_74
  enemy_b_11 = true
end
function enemy_b_12_call()
  local L0_75, L1_76
  enemy_b_12 = true
end
function enemy_b_13_call()
  local L0_77, L1_78
  enemy_b_13 = true
end
function enemy_c_01_call()
  local L0_79, L1_80
  enemy_c_01 = true
end
function enemy_kill()
  enemy_kill = true
  print("\230\149\181\230\182\136\227\129\151\227\131\149\227\131\169\227\130\176\231\171\139\227\129\166\227\129\159")
end
function requestenemy(A0_81)
  if A0_81 == "enemy_b_01" then
    return enmgen2_ep01_b_01:getEnemyRest()
  elseif A0_81 == "enemy_b_02" then
    return enmgen2_ep01_b_02:getEnemyRest()
  else
    return nil
  end
end
function GemGetCallback(A0_82)
  invokeTask(function()
    if vitalgem_get == false then
      vitalgem_get = true
      print("gem=", A0_82:getName())
      if A0_82:getName() ~= nil then
        HUD:info("ep01_info_03", false)
      end
      Fn_userCtrlOff()
      repeat
        print(GameDatabase:get(ggd.Savedata__Info__ep01__ep01_info_03))
        if GameDatabase:get(ggd.Savedata__Info__ep01__ep01_info_03) == 2 then
          Fn_userCtrlOn()
          break
        end
        wait()
      until false
    end
  end)
end
function enemy_idleOn()
  print("\230\149\181\229\129\156\230\173\162")
  findGameObject2("EnemyGenerator", "enmgen2_b_01"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_b_11"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_b_12"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_b_13"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_c_01"):requestIdlingEnemy(true)
end
function enemy_idleOff()
  print("\230\149\181\229\129\156\230\173\162\232\167\163\233\153\164")
  findGameObject2("EnemyGenerator", "enmgen2_b_01"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_b_11"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_b_12"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_b_13"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_c_01"):requestIdlingEnemy(false)
end
function mizai_Talk()
  mizai_after = true
  print("\227\131\159\227\130\182\227\130\164\227\129\171\232\169\177\227\129\151\227\129\159")
end
function fall_Fast()
  fall_fast = false
  print("\227\130\172\227\131\172\229\160\180\239\188\145\227\130\146\231\153\187\227\129\163\227\129\159")
end
function b_nevi_spown()
  spown_after = true
  print("\227\131\141\227\131\180\227\130\163\229\135\186\231\143\190\227\130\146\232\166\139\227\129\159")
end
function pccubesensor2_outrange_OnLeave()
  invokeTask(function()
    if areaName then
      print("locator2_reset_" .. areaName)
      if string.find(areaName, "wa_a_") ~= nil then
        if Fn_getPlayerWorldPos().y > -35 then
          if Fn_getMissionPart() == "ep01_a" then
            if mizai_after == false then
              Fn_captionViewWait("ep01_09000")
            else
              Fn_captionViewWait("ep01_09004")
            end
          elseif Fn_getMissionPart() == "ep01_b" then
            Fn_captionViewWait("ep01_09001")
          end
        end
        Fn_setCatWarpCheckPoint("locator2_reset_bu_a_17")
      else
        Fn_setCatWarpCheckPoint("locator2_reset_" .. areaName)
      end
      Sound:playSE("pc1_009")
      print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\145")
      Fn_blackout()
      Fn_catWarpCheckPoint()
      Fn_fadein()
    end
  end)
end
function pccubesensor2_outrange2_OnLeave()
  invokeTask(function()
    if areaName then
      print("locator2_reset_" .. areaName)
      if string.find(areaName, "wa_a_06") ~= nil or string.find(areaName, "wa_a_08") ~= nil or string.find(areaName, "wa_a_11") ~= nil then
        areaName = "wa_a_07"
      elseif string.find(areaName, "wa_a_01") ~= nil and fall_fast == true then
        areaName = "bu_a_17"
      elseif string.find(areaName, "wa_a_21") ~= nil then
        areaName = "wa_a_05"
      elseif string.find(areaName, "wa_a_09") ~= nil then
        areaName = "wa_a_01"
      elseif string.find(areaName, "wa_a_10") ~= nil then
        areaName = "wa_a_01"
      end
      Fn_setCatWarpCheckPoint("locator2_reset_" .. areaName)
      Sound:playSE("pc1_009")
      print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\146")
      Fn_blackout()
      Fn_catWarpCheckPoint()
      Fn_fadein()
    end
  end)
end
function pccubesensor2_outrange3_OnLeave()
  invokeTask(function()
    if areaName then
      print("locator2_reset_" .. areaName)
      if string.find(areaName, "wa_a_06") ~= nil or string.find(areaName, "wa_a_08") ~= nil or string.find(areaName, "wa_a_11") ~= nil or string.find(areaName, "wa_a_03") ~= nil and spown_after == true then
        areaName = "wa_a_07"
      elseif string.find(areaName, "wa_a_09") ~= nil then
        areaName = "wa_a_01"
      elseif string.find(areaName, "wa_a_10") ~= nil then
        areaName = "wa_a_01"
      elseif string.find(areaName, "wa_a_21") ~= nil then
        areaName = "wa_a_05"
      elseif string.find(areaName, "wa_a_04") ~= nil and Fn_getMissionPart() == "ep01_c" then
        semiretry = true
      end
      if string.find(areaName, "wa_a_05") ~= nil and Fn_getMissionPart() == "ep01_c" then
        miniretry = true
      end
      if string.find(areaName, "wa_a_01") ~= nil then
        areaName = "wa_a_01_02"
      end
      Fn_setCatWarpCheckPoint("locator2_reset_" .. areaName)
      Sound:playSE("pc1_009")
      print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\147")
      Fn_blackout()
      enemy_idleOn()
      Fn_catWarpCheckPoint()
      Fn_fadein()
      waitSeconds(4)
      enemy_idleOff()
    end
  end)
end
function check_semiretry()
  local L0_83, L1_84
  L0_83 = semiretry
  return L0_83
end
function change_semiretry()
  local L0_85, L1_86
  semiretry = false
end
function stand_semiretry()
  local L0_87, L1_88
  semiretry = true
end
function check_miniretry()
  local L0_89, L1_90
  L0_89 = miniretry
  return L0_89
end
function change_miniretry()
  local L0_91, L1_92
  miniretry = false
end
