import("Pad")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_crow = nil
_CROW_TIME = 60
_CROW_DAMAGE = 0.5
enmgen2_d = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_d_01",
      name = "ene_d_01"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_loadEventData
  L0_0("evx/ep91_common", {
    "evarea2_po_a_01_crow"
  })
  L0_0 = Fn_findAreaHandle
  L0_0 = L0_0("po_a_01")
  _sdemo_cat01 = SDemo.create("ep91_d_01", true)
  _sdemo_cat01:load("pgw2015_c_c02_camera1_c01", L0_0)
  _sdemo_cat02 = SDemo.create("ep91_d_02")
  _sdemo_cat02:load("pgw2015_c_c01_camera1_c01", L0_0)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = findGameObject2
  L1_2 = "EnemyGenerator"
  L2_3 = "enmgen2_d"
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = findGameObject2
  L2_3 = "Puppet"
  L3_4 = "ene_d_01"
  L1_2 = L1_2(L2_3, L3_4)
  L2_3 = 0
  while true do
    if L2_3 == 0 then
      L3_4 = L0_1.requestSpawn
      L3_4(L0_1)
      L3_4 = wait
      L3_4()
      while true do
        L3_4 = L1_2.isPoseAnimPlaying
        L3_4 = L3_4(L1_2, "spawn")
        if L3_4 == false then
          L3_4 = wait
          L3_4()
        end
      end
      L3_4 = _sdemo_cat01
      L3_4 = L3_4.play
      L3_4(L3_4)
      L3_4 = invokeTask
      L3_4(function()
        Fn_resetPcPos("locator2_pc_start_pos")
      end)
      while true do
        L3_4 = _sdemo_cat01
        L3_4 = L3_4.isPlay
        L3_4 = L3_4(L3_4)
        if L3_4 == true then
          L3_4 = wait
          L3_4()
        end
      end
      L3_4 = Fn_userCtrlOn
      L3_4()
      L3_4 = 0
      invokeTask(function()
        local L0_5, L1_6, L2_7, L3_8
        for L3_8 = 1, _CROW_TIME do
          waitSeconds(1)
          L3_4 = L3_4 + 1
        end
      end)
      _sdemo_cat01:stop(1)
      waitSeconds(1)
      repeat
        wait()
      until L3_4 >= _CROW_TIME or findGameObject2("EnemyBrain", "ene_d_01"):getMaxHealth() * _CROW_DAMAGE >= findGameObject2("EnemyBrain", "ene_d_01"):getHealth() or Pad:getButton(Pad.kButton_LL)
      L2_3 = 1
      break
    elseif L2_3 == 1 then
      L3_4 = Fn_sendEventComSb
      L3_4("setCrowSpawnMot", "locator2_crow_start_pos_d")
      while true do
        L3_4 = Fn_sendEventComSb
        L3_4 = L3_4("getCrowRequest")
        if L3_4 == "spawn_mot" then
          L3_4 = wait
          L3_4()
        end
      end
      L3_4 = L0_1.requestIdlingEnemy
      L3_4(L0_1, true)
      L3_4 = L0_1.setEnemyMarker
      L3_4(L0_1, false)
      L3_4 = createGameObject2
      L3_4 = L3_4("Effect")
      eff_hdl = L3_4
      L3_4 = eff_hdl
      L3_4 = L3_4.setModelName
      L3_4(L3_4, "ef_com_grnpar_02")
      L3_4 = eff_hdl
      L3_4 = L3_4.setName
      L3_4(L3_4, "ef_com_grnpar_02")
      L3_4 = eff_hdl
      L3_4 = L3_4.setLoop
      L3_4(L3_4, false)
      L3_4 = eff_hdl
      L3_4 = L3_4.setPos
      L3_4(L3_4, Vector(0, -0.5, 0))
      L3_4 = Fn_sendEventComSb
      L3_4 = L3_4("getCrowPuppet")
      L3_4:appendChild(eff_hdl)
      eff_hdl:setActive(false)
      eff_hdl:try_init()
      eff_hdl:waitForReady()
      eff_hdl:try_start()
      Fn_sendEventComSb("getCrowBrain"):setActorMode(true)
      Fn_sendEventComSb("getCrowBrain"):playAnim("crow_ep91_mot", 0, 0)
      invokeTask(function()
        for _FORV_3_ = 1, 62 do
          wait()
        end
        _FOR_:play()
        eff_hdl:setActive(true)
      end)
      wait(3)
      _sdemo_cat02:play()
      Fn_userCtrlOff()
      Fn_resetPcPos("warppoint2_01")
      while Fn_sendEventComSb("getCrowBrain"):isAnimEnd() == false or _sdemo_cat02:isPlay() == true do
        wait()
      end
      Fn_sendEventComSb("setActorModeGroundEnd")
      _sdemo_cat02:stop(1)
      waitSeconds(1)
      choice_look_idx({
        findGameObject2("Node", "locator2_lookat")
      }, 8)
      Fn_userCtrlOn()
      Fn_sendEventComSb("getCrowBrain"):setIdling(false)
      L0_1:requestIdlingEnemy(false)
      L0_1:setEnemyMarker(true)
      while true do
        if 0 < L0_1:getEnemyCount() then
          wait()
          do break end
          L3_4 = wait
          L3_4()
        end
      end
    end
  end
  L3_4 = Fn_setKeepPlayerPos
  L3_4()
  L3_4 = Fn_setNextMissionFlag
  L3_4()
  L3_4 = Fn_nextMission
  L3_4()
  L3_4 = Fn_exitSandbox
  L3_4()
end
function Finalize()
  local L0_9, L1_10
end
