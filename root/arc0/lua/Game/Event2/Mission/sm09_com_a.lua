dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_ship_hdl = nil
_mission_a_start = false
_request_landingship_move = false
_request_celebrity_move = false
_request_landingship_del = false
NORMAL_BOX_MAX = 19
BIG_BOX_MAX = 2
SMALL_BOX_MAX = 3
BARREL_MAX = 3
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator2_ship_a",
      name = "landingship01"
    }
  }
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator2_ship_bc",
      name = "landingship01"
    }
  }
}
function Initialize()
  if Fn_getMissionPart() == "sm09_a" then
    _mission_a_start = true
  end
end
function Ingame()
  local L0_0, L1_1
  L0_0 = nil
  L1_1 = _mission_a_start
  if L1_1 then
    L1_1 = findGameObject2
    L1_1 = L1_1("EnemyGenerator", "enmgen2_01")
    L0_0 = L1_1
  else
    L1_1 = findGameObject2
    L1_1 = L1_1("EnemyGenerator", "enmgen2_02")
    L0_0 = L1_1
  end
  L1_1 = L0_0.requestSpawn
  L1_1(L0_0)
  L1_1 = L0_0.setEnemyMarker
  L1_1(L0_0, false)
  L1_1 = print
  L1_1("\229\188\183\232\165\178\230\143\154\233\153\184\232\137\135\231\148\159\230\136\144\233\150\139\229\167\139")
  while true do
    L1_1 = L0_0.isPrepared
    L1_1 = L1_1(L0_0)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = print
  L1_1("\229\188\183\232\165\178\230\143\154\233\153\184\232\137\135\231\148\159\230\136\144\229\174\140\228\186\134")
  L1_1 = _mission_a_start
  if L1_1 then
    repeat
      L1_1 = _request_landingship_move
      if L1_1 then
        function L1_1(A0_2)
          local L1_3
          L1_3 = A0_2.state
          if L1_3 == "wait" then
            A0_2.changeState = "move"
            L1_3 = {
              "locator2_ship_a_move"
            }
            A0_2.movePoint = L1_3
          end
          return A0_2
        end
        findGameObject2("Puppet", "landingship01"):getBrain():setEventListener("enemy_landingship_event", L1_1)
        break
      end
      L1_1 = wait
      L1_1()
      L1_1 = false
    until L1_1
  end
  repeat
    L1_1 = _request_landingship_del
    if L1_1 then
      L1_1 = L0_0.requestAllEnemyKill
      L1_1(L0_0)
    end
    L1_1 = wait
    L1_1()
    L1_1 = false
  until L1_1
end
function Finalize()
  local L0_4, L1_5
end
function getMissionPart()
  local L0_6
  L0_6 = nil
  L0_6 = Fn_getMissionPart()
  return L0_6
end
function requestLandingShipMove()
  local L0_7, L1_8
  _request_landingship_move = true
end
function requestCelebrityShipMove()
  local L0_9, L1_10
  _request_celebrity_move = true
end
function requestLandingshipDel()
  local L0_11, L1_12
  _request_landingship_del = true
end
function initializeHideObject()
  local L0_13, L1_14, L2_15, L3_16, L4_17
  for L3_16 = 1, NORMAL_BOX_MAX do
    L4_17 = "bg2_box_ms_02_"
    L4_17 = L4_17 .. string.format("%02d", L3_16)
    findGameObject2("GimmickBg", L4_17):setIgnoreGrab(true)
  end
  for L3_16 = 1, BIG_BOX_MAX do
    L4_17 = "bg2_woodbox_ms_01_"
    L4_17 = L4_17 .. string.format("%02d", L3_16)
    findGameObject2("GimmickBg", L4_17):setIgnoreGrab(true)
  end
  for L3_16 = 1, SMALL_BOX_MAX do
    L4_17 = "bg2_woodbox_kk_05_"
    L4_17 = L4_17 .. string.format("%02d", L3_16)
    findGameObject2("GimmickBg", L4_17):setIgnoreGrab(true)
  end
end
function restoreHideObject()
  local L0_18, L1_19, L2_20, L3_21, L4_22
  for L3_21 = 1, NORMAL_BOX_MAX do
    L4_22 = "bg2_box_ms_02_"
    L4_22 = L4_22 .. string.format("%02d", L3_21)
    findGameObject2("GimmickBg", L4_22):requestRestoreForce()
  end
  for L3_21 = 1, BIG_BOX_MAX do
    L4_22 = "bg2_woodbox_ms_01_"
    L4_22 = L4_22 .. string.format("%02d", L3_21)
    findGameObject2("GimmickBg", L4_22):requestRestoreForce()
  end
  for L3_21 = 1, SMALL_BOX_MAX do
    L4_22 = "bg2_woodbox_kk_05_"
    L4_22 = L4_22 .. string.format("%02d", L3_21)
    findGameObject2("GimmickBg", L4_22):requestRestoreForce()
  end
end
function pccubesensor2_guidance_area_01_OnLeave()
  if _part == "sm09_d" then
    Player:setStay(true, false)
    Fn_captionView("sm09_09021")
    Player:setStay(false)
  else
    Fn_captionView("sm09_00116")
  end
end
function pccubesensor2_warning_area_01_OnLeave()
  if _part == "sm09_d" then
    invokeTask(function()
      Fn_catWarp()
    end)
  else
    Player:setStay(true, false)
    Fn_captionView("sm09_09021")
    Player:setStay(false)
  end
end
function pccubesensor2_over_area_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
