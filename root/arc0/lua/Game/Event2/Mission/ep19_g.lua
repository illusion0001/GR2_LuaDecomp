dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
count = 0
tutorial_kill = false
enmgen2_nevi_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_01_01",
      name = "jammer_01_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_02",
      name = "jammer_01_02"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_03",
      name = "jammer_01_03"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_04",
      name = "jammer_01_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_05",
      name = "jammer_01_05"
    }
  }
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_02_01",
      name = "jammer_02_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_02",
      name = "jammer_02_02"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_03",
      name = "jammer_02_03"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_04",
      name = "jammer_02_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_05",
      name = "jammer_02_05"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_06",
      name = "jammer_02_06"
    }
  }
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_03_01",
      name = "jammer_03_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_02",
      name = "jammer_03_02"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_03",
      name = "jammer_03_03"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_04",
      name = "jammer_03_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_05",
      name = "jammer_03_05"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_06",
      name = "jammer_03_06"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_07",
      name = "jammer_03_07"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_08",
      name = "jammer_03_08"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_09",
      name = "jammer_03_09"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_10",
      name = "jammer_03_10"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_11",
      name = "jammer_03_11"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_12",
      name = "jammer_03_12"
    }
  }
}
enmgen2_nevi_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_04_01",
      name = "jammer_04_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_02",
      name = "jammer_04_02"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_03",
      name = "jammer_04_03"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_04",
      name = "jammer_04_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_05",
      name = "jammer_04_05"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_06",
      name = "jammer_04_06"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_07",
      name = "jammer_04_07"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_08",
      name = "jammer_04_08"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_09",
      name = "jammer_04_09"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_10",
      name = "jammer_04_10"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_11",
      name = "jammer_04_11"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_12",
      name = "jammer_04_12"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_13",
      name = "jammer_04_13"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_04_14",
      name = "jammer_04_14"
    }
  }
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_check_02")
  Fn_pcSensorOff("pccubesensor2_check_03")
  Fn_pcSensorOff("pccubesensor2_check_04")
  Fn_pcSensorOff("pccubesensor2_check_05")
  _sdemo_cut01 = SDemo.create("cut01")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_sendEventComSb
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L0_0(L1_1, L2_2)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L0_0 = L0_0(L1_1)
  until L0_0
  L0_0 = Fn_sendEventComSb
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L0_0 = L0_0(L1_1)
  _ak_brain = L0_0
  L0_0 = _ak_brain
  if L0_0 then
    L0_0 = _ak_brain
    L0_0 = L0_0.setAbility
    L0_0(L1_1, L2_2, L3_3)
  end
  L0_0 = {}
  for L4_4 = 1, 5 do
    L0_0[L4_4] = findGameObject2("EnemyGenerator", "enmgen2_nevi_0" .. L4_4)
    if L0_0[L4_4] ~= nil then
      L0_0[L4_4]:setEnemyMarker(false)
    end
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1()
  L1_1()
  L1_1(L2_2)
  L1_1(L2_2)
  L4_4 = 0
  L2_2(L3_3, L4_4)
  L4_4 = -1
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  L4_4 = "ep19_info_01"
  L2_2(L3_3, L4_4, true)
  L2_2()
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3)
  L3_3()
  L4_4 = "locator2_restart_pos_ep19_g_02"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_01"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_02"
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestAnotherKittenReleaseIdle"
  L3_3(L4_4)
  L4_4 = "requestAnotherKittenMove"
  L3_3(L4_4, "locator2_a_kitten_move_pos_ep19_g_01_end", "locator2_a_kitten_move_pos_ep19_g_01_middle")
  L4_4 = 1
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestJemActive"
  L3_3(L4_4, 2)
  L4_4 = 1.5
  L3_3(L4_4)
  L4_4 = "ep19_06002"
  L3_3(L4_4)
  L3_3()
  L4_4 = "locator2_restart_pos_ep19_g_03"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_02"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_03"
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestAnotherKittenReleaseIdle"
  L3_3(L4_4)
  L4_4 = "requestAnotherKittenMove"
  L3_3(L4_4, "locator2_a_kitten_move_pos_ep19_g_02_end", "locator2_a_kitten_move_pos_ep19_g_02_middle")
  L4_4 = 1
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestJemActive"
  L3_3(L4_4, 3)
  L3_3()
  L4_4 = "locator2_restart_pos_ep19_g_04"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_03"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_04"
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestAnotherKittenReleaseIdle"
  L3_3(L4_4)
  L4_4 = "requestAnotherKittenMove"
  L3_3(L4_4, "locator2_a_kitten_move_pos_ep19_g_03_end", "locator2_a_kitten_move_pos_ep19_g_03_middle")
  L4_4 = 1
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L4_4 = "requestJemActive"
  L3_3(L4_4, 4)
  L4_4 = 1.5
  L3_3(L4_4)
  L4_4 = "ep19_06003"
  L3_3(L4_4)
  L3_3()
  L4_4 = "locator2_restart_pos_ep19_g_05"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_04"
  L3_3(L4_4)
  L4_4 = "pccubesensor2_check_05"
  L3_3(L4_4)
  if L3_3 ~= nil then
    L4_4 = L3_3
    L3_3(L4_4)
  end
  L3_3()
  L3_3()
  L3_3()
  L4_4 = L3_3
  L3_3(L4_4, "dm03_people_lost", 1, "", L1_1)
  L4_4 = "ef_ev_dis_02"
  L4_4 = Fn_setAlpha
  L4_4(L1_1, false, 2, 50)
  L4_4 = Fn_sendEventComSb
  L4_4("requestAnotherKittenKill")
  L4_4 = Fn_captionViewWait
  L4_4("ep19_06004")
  L4_4 = Fn_sendEventComSb
  L4_4("requestComSensorOn", "pccubesensor2_catwarp")
  L4_4 = Fn_pcSensorOff
  L4_4("pccubesensor2_caution_litho_03")
  L4_4 = Fn_pcSensorOff
  L4_4("pccubesensor2_catwarp_litho_03")
  L4_4 = Fn_sendEventComSb
  L4_4 = L4_4("com_a_hdl", "Lithograph", "lithograph_03")
  if L4_4 ~= nil then
    L4_4:setFarCulling(false)
  end
  Fn_sendEventComSb("missionComplete", "3")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_userCtrlOff()
  waitSeconds(2)
  Fn_kaiwaDemoView("ep19_00330k")
  if L4_4 ~= nil then
    L4_4:setFarCulling(true)
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_5, L1_6
end
function pccubesensor2_catwarp_litho_03_OnLeave()
  print("pccubesensor2_catwarp_litho_03_OnLeave")
  invokeTask(function()
    if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      Player:applyPoisonDamage(0, 0.1)
      Fn_sendEventComSb("requestStopPoisonSE")
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
      HUD:info("ep19_info_01", true)
      wait()
      Fn_tutorialCaption("mars_move")
      count = 0
      tutorial_kill = false
    else
      print(" << ep19_g >> game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
