dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
sdemo1 = nil
enmgen2_ep16c_1 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "enemy11",
      locator = "locator2_terrorist_11",
      type = "terrorist"
    },
    {
      name = "enemy12",
      locator = "locator2_terrorist_12",
      type = "terrorist"
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
  totalAshCount = 0,
  onSpawn = function(A0_8, A1_9)
    print(A0_8:getName() .. ":onSpawn(" .. A1_9:getName() .. ")")
    A0_8:getSpecTable().totalAshCount = 0
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().totalAshCount = A0_10:getSpecTable().totalAshCount + 1
  end,
  isEnemyAllAsh = function(A0_12)
    local L2_13
    L2_13 = A0_12.totalAshCount
    if L2_13 >= #A0_12.spawnSet then
      L2_13 = true
      return L2_13
    end
    L2_13 = false
    return L2_13
  end
}
enmgen2_ep16c_2 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "enemy21",
      locator = "locator2_terrorist_21",
      type = "terrorist"
    },
    {
      name = "enemy22",
      locator = "locator2_terrorist_22",
      type = "terrorist"
    },
    {
      name = "enemy23",
      locator = "locator2_terrorist_23",
      type = "terrorist"
    },
    {
      name = "enemy24",
      locator = "locator2_terrorist_24",
      type = "terrorist"
    },
    {
      name = "enemy25",
      locator = "locator2_terrorist_25",
      type = "terrorist"
    },
    {
      name = "enemy26",
      locator = "locator2_terrorist_26",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  totalAshCount = 0,
  onSpawn = function(A0_22, A1_23)
    print(A0_22:getName() .. ":onSpawn(" .. A1_23:getName() .. ")")
    A0_22:getSpecTable().totalAshCount = 0
  end,
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().totalAshCount = A0_24:getSpecTable().totalAshCount + 1
  end,
  isEnemyAllAsh = function(A0_26)
    local L2_27
    L2_27 = A0_26.totalAshCount
    if L2_27 >= #A0_26.spawnSet then
      L2_27 = true
      return L2_27
    end
    L2_27 = false
    return L2_27
  end
}
enmgen2_ep16c_3 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "enemy31",
      locator = "locator2_terrorist_31",
      type = "terrorist"
    },
    {
      name = "enemy32",
      locator = "locator2_terrorist_32",
      type = "terrorist_rifle"
    },
    {
      name = "enemy33",
      locator = "locator2_terrorist_33",
      type = "terrorist_rifle"
    },
    {
      name = "enemy34",
      locator = "locator2_terrorist_34",
      type = "terrorist"
    }
  },
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectDead = function(A0_34, A1_35)
  end,
  totalAshCount = 0,
  onSpawn = function(A0_36, A1_37)
    print(A0_36:getName() .. ":onSpawn(" .. A1_37:getName() .. ")")
    A0_36:getSpecTable().totalAshCount = 0
  end,
  onObjectAsh = function(A0_38, A1_39)
    A0_38:getSpecTable().totalAshCount = A0_38:getSpecTable().totalAshCount + 1
  end,
  isEnemyAllAsh = function(A0_40)
    local L2_41
    L2_41 = A0_40.totalAshCount
    if L2_41 >= #A0_40.spawnSet then
      L2_41 = true
      return L2_41
    end
    L2_41 = false
    return L2_41
  end
}
enmgen2_ep16c_4 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "enemy41",
      locator = "locator2_terrorist_41",
      type = "terrorist_rifle"
    },
    {
      name = "enemy42",
      locator = "locator2_terrorist_42",
      type = "terrorist_rifle"
    },
    {
      name = "enemy43",
      locator = "locator2_terrorist_43",
      type = "terrorist"
    },
    {
      name = "enemy44",
      locator = "locator2_terrorist_44",
      type = "terrorist_rifle"
    },
    {
      name = "enemy45",
      locator = "locator2_terrorist_45",
      type = "terrorist_rifle"
    },
    {
      name = "enemy46",
      locator = "locator2_terrorist_46",
      type = "terrorist_rifle"
    },
    {
      name = "enemy47",
      locator = "locator2_terrorist_47",
      type = "terrorist_rifle"
    },
    {
      name = "enemy48",
      locator = "locator2_terrorist_48",
      type = "terrorist_rifle"
    },
    {
      name = "enemy49",
      locator = "locator2_terrorist_49",
      type = "terrorist_rifle"
    },
    {
      name = "enemy50",
      locator = "locator2_terrorist_50",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onObjectDead = function(A0_48, A1_49)
  end,
  totalAshCount = 0,
  onSpawn = function(A0_50, A1_51)
    print(A0_50:getName() .. ":onSpawn(" .. A1_51:getName() .. ")")
    A0_50:getSpecTable().totalAshCount = 0
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().totalAshCount = A0_52:getSpecTable().totalAshCount + 1
  end,
  isEnemyAllAsh = function(A0_54)
    local L2_55
    L2_55 = A0_54.totalAshCount
    if L2_55 >= #A0_54.spawnSet then
      L2_55 = true
      return L2_55
    end
    L2_55 = false
    return L2_55
  end
}
terrorist_motion = {
  stay = "man61_stay_00"
}
function Initialize()
  local L0_56
  L0_56 = {
    {
      name = "npc_terrorist_11",
      type = "man61",
      node = "locator2_terrorist_11_pos",
      attach = false,
      active = false
    },
    {
      name = "npc_terrorist_12",
      type = "man61",
      node = "locator2_terrorist_12_pos",
      attach = false,
      active = false
    },
    {
      name = "npc_terrorist_31",
      type = "man61",
      node = "locator2_terrorist_31_pos",
      attach = false,
      active = false
    },
    {
      name = "npc_terrorist_32",
      type = "man61",
      node = "locator2_terrorist_32_pos",
      attach = false,
      active = false
    },
    {
      name = "npc_terrorist_33",
      type = "man61",
      node = "locator2_terrorist_33_pos",
      attach = false,
      active = false
    },
    {
      name = "npc_terrorist_34",
      type = "man61",
      node = "locator2_terrorist_34_pos1",
      attach = false,
      active = false
    }
  }
  Fn_setupNpc(L0_56)
  for _FORV_4_, _FORV_5_ in pairs(L0_56) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    Fn_loadNpcEventMotion(_FORV_5_.name, terrorist_motion)
  end
  sdemo1 = SDemo.create("ep16_sdemo")
  RAC_startCatWarpControl("ep16_area_out", nil, "pccubesensor2_mission_area01", "pccubesensor2_mission_area02", "locator2_pc_start_pos", nil, "locator2_pc_start_pos", "ep16_02003")
end
function Ingame()
  local L0_57, L1_58, L2_59
  L0_57 = Fn_userCtrlAllOff
  L0_57()
  L0_57 = Fn_missionStart
  L0_57()
  L0_57 = findGameObject2
  L1_58 = "EnemyGenerator"
  L2_59 = "enmgen2_ep16c_1"
  L0_57 = L0_57(L1_58, L2_59)
  L1_58 = findGameObject2
  L2_59 = "EnemyGenerator"
  L1_58 = L1_58(L2_59, "enmgen2_ep16c_2")
  L2_59 = findGameObject2
  L2_59 = L2_59("EnemyGenerator", "enmgen2_ep16c_3")
  Fn_kaiwaDemoView2("ep16_00220k", function()
    if L1_58 ~= nil then
      L1_58:setVisible(true)
      L1_58:requestSpawn()
      L1_58:requestIdlingEnemy(true)
      L1_58:setEnemyMarker(false)
      sdemo1:set("locator2_sdemo1_camera_01", "locator2_sdemo1_target_01", kSDEMO_APPEND_AIM, Vector(0, 1.5, 0))
      sdemo1:play()
    end
  end, true)
  while invokeTask(function()
    waitSeconds(1.6)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_21",
        time = 0.5
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(0.4)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_22",
        time = 0.6
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    Sound:playSE("ene_human_call_m40", 1, "")
    waitSeconds(0.5)
    Fn_setNpcActive("npc_terrorist_11", false)
    Fn_setNpcActive("npc_terrorist_12", false)
    if L0_57 ~= nil then
      L0_57:setVisible(true)
      L0_57:requestSpawn()
      L0_57:requestIdlingEnemy(true)
      L0_57:setEnemyMarker(false)
    end
  end):isRunning() do
    wait()
  end
  invokeTask(function()
    waitSeconds(1.6)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_21",
        time = 0.5
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(0.4)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_22",
        time = 0.6
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    Sound:playSE("ene_human_call_m40", 1, "")
    waitSeconds(0.5)
    Fn_setNpcActive("npc_terrorist_11", false)
    Fn_setNpcActive("npc_terrorist_12", false)
    if L0_57 ~= nil then
      L0_57:setVisible(true)
      L0_57:requestSpawn()
      L0_57:requestIdlingEnemy(true)
      L0_57:setEnemyMarker(false)
    end
  end):abort()
  sdemo1:stop(1)
  RAC_missionNaviCaption("ep16_02000", nil, "ep16_02001")
  Player:setStay(false)
  Fn_userCtrlOn()
  waitSeconds(0.8)
  L0_57:requestIdlingEnemy(false)
  L0_57:setEnemyMarker(true)
  L1_58:requestIdlingEnemy(false)
  L1_58:setEnemyMarker(true)
  while not L0_57:getSpecTable():isEnemyAllAsh() or not L1_58:getSpecTable():isEnemyAllAsh() do
    wait()
  end
  Fn_userCtrlAllOff()
  if findGameObject2("EnemyGenerator", "enmgen2_ep16c_4") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):setVisible(true)
    findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):requestIdlingEnemy(true)
    findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):setEnemyMarker(false)
  end
  sdemo1:set("locator2_sdemo2_camera_01", "locator2_terrorist_31", kSDEMO_APPEND_AIM, Vector(0, 1.5, 0))
  sdemo1:play()
  Fn_resetPcPos("locator2_pc_pos_02")
  while invokeTask(function()
    waitSeconds(2.8)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_34",
        time = 0.7
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(0.4)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_43",
        time = 0.7
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(1)
    Fn_setNpcActive("npc_terrorist_31", false)
    Fn_setNpcActive("npc_terrorist_32", false)
    Fn_setNpcActive("npc_terrorist_33", false)
    Fn_setNpcActive("npc_terrorist_34", false)
    if L2_59 ~= nil then
      L2_59:setVisible(true)
      L2_59:requestSpawn()
      L2_59:requestIdlingEnemy(true)
      L2_59:setEnemyMarker(false)
    end
  end):isRunning() do
    wait()
  end
  invokeTask(function()
    waitSeconds(2.8)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_34",
        time = 0.7
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(0.4)
    sdemo1:play(nil, {
      {
        pos = "locator2_terrorist_43",
        time = 0.7
      }
    })
    while sdemo1:isPlay() do
      wait()
    end
    waitSeconds(1)
    Fn_setNpcActive("npc_terrorist_31", false)
    Fn_setNpcActive("npc_terrorist_32", false)
    Fn_setNpcActive("npc_terrorist_33", false)
    Fn_setNpcActive("npc_terrorist_34", false)
    if L2_59 ~= nil then
      L2_59:setVisible(true)
      L2_59:requestSpawn()
      L2_59:requestIdlingEnemy(true)
      L2_59:setEnemyMarker(false)
    end
  end):abort()
  sdemo1:stop(1)
  Player:setStay(false)
  Fn_userCtrlOn()
  waitSeconds(0.8)
  Fn_captionView("ep16_02002")
  L2_59:requestIdlingEnemy(false)
  L2_59:setEnemyMarker(true)
  findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):setEnemyMarker(true)
  while not L2_59:getSpecTable():isEnemyAllAsh() or not findGameObject2("EnemyGenerator", "enmgen2_ep16c_4"):getSpecTable():isEnemyAllAsh() do
    wait()
  end
  Fn_userCtrlOff()
  Fn_sendEventComSb("requestSection", "c1")
  wait()
  Fn_resetPcPos("locator2_pc_pos_02")
  waitComNextPhase("c1")
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_60, L1_61
end
