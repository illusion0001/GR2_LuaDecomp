dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_010"
_floor_num = 10
_boss_battle_floor = true
_boss_break_flg = false
_gem_obj = {}
enmgen_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "faker",
      locator = "locator_boss",
      name = "mine99_010_boss",
      ai_spawn_option = "Faker/faker",
      navi_mesh_name = "wa_a_01_custom01"
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
    _boss_break_flg = true
  end
}
function InitializeBody()
  local L0_8
  L0_8 = print
  L0_8(string.format("mine99_%03d InitializeBody", _floor_num))
end
function IngameBody()
  local L0_9, L1_10, L2_11, L3_12, L4_13
  L0_9 = print
  L0_9(L1_10, L2_11, L3_12, L4_13, L1_10(L2_11, L3_12))
  L0_9 = Fn_getMine99FloorClear
  L0_9 = L0_9()
  if not L0_9 then
    L0_9 = findGameObject2
    L0_9 = L0_9(L1_10, L2_11)
    if L0_9 then
      L1_10(L2_11)
    end
    for L4_13 = 1, 4 do
      invokeSystemTask(function()
        _gem_obj[L4_13] = createGameObject2("Gem")
        _gem_obj[L4_13]:setGemModelNo(GEM_VITAL)
        _gem_obj[L4_13]:setActive(true)
        _gem_obj[L4_13]:setVisible(true)
        _gem_obj[L4_13]:try_init()
        _gem_obj[L4_13]:setVisibleBlockHalfSize(150)
        _gem_obj[L4_13]:waitForReadyAsync(function()
          _gem_obj[L4_13]:try_start()
        end)
        findGameObject2("Node", "locator2_vital_gem_" .. string.format("%02d", L4_13)):appendChild(_gem_obj[L4_13])
      end)
      break
    end
  end
  L0_9 = Fn_missionStart
  L0_9()
  L0_9 = Fn_showMineName
  L0_9()
  L0_9 = Fn_userCtrlOn
  L0_9()
  L0_9 = waitSeconds
  L0_9(L1_10)
  L0_9 = Fn_getMine99FloorClear
  L0_9 = L0_9()
  if not L0_9 then
    L0_9 = Fn_captionView
    L0_9(L1_10, L2_11)
    L0_9 = Sound
    L0_9 = L0_9.playSE
    L0_9(L1_10, L2_11, L3_12)
    L0_9 = Fn_missionView
    L0_9(L1_10, L2_11, L3_12, L4_13)
    L0_9 = Fn_setBgmPoint
    L0_9(L1_10, L2_11)
    L0_9 = findGameObject2
    L0_9 = L0_9(L1_10, L2_11)
    L2_11(L3_12, L4_13)
    L2_11(L3_12, L4_13)
    repeat
      L2_11()
    until L2_11
    L2_11(L3_12, L4_13)
    L2_11(L3_12, L4_13, 1)
    L2_11()
    L2_11()
    for _FORV_5_ = 1, 4 do
      if _gem_obj[_FORV_5_] ~= nil then
        _gem_obj[_FORV_5_]:try_term()
        _gem_obj[_FORV_5_] = nil
      end
    end
    L2_11(L3_12)
    L2_11(L3_12)
    L2_11(L3_12)
    L2_11()
    L2_11()
    L2_11()
    L2_11()
    L2_11(L3_12, L4_13, 1)
    L2_11(L3_12, L4_13, 4.5)
    if L2_11 then
    else
      L2_11(L3_12)
    end
    L2_11()
  else
    L0_9 = print
    L0_9(L1_10)
    L0_9 = Fn_setBgmPoint
    L0_9(L1_10, L2_11)
  end
  L0_9 = Fn_setGravityGateActive
  L0_9(L1_10)
  L0_9 = Fn_cageMove
  L0_9()
end
function FinalizeBody()
  local L0_14
  L0_14 = print
  L0_14(string.format("mine99_%03d FinalizeBody", _floor_num))
end
