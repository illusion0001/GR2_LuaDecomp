import("EventData")
import("GameDatabase")
import("Vehicle")
import("Area")
import("HUD")
import("Mob")
import("Query")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Misc/train_controller.lua")
dofile("/Game/Event2/Table/CollectionNodeTable.lua")
dofile("/Game/Misc/placement_controller.lua")
_exit_sandbox = false
_initialized = false
_area_start = false
_area_warp = false
_area_root_list = {}
_area_warp_list = {}
_object_list = {}
_connect_object_list = {}
_connect_finish = false
_connect_list = {}
_put_train = false
_train_k = nil
_train_pd = nil
_inrange_cnt = 0
_cat_warp = false
_warning_task = nil
_warning_cnt = 0
_old_city = nil
_picture_list = {}
_picture_hdl = {}
_vehicle_list = {}
_evb_list = {}
_farniture_file_name = nil
_landmark_node = {}
_memories_picture_table = {}
_create_mission_evx = false
_mission_evx_list = {}
_siren_handle = nil
_collection_on = false
_collection_id = 1
_collection_gp = 1
_self_name = nil
_go_onEnterCnt = 0
function main()
  _self_name = g_own:getName()
  if Debug:isMasterBuild() then
  else
    invokeSystemTask(debugDisp)
  end
  _placement_ctrl = PlacementCtrl.create()
  debugPrint("createArea start ...")
  createArea()
  setConnectToLocations()
  debugPrint("createArea finish!!")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  waitConnectToLocation()
  debugPrint("setAreaDetail start ...")
  setAreaDetail()
  debugPrint("setAreaDetail finish!!")
  _placement_ctrl:run()
  _area_start = true
  repeat
    wait()
  until _area_warp
  areaWarp()
  if #_evb_list > 0 then
    invokeSystemTask(setupEvb)
  end
  if _put_train == true then
    TrainController.setActiveHeksevillTrain(true)
    TrainController.setActiveDowntownTrain(true)
    invokeSystemTask(setupTrain)
  end
  if _farniture_file_name then
    invokeSystemTask(setupFarniture)
  end
  if 0 < #_picture_list then
    invokeSystemTask(setupPicture)
  end
  if 0 < #_vehicle_list then
    invokeSystemTask(setupVehicle)
  end
  HUD:menuSetCallback(HUD.kCallback_JustShutterCollection, collectionJudgeCallback)
  HUD:menuSetCallback(HUD.kCallback_ShutterCollection, collectionCallback)
  invokeTask(function()
    while true do
      if _cat_warp == true then
        if GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) ~= true and GameDatabase:get(ggd.Savedata__EventManageFlags__Outrange) == true and GameDatabase:get(ggd.GlobalSystemFlags__DeadOutrangeLock) == false then
          debugPrint("bg\227\131\135\227\131\188\227\130\191\229\129\180\227\129\167\227\129\174\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\229\174\159\232\161\140")
          Fn_catWarp()
          debugPrint("bg\227\131\135\227\131\188\227\130\191\229\129\180\227\129\167\227\129\174\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\231\181\130\228\186\134")
          wait(5)
        end
        _cat_warp = false
      end
      wait()
    end
  end)
  invokeSystemTask(function()
    while not _exit_sandbox do
      if _area_warp then
        areaWarp()
        _area_warp = false
      end
      if _create_evx then
        Fn_loadEventData("evx/" .. _mission_evx_list[1].name, _mission_evx_list[1].evarea2, true)
        _create_evx = false
      end
      wait()
    end
  end)
end
function exitsandbox()
  _exit_sandbox = true
  _train_k = nil
  _train_pd = nil
  TrainController.setActiveHeksevillTrain(true)
  TrainController.setActiveDowntownTrain(true)
  __debugSystemTask = false
  _area_root_list = {}
  _object_list = {}
  _connect_list = {}
  _connect_object_list = {}
  if _siren_handle ~= nil then
    Sound:stopSEHandle(_siren_handle)
  end
  _siren_handle = nil
end
setExitCallback(exitsandbox)
function requestBgSet(A0_0)
  local L1_1
end
function getRequestState(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function getBgSetInfomation(A0_4)
  local L1_5
  L1_5 = false
  return L1_5
end
function exitBgset()
  local L0_6, L1_7
end
function mineAreaWarp()
  local L0_8, L1_9
end
function requestBgSetCom(A0_10)
  local L1_11, L2_12, L3_13
  L1_11 = A0_10.create_evx
  if L1_11 then
    _create_evx = true
    L1_11 = table
    L1_11 = L1_11.insert
    L2_12 = _mission_evx_list
    L3_13 = 1
    L1_11(L2_12, L3_13, copyTable(A0_10.create_evx))
  end
end
function setCraneShipInformation(A0_14)
  GameDatabase:set(ggd.Savedata__CreneShipFlags__ShipName, A0_14)
end
function copyTable(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L1_16 = {}
  for L5_20, L6_21 in L2_17(L3_18) do
    if type(L6_21) == "table" then
      L1_16[L5_20] = copyTable(L6_21)
    else
      L1_16[L5_20] = L6_21
    end
  end
  return L1_16
end
function areaWarp()
  if #_area_warp_list > 0 then
    debugPrint("warp area wait ...")
    Area:setAreaFree()
    for _FORV_3_, _FORV_4_ in pairs(_area_warp_list) do
      if findAreaHandle(_FORV_4_.area) then
        findAreaHandle(_FORV_4_.area):setWorldTransform(_FORV_4_.node:getWorldTransform())
        findAreaHandle(_FORV_4_.area):setForceMove()
        debugPrint("warp area " .. _FORV_4_.area)
      end
    end
    debugPrint("warp area finish")
  end
  _initialized = true
end
function findAreaHandle(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28
  for L4_26, L5_27 in L1_23(L2_24) do
    L6_28 = L5_27.getName
    L6_28 = L6_28(L5_27)
    if A0_22 == L6_28 then
      return L5_27
    end
    L6_28 = L5_27.getDescendant
    L6_28 = L6_28(L5_27)
    for _FORV_10_, _FORV_11_ in pairs(L6_28) do
      if A0_22 == _FORV_11_:getName() then
        return _FORV_11_
      end
    end
  end
  return L1_23
end
function setupEvb()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  for L3_32, L4_33 in L0_29(L1_30) do
    L5_34 = _exit_sandbox
    if not L5_34 then
      L5_34 = loadFileAsset
      L6_35 = "evb"
      L5_34 = L5_34(L6_35, "evx/" .. L4_33)
      if L5_34 ~= nil then
        L6_35 = L5_34.wait
        L6_35(L5_34)
        L6_35 = L5_34.getRoot
        L6_35 = L6_35(L5_34)
        EventData:create(L4_33, nil, L6_35):try_init()
        EventData:create(L4_33, nil, L6_35):waitForReadyAsync(function(A0_36)
          A0_36:try_start()
        end)
      else
        L6_35 = debugPrint
        L6_35("load evb " .. L4_33 .. " nil")
      end
    end
  end
end
function setupVehicle()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43
  for L3_40, L4_41 in L0_37(L1_38) do
    L5_42 = _exit_sandbox
    if not L5_42 then
      L5_42 = loadFileAsset
      L6_43 = "evd"
      L5_42 = L5_42(L6_43, "vehicle/" .. L4_41)
      if L5_42 then
        L6_43 = L5_42.wait
        L6_43(L5_42)
        L6_43 = Vehicle
        L6_43 = L6_43.CreateRoute
        L6_43 = L6_43(L6_43, L5_42)
        if L6_43 then
          for _FORV_10_, _FORV_11_ in pairs(L6_43) do
            _FORV_11_:waitForReady()
          end
        end
      else
        L6_43 = debugPrint
        L6_43("vehicle " .. L4_41 .. " nil")
      end
    end
  end
end
function setupPicture()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56
  L0_44 = GameDatabase
  L0_44 = L0_44.get
  L0_44 = L0_44(L1_45, L2_46)
  if L0_44 >= 1 then
    L0_44 = true
  else
    L0_44 = L0_44 or false
  end
  for L4_48, L5_49 in L1_45(L2_46) do
    L6_50 = _exit_sandbox
    if not L6_50 then
      L6_50 = loadFileAsset
      L6_50 = L6_50(L7_51, L8_52)
      if L6_50 then
        L7_51(L8_52)
        L10_54 = L5_49
        L11_55 = nil
        L12_56 = L7_51
        L10_54 = L8_52
        L9_53(L10_54)
        L10_54 = L8_52
        L9_53(L10_54)
        L10_54 = L8_52
        L9_53(L10_54)
      else
        L10_54 = " nil"
        L7_51(L8_52)
      end
    end
  end
  for L4_48, L5_49 in L1_45(L2_46) do
    L6_50 = _exit_sandbox
    if not L6_50 then
      L6_50 = findGameObject2
      L6_50 = L6_50(L7_51, L8_52)
      if L6_50 then
        L10_54 = L5_49
        L8_52(L9_53, L10_54)
        L10_54 = L5_49
        L8_52(L9_53, L10_54)
        L10_54 = L0_44
        L8_52(L9_53, L10_54)
        L10_54 = L7_51
        L8_52(L9_53, L10_54)
        L8_52(L9_53)
        function L10_54(A0_57)
          A0_57:try_start()
        end
        L8_52(L9_53, L10_54)
        L8_52[L4_48] = L7_51
      else
        L10_54 = " nil"
        L7_51(L8_52)
      end
    end
  end
  for L4_48, L5_49 in L1_45(L2_46) do
    L6_50 = type
    L6_50 = L6_50(L7_51)
    if L6_50 == "table" then
      L6_50 = {}
      for L10_54, L11_55 in L7_51(L8_52) do
        L12_56 = findGameObject2
        L12_56 = L12_56("Node", L11_55)
        if L12_56 then
          table.insert(L6_50, L12_56)
        end
      end
      L7_51[L4_48] = L6_50
    else
      L6_50 = _landmark_node
      L6_50[L4_48] = L7_51
    end
  end
end
function setUpdateCityGem(A0_58)
  if _placement_ctrl then
    _placement_ctrl:swtichGem(A0_58)
  end
end
function setUpdatePlacementCtrl()
  if _placement_ctrl then
    _placement_ctrl:updateEnable()
  end
end
function createSpecialGimmickBg(A0_59, A1_60, A2_61, A3_62)
  local L4_63
  L4_63 = createGameObject2
  L4_63 = L4_63("GimmickBg")
  L4_63:setName(A0_59)
  L4_63:setDrawModelName(A1_60)
  L4_63:setAttributeName(A1_60)
  L4_63:setCollisionName(A1_60)
  A2_61:appendChild(L4_63)
  L4_63:setTransform(A2_61:getNodeLocalPosRot(A0_59))
  if A3_62 then
    if not GameDatabase:get(A3_62) then
      L4_63:setEventListener("broken", function(A0_64)
        GameDatabase:set(A3_62, true)
      end)
    else
      L4_63:requestBrokenStart(true)
    end
  end
  L4_63:try_init()
  L4_63:waitForReadyAsync(function(A0_65)
    A0_65:try_start()
  end)
  return L4_63
end
function isInitialized()
  local L0_66, L1_67
  L0_66 = _initialized
  return L0_66
end
function kill()
  exitSandbox()
end
function isAreaStart()
  local L0_68, L1_69
  L0_68 = _area_start
  return L0_68
end
function isAreaWarp()
  local L0_70, L1_71
  L0_70 = _area_warp
  return L0_70
end
function setWarpArea(A0_72)
  local L1_73
  _area_warp_list = A0_72
  _area_warp = true
  _initialized = false
end
function setAreaRootHandle(A0_74, A1_75)
  setObjectHandle(A0_74, A1_75)
  _area_root_list[A0_74] = A1_75
end
function getAreaRootHandle(A0_76)
  return _area_root_list[A0_76]
end
function getAreaRootHandleList()
  local L0_77, L1_78
  L0_77 = _area_root_list
  return L0_77
end
function setObjectHandle(A0_79, A1_80)
  _object_list[A0_79] = A1_80
end
function setObjectHandleList()
  local L0_81, L1_82
  L0_81 = _object_list
  return L0_81
end
function setDriftParamsSubArea(A0_83, A1_84, A2_85)
  local L3_86
  L3_86 = A0_83.getDescendant
  L3_86 = L3_86(A0_83)
  for _FORV_7_, _FORV_8_ in ipairs(L3_86) do
    for _FORV_12_ = 1, #A1_84 do
      if A1_84[_FORV_12_] == _FORV_8_:getName() then
        _FORV_8_:setDriftParams(A2_85)
      end
    end
  end
  L3_86 = nil
end
function setDriftParamsUniqueArea(A0_87, A1_88)
  local L2_89, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96, L10_97, L11_98, L12_99, L13_100
  L2_89 = A0_87.getDescendant
  L2_89 = L2_89(L3_90)
  for L6_93, L7_94 in L3_90(L4_91) do
    for L11_98 = 1, #A1_88 do
      L12_99 = A1_88[L11_98]
      L13_100 = L7_94.getName
      L13_100 = L13_100(L7_94)
      if L12_99 == L13_100 then
        L12_99 = "DRIFT_PARAM_UNIQUE_AREA_"
        L13_100 = A1_88[L11_98]
        L12_99 = L12_99 .. L13_100
        L13_100 = _G
        L13_100 = L13_100[L12_99]
        if L13_100 ~= nil then
          L7_94:setDriftParams(L13_100)
        end
        L12_99, L13_100 = nil, nil
      end
    end
  end
  L2_89 = nil
end
function setConnectWaitObject(A0_101)
  table.insert(_connect_object_list, A0_101)
end
function incInRangeCount(A0_102)
  _inrange_cnt = _inrange_cnt + 1
  _cat_warp = false
  debugCatWarp(A0_102, true)
end
function decInRangeCount(A0_103)
  _inrange_cnt = _inrange_cnt - 1
  if _inrange_cnt <= 0 then
    _cat_warp = true
  end
  debugCatWarp(A0_103, false)
end
function setCatWarpPoint(A0_104)
  local L1_105, L2_106, L3_107
  L2_106 = A0_104
  L1_105 = A0_104.getName
  L1_105 = L1_105(L2_106)
  L2_106 = 0
  L3_107 = string
  L3_107 = L3_107.sub
  L3_107 = L3_107(L1_105, 0, 18)
  if L3_107 == "pccubesensormulti2" then
    L2_106 = 5
  end
  L3_107 = "locator2_outrange"
  L3_107 = L3_107 .. string.sub(L1_105, 17 + L2_106)
  GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeCheckPoint, L3_107)
  debugPrint("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\229\190\169\229\184\176\228\189\141\231\189\174:" .. L3_107)
  debugCatWarp(A0_104, true)
end
function incWarningCount(A0_108)
  _warning_cnt = _warning_cnt + 1
  debugPrint(A0_108:getName() .. " contacted : " .. _warning_cnt)
  debugCatWarp(A0_108, true)
end
function decWarningCount(A0_109)
  _warning_cnt = _warning_cnt - 1
  debugPrint(A0_109:getName() .. " away : " .. _warning_cnt)
  debugCatWarp(A0_109, false)
  if _warning_cnt > 0 then
    return
  end
  _warning_cnt = 0
  if GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) ~= true and GameDatabase:get(ggd.Savedata__EventManageFlags__Outrange) == true and GameDatabase:get(ggd.GlobalSystemFlags__DeadOutrangeLock) == false and GameDatabase:get(ggd.GlobalSystemFlags__Demo) == false and Player:getPuppet():getActive() and GameDatabase:get(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable) and not _warning_task then
    _warning_task = invokeTask(function()
      local L0_110
      L0_110 = GameDatabase
      L0_110 = L0_110.get
      L0_110 = L0_110(L0_110, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if not string.find(L0_110, "ep27") then
        HUD:captionBegin("ic_bgset_01", 3)
        waitSeconds(3)
      end
      _warning_task = nil
    end)
  end
end
function city_block_bu_onEnter()
  cityBlockPlaceOnEnter("bu", {
    unique = "ui_gaiku_01_11",
    section = "ui_gaiku_02_11"
  }, "bu", true)
end
function city_block_bu_onLeave()
  cityBlockPlaceOnLeave("bu")
end
function city_block_go_onEnter()
  cityBlockPlaceOnEnter("go", {
    unique = "ui_gaiku_01_12",
    section = "ui_gaiku_02_12",
    town = "ui_gaiku_03_02"
  }, "jir", true)
  _go_onEnterCnt = _go_onEnterCnt + 1
end
function city_block_go_onLeave()
  _go_onEnterCnt = _go_onEnterCnt - 1
  if _go_onEnterCnt <= 0 then
    cityBlockPlaceOnLeave("go")
    _go_onEnterCnt = 0
  end
end
function city_block_up_onEnter()
  cityBlockPlaceOnEnter("up", {
    unique = "ui_gaiku_01_14",
    section = "ui_gaiku_02_14",
    town = "ui_gaiku_03_02"
  }, "jir", true)
end
function city_block_up_onLeave()
  cityBlockPlaceOnLeave("up")
end
function city_block_po_onEnter()
  cityBlockPlaceOnEnter("po", {
    unique = "ui_gaiku_01_15",
    section = "ui_gaiku_02_15",
    town = "ui_gaiku_03_02"
  }, "jir", true)
end
function city_block_po_onLeave()
  cityBlockPlaceOnLeave("po")
end
function city_block_lo_onEnter()
  cityBlockPlaceOnEnter("lo", {
    unique = "ui_gaiku_01_17",
    section = "ui_gaiku_02_17",
    town = "ui_gaiku_03_02"
  }, "jir", true)
end
function city_block_lo_onLeave()
  cityBlockPlaceOnLeave("lo")
end
function city_block_cc_onEnter()
  cityBlockPlaceOnEnter("cc", {
    unique = "ui_gaiku_01_01",
    section = "ui_gaiku_02_01",
    town = "ui_gaiku_03_01"
  }, "hex", true)
end
function city_block_cc_onLeave()
  cityBlockPlaceOnLeave("cc")
end
function city_block_ed_onEnter()
  cityBlockPlaceOnEnter("ed", {
    unique = "ui_gaiku_01_02",
    section = "ui_gaiku_02_02",
    town = "ui_gaiku_03_01"
  }, "hex", true)
end
function city_block_ed_onLeave()
  cityBlockPlaceOnLeave("ed")
end
function city_block_id_onEnter()
  cityBlockPlaceOnEnter("id", {
    unique = "ui_gaiku_01_03",
    section = "ui_gaiku_02_03",
    town = "ui_gaiku_03_01"
  }, "hex", true)
end
function city_block_id_onLeave()
  cityBlockPlaceOnLeave("id")
end
function city_block_dt_onEnter()
  cityBlockPlaceOnEnter("dt", {
    unique = "ui_gaiku_01_04",
    section = "ui_gaiku_02_04",
    town = "ui_gaiku_03_01"
  }, "hex", true)
end
function city_block_dt_onLeave()
  cityBlockPlaceOnLeave("dt")
end
function city_block_st_onEnter()
  cityBlockPlaceOnEnter("st", nil, "st", false, false)
end
function city_block_st_onLeave()
  cityBlockPlaceOnLeave("st")
end
function city_block_pi_onEnter()
  cityBlockPlaceOnEnter("pi", nil, "st", false, false)
end
function city_block_pi_onLeave()
  cityBlockPlaceOnLeave("pi")
end
function city_block_az_onEnter()
  cityBlockPlaceOnEnter("az", nil, "az", false)
end
function city_block_az_onLeave()
  cityBlockPlaceOnLeave("az")
end
function city_block_az2_onEnter()
  cityBlockPlaceOnEnter("az2", nil, "az", false)
end
function city_block_az2_onLeave()
  cityBlockPlaceOnLeave("az2")
end
function city_block_az3_onEnter()
  cityBlockPlaceOnEnter("az3", nil, "az", false)
end
function city_block_az3_onLeave()
  cityBlockPlaceOnLeave("az3")
end
function city_block_az4_onEnter()
  cityBlockPlaceOnEnter("az4", nil, "az", false)
end
function city_block_az4_onLeave()
  cityBlockPlaceOnLeave("az4")
end
function city_block_az5_onEnter()
  cityBlockPlaceOnEnter("az5", nil, "az", false)
end
function city_block_az5_onLeave()
  cityBlockPlaceOnLeave("az5")
end
function city_block_az6_onEnter()
  cityBlockPlaceOnEnter("az6", nil, "az", false)
end
function city_block_az6_onLeave()
  cityBlockPlaceOnLeave("az6")
end
function city_block_co_onEnter()
  cityBlockPlaceOnEnter("co_in", nil, "hex", false, false)
end
function city_block_co_onLeave()
  cityBlockPlaceOnLeave("co_out")
end
function city_block_et_onEnter()
  cityBlockPlaceOnEnter("et", nil, "hex", false, false)
end
function city_block_et_onLeave()
  cityBlockPlaceOnLeave("et")
end
function city_block_et2_onEnter()
  cityBlockPlaceOnEnter("et2", nil, "hex", false, false)
end
function city_block_et2_onLeave()
  cityBlockPlaceOnLeave("et2")
end
function city_block_et3_onEnter()
  cityBlockPlaceOnEnter("et3", nil, "hex", false, false)
end
function city_block_et3_onLeave()
  cityBlockPlaceOnLeave("et3")
end
function cityBlockPlaceOnEnter(A0_111, A1_112, A2_113, A3_114, A4_115)
  if A4_115 ~= false then
    GameDatabase:set(ggd.Menu__MapName, A0_111)
  end
  if _old_city == A0_111 then
    if g_own:getGameObject("soundManager") then
      if GameDatabase:get(ggd.GlobalSystemFlags__CityBgm) or A0_111 == "st" then
        g_own:getGameObject("soundManager"):sendEvent("request", "eventheader", "city_block", A0_111 .. "_onEnter")
      else
        g_own:getGameObject("soundManager"):sendEvent("requestAmb", A0_111 .. "_onEnter")
      end
    end
    return
  elseif A3_114 then
    Mob:setRegion(A0_111)
  end
  _old_city = A0_111
  invokeTask(function()
    repeat
      wait()
    until HUD:faderAlpha() <= 0
    if GameDatabase:get(ggd.Savedata__EventManageFlags__CityPlaceName) and A1_112 ~= nil then
      HUD:placeNameStart(A1_112)
    end
    if g_own:getGameObject("soundManager") then
      if GameDatabase:get(ggd.GlobalSystemFlags__CityBgm) or A0_111 == "st" then
        g_own:getGameObject("soundManager"):sendEvent("request", "eventheader", "city_block", A0_111 .. "_onEnter")
      else
        g_own:getGameObject("soundManager"):sendEvent("requestAmb", A0_111 .. "_onEnter")
      end
      if A2_113 == "jir" then
        g_own:getGameObject("soundManager"):sendEvent("setVoiceJirga")
      elseif A2_113 == "bu" then
        g_own:getGameObject("soundManager"):sendEvent("setVoiceBunga")
      elseif A2_113 == "hex" then
        g_own:getGameObject("soundManager"):sendEvent("setVoiceHex")
      elseif A2_113 == "az" then
        g_own:getGameObject("soundManager"):sendEvent("setVoiceAnotherzone")
      elseif A2_113 == "st" then
        if GameDatabase:get(ggd.Savedata__CreneShipFlags__ShipName) == "ve_crane_root" then
          g_own:getGameObject("soundManager"):sendEvent("setVoiceStPo")
        else
          g_own:getGameObject("soundManager"):sendEvent("setVoiceStHx")
        end
      end
    end
  end)
end
function cityBlockPlaceOnLeave(A0_116)
  if g_own:getGameObject("soundManager") then
    if GameDatabase:get(ggd.GlobalSystemFlags__CityBgm) then
      g_own:getGameObject("soundManager"):sendEvent("request", "eventheader", "city_block", A0_116 .. "_onLeave")
    else
      g_own:getGameObject("soundManager"):sendEvent("requestAmb", A0_116 .. "_onLeave")
    end
  end
end
function setupTrain()
  local L0_117, L1_118
  L0_117 = TrainController
  L0_117 = L0_117.createHeksevill
  L1_118 = L0_117()
  _train_pd = L1_118
  _train_k = L0_117
  L0_117 = {}
  L1_118 = ggd
  L1_118 = L1_118.GlobalSystemFlags__ActiveHeksevillTrain
  L0_117[L1_118] = nil
  L1_118 = ggd
  L1_118 = L1_118.GlobalSystemFlags__ActiveDowntownTrain
  L0_117[L1_118] = nil
  while true do
    L1_118 = _train_k
    if L1_118 ~= nil then
      L1_118 = _train_pd
    end
    if L1_118 ~= nil then
      L1_118 = GameDatabase
      L1_118 = L1_118.get
      L1_118 = L1_118(L1_118, {
        ggd.GlobalSystemFlags__ActiveHeksevillTrain,
        ggd.GlobalSystemFlags__ActiveDowntownTrain
      })
      if L1_118[ggd.GlobalSystemFlags__ActiveHeksevillTrain] ~= L0_117[ggd.GlobalSystemFlags__ActiveHeksevillTrain] then
        if L1_118[ggd.GlobalSystemFlags__ActiveHeksevillTrain] == true then
          print(string.format("[\229\136\151\232\187\138] >>> TRUE"))
          _train_k.hdl:setVisible(true)
          _train_k.hdl:setActive(true)
          _train_k:setStationActive(true)
        else
          print(string.format("[\229\136\151\232\187\138] >>> FALSE"))
          _train_k.hdl:setVisible(false)
          _train_k.hdl:setActive(false)
          _train_k:setStationActive(false)
        end
      end
      if L1_118[ggd.GlobalSystemFlags__ActiveDowntownTrain] ~= L0_117[ggd.GlobalSystemFlags__ActiveDowntownTrain] then
        if L1_118[ggd.GlobalSystemFlags__ActiveDowntownTrain] == true then
          _train_pd.hdl:setVisible(true)
          _train_pd.hdl:setActive(true)
          _train_pd:setStationActive(true)
        else
          _train_pd.hdl:setVisible(false)
          _train_pd.hdl:setActive(false)
          _train_pd:setStationActive(false)
        end
      end
      _train_k:run()
      _train_pd:run()
      for _FORV_5_, _FORV_6_ in pairs(L1_118) do
        L0_117[_FORV_5_] = _FORV_6_
      end
      wait()
    end
  end
  L1_118 = debugPrint
  L1_118("SandBox\227\129\140\231\181\130\228\186\134\227\129\151\227\129\159\227\129\159\227\130\129\229\136\151\232\187\138\229\135\166\231\144\134\231\181\130\228\186\134")
end
function setStationActive(A0_119)
  if _train_k then
    _train_k:setStationActive(A0_119)
  end
  if _train_pd then
    _train_pd:setStationActive(A0_119)
  end
end
function pccubesensor2_gravity_revert_OnEnter()
  Player:setGravityControlMode(false)
  Player:setAbility(Player.kAbility_GravityShift, false)
end
function pccubesensor2_gravity_revert_OnLeave()
  Player:setAbility(Player.kAbility_GravityShift, true)
end
function setupFarniture()
  local L0_120, L1_121, L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128
  L0_120 = debugPrint
  L1_121 = "load evb "
  L1_121 = L1_121 .. L2_122 .. L3_123
  L0_120(L1_121)
  L0_120 = loadFileAsset
  L1_121 = "evb"
  L0_120 = L0_120(L1_121, L2_122)
  if L0_120 ~= nil then
    L1_121 = L0_120.wait
    L1_121(L2_122)
    L1_121 = _exit_sandbox
    if not L1_121 then
      L1_121 = L0_120.getRoot
      L1_121 = L1_121(L2_122)
      L5_125 = nil
      L6_126 = L1_121
      L3_123(L4_124)
      L3_123(L4_124)
      L3_123(L4_124)
      L5_125 = _farniture_file_name
      L6_126 = " finish!!"
      L3_123(L4_124)
    end
  else
    L1_121 = debugPrint
    L1_121(L2_122)
  end
  L1_121 = 30
  for L5_125 = 1, L1_121 do
    L6_126 = findGameObject2
    L7_127 = "Node"
    L8_128 = string
    L8_128 = L8_128.format
    L8_128 = L8_128("locator2_picture_%02d", L5_125)
    L6_126 = L6_126(L7_127, L8_128, L8_128("locator2_picture_%02d", L5_125))
    if nil ~= L6_126 then
      L7_127 = _exit_sandbox
      if not L7_127 then
        L7_127 = string
        L7_127 = L7_127.format
        L8_128 = "photo_a_%02d"
        L7_127 = L7_127(L8_128, L5_125)
        L8_128 = createGameObject2
        L8_128 = L8_128("TerrainBg")
        L8_128:setName(L7_127)
        L8_128:setModelName(L7_127)
        L8_128:setVisible(false)
        L6_126:appendChild(L8_128)
        L8_128:try_init()
        L8_128:waitForReadyAsync(function()
          L8_128:try_start()
        end)
        table.insert(_memories_picture_table, L8_128)
        do break end
        else
          L7_127 = print
          L8_128 = "warning : memoreas_picture, missing set node"
          L7_127(L8_128)
        end
      end
  end
  L2_122()
end
function updateVisibleMemoriesPhoto()
  local L0_129, L1_130, L2_131, L3_132, L4_133, L5_134, L6_135
  L0_129 = _memories_picture_table
  L0_129 = #L0_129
  if L0_129 > 0 then
    L0_129 = 30
    L1_130 = {}
    for L5_134 = 1, L0_129 do
      L6_135 = ggd
      L6_135 = L6_135["Savedata__HomeInfo__Photo__photo_a_" .. string.format("%02d", L5_134)]
      if nil == L1_130[L6_135] then
        table.insert(L1_130, L6_135)
      end
    end
    for L6_135, _FORV_7_ in L3_132(L4_133) do
      _FORV_7_:setVisible(L2_131[ggd["Savedata__HomeInfo__Photo__" .. _FORV_7_:getName()]])
    end
  end
end
function activePicture()
  for _FORV_3_, _FORV_4_ in pairs(_picture_hdl) do
    _FORV_4_:setVisible(true)
  end
end
function collectionJudgeCallback()
  local L0_136, L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150
  L0_136 = _collection_on
  if L0_136 == false then
    L0_136 = GameDatabase
    L0_136 = L0_136.get
    L0_136 = L0_136(L1_137, L2_138)
    if L0_136 then
      L0_136 = Camera
      L0_136 = L0_136.getEyePos
      L0_136 = L0_136(L1_137)
      L5_141 = 0
      L14_150 = L4_140(L5_141, L6_142, L7_143, L8_144)
      L1_137(L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L4_140(L5_141, L6_142, L7_143, L8_144))
      for L4_140, L5_141 in L1_137(L2_138) do
        if L6_142 then
          L9_145 = L4_140
          L14_150 = L8_144(L9_145, L10_146, L11_147)
          if L7_143 <= 10 then
          else
          end
          if L7_143 > 10 then
            L9_145 = L7_143 - 10
          end
          _collection_on = true
          _collection_gp = L8_144
          _collection_id = L7_143
          return
        end
      end
      for L4_140, L5_141 in L1_137(L2_138) do
        if L5_141 then
          if L6_142 == "table" then
            for L9_145, L10_146 in L6_142(L7_143) do
              L13_149 = L0_136
              if L11_147 then
                if L4_140 <= 10 then
                else
                end
                if L4_140 > 10 then
                else
                end
                _collection_on = true
                _collection_gp = L11_147
                _collection_id = L12_148
                return
              end
            end
          elseif L6_142 then
            if L4_140 <= 10 then
            else
            end
            if L4_140 > 10 then
            else
            end
            _collection_on = true
            _collection_gp = L6_142
            _collection_id = L7_143
            return
          end
        end
      end
      for L5_141, L6_142 in L2_138(L3_139) do
        L9_145 = Mob
        L9_145 = L9_145.getModelName
        L9_145 = L9_145(L10_146, L11_147)
        for L13_149, L14_150 in L10_146(L11_147) do
          debugPrint(L9_145 .. " == " .. L14_150)
          if L9_145 == L14_150 and checkCollectionTarget(L8_144, L0_136) then
            _collection_id, _collection_gp, _collection_on = L13_149 > 10 and L13_149 - 10 or L13_149, L13_149 <= 10 and 3 or 6, true
            return
          end
        end
      end
    else
      L0_136 = print
      L0_136(L1_137)
    end
  else
    L0_136 = print
    L0_136(L1_137)
  end
end
function collectionCallback()
  if _collection_on then
    HUD:collectSaveOpen(_collection_gp, _collection_id)
    _collection_on = false
  end
end
function checkCollectionTarget(A0_151, A1_152)
  local L2_153, L3_154, L4_155
  L3_154 = A0_151
  L2_153 = A0_151.getName
  L2_153 = L2_153(L3_154)
  if not L2_153 or not L2_153 then
    L2_153 = "(noname)"
  end
  L3_154 = nil
  L4_155 = A0_151.getTypeName
  L4_155 = L4_155(A0_151)
  if L4_155 == "Puppet" then
    L4_155 = A0_151.getJointWorldTransform
    L4_155 = L4_155(A0_151, "bn_head")
    L3_154 = L4_155
    if L3_154 == nil then
      L4_155 = A0_151.getWorldPos
      L4_155 = L4_155(A0_151)
      L3_154 = L4_155
    end
  else
    L4_155 = A0_151.getWorldPos
    L4_155 = L4_155(A0_151)
    L3_154 = L4_155
  end
  L4_155 = A1_152.DistanceTo
  L4_155 = L4_155(A1_152, L3_154)
  if L4_155 < 0 then
    L4_155 = L4_155 * -1
  end
  debugPrint(L2_153 .. " \227\129\168\227\129\174\232\183\157\233\155\162\227\129\175 " .. tostring(L4_155) .. " \227\129\167\227\129\153")
  if L4_155 < _collection_dist then
    if HUD:isPhotoFrameIn(L3_154) then
      if Query:raycastEyeSight(L3_154) == nil then
        return true
      else
        if A0_151 and Query:raycastEyeSight(L3_154).object == A0_151 then
          debugPrint(L2_153 .. " \227\129\171\227\131\146\227\131\131\227\131\136\227\129\151\227\129\159\227\129\174\227\129\167\227\128\129\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\171\227\129\175\233\152\187\227\129\190\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
          return true
        end
        debugPrint(L2_153 .. " \227\129\175\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\171\233\152\187\227\129\190\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153\227\128\130")
      end
    else
      debugPrint(L2_153 .. " \227\129\175\227\130\171\227\131\161\227\131\169\227\129\171\229\134\153\227\129\163\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
    end
  else
    debugPrint(L2_153 .. " \227\129\168\227\129\174\232\183\157\233\155\162\227\129\140 " .. tostring(_collection_dist) .. " y\228\187\165\228\184\138\227\129\175\233\155\162\227\130\140\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\229\175\190\232\177\161\227\129\171\227\129\151\227\129\190\227\129\155\227\130\147")
  end
  return false
end
function areaResetAndReConnct(A0_156)
  _connect_finish = false
  invokeSystemTask(function()
    local L0_157
    L0_157 = debugPrint
    L0_157("areaResetAndReConnct")
    L0_157 = A0_156
    if L0_157 then
      L0_157 = Area
      L0_157 = L0_157.setAreaFree
      L0_157(L0_157)
    end
    L0_157 = Area
    L0_157 = L0_157.reset
    L0_157(L0_157)
    L0_157 = findGameObject2
    L0_157 = L0_157("Area", "ar_a_root")
    if L0_157 then
      L0_157:resetMoveAnim()
    end
    L0_157 = findGameObject2("Area", "ar_b_root")
    if L0_157 then
      L0_157:resetMoveAnim()
    end
    wait()
    setConnectToLocations()
    waitConnectToLocation()
    mineAreaWarp()
  end)
end
function setConnectToLocationParam(A0_158, A1_159, A2_160, A3_161, A4_162)
  table.insert(_connect_list, {
    self = A0_158,
    area = A1_159,
    sub_area_name = A2_160,
    locator_name = A3_161,
    only_initialize = A4_162
  })
end
function setConnectToLocations()
  for _FORV_3_, _FORV_4_ in ipairs(_connect_list) do
    _FORV_4_.self:connectToLocation(_FORV_4_.area, _FORV_4_.sub_area_name, _FORV_4_.locator_name, _FORV_4_.only_initialize)
  end
end
function waitConnectToLocation()
  debugPrint("connect wait ...")
  _connect_finish = false
  while not _exit_sandbox do
    for _FORV_4_, _FORV_5_ in ipairs(_connect_list) do
      if not _FORV_5_.self:isConnectingToLocation() then
      end
    end
    if #_connect_list == 0 + 1 then
      _connect_finish = true
      break
    end
    wait()
  end
  debugPrint("connect finish")
end
function isConnectingFinish()
  local L0_163, L1_164
  L0_163 = _connect_finish
  return L0_163
end
function pccubesensor2_sp_outrange_go_a_root_OnEnter(A0_165)
  local L1_166, L2_167
  L1_166 = GameDatabase
  L2_167 = L1_166
  L1_166 = L1_166.get
  L1_166 = L1_166(L2_167, ggd.Savedata__EventManageFlags__OutrangeLock)
  if L1_166 ~= true then
    L1_166 = GameDatabase
    L2_167 = L1_166
    L1_166 = L1_166.get
    L1_166 = L1_166(L2_167, ggd.GlobalSystemFlags__DeadOutrangeLock)
    if L1_166 == false then
      L1_166 = GameDatabase
      L2_167 = L1_166
      L1_166 = L1_166.get
      L1_166 = L1_166(L2_167, ggd.Savedata__EventManageFlags__CurrentFreeMode)
      L2_167 = GameDatabase
      L2_167 = L2_167.get
      L2_167 = L2_167(L2_167, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L1_166 ~= "ft09" and L1_166 ~= "ft11" and L1_166 ~= "ft21" and L1_166 ~= "ft28" and string.match(L2_167, "(.-)_()") ~= "ep09" and string.match(L2_167, "(.-)_()") ~= "ep10" and string.match(L2_167, "(.-)_()") ~= "ep11" and string.match(L2_167, "(.-)_()") ~= "ep27" and not GameDatabase:get(ggd.Savedata__GlobalSystemFlags__GovernmentCatWarp) then
        print("\231\183\143\231\157\163\229\186\156\227\129\174\231\160\178\230\146\131\229\135\166\231\144\134\227\130\146\233\150\139\229\167\139\227\128\130\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\166\129\229\161\158\229\129\180\227\130\146\230\142\146\228\187\150\227\129\151\227\129\190\227\129\153")
        GameDatabase:set(ggd.GlobalSystemFlags__GovernmentCatWarp, true)
        invokeTask(function()
          local L0_168, L1_169, L2_170
          L0_168 = Player
          L1_169 = L0_168
          L0_168 = L0_168.getEnergyMax
          L2_170 = Player
          L2_170 = L2_170.kEnergy_Life
          L0_168 = L0_168(L1_169, L2_170)
          L1_169 = Sound
          L2_170 = L1_169
          L1_169 = L1_169.playSE
          L1_169(L2_170, "ef_ev_exp_01", 1, "", Player.getPuppet())
          L1_169 = Fn_createEffect
          L2_170 = "bom"
          L1_169 = L1_169(L2_170, "ef_ev_exp_01", Fn_getPlayerWorldPos(), false)
          L2_170 = GameDatabase
          L2_170 = L2_170.get
          L2_170 = L2_170(L2_170, ggd.GlobalSystemFlags__GameOver)
          if not L2_170 then
            L2_170 = Sound
            L2_170 = L2_170.playSE
            L2_170(L2_170, "pc1_011", 1, "", Player.getPuppet())
            L2_170 = Fn_captionView
            L2_170("ic_warship_00103")
            L2_170 = Player
            L2_170 = L2_170.setControl
            L2_170(L2_170, Player.kControl_All, false)
            L2_170 = Fn_getCatWarpCheckPoint
            L2_170 = L2_170()
            Fn_setCatWarpCheckPoint("locator2_outrange_up_a_02_02_01")
            Fn_catWarp()
            Fn_setCatWarpCheckPoint(L2_170)
            Fn_captionView("ic_warship_00104")
            if _siren_handle ~= nil then
              Sound:stopSEHandle(_siren_handle)
            end
            _siren_handle = nil
            Player:setControl(Player.kControl_All, true)
            GameDatabase:set(ggd.GlobalSystemFlags__GovernmentCatWarp, false)
          end
        end)
      end
    end
  end
end
function pccubesensor2_sp_warning_go_a_root_in_OnEnter(A0_171)
  local L1_172, L2_173
  L1_172 = GameDatabase
  L2_173 = L1_172
  L1_172 = L1_172.get
  L1_172 = L1_172(L2_173, ggd.Savedata__EventManageFlags__OutrangeLock)
  if L1_172 ~= true then
    L1_172 = GameDatabase
    L2_173 = L1_172
    L1_172 = L1_172.get
    L1_172 = L1_172(L2_173, ggd.GlobalSystemFlags__DeadOutrangeLock)
    if L1_172 == false then
      L1_172 = GameDatabase
      L2_173 = L1_172
      L1_172 = L1_172.get
      L1_172 = L1_172(L2_173, ggd.Savedata__EventManageFlags__CurrentFreeMode)
      L2_173 = GameDatabase
      L2_173 = L2_173.get
      L2_173 = L2_173(L2_173, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L1_172 ~= "ft09" and L1_172 ~= "ft11" and L1_172 ~= "ft21" and L1_172 ~= "ft28" and string.match(L2_173, "(.-)_()") ~= "ep09" and string.match(L2_173, "(.-)_()") ~= "ep10" and string.match(L2_173, "(.-)_()") ~= "ep11" and string.match(L2_173, "(.-)_()") ~= "ep27" then
        invokeTask(function()
          if _siren_handle == nil then
            _siren_handle = Sound:playSEHandle("ep10_siren", 0.8)
          end
        end)
      end
    end
  end
end
function pccubesensor2_sp_warning_go_a_root_out_OnLeave(A0_174)
  invokeTask(function()
    if _siren_handle ~= nil then
      Sound:stopSEHandle(_siren_handle)
    end
    _siren_handle = nil
  end)
end
import("Font")
import("Debug")
import("Player")
__debugLine = 0
__debugDisp = false
__debugSystemTask = true
_debug_outrange = {}
function debugPrint(A0_175)
  print(" [  bg com ] " .. A0_175)
end
function debugDispPrint(A0_176)
  local L1_177
  L1_177 = 30
  if Debug:isDebugMenuOpen() then
    L1_177 = 250
  end
  Font:debugPrint(L1_177, 20 + 16 * __debugLine, A0_176)
  __debugLine = __debugLine + 1
end
function debugCatWarp(A0_178, A1_179)
  local L2_180
  L2_180 = A0_178.getName
  L2_180 = L2_180(A0_178)
  if A1_179 then
    debugPrint("cat warp sensor in " .. L2_180)
  else
    debugPrint("cat warp sensor out " .. L2_180)
  end
  if _debug_outrange[L2_180] == nil then
    _debug_outrange[L2_180] = {state = true, fast = A1_179}
  end
  _debug_outrange[L2_180].state = A1_179
end
function debugDisp()
  local L0_181, L1_182, L2_183, L3_184
  while true do
    if L0_181 then
      if not L0_181 then
      elseif L0_181 then
        __debugLine = 0
        L0_181(L1_182)
        L0_181(L1_182)
        L3_184 = _connect_finish
        L0_181(L1_182)
        L3_184 = _go_onEnterCnt
        L0_181(L1_182)
        L0_181(L1_182)
        L3_184 = _inrange_cnt
        L0_181(L1_182)
        L3_184 = _warning_cnt
        L0_181(L1_182)
        L3_184 = GameDatabase
        L3_184 = L3_184.get
        L3_184 = L3_184(L3_184, ggd.Savedata__EventManageFlags__Outrange)
        L0_181(L1_182)
        L3_184 = GameDatabase
        L3_184 = L3_184.get
        L3_184 = L3_184(L3_184, ggd.Savedata__EventManageFlags__OutrangeLock)
        L0_181(L1_182)
        L3_184 = GameDatabase
        L3_184 = L3_184.get
        L3_184 = L3_184(L3_184, ggd.Savedata__EventManageFlags__OutrangeCheckPoint)
        L0_181(L1_182)
        L3_184 = GameDatabase
        L3_184 = L3_184.get
        L3_184 = L3_184(L3_184, ggd.Savedata__EventManageFlags__EventCheckPoint)
        L0_181(L1_182)
        L0_181(L1_182)
        L0_181(L1_182)
        for L3_184, _FORV_4_ in L0_181(L1_182) do
          debugDispPrint(string.format("%-5s", tostring(_FORV_4_.state)) .. " : " .. string.format("%-5s", tostring(_FORV_4_.fast)) .. " : " .. L3_184)
        end
      end
      L0_181()
    end
  end
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_185
      L1_185 = __debugDisp
      L1_185 = not L1_185
      __debugDisp = L1_185
    end
  }
}
table.insert(g_customDebugMenu, debugPlacementMenu)
