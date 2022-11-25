dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
enmgen2_nevi_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_nevi_01_01",
      name = "nevi_01_01"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_02",
      name = "nevi_01_02"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_03",
      name = "nevi_01_03"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_04",
      name = "nevi_01_04"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_05",
      name = "nevi_01_05"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_06",
      name = "nevi_01_06"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_07",
      name = "nevi_01_07"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_08",
      name = "nevi_01_08"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_09",
      name = "nevi_01_09"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_10",
      name = "nevi_01_10"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_11",
      name = "nevi_01_11"
    },
    {
      type = "runner",
      locator = "locator2_nevi_01_12",
      name = "nevi_01_12"
    },
    {
      type = "runner",
      locator = "locator2_nevi_01_13",
      name = "nevi_01_13"
    }
  }
}
enmgen2_nevi_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator2_nevi_02_01",
      name = "nevi_02_01"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_02_02",
      name = "nevi_02_02"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_02_03",
      name = "nevi_02_03"
    },
    {
      type = "treecannon",
      locator = "locator2_nevi_02_04",
      name = "nevi_02_04"
    },
    {
      type = "guardcore",
      locator = "locator2_nevi_02_05",
      name = "nevi_02_05"
    },
    {
      type = "guardcore",
      locator = "locator2_nevi_02_06",
      name = "nevi_02_06"
    },
    {
      type = "guardcore",
      locator = "locator2_nevi_02_07",
      name = "nevi_02_07"
    },
    {
      type = "runner",
      locator = "locator2_nevi_02_08",
      name = "nevi_02_08"
    }
  }
}
enmgen2_nevi_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator2_nevi_03_01",
      name = "nevi_03_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_02",
      name = "jammer_01",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_03",
      name = "jammer_02",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_04",
      name = "jammer_03",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    }
  }
}
enmgen2_nevi_04 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator2_nevi_04_01",
      name = "nevi_04_01"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_04_02",
      name = "nevi_04_02"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_04_03",
      name = "nevi_04_03"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_04_04",
      name = "nevi_04_04"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_04_05",
      name = "nevi_04_05"
    }
  }
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28
  L0_0 = Fn_sendEventComSb
  L1_1 = "guideEffAllOff"
  L0_0(L1_1)
  L0_0 = {L1_1}
  L1_1 = Player
  L1_1 = L1_1.kAbility_GravityRevert
  L1_1 = {}
  L2_2 = Fn_unLockPlayerAbility
  L2_2(L3_3, L4_4)
  L2_2 = {}
  for L6_6 = 1, 6 do
    L7_7 = findGameObject2
    L8_8 = "EnemyGenerator"
    L9_9 = "enmgen2_nevi_0"
    L10_10 = L6_6
    L9_9 = L9_9 .. L10_10
    L7_7 = L7_7(L8_8, L9_9)
    L2_2[L6_6] = L7_7
    L7_7 = L2_2[L6_6]
    if L7_7 ~= nil then
      L7_7 = L2_2[L6_6]
      L8_8 = L7_7
      L7_7 = L7_7.setEnemyMarker
      L9_9 = false
      L7_7(L8_8, L9_9)
    end
  end
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3()
  L3_3()
  L6_6 = nil
  L7_7 = true
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3(L4_4)
  L3_3(L4_4)
  L6_6 = "locator2_goal_pos"
  L28_28 = L4_4(L5_5, L6_6)
  L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L4_4(L5_5, L6_6))
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L3_3()
  L6_6 = "jammer_01"
  function L6_6()
    repeat
      repeat
        wait()
      until Fn_getDistanceToPlayer(L4_4:getWorldPos()) < 40
      if L3_3 ~= nil then
        L3_3:eventMessage("Attack")
        waitSeconds(0.5)
        Fn_sendEventComSb("requestSliderBreak", "245")
        Fn_sendEventComSb("requestSliderBreak", "248")
        Fn_sendEventComSb("requestSliderBreak", "249")
        Fn_sendEventComSb("requestSliderBreak", "252")
        Fn_sendEventComSb("requestSliderBreak", "253")
        Fn_sendEventComSb("requestSliderBreak", "257")
      end
      waitSeconds(5)
    until false
  end
  L6_6 = findGameObject2
  L7_7 = "EnemyBrain"
  L8_8 = "jammer_02"
  L6_6 = L6_6(L7_7, L8_8)
  L7_7 = findGameObject2
  L8_8 = "Puppet"
  L9_9 = "jammer_02"
  L7_7 = L7_7(L8_8, L9_9)
  L8_8 = invokeTask
  function L9_9()
    repeat
      repeat
        wait()
      until Fn_getDistanceToPlayer(L7_7:getWorldPos()) < 40
      if L6_6 ~= nil then
        L6_6:eventMessage("Attack")
        waitSeconds(0.5)
        Fn_sendEventComSb("requestSliderBreak", "182")
        Fn_sendEventComSb("requestSliderBreak", "183")
        Fn_sendEventComSb("requestSliderBreak", "190")
      end
      waitSeconds(5)
    until false
  end
  L8_8 = L8_8(L9_9)
  L9_9 = findGameObject2
  L10_10 = "EnemyBrain"
  L11_11 = "jammer_03"
  L9_9 = L9_9(L10_10, L11_11)
  L10_10 = findGameObject2
  L11_11 = "Puppet"
  L12_12 = "jammer_03"
  L10_10 = L10_10(L11_11, L12_12)
  L11_11 = invokeTask
  function L12_12()
    repeat
      repeat
        wait()
      until Fn_getDistanceToPlayer(L10_10:getWorldPos()) < 40
      if L9_9 ~= nil then
        L9_9:eventMessage("Attack")
        waitSeconds(0.5)
        Fn_sendEventComSb("requestSliderBreak", "203")
        Fn_sendEventComSb("requestSliderBreak", "210")
        Fn_sendEventComSb("requestSliderBreak", "211")
      end
      waitSeconds(5)
    until false
  end
  L11_11 = L11_11(L12_12)
  L12_12 = findGameObject2
  L13_13 = "EnemyBrain"
  L14_14 = "nevi_04_02"
  L12_12 = L12_12(L13_13, L14_14)
  L13_13 = findGameObject2
  L14_14 = "Puppet"
  L15_15 = "nevi_04_02"
  L13_13 = L13_13(L14_14, L15_15)
  L14_14 = invokeTask
  function L15_15()
    L12_12:setEnableTarget(false)
    repeat
      repeat
        wait()
      until Fn_getDistanceToPlayer(L13_13:getWorldPos()) < 60
      if L12_12 ~= nil then
        L12_12:eventMessage("Laser")
      end
      waitSeconds(2.75)
      Fn_sendEventComSb("requestSliderBreak", "109")
      Fn_sendEventComSb("requestSliderBreak", "110")
      Fn_sendEventComSb("requestSliderBreak", "111")
      Fn_sendEventComSb("requestSliderBreak", "116")
      waitSeconds(7.25)
    until false
  end
  L14_14 = L14_14(L15_15)
  L15_15 = findGameObject2
  L16_16 = "EnemyBrain"
  L17_17 = "nevi_04_03"
  L15_15 = L15_15(L16_16, L17_17)
  L16_16 = findGameObject2
  L17_17 = "Puppet"
  L18_18 = "nevi_04_03"
  L16_16 = L16_16(L17_17, L18_18)
  L17_17 = invokeTask
  function L18_18()
    L15_15:setEnableTarget(false)
    repeat
      wait()
    until Fn_getDistanceToPlayer(L16_16:getWorldPos()) < 60
    repeat
      if L15_15 ~= nil then
        L15_15:eventMessage("Laser")
      end
      waitSeconds(2.75)
      Fn_sendEventComSb("requestSliderBreak", "74")
      Fn_sendEventComSb("requestSliderBreak", "75")
      Fn_sendEventComSb("requestSliderBreak", "76")
      Fn_sendEventComSb("requestSliderBreak", "81")
      waitSeconds(7.25)
    until false
  end
  L17_17 = L17_17(L18_18)
  L18_18 = findGameObject2
  L19_19 = "EnemyBrain"
  L20_20 = "nevi_04_04"
  L18_18 = L18_18(L19_19, L20_20)
  L19_19 = findGameObject2
  L20_20 = "Puppet"
  L21_21 = "nevi_04_04"
  L19_19 = L19_19(L20_20, L21_21)
  L20_20 = invokeTask
  function L21_21()
    L18_18:setEnableTarget(false)
    repeat
      repeat
        wait()
      until Fn_getDistanceToPlayer(L19_19:getWorldPos()) < 60
      if L18_18 ~= nil then
        L18_18:eventMessage("Laser")
      end
      waitSeconds(2.75)
      Fn_sendEventComSb("requestSliderBreak", "25")
      Fn_sendEventComSb("requestSliderBreak", "30")
      waitSeconds(7.25)
    until false
  end
  L20_20 = L20_20(L21_21)
  L21_21 = findGameObject2
  L22_22 = "EnemyBrain"
  L23_23 = "nevi_04_05"
  L21_21 = L21_21(L22_22, L23_23)
  L22_22 = findGameObject2
  L23_23 = "Puppet"
  L24_24 = "nevi_04_05"
  L22_22 = L22_22(L23_23, L24_24)
  L23_23 = invokeTask
  function L24_24()
    L21_21:setEnableTarget(false)
    repeat
      wait()
    until Fn_getDistanceToPlayer(L22_22:getWorldPos()) < 60
    repeat
      if L21_21 ~= nil then
        L21_21:eventMessage("Laser")
      end
      waitSeconds(2.75)
      Fn_sendEventComSb("requestSliderBreak", "27")
      Fn_sendEventComSb("requestSliderBreak", "28")
      waitSeconds(7.25)
    until false
  end
  L23_23 = L23_23(L24_24)
  L24_24 = invokeTask
  L24_24 = L24_24(L25_25)
  L25_25()
  L25_25()
  L25_25(L26_26)
  L25_25(L26_26)
  L24_24 = nil
  L25_25(L26_26)
  L25_25(L26_26)
  L8_8 = nil
  L25_25(L26_26)
  L11_11 = nil
  L25_25(L26_26)
  L14_14 = nil
  L25_25(L26_26)
  L17_17 = nil
  L25_25(L26_26)
  L20_20 = nil
  L25_25(L26_26)
  L23_23 = nil
  L25_25()
  for L28_28 = 1, 4 do
    L2_2[L28_28] = findGameObject2("EnemyGenerator", "enmgen2_nevi_0" .. L28_28)
    if L2_2[L28_28] ~= nil then
      L2_2[L28_28]:requestAllEnemyKill()
    end
  end
  L25_25(L26_26, L27_27)
  L25_25(L26_26, L27_27)
  L25_25(L26_26)
  L28_28 = "lithograph_05"
  if L25_25 ~= nil then
    L28_28 = false
    L26_26(L27_27, L28_28)
  end
  L28_28 = "5"
  L26_26(L27_27, L28_28)
  repeat
    L26_26()
  until L26_26
  L26_26()
  L26_26(L27_27)
  L26_26(L27_27)
  L26_26()
  if L25_25 ~= nil then
    L28_28 = true
    L26_26(L27_27, L28_28)
  end
  L26_26()
  L26_26()
  L26_26()
  L26_26()
end
function Finalize()
  local L0_29, L1_30
end
