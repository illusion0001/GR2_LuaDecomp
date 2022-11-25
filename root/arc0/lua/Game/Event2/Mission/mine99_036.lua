dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_036"
_floor_num = 36
_cage_drop_sensor_use = false
enmgen2_01 = {}
enmgen2_01.spawnOnStart = false
enmgen2_01.autoPrepare = false
enmgen2_01.autoRebirthFlag = false
enmgen2_01.autoRebirthIntervalTime = 0.1
enmgen2_01.spawnSet = {
  {
    name = "enmgen2_01_staker_01",
    type = "stalker_shine",
    locator = "locator_stalker_01"
  },
  {
    name = "enmgen2_01_staker_02",
    type = "stalker_shine",
    locator = "locator_stalker_02"
  },
  {
    name = "enmgen2_01_staker_03",
    type = "stalker_shine",
    locator = "locator_stalker_03"
  },
  {
    name = "enmgen2_01_staker_04",
    type = "stalker_shine",
    locator = "locator_stalker_04"
  },
  {
    name = "enmgen2_01_imp_01",
    type = "imp_shine",
    locator = "locator_imp_01"
  },
  {
    name = "enmgen2_01_imp_02",
    type = "imp_shine",
    locator = "locator_imp_02"
  },
  {
    name = "enmgen2_01_imp_03",
    type = "imp_shine",
    locator = "locator_imp_03"
  }
}
function enmgen2_01.onEnter(A0_0)
  local L1_1
  L1_1 = A0_0.getSpecTable
  L1_1 = L1_1(A0_0)
  L1_1.damage_type = {}
  L1_1.enemyDeadNum = 0
  L1_1.spawnSetLen = #L1_1.spawnSet
  A0_0:setEventListener("DamageEnemyReport", function(A0_2)
    print("\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\229\143\151\227\129\145\227\129\159\230\148\187\230\146\131\227\130\191\227\130\164\227\131\151\227\130\146\230\160\188\231\180\141")
    L1_1.damage_type[A0_2.name] = A0_2.damageType
  end)
end
function enmgen2_01.onObjectDead(A0_3, A1_4)
  A0_3:getSpecTable().enemyDeadNum = A0_3:getSpecTable().enemyDeadNum + 1
end
function enmgen2_01.onObjectAsh(A0_5, A1_6)
end
function enmgen2_01.getEnemyDeadNum(A0_7)
  local L1_8
  L1_8 = A0_7.enemyDeadNum
  return L1_8
end
function enmgen2_01.isEnemyAllDead(A0_9)
  return A0_9.enemyDeadNum >= A0_9.spawnSetLen
end
function enmgen2_01.isEnemyAllCauseOfDeathIsSpecial(A0_10)
  local L1_11
  L1_11 = false
  if 0 < enmgen2_01.getEnemyDeadNum(A0_10) then
    for _FORV_6_, _FORV_7_ in pairs(A0_10.damage_type) do
    end
    L1_11 = true == (true and (_FORV_7_ == "ScratchTornado" or _FORV_7_ == "GravityTyphoon") or _FORV_7_ == "MicroBlackHole" or _FORV_7_ == "CrowSpecial")
  end
  return L1_11
end
_cage_drop_end = false
function pcspheresensor2_01_OnEnter(A0_12)
  if false == _cage_drop_end then
    Fn_pcSensorOff("pcspheresensor2_01")
    _cage_drop_end = true
    Fn_cageMove()
  end
end
function InitializeBody()
  gravityeff_hdl_0 = Fn_createEffect("gravity_01", "ef_ev_dscbk_01", "locator2_nekostorm_01", true)
  gravityeff_hdl_1 = Fn_createEffect("gravity_02", "ef_ev_dscbk_01", "locator2_nekostorm_02", true)
  gravityeff_hdl_0:setLocalAabb(Aabb(Vector(-100000, -100000, -100000), Vector(100000, 100000, 100000)))
  gravityeff_hdl_1:setLocalAabb(Aabb(Vector(-100000, -100000, -100000), Vector(100000, 100000, 100000)))
  Fn_pcSensorOff("pcspheresensor2_01")
end
function IngameBody()
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if false == _cage_drop_end then
    Fn_pcSensorOn("pcspheresensor2_01")
  end
  if Fn_getMine99FloorClear() then
    print("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    findGameObject2("EnemyGenerator", "enmgen2_01"):requestPrepare()
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    Fn_setExtraWarpPoint("locator2_litho_pc_pos_03")
    setFirstHalfProcessEnd()
    findGameObject2("EnemyGenerator", "enmgen2_01"):requestSpawn()
    Fn_missionView("ic_pi_monument_obj_00360", 0, nil, true)
    _mi99_036_nowState = nil
    _mi99_036_stateFuncOne = nil
    _mi99_036_stateFuncTwo = nil
    _mi99_036_stateFuncOne = {}
    function _mi99_036_stateFuncOne.initialize(A0_13)
      local L1_14
    end
    function _mi99_036_stateFuncOne.update(A0_15)
      if enmgen2_01.getEnemyDeadNum(enmgen2_01) > 0 then
        _mi99_036_nowState:finalize()
        _mi99_036_nowState = _mi99_036_stateFuncTwo
        _mi99_036_nowState:initialize()
      end
      return false
    end
    function _mi99_036_stateFuncOne.finalize(A0_16)
      local L1_17
    end
    _mi99_036_stateFuncTwo = {}
    function _mi99_036_stateFuncTwo.initialize(A0_18)
      A0_18.flame_count = secondToGameTick(1.5)
    end
    function _mi99_036_stateFuncTwo.update(A0_19)
      if A0_19.flame_count <= 0 or false == enmgen2_01.isEnemyAllCauseOfDeathIsSpecial(enmgen2_01) then
        missionFailure()
        repeat
          wait()
        until isFailureProcessEnd()
        Fn_blackout()
        Fn_retryMine99()
      elseif true == enmgen2_01.isEnemyAllDead(enmgen2_01) then
        return true
      end
      A0_19.flame_count = A0_19.flame_count - 1
      return false
    end
    function _mi99_036_stateFuncTwo.finalize(A0_20)
      local L1_21
    end
    _mi99_036_nowState = _mi99_036_stateFuncOne
    repeat
      wait()
    until _mi99_036_nowState:update()
    waitSeconds(2)
    Fn_missionInfoEnd()
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
  end
  Fn_setGravityGateActive(true)
end
function FinalizeBody()
  local L0_22, L1_23
end
