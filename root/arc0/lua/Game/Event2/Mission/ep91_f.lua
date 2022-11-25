dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
enmgen2_f = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_f_01",
      name = "enm_f_01"
    },
    {
      type = "treecannon",
      locator = "locator_f_02",
      name = "enm_f_02"
    },
    {
      type = "lasercannon",
      locator = "locator_f_03",
      name = "enm_f_03"
    },
    {
      type = "stalker",
      locator = "locator_f_04",
      name = "enm_f_04"
    },
    {
      type = "stalker",
      locator = "locator_f_05",
      name = "enm_f_05"
    },
    {
      type = "stalker",
      locator = "locator_f_06",
      name = "enm_f_06"
    },
    {
      type = "stalker",
      locator = "locator_f_07",
      name = "enm_f_07"
    }
  }
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_f_navi_01")
end
function Ingame()
  Fn_sendEventComSb("setCrowSpawn", "locator2_crow_start_pos_f")
  Fn_missionStart()
  while true do
    if 0 == 0 then
      enmgen_f:setEnemyMarker(false)
      enmgen_f:requestSpawn()
      waitSeconds(1)
      Fn_naviSet(findGameObject2("Node", "locator2_f_navi_01"))
      Fn_pcSensorOn("pccubesensor2_f_navi_01")
      waitPhace()
    elseif 1 == 1 then
      enmgen_f:setEnemyMarker(true)
      while true do
        if 0 < enmgen_f:getEnemyCount() then
          wait()
          do break end
          wait()
        end
      end
    end
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
function nextPhace()
  local L0_2, L1_3
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_navi_OnEnter(A0_4)
  Fn_naviKill()
  Fn_pcSensorOff(A0_4)
  _next_phase = true
end
