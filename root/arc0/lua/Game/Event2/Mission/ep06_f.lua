dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
import("Vehicle")
_global = {
  enemy_cnt = 0,
  enemu_max = 0,
  temp_num = 0
}
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  if Fn_sendEventComSb("getPrevPhaseContinue") == false then
    Fn_sendEventComSb("spawnPeople")
  else
  end
  if Fn_sendEventComSb("isFoundEnemy") then
    Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_08")
  else
    Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_03")
  end
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  anoterCatWarp()
  Fn_missionStart()
  while not (_global.enemy_cnt > 0) do
    wait()
  end
  Vehicle:SetPanic(true, Fn_getPlayerWorldPos())
  Fn_userCtrlOn()
  HUD:counter99_99SetNum(_global.enemy_cnt)
  HUD:counter99_99SetMax(_global.enemu_max)
  Mob:makeSituationPanic(true)
  print("\227\131\162\227\131\150\227\131\145\227\131\139\227\131\131\227\130\175\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  while _global.enemy_cnt > 0 do
    wait()
  end
  HUD:counter99_99SetVisible(false)
  Fn_kaiwaDemoView("ep06_00195k")
  if invokeTask(function()
    while true do
      HUD:counter99_99SetNum(_global.enemy_cnt)
      HUD:counter99_99SetMax(_global.enemu_max)
      _global.temp_num = _global.enemy_cnt
      wait()
    end
  end) ~= nil then
    invokeTask(function()
      while true do
        HUD:counter99_99SetNum(_global.enemy_cnt)
        HUD:counter99_99SetMax(_global.enemu_max)
        _global.temp_num = _global.enemy_cnt
        wait()
      end
    end):abort()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
  print("\226\151\134\227\131\162\227\131\150\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  Vehicle:SetPanic(false)
end
function pcspheresensor2_warp_warning_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_04008", nil, false)
    Player:setStay(false)
  end)
end
function pcspheresensor2_warp_area_02_OnLeave()
  runCatWarp()
end
