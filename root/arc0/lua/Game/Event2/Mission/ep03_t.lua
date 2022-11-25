dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_cactus_max = 99
_cactus_hdl = {}
_cactus_restore = 60
enmgen_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "faker_boss",
      locator = "locator_boss",
      name = "ep03_faker",
      ai_spawn_option = "Faker/faker_boss_ep03",
      navi_mesh_name = "az_a_07_custom01"
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
  onObjectAsh = function(A0_8, A1_9)
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum - 1
    if A0_10:getSpecTable().enemyDeadNum < 0 then
      A0_10:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
function Initialize()
  local L0_21
  L0_21 = loadFileAsset
  L0_21 = L0_21("nvm", "az_a_07_custom01")
  if L0_21 ~= nil then
    print("***** Custom NaviMesh >>> load : az_a_07_custom01 *****")
    L0_21:wait()
    if Fn_findAreaHandle("az_a_07") ~= nil then
      Fn_findAreaHandle("az_a_07"):addNaviMeshAsset(L0_21)
    end
  end
  Fn_vctrlOff("vctrl2_boss")
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_t")
end
function Ingame()
  local L0_22, L1_23, L2_24, L3_25
  L0_22(L1_23)
  while true do
    if L0_22 == false then
      L0_22()
    end
  end
  for L3_25 = 1, 9 do
    Fn_sendEventComSb("ore_active", string.format("gravityore_az_a_07_%02d", L3_25), false)
  end
  L0_22(L1_23, L2_24)
  L0_22(L1_23, L2_24)
  if L0_22 ~= nil then
    L1_23(L2_24)
  end
  L3_25 = true
  L1_23(L2_24, L3_25)
  while true do
    if not L1_23 then
      L1_23()
    end
  end
  L3_25 = "ep03_faker"
  L3_25 = "requestHandle"
  L3_25 = L2_24.getActive
  L3_25 = L3_25(L2_24)
  if L3_25 then
    L3_25 = L2_24.setActive
    L3_25(L2_24, false)
    L3_25 = L2_24.setVisibleBlockEnable
    L3_25(L2_24, false)
  end
  L3_25 = findGameObject2
  L3_25 = L3_25("EnemyBrain", "ep03_faker")
  L3_25:setVisibleBossMarker(false)
  Fn_sendEventComSb("guideEffAllOff")
  Fn_missionStart()
  Fn_missionView("ep03_20000")
  L3_25:setVisibleBossMarker(true)
  _island_navi = invokeTask(function()
    local L0_26
    L0_26 = false
    repeat
      if L0_26 == false and Fn_getDistanceToPlayer("locator2_litho_navi_03") > _island_navi_disp then
        L0_26 = true
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_03"))
      elseif L0_26 == true and Fn_getDistanceToPlayer("locator2_litho_navi_03") < _island_navi_hide then
        L0_26 = false
        Fn_naviKill()
      end
      wait()
    until _litho_theme
  end)
  FatalMarker.create(kFATAL_TYPE_ACT):set(L1_23, "loc_setCore07", true)
  FatalMarker.create(kFATAL_TYPE_ACT):run()
  Fn_vctrlOn("vctrl2_boss")
  Sound:playSE("kit020c", 1)
  Fn_captionView("ep03_20010")
  waitSeconds(1)
  Fn_userCtrlOn()
  L0_22:requestIdlingEnemy(false)
  waitSeconds(1)
  Fn_vctrlOff("vctrl2_boss")
  repeat
    wait()
  until FatalMarker.create(kFATAL_TYPE_ACT):isFatalFinish()
  Fn_whiteout(0.3)
  FatalMarker.create(kFATAL_TYPE_ACT):kill()
  _island_navi:abort()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function cacuts_resore()
  local L0_27, L1_28, L2_29, L3_30
  _area_04_hdl = L0_27
  for L3_30 = 1, _cactus_max do
    _cactus_hdl[L3_30] = _area_04_hdl:findChildNode(string.format("az_grab_cactus_a_10_%02d", L3_30), true)
    if _cactus_hdl[L3_30] ~= nil then
      print("\227\130\181\227\131\156\227\131\134\227\131\179\227\131\170\227\130\185\227\131\136\227\130\162\232\168\173\229\174\154")
      if _cactus_hdl[L3_30]:isBroken() then
        _cactus_hdl[L3_30]:requestRestoreForce()
      end
      _cactus_hdl[L3_30]:setAutoRestore(_cactus_restore)
    else
      print("\227\130\181\227\131\156\227\131\134\227\131\179\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
      break
    end
  end
end
function Finalize()
  local L0_31, L1_32
end
