local L1_1
L0_0 = {}
L0_0.ONE_SHELL_ENEMY = 1
L0_0.ONE_SHELL_ENEMY_BREAK_OR_ANGLE = 2
L0_0.TWO_FLY_ENEMIES = 3
L0_0.FOUR_FLY_ENEMIES = 4
L0_0.ATTACK_ENEMY = 5
L0_0.COMPLETE = 6
PHOTO_MISSION = L0_0
L0_0 = PHOTO_MISSION
L0_0 = L0_0.ONE_SHELL_ENEMY
_photo_mission_state = L0_0
L0_0 = {}
_enemy_hdl_tbl = L0_0
L0_0 = {}
_photo_target_tbl = L0_0
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11
  if L3_5 ~= 0 then
    L3_5(L4_6)
    return L3_5
  end
  for L6_8, L7_9 in L3_5(L4_6) do
    L8_10 = createGameObject2
    L9_11 = "Gem"
    L8_10 = L8_10(L9_11)
    L9_11 = findGameObject2
    L9_11 = L9_11("Node", L7_9)
    L9_11 = L9_11.getWorldPos
    L9_11 = L9_11(L9_11)
    L8_10:setGemModelNo(A2_4)
    L8_10:setWorldPos(L9_11)
    L8_10:setForceMove()
    L8_10:setVisible(true)
    L8_10:try_init()
    L8_10:waitForReadyAsync(function()
      L8_10:try_start()
    end)
    table.insert(A1_3, L8_10)
    break
  end
  return L3_5
end
getCreatedGemHandleTable = L0_0
function L0_0(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  for L4_16, _FORV_5_ in L1_13(L2_14) do
    _FORV_5_:kill()
  end
  for L4_16 = L1_13(L2_14), 1, -1 do
    table.remove(A0_12, L4_16)
  end
end
deleteGem = L0_0
function L0_0(A0_17, A1_18, A2_19, A3_20)
  local L4_21
  L4_21 = nil
  L4_21 = Photo.create(kPHOTO_CAPTION_ON, kPHOTO_TYPE_ANY, true, {near = A0_17, far = A1_18}, A2_19, A3_20)
  return L4_21
end
createPhotoInstance = L0_0
function L0_0(A0_22, A1_23)
  if _photo_target_tbl == nil then
    print("\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\140\232\168\173\229\174\154\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
    return false
  end
  if A1_23 ~= nil then
    A0_22:set(A1_23)
  end
  if _photo_mission_state == PHOTO_MISSION.ONE_SHELL_ENEMY_BREAK_OR_ANGLE then
    for _FORV_5_ = 1, #_enemy_hdl_tbl do
      A0_22:set(_enemy_hdl_tbl[_FORV_5_])
    end
  elseif _photo_mission_state == PHOTO_MISSION.ONE_SHELL_ENEMY then
    for _FORV_5_ = 1, #_enemy_hdl_tbl do
      A0_22:set(_enemy_hdl_tbl[_FORV_5_])
    end
  else
    for _FORV_5_, _FORV_6_ in pairs(_photo_target_tbl) do
      A0_22:set(_enemy_hdl_tbl[_FORV_6_.NAME], _FORV_6_.JOINT)
    end
  end
  return true
end
setPhotoTarget = L0_0
function L0_0()
  for _FORV_3_, _FORV_4_ in pairs(_photo_target_tbl) do
    _enemy_hdl_tbl[_FORV_4_.NAME] = Mv_safeObjectKill(_enemy_hdl_tbl[_FORV_4_.NAME])
  end
end
deleteEnemyHandleTable = L0_0
