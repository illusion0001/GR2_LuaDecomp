dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
import("Area")
_battle_clearDeadNum_wave1 = 12
gem = {}
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator2_nevi_01",
      name = "lunafishowner_01",
      ai_spawn_option = "LunaFishOwner/owner_num12"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator2_nevi_01",
      name = "enemy_01"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator2_nevi_01",
      name = "lunafish_01"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    if A1_1:getName() == "lunafish_01" then
      A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
      HUD:counter999SubNum()
    end
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "lunafish_01"
    }, 3, 5)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_6)
    local L1_7
    L1_7 = A0_6.enemyDeadNum
    return L1_7
  end
}
function Initialize()
  local L0_8, L1_9, L2_10, L3_11
  _sdemo_cut01 = L0_8
  for L3_11 = 1, 5 do
    gem[L3_11] = findGameObject2("Gem", string.format("gem2_vital_ep09_f_%02d", L3_11))
    gem[L3_11]:setActive(false)
  end
  L0_8(L1_9)
  L0_8(L1_9)
end
function Ingame()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19
  L0_12 = findGameObject2
  L1_13 = "EnemyGenerator"
  L0_12 = L0_12(L1_13, L2_14)
  if L0_12 ~= nil then
    L1_13 = L0_12.requestPrepare
    L1_13(L2_14)
  end
  repeat
    L1_13 = wait
    L1_13()
    L1_13 = Fn_sendEventComSb
    L1_13 = L1_13(L2_14)
  until L1_13
  L1_13 = Fn_setCatWarpCheckPoint
  L1_13(L2_14)
  L1_13 = findGameObject2
  L1_13 = L1_13(L2_14, L3_15)
  litho_task = L2_14
  L2_14()
  L2_14()
  repeat
    L2_14()
  until L2_14
  L2_14()
  L2_14(L3_15)
  L2_14(L3_15)
  litho_task = nil
  L2_14(L3_15)
  L2_14(L3_15, L4_16)
  L2_14(L3_15, L4_16)
  L2_14(L3_15)
  L2_14(L3_15)
  for L5_17 = 1, 5 do
    L6_18 = gem
    L6_18 = L6_18[L5_17]
    if L6_18 ~= nil then
      L6_18 = gem
      L6_18 = L6_18[L5_17]
      L7_19 = L6_18
      L6_18 = L6_18.setActive
      L6_18(L7_19, true)
    end
  end
  L2_14(L3_15, L4_16)
  L2_14(L3_15)
  L2_14(L3_15)
  repeat
    L2_14()
  until L2_14
  L5_17 = nil
  L6_18 = true
  L2_14(L3_15, L4_16, L5_17, L6_18)
  L2_14(L3_15)
  L2_14()
  L2_14(L3_15, L4_16)
  L2_14(L3_15, L4_16)
  L2_14(L3_15, L4_16)
  L2_14(L3_15, L4_16)
  return_task = L3_15
  repeat
    L3_15()
  until L3_15 == L4_16
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  return_task = nil
  L3_15(L4_16)
  L3_15(L4_16)
  L5_17 = false
  L3_15(L4_16, L5_17)
  L3_15(L4_16)
  L5_17 = "battle_end"
  L3_15(L4_16, L5_17)
  L3_15(L4_16)
  repeat
    L3_15()
  until L3_15
  L3_15(L4_16)
  L3_15()
  L5_17 = false
  L3_15(L4_16, L5_17)
  L5_17 = "locator2_cam_03"
  L6_18 = "locator2_aim_02"
  L7_19 = true
  L3_15(L4_16, L5_17, L6_18, L7_19)
  L4_16.pos = "locator2_cam_04"
  L4_16.time = 2
  L5_17 = {}
  L5_17.pos = "locator2_aim_03"
  L5_17.time = 2
  L5_17 = _sdemo_cut01
  L6_18 = L5_17
  L5_17 = L5_17.play
  L7_19 = L3_15
  L5_17(L6_18, L7_19, L4_16)
  L5_17 = findGameObject2
  L6_18 = "Node"
  L7_19 = "locator2_sol_01"
  L5_17 = L5_17(L6_18, L7_19)
  L6_18 = Fn_createEffect
  L7_19 = "ef_ev_smk_02"
  L6_18 = L6_18(L7_19, "ef_ev_smk_02", L5_17)
  L7_19 = L5_17.getPos
  L7_19 = L7_19(L5_17)
  Sound:playSE("ep09_signal_flare", 1, "", L5_17)
  waitSeconds(1)
  Sound:playSE("kit_837")
  Fn_captionViewWait("ep09_05002", nil, 2)
  Sound:playSE("cro013c")
  Fn_captionViewWait("ep09_05003", nil, 2)
  Sound:playSE("kit036a")
  Fn_captionViewWait("ep09_05004", nil, 2)
  waitSeconds(2)
  invokeTask(function()
    while true do
      wait()
      L7_19.y = L7_19.y + 0.5
      L5_17:setPos(L7_19)
    end
  end):abort()
  _sdemo_cut01:stop(0)
  waitSeconds(0.1)
  Fn_sendEventComSb("requestsupportCrowReset")
  Fn_sendEventComSb("requestsupportCrowReleaseIdling")
  Area:setDriftEnable(true)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_20, L1_21
end
