import("math")
import("DebugDraw")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
typedef_SoldierClass = {}
function typedef_SoldierClass.new(A0_0, A1_1)
  local L2_2
  L2_2 = {}
  L2_2.Npc = A0_0
  L2_2.Puppet = A0_0:getPuppet()
  L2_2.InitNodeName = A1_1
  L2_2.AIType = 0
  L2_2.SearchDistance = 10
  L2_2.SearchHigh = 10
  L2_2.SearchLow = 3
  L2_2.Visibility = 180
  L2_2.RouteTable = {}
  L2_2.RouteNowIndex = 1
  L2_2.CheckMoveTask = nil
  L2_2.FindPointTable = {
    {10, 1},
    {5, 2}
  }
  L2_2.ActivFlag = false
  function L2_2.GetPuppet()
    local L0_3, L1_4
    L0_3 = L2_2.Puppet
    return L0_3
  end
  function L2_2.AIType0()
    if L2_2.ActiveFlag == false then
      return 0
    end
    return L2_2.CheckSearch()
  end
  function L2_2.AIType1()
    local L0_5
    L0_5 = 0
    if L2_2.ActiveFlag == false then
      return 0
    end
    return L0_5
  end
  function L2_2.AIType2()
    local L0_6
    L0_6 = 0
    if L2_2.ActiveFlag == false then
      return 0
    end
    if L2_2.CheckMoveTask == nil then
      L2_2.CheckMoveTask = L2_2.MoveRoute(L2_2.RouteNowIndex)
    elseif L2_2.CheckMoveTask:isRunning() == true then
    else
      L2_2.CheckMoveTask = nil
      L2_2.RouteNowIndex = L2_2.RouteNowIndex + 1
      if L2_2.RouteNowIndex > #L2_2.RouteTable then
        L2_2.RouteNowIndex = 1
      end
    end
    L0_6 = L2_2.CheckSearch()
    return L0_6
  end
  L2_2.AIStep = L2_2.AIType0
  function L2_2.SetAIType(A0_7)
    local L1_8
    if A0_7 == 0 then
      L2_2.AIType = 0
      L1_8 = L2_2.AIType0
      L2_2.AIStep = L1_8
    elseif A0_7 == 1 then
      L2_2.AIType = 1
      L1_8 = L2_2.AIType1
      L2_2.AIStep = L1_8
    else
      L2_2.AIType = 2
      L1_8 = L2_2.AIType2
      L2_2.AIStep = L1_8
    end
  end
  function L2_2.GetAIType()
    local L0_9, L1_10
    L0_9 = L2_2.AIType
    return L0_9
  end
  function L2_2.SetSearchDistance(A0_11)
    local L1_12
    L2_2.SearchDistance = A0_11
  end
  function L2_2.GetSearchDistance()
    local L0_13, L1_14
    L0_13 = L2_2.SearchDistance
    return L0_13
  end
  function L2_2.SetSearchHigh(A0_15)
    local L1_16
    L2_2.SearchHigh = A0_15
  end
  function L2_2.GetSearchHigh()
    local L0_17, L1_18
    L0_17 = L2_2.SearchHigh
    return L0_17
  end
  function L2_2.SetSearchLow(A0_19)
    local L1_20
    L2_2.SearchLow = A0_19
  end
  function L2_2.GetSearchLow()
    local L0_21, L1_22
    L0_21 = L2_2.SearchLow
    return L0_21
  end
  function L2_2.SetRouteTable(A0_23)
    local L1_24
    L2_2.RouteTable = A0_23
  end
  function L2_2.SetRouteSpeedTable(A0_25)
    local L1_26
    L2_2.RouteSpeedTable = A0_25
  end
  function L2_2.MoveRoute(A0_27)
    local L1_28, L2_29, L3_30
    L1_28 = ""
    L2_29 = {}
    L3_30 = nil
    if A0_27 <= #L2_2.RouteTable then
      L2_29[1] = L2_2.RouteTable[A0_27]
    end
    L3_30 = Fn_moveChara(L2_2.Puppet:getName(), L2_29)
    return L3_30
  end
  function L2_2.SetFindPointTable(A0_31)
    local L1_32
    L2_2.FindPointTable = A0_31
  end
  function L2_2.SetActive(A0_33)
    local L1_34
    L2_2.ActiveFlag = A0_33
  end
  function L2_2.GetActive()
    local L0_35, L1_36
    L0_35 = L2_2.ActiveFlag
    return L0_35
  end
  function L2_2.Reset()
    if L2_2.CheckMoveTask ~= nil then
      print("\231\167\187\229\139\149\232\167\163\233\153\164\228\184\173")
      L2_2.CheckMoveTask:abort()
      while L2_2.CheckMoveTask:isRunning() do
        wait()
      end
      L2_2.CheckMoveTask = nil
    end
    Fn_playMotion(L2_2.Puppet:getName(), "stay", false)
    Fn_setPosChara(L2_2.Puppet:getName(), L2_2.InitNodeName)
    L2_2.RouteNowIndex = 1
  end
  function L2_2.CheckSearch()
    local L0_37, L1_38, L2_39
    L0_37 = 0
    L1_38 = L2_2.Puppet
    L2_39 = L1_38
    L1_38 = L1_38.getWorldPos
    L1_38 = L1_38(L2_39)
    L2_39 = Fn_getPlayerWorldPos
    L2_39 = L2_39()
    if L2_2.SearchDistance > L1_38:DistanceTo(L2_39) then
      if L1_38.y <= L2_39.y then
        if L2_39.y - L1_38.y < L2_2.SearchHigh then
          L0_37 = true
        end
      elseif L1_38.y - L2_39.y < L2_2.SearchLow then
        L0_37 = true
      end
    end
    if L0_37 == true then
      L0_37 = 0
      for _FORV_6_ = 1, #L2_2.FindPointTable do
        if L1_38:DistanceTo(L2_39) < L2_2.FindPointTable[_FORV_6_][1] then
          L0_37 = L2_2.FindPointTable[_FORV_6_][2]
        end
      end
    end
    return L0_37
  end
  return L2_2
end
typedef_MultiNaviClass = {}
function typedef_MultiNaviClass.new(A0_40, A1_41, A2_42)
  local L3_43
  L3_43 = {}
  L3_43.NaviDistance = 20
  L3_43.Pos = Vector(0, 0, 0)
  if A1_41 == nil or A2_42 == nil then
    L3_43.obj = HUD:mnaviNew({name = A0_40})
  else
    L3_43.obj = HUD:mnaviNew({
      name = A0_40,
      PochFadeLen0 = A1_41,
      PochFadeLen100 = A2_42
    })
  end
  function L3_43.SetActive(A0_44)
    L3_43.obj:setActive(A0_44)
  end
  function L3_43.Kill()
    L3_43.obj:del(false)
  end
  function L3_43.SetPos(A0_45)
    L3_43.Pos = A0_45
    L3_43.obj:setTrgPos(A0_45)
  end
  function L3_43.SetNaviDistance(A0_46)
    local L1_47
    L3_43.NaviDistance = A0_46
  end
  function L3_43.CheckSearch()
    local L0_48, L2_49, L3_50
    L0_48 = false
    L2_49 = L3_43.NaviDistance
    L3_50 = L3_43.Pos
    L3_50 = L3_50.DistanceTo
    L3_50 = L3_50(L3_50, Fn_getPlayerWorldPos())
    if L2_49 > L3_50 then
      L0_48 = true
    end
    return L0_48
  end
  return L3_43
end
g_soldier = {}
g_soldier_max = 22
g_mnavi = {}
g_mnavi_max = 2
function Initialize()
  local L0_51, L1_52, L2_53, L3_54, L4_55, L5_56, L6_57
  L0_51 = Debug
  L1_52 = L0_51
  L0_51 = L0_51.setSwitch
  L2_53 = {
    L3_54,
    L4_55,
    L5_56
  }
  L0_51(L1_52, L2_53, L3_54)
  L0_51 = Debug
  L1_52 = L0_51
  L0_51 = L0_51.setSwitch
  L2_53 = {
    L3_54,
    L4_55,
    L5_56
  }
  L0_51(L1_52, L2_53, L3_54)
  L0_51 = {}
  L1_52, L2_53 = nil, nil
  for L6_57 = 1, g_soldier_max do
    L0_51[L6_57] = {
      name = "ep08_soldier" .. L6_57,
      type = "thief",
      node = "locator2_soldier_0" .. L6_57,
      emeny = true
    }
  end
  L3_54(L4_55)
  for L6_57 = 1, g_soldier_max do
    g_soldier[L6_57] = typedef_SoldierClass.new(Fn_findChara(L0_51[L6_57].name), L0_51[L6_57].node)
  end
  for L6_57 = 1, 2 do
    g_soldier[L6_57].SetAIType(0)
    g_soldier[L6_57].SetSearchDistance(30)
    g_soldier[L6_57].SetSearchHigh(30)
    g_soldier[L6_57].SetSearchLow(0)
    g_soldier[L6_57].SetFindPointTable({
      {30, 0.5},
      {20, 1},
      {15, 1.5},
      {10, 2},
      {5, 2.5}
    })
  end
  L3_54(L4_55)
  L3_54(L4_55)
  L6_57 = "locator2_sol04_path_02"
  L3_54(L4_55)
  L3_54(L4_55)
  for L6_57 = 6, 11 do
    g_soldier[L6_57].SetAIType(0)
    g_soldier[L6_57].SetSearchDistance(10)
    g_soldier[L6_57].SetSearchHigh(10)
    g_soldier[L6_57].SetSearchLow(0)
  end
  L3_54(L4_55)
  L3_54(L4_55)
  L3_54(L4_55)
  L3_54(L4_55)
  for L6_57 = 13, 22 do
    g_soldier[L6_57].SetAIType(0)
  end
  for L6_57 = 1, 2 do
    g_mnavi[L6_57] = typedef_MultiNaviClass.new("navi" .. L6_57)
  end
  L6_57 = 104.2
  L6_57 = L4_55(L5_56, L6_57, -102.84)
  L3_54(L4_55, L5_56, L6_57, L4_55(L5_56, L6_57, -102.84))
  L6_57 = 53
  L6_57 = L4_55(L5_56, L6_57, -177.6)
  L3_54(L4_55, L5_56, L6_57, L4_55(L5_56, L6_57, -177.6))
  L1_52 = 1
  while true do
    L2_53 = L3_54
    if L2_53 ~= nil then
      L3_54(L4_55, L5_56)
      L1_52 = L1_52 + 1
      L3_54()
    end
  end
end
function Ingame()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64
  L0_58 = 0
  L1_59 = 0
  L2_60 = 0
  L3_61()
  for L6_64 = 1, g_soldier_max do
    g_soldier[L6_64].SetActive(true)
  end
  for L6_64 = 1, 2 do
    g_mnavi[L6_64].SetActive(true)
  end
  L6_64 = -16.9133
  L6_64 = Vector
  L6_64 = L6_64(0, 0, 0)
  DebugDraw:setDepthTest(true)
  DebugDraw:setColor(1, 0, 0)
  while true do
    DebugDraw:setDepthTest(true)
    DebugDraw:setColor(1, 0, 0)
    L6_64 = Vector(57, 60, 10.5)
    DebugDraw:setTransform(L6_64)
    DebugDraw:drawSphere(25)
    L6_64 = Vector(-16.9133, 60, 29.5)
    DebugDraw:setColor(1, 0, 0)
    DebugDraw:setTransform(L6_64)
    DebugDraw:drawSphere(50)
    for _FORV_16_ = 1, g_soldier_max do
      L0_58 = L0_58 + g_soldier[_FORV_16_].AIStep()
    end
    if L1_59 == L0_58 then
      L0_58 = L0_58 - 0.5
      if L0_58 < 0 then
        L0_58 = 0
      end
    end
    if L0_58 >= 100 then
      L0_58 = 100
      Font:asciiPrint(1650, 20, "Find:100/100")
      Fn_userCtrlAllOff()
      Fn_captionView("\232\166\139\227\129\164\227\129\139\227\129\163\227\129\161\227\130\131\227\129\163\227\129\159\239\188\158\239\188\156\239\188\155\239\188\155\239\188\155\239\188\155")
      L0_58 = 0
      for _FORV_16_ = 1, g_soldier_max do
        g_soldier[_FORV_16_].Reset()
      end
      Fn_setPcPosRot(GetLocatorPos("locator2_pc_start_pos"), GetLocatorRot("locator2_pc_start_pos"))
      Fn_userCtrlOn()
    end
    if L1_59 < L0_58 then
      L2_60 = (L2_60 + 1) % 6
    else
      L2_60 = 0
    end
    if L2_60 < 4 then
      Font:asciiPrint(1650, 20, "Find:" .. math.floor(L0_58) .. "/100")
    end
    L1_59 = L0_58
    for _FORV_16_ = 1, g_mnavi_max do
      if g_mnavi[_FORV_16_].CheckSearch() == true then
        print("navi!!!!!!!!!!!!!")
        g_mnavi[_FORV_16_].Kill()
      end
    end
    _FOR_()
  end
end
function Finalize()
  local L0_65, L1_66
end
function GetLocatorPosRot(A0_67)
  local L1_68, L2_69, L3_70
  L1_68 = findGameObject2
  L2_69 = "Node"
  L3_70 = A0_67
  L1_68 = L1_68(L2_69, L3_70)
  L3_70 = L1_68
  L2_69 = L1_68.getWorldTransform
  L3_70 = L2_69(L3_70)
  return L2_69, L3_70
end
function GetLocatorPos(A0_71)
  local L1_72, L2_73
  L1_72 = findGameObject2
  L2_73 = "Node"
  L1_72 = L1_72(L2_73, A0_71)
  L2_73 = nil
  if L1_72 == nil then
    return nil
  end
  L2_73 = L1_72:getWorldPos()
  return L2_73
end
function GetLocatorRot(A0_74)
  local L1_75, L2_76
  L1_75 = findGameObject2
  L2_76 = "Node"
  L1_75 = L1_75(L2_76, A0_74)
  L2_76 = nil
  if L1_75 == nil then
    return nil
  end
  L2_76 = L1_75:getWorldRot()
  return L2_76
end
function PutGemObj(A0_77, A1_78)
  createGameObject2("Gem"):setGemModelNo(A1_78)
  createGameObject2("Gem"):setWorldPos(A0_77)
  start_game_obj()
end
