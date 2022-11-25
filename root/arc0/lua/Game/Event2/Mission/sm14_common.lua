dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
CROW_WARP_DISTANCE = 10
RETRY_ORE_GAP = 10
MINE_EXIT_TIME = 600
CROW_NEAR_DISTANCE = 10
_kit_ore_task = nil
_mine_time = 0
_crow_mine = true
_crow_warp_node = ""
function SetCounterStart(A0_0)
  Fn_sendSetOtherPreciousGemNum(0)
  HUD:counter999SetVisible(true)
  HUD:counter999SetTextID("sm14_09024")
  HUD:counter999SetIcon(HUD.kCount999IconType_Checkbox)
  HUD:counter999SetNum(A0_0)
  _kit_ore_task = invokeTask(function()
    while true do
      HUD:counter999SetNum(A0_0 - GlobalGem:GetOtherPreciousGemNum())
      wait()
    end
  end)
end
function SetCounterEnd()
  if _kit_ore_task then
    _kit_ore_task:abort()
    _kit_ore_task = nil
  end
  HUD:counter999SetNum(0)
  HUD:counter999SetVisible(false)
end
function CrowWarpAroundKit(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  L4_5 = A1_2
  L3_4 = A1_2.setIdling
  L3_4(L4_5, L5_6)
  L3_4 = print
  L4_5 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\162\227\130\164\227\131\137\227\131\171"
  L3_4(L4_5)
  L3_4 = {}
  L4_5 = 4
  for L8_9 = 1, L4_5 do
    L10_11 = string
    L10_11 = L10_11.format
    L10_11 = L10_11("%02d", L8_9)
    L10_11 = findGameObject2
    L10_11 = L10_11("Node", L9_10)
    if L10_11 ~= nil then
      L3_4[L8_9] = {}
      L3_4[L8_9].node_name = L9_10
      L3_4[L8_9].hdl = L10_11
      L3_4[L8_9].dist = Fn_getDistanceToPlayer(L10_11)
    else
      break
    end
  end
  L5_6(L6_7, L7_8)
  L7_8(L8_9)
  if L5_6 > L7_8 then
    for L10_11 = 1, 4 do
      if Fn_isInSightTarget(L3_4[L10_11].hdl, 1) == false then
        break
      end
    end
    L10_11 = L6_7
    L7_8(L8_9)
    L7_8(L8_9)
    L7_8(L8_9, L9_10)
    L7_8(L8_9)
  end
  L7_8(L8_9)
end
function CrowJumpPrepare(A0_12)
  A0_12:setIdling(true)
  A0_12:reset()
  A0_12:setAbility(Supporter.Ability.Avoid, false)
  A0_12:setDetectThreatDistance(0)
end
function CrowJumpEnd(A0_13)
  A0_13:setAbility(Supporter.Ability.Avoid, true)
  A0_13:setDetectThreatDistance(20)
  A0_13:setIdling(false)
end
function catWarp()
  invokeTask(function()
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false then
      Fn_catWarp()
      if _brain_crow ~= nil then
        if _crow_warp_node == nil then
          _crow_warp_node = Fn_getCatWarpCheckPoint()
        end
        if _crow_warp_node ~= nil and _crow_warp_node ~= "" and findGameObject2("Node", _crow_warp_node) ~= nil then
          _brain_crow:startWarpAction({
            node_posrot = findGameObject2("Node", _crow_warp_node),
            forced = true,
            end_idling = false
          })
          repeat
            wait()
          until _brain_crow:isWarpActionEnd() == true
          if _crow_mine == true then
            _brain_crow:restartMine()
          end
        end
      end
    end
  end)
end
function warningCatWarp(A0_14, A1_15)
  invokeTask(function()
    Player:setStay(true)
    if A0_14 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_14))
    end
    if A1_15 ~= nil then
      Fn_captionViewLock(A1_15)
    else
    end
    Player:setStay(false)
  end)
end
function createMineTimer()
  return invokeTask(function()
    while true do
      waitSeconds(1)
      _mine_time = _mine_time + 1
    end
  end)
end
function getMineTime()
  local L0_16, L1_17
  L0_16 = _mine_time
  return L0_16
end
function resetMineTime()
  local L0_18, L1_19
  _mine_time = 0
end
