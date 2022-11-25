dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm15_common.lua")
_is_area_distant = false
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm15_writer_original",
      type = "man68",
      node = "locator2_writer_original_d",
      reset = false,
      not_mob = true
    },
    {
      name = "sm15_extra_01",
      type = "wom25",
      node = "locator2_extra_d_01",
      reset = false
    },
    {
      name = "sm15_extra_02",
      type = "man41",
      node = "locator2_extra_d_02",
      reset = false
    },
    {
      name = "sm15_extra_03",
      type = "wom17",
      node = "locator2_extra_d_03",
      reset = false
    },
    {
      name = "sm15_extra_04",
      type = "man32",
      node = "locator2_extra_d_04",
      reset = false
    },
    {
      name = "sm15_extra_05",
      type = "man33",
      node = "locator2_extra_d_05",
      reset = false
    },
    {
      name = "sm15_extra_06",
      type = "wom21",
      node = "locator2_extra_d_06",
      reset = false
    },
    {
      name = "sm15_extra_07",
      type = "man38",
      node = "locator2_extra_d_07",
      reset = false
    },
    {
      name = "sm15_extra_08",
      type = "wom27",
      node = "locator2_extra_d_08",
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppet_tbl.sm15_client = Fn_findNpcPuppet("sm15_client")
  _sdemo_cut01 = SDemo.create("sm15_d_cut01")
  _sdemo_cut02 = SDemo.create("sm15_d_cut02")
  Fn_pcSensorOff("pccubesensor2_area_distant_d")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    {
      name = "sm15_extra_03",
      gender = "wom",
      node = "locator2_extra_sdemo_d_03"
    },
    {
      name = "sm15_extra_04",
      gender = "man",
      node = "locator2_extra_sdemo_d_04"
    },
    {
      name = "sm15_extra_05",
      gender = "man",
      node = "locator2_extra_sdemo_d_05"
    },
    {
      name = "sm15_extra_06",
      gender = "wom",
      node = "locator2_extra_sdemo_d_06"
    },
    {
      name = "sm15_extra_07",
      gender = "man",
      node = "locator2_extra_sdemo_d_07"
    },
    {
      name = "sm15_extra_08",
      gender = "wom",
      node = "locator2_extra_sdemo_d_08"
    }
  }
  L1_2 = {}
  L1_2.name = "sm15_writer_original"
  L1_2.gender = "man"
  L1_2.node = "locator2_writer_reset_pos_d"
  L2_3 = {}
  L2_3.name = "sm15_client"
  L2_3.gender = "wom"
  L2_3.node = "locator2_client_reset_pos_d"
  L3_4.name = "sm15_extra_01"
  L3_4.gender = "wom"
  L3_4.node = "locator2_extra_sdemo_d_01"
  L4_5.name = "sm15_extra_02"
  L4_5.gender = "man"
  L4_5.node = "locator2_extra_sdemo_d_02"
  L1_2 = Fn_sendEventComSb
  L2_3 = "isSpawnEnemy"
  L1_2 = L1_2(L2_3)
  if not L1_2 then
    L1_2 = Fn_setNpcVisible
    L2_3 = "sm15_client"
    L1_2(L2_3, L3_4)
  end
  L1_2 = Fn_sendEventComSb
  L2_3 = "isSpawnEnemy"
  L1_2 = L1_2(L2_3)
  if not L1_2 then
    L1_2 = Fn_warpNpc
    L2_3 = "sm15_client"
    L1_2(L2_3, L3_4)
    L1_2 = Fn_setNpcVisible
    L2_3 = "sm15_client"
    L1_2(L2_3, L3_4)
  end
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = {}
  L1_2.scare = "man01_scared_nevy_00"
  L2_3 = {}
  L2_3.scare = "wom01_scared_nevy_00"
  for _FORV_6_, _FORV_7_ in L3_4(L4_5) do
    if _FORV_7_.gender == "man" then
      Fn_loadNpcEventMotion(_FORV_7_.name, L1_2)
      Fn_playNpcEventMotion(_FORV_7_.name, L1_2.scare, -1, 0.1, false)
    elseif _FORV_7_.gender == "wom" then
      Fn_loadNpcEventMotion(_FORV_7_.name, L2_3)
      Fn_playNpcEventMotion(_FORV_7_.name, L2_3.scare, -1, 0.1, false)
    end
  end
  L3_4(L4_5, true)
  L3_4()
  L3_4(L4_5)
  if L3_4 then
    L3_4(L4_5, "enmgen2_com_a", false)
    L3_4(L4_5, "enmgen2_com_a", true)
  else
    L3_4(L4_5, "enmgen2_com_a")
    while true do
      if L3_4 then
        L3_4()
      end
    end
  end
  L3_4(L4_5)
  L3_4(L4_5)
  while true do
    if not L4_5 then
      L4_5()
    end
  end
  L4_5("\231\181\130\227\130\143\227\129\163\227\129\159")
  L4_5(L3_4)
  L4_5("pccubesensor2_area_distant_d")
  L4_5(1.3)
  L4_5("sm15_03002")
  Fn_sceneConversion("locator2_pc_reset_pos_d", L4_5)
  Fn_userCtrlAllOff()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm15_01200k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_area_distant_OnEnter()
  local L0_6, L1_7
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  Player:setStay(true, false)
  Player:setStay(false, false)
  _is_area_distant = true
end
function pccubesensor2_warp_d_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
