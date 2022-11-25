local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "Yaml"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = import
L1_1 = "GlobalGem"
L0_0(L1_1)
L0_0 = import
L1_1 = "GravityOre"
L0_0(L1_1)
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = import
L1_1 = "Net"
L0_0(L1_1)
L0_0 = import
L1_1 = "Ugc"
L0_0(L1_1)
L0_0 = import
L1_1 = "Analytics"
L0_0(L1_1)
L0_0 = import
L1_1 = "Replay"
L0_0(L1_1)
L0_0 = import
L1_1 = "Rtc"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/CommonAll.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/ScriptCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Table/MineTable2.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/CameraCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/AreaCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/HUDCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/TalismanGachaCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Misc/gravityore_controller.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Misc/sdateTime.lua"
L0_0(L1_1)
_exitSandbox = false
_requestUpdate = true
_LockUpdateMine = false
_ggd_mine_overwrite = false
_currentTickTime = nil
L0_0 = _SYNC_INTERVAL_INIT
_sync_time = L0_0
_mine_state = nil
_mineName = nil
L0_0 = {}
L0_0.callSandbox = nil
L0_0.callFunc = nil
_onBreakn_callFunc = L0_0
L0_0 = {}
_death_ghost_list = L0_0
L0_0 = {}
_on_hold_death_ghost_list = L0_0
_create_comp_death_ghost = false
_get_death_ghost_load_task = nil
_on_hold_create_comp_death_ghost = false
_on_hold_get_death_ghost_load_task = nil
_pop_mimic_cnt = 0
L0_0 = {}
L0_0.spawnOnStart = false
L0_0.autoPrepare = true
L1_1 = {}
L0_0.spawnSet = L1_1
L0_0.addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner"
L1_1 = {L2_2}
L2_2 = {}
L2_2.type = "lunafish_rare"
L2_2.locator = "locator_01"
L2_2.name = "enm_rare"
L0_0.spawnSetLunaFishOwner = L1_1
function L1_1(A0_7)
  local L1_8, L2_9, L3_10
  L2_9 = A0_7
  L1_8 = A0_7.getEnemyCount
  L1_8 = L1_8(L2_9)
  if L1_8 > 0 then
    L1_8 = Fn_getPlayerWorldPos
    L1_8 = L1_8()
    L3_10 = A0_7
    L2_9 = A0_7.getSpecTable
    L2_9 = L2_9(L3_10)
    L3_10 = A0_7.getWorldPos
    L3_10 = L3_10(A0_7)
    if 200 < Fn_get_distance(L3_10, L1_8) then
      A0_7:requestAllEnemyKill()
    end
  end
end
L0_0.onUpdate = L1_1
function L1_1(A0_11)
  local L1_12
end
L0_0.onEnter = L1_1
function L1_1(A0_13)
  local L1_14
end
L0_0.onLeave = L1_1
function L1_1(A0_15, A1_16)
end
L0_0.onObjectAsh = L1_1
function L1_1(A0_17, A1_18)
  local L2_19
  L2_19 = A1_18.brain
  L2_19 = L2_19.getName
  L2_19 = L2_19(L2_19)
  print(string.format(" %s : %d ", L2_19, A0_17:getEnemyCount()))
  if string.find(L2_19, "jammer") == nil and A0_17:getEnemyCount() == 1 then
    EnemyDropGraviryOre(A0_17, A1_18)
  end
end
L0_0.onPopGem = L1_1
function L1_1(A0_20, A1_21)
end
L0_0.onObjectDead = L1_1
enmgen2_mimic_base = L0_0
L0_0 = {}
L1_1 = {}
L1_1.type = "stalker_rare"
L1_1.locator = "locator_01"
L1_1.name = "stalker_01"
L0_0.stalker_rare = L1_1
L1_1 = {}
L1_1.type = "runner_rare"
L1_1.locator = "locator_01"
L1_1.name = "runner_01"
L0_0.runner_rare = L1_1
L1_1 = {}
L1_1.type = "guardcore_rare"
L1_1.locator = "locator_01"
L1_1.name = "guardcore_01"
L0_0.guardcore_rare = L1_1
L1_1 = {}
L1_1.type = "treecannon_rare"
L1_1.locator = "locator_01"
L1_1.name = "treecannon_01"
L0_0.treecannon_rare = L1_1
L1_1 = {}
L1_1.type = "defender_rare"
L1_1.locator = "locator_01"
L1_1.name = "defender_01"
L0_0.defender_rare = L1_1
L1_1 = {}
L1_1.type = "giant_rare"
L1_1.locator = "locator_01"
L1_1.name = "giant_01"
L0_0.giant_rare = L1_1
L1_1 = {}
L1_1.type = "lasercannon_rare"
L1_1.locator = "locator_01"
L1_1.name = "lasercannon_01"
L0_0.lasercannon_rare = L1_1
L1_1 = {}
L1_1.type = "imp_rare"
L1_1.locator = "locator_01"
L1_1.name = "imp_01"
L0_0.imp_rare = L1_1
L1_1 = {}
L1_1.type = "gellyfish_rare"
L1_1.locator = "locator_01"
L1_1.name = "gellyfish_01"
L0_0.gellyfish_rare = L1_1
L1_1 = {}
L1_1.type = "lunafishowner_rare"
L1_1.locator = "locator_01"
L1_1.name = "lunafishowner_01"
L1_1.ai_spawn_option = "LunaFishOwner/owner_test"
L0_0.lunafish_rare = L1_1
L1_1 = {}
L1_1.type = "jammer_rare"
L1_1.locator = "locator_01"
L1_1.name = "jammer_01"
L0_0.jammer_rare = L1_1
_mimics = L0_0
L0_0 = {}
L0_0.SMALL = 1
L0_0.MIDDLE = 2
L0_0.LARGE = 3
L0_0.ENERGY = 4
L0_0.VITAL = 5
L0_0.SPECIAL = 6
_GEM = L0_0
_PreciousGemCnt = 0
_CrowPreciousGemCnt = 0
L0_0 = {}
L0_0.callSandbox = nil
L0_0.callFunc = nil
_onPreciousGemGet_callFunc = L0_0
L0_0 = {}
L0_0.callSandbox = nil
L0_0.callFunc = nil
_onCrowPreciousGemGet_callFunc = L0_0
function L0_0()
  debugDisp()
  GameDatabase:set(ggd.CreneShipFlags__MiningRun, true)
  GlobalGem:SetTalismanGetCallback("OnTalismanGet")
  GlobalGem:SetPreciousGemAddCallback("OnPreciousGemGet")
  GlobalGem:SetCrowPreciousGemAddCallback("OnCrowPreciousGemGet")
  _currentTickTime = sdateTime.getNowTickTime()
  invokeSystemTask(function()
    local L0_22
    L0_22 = 0
    repeat
      if L0_22 > 0 then
        L0_22 = L0_22 - 1
      else
        _currentTickTime = sdateTime.getNowTickTime()
        L0_22 = secondToGameTick(60)
      end
      wait()
    until _exitSandbox
  end)
  netWorkInit()
  invokeSystemTask(mineManagement)
end
main = L0_0
function L0_0()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L13_36, L14_37, L15_38, L16_39
  L0_23, L1_24, L2_25 = nil, nil, nil
  L3_26 = 0
  L4_27, L5_28, L6_29, L7_30, L8_31, L9_32 = nil, nil, nil, nil, nil, nil
  L10_33 = true
  L11_34 = {}
  L12_35 = _LockUpdateMine
  _mine_state = L13_36
  repeat
    if L13_36 then
      L10_33 = false
    else
      L7_30 = L4_27
      L8_31 = L5_28
      L9_32 = L6_29
      L6_29 = L15_38
      L5_28 = L14_37
      L4_27 = L13_36
      if L7_30 == L4_27 then
      elseif L12_35 ~= L13_36 then
        L11_34 = L13_36
        if "ft" == L5_28 then
          L10_33 = true
          L13_36(L14_37, L15_38)
          L13_36(L14_37, L15_38)
          L13_36(L14_37, L15_38)
        elseif L13_36 ~= nil then
          if L13_36 ~= nil then
            L10_33 = true
            L16_39 = L4_27
            L16_39 = L15_38(L16_39, 1, 6)
            L13_36(L14_37, L15_38, L16_39, L15_38(L16_39, 1, 6))
          else
            L10_33 = false
          end
        else
          L10_33 = false
        end
      end
    end
    L12_35 = _LockUpdateMine
    if L3_26 > 0 then
      L3_26 = L3_26 - 1
    else
      if L10_33 then
        L13_36(L14_37, L15_38)
      end
      L3_26 = L13_36
    end
    if L10_33 then
      L13_36(L14_37)
      L13_36(L14_37)
      for L16_39, _FORV_17_ in L13_36(L14_37) do
        if GameDatabase:get(_FORV_17_.criteria_gdb) then
          if checkExclusionMine(L16_39, L11_34) then
            if _FORV_17_.boss_deadline:getEnable() then
              if _FORV_17_.boss_deadline <= _currentTickTime then
                _FORV_17_.boss_deadline:Invalid()
                _FORV_17_.is_boss_come_in = false
                _FORV_17_.is_mine99_open = false
                _FORV_17_.is_mine99_permit = true
                _ggd_mine_overwrite = true
              else
                _FORV_17_.gravity_density = 100
                _FORV_17_.gravity_density_level = 7
              end
            end
            if not _FORV_17_.boss_deadline:getEnable() then
              if _FORV_17_.gravity_density ~= _funcMathGravityDensity(_FORV_17_.receive.total, _FORV_17_.receive.limit) then
                _ggd_mine_overwrite = true
              end
              _FORV_17_.gravity_density = _funcMathGravityDensity(_FORV_17_.receive.total, _FORV_17_.receive.limit)
              _FORV_17_.gravity_density_level = _funcMathGravityDensityLevel(_FORV_17_.gravity_density)
              if _FORV_17_.gravity_density >= 100 then
                _FORV_17_.is_boss_come_in = true
                _FORV_17_.is_mine99_open = false
                _FORV_17_.is_mine99_permit = false
                _FORV_17_.boss_deadline = ItAddsAValueToTheSdatatime(_currentTickTime, {
                  minute = _FORV_17_.receive.boss_time + 1
                })
              else
                _FORV_17_.is_boss_come_in = false
                _FORV_17_.is_mine99_open = false
                if _FORV_17_.gravity_density >= 80 then
                  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm48) == 1 then
                    _FORV_17_.is_mine99_open = true
                  end
                else
                  _FORV_17_.is_mine99_permit = true
                end
              end
            end
          end
          Ugc:mineSetBossNews(_FORV_17_.id, _FORV_17_.is_boss_come_in)
          _mine_info[L16_39].is_avairable = true
        end
      end
    end
    if L13_36 then
      if L13_36 then
        L16_39 = "\230\142\161\230\142\152\229\135\166\231\144\134\227\129\174\227\130\185\227\131\134\227\131\188\227\131\136\227\130\146\229\164\137\230\155\180[%d] -> [%d]"
        L16_39 = L15_38(L16_39, _mine_state:getState(), L13_36:getState())
        L14_37(L15_38, L16_39, L15_38(L16_39, _mine_state:getState(), L13_36:getState()))
        _mine_state = L13_36
      end
    else
      L13_36(L14_37)
      _mine_state = L13_36
    end
    if true == L13_36 then
      L13_36()
      _ggd_mine_overwrite = false
    end
    L13_36()
  until L13_36
end
mineManagement = L0_0
function L0_0(A0_40, A1_41)
  if A1_41 then
    for _FORV_5_, _FORV_6_ in pairs(A1_41) do
      if A0_40 == _FORV_6_ then
        return false
      end
    end
  end
  return true
end
checkExclusionMine = L0_0
function L0_0(A0_42)
  local L1_43
  if A0_42 then
    _LockUpdateMine = true
  else
    _LockUpdateMine = false
  end
end
setLoackUpdateMine = L0_0
function L0_0(A0_44, A1_45)
  local L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52
  for L5_49, L6_50 in L2_46(L3_47) do
    L7_51 = GameDatabase
    L8_52 = L7_51
    L7_51 = L7_51.get
    L7_51 = L7_51(L8_52, L6_50.criteria_gdb)
    if L7_51 then
      L7_51 = checkExclusionMine
      L8_52 = L5_49
      L7_51 = L7_51(L8_52, A1_45)
      if L7_51 then
        L7_51 = L6_50.offline
        L7_51 = L7_51.sum_executionDate
        L8_52 = L7_51
        L7_51 = L7_51.getEnable
        L7_51 = L7_51(L8_52)
        if not L7_51 then
          L7_51 = L6_50.offline
          L8_52 = ItAddsAValueToTheSdatatime
          L8_52 = L8_52(A0_44, {
            minute = L6_50.offline.sum_time
          })
          L7_51.sum_executionDate = L8_52
          _ggd_mine_overwrite = true
        end
        L7_51 = L6_50.offline
        L7_51 = L7_51.sum_executionDate
        if A0_44 >= L7_51 then
          L7_51 = L6_50.offline
          L7_51 = L7_51.init_executionDate
          L8_52 = L7_51
          L7_51 = L7_51.getEnable
          L7_51 = L7_51(L8_52)
          if L7_51 then
            L7_51 = L6_50.offline
            L7_51 = L7_51.init_executionDate
            if A0_44 >= L7_51 then
              L7_51 = L6_50.offline
              L7_51.total = 0
              L7_51 = L6_50.offline
              L7_51.add = 0
              L7_51 = L6_50.offline
              L7_51 = L7_51.init_executionDate
              L8_52 = L7_51
              L7_51 = L7_51.Invalid
              L7_51(L8_52)
              _ggd_mine_overwrite = true
            end
          else
            L7_51 = L6_50.offline
            L7_51 = L7_51.init_executionDate
            L8_52 = L7_51
            L7_51 = L7_51.getEnable
            L7_51 = L7_51(L8_52)
            if not L7_51 then
              L8_52 = A0_44
              L7_51 = A0_44.getCycle
              L7_51 = L7_51(L8_52, L6_50.offline.sum_executionDate, L6_50.offline.sum_time)
              L8_52 = math
              L8_52 = L8_52.max
              L8_52 = L8_52(0, L7_51 - 1)
              L7_51 = L8_52
              L8_52 = math
              L8_52 = L8_52.max
              L8_52 = L8_52(L6_50.offline.add, L6_50.offline.add_min)
              L8_52 = math.min(L8_52, L6_50.offline.add_max)
              L6_50.offline.add = 0
              if L7_51 < (L6_50.offline.limit - math.min(L6_50.offline.total + L8_52, L6_50.offline.limit)) / L6_50.offline.add_min then
                L8_52 = L8_52 + L6_50.offline.add_min * L7_51
                L6_50.offline.total = L6_50.offline.total + L8_52
                L6_50.offline.total = math.min(L6_50.offline.total, L6_50.offline.limit)
              else
                L7_51 = L7_51 - (L6_50.offline.limit - math.min(L6_50.offline.total + L8_52, L6_50.offline.limit)) / L6_50.offline.add_min
                L7_51 = L7_51 % (L6_50.offline.init_time / L6_50.offline.sum_time + L6_50.offline.limit / L6_50.offline.add_min)
                if L6_50.offline.init_time / L6_50.offline.sum_time > L7_51 then
                  L6_50.offline.total = L6_50.offline.limit
                  L6_50.offline.init_executionDate = ItAddsAValueToTheSdatatime(A0_44, {
                    minute = (L6_50.offline.init_time / L6_50.offline.sum_time - L7_51) * L6_50.offline.sum_time
                  })
                else
                  L6_50.offline.total = L6_50.offline.add_min * (L7_51 - L6_50.offline.init_time / L6_50.offline.sum_time)
                end
              end
            end
          end
          L7_51 = L6_50.offline
          L8_52 = ItAddsAValueToTheSdatatime
          L8_52 = L8_52(A0_44, {
            minute = L6_50.offline.sum_time
          })
          L7_51.sum_executionDate = L8_52
        end
      end
    end
  end
end
updateOfflineMineServer = L0_0
function L0_0()
  local L0_53, L1_54
  _exitSandbox = true
end
exitSandbox = L0_0
L0_0 = setExitCallback
L1_1 = exitSandbox
L0_0(L1_1)
function L0_0()
  local L0_55, L1_56
  _ggd_mine_overwrite = true
end
reqSaveMineInfo = L0_0
function L0_0()
  local L0_57, L1_58
  L0_57 = _ggd_mine_overwrite
  return L0_57
end
isSaveMineInfo = L0_0
function L0_0()
  local L0_59, L1_60
  L0_59 = _mineName
  return L0_59
end
getMineName = L0_0
L0_0 = {}
L0_0.UNKNOWN = 0
L0_0.UNAUTHORIZED = 10
L0_0.MINE_EXCEPT = 20
L0_0.MINE_SETUP = 30
L0_0.READY_FOR_OPERATION = 40
L0_0.RUN = 50
L0_0.GAMEOVER = 75
L0_0.RETRY = 80
L0_0.RESTART_WAIT = 90
L0_0.FINALIZE = 999
MINE_STATE = L0_0
L0_0 = {}
_MINE_BASE_STATE = L0_0
L0_0 = _MINE_BASE_STATE
L1_1 = MINE_STATE
L1_1 = L1_1.UNKNOWN
L0_0.state = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_61)
  local L1_62
end
L0_0.initialize = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_63)
  local L1_64
  L1_64 = nil
  return L1_64
end
L0_0.update = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_65)
  local L1_66
end
L0_0.finalize = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_67)
  local L1_68
  L1_68 = A0_67.state
  return L1_68
end
L0_0.getState = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_69)
  local L1_70
  L1_70 = {}
  A0_69:_installMethods(L1_70)
  return L1_70
end
L0_0._createInstance = L1_1
L0_0 = _MINE_BASE_STATE
function L1_1(A0_71, A1_72)
  local L2_73, L3_74, L4_75, L5_76, L6_77
  for L5_76, L6_77 in L2_73(L3_74) do
    if type(L6_77) == "function" then
      A1_72[L5_76] = L6_77
    elseif type(L6_77) == "table" then
      A1_72[L5_76] = {}
    else
      A1_72[L5_76] = L6_77
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_UNKNOWN = L0_0
L0_0 = _MINE_STATE_UNKNOWN
L1_1 = MINE_STATE
L1_1 = L1_1.UNKNOWN
L0_0.state = L1_1
L0_0 = _MINE_STATE_UNKNOWN
function L1_1(A0_78)
  local L1_79
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_UNKNOWN
function L1_1(A0_80)
  terminateAllGameObjects()
  return _MINE_STATE_UNAUTHORIZED
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_UNKNOWN
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_UNAUTHORIZED = L0_0
L0_0 = _MINE_STATE_UNAUTHORIZED
L1_1 = MINE_STATE
L1_1 = L1_1.UNAUTHORIZED
L0_0.state = L1_1
L0_0 = _MINE_STATE_UNAUTHORIZED
function L1_1(A0_81)
  local L1_82
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_UNAUTHORIZED
function L1_1(A0_83)
  if GameDatabase:get(ggd.CreneShipFlags__MiningRun) then
    if GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) then
      _MINE_STATE_MINE_SETUP:initialize()
      return _MINE_STATE_MINE_SETUP
    else
      _MINE_STATE_MINE_EXCEPT:initialize()
      return _MINE_STATE_MINE_EXCEPT
    end
  end
  return nil
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_UNAUTHORIZED
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_MINE_EXCEPT = L0_0
L0_0 = _MINE_STATE_MINE_EXCEPT
L1_1 = MINE_STATE
L1_1 = L1_1.MINE_EXCEPT
L0_0.state = L1_1
L0_0 = _MINE_STATE_MINE_EXCEPT
function L1_1(A0_84)
  local L1_85
  A0_84.count = 0
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_MINE_EXCEPT
function L1_1(A0_86)
  if GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) then
    A0_86:finalize()
    return _MINE_STATE_MINE_SETUP
  end
  return nil
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_MINE_EXCEPT
function L1_1(A0_87)
  A0_87:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_MINE_EXCEPT
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_MINE_SETUP = L0_0
L0_0 = _MINE_STATE_MINE_SETUP
L1_1 = MINE_STATE
L1_1 = L1_1.MINE_SETUP
L0_0.state = L1_1
L0_0 = _MINE_STATE_MINE_SETUP
function L1_1(A0_88)
  local L1_89
  A0_88.request_run = false
  A0_88.request_baseGravityOre = nil
  A0_88.request_addGravityOre = nil
  A0_88.request_PlacementDeathGhost = nil
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_MINE_SETUP
function L1_1(A0_90)
  if A0_90.request_run then
    _MINE_STATE_READY_FOR_OPERATION:initialize()
    _MINE_STATE_READY_FOR_OPERATION.request_mineName = A0_90.request_mineName
    _MINE_STATE_READY_FOR_OPERATION.request_baseGravityOre = A0_90.request_baseGravityOre
    _MINE_STATE_READY_FOR_OPERATION.request_addGravityOre = A0_90.request_addGravityOre
    _MINE_STATE_READY_FOR_OPERATION.request_PlacementDeathGhost = A0_90.request_PlacementDeathGhost
    A0_90:initialize()
    return _MINE_STATE_READY_FOR_OPERATION
  elseif not GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) then
    A0_90:initialize()
    _MINE_STATE_MINE_EXCEPT:initialize()
    return _MINE_STATE_MINE_EXCEPT
  end
  return nil
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_MINE_SETUP
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_READY_FOR_OPERATION = L0_0
L0_0 = _MINE_STATE_READY_FOR_OPERATION
L1_1 = MINE_STATE
L1_1 = L1_1.READY_FOR_OPERATION
L0_0.state = L1_1
L0_0 = _MINE_STATE_READY_FOR_OPERATION
function L1_1(A0_91)
  local L1_92
  A0_91.request_mineName = nil
  A0_91.request_baseGravityOre = nil
  A0_91.request_addGravityOre = nil
  A0_91.request_PlacementDeathGhost = nil
  L1_92 = {}
  L1_92.START = 1
  L1_92.WAIT = 2
  L1_92.END = 3
  A0_91.WORK_STATE = L1_92
  L1_92 = A0_91.WORK_STATE
  L1_92 = L1_92.START
  A0_91.current_work_state = L1_92
  A0_91.task_placement_deathGhost = nil
  A0_91.task_setup_mine = nil
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_READY_FOR_OPERATION
function L1_1(A0_93)
  if A0_93.current_work_state == A0_93.WORK_STATE.START then
    A0_93.current_work_state = A0_93.WORK_STATE.WAIT
    _MINE_STATE_RUN:initialize()
    _MINE_STATE_RUN.mission_name, _MINE_STATE_RUN.mission_type, _MINE_STATE_RUN.mission_num = _getCurrentMission()
    _MINE_STATE_RUN.bgset_name = GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet)
    _PreciousGemCnt = 0
    _CrowPreciousGemCnt = 0
    if _MINE_STATE_RUN.mission_type == "mine99" then
      A0_93.task_placement_deathGhost = invokeSystemTask(function(A0_94, A1_95)
        creatDeathGhost(A0_94)
        repeat
          wait()
        until isCreatCompDeathGhost()
        if A1_95 then
          dealOnHoldDeathGhost(A1_95)
          repeat
            wait()
          until isCreatCompdealOnHoldDeathGhost()
        end
        runDeathGhost()
      end, _MINE_STATE_RUN.mission_num, A0_93.request_PlacementDeathGhost.substitute_node)
      _MINE_STATE_RUN.deathGhostSubstitute_node = A0_93.request_PlacementDeathGhost.substitute_node
    end
    if _MINE_STATE_RUN.mission_type == "mine99" then
      _MINE_STATE_RUN.SelfDyingRecording = invokeTask(_uploadDeathGhostPlayerTask, _mineName, _MINE_STATE_RUN.mission_num)
    end
    A0_93.task_setup_mine = invokeSystemTask(function()
      local L0_96, L1_97, L2_98, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106, L11_107, L12_108, L13_109, L14_110, L15_111, L16_112, L17_113, L18_114, L19_115, L20_116, L21_117
      L0_96 = _mineName
      if L0_96 then
        L0_96 = mine_tbl
        L1_97 = _mineName
        L0_96 = L0_96[L1_97]
        if L0_96 then
          L0_96 = mine_tbl
          L1_97 = _mineName
          L0_96 = L0_96[L1_97]
          L1_97 = mine_ore_tbl
          L2_98 = L0_96.mine_ore_tbl
          L1_97 = L1_97[L2_98]
          L2_98 = type
          L3_99 = L0_96.lock_on_distance
          L2_98 = L2_98(L3_99)
          if "number" == L2_98 then
            L2_98 = GravityOre
            L2_98 = L2_98.setLockonDistance
            L3_99 = L0_96.lock_on_distance
            L2_98(L3_99)
          else
            L2_98 = GravityOre
            L2_98 = L2_98.setLockonDistance
            L3_99 = 1
            L2_98(L3_99)
          end
          L2_98 = L0_96.targetting_priority
          if nil ~= L2_98 then
            L2_98 = Player
            L3_99 = L2_98
            L2_98 = L2_98.setTargetingPriority
            L4_100 = L0_96.targetting_priority
            L2_98(L3_99, L4_100)
          end
          L2_98 = getGravityOreCreateCount
          L3_99 = _mineName
          L4_100 = L1_97.rand_ore_max
          L2_98 = L2_98(L3_99, L4_100)
          L3_99 = L1_97.mimic_min
          L4_100 = L1_97.mimic_max
          L5_101 = L0_96.chance_mimics
          if L5_101 then
            L6_102 = Fn_lottery
            L7_103 = L5_101
            L6_102 = L6_102(L7_103)
            if false == L6_102 then
              L3_99 = 0
              L4_100 = 0
            end
          end
          L6_102, L7_103, L8_104, L9_105, L10_106, L11_107 = nil, nil, nil, nil, nil, nil
          L12_108 = A0_93.request_baseGravityOre
          if L12_108 then
            L12_108 = A0_93.request_baseGravityOre
            L12_108 = L12_108.manager_name
            L6_102 = L12_108 or L12_108 or _mineName
            L12_108 = A0_93.request_baseGravityOre
            L7_103 = L12_108.mineOreEvdName
            L12_108 = A0_93.request_baseGravityOre
            L8_104 = L12_108.instance_flg
            L12_108 = A0_93.request_baseGravityOre
            L9_105 = L12_108.deploy_areas
            L12_108 = A0_93.request_baseGravityOre
            L10_106 = L12_108.exclusion_areas
            L12_108 = GravityOreControl
            L12_108 = L12_108.crate
            L13_109 = L6_102
            L14_110 = L2_98
            L15_111 = L3_99
            L16_112 = L4_100
            L17_113 = L7_103
            L18_114 = L8_104
            L19_115 = L9_105
            L20_116 = L10_106
            L12_108 = L12_108(L13_109, L14_110, L15_111, L16_112, L17_113, L18_114, L19_115, L20_116)
            L11_107 = L12_108
          end
          L12_108, L13_109, L14_110, L15_111, L16_112, L17_113 = nil, nil, nil, nil, nil, nil
          L18_114 = A0_93.request_addGravityOre
          if L18_114 then
            L18_114 = A0_93.request_addGravityOre
            L18_114 = L18_114.manager_name
            L12_108 = L18_114 or L18_114 or base_gravityOre_manager_name
            L18_114 = A0_93.request_addGravityOre
            L13_109 = L18_114.mineOreEvdName
            L18_114 = A0_93.request_addGravityOre
            L14_110 = L18_114.instance_flg
            L18_114 = A0_93.request_addGravityOre
            L15_111 = L18_114.deploy_areas
            L18_114 = A0_93.request_addGravityOre
            L16_112 = L18_114.exclusion_areas
            L18_114 = GravityOreControl
            L18_114 = L18_114.crate
            L19_115 = L12_108
            L20_116 = 99999
            L21_117 = 99999
            L18_114 = L18_114(L19_115, L20_116, L21_117, 99999, L13_109, L14_110, L15_111, L16_112)
            L17_113 = L18_114
          end
          L18_114 = initializeAllGameObjects
          L18_114()
          L18_114 = waitForReadyAllGameObjects
          L18_114()
          L18_114 = startAllGameObjects
          L18_114()
          L18_114 = false
          L19_115 = nil
          L20_116 = false
          L21_117 = CreateAndLoadTalismanGacha
          L21_117 = L21_117()
          L19_115 = L21_117
          if nil == L19_115 then
            L21_117 = 99
            L19_115 = CreateAndSaveTalismanGacha(mine_tbl[_mineName].gacha.area, mine_tbl[_mineName].gacha.num, L21_117)
          end
          if L11_107 then
            L21_117 = GameDatabase
            L21_117 = L21_117.get
            L21_117 = L21_117(L21_117, ggd.Savedata__EventManageFlags__BaseGravityOreEvbName)
            if "eventheader" == _MINE_STATE_RUN.mission_type then
              if ggd[string.format("Savedata__GravityOre__%s", L7_103)] then
                if L21_117 ~= L7_103 then
                  L18_114 = true
                  GameDatabase:set(ggd.Savedata__EventManageFlags__BaseGravityOreEvbName, L7_103)
                end
              else
                L18_114 = true
                L20_116 = true
              end
            elseif "mine99" == _MINE_STATE_RUN.mission_type then
              L18_114 = true
              GameDatabase:set(ggd.Savedata__EventManageFlags__BaseGravityOreEvbName, "None")
            elseif "mine" == _MINE_STATE_RUN.mission_type then
              if ggd[string.format("Savedata__GravityOre__%s", L7_103)] then
                GameDatabase:set(ggd.Savedata__EventManageFlags__BaseGravityOreEvbName, L7_103)
              else
              end
              if false == true then
                if _mine_info[_MINE_STATE_RUN.mission_name].gravityore_lottery_executionDate:getEnable() and _mine_info[_MINE_STATE_RUN.mission_name].gravityore_lottery_executionDate <= _currentTickTime then
                  _mine_info[_MINE_STATE_RUN.mission_name].gravityore_lottery_executionDate:Invalid()
                end
                if not _mine_info[_MINE_STATE_RUN.mission_name].gravityore_lottery_executionDate:getEnable() then
                  L18_114 = true
                  _mine_info[_MINE_STATE_RUN.mission_name].gravityore_lottery_executionDate = ItAddsAValueToTheSdatatime(_currentTickTime, {
                    minute = _mine_info[_MINE_STATE_RUN.mission_name].receive.retention_period
                  })
                end
              end
            elseif ggd[string.format("Savedata__GravityOre__%s", L7_103)] then
              if L21_117 ~= L7_103 then
                L18_114 = true
                GameDatabase:set(ggd.Savedata__EventManageFlags__BaseGravityOreEvbName, L7_103)
              end
            else
              L18_114 = true
              L20_116 = true
            end
          end
          if L11_107 then
            L21_117 = L11_107.requestSpawn
            L21_117(L11_107, L18_114)
          end
          if L17_113 then
            L21_117 = L17_113.requestSpawn
            L21_117(L17_113, true)
          end
          if L11_107 then
            repeat
              L21_117 = wait
              L21_117()
              L21_117 = L11_107.isObjAllReady
              L21_117 = L21_117(L11_107)
            until L21_117
          end
          if L17_113 then
            repeat
              L21_117 = wait
              L21_117()
              L21_117 = L17_113.isObjAllReady
              L21_117 = L21_117(L17_113)
            until L21_117
          end
          L21_117 = _MINE_STATE_RUN
          L21_117.OreMgr = L11_107
          L21_117 = _MINE_STATE_RUN
          L21_117.AddOreMgr = L17_113
          L21_117 = _MINE_STATE_RUN
          L21_117.TalGacha = L19_115
          L21_117 = _MINE_STATE_RUN
          L21_117.retryInTheRepair_BaseGravityOre = L20_116
        end
      end
    end, _mineName)
  elseif A0_93.current_work_state == A0_93.WORK_STATE.WAIT then
    if (A0_93.task_placement_deathGhost == nil or A0_93.task_placement_deathGhost and not A0_93.task_placement_deathGhost:isRunning()) and (A0_93.task_setup_mine == nil or A0_93.task_setup_mine and not A0_93.task_setup_mine:isRunning()) then
      _ggd_mine_overwrite = true
      A0_93:initialize()
      HUD:stackTelopStart()
      return _MINE_STATE_RUN
    end
  else
    _ggd_mine_overwrite = true
    A0_93:initialize()
    HUD:stackTelopStart()
    return _MINE_STATE_RUN
  end
  return nil
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_READY_FOR_OPERATION
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
function L0_0(A0_118, A1_119)
  GameDatabase:set(ggd.GlobalSystemFlags__GameOverWait, true)
  while not (Player:getEnergy(Player.kEnergy_Life) <= 0) and Player:getDeathState() ~= Player.kDeath_Dead do
    wait()
  end
  _uploadDeathGhostPlayer(A0_118, A1_119)
  Ugc:removeInstantDeathGhost()
  GameDatabase:set(ggd.GlobalSystemFlags__GameOverWait, false)
end
_uploadDeathGhostPlayerTask = L0_0
function L0_0(A0_120, A1_121)
  local L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134
  L2_122 = GlobalGem
  L3_123 = L2_122
  L2_122 = L2_122.SetEnableGemGet
  L4_124 = false
  L2_122(L3_123, L4_124)
  L2_122 = HUD
  L3_123 = L2_122
  L2_122 = L2_122.stackTelopFinish
  L2_122(L3_123)
  L2_122 = DeadLostStone
  L2_122 = L2_122()
  L3_123 = GameDatabase
  L4_124 = L3_123
  L3_123 = L3_123.set
  L3_123(L4_124, L5_125, L6_126)
  L3_123 = Player
  L4_124 = L3_123
  L3_123 = L3_123.getRecentAreaName
  L3_123 = L3_123(L4_124)
  L4_124 = nil
  if L3_123 ~= nil then
    L4_124 = L5_125
    L8_128 = L3_123
    L14_134 = L6_126(L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L6_126(L7_127, L8_128))
  else
    L5_125(L6_126)
  end
  if L5_125 > 0 then
    L8_128 = L4_124
    L8_128 = CreateTalismanGacha
    L8_128 = L8_128()
    for L12_132 = 1, L5_125 do
      L13_133 = GlobalGem
      L14_134 = L13_133
      L13_133 = L13_133.getTalismanOreInfo
      L13_133 = L13_133(L14_134, L2_122[L12_132])
      L14_134 = L8_128.GetStoneFromTalismanInfo
      L14_134 = L14_134(L13_133)
      oreDrop(L14_134, L7_127)
    end
    L9_129(L10_130)
  end
  L5_125(L6_126)
  L5_125(L6_126)
  L5_125(L6_126)
  L5_125(L6_126)
  L5_125(L6_126)
  L5_125(L6_126)
  L5_125(L6_126)
  L8_128 = L2_122
  L5_125(L6_126, L7_127, L8_128)
  for L8_128 = 1, #L2_122 do
    L9_129(L10_130, L11_131)
  end
end
_uploadDeathGhostPlayer = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    invokeSystemTask(_uploadDeathGhostPlayer, _mineName, _MINE_STATE_RUN.mission_num)
    Ugc:removeInstantDeathGhost()
  end
end
_requestUploadDeathGhostPlayer = L0_0
function L0_0(A0_135, A1_136, A2_137)
  local L3_138
  L3_138 = createGameObject2
  L3_138 = L3_138("Node")
  L3_138:setName("locator_pop_node")
  if A0_135 then
    A0_135:appendChild(L3_138)
  end
  L3_138:setWorldTransform(A1_136, A2_137)
  L3_138:setForceMove()
  L3_138:try_init()
  L3_138:waitForReady()
  L3_138:try_start()
  return L3_138
end
_createLocalNode = L0_0
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_RUN = L0_0
L0_0 = _MINE_STATE_RUN
L1_1 = MINE_STATE
L1_1 = L1_1.RUN
L0_0.state = L1_1
L0_0 = _MINE_STATE_RUN
function L1_1(A0_139)
  local L1_140
  A0_139.mission_name = nil
  A0_139.mission_type = nil
  A0_139.mission_num = nil
  A0_139.bgset_name = nil
  A0_139.OreMgr = nil
  A0_139.AddOreMgr = nil
  A0_139.retryInTheRepair_BaseGravityOre = false
  A0_139.TalGacha = nil
  A0_139.SelfDyingRecording = nil
  A0_139.setting_processing_task = nil
  A0_139.setting_processing = false
  A0_139.request_add_run = false
  A0_139.request_addGravityOre = nil
  A0_139.request_retry_reset = false
  A0_139.request_remove_drop = nil
  A0_139.request_resetGachaTable = nil
  A0_139.mineOreCnt = 0
  A0_139.deathGhostSubstitute_node = nil
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_RUN
function L1_1(A0_141)
  if not GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) then
    _MINE_STATE_FINALIZE:finalize(A0_141)
    return _MINE_STATE_FINALIZE
  end
  if not A0_141.setting_processing then
    if _getCurrentMission() ~= A0_141.mission_name then
      if "mine99" == A0_141.mission_type then
        _MINE_STATE_FINALIZE:push(A0_141)
        return _MINE_STATE_FINALIZE
      elseif "mine" == A0_141.mission_type then
        _MINE_STATE_FINALIZE:push(A0_141)
        return _MINE_STATE_FINALIZE
      elseif _getCurrentMission() == A0_141.mission_num and _getCurrentMission() == A0_141.mission_type then
        A0_141.mission_num, A0_141.mission_type, A0_141.mission_name = _getCurrentMission()
        if A0_141.AddOreMgr then
          A0_141.AddOreMgr:finalize()
          A0_141.AddOreMgr = nil
        end
      else
        _MINE_STATE_FINALIZE:push(A0_141)
        return _MINE_STATE_FINALIZE
      end
    end
    if A0_141.bgset_name ~= GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) then
      _MINE_STATE_FINALIZE:push(A0_141)
      return _MINE_STATE_FINALIZE
    end
    if A0_141.request_add_run and false == A0_141.setting_processing then
      A0_141.request_add_run = false
      A0_141.setting_processing = true
      A0_141.setting_processing_task = invokeSystemTask(function()
        local L0_142
        L0_142 = A0_141.request_addGravityOre
        if L0_142 then
          L0_142 = A0_141.AddOreMgr
          if L0_142 then
            L0_142 = A0_141.AddOreMgr
            L0_142 = L0_142.finalize
            L0_142(L0_142)
            A0_141.AddOreMgr = nil
          end
          L0_142 = nil
          L0_142 = GravityOreControl.crate(A0_141.request_addGravityOre.manager_name or A0_141.request_addGravityOre.mineOreEvdName or A0_141.OreMgr.manager_name, 99999, 99999, 99999, A0_141.request_addGravityOre.mineOreEvdName, A0_141.request_addGravityOre.instance_flg, A0_141.request_addGravityOre.deploy_areas, A0_141.request_addGravityOre.exclusion_areas)
          initializeAllGameObjects()
          waitForReadyAllGameObjects()
          startAllGameObjects()
          if L0_142 then
            L0_142:requestSpawn(true)
            repeat
              wait()
            until L0_142:isObjAllReady()
            A0_141.AddOreMgr = L0_142
          end
        end
        A0_141.request_addGravityOre = nil
        A0_141.setting_processing = false
      end)
    end
    if A0_141.request_resetGachaTable then
      print("\227\130\172\227\131\129\227\131\163\227\131\134\227\131\188\227\131\150\227\131\171\229\134\141\230\167\139\231\175\137\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\130\146\229\143\151\227\129\145\227\129\190\227\129\151\227\129\159")
      A0_141.request_resetGachaTable = nil
      A0_141.TalGacha = CreateAndSaveTalismanGacha(mine_tbl[A0_141.request_resetGachaTable.minename or _mineName].gacha.area, mine_tbl[A0_141.request_resetGachaTable.minename or _mineName].gacha.num)
      if true == (A0_141.request_resetGachaTable.clear_getTalisman or false) then
        GlobalGem:ClearTalismanOre()
      end
    end
    if GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      return _MINE_STATE_GAMEOVER
    elseif true == A0_141.request_retry_reset then
      A0_141.request_retry_reset = false
      return _MINE_STATE_RETRY
    elseif nil ~= A0_141.request_remove_drop then
      if true == A0_141.request_remove_drop then
        A0_141.request_remove_drop = nil
      end
      A0_141:retryTerm(A0_141.request_remove_drop)
      A0_141.request_remove_drop = nil
    end
  end
  return nil
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_RUN
function L1_1(A0_143)
  while A0_143.setting_processing do
    wait()
  end
  if A0_143.OreMgr then
    A0_143.OreMgr:finalize()
  end
  if A0_143.AddOreMgr then
    A0_143.AddOreMgr:finalize()
  end
  if A0_143.SelfDyingRecording then
    A0_143.SelfDyingRecording:abort()
  end
  if A0_143.TalGacha then
    A0_143.TalGacha:finalize()
  end
  A0_143:retryTerm()
  removeAllDeathGhost()
  HUD:stackTelopFinish()
  GlobalGem:SetOtherPreciousGemCountEnable(false)
  _onBreakn_callFunc = {callSandbox = nil, callFunc = nil}
  _onPreciousGemGet_callFunc = {callSandbox = nil, callFunc = nil}
  _onCrowPreciousGemGet_callFunc = {callSandbox = nil, callFunc = nil}
  GameDatabase:set(ggd.Savedata__EventManageFlags__BaseGravityOreEvbName, "None")
  GameDatabase:set(ggd.GlobalSystemFlags__GameOverWait, false)
  A0_143:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_RUN
function L1_1(A0_144, A1_145)
  local L2_146, L3_147, L4_148, L5_149
  if A1_145 then
  else
  end
  if true == L2_146 or not A1_145 then
    if L2_146 then
      for _FORV_6_, _FORV_7_ in L3_147(L4_148) do
        _FORV_7_:try_term()
      end
    end
  end
  gems = nil
  if A1_145 then
  else
  end
  if true == L2_146 or not A1_145 then
    if L2_146 then
      for _FORV_6_, _FORV_7_ in L3_147(L4_148) do
        _FORV_7_:try_term()
      end
    end
  end
  talismanstones = nil
  if A1_145 then
  else
  end
  if true == L2_146 or not A1_145 then
    if L2_146 > 0 then
      for L5_149 = 1, _pop_mimic_cnt do
        if _G[string.format("enmgen2_mimic_%03d", L5_149)] then
          if _G[string.format("enmgen2_mimic_%03d", L5_149)].enmgen then
            _G[string.format("enmgen2_mimic_%03d", L5_149)].enmgen:requestAllEnemyKill()
            _G[string.format("enmgen2_mimic_%03d", L5_149)].enmgen:try_term()
          end
          if _G[string.format("enmgen2_mimic_%03d", L5_149)].node then
            _G[string.format("enmgen2_mimic_%03d", L5_149)].node:try_term()
          end
        end
        _G[string.format("enmgen2_mimic_%03d", L5_149)] = nil
      end
    end
  end
  _pop_mimic_cnt = 0
  if A1_145 then
  elseif true == L2_146 then
    if L2_146 then
      for _FORV_6_, _FORV_7_ in L3_147(L4_148) do
        _FORV_7_:try_term()
      end
    end
  end
end
L0_0.retryTerm = L1_1
L0_0 = _MINE_STATE_RUN
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_GAMEOVER = L0_0
L0_0 = _MINE_STATE_GAMEOVER
L1_1 = MINE_STATE
L1_1 = L1_1.GAMEOVER
L0_0.state = L1_1
L0_0 = _MINE_STATE_GAMEOVER
function L1_1(A0_150)
  local L1_151
  L1_151 = {}
  L1_151.UNKNOWN = 0
  L1_151.FADE_WAIT = 1
  L1_151.GAMEOVER_WAIT = 2
  A0_150.GAMEOVER_STATE_CONF = L1_151
  L1_151 = A0_150.GAMEOVER_STATE_CONF
  L1_151 = L1_151.FADE_WAIT
  A0_150.current_state = L1_151
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_GAMEOVER
function L1_1(A0_152)
  if A0_152.GAMEOVER_STATE_CONF.FADE_WAIT == A0_152.current_state then
    if 1 <= HUD:faderAlpha() and HUD:faderStability() then
      _MINE_STATE_RUN:retryTerm()
      A0_152:finalize()
      A0_152.current_state = A0_152.GAMEOVER_STATE_CONF.GAMEOVER_WAIT
    end
  elseif A0_152.GAMEOVER_STATE_CONF.GAMEOVER_WAIT == A0_152.current_state and false == GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
    A0_152:finalize()
    return _MINE_STATE_RESTART_WAIT
  end
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_GAMEOVER
function L1_1(A0_153)
  A0_153:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_GAMEOVER
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_RETRY = L0_0
L0_0 = _MINE_STATE_RETRY
L1_1 = MINE_STATE
L1_1 = L1_1.RETRY
L0_0.state = L1_1
L0_0 = _MINE_STATE_RETRY
function L1_1(A0_154)
  local L1_155
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_RETRY
function L1_1(A0_156)
  if 1 <= HUD:faderAlpha() and HUD:faderStability() then
    A0_156:finalize()
    return _MINE_STATE_RESTART_WAIT
  end
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_RETRY
function L1_1(A0_157)
  A0_157:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_RETRY
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_RESTART_WAIT = L0_0
L0_0 = _MINE_STATE_RESTART_WAIT
L1_1 = MINE_STATE
L1_1 = L1_1.RESTART_WAIT
L0_0.state = L1_1
L0_0 = _MINE_STATE_RESTART_WAIT
function L1_1(A0_158)
  local L1_159
  A0_158.request_run = false
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_RESTART_WAIT
function L1_1(A0_160)
  if true == A0_160.request_run then
    _MINE_STATE_RUN.mineOreCnt = 0
    _PreciousGemCnt = 0
    _MINE_STATE_RUN:retryTerm()
    if _MINE_STATE_RUN.AddOreMgr then
      _MINE_STATE_RUN.AddOreMgr:finalize()
      _MINE_STATE_RUN.AddOreMgr = nil
    end
    if true == _MINE_STATE_RUN.retryInTheRepair_BaseGravityOre and _MINE_STATE_RUN.OreMgr then
      _MINE_STATE_RUN.OreMgr:requestRestor(_MINE_STATE_RUN.OreMgr.pointMax)
    end
    A0_160:finalize()
    return _MINE_STATE_RUN
  elseif _getCurrentMission() ~= _MINE_STATE_RUN.mission_name then
    if "mine99" == _MINE_STATE_RUN.mission_type then
      _MINE_STATE_FINALIZE:push(A0_160)
      _MINE_STATE_FINALIZE:push(_MINE_STATE_RUN)
      return _MINE_STATE_FINALIZE
    elseif "mine" == _MINE_STATE_RUN.mission_type then
      _MINE_STATE_FINALIZE:push(A0_160)
      _MINE_STATE_FINALIZE:push(_MINE_STATE_RUN)
      return _MINE_STATE_FINALIZE
    elseif _getCurrentMission() == _MINE_STATE_RUN.mission_num and _getCurrentMission() == _MINE_STATE_RUN.mission_type then
      _MINE_STATE_RUN.mission_name = _getCurrentMission()
      _MINE_STATE_RUN.mission_type = _getCurrentMission()
      _MINE_STATE_RUN.mission_num = _getCurrentMission()
      if A0_160.AddOreMgr then
        A0_160.AddOreMgr:finalize()
        A0_160.AddOreMgr = nil
      end
    else
      _MINE_STATE_FINALIZE:push(A0_160)
      _MINE_STATE_FINALIZE:push(_MINE_STATE_RUN)
      return _MINE_STATE_FINALIZE
    end
  end
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_RESTART_WAIT
function L1_1(A0_161)
  A0_161:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_RESTART_WAIT
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
L0_0 = _MINE_BASE_STATE
L1_1 = L0_0
L0_0 = L0_0._createInstance
L0_0 = L0_0(L1_1)
_MINE_STATE_FINALIZE = L0_0
L0_0 = _MINE_STATE_FINALIZE
L1_1 = MINE_STATE
L1_1 = L1_1.FINALIZE
L0_0.state = L1_1
L0_0 = _MINE_STATE_FINALIZE
function L1_1(A0_162)
  A0_162.finalize_state_stac = {}
end
L0_0.initialize = L1_1
L0_0 = _MINE_STATE_FINALIZE
function L1_1(A0_163)
  A0_163:finalize()
  terminateAllGameObjects()
  if GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) then
    _MINE_STATE_MINE_SETUP:initialize()
    return _MINE_STATE_MINE_SETUP
  end
  _MINE_STATE_MINE_EXCEPT:initialize()
  return _MINE_STATE_MINE_EXCEPT
end
L0_0.update = L1_1
L0_0 = _MINE_STATE_FINALIZE
function L1_1(A0_164)
  local L1_165, L2_166
  L1_165 = A0_164.finalize_state_stac
  L1_165 = #L1_165
  L2_166 = 0
  for _FORV_6_ = 1, L1_165 do
    L2_166 = L1_165 - _FORV_6_ + 1
    A0_164.finalize_state_stac[L2_166]:finalize()
  end
  _FOR_:initialize()
end
L0_0.finalize = L1_1
L0_0 = _MINE_STATE_FINALIZE
function L1_1(A0_167, A1_168)
  table.insert(A0_167.finalize_state_stac, A1_168)
end
L0_0.push = L1_1
L0_0 = _MINE_STATE_FINALIZE
L1_1 = L0_0
L0_0 = L0_0.initialize
L0_0(L1_1)
function L0_0()
  local L0_169, L1_170
  L0_169 = nil
  return L0_169
end
getMineList = L0_0
function L0_0()
  if _mine_state:getState() == MINE_STATE.UNKNOWN then
    return false
  elseif _mine_state:getState() == MINE_STATE.UNAUTHORIZED then
    GameDatabase:set(ggd.CreneShipFlags__MiningInFlags, true)
    return false
  elseif _mine_state:getState() == MINE_STATE.MINE_EXCEPT then
    GameDatabase:set(ggd.CreneShipFlags__MiningInFlags, true)
    return false
  elseif _mine_state:getState() == MINE_STATE.MINE_SETUP then
    return true
  elseif _mine_state:getState() == MINE_STATE.READY_FOR_OPERATION then
    return false
  elseif _mine_state:getState() == MINE_STATE.RUN then
    return true
  elseif _mine_state:getState() == MINE_STATE.GAMEOVER then
    return false
  elseif _mine_state:getState() == MINE_STATE.RETRY then
    return false
  elseif _mine_state:getState() == MINE_STATE.RESTART_WAIT then
    return true
  elseif _mine_state:getState() == MINE_STATE.FINALIZE then
    return false
  end
  return false
end
sendIsWaitPreparationMineManager = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN and false == _MINE_STATE_RUN.setting_processing then
    _mine_state.request_add_run = true
    return true
  elseif _mine_state and _mine_state:getState() == MINE_STATE.GAMEOVER or _mine_state:getState() == MINE_STATE.RETRY or _mine_state:getState() == MINE_STATE.RESTART_WAIT then
    _MINE_STATE_RESTART_WAIT.request_run = true
    return true
  else
    _MINE_STATE_MINE_SETUP.request_run = true
    return true
  end
  return false
end
sendMineSetupRun = L0_0
function L0_0(A0_171)
  if _mine_state and _mine_state:getState() == MINE_STATE.MINE_SETUP then
    _mineName = A0_171
    return true
  end
  return false
end
sendMineSetupMineName = L0_0
function L0_0(A0_172, A1_173, A2_174, A3_175, A4_176)
  if _mine_state and _mine_state:getState() == MINE_STATE.MINE_SETUP then
    _MINE_STATE_MINE_SETUP.request_baseGravityOre = {
      mineOreEvdName = A0_172,
      instance_flg = A1_173,
      manager_name = manager_namemanager_name or _mineName,
      deploy_areas = A3_175,
      exclusion_areas = A4_176
    }
    return true
  end
  return false
end
sendMineSetupBaseGravityOre = L0_0
function L0_0(A0_177, A1_178, A2_179, A3_180, A4_181)
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN or _mine_state and _mine_state:getState() == MINE_STATE.RETRY or _mine_state and _mine_state:getState() == MINE_STATE.GAMEOVER or _mine_state and _mine_state:getState() == MINE_STATE.RESTART_WAIT then
    if false == _MINE_STATE_RUN.request_add_run then
      _MINE_STATE_RUN.request_add_run = true
      _MINE_STATE_RUN.request_addGravityOre = {
        mineOreEvdName = A0_177,
        instance_flg = A1_178,
        manager_name = A2_179,
        deploy_areas = A3_180,
        exclusion_areas = A4_181
      }
    else
      invokeSystemTask(function()
        while _MINE_STATE_RUN.request_add_run or _MINE_STATE_RUN.setting_processing do
          if _exitSandbox then
            return
          end
          wait()
        end
        _MINE_STATE_RUN.request_addGravityOre = {
          mineOreEvdName = A0_177,
          instance_flg = A1_178,
          manager_name = A2_179,
          deploy_areas = A3_180,
          exclusion_areas = A4_181
        }
      end)
    end
    return true
  else
    _MINE_STATE_MINE_SETUP.request_addGravityOre = {
      mineOreEvdName = A0_177,
      instance_flg = A1_178,
      manager_name = A2_179,
      deploy_areas = A3_180,
      exclusion_areas = A4_181
    }
    return true
  end
  return false
end
sendMineSetupAddGravityOre = L0_0
function L0_0()
  if _mine_state:getState() == MINE_STATE.READY_FOR_OPERATION then
    if _MINE_STATE_READY_FOR_OPERATION.OreMgr then
      _MINE_STATE_READY_FOR_OPERATION.OreMgr:requestSpawn(true)
    end
  elseif _MINE_STATE_RUN.OreMgr then
    _MINE_STATE_RUN.OreMgr:requestSpawn(true)
  end
end
restorBaseGravityOre = L0_0
function L0_0()
  if _mine_state:getState() == MINE_STATE.READY_FOR_OPERATION then
    if _MINE_STATE_READY_FOR_OPERATION.AddOreMgr then
      _MINE_STATE_READY_FOR_OPERATION.AddOreMgr:requestSpawn(true)
    end
  elseif _MINE_STATE_RUN.AddOreMgr then
    _MINE_STATE_RUN.AddOreMgr:requestSpawn(true)
  end
end
restorAddGravityOre = L0_0
function L0_0(A0_182, A1_183)
  local L2_184
  L2_184 = {}
  L2_184.callSandbox = A0_182
  L2_184.callFunc = A1_183
  _onBreakn_callFunc = L2_184
end
sendMineSetupCallBrokenGravityOre = L0_0
function L0_0(A0_185, A1_186)
  local L2_187
  L2_187 = {}
  L2_187.callSandbox = A0_185
  L2_187.callFunc = A1_186
  _onPreciousGemGet_callFunc = L2_187
end
sendMineSetupCallOnPreciousGemGet = L0_0
function L0_0(A0_188, A1_189)
  local L2_190
  L2_190 = {}
  L2_190.callSandbox = A0_188
  L2_190.callFunc = A1_189
  _onCrowPreciousGemGet_callFunc = L2_190
end
sendMineSetupCallOnCrowPreciousGemGet = L0_0
function L0_0(A0_191, A1_192)
  GlobalGem:SetOtherPreciousGemCountEnable(true)
  GlobalGem:SetOtherPreciousGemCountMaxNum(A0_191)
  GlobalGem:SetOtherPreciousGemNum(A1_192)
end
sendSetOtherPreciousGemCount = L0_0
function L0_0()
  GlobalGem:SetOtherPreciousGemCountEnable(false)
end
sendStopOtherPreciousGemCount = L0_0
function L0_0(A0_193)
  GlobalGem:SetOtherPreciousGemNum(A0_193)
end
sendSetOtherPreciousGemNum = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    _mine_state.request_retry_reset = true
  end
end
sendRequestRetryReset = L0_0
function L0_0(A0_194)
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    if nil == A0_194 then
      _mine_state.request_remove_drop = true
    else
      _mine_state.request_remove_drop = {
        talisman = A0_194.talisman or false,
        gem = A0_194.gem or false,
        mimick = A0_194.mimick or false
      }
    end
    return true
  end
  return false
end
sendRequestRemoveDrop = L0_0
function L0_0(A0_195)
  local L2_196
  L2_196 = _MINE_STATE_MINE_SETUP
  L2_196.request_PlacementDeathGhost = {substitute_node = A0_195}
  L2_196 = true
  return L2_196
end
sendMineSetupDeathGhost = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    if _MINE_STATE_RUN.setting_processing then
      return false
    end
    return true
  end
  return false
end
sendIsRunMine = L0_0
function L0_0()
  local L1_197
  L1_197 = _MINE_STATE_RUN
  L1_197 = L1_197.mineOreCnt
  return L1_197
end
getMineCount = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    return _PreciousGemCnt
  end
  return nil
end
getGemCount = L0_0
function L0_0()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    return _CrowPreciousGemCnt
  end
  return nil
end
getCrowGemCount = L0_0
function L0_0(A0_198)
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm48) == 0 then
    print("\230\142\161\230\142\152\230\181\183\230\186\157\227\129\175\232\167\163\230\148\190\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
    return false
  end
  if _mine_info[A0_198 or _mineName] then
    return _mine_info[A0_198 or _mineName].is_mine99_open and _mine_info[A0_198 or _mineName].is_mine99_permit
  else
    print("ERROR : sendIsMine99Open Missing Mine Info")
  end
  return false
end
sendIsMine99Open = L0_0
function L0_0(A0_199)
  local L1_200
  L1_200 = _mine_info
  L1_200 = L1_200[A0_199 or _mineName]
  if L1_200 then
    L1_200.is_mine99_open = false
    L1_200.is_mine99_permit = false
  else
    print("ERROR : closeMine99 Missing Mine Info")
  end
end
closeMine99 = L0_0
function L0_0(A0_201)
  local L2_202
  L2_202 = A0_201 or _mineName
  return _mine_info[L2_202].is_boss_come_in
end
IsBossComeIn = L0_0
function L0_0(A0_203)
  local L2_204
  L2_204 = A0_203 or _mineName
  _mine_info[L2_204].is_boss_come_in = false
  _ggd_mine_overwrite = true
end
setBossComeOut = L0_0
function L0_0()
  local L0_205, L1_206
  L0_205 = _mine_info
  return L0_205
end
getMineInfo = L0_0
function L0_0()
  local L0_207, L1_208, L2_209, L3_210, L4_211, L5_212, L6_213, L7_214, L8_215, L9_216, L10_217, L11_218, L12_219
  L0_207 = GameDatabase
  L1_208 = L0_207
  L0_207 = L0_207.get
  L0_207 = L0_207(L1_208, L2_209)
  L1_208 = {}
  L2_209(L3_210)
  for L5_212, L6_213 in L2_209(L3_210) do
    if L7_214 then
      for L10_217, L11_218 in L7_214(L8_215) do
        if L0_207 == L11_218 then
          L12_219 = {}
          L12_219.name = L5_212 or "None"
          L12_219.id = L6_213.id or 0
          L12_219.density = L6_213.gravity_density_level or 0
          L12_219.level = math.max(7 - math.floor(L6_213.gravity_density * 7 / 100), 0)
          L12_219.boss = L6_213.is_boss_come_in or false
          L12_219.storm = L6_213.is_mine99_open and L6_213.is_mine99_permit or false
          L12_219.impossible = not L6_213.is_avairable or false
          debugPrint(string.format("\230\142\161\230\142\152\229\160\180\229\144\141\239\188\154%s [id:%d]", L12_219.name, L12_219.id))
          debugPrint(string.format("\227\128\128\227\128\128\227\128\128\233\135\141\229\138\155\229\190\174\229\173\144\230\191\131\229\186\166\239\188\154%d", L6_213.gravity_density))
          debugPrint(string.format("\233\135\141\229\138\155\229\190\174\229\173\144\230\191\131\229\186\166\227\131\172\227\131\153\227\131\171\239\188\154%d", L12_219.density))
          debugPrint(string.format("\227\128\128\227\128\128\227\128\128\227\128\128\230\142\161\230\142\152\227\131\172\227\131\153\227\131\171\239\188\154%d", L12_219.level))
          debugPrint(string.format("\227\128\128\227\128\128\227\128\128\227\128\128\227\128\128\227\131\156\227\130\185\229\135\186\231\143\190\239\188\154%s", L12_219.boss and "Yes" or "No"))
          debugPrint(string.format("\227\128\128\230\142\161\230\142\152\230\181\183\230\186\157\229\133\165\229\143\163\229\135\186\231\143\190\239\188\154%s", L12_219.storm and "Yes" or "No"))
          table.insert(L1_208, L12_219)
          break
        end
      end
    end
  end
  L2_209(L3_210)
  return L1_208
end
getEnableLocation = L0_0
function L0_0(A0_220)
  local L1_221, L2_222
  L1_221 = A0_220 or _mineName
  L2_222 = _mine_info
  L2_222 = L2_222[L1_221]
  if L2_222 then
    L2_222 = _mine_info
    L2_222 = L2_222[L1_221]
    L2_222 = L2_222.receive
    L2_222 = L2_222.total
    return L2_222
  end
  L2_222 = nil
  return L2_222
end
getReceiveTotalMined = L0_0
function L0_0()
  invokeTask(function()
    showMineResult()
  end)
end
viewOreToTalisman = L0_0
function L0_0()
  local L0_223, L1_224
  L0_223 = getMineName
  L0_223 = L0_223()
  if L0_223 then
    L1_224 = string
    L1_224 = L1_224.find
    L1_224 = L1_224(L0_223, "mine99_")
    if L1_224 ~= nil then
      L0_223 = "mine99"
    end
    L1_224 = mine_name_for_result_tbl
    L1_224 = L1_224[L0_223]
    HUD:menuOpen("DigoutResult", L1_224)
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    wait()
    debugPrint("\230\142\161\230\142\152\231\181\144\230\158\156\232\161\168\231\164\186:" .. L1_224)
    GlobalGem:SetOtherPreciousGemCountEnable(false)
  end
end
showMineResult = L0_0
function L0_0()
  local L0_225, L1_226, L2_227, L3_228
  L0_225 = _getCurrentMission
  L0_225 = L0_225()
  L1_226 = string
  L1_226 = L1_226.find
  L1_226 = L1_226(L2_227, L3_228)
  if L1_226 == nil then
    L1_226 = print
    L1_226(L2_227)
    L1_226 = {}
    for _FORV_5_, _FORV_6_ in L2_227(L3_228) do
      L1_226[_FORV_5_] = _FORV_6_.receive.depth
    end
    if L2_227 > L3_228 and false == GameDatabase:get(ggd[string.format("Savedata__Mine99__mine99_%03d_clear", L2_227 - 1)]) then
    end
    if L2_227 <= 1 then
      return "mine99_header", 1
    end
    return string.format("mine99_%03d", L2_227 - 1), L2_227
  else
    function L1_226(A0_229)
      return tonumber(string.gsub(A0_229, "mine99_", ""), 10)
    end
    return L3_228, L2_227 + 1
  end
end
getNextMission = L0_0
function L0_0()
  local L0_230
  L0_230 = 30
  if GameDatabase:get(ggd.Savedata__APP_VER) >= 2 then
  elseif GameDatabase:get(ggd.Savedata__APP_VER) >= 1 then
  end
  return L0_230
end
getMine99Depth = L0_0
function L0_0(A0_231, A1_232)
  local L3_233
  L3_233 = _MINE_STATE_RUN
  L3_233.request_resetGachaTable = {minename = A0_231, clear_getTalisman = A1_232}
end
requestResetGachaTable = L0_0
function L0_0(A0_234)
  local L1_235, L2_236, L3_237, L4_238, L5_239, L6_240, L7_241, L8_242, L9_243, L10_244, L11_245, L12_246
  L1_235 = nil
  L2_236 = _onBreakn_callFunc
  if L2_236 then
    L2_236 = _onBreakn_callFunc
    L2_236 = L2_236.callSandbox
    if L2_236 then
      L2_236 = _onBreakn_callFunc
      L2_236 = L2_236.callFunc
      if L2_236 then
        L2_236 = mother2
        L3_237 = L2_236
        L2_236 = L2_236.findGameObject2
        L4_238 = "Sandbox2"
        L5_239 = _onBreakn_callFunc
        L5_239 = L5_239.callSandbox
        L2_236 = L2_236(L3_237, L4_238, L5_239)
        if L2_236 then
          L4_238 = L2_236
          L3_237 = L2_236.sendEvent
          L5_239 = _onBreakn_callFunc
          L5_239 = L5_239.callFunc
          L6_240 = A0_234
          L3_237 = L3_237(L4_238, L5_239, L6_240)
          L1_235 = L3_237
          if L1_235 then
            L3_237 = L1_235.drop_all_off
            if true == L3_237 then
              return
            end
          end
        end
      end
    end
  end
  L2_236 = _mine_state
  if L2_236 then
    L2_236 = _mine_state
    L3_237 = L2_236
    L2_236 = L2_236.getState
    L2_236 = L2_236(L3_237)
    L3_237 = MINE_STATE
    L3_237 = L3_237.RUN
    if L2_236 == L3_237 then
      L2_236 = _MINE_STATE_RUN
      L2_236 = L2_236.setting_processing
      if false == L2_236 then
        L2_236 = _mineName
        if L2_236 then
          L3_237 = print
          L4_238 = "\231\160\180\229\163\138\227\129\151\227\129\159\233\137\177\231\137\169\227\129\174\230\149\176="
          L5_239 = _mine_state
          L5_239 = L5_239.mineOreCnt
          L5_239 = L5_239 + 1
          L4_238 = L4_238 .. L5_239
          L3_237(L4_238)
          L4_238 = A0_234
          L3_237 = A0_234.getTypeName
          L3_237 = L3_237(L4_238)
          if L3_237 ~= "GravityOre2" then
            return
          end
          L4_238 = A0_234
          L3_237 = A0_234.isFixEnterMimic
          L3_237 = L3_237(L4_238)
          if L3_237 then
            L3_237 = popOreMimic
            L4_238 = A0_234
            L3_237(L4_238)
          else
            L4_238 = A0_234
            L3_237 = A0_234.isBrokenFromCrow
            L3_237 = L3_237(L4_238)
            L4_238 = _mine_state
            L5_239 = _mine_state
            L5_239 = L5_239.mineOreCnt
            L5_239 = L5_239 + 1
            L4_238.mineOreCnt = L5_239
            L5_239 = A0_234
            L4_238 = A0_234.getOreType
            L4_238 = L4_238(L5_239)
            L5_239 = popOreItem
            L6_240 = L4_238
            L6_240 = L5_239(L6_240)
            L7_241 = print
            L11_245 = tostring
            L12_246 = L6_240
            L12_246 = L11_245(L12_246)
            L12_246 = L8_242(L9_243, L10_244, L11_245, L12_246, L11_245(L12_246))
            L7_241(L8_242, L9_243, L10_244, L11_245, L12_246, L8_242(L9_243, L10_244, L11_245, L12_246, L11_245(L12_246)))
            L7_241 = A0_234.getBreakForce
            L7_241 = L7_241(L8_242)
            if L5_239 > 0 then
              if L3_237 == true then
                L5_239 = L8_242
              end
              for L11_245 = 1, L5_239 do
                L12_246 = createGameObject2
                L12_246 = L12_246("Gem")
                L12_246:setName("mine_gem")
                L12_246:setGemModelNo(1)
                A0_234:appendChild(L12_246)
                L12_246:setDynamic(true)
                if L3_237 == true then
                  L12_246:setCrow(true)
                end
                L12_246:try_init()
                L12_246:waitForReadyAsync(function()
                  L12_246:try_start()
                  L12_246:setImpulse(L7_241)
                end)
                break
              end
            end
            if L8_242 == false then
              L8_242(L9_243)
            end
          end
        end
      end
    end
  else
  end
end
oreBroken = L0_0
L0_0 = oreBroken
oreBreaken = L0_0
function L0_0(A0_247)
  local L1_248, L2_249, L3_250
  L2_249 = A0_247
  L1_248 = A0_247.getStackTelopIconType
  L1_248 = L1_248(L2_249)
  L3_250 = A0_247
  L2_249 = A0_247.getUnknownName
  L2_249 = L2_249(L3_250)
  L3_250 = HUD
  L3_250 = L3_250.stackTelopAddItem
  L3_250(L3_250, L1_248, L2_249)
  L3_250 = GameDatabase
  L3_250 = L3_250.get
  L3_250 = L3_250(L3_250, ggd.Savedata__StatisticalChart__TalismanMineCount)
  L3_250 = L3_250 + 1
  if L3_250 > 9999999 then
    L3_250 = 9999999
  end
  GameDatabase:set(ggd.Savedata__StatisticalChart__TalismanMineCount, L3_250)
  GameDatabase:backup(ggd.Savedata__StatisticalChart)
  if L3_250 >= 5 then
    Net:trophyUnlock(31)
  end
end
OnTalismanGet = L0_0
function L0_0(A0_251)
  _PreciousGemCnt = _PreciousGemCnt + 1
  if _onPreciousGemGet_callFunc and _onPreciousGemGet_callFunc.callSandbox and _onPreciousGemGet_callFunc.callFunc and mother2:findGameObject2("Sandbox2", _onPreciousGemGet_callFunc.callSandbox) then
    mother2:findGameObject2("Sandbox2", _onPreciousGemGet_callFunc.callSandbox):sendEvent(_onPreciousGemGet_callFunc.callFunc, A0_251)
  end
end
OnPreciousGemGet = L0_0
function L0_0(A0_252)
  _CrowPreciousGemCnt = _CrowPreciousGemCnt + 1
  if _onCrowPreciousGemGet_callFunc and _onCrowPreciousGemGet_callFunc.callSandbox and _onCrowPreciousGemGet_callFunc.callFunc and mother2:findGameObject2("Sandbox2", _onCrowPreciousGemGet_callFunc.callSandbox) then
    mother2:findGameObject2("Sandbox2", _onCrowPreciousGemGet_callFunc.callSandbox):sendEvent(_onCrowPreciousGemGet_callFunc.callFunc, A0_252)
  end
end
OnCrowPreciousGemGet = L0_0
function L0_0()
  local L0_253, L1_254, L2_255
  L0_253 = ""
  L1_254 = ""
  L2_255 = ""
  if GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) == "None" then
    L0_253 = GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName)
  else
    L0_253 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName)
  end
  if "eventheader" == L0_253 then
    L0_253 = GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentFreeMode)
    L1_254 = "ft"
  elseif nil ~= string.find(L0_253, "mine99_") then
    L1_254 = "mine99"
    L2_255 = tonumber(string.sub(L0_253, 8, string.len(L0_253)))
  elseif nil ~= string.find(L0_253, "mine") then
    L1_254 = "mine"
    L2_255 = tonumber(string.sub(L0_253, 5, string.len(L0_253)))
  else
    L1_254 = string.sub(L0_253, 1, 2)
    L2_255 = string.match(L0_253, "(.-)_()")
  end
  return L0_253, L1_254, L2_255
end
_getCurrentMission = L0_0
function L0_0(A0_256)
  local L1_257, L2_258, L3_259, L4_260, L5_261, L6_262, L7_263, L8_264
  L1_257 = _mineName
  L2_258 = 0
  L3_259 = false
  L4_260 = ""
  L5_261 = mine_tbl
  L5_261 = L5_261[L1_257]
  L5_261 = L5_261.mine_ore_tbl
  L6_262 = mine_ore_tbl
  L6_262 = L6_262[L5_261]
  L6_262 = L6_262.gem_min
  L7_263 = mine_ore_tbl
  L7_263 = L7_263[L5_261]
  L7_263 = L7_263.gem_max
  L8_264 = mine_ore_tbl
  L8_264 = L8_264[L5_261]
  L8_264 = L8_264.talisman_ore_pct
  if ORE_TYPE_CORRECT_TABLE[A0_256] then
    L2_258 = get_ceil(RandI(L6_262, L7_263) * ORE_TYPE_CORRECT_TABLE[A0_256].gem_cnt)
    if true == Fn_lottery(get_ceil(L8_264 * ORE_TYPE_CORRECT_TABLE[A0_256].talisman_ore_pct)) then
      L3_259 = true
    end
  end
  return L2_258, L3_259
end
popOreItem = L0_0
function L0_0()
  local L0_265, L1_266, L2_267, L3_268, L4_269, L5_270, L6_271, L7_272, L8_273, L9_274, L10_275
  L0_265 = {}
  L1_266 = {}
  L2_267 = 0
  L3_268 = 0
  L4_269 = 98
  L5_270 = {}
  L6_271 = 0
  for L10_275 = 0, L4_269 do
    L0_265[L10_275 + 1] = GlobalGem:getTalismanOreInfo(L10_275)
    if L0_265[L10_275 + 1] ~= nil then
      L2_267 = L2_267 + 1
    end
  end
  for L10_275 = 1, L2_267 do
    L5_270[L10_275] = L10_275 - 1
  end
  for L10_275 = 1, L2_267 do
    L6_271 = RandI(1, L2_267)
    L5_270[L10_275], L5_270[L6_271] = L5_270[L6_271], L5_270[L10_275]
  end
  L3_268 = L7_272
  L7_272(L8_273)
  for L10_275 = 1, L3_268 do
    L1_266[L10_275] = L5_270[L10_275]
  end
  for L10_275 = 1, #L1_266 do
    print("\229\164\177\227\129\134\227\130\185\227\131\136\227\131\131\227\130\175\231\149\170\229\143\183" .. L1_266[L10_275])
  end
  return L1_266
end
DeadLostStone = L0_0
function L0_0(A0_276, A1_277)
  local L2_278, L3_279, L4_280
  L2_278 = {
    L3_279,
    L4_280,
    HUD.kStackTelop_Type_Triangle
  }
  L3_279 = HUD
  L3_279 = L3_279.kStackTelop_Type_Circle
  L4_280 = HUD
  L4_280 = L4_280.kStackTelop_Type_Square
  L3_279 = print
  L4_280 = "\229\142\159\231\159\179\227\130\146\227\131\137\227\131\173\227\131\131\227\131\151\227\129\151\227\129\190\227\129\153 --------------"
  L3_279(L4_280)
  L3_279 = print
  L4_280 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\131\162\227\131\135\227\131\171="
  L4_280 = L4_280 .. A0_276.model
  L3_279(L4_280)
  L3_279 = print
  L4_280 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\229\144\141\229\137\141="
  L4_280 = L4_280 .. A0_276.name
  L3_279(L4_280)
  L3_279 = print
  L4_280 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1711="
  L4_280 = L4_280 .. A0_276.skill1
  L3_279(L4_280)
  L3_279 = print
  L4_280 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1712="
  L4_280 = L4_280 .. A0_276.skill2
  L3_279(L4_280)
  L3_279 = print
  L4_280 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1713="
  L4_280 = L4_280 .. A0_276.skill3
  L3_279(L4_280)
  L3_279 = createGameObject2
  L4_280 = "Talisman"
  L3_279 = L3_279(L4_280)
  L4_280 = L3_279.setName
  L4_280(L3_279, "mine_talisman")
  L4_280 = L3_279.setModelNo
  L4_280(L3_279, A0_276.model)
  L4_280 = L3_279.setPos
  L4_280(L3_279, Vector(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
  L4_280 = L3_279.setDynamic
  L4_280(L3_279, true)
  L4_280 = L3_279.setSkilId
  L4_280(L3_279, A0_276.skill1, A0_276.skill2, A0_276.skill3)
  L4_280 = A0_276.rare
  L4_280 = L4_280 % 2
  if L4_280 == 0 then
    L4_280 = L3_279.setNameRarity
    L4_280(L3_279, Talisman.kNameHiLo_Hi)
  else
    L4_280 = L3_279.setNameRarity
    L4_280(L3_279, Talisman.kNameHiLo_Lo)
  end
  L4_280 = A1_277.appendChild
  L4_280(A1_277, L3_279)
  L4_280 = L3_279.try_init
  L4_280(L3_279)
  L4_280 = Vector
  L4_280 = L4_280(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5))
  L3_279:waitForReadyAsync(function()
    L3_279:try_start()
    L3_279:setImpulse(L4_280)
  end)
end
oreDrop = L0_0
function L0_0(A0_281, A1_282)
  local L2_283, L3_284, L4_285
  L2_283 = print
  L3_284 = "\229\142\159\231\159\179\227\130\146\227\131\137\227\131\173\227\131\131\227\131\151\227\129\151\227\129\190\227\129\153 --------------"
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\131\162\227\131\135\227\131\171="
  L4_285 = A0_281.formId
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\131\172\227\130\162\227\131\170\227\131\134\227\130\163="
  L4_285 = A0_281.rare
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\229\144\141\229\137\141\227\129\174\227\131\172\227\130\162\227\131\170\227\131\134\227\130\163="
  L4_285 = A0_281.NameRarity
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1711="
  L4_285 = A0_281.skill1
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1712="
  L4_285 = A0_281.skill2
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = print
  L3_284 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1713="
  L4_285 = A0_281.skill3
  L3_284 = L3_284 .. L4_285
  L2_283(L3_284)
  L2_283 = createGameObject2
  L3_284 = "Talisman"
  L2_283 = L2_283(L3_284)
  L4_285 = L2_283
  L3_284 = L2_283.setName
  L3_284(L4_285, "mine_talisman")
  L4_285 = L2_283
  L3_284 = L2_283.setModelNo
  L3_284(L4_285, A0_281.formId)
  L4_285 = L2_283
  L3_284 = L2_283.setPos
  L3_284(L4_285, Vector(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
  L4_285 = L2_283
  L3_284 = L2_283.setDynamic
  L3_284(L4_285, true)
  L4_285 = L2_283
  L3_284 = L2_283.setSkilId
  L3_284(L4_285, A0_281.skill1, A0_281.skill2, A0_281.skill3)
  L4_285 = L2_283
  L3_284 = L2_283.setNameRarity
  L3_284(L4_285, A0_281.NameRarity)
  L3_284 = getAcquireTalismanSe
  L4_285 = A0_281.rare
  L3_284 = L3_284(L4_285)
  L4_285 = L2_283.setGetSe
  L4_285(L2_283, L3_284)
  L4_285 = A1_282.appendChild
  L4_285(A1_282, L2_283)
  L4_285 = L2_283.try_init
  L4_285(L2_283)
  L4_285 = Vector
  L4_285 = L4_285(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5))
  L2_283:waitForReadyAsync(function()
    L2_283:try_start()
    L2_283:setImpulse(L4_285)
  end)
end
oreDrop2 = L0_0
function L0_0(A0_286, A1_287, A2_288)
  local L3_289, L4_290, L5_291, L6_292
  L3_289 = {
    L4_290,
    L5_291,
    L6_292
  }
  L4_290 = HUD
  L4_290 = L4_290.kStackTelop_Type_Circle
  L5_291 = HUD
  L5_291 = L5_291.kStackTelop_Type_Square
  L6_292 = HUD
  L6_292 = L6_292.kStackTelop_Type_Triangle
  L4_290 = print
  L5_291 = "\229\142\159\231\159\179\227\130\146\227\131\137\227\131\173\227\131\131\227\131\151\227\129\151\227\129\190\227\129\153 --------------"
  L4_290(L5_291)
  L4_290 = print
  L5_291 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\131\162\227\131\135\227\131\171="
  L6_292 = A0_286.model
  L5_291 = L5_291 .. L6_292
  L4_290(L5_291)
  L4_290 = print
  L5_291 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\229\144\141\229\137\141="
  L6_292 = A0_286.name
  L5_291 = L5_291 .. L6_292
  L4_290(L5_291)
  L4_290 = print
  L5_291 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1711="
  L6_292 = A0_286.skill1
  L5_291 = L5_291 .. L6_292
  L4_290(L5_291)
  L4_290 = print
  L5_291 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1712="
  L6_292 = A0_286.skill2
  L5_291 = L5_291 .. L6_292
  L4_290(L5_291)
  L4_290 = print
  L5_291 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1713="
  L6_292 = A0_286.skill3
  L5_291 = L5_291 .. L6_292
  L4_290(L5_291)
  L4_290 = createGameObject2
  L5_291 = "Talisman"
  L4_290 = L4_290(L5_291)
  L6_292 = L4_290
  L5_291 = L4_290.setName
  L5_291(L6_292, "mine_talisman")
  L6_292 = L4_290
  L5_291 = L4_290.setModelNo
  L5_291(L6_292, A0_286.model)
  L6_292 = L4_290
  L5_291 = L4_290.setWorldPos
  L5_291(L6_292, A2_288:getWorldPos() + Vector(0, 1.5, 0))
  L6_292 = L4_290
  L5_291 = L4_290.setDynamic
  L5_291(L6_292, true)
  L6_292 = L4_290
  L5_291 = L4_290.setSkilId
  L5_291(L6_292, A0_286.skill1, A0_286.skill2, A0_286.skill3)
  L5_291 = getAcquireTalismanSe
  L6_292 = A0_286.rare
  L5_291 = L5_291(L6_292)
  L6_292 = L4_290.setGetSe
  L6_292(L4_290, L5_291)
  L6_292 = A0_286.rare
  L6_292 = L6_292 % 2
  if L6_292 == 0 then
    L6_292 = L4_290.setNameRarity
    L6_292(L4_290, Talisman.kNameHiLo_Hi)
  else
    L6_292 = L4_290.setNameRarity
    L6_292(L4_290, Talisman.kNameHiLo_Lo)
  end
  L6_292 = A1_287.appendChild
  L6_292(A1_287, L4_290, true)
  L6_292 = L4_290.try_init
  L6_292(L4_290)
  L6_292 = Vector
  L6_292 = L6_292(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5))
  L4_290:waitForReadyAsync(function()
    L4_290:try_start()
    L4_290:setImpulse(L6_292)
  end)
end
oreDrop3 = L0_0
function L0_0(A0_293, A1_294, A2_295, A3_296)
  local L4_297, L5_298, L6_299, L7_300, L8_301, L9_302, L10_303, L11_304
  L4_297 = _mineName
  L5_298 = mine_tbl
  L5_298 = L5_298[L4_297]
  L5_298 = L5_298.enemy_pop_gem
  L5_298 = L5_298.pct
  L6_299 = {}
  L7_300 = mine_tbl
  L7_300 = L7_300[L4_297]
  L7_300 = L7_300.enemy_pop_gem
  L7_300 = L7_300.ene
  L6_299[1] = L7_300
  L7_300 = mine_tbl
  L7_300 = L7_300[L4_297]
  L7_300 = L7_300.enemy_pop_gem
  L7_300 = L7_300.vit
  L6_299[2] = L7_300
  L7_300 = mine_tbl
  L7_300 = L7_300[L4_297]
  L7_300 = L7_300.enemy_pop_gem
  L7_300 = L7_300.sp
  L6_299[3] = L7_300
  L7_300 = 0
  L8_301 = 0
  L9_302 = 0
  L10_303 = 0
  L11_304 = 4
  if false == Fn_lottery(L5_298) then
    print("\227\130\184\227\130\167\227\131\160\229\135\186\231\143\190\227\129\170\227\130\137\227\129\154\239\188\129")
    return false
  end
  for _FORV_15_ = 1, #L6_299 do
    L7_300 = L6_299[_FORV_15_] + L7_300
  end
  L8_301 = RandI(1, L7_300)
  print("\228\187\138\229\155\158\227\129\174\231\162\186\231\142\135=" .. L8_301)
  for _FORV_15_ = 1, #L6_299 do
    L9_302 = L6_299[_FORV_15_] + L9_302
    if L8_301 <= L9_302 then
      L10_303 = _FORV_15_
      break
    end
  end
  if L10_303 == 1 then
    L11_304 = _GEM.ENERGY
  elseif L10_303 == 2 then
    L11_304 = _GEM.VITAL
  elseif L10_303 == 3 then
    L11_304 = _GEM.SPECIAL
  else
    return false
  end
  invokeTask(function(A0_305, A1_306, A2_307)
    local L3_308
    L3_308 = createGameObject2
    L3_308 = L3_308("Gem")
    L3_308:setName("mine_gem")
    print("gem_type=" .. A2_307)
    L3_308:setGemModelNo(A2_307)
    L3_308:setWorldPos(A0_305)
    L3_308:setDynamic(true)
    L3_308:try_init()
    L3_308:waitForReadyAsync(function()
      L3_308:try_start()
      L3_308:setImpulse(A1_306)
    end)
  end, Vector(A2_295[1], A2_295[2], A2_295[3]), Vector(A3_296[1], A3_296[2], A3_296[3]), L11_304)
  return true
end
EnemeyDropGem = L0_0
function L0_0(A0_309)
  invokeTask(function()
    local L0_310, L1_311, L2_312, L3_313, L4_314, L5_315, L6_316, L7_317, L8_318, L9_319, L10_320, L11_321, L12_322
    L0_310 = _mineName
    L1_311 = mine_tbl
    L1_311 = L1_311[L0_310]
    L1_311 = L1_311.mimics
    if L1_311 ~= nil then
      L2_312 = RandI
      L3_313 = #L1_311
      L2_312 = L2_312(L3_313)
      L3_313 = L1_311[L2_312]
      L4_314 = _pop_mimic_cnt
      L4_314 = L4_314 + 1
      _pop_mimic_cnt = L4_314
      L4_314 = _pop_mimic_cnt
      L5_315 = string
      L5_315 = L5_315.format
      L6_316 = "enmgen2_mimic_%03d"
      L5_315 = L5_315(L6_316, L7_317)
      L6_316 = _G
      L6_316[L5_315] = L7_317
      L6_316 = _G
      L6_316 = L6_316[L5_315]
      for L10_320, L11_321 in L7_317(L8_318) do
        L12_322 = type
        L12_322 = L12_322(L11_321)
        if "table" == L12_322 then
          L12_322 = {}
          L6_316[L10_320] = L12_322
        else
          L6_316[L10_320] = L11_321
        end
      end
      L6_316.spawnSetLunaFishOwner = L7_317
      for L10_320, L11_321 in L7_317(L8_318) do
        L12_322 = {}
        for _FORV_16_, _FORV_17_ in pairs(L11_321) do
          L12_322[_FORV_16_] = _FORV_17_
        end
        table.insert(L6_316.spawnSetLunaFishOwner, L12_322)
      end
      L6_316.spawnSet = L7_317
      L7_317[1] = L8_318
      for L10_320, L11_321 in L7_317(L8_318) do
        L12_322 = L11_321.name
        L12_322 = L12_322 .. "_" .. A0_309:getName()
        L11_321.name = L12_322
        L12_322 = print
        L12_322(string.format("%s \227\129\174 %s \227\129\140\229\135\186\231\143\190\227\129\151\227\129\190\227\129\153\227\128\130", L11_321.type, L11_321.name))
      end
      L10_320 = L8_318
      L11_321 = "locator_pop_node"
      L9_319(L10_320, L11_321)
      L6_316.node = L8_318
      L10_320 = L8_318
      L11_321 = Vector
      L12_322 = 0
      L12_322 = L11_321(L12_322, 0, 0)
      L9_319(L10_320, L11_321, L12_322, L11_321(L12_322, 0, 0))
      L10_320 = L9_319
      L11_321 = L8_318
      L9_319(L10_320, L11_321)
      L10_320 = L8_318
      L9_319(L10_320)
      L10_320 = L8_318
      L9_319(L10_320)
      L10_320 = L8_318
      L9_319(L10_320)
      L10_320 = "EnemyGenerator"
      L11_321 = L9_319
      L10_320 = L9_319.setName
      L12_322 = "enmgen2_mimic_base"
      L10_320(L11_321, L12_322)
      L6_316.enmgen = L9_319
      L11_321 = L9_319
      L10_320 = L9_319.addActionArea
      L12_322 = Vector
      L12_322 = L12_322(100, 100, 100)
      L10_320(L11_321, L12_322, Vector(0, 0, 0), Quat(0, 0, 0, 1))
      L11_321 = L9_319
      L10_320 = L9_319.addRespawnArea
      L12_322 = Vector
      L12_322 = L12_322(115, 115, 115)
      L10_320(L11_321, L12_322, Vector(0, 0, 0), Quat(0, 0, 0, 1))
      L11_321 = L9_319
      L10_320 = L9_319.addActiveArea
      L12_322 = Vector
      L12_322 = L12_322(300, 300, 300)
      L10_320(L11_321, L12_322, Vector(0, 0, 0), Quat(0, 0, 0, 1))
      L11_321 = L7_317
      L10_320 = L7_317.appendChild
      L12_322 = L9_319
      L10_320(L11_321, L12_322)
      L11_321 = L9_319
      L10_320 = L9_319.setWorldPos
      L12_322 = L8_318.getWorldPos
      L12_322 = L12_322(L8_318)
      L10_320(L11_321, L12_322, L12_322(L8_318))
      L11_321 = L9_319
      L10_320 = L9_319.setSpecTableName
      L12_322 = L5_315
      L10_320(L11_321, L12_322)
      L11_321 = L9_319
      L10_320 = L9_319.try_init
      L10_320(L11_321)
      L11_321 = L9_319
      L10_320 = L9_319.waitForReady
      L10_320(L11_321)
      L11_321 = L9_319
      L10_320 = L9_319.try_start
      L10_320(L11_321)
      L11_321 = L9_319
      L10_320 = L9_319.requestSpawn
      L10_320(L11_321)
    end
  end)
end
popOreMimic = L0_0
function L0_0(A0_323, A1_324, A2_325)
  if not _get_death_ghost_load_task then
    _create_comp_death_ghost = false
    removeAllDeathGhost()
    _get_death_ghost_load_task = invokeSystemTask(function()
      local L0_326, L1_327, L2_328, L3_329, L4_330, L5_331, L6_332, L7_333, L8_334
      L0_326 = A1_324
      L1_327 = A2_325
      L2_328 = type
      L3_329 = L0_326
      L2_328 = L2_328(L3_329)
      if "string" == L2_328 then
        L2_328 = Fn_findAreaHandle
        L3_329 = L0_326
        L2_328 = L2_328(L3_329)
        L0_326 = L2_328
      end
      L2_328 = type
      L3_329 = L1_327
      L2_328 = L2_328(L3_329)
      if "string" == L2_328 then
        L2_328 = findGameObject2
        L3_329 = "Node"
        L2_328 = L2_328(L3_329, L4_330)
        L1_327 = L2_328
      end
      L2_328 = syncGhost
      L3_329 = A0_323
      L2_328 = L2_328(L3_329)
      if L2_328 ~= nil then
        L3_329 = print
        L8_334 = L4_330(L5_331, L6_332)
        L3_329(L4_330, L5_331, L6_332, L7_333, L8_334, L4_330(L5_331, L6_332))
        L3_329 = {}
        for L7_333, L8_334 in L4_330(L5_331) do
          if _creatDeathGhost(L8_334, A1_324, A2_325) then
            table.insert(L3_329, L8_334)
          end
        end
        L2_328 = nil
        _death_ghost_list = L3_329
      else
        L3_329 = print
        L3_329(L4_330)
        L3_329 = {}
        _death_ghost_list = L3_329
      end
      _create_comp_death_ghost = true
      _get_death_ghost_load_task = nil
    end)
  end
end
creatDeathGhost = L0_0
function L0_0(A0_335)
  if not _on_hold_get_death_ghost_load_task then
    _on_hold_create_comp_death_ghost = false
    _on_hold_get_death_ghost_load_task = invokeSystemTask(function()
      local L0_336, L1_337, L2_338, L3_339, L4_340, L5_341, L6_342
      L0_336 = findUpArea
      L1_337 = A0_335
      L0_336 = L0_336(L1_337)
      L1_337 = A0_335
      if not L0_336 or not L1_337 then
        L2_338(L3_339)
        _on_hold_get_death_ghost_load_task = nil
        _on_hold_create_comp_death_ghost = true
        return
      end
      if L2_338 then
        if L2_338 > 0 then
          for L5_341, L6_342 in L2_338(L3_339) do
            if L6_342.ghostPuppet then
              print("\228\191\157\231\149\153\227\129\171\227\129\151\227\129\166\227\129\132\227\129\159\227\130\180\227\131\188\227\130\185\227\131\136\239\188\154" .. L6_342.ghostPuppet:getName() .. " \231\148\159\230\136\144")
              _creatDeathGhost_last_half(L6_342, L0_336, L1_337)
              table.insert(_death_ghost_list, L6_342)
            end
          end
        end
      end
      _on_hold_death_ghost_list = L2_338
      _on_hold_get_death_ghost_load_task = nil
      _on_hold_create_comp_death_ghost = true
    end)
  end
end
dealOnHoldDeathGhost = L0_0
function L0_0()
  local L0_343, L1_344
  L0_343 = _on_hold_create_comp_death_ghost
  return L0_343
end
isCreatCompdealOnHoldDeathGhost = L0_0
function L0_0()
  local L0_345, L1_346
  L0_345 = _create_comp_death_ghost
  return L0_345
end
isCreatCompDeathGhost = L0_0
function L0_0()
  local L0_347
  L0_347 = _create_comp_death_ghost
  if L0_347 then
    L0_347 = {}
    for _FORV_4_, _FORV_5_ in pairs(_death_ghost_list) do
      table.insert(L0_347, _FORV_5_.area:getName())
    end
    return L0_347
  end
  L0_347 = nil
  return L0_347
end
gettDeathGhostSetArea = L0_0
function L0_0(A0_348)
  local L1_349, L2_350, L3_351, L4_352
  for L4_352, _FORV_5_ in L1_349(L2_350) do
    if _FORV_5_.onlineID == A0_348 then
      if _FORV_5_.task and _FORV_5_.task:isRunning() then
        _FORV_5_.task:abort()
      end
      if _FORV_5_.marker ~= nil then
        _FORV_5_.marker:setActive(false)
      end
      if _FORV_5_.ghostPuppet ~= nil and _FORV_5_.ghostPuppet:isRunning() then
        _FORV_5_.ghostPuppet:try_term()
      end
      table.remove(_death_ghost_list, L4_352)
      return
    end
  end
end
removeDeathGhost = L0_0
function L0_0()
  for _FORV_3_, _FORV_4_ in ipairs(_death_ghost_list) do
    if _FORV_4_.task then
      _FORV_4_.task:abort()
    end
    if _FORV_4_.marker ~= nil then
      _FORV_4_.marker:setActive(false)
    end
    if _FORV_4_.sfx ~= nil then
      _FORV_4_.sfx:try_term()
    end
    if _FORV_4_.ghostPuppet ~= nil then
      _FORV_4_.ghostPuppet:try_term()
    end
  end
  _death_ghost_list = {}
end
removeAllDeathGhost = L0_0
function L0_0()
  local L0_353, L1_354, L2_355, L3_356, L4_357
  for L3_356, L4_357 in L0_353(L1_354) do
    L4_357.ghostPuppet:setActive(true)
    L4_357.ghostPuppet:setVisible(true)
    if L4_357.task then
      L4_357.task:abort()
      L4_357.task = nil
    end
    L4_357.task = invokeTask(function(A0_358)
      repeat
        wait(10)
      until _checkGhost(A0_358)
      removeDeathGhost(A0_358.onlineID)
    end, L4_357)
    if L4_357.marker then
      L4_357.marker:setActive(true)
    end
  end
end
runDeathGhost = L0_0
function L0_0()
  for _FORV_3_, _FORV_4_ in pairs(_death_ghost_list) do
    _FORV_4_.ghostPuppet:setActive(false)
    _FORV_4_.ghostPuppet:setVisible(false)
    if _FORV_4_.task then
      _FORV_4_.task:abort()
      _FORV_4_.task = nil
    end
  end
end
stopDeathGhost = L0_0
function L0_0(A0_359, A1_360, A2_361)
  local L3_362
  L3_362 = A0_359.replay
  if not L3_362 then
    L3_362 = print
    L3_362(string.format("%s \227\129\174\227\131\170\227\131\151\227\131\172\227\130\164\227\131\135\227\131\188\227\130\191\227\129\140\228\184\141\230\173\163\227\129\167\227\129\153", A0_359.onlineID))
    return
  end
  L3_362 = _createGhostPuppet
  L3_362 = L3_362(A0_359.onlineID, A0_359.replay)
  A0_359.ghostPuppet = L3_362
  L3_362 = A0_359.ghostPuppet
  L3_362 = L3_362.getPuppet
  L3_362 = L3_362(L3_362)
  A0_359.puppet = L3_362
  L3_362 = A0_359.puppet
  L3_362 = L3_362.getBrain
  L3_362 = L3_362(L3_362)
  A0_359.brain = L3_362
  L3_362 = A0_359.puppet
  L3_362 = L3_362.setVisible
  L3_362(L3_362, false)
  L3_362 = 0
  A0_359.area = A0_359.brain:getArea(L3_362)
  if A0_359.area ~= nil then
    print(A0_359.onlineID .. " \227\129\175\227\128\129" .. A0_359.area:getName() .. " \227\129\171\233\133\141\231\189\174")
    _creatDeathGhost_last_half(A0_359)
  elseif A1_360 and A2_361 then
    print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\233\133\141\231\189\174\227\130\168\227\131\170\227\130\162\227\130\146\228\187\163\230\155\191\227\129\151\227\129\166\233\133\141\231\189\174\227\130\146\232\169\166\227\129\191\227\130\139 : " .. A0_359.onlineID)
    _creatDeathGhost_last_half(A0_359, A1_360, A2_361)
  else
    print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\139\227\130\137\233\133\141\231\189\174\227\130\168\227\131\170\227\130\162\227\129\174\230\138\189\229\135\186\227\129\140\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159 : " .. A0_359.onlineID)
    table.insert(_on_hold_death_ghost_list, A0_359)
    return false
  end
  return true
end
_creatDeathGhost = L0_0
function L0_0(A0_363, A1_364, A2_365)
  local L3_366, L4_367, L5_368, L6_369, L7_370
  L3_366 = 0
  if A1_364 then
    A0_363.area = A1_364
  end
  L4_367 = A0_363.brain
  L5_368 = L4_367
  L4_367 = L4_367.getLPos
  L6_369 = L3_366
  L4_367 = L4_367(L5_368, L6_369)
  L5_368 = A0_363.brain
  L6_369 = L5_368
  L5_368 = L5_368.getLAng
  L7_370 = L3_366
  L5_368 = L5_368(L6_369, L7_370)
  L6_369 = createGameObject2
  L7_370 = "Node"
  L6_369 = L6_369(L7_370)
  A0_363.node = L6_369
  L6_369 = A0_363.node
  L7_370 = L6_369
  L6_369 = L6_369.setName
  L6_369(L7_370, "locator_" .. A0_363.onlineID .. "_node")
  L6_369 = A0_363.area
  L7_370 = L6_369
  L6_369 = L6_369.appendChild
  L6_369(L7_370, A0_363.node)
  if A2_365 then
    L6_369 = A0_363.area
    L7_370 = L6_369
    L6_369 = L6_369.appendChild
    L6_369(L7_370, A0_363.node)
    L6_369 = A0_363.node
    L7_370 = L6_369
    L6_369 = L6_369.setTransform
    L6_369(L7_370, A2_365:getTransform())
    L7_370 = A2_365
    L6_369 = A2_365.getWorldPos
    L6_369 = L6_369(L7_370)
    L6_369 = L6_369 - L4_367
    L7_370 = Vector
    L7_370 = L7_370(RandF(-2, 2), RandF(2), RandF(-2, 2))
    L7_370 = L7_370:Normalize()
    L7_370.x = L7_370.x * 1.5
    L7_370.y = L7_370.y * 1.5
    L7_370.z = L7_370.z * 1.5
    L6_369 = L6_369 + L7_370
    A0_363.ghostPuppet:setOffsetVec_World(0, L6_369)
  else
    L6_369 = A0_363.area
    L7_370 = L6_369
    L6_369 = L6_369.appendChild
    L6_369(L7_370, A0_363.node)
    L6_369 = A0_363.node
    L7_370 = L6_369
    L6_369 = L6_369.setTransform
    L6_369(L7_370, L4_367, L5_368)
  end
  L6_369 = A0_363.node
  L7_370 = L6_369
  L6_369 = L6_369.try_init
  L6_369(L7_370)
  L6_369 = A0_363.node
  L7_370 = L6_369
  L6_369 = L6_369.waitForReadyAsync
  L6_369(L7_370, function(A0_371)
    A0_371:try_start()
  end)
  L6_369 = HUD
  L7_370 = L6_369
  L6_369 = L6_369.createGhostMarker
  L6_369 = L6_369(L7_370, {
    id = A0_363.onlineID,
    obj = A0_363.node,
    length = 40
  })
  A0_363.marker = L6_369
  L6_369 = A0_363.marker
  L7_370 = L6_369
  L6_369 = L6_369.setActive
  L6_369(L7_370, false)
  L6_369 = _createEffect
  L7_370 = "ef_ui_deathpar"
  L6_369 = L6_369(L7_370, "ef_ui_deathpar", A0_363.area, A0_363.node:getPos() + Vector(0, 1.5, 0))
  A0_363.sfx = L6_369
  A0_363.task = nil
end
_creatDeathGhost_last_half = L0_0
function L0_0(A0_372, A1_373)
  createGameObject2("GhostPuppet"):setName(A0_372)
  createGameObject2("GhostPuppet"):setAssetName("ghost05")
  createGameObject2("GhostPuppet"):setCopyFile(A1_373)
  createGameObject2("GhostPuppet"):setGhostType(GhostPuppet.kGhostType_ReplayOnly)
  createGameObject2("GhostPuppet"):setVisible(false)
  createGameObject2("GhostPuppet"):try_init()
  createGameObject2("GhostPuppet"):waitForReady()
  createGameObject2("GhostPuppet"):try_start()
  print("createGhost:" .. A0_372)
  return (createGameObject2("GhostPuppet"))
end
_createGhostPuppet = L0_0
function L0_0(A0_374, A1_375, A2_376, A3_377)
  local L4_378
  L4_378 = createGameObject2
  L4_378 = L4_378("Effect")
  L4_378:setName(A0_374)
  L4_378:setModelName(A1_375)
  if A2_376 then
    A2_376:appendChild(L4_378)
  end
  L4_378:setPos(A3_377)
  L4_378:try_init()
  L4_378:waitForReadyAsync(function(A0_379)
    A0_379:try_start()
    A0_379:play()
    A0_379:setLoop(true)
  end)
  return L4_378
end
_createEffect = L0_0
function L0_0(A0_380)
  local L1_381, L3_382
  L1_381 = 7
  L3_382 = 5
  if L1_381 >= Fn_getDistanceToPlayer(A0_380) and Fn_isInSightTarget(A0_380, 0.7) and Fn_isPlayerReyCheck(A0_380, L1_381) then
  else
  end
  return Fn_isInSightTarget(A0_380, 0.3) and true
end
_isGhostTouchable = L0_0
function L0_0(A0_383)
  if _isGhostTouchable(A0_383.sfx) then
    print(A0_383.onlineID .. "\227\130\146\231\153\186\232\166\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
    _touchGhost(A0_383)
    return true
  else
    return false
  end
end
_checkGhost = L0_0
function L0_0(A0_384)
  local L1_385, L2_386, L3_387, L4_388, L5_389, L6_390, L7_391, L8_392
  L1_385 = print
  L2_386 = string
  L2_386 = L2_386.format
  L3_387 = "\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136: %s \227\129\174\230\137\128\230\140\129\227\129\151\227\129\166\227\129\132\227\129\159\229\142\159\231\159\179\227\130\146\229\143\150\229\190\151\227\130\146\232\169\166\227\129\191\227\130\139"
  L8_392 = L2_386(L3_387, L4_388)
  L1_385(L2_386, L3_387, L4_388, L5_389, L6_390, L7_391, L8_392, L2_386(L3_387, L4_388))
  L1_385 = Ugc
  L2_386 = L1_385
  L1_385 = L1_385.touchDeathGhost
  L3_387 = A0_384.onlineID
  L1_385 = L1_385(L2_386, L3_387)
  L2_386 = A0_384.sfx
  L3_387 = L2_386
  L2_386 = L2_386.try_term
  L2_386(L3_387)
  A0_384.sfx = nil
  L2_386 = A0_384.brain
  L3_387 = L2_386
  L2_386 = L2_386.getCnt
  L2_386 = L2_386(L3_387)
  L3_387 = GameDatabase
  L3_387 = L3_387.get
  L3_387 = L3_387(L4_388, L5_389)
  L3_387 = L3_387 + 1
  if L3_387 > 9999999 then
    L3_387 = 9999999
  end
  L7_391 = L3_387
  L4_388(L5_389, L6_390, L7_391)
  L4_388(L5_389, L6_390)
  for L7_391 = 1, #L1_385 do
    L8_392 = GlobalGem
    L8_392 = L8_392.convertTalismanOreInfo
    L8_392 = L8_392(L8_392, L1_385[L7_391].Hi, L1_385[L7_391].Lo, L1_385[L7_391].Other)
    L8_392.rare = getAcquireTalismanStoneRarity(L8_392.formId, L8_392.NameRarity)
    oreDrop2(L8_392, A0_384.node)
  end
  L7_391 = A0_384.onlineID
  L8_392 = L5_389(L6_390, L7_391)
  L4_388(L5_389, L6_390, L7_391, L8_392, L5_389(L6_390, L7_391))
  L4_388(L5_389, L6_390)
  L4_388(L5_389, L6_390)
  L4_388(L5_389, L6_390)
  L7_391 = 0
  L8_392 = 2.5
  L4_388(L5_389, L6_390, L7_391, L8_392)
  L4_388(L5_389)
  repeat
    L4_388()
  until L4_388
  L7_391 = A0_384.onlineID
  L8_392 = L5_389(L6_390, L7_391)
  L4_388(L5_389, L6_390, L7_391, L8_392, L5_389(L6_390, L7_391))
  L4_388(L5_389)
end
_touchGhost = L0_0
function L0_0(A0_393)
  local L1_394, L2_395, L3_396
  L1_394 = print
  L2_395 = "\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\229\143\151\228\191\161"
  L1_394(L2_395)
  L1_394 = 900
  L2_395 = 1
  L3_396 = nil
  repeat
    L2_395, L3_396 = Ugc:getDeathGhostInfo(A0_393)
    print("getDeathGhostInfo:", L2_395)
    L1_394 = L1_394 - 1
    if L1_394 < 0 then
      print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\227\131\135\227\131\188\227\130\191\227\130\146\229\143\151\227\129\145\229\143\150\227\130\140\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130")
      break
    end
    wait()
  until L2_395 == 0
  if L2_395 ~= 0 then
    L3_396 = nil
  end
  return L3_396
end
syncGhost = L0_0
function L0_0()
  Ugc:mineSetSendCallback(callMineGetLocal)
  Ugc:mineSetRecvCallback(nil)
  loadGameDataBaseToMineInfo()
end
netWorkInit = L0_0
function L0_0()
  local L0_397, L1_398, L2_399, L3_400, L4_401, L5_402, L6_403
  L0_397 = {}
  for L4_401, L5_402 in L1_398(L2_399) do
    L6_403 = {}
    L6_403.id = L5_402.id
    L6_403.limit = L5_402.offline.limit
    L6_403.total = L5_402.offline.total
    table.insert(L0_397, L6_403)
  end
  L3_400.id = -999
  L3_400.offline = true
  L3_400.limit = 0
  L3_400.total = 0
  L1_398(L2_399, L3_400)
  return L0_397
end
callMineGetLocal = L0_0
function L0_0(A0_404)
  local L1_405, L2_406, L3_407, L4_408, L5_409
  for L4_408, L5_409 in L1_405(L2_406) do
    if L5_409.id == A0_404 then
      return L5_409, L4_408
    end
  end
  return L1_405, L2_406
end
findIdToMineInfoRecord = L0_0
function L0_0()
  local L0_410, L1_411, L2_412, L3_413, L4_414, L5_415, L6_416
  for L3_413, L4_414 in L0_410(L1_411) do
    L5_415 = {}
    L6_416 = string
    L6_416 = L6_416.format
    L6_416 = L6_416("Savedata__MineInfo__%s", L3_413)
    table.insert(L5_415, ggd[L6_416 .. "__offline__add"])
    table.insert(L5_415, ggd[L6_416 .. "__offline__total"])
    table.insert(L5_415, ggd[L6_416 .. "__offline__init_executionDate"])
    table.insert(L5_415, ggd[L6_416 .. "__offline__sum_executionDate"])
    table.insert(L5_415, ggd[L6_416 .. "__mine99_depth"])
    table.insert(L5_415, ggd[L6_416 .. "__boss_deadlineDate"])
    table.insert(L5_415, ggd[L6_416 .. "__open_mine99"])
    table.insert(L5_415, ggd[L6_416 .. "__permit_mine99"])
    table.insert(L5_415, ggd[L6_416 .. "__boss_come_in"])
    table.insert(L5_415, ggd[L6_416 .. "__gravityore_lottery_executionDate"])
    table.insert(L5_415, ggd[L6_416 .. "__gravityore_retention_period"])
    L4_414.receive.depth = GameDatabase:get(L5_415)[ggd[L6_416 .. "__mine99_depth"]]
    L4_414.offline.add = GameDatabase:get(L5_415)[ggd[L6_416 .. "__offline__add"]]
    L4_414.offline.total = GameDatabase:get(L5_415)[ggd[L6_416 .. "__offline__total"]]
    L4_414.offline.init_executionDate = sdateTime.getNowTickTime(GameDatabase:get(L5_415)[ggd[L6_416 .. "__offline__init_executionDate"]])
    L4_414.offline.sum_executionDate = sdateTime.getNowTickTime(GameDatabase:get(L5_415)[ggd[L6_416 .. "__offline__sum_executionDate"]])
    L4_414.boss_deadline = sdateTime.getNowTickTime(GameDatabase:get(L5_415)[ggd[L6_416 .. "__boss_deadlineDate"]])
    L4_414.is_mine99_open = GameDatabase:get(L5_415)[ggd[L6_416 .. "__open_mine99"]]
    L4_414.is_mine99_permit = GameDatabase:get(L5_415)[ggd[L6_416 .. "__permit_mine99"]]
    L4_414.is_boss_come_in = GameDatabase:get(L5_415)[ggd[L6_416 .. "__boss_come_in"]]
    L4_414.gravityore_lottery_executionDate = sdateTime.getNowTickTime(GameDatabase:get(L5_415)[ggd[L6_416 .. "__gravityore_lottery_executionDate"]])
    L4_414.receive.retention_period = GameDatabase:get(L5_415)[ggd[L6_416 .. "__gravityore_retention_period"]]
    if not L4_414.offline.sum_executionDate:getEnable() then
      L4_414.offline.sum_executionDate = sdateTime.getNowTickTime()
    end
    L4_414.receive.total = L4_414.offline.total
    L4_414.receive.limit = L4_414.offline.limit
    L4_414.gravity_density = _funcMathGravityDensity(L4_414.receive.total, L4_414.receive.limit)
    L4_414.gravity_density_level = _funcMathGravityDensityLevel(L4_414.gravity_density)
  end
end
loadGameDataBaseToMineInfo = L0_0
function L0_0()
  local L0_417, L1_418, L2_419, L3_420, L4_421, L5_422, L6_423
  for L3_420, L4_421 in L0_417(L1_418) do
    L5_422 = {}
    L6_423 = string
    L6_423 = L6_423.format
    L6_423 = L6_423("Savedata__MineInfo__%s", L3_420)
    L5_422[ggd[L6_423 .. "__offline__add"]] = L4_421.offline.add
    L5_422[ggd[L6_423 .. "__offline__total"]] = L4_421.offline.total
    L5_422[ggd[L6_423 .. "__offline__init_executionDate"]] = L4_421.offline.init_executionDate:getOutputText()
    L5_422[ggd[L6_423 .. "__offline__sum_executionDate"]] = L4_421.offline.sum_executionDate:getOutputText()
    L5_422[ggd[L6_423 .. "__mine99_depth"]] = L4_421.receive.depth
    L5_422[ggd[L6_423 .. "__boss_deadlineDate"]] = L4_421.boss_deadline:getOutputText()
    L5_422[ggd[L6_423 .. "__open_mine99"]] = L4_421.is_mine99_open
    L5_422[ggd[L6_423 .. "__permit_mine99"]] = L4_421.is_mine99_permit
    L5_422[ggd[L6_423 .. "__boss_come_in"]] = L4_421.is_boss_come_in
    L5_422[ggd[L6_423 .. "__gravityore_lottery_executionDate"]] = L4_421.gravityore_lottery_executionDate:getOutputText()
    L5_422[ggd[L6_423 .. "__gravityore_retention_period"]] = L4_421.receive.retention_period
    GameDatabase:set(L5_422)
    GameDatabase:backup(L5_422)
  end
end
saveMineInfoToGameDataBase = L0_0
function L0_0(A0_424)
  local L1_425, L2_426, L3_427, L4_428, L5_429, L6_430, L7_431, L8_432, L9_433, L10_434
  L1_425 = nil
  L2_426 = Ugc
  L3_427 = L2_426
  L2_426 = L2_426.getParamTable
  L2_426 = L2_426(L3_427)
  if L2_426 then
    L4_428 = L2_426
    L3_427 = L2_426.getRoot
    L3_427 = L3_427(L4_428)
    if L3_427 then
      L4_428 = Yaml
      L4_428 = L4_428.convertToLua
      L4_428 = L4_428(L5_429, L6_430)
      if L4_428 then
        if L5_429 == nil then
          L1_425 = L4_428
        else
          L1_425 = L4_428.mine
        end
        if L5_429 ~= "table" then
          L1_425 = L5_429
        end
      end
    end
  end
  L3_427 = {
    L4_428,
    L5_429,
    L6_430
  }
  L4_428 = "depth"
  function L4_428(A0_435, A1_436)
    if not A1_436 then
      return nil
    end
    for _FORV_5_, _FORV_6_ in pairs(A1_436) do
      if _FORV_6_.id == A0_435 then
        for _FORV_11_, _FORV_12_ in ipairs(L3_427) do
          ;({})[_FORV_12_] = _FORV_6_[_FORV_12_] or mine_record.offline[_FORV_12_]
        end
        return {}
      end
    end
    return nil
  end
  for L8_432, L9_433 in L5_429(L6_430) do
    L10_434 = checkExclusionMine
    L10_434 = L10_434(L8_432, A0_424)
    if L10_434 then
      L10_434 = L4_428
      L10_434 = L10_434(L9_433.id, L1_425)
      if L10_434 then
        for _FORV_14_, _FORV_15_ in pairs(L10_434) do
          if L9_433.receive[_FORV_14_] ~= _FORV_15_ then
            _ggd_mine_overwrite = true
          end
          L9_433.receive[_FORV_14_] = _FORV_15_
        end
      else
        for _FORV_14_, _FORV_15_ in pairs(L3_427) do
          if L9_433.receive[key] ~= L9_433.offline[_FORV_15_] then
            _ggd_mine_overwrite = true
          end
          L9_433.receive[_FORV_15_] = L9_433.offline[_FORV_15_]
        end
      end
    end
  end
end
syncMineParams = L0_0
function L0_0(A0_437)
  local L1_438, L2_439, L3_440, L4_441, L5_442, L6_443, L7_444
  L1_438 = Ugc
  L2_439 = L1_438
  L1_438 = L1_438.mineGet
  L1_438 = L1_438(L2_439)
  if L1_438 ~= nil then
    L2_439 = table
    L2_439 = L2_439.maxn
    L3_440 = L1_438
    L2_439 = L2_439(L3_440)
  elseif L2_439 == 0 then
    L2_439 = {}
    L1_438 = L2_439
  end
  function L2_439(A0_445, A1_446)
    if not A1_446 then
      return nil
    end
    for _FORV_5_, _FORV_6_ in pairs(A1_446) do
      if A0_445 == _FORV_6_.id then
        return _FORV_6_.limit, _FORV_6_.total
      end
    end
    return nil, nil
  end
  L3_440 = true
  if L4_441 <= 0 then
    L3_440 = false
  end
  for L7_444, _FORV_8_ in L4_441(L5_442) do
    if checkExclusionMine(L7_444, A0_437) then
      _FORV_8_.receive.limit = L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.limit
      _FORV_8_.receive.total = L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.total
      if L3_440 and _FORV_8_.offline.total ~= math.floor((L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.total) * (_FORV_8_.offline.limit / (L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.limit))) then
        if math.floor((L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.total) * (_FORV_8_.offline.limit / (L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.limit))) < _FORV_8_.offline.limit then
          _FORV_8_.offline.init_executionDate:Invalid()
        else
          _FORV_8_.offline.init_executionDate = ItAddsAValueToTheSdatatime(_currentTickTime, {
            minute = _FORV_8_.receive.boss_time
          })
        end
        _FORV_8_.offline.total = math.floor((L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.total) * (_FORV_8_.offline.limit / (L2_439(_FORV_8_.id, L1_438) or _FORV_8_.offline.limit)))
        _ggd_mine_overwrite = true
      end
    end
  end
end
syncMineInfo = L0_0
function L0_0(A0_447, A1_448)
  local L3_449
  L3_449 = math
  L3_449 = L3_449.min
  return L3_449(100, math.floor(A0_447 / A1_448 * 100))
end
_funcMathGravityDensity = L0_0
function L0_0(A0_450)
  local L1_451
  L1_451 = math
  L1_451 = L1_451.floor
  L1_451 = L1_451(A0_450 * 7 / 100)
  L1_451 = math.max(L1_451, 0)
  L1_451 = math.min(L1_451, 7)
  return L1_451
end
_funcMathGravityDensityLevel = L0_0
function L0_0(A0_452)
  local L1_453, L2_454
  L1_453 = 0
  L2_454 = _mine_info
  L2_454 = L2_454[A0_452]
  if L2_454 then
    L2_454 = _mine_info
    L2_454 = L2_454[A0_452]
    L1_453 = L2_454.gravity_density
  end
  return L1_453
end
getGravityDensityPercent = L0_0
function L0_0(A0_455, A1_456)
  local L2_457, L3_458, L4_459
  L2_457 = getGravityDensityPercent
  L3_458 = A0_455
  L2_457 = L2_457(L3_458)
  L3_458 = 100 - L2_457
  L3_458 = L3_458 * 0.01
  L4_459 = math
  L4_459 = L4_459.floor
  L4_459 = L4_459(A1_456 * L3_458)
  L4_459 = math.max(0, L4_459)
  L4_459 = math.min(A1_456, L4_459)
  return L4_459
end
getGravityOreCreateCount = L0_0
function L0_0(A0_460, A1_461)
  if "string" == type(A0_460) then
    if _mine_info[A0_460] then
      _mine_info[A0_460].offline.add = _mine_info[A0_460].offline.add + A1_461
    end
  elseif "number" == type(A0_460) and findIdToMineInfoRecord(A0_460) then
    findIdToMineInfoRecord(A0_460).offline.add = findIdToMineInfoRecord(A0_460).offline.add + A1_461
  end
end
addGravityOreMinedCount = L0_0
function L0_0(A0_462, A1_463, A2_464)
  invokeTask(function()
    local L0_465, L1_466, L2_467, L3_468, L4_469, L5_470
    L0_465 = Fn_findAreaHandle
    L1_466 = A0_462
    L0_465 = L0_465(L1_466)
    if L0_465 then
      L1_466 = mine_tbl
      L2_467 = _mineName
      L1_466 = L1_466[L2_467]
      L1_466 = L1_466.gacha
      L1_466 = L1_466.area
      L2_467 = mine_tbl
      L3_468 = _mineName
      L2_467 = L2_467[L3_468]
      L2_467 = L2_467.gacha
      L2_467 = L2_467.num
      L3_468 = CreateTalismanGacha
      L3_468 = L3_468()
      L4_469 = L3_468.GetStoneLotOneRareNevi
      L5_470 = "infinite"
      L4_469 = L4_469(L5_470, L2_467)
      L5_470 = createGameObject2
      L5_470 = L5_470("Node")
      L5_470:setName("gravity_ore_drop_pos")
      L0_465:appendChild(L5_470)
      L5_470:setTransform(A1_463, A2_464)
      L5_470:try_init()
      L5_470:waitForReady()
      L5_470:try_start()
      oreDrop3(L4_469, L5_470, L5_470)
      wait()
    end
  end)
end
dropGraviryOre = L0_0
function L0_0(A0_471, A1_472, A2_473, A3_474)
  local L4_475, L5_476
  L4_475 = A2_473 or "normal"
  L5_476 = A3_474 or 1
  if (not A2_473 or not A3_474) and mine_tbl[_mineName] then
    if mine_tbl[_mineName].gacha.area == "normal" then
    else
    end
    L5_476, L4_475 = mine_tbl[_mineName].gacha.num + 5, "infinite"
  end
  invokeSystemTask(function(A0_477, A1_478, A2_479, A3_480)
    local L4_481, L5_482, L6_483, L7_484, L8_485
    L4_481 = CreateTalismanGacha
    L4_481 = L4_481()
    L5_482 = L4_481.GetStoneLotOneRareNevi
    L6_483 = A2_479
    L7_484 = A3_480
    L5_482 = L5_482(L6_483, L7_484)
    L6_483 = {
      L7_484,
      L8_485,
      HUD.kStackTelop_Type_Triangle
    }
    L7_484 = HUD
    L7_484 = L7_484.kStackTelop_Type_Circle
    L8_485 = HUD
    L8_485 = L8_485.kStackTelop_Type_Square
    L7_484 = print
    L8_485 = "\229\142\159\231\159\179\227\130\146\227\131\137\227\131\173\227\131\131\227\131\151\227\129\151\227\129\190\227\129\153 --------------"
    L7_484(L8_485)
    L7_484 = print
    L8_485 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\131\162\227\131\135\227\131\171="
    L8_485 = L8_485 .. L5_482.model
    L7_484(L8_485)
    L7_484 = print
    L8_485 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\229\144\141\229\137\141="
    L8_485 = L8_485 .. L5_482.name
    L7_484(L8_485)
    L7_484 = print
    L8_485 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1711="
    L8_485 = L8_485 .. L5_482.skill1
    L7_484(L8_485)
    L7_484 = print
    L8_485 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1712="
    L8_485 = L8_485 .. L5_482.skill2
    L7_484(L8_485)
    L7_484 = print
    L8_485 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\129\174\227\130\185\227\130\173\227\131\1713="
    L8_485 = L8_485 .. L5_482.skill3
    L7_484(L8_485)
    L7_484 = createGameObject2
    L8_485 = "Talisman"
    L7_484 = L7_484(L8_485)
    L8_485 = L7_484.setName
    L8_485(L7_484, "mine_talisman")
    L8_485 = L7_484.setModelNo
    L8_485(L7_484, L5_482.model)
    L8_485 = L7_484.setWorldPos
    L8_485(L7_484, A1_478.pos)
    L8_485 = L7_484.setDynamic
    L8_485(L7_484, true)
    L8_485 = L7_484.setSkilId
    L8_485(L7_484, L5_482.skill1, L5_482.skill2, L5_482.skill3)
    L8_485 = getAcquireTalismanSe
    L8_485 = L8_485(L5_482.rare)
    L7_484:setGetSe(L8_485)
    if L5_482.rare % 2 == 0 then
      L7_484:setNameRarity(Talisman.kNameHiLo_Hi)
    else
      L7_484:setNameRarity(Talisman.kNameHiLo_Lo)
    end
    L7_484:try_init()
    L7_484:waitForReady()
    L7_484:try_start()
    L7_484:setImpulse(A1_478.impulse)
  end, A0_471, A1_472, L4_475, L5_476)
end
EnemyDropGraviryOre = L0_0
function L0_0(A0_486)
  local L1_487
  L1_487 = _debugDispX
  L1_487 = L1_487 + (Debug:isDebugMenuOpen() and 250 or 50)
  Font:debugPrint(L1_487, 15 + 20 * _debugLine, A0_486)
  _debugLine = _debugLine + 1
end
debugDispPrint = L0_0
function L0_0(A0_488)
  print(" < Mine Manager > " .. A0_488)
end
debugPrint = L0_0
L0_0 = {}
L0_0.name = "DEBUG MINE"
L0_0.disp_mined_onoff = -1
L0_0.setting_mine_mined = 50
L0_0.disp_gravity_ore = -1
L0_0.ls_mine_info = 1
L1_1 = {}
L0_0.ls_mine_info_record = L1_1
L0_0.disp_mine_info_onoff = -1
L0_0.disp_OnOrOffServerStatus_onoff = -1
L0_0.debugSettingDateYear = 0
L0_0.debugSettingDateMonth = 0
L0_0.debugSettingDateDay = 0
L0_0.debugSettingDateHour = 0
L0_0.debugSettingDateMinute = 1
L0_0.disp_displayCurrentTimeWatch = -1
function L1_1(A0_489)
  if false == A0_489:getEnable() then
    return sdateTime.getNowTickTime(_currentTickTime.date)
  end
  return (ItAddsAValueToTheSdatatime(A0_489, {
    year = _debug_minemanager.debugSettingDateYear,
    month = _debug_minemanager.debugSettingDateMonth,
    day = _debug_minemanager.debugSettingDateDay,
    hour = _debug_minemanager.debugSettingDateHour,
    minute = _debug_minemanager.debugSettingDateMinute
  }))
end
L0_0.debugSdateTimeAdd = L1_1
function L1_1(A0_490)
  return sdateTime.getNowTickTime("None")
end
L0_0.debugSdateTimeSub = L1_1
L1_1 = "children"
L2_2 = {
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  {
    name = "display GravityOre",
    callback = function()
      local L1_491
      L1_491 = _debug_minemanager
      L1_491.disp_gravity_ore = -_debug_minemanager.disp_gravity_ore
    end,
    getVisible = function()
      if 0 < _debug_minemanager.disp_gravity_ore and _mine_state and _mine_state:getState() == MINE_STATE.RUN then
        return true
      end
      return false
    end,
    getString = function()
      local L0_492, L1_493
      L0_492 = _debug_minemanager
      L0_492 = L0_492.disp_gravity_ore
      if L0_492 > 0 then
        L0_492 = _mine_state
        if L0_492 then
          L0_492 = _mine_state
          L1_493 = L0_492
          L0_492 = L0_492.getState
          L0_492 = L0_492(L1_493)
          L1_493 = MINE_STATE
          L1_493 = L1_493.RUN
          if L0_492 == L1_493 then
            L0_492 = {}
            L1_493 = _MINE_STATE_RUN
            L1_493 = L1_493.OreMgr
            if L1_493 then
              L1_493 = _MINE_STATE_RUN
              L1_493 = L1_493.OreMgr
              L1_493 = L1_493.getActiveNum
              L1_493 = L1_493(L1_493)
              table.insert(L0_492, string.format("Base GarvityOre ActiveNum (%d/%d)", L1_493 - _MINE_STATE_RUN.OreMgr:getBrokeNum(), L1_493))
            end
            L1_493 = _MINE_STATE_RUN
            L1_493 = L1_493.AddOreMgr
            if L1_493 then
              L1_493 = _MINE_STATE_RUN
              L1_493 = L1_493.AddOreMgr
              L1_493 = L1_493.getActiveNum
              L1_493 = L1_493(L1_493)
              table.insert(L0_492, string.format("Add GarvityOre ActiveNum (%d/%d)", L1_493 - _MINE_STATE_RUN.AddOreMgr:getBrokeNum(), L1_493))
            end
            return L0_492
          end
        end
      end
      L0_492 = ""
      return L0_492
    end
  },
  {
    name = "setting mine",
    getVisible = function()
      local L0_494, L1_495
      L0_494 = false
      return L0_494
    end,
    getString = function()
      local L0_496, L1_497
      L0_496 = ""
      return L0_496
    end,
    children = {
      {
        name = "MINE NAME",
        get = function()
          local L0_498
          L0_498 = ""
          _debug_minemanager.ls_mine_info_record, L0_498 = findIdToMineInfoRecord(_debug_minemanager.ls_mine_info)
          return L0_498
        end,
        up = function()
          local L0_499, L1_500
          L0_499 = _debug_minemanager
          L1_500 = _debug_minemanager
          L1_500 = L1_500.ls_mine_info
          L1_500 = L1_500 + 1
          L0_499.ls_mine_info = L1_500
          L0_499 = _debug_minemanager
          L0_499 = L0_499.ls_mine_info
          if L0_499 > 5 then
            L0_499 = _debug_minemanager
            L0_499.ls_mine_info = 1
          end
        end,
        down = function()
          local L0_501, L1_502
          L0_501 = _debug_minemanager
          L1_502 = _debug_minemanager
          L1_502 = L1_502.ls_mine_info
          L1_502 = L1_502 - 1
          L0_501.ls_mine_info = L1_502
          L0_501 = _debug_minemanager
          L0_501 = L0_501.ls_mine_info
          if L0_501 < 1 then
            L0_501 = _debug_minemanager
            L0_501.ls_mine_info = 5
          end
        end
      },
      {
        name = "gravity density",
        get = function()
          if _mine_state and _mine_state:getState() == MINE_STATE.MINE_EXCEPT then
            return "<Editable>"
          end
          return "<Unable to edit>"
        end
      },
      {
        name = "  - value",
        get = function()
          return tostring(_debug_minemanager.setting_mine_mined)
        end,
        up = function()
          local L0_503, L1_504
          L0_503 = _debug_minemanager
          L1_504 = _debug_minemanager
          L1_504 = L1_504.setting_mine_mined
          L1_504 = L1_504 + 10
          L0_503.setting_mine_mined = L1_504
          L0_503 = _debug_minemanager
          L0_503 = L0_503.setting_mine_mined
          if L0_503 > 100 then
            L0_503 = _debug_minemanager
            L0_503.setting_mine_mined = 0
          end
        end,
        down = function()
          local L0_505, L1_506
          L0_505 = _debug_minemanager
          L1_506 = _debug_minemanager
          L1_506 = L1_506.setting_mine_mined
          L1_506 = L1_506 - 10
          L0_505.setting_mine_mined = L1_506
          L0_505 = _debug_minemanager
          L0_505 = L0_505.setting_mine_mined
          if L0_505 < 0 then
            L0_505 = _debug_minemanager
            L0_505.setting_mine_mined = 100
          end
        end
      },
      {
        name = "  - run",
        callback = function()
          if _mine_state and _mine_state:getState() == MINE_STATE.MINE_EXCEPT or _mine_state and _mine_state:getState() == MINE_STATE.MINE_SETUP then
            _debug_minemanager.ls_mine_info_record.offline.sum_executionDate = ItAddsAValueToTheSdatatime(_currentTickTime, {
              minute = _debug_minemanager.ls_mine_info_record.offline.sum_time
            })
            _debug_minemanager.ls_mine_info_record.offline.total = _debug_minemanager.ls_mine_info_record.offline.limit * (_debug_minemanager.setting_mine_mined * 0.01)
            _debug_minemanager.ls_mine_info_record.boss_deadline:Invalid()
            _debug_minemanager.ls_mine_info_record.is_boss_come_in = false
            _debug_minemanager.ls_mine_info_record.is_mine99_open = false
            _debug_minemanager.ls_mine_info_record.is_mine99_permit = true
            debugPrint("DEBUG COMMAND RUN : \233\135\141\229\138\155\229\190\174\229\173\144\230\191\131\229\186\166\227\129\174\232\168\173\229\174\154\227\130\146\229\174\159\232\161\140")
          else
            debugPrint("DEBUG COMMAND CANCEL : \230\142\161\230\142\152\229\160\180\229\135\166\231\144\134\229\174\159\232\161\140\228\184\173\227\129\174\231\130\186\227\128\129\233\135\141\229\138\155\229\190\174\229\173\144\230\191\131\229\186\166\227\129\174\232\168\173\229\174\154\227\130\146\228\184\173\230\173\162")
          end
        end
      }
    }
  },
  {
    name = "display _mine_info",
    children = {
      {
        name = "disp",
        callback = function()
          local L1_507
          L1_507 = _debug_minemanager
          L1_507.disp_mine_info_onoff = _debug_minemanager.disp_mine_info_onoff * -1
        end
      },
      {
        name = "MINE NAME",
        get = function()
          local L0_508
          L0_508 = ""
          _debug_minemanager.ls_mine_info_record, L0_508 = findIdToMineInfoRecord(_debug_minemanager.ls_mine_info)
          return L0_508
        end,
        up = function()
          local L0_509, L1_510
          L0_509 = _debug_minemanager
          L1_510 = _debug_minemanager
          L1_510 = L1_510.ls_mine_info
          L1_510 = L1_510 + 1
          L0_509.ls_mine_info = L1_510
          L0_509 = _debug_minemanager
          L0_509 = L0_509.ls_mine_info
          if L0_509 > 5 then
            L0_509 = _debug_minemanager
            L0_509.ls_mine_info = 1
          end
        end,
        down = function()
          local L0_511, L1_512
          L0_511 = _debug_minemanager
          L1_512 = _debug_minemanager
          L1_512 = L1_512.ls_mine_info
          L1_512 = L1_512 - 1
          L0_511.ls_mine_info = L1_512
          L0_511 = _debug_minemanager
          L0_511 = L0_511.ls_mine_info
          if L0_511 < 1 then
            L0_511 = _debug_minemanager
            L0_511.ls_mine_info = 5
          end
        end
      },
      {
        name = "receive",
        get = function()
          local L0_513, L1_514
          L0_513 = "<Unable to edit>"
          return L0_513
        end
      },
      {
        name = " - total",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.receive.total)
        end
      },
      {
        name = " - limit",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.receive.limit)
        end
      },
      {
        name = " - depth",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.receive.depth)
        end
      },
      {
        name = " - boss_time",
        get = function()
          return string.format("%d(min)", _debug_minemanager.ls_mine_info_record.receive.boss_time)
        end
      },
      {
        name = " - retention_period",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.receive.retention_period)
        end
      },
      {
        name = "offline",
        get = function()
          local L0_515, L1_516
          L0_515 = "<Editable>"
          return L0_515
        end
      },
      {
        name = " - total",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.total)
        end,
        up = function()
          local L0_517
          L0_517 = _debug_minemanager
          L0_517 = L0_517.ls_mine_info_record
          L0_517 = L0_517.offline
          L0_517.total = math.min(_debug_minemanager.ls_mine_info_record.offline.limit, _debug_minemanager.ls_mine_info_record.offline.total + 1)
        end,
        down = function()
          local L0_518
          L0_518 = _debug_minemanager
          L0_518 = L0_518.ls_mine_info_record
          L0_518 = L0_518.offline
          L0_518.total = math.max(0, _debug_minemanager.ls_mine_info_record.offline.total - 1)
        end
      },
      {
        name = " - add",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.add)
        end,
        up = function()
          local L0_519
          L0_519 = _debug_minemanager
          L0_519 = L0_519.ls_mine_info_record
          L0_519 = L0_519.offline
          L0_519.add = math.min(_debug_minemanager.ls_mine_info_record.offline.add_max, _debug_minemanager.ls_mine_info_record.offline.add + 1)
        end,
        down = function()
          local L0_520
          L0_520 = _debug_minemanager
          L0_520 = L0_520.ls_mine_info_record
          L0_520 = L0_520.offline
          L0_520.add = math.max(0, _debug_minemanager.ls_mine_info_record.offline.add - 1)
        end
      },
      {
        name = " - limit",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.limit)
        end,
        up = function()
          local L0_521
          L0_521 = _debug_minemanager
          L0_521 = L0_521.ls_mine_info_record
          L0_521 = L0_521.offline
          L0_521.limit = _debug_minemanager.ls_mine_info_record.offline.limit + 1
          L0_521 = _debug_minemanager
          L0_521 = L0_521.ls_mine_info_record
          L0_521 = L0_521.offline
          L0_521.total = math.min(_debug_minemanager.ls_mine_info_record.offline.total, _debug_minemanager.ls_mine_info_record.offline.limit)
        end,
        down = function()
          local L0_522
          L0_522 = _debug_minemanager
          L0_522 = L0_522.ls_mine_info_record
          L0_522 = L0_522.offline
          L0_522.limit = math.max(1, _debug_minemanager.ls_mine_info_record.offline.limit - 1)
          L0_522 = _debug_minemanager
          L0_522 = L0_522.ls_mine_info_record
          L0_522 = L0_522.offline
          L0_522.total = math.min(_debug_minemanager.ls_mine_info_record.offline.total, _debug_minemanager.ls_mine_info_record.offline.limit)
        end
      },
      {
        name = " - add_max",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.add_max)
        end,
        up = function()
          local L0_523, L1_524
          L0_523 = _debug_minemanager
          L0_523 = L0_523.ls_mine_info_record
          L0_523 = L0_523.offline
          L1_524 = _debug_minemanager
          L1_524 = L1_524.ls_mine_info_record
          L1_524 = L1_524.offline
          L1_524 = L1_524.add_max
          L1_524 = L1_524 + 1
          L0_523.add_max = L1_524
        end,
        down = function()
          local L0_525
          L0_525 = _debug_minemanager
          L0_525 = L0_525.ls_mine_info_record
          L0_525 = L0_525.offline
          L0_525.add_max = math.max(_debug_minemanager.ls_mine_info_record.offline.add_min, _debug_minemanager.ls_mine_info_record.offline.add_max - 1)
        end
      },
      {
        name = " - add_min",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.add_min)
        end,
        up = function()
          local L0_526
          L0_526 = _debug_minemanager
          L0_526 = L0_526.ls_mine_info_record
          L0_526 = L0_526.offline
          L0_526.add_min = math.min(_debug_minemanager.ls_mine_info_record.offline.add_max, _debug_minemanager.ls_mine_info_record.offline.add_min + 1)
        end,
        down = function()
          local L0_527
          L0_527 = _debug_minemanager
          L0_527 = L0_527.ls_mine_info_record
          L0_527 = L0_527.offline
          L0_527.add_min = math.max(0, _debug_minemanager.ls_mine_info_record.offline.add_min - 1)
        end
      },
      {
        name = " - sum_time",
        get = function()
          return string.format("%d(min)", _debug_minemanager.ls_mine_info_record.offline.sum_time)
        end,
        up = function()
          local L0_528, L1_529
          L0_528 = _debug_minemanager
          L0_528 = L0_528.ls_mine_info_record
          L0_528 = L0_528.offline
          L1_529 = _debug_minemanager
          L1_529 = L1_529.ls_mine_info_record
          L1_529 = L1_529.offline
          L1_529 = L1_529.sum_time
          L1_529 = L1_529 + 1
          L0_528.sum_time = L1_529
        end,
        down = function()
          local L0_530
          L0_530 = _debug_minemanager
          L0_530 = L0_530.ls_mine_info_record
          L0_530 = L0_530.offline
          L0_530.sum_time = math.max(0, _debug_minemanager.ls_mine_info_record.offline.sum_time - 1)
        end
      },
      {
        name = " - init_time",
        get = function()
          return string.format("%d(min)", _debug_minemanager.ls_mine_info_record.offline.init_time)
        end,
        up = function()
          local L0_531, L1_532
          L0_531 = _debug_minemanager
          L0_531 = L0_531.ls_mine_info_record
          L0_531 = L0_531.offline
          L1_532 = _debug_minemanager
          L1_532 = L1_532.ls_mine_info_record
          L1_532 = L1_532.offline
          L1_532 = L1_532.init_time
          L1_532 = L1_532 + 1
          L0_531.init_time = L1_532
        end,
        down = function()
          local L0_533
          L0_533 = _debug_minemanager
          L0_533 = L0_533.ls_mine_info_record
          L0_533 = L0_533.offline
          L0_533.init_time = math.max(0, _debug_minemanager.ls_mine_info_record.offline.init_time - 1)
        end
      },
      {
        name = " - depth",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.depth)
        end,
        up = function()
          local L0_534
          L0_534 = _debug_minemanager
          L0_534 = L0_534.ls_mine_info_record
          L0_534 = L0_534.offline
          L0_534.depth = math.min(getMine99Depth(), _debug_minemanager.ls_mine_info_record.offline.depth + 1)
        end,
        down = function()
          local L0_535
          L0_535 = _debug_minemanager
          L0_535 = L0_535.ls_mine_info_record
          L0_535 = L0_535.offline
          L0_535.depth = math.max(1, _debug_minemanager.ls_mine_info_record.offline.depth - 1)
        end
      },
      {
        name = " - boss_time",
        get = function()
          return string.format("%d(min)", _debug_minemanager.ls_mine_info_record.offline.boss_time)
        end,
        up = function()
          local L0_536, L1_537
          L0_536 = _debug_minemanager
          L0_536 = L0_536.ls_mine_info_record
          L0_536 = L0_536.offline
          L1_537 = _debug_minemanager
          L1_537 = L1_537.ls_mine_info_record
          L1_537 = L1_537.offline
          L1_537 = L1_537.boss_time
          L1_537 = L1_537 + 1
          L0_536.boss_time = L1_537
        end,
        down = function()
          local L0_538
          L0_538 = _debug_minemanager
          L0_538 = L0_538.ls_mine_info_record
          L0_538 = L0_538.offline
          L0_538.boss_time = math.max(0, _debug_minemanager.ls_mine_info_record.offline.boss_time - 1)
        end
      },
      {
        name = " - retention_period",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.offline.retention_period)
        end,
        up = function()
          local L0_539, L1_540
          L0_539 = _debug_minemanager
          L0_539 = L0_539.ls_mine_info_record
          L0_539 = L0_539.offline
          L1_540 = _debug_minemanager
          L1_540 = L1_540.ls_mine_info_record
          L1_540 = L1_540.offline
          L1_540 = L1_540.retention_period
          L1_540 = L1_540 + 1
          L0_539.retention_period = L1_540
        end,
        down = function()
          local L0_541
          L0_541 = _debug_minemanager
          L0_541 = L0_541.ls_mine_info_record
          L0_541 = L0_541.offline
          L0_541.retention_period = math.max(0, _debug_minemanager.ls_mine_info_record.offline.retention_period - 1)
        end
      },
      {
        name = " - init_executionDate",
        get = function()
          local L1_542
          L1_542 = string
          L1_542 = L1_542.format
          return L1_542("%s", _debug_minemanager.ls_mine_info_record.offline.init_executionDate:getOutputText())
        end,
        up = function()
          local L0_543
          L0_543 = _debug_minemanager
          L0_543 = L0_543.ls_mine_info_record
          L0_543 = L0_543.offline
          L0_543.init_executionDate = _debug_minemanager.debugSdateTimeAdd(_debug_minemanager.ls_mine_info_record.offline.init_executionDate)
        end,
        down = function()
          local L0_544
          L0_544 = _debug_minemanager
          L0_544 = L0_544.ls_mine_info_record
          L0_544 = L0_544.offline
          L0_544.init_executionDate = _debug_minemanager.debugSdateTimeSub(_debug_minemanager.ls_mine_info_record.offline.init_executionDate)
        end
      },
      {
        name = " - sum_executionDate",
        get = function()
          local L1_545
          L1_545 = string
          L1_545 = L1_545.format
          return L1_545("%s", _debug_minemanager.ls_mine_info_record.offline.sum_executionDate:getOutputText())
        end,
        up = function()
          local L0_546
          L0_546 = _debug_minemanager
          L0_546 = L0_546.ls_mine_info_record
          L0_546 = L0_546.offline
          L0_546.sum_executionDate = _debug_minemanager.debugSdateTimeAdd(_debug_minemanager.ls_mine_info_record.offline.sum_executionDate)
        end,
        down = function()
          local L0_547
          L0_547 = _debug_minemanager
          L0_547 = L0_547.ls_mine_info_record
          L0_547 = L0_547.offline
          L0_547.sum_executionDate = _debug_minemanager.debugSdateTimeSub(_debug_minemanager.ls_mine_info_record.offline.sum_executionDate)
        end
      },
      {
        name = "math receive",
        get = function()
          local L0_548, L1_549
          L0_548 = "<Unable to edit>"
          return L0_548
        end
      },
      {
        name = " - gravity_density",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.gravity_density)
        end
      },
      {
        name = " - gravity_density_level",
        get = function()
          return string.format("%d", _debug_minemanager.ls_mine_info_record.gravity_density_level)
        end
      },
      {
        name = "math receive",
        get = function()
          local L0_550, L1_551
          L0_550 = "<Editable>"
          return L0_550
        end
      },
      {
        name = " - boss_deadline",
        get = function()
          local L1_552
          L1_552 = string
          L1_552 = L1_552.format
          return L1_552("%s", _debug_minemanager.ls_mine_info_record.boss_deadline:getOutputText())
        end,
        up = function()
          local L0_553
          L0_553 = _debug_minemanager
          L0_553 = L0_553.ls_mine_info_record
          L0_553.boss_deadline = _debug_minemanager.debugSdateTimeAdd(_debug_minemanager.ls_mine_info_record.boss_deadline)
        end,
        down = function()
          local L0_554
          L0_554 = _debug_minemanager
          L0_554 = L0_554.ls_mine_info_record
          L0_554.boss_deadline = _debug_minemanager.debugSdateTimeSub(_debug_minemanager.ls_mine_info_record.boss_deadline)
        end
      },
      {
        name = " - is_boss_come_in",
        get = function()
          local L1_555
          L1_555 = string
          L1_555 = L1_555.format
          return L1_555("%s", tostring(_debug_minemanager.ls_mine_info_record.is_boss_come_in))
        end,
        up = function()
          local L0_556, L1_557
          L0_556 = _debug_minemanager
          L0_556 = L0_556.ls_mine_info_record
          L0_556 = L0_556.is_boss_come_in
          if true == L0_556 then
            L0_556 = _debug_minemanager
            L0_556 = L0_556.ls_mine_info_record
            L0_556.is_boss_come_in = false
          else
            L0_556 = _debug_minemanager
            L0_556 = L0_556.ls_mine_info_record
            L0_556.is_boss_come_in = true
          end
        end,
        down = function()
          local L0_558, L1_559
          L0_558 = _debug_minemanager
          L0_558 = L0_558.ls_mine_info_record
          L0_558 = L0_558.is_boss_come_in
          if true == L0_558 then
            L0_558 = _debug_minemanager
            L0_558 = L0_558.ls_mine_info_record
            L0_558.is_boss_come_in = false
          else
            L0_558 = _debug_minemanager
            L0_558 = L0_558.ls_mine_info_record
            L0_558.is_boss_come_in = true
          end
        end
      },
      {
        name = " - is_mine99_open",
        get = function()
          local L1_560
          L1_560 = string
          L1_560 = L1_560.format
          return L1_560("%s", tostring(_debug_minemanager.ls_mine_info_record.is_mine99_open))
        end,
        up = function()
          local L0_561, L1_562
          L0_561 = _debug_minemanager
          L0_561 = L0_561.ls_mine_info_record
          L0_561 = L0_561.is_mine99_open
          if true == L0_561 then
            L0_561 = _debug_minemanager
            L0_561 = L0_561.ls_mine_info_record
            L0_561.is_mine99_open = false
          else
            L0_561 = _debug_minemanager
            L0_561 = L0_561.ls_mine_info_record
            L0_561.is_mine99_open = true
          end
        end,
        down = function()
          local L0_563, L1_564
          L0_563 = _debug_minemanager
          L0_563 = L0_563.ls_mine_info_record
          L0_563 = L0_563.is_mine99_open
          if true == L0_563 then
            L0_563 = _debug_minemanager
            L0_563 = L0_563.ls_mine_info_record
            L0_563.is_mine99_open = false
          else
            L0_563 = _debug_minemanager
            L0_563 = L0_563.ls_mine_info_record
            L0_563.is_mine99_open = true
          end
        end
      },
      {
        name = " - is_mine99_permit",
        get = function()
          local L1_565
          L1_565 = string
          L1_565 = L1_565.format
          return L1_565("%s", tostring(_debug_minemanager.ls_mine_info_record.is_mine99_permit))
        end,
        up = function()
          local L0_566, L1_567
          L0_566 = _debug_minemanager
          L0_566 = L0_566.ls_mine_info_record
          L0_566 = L0_566.is_mine99_permit
          if true == L0_566 then
            L0_566 = _debug_minemanager
            L0_566 = L0_566.ls_mine_info_record
            L0_566.is_mine99_permit = false
          else
            L0_566 = _debug_minemanager
            L0_566 = L0_566.ls_mine_info_record
            L0_566.is_mine99_permit = true
          end
        end,
        down = function()
          local L0_568, L1_569
          L0_568 = _debug_minemanager
          L0_568 = L0_568.ls_mine_info_record
          L0_568 = L0_568.is_mine99_permit
          if true == L0_568 then
            L0_568 = _debug_minemanager
            L0_568 = L0_568.ls_mine_info_record
            L0_568.is_mine99_permit = false
          else
            L0_568 = _debug_minemanager
            L0_568 = L0_568.ls_mine_info_record
            L0_568.is_mine99_permit = true
          end
        end
      },
      {
        name = "other",
        get = function()
          local L0_570, L1_571
          L0_570 = "<Editable>"
          return L0_570
        end
      },
      {
        name = " - gravityore_lottery_executionDate",
        get = function()
          local L1_572
          L1_572 = string
          L1_572 = L1_572.format
          return L1_572("%s", _debug_minemanager.ls_mine_info_record.gravityore_lottery_executionDate:getOutputText())
        end,
        up = function()
          local L0_573
          L0_573 = _debug_minemanager
          L0_573 = L0_573.ls_mine_info_record
          L0_573.gravityore_lottery_executionDate = _debug_minemanager.debugSdateTimeAdd(_debug_minemanager.ls_mine_info_record.gravityore_lottery_executionDate)
        end,
        down = function()
          local L0_574
          L0_574 = _debug_minemanager
          L0_574 = L0_574.ls_mine_info_record
          L0_574.gravityore_lottery_executionDate = _debug_minemanager.debugSdateTimeSub(_debug_minemanager.ls_mine_info_record.gravityore_lottery_executionDate)
        end
      }
    },
    getVisible = function()
      local L0_575, L1_576
      L0_575 = _debug_minemanager
      L0_575 = L0_575.disp_mine_info_onoff
      if L0_575 > 0 then
        L0_575 = true
        return L0_575
      end
      L0_575 = false
      return L0_575
    end,
    getString = function()
      local L0_577, L1_578, L2_579
      L0_577 = _debug_minemanager
      L0_577 = L0_577.disp_mine_info_onoff
      if L0_577 > 0 then
        L0_577 = findIdToMineInfoRecord
        L1_578 = _debug_minemanager
        L1_578 = L1_578.ls_mine_info
        L1_578 = L0_577(L1_578)
        L2_579 = {}
        table.insert(L2_579, string.format("mine info <%s>", tostring(L1_578)))
        table.insert(L2_579, "= receive")
        table.insert(L2_579, string.format("  - total:%d", L0_577.receive.total))
        table.insert(L2_579, string.format("  - limit:%d", L0_577.receive.limit))
        table.insert(L2_579, string.format("  - depth:%d", L0_577.receive.depth))
        table.insert(L2_579, string.format("  - boss_time:%d", L0_577.receive.boss_time))
        table.insert(L2_579, string.format("  - retention_period:%d", L0_577.receive.retention_period))
        table.insert(L2_579, "= offline")
        table.insert(L2_579, string.format("  - total:%d", L0_577.offline.total))
        table.insert(L2_579, string.format("  - add:%d", L0_577.offline.add))
        table.insert(L2_579, string.format("  - limit:%d", L0_577.offline.limit))
        table.insert(L2_579, string.format("  - add_max:%d", L0_577.offline.add_max))
        table.insert(L2_579, string.format("  - add_min:%d", L0_577.offline.add_min))
        table.insert(L2_579, string.format("  - sum_time:%d(min)", L0_577.offline.sum_time))
        table.insert(L2_579, string.format("  - init_time:%d(min)", L0_577.offline.init_time))
        table.insert(L2_579, string.format("  - depth:%d", L0_577.offline.depth))
        table.insert(L2_579, string.format("  - boss_time:%d(min)", L0_577.offline.boss_time))
        table.insert(L2_579, string.format("  - retention_period:%d", L0_577.offline.retention_period))
        table.insert(L2_579, string.format("  - init_executionDate:%s", L0_577.offline.init_executionDate:getOutputText()))
        table.insert(L2_579, string.format("  - sum_executionDate:%s", L0_577.offline.sum_executionDate:getOutputText()))
        table.insert(L2_579, "= math receive")
        table.insert(L2_579, string.format("  - gravity_density:%d", L0_577.gravity_density))
        table.insert(L2_579, string.format("  - gravity_density_level:%d", L0_577.gravity_density_level))
        table.insert(L2_579, string.format("  - boss_deadline:%s", L0_577.boss_deadline:getOutputText()))
        table.insert(L2_579, string.format("  - is_boss_come_in:%s", tostring(L0_577.is_boss_come_in)))
        table.insert(L2_579, string.format("  - is_mine99_open:%s", tostring(L0_577.is_mine99_open)))
        table.insert(L2_579, string.format("  - is_mine99_permit:%s", tostring(L0_577.is_mine99_permit)))
        table.insert(L2_579, "= other")
        table.insert(L2_579, string.format("  - gravityore_lottery_executionDate:%s", L0_577.gravityore_lottery_executionDate:getOutputText()))
        return L2_579
      end
      L0_577 = ""
      return L0_577
    end
  },
  {
    name = "display mineManager",
    getVisible = function()
      local L0_580, L1_581
      L0_580 = false
      return L0_580
    end,
    getString = function()
      local L0_582, L1_583
      L0_582 = ""
      return L0_582
    end,
    children = {
      {
        name = "",
        get = function()
          local L0_584, L1_585
          L0_584 = "<Unable to edit>"
          return L0_584
        end
      },
      {
        name = " - current state",
        get = function()
          local L0_586, L1_587, L2_588, L3_589, L4_590, L5_591, L6_592
          L0_586 = ""
          L1_587 = _mine_state
          if L1_587 then
            L0_586 = "nothing"
            L1_587 = _mine_state
            L1_587 = L1_587.getState
            L1_587 = L1_587(L2_588)
            for L5_591, L6_592 in L2_588(L3_589) do
              if L1_587 == L6_592 then
                L0_586 = L5_591 .. " : " .. tostring(L6_592)
                break
              end
            end
          else
            L0_586 = "nil"
          end
          return L0_586
        end
      },
      {
        name = "",
        get = function()
          local L0_593, L1_594
          L0_593 = "<Unable to edit>"
          return L0_593
        end
      },
      {
        name = " - mine name",
        get = function()
          return tostring(_mineName)
        end
      },
      {
        name = " - Lockon Distance",
        get = function()
          local L0_595, L1_596, L2_597
          L0_595 = "nothing"
          L1_596 = _mineName
          if L1_596 then
            L1_596 = mine_tbl
            L2_597 = _mineName
            L1_596 = L1_596[L2_597]
            if L1_596 then
              L2_597 = mine_ore_tbl
              L2_597 = L2_597[L1_596.mine_ore_tbl]
              if L2_597 and L1_596.lock_on_distance then
                L0_595 = tostring(L1_596.lock_on_distance)
              end
            end
          end
          return L0_595
        end
      },
      {
        name = " - Targeting Priority",
        get = function()
          local L0_598, L1_599, L2_600
          L0_598 = "nothing"
          L1_599 = _mineName
          if L1_599 then
            L1_599 = mine_tbl
            L2_600 = _mineName
            L1_599 = L1_599[L2_600]
            if L1_599 then
              L2_600 = mine_ore_tbl
              L2_600 = L2_600[L1_599.mine_ore_tbl]
              if L2_600 and L1_599.targetting_priority then
                L0_598 = tostring(L1_599.targetting_priority)
              end
            end
          end
          return L0_598
        end
      },
      {
        name = " - chance_mimics",
        get = function()
          local L0_601, L1_602, L2_603
          L0_601 = "nothing"
          L1_602 = _mineName
          if L1_602 then
            L1_602 = mine_tbl
            L2_603 = _mineName
            L1_602 = L1_602[L2_603]
            if L1_602 then
              L2_603 = mine_ore_tbl
              L2_603 = L2_603[L1_602.mine_ore_tbl]
              if L2_603 and L1_602.chance_mimics then
                L0_601 = tostring(L1_602.chance_mimics)
              end
            end
          end
          return L0_601
        end
      },
      {
        name = "Base GravityOre",
        get = function()
          local L0_604, L1_605
          L0_604 = "<Unable to edit>"
          return L0_604
        end
      },
      {
        name = " - pointMax",
        get = function()
          local L0_606
          L0_606 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.OreMgr then
            L0_606 = tostring(_mine_state.OreMgr.pointMax)
          end
          return L0_606
        end
      },
      {
        name = " - min_mimic",
        get = function()
          local L0_607
          L0_607 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.OreMgr then
            L0_607 = tostring(_mine_state.OreMgr.min_mimic)
          end
          return L0_607
        end
      },
      {
        name = " - max_mimic",
        get = function()
          local L0_608
          L0_608 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.OreMgr then
            L0_608 = tostring(_mine_state.OreMgr.max_mimic)
          end
          return L0_608
        end
      },
      {
        name = " - manager_name",
        get = function()
          local L0_609
          L0_609 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.OreMgr then
            L0_609 = tostring(_mine_state.OreMgr.manager_name)
          end
          return L0_609
        end
      },
      {
        name = "Add GravityOre",
        get = function()
          local L0_610, L1_611
          L0_610 = "<Unable to edit>"
          return L0_610
        end
      },
      {
        name = " - pointMax",
        get = function()
          local L0_612
          L0_612 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.AddOreMgr then
            L0_612 = tostring(_mine_state.AddOreMgr.pointMax)
          end
          return L0_612
        end
      },
      {
        name = " - min_mimic",
        get = function()
          local L0_613
          L0_613 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.AddOreMgr then
            L0_613 = tostring(_mine_state.AddOreMgr.min_mimic)
          end
          return L0_613
        end
      },
      {
        name = " - max_mimic",
        get = function()
          local L0_614
          L0_614 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.AddOreMgr then
            L0_614 = tostring(_mine_state.AddOreMgr.max_mimic)
          end
          return L0_614
        end
      },
      {
        name = " - manager_name",
        get = function()
          local L0_615
          L0_615 = "nothing"
          if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.AddOreMgr then
            L0_615 = tostring(_mine_state.AddOreMgr.manager_name)
          end
          return L0_615
        end
      }
    }
  }
}
L3_3.name = L4_4
L6_6 = {}
L6_6.name = "DATE"
L6_6.children = {
  {
    name = "YEAR",
    get = function()
      return tostring(_debug_minemanager.debugSettingDateYear)
    end,
    up = function()
      _debug_minemanager.debugSettingDateYear = math.min(9999, _debug_minemanager.debugSettingDateYear + 1)
    end,
    down = function()
      _debug_minemanager.debugSettingDateYear = math.max(0, _debug_minemanager.debugSettingDateYear - 1)
    end
  },
  {
    name = "MONTH",
    get = function()
      return tostring(_debug_minemanager.debugSettingDateMonth)
    end,
    up = function()
      _debug_minemanager.debugSettingDateMonth = math.min(12, _debug_minemanager.debugSettingDateMonth + 1)
    end,
    down = function()
      _debug_minemanager.debugSettingDateMonth = math.max(0, _debug_minemanager.debugSettingDateMonth - 1)
    end
  },
  {
    name = "DAY",
    get = function()
      return tostring(_debug_minemanager.debugSettingDateDay)
    end,
    up = function()
      _debug_minemanager.debugSettingDateDay = math.min(31, _debug_minemanager.debugSettingDateDay + 1)
    end,
    down = function()
      _debug_minemanager.debugSettingDateDay = math.max(0, _debug_minemanager.debugSettingDateDay - 1)
    end
  },
  {
    name = "HOUR",
    get = function()
      return tostring(_debug_minemanager.debugSettingDateHour)
    end,
    up = function()
      _debug_minemanager.debugSettingDateHour = math.min(24, _debug_minemanager.debugSettingDateHour + 1)
    end,
    down = function()
      _debug_minemanager.debugSettingDateHour = math.max(0, _debug_minemanager.debugSettingDateHour - 1)
    end
  },
  {
    name = "MINUTE",
    get = function()
      return tostring(_debug_minemanager.debugSettingDateMinute)
    end,
    up = function()
      _debug_minemanager.debugSettingDateMinute = math.min(1440, _debug_minemanager.debugSettingDateMinute + 1)
    end,
    down = function()
      _debug_minemanager.debugSettingDateMinute = math.max(0, _debug_minemanager.debugSettingDateMinute - 1)
    end
  }
}
L3_3[L4_4] = L5_5
L3_3[L4_4] = L5_5
L3_3[L4_4] = L5_5
L4_4.name = L5_5
function L6_6()
  local L1_616
  L1_616 = _debug_minemanager
  L1_616.disp_displayCurrentTimeWatch = -_debug_minemanager.disp_displayCurrentTimeWatch
end
L4_4[L5_5] = L6_6
function L6_6()
  local L0_617, L1_618
  L0_617 = _debug_minemanager
  L0_617 = L0_617.disp_displayCurrentTimeWatch
  if L0_617 > 0 then
    L0_617 = true
    return L0_617
  end
  L0_617 = false
  return L0_617
end
L4_4[L5_5] = L6_6
function L6_6()
  local L0_619, L1_620
  L0_619 = _debug_minemanager
  L0_619 = L0_619.disp_displayCurrentTimeWatch
  if L0_619 > 0 then
    L0_619 = string
    L0_619 = L0_619.format
    L1_620 = "mine time ( cur > %s )"
    return L0_619(L1_620, _currentTickTime:getOutputText())
  end
  L0_619 = ""
  return L0_619
end
L4_4[L5_5] = L6_6
L6_6 = "display server status"
L5_5.name = L6_6
L6_6 = "callback"
L5_5[L6_6] = function()
  local L1_621
  L1_621 = _debug_minemanager
  L1_621.disp_OnOrOffServerStatus_onoff = -_debug_minemanager.disp_OnOrOffServerStatus_onoff
end
L6_6 = "getVisible"
L5_5[L6_6] = function()
  local L0_622, L1_623
  L0_622 = _debug_minemanager
  L0_622 = L0_622.disp_OnOrOffServerStatus_onoff
  if L0_622 > 0 then
    L0_622 = true
    return L0_622
  end
  L0_622 = false
  return L0_622
end
L6_6 = "getString"
L5_5[L6_6] = function()
  local L0_624
  L0_624 = _debug_minemanager
  L0_624 = L0_624.disp_OnOrOffServerStatus_onoff
  if L0_624 > 0 then
    L0_624 = ""
    if nil ~= Ugc:getParamTable() then
      L0_624 = L0_624 .. "syncMineParams( ONLINE )"
    else
      L0_624 = L0_624 .. "syncMineParams( OFFLINE )"
    end
    if nil ~= Ugc:mineGet() and #Ugc:mineGet() < 6 then
      L0_624 = L0_624 .. ", syncMineInfo( ONLINE )"
    else
      L0_624 = L0_624 .. ", syncMineInfo( OFFLINE )"
    end
    return L0_624
  end
  L0_624 = ""
  return L0_624
end
L6_6 = {}
L6_6.name = "display mined"
function L6_6.callback()
  local L1_625
  L1_625 = _debug_minemanager
  L1_625.disp_mined_onoff = -_debug_minemanager.disp_mined_onoff
end
function L6_6.getVisible()
  if 0 < _debug_minemanager.disp_mined_onoff and _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    return true
  end
  return false
end
function L6_6.getString()
  if 0 < _debug_minemanager.disp_mined_onoff and _mine_state and _mine_state:getState() == MINE_STATE.RUN then
    return string.format("MINED:%d", _MINE_STATE_RUN.mineOreCnt)
  end
  return ""
end
L0_0[L1_1] = L2_2
_debug_minemanager = L0_0
L0_0 = {}
L1_1 = "Mine 99 Theme"
L0_0.name = L1_1
L1_1 = "children"
L2_2 = {}
L0_0[L1_1] = L2_2
L1_1 = "getVisible"
function L2_2()
  local L0_626, L1_627
  L0_626 = false
  return L0_626
end
L0_0[L1_1] = L2_2
L1_1 = "getString"
function L2_2()
  local L0_628, L1_629
  L0_628 = ""
  return L0_628
end
L0_0[L1_1] = L2_2
L1_1 = {}
L2_2 = "Clear Hierarchy Update"
L1_1.name = L2_2
L2_2 = "get"
L1_1[L2_2] = L3_3
L2_2 = "up"
L1_1[L2_2] = L3_3
L2_2 = "down"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "boss all revival"
L1_1.name = L2_2
L2_2 = "callback"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "boss all clear"
L1_1.name = L2_2
L2_2 = "callback"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L4_4.name = L5_5
function L6_6()
  local L0_630, L1_631
  L0_630 = "<Editable>"
  return L0_630
end
L4_4[L5_5] = L6_6
L2_2(L3_3, L4_4)
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L4_4.name = L5_5
function L6_6()
  local L0_632
  L0_632 = tostring
  return L0_632(GameDatabase:get(ggd.Savedata__StatisticalChart__AttainMineLevel))
end
L4_4[L5_5] = L6_6
function L6_6()
  local L0_633, L1_634
  L0_633 = GameDatabase
  L1_634 = L0_633
  L0_633 = L0_633.get
  L0_633 = L0_633(L1_634, ggd.Savedata__StatisticalChart__AttainMineLevel)
  L1_634 = getMine99Depth
  L1_634 = L1_634()
  GameDatabase:set(ggd.Savedata__StatisticalChart__AttainMineLevel, math.min(L0_633 + 1, L1_634))
  GameDatabase:backup(ggd.Savedata__StatisticalChart)
end
L4_4[L5_5] = L6_6
function L6_6()
  GameDatabase:set(ggd.Savedata__StatisticalChart__AttainMineLevel, math.max(GameDatabase:get(ggd.Savedata__StatisticalChart__AttainMineLevel) - 1, 0))
  GameDatabase:backup(ggd.Savedata__StatisticalChart)
end
L4_4[L5_5] = L6_6
L2_2(L3_3, L4_4)
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L4_4.name = L5_5
function L6_6()
  local L0_635, L1_636
  L0_635 = "<Editable>"
  return L0_635
end
L4_4[L5_5] = L6_6
L2_2(L3_3, L4_4)
L2_2 = getMine99Depth
L2_2 = L2_2()
for L6_6 = 1, L2_2 do
  table.insert(L1_1, {
    name = string.format("- mine99_%03d", L6_6),
    get = function()
      if L6_6 > L2_2 then
        return " Out of range, Api Version !"
      end
      return tostring(GameDatabase:get(ggd[string.format("Savedata__Mine99__mine99_%03d_clear", L6_6)]))
    end,
    up = function()
      local L0_637
      L0_637 = L6_6
      if L0_637 > L2_2 then
        return
      end
      L0_637 = ggd
      L0_637 = L0_637[string.format("Savedata__Mine99__mine99_%03d_clear", L6_6)]
      if true == GameDatabase:get(L0_637) then
        GameDatabase:set(L0_637, false)
      else
        GameDatabase:set(L0_637, true)
      end
    end,
    down = function()
      local L0_638
      L0_638 = L6_6
      if L0_638 > L2_2 then
        return
      end
      L0_638 = ggd
      L0_638 = L0_638[string.format("Savedata__Mine99__mine99_%03d_clear", L6_6)]
      if true == GameDatabase:get(L0_638) then
        GameDatabase:set(L0_638, false)
      else
        GameDatabase:set(L0_638, true)
      end
    end
  })
  break
end
L6_6 = "Manual"
L5_5.name = L6_6
L6_6 = "children"
L5_5[L6_6] = L1_1
L3_3(L4_4, L5_5)
do break end
L1_1 = "table"
L1_1 = _ENV[L1_1]
L2_2 = "insert"
L1_1 = L1_1[L2_2]
L2_2 = _debug_minemanager
L2_2 = L2_2[L3_3]
L1_1(L2_2, L3_3)
L0_0 = {}
L1_1 = "Create Death Ghost"
L0_0.name = L1_1
L1_1 = "getVisible"
function L2_2()
  local L0_639, L1_640
  L0_639 = false
  return L0_639
end
L0_0[L1_1] = L2_2
L1_1 = "getString"
function L2_2()
  local L0_641, L1_642
  L0_641 = ""
  return L0_641
end
L0_0[L1_1] = L2_2
L1_1 = "callback"
function L2_2()
  if _debugTask_createDeathGhost == nil then
    _debugTask_createDeathGhost = invokeSystemTask(function()
      local L0_643, L1_644, L2_645
      L0_643 = _mine_state
      if L0_643 then
        L0_643 = _mine_state
        L1_644 = L0_643
        L0_643 = L0_643.getState
        L0_643 = L0_643(L1_644)
        L1_644 = MINE_STATE
        L1_644 = L1_644.RUN
        if L0_643 == L1_644 then
          L0_643 = _getCurrentMission
          L2_645 = L0_643()
          Ugc:removeInstantDeathGhost()
          Ugc:downloadOtherDeathGhost()
          if "mine99" == L1_644 then
            creatDeathGhost(L2_645)
            repeat
              wait()
            until isCreatCompDeathGhost()
            if _MINE_STATE_RUN.deathGhostSubstitute_node then
              dealOnHoldDeathGhost(_MINE_STATE_RUN.deathGhostSubstitute_node)
              repeat
                wait()
              until isCreatCompdealOnHoldDeathGhost()
            end
            runDeathGhost()
            debugPrint("Debug, Create Death Ghost : DeathGhost Run")
          else
            debugPrint("Debug, Create Death Ghost : not mine99 mission !")
          end
        end
      end
      _debugTask_createDeathGhost = nil
    end)
  else
    debugPrint("Debug, Create Death Ghost : Already running ! ")
  end
end
L0_0[L1_1] = L2_2
L1_1 = "table"
L1_1 = _ENV[L1_1]
L2_2 = "insert"
L1_1 = L1_1[L2_2]
L2_2 = _debug_minemanager
L2_2 = L2_2[L3_3]
L1_1(L2_2, L3_3)
L0_0 = {}
L1_1 = "Tarisman Gacha"
L0_0.name = L1_1
L1_1 = "getVisible"
function L2_2()
  local L0_646, L1_647
  L0_646 = false
  return L0_646
end
L0_0[L1_1] = L2_2
L1_1 = "getString"
function L2_2()
  local L0_648, L1_649
  L0_648 = ""
  return L0_648
end
L0_0[L1_1] = L2_2
L1_1 = "children"
L2_2 = {}
L0_0[L1_1] = L2_2
L1_1 = {}
L2_2 = "Discard the possession \"Tarisman Stone\""
L1_1.name = L2_2
L2_2 = "callback"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "Reset reference counter \"Tarisman Gacha\""
L1_1.name = L2_2
L2_2 = "callback"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "Re creation \"Tarisman Gacha\""
L1_1.name = L2_2
L2_2 = "callback"
L1_1[L2_2] = L3_3
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = {}
L2_2 = "View \"Tarisman Gacha\""
L1_1.name = L2_2
L2_2 = "children"
L4_4.name = L5_5
function L6_6()
  local L0_650, L1_651
  L0_650 = "<Unable to edit>"
  return L0_650
end
L4_4[L5_5] = L6_6
L6_6 = "  - Gacha Max"
L5_5.name = L6_6
L6_6 = "get"
L5_5[L6_6] = function()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.TalGacha then
    return tostring(_mine_state.TalGacha.GetTalGachaTblMax())
  end
  return "None"
end
L6_6 = {}
L6_6.name = "  - Ref Index"
function L6_6.get()
  if _mine_state and _mine_state:getState() == MINE_STATE.RUN and _mine_state.TalGacha then
    return tostring(_mine_state.TalGacha.GetTalGachaTblIndex())
  end
  return "None"
end
L1_1[L2_2] = L3_3
L2_2 = {
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  "name",
  "skill1",
  "skill2",
  "skill3"
}
L6_6 = "model"
for L6_6 = 1, 99 do
  table.insert(L1_1.children, {
    name = string.format("  - [%02d]", L6_6),
    get = function()
      local L0_652, L1_653, L2_654, L3_655, L4_656, L5_657, L6_658, L7_659, L8_660
      L0_652 = _mine_state
      if L0_652 then
        L0_652 = _mine_state
        L1_653 = L0_652
        L0_652 = L0_652.getState
        L0_652 = L0_652(L1_653)
        L1_653 = MINE_STATE
        L1_653 = L1_653.RUN
        if L0_652 == L1_653 then
          L0_652 = _mine_state
          L0_652 = L0_652.TalGacha
          if L0_652 then
            L0_652 = L6_6
            L1_653 = _mine_state
            L1_653 = L1_653.TalGacha
            L1_653 = L1_653.TalismanMax
            if L0_652 <= L1_653 then
              L0_652 = _mine_state
              L0_652 = L0_652.TalGacha
              L0_652 = L0_652.TalGachaTbl
              L1_653 = _mine_state
              L1_653 = L1_653.TalGacha
              L1_653 = L1_653.GetTalGachaTblIndex
              L1_653 = L1_653()
              L2_654 = _mine_state
              L2_654 = L2_654.TalGacha
              L2_654 = L2_654.GetTalGachaTblMax
              L2_654 = L2_654()
              L3_655 = ""
              for L7_659, L8_660 in L4_656(L5_657) do
                L3_655 = L3_655 .. string.format("%s=%s,", L8_660, L0_652[L6_6][L8_660])
              end
              return L3_655
            end
          end
        end
      end
      L0_652 = "None"
      return L0_652
    end
  })
  break
end
do break end
L2_2 = "table"
L2_2 = _ENV[L2_2]
L2_2 = L2_2[L3_3]
L2_2(L3_3, L4_4)
L1_1 = "table"
L1_1 = _ENV[L1_1]
L2_2 = "insert"
L1_1 = L1_1[L2_2]
L2_2 = _debug_minemanager
L2_2 = L2_2[L3_3]
L1_1(L2_2, L3_3)
L0_0 = "g_customDebugMenu"
L0_0 = _ENV[L0_0]
if not L0_0 then
  L0_0 = "g_customDebugMenu"
  L1_1 = {}
  _ENV[L0_0] = L1_1
end
L0_0 = "table"
L0_0 = _ENV[L0_0]
L1_1 = "insert"
L0_0 = L0_0[L1_1]
L1_1 = "g_customDebugMenu"
L1_1 = _ENV[L1_1]
L2_2 = _debug_minemanager
L0_0(L1_1, L2_2)
L0_0 = "debugDisp"
function L1_1()
  invokeSystemTask(function()
    local L0_661, L1_662, L2_663, L3_664, L4_665, L5_666, L6_667, L7_668, L8_669, L9_670, L10_671
    while true do
      if not L0_661 then
        _debugDispX = 0
        _debugLine = 0
        for L3_664, L4_665 in L0_661(L1_662) do
          L5_666 = L4_665.getVisible
          L5_666 = L5_666()
          if L5_666 then
            L5_666 = L4_665.getString
            L5_666 = L5_666()
            if "string" == L6_667 then
              L6_667(L7_668)
            elseif "table" == L6_667 then
              for L9_670, L10_671 in L6_667(L7_668) do
                debugDispPrint(L10_671)
              end
            end
          end
        end
        L0_661()
      end
    end
  end)
end
_ENV[L0_0] = L1_1
