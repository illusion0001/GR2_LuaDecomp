dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
_puppet_tbl = {}
_is_in_sensor = false
_sdemo = nil
_pdemo_01 = nil
_is_find_crow = false
function Initialize()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
  _chara_table = {
    {
      name = "injured_01",
      type = "man43",
      node = "locator2_injured_01",
      active = false
    },
    {
      name = "injured_02",
      type = "man44",
      node = "locator2_injured_02",
      active = false
    },
    {
      name = "injured_03",
      type = "man42",
      node = "locator2_injured_03",
      active = false,
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "injured_04",
      type = "man44",
      node = "locator2_injured_04",
      active = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "injured_05",
      type = "man43",
      node = "locator2_injured_05",
      active = false,
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "injured_06",
      type = "man44",
      node = "locator2_injured_06",
      active = false
    },
    {
      name = "injured_07",
      type = "man42",
      node = "locator2_injured_07",
      active = false
    }
  }
  Fn_setupNpc(_chara_table)
  for _FORV_3_, _FORV_4_ in pairs(_chara_table) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
  end
  _sdemo = SDemo.create("ep07_f")
  _pdemo_01 = PDemo.create("ep07_a_c01", Fn_findAreaHandle("po_a_04"), {camera = true, scene_param = false})
  Fn_pcSensorOff("pccubesensor2_search_crow_01")
  Fn_pcSensorOff("pccubesensor2_search_crow_02")
  Fn_pcSensorOff("pccubesensor2_search_crow_03")
  Fn_pcSensorOff("pccubesensor2_search_crow_04")
  Fn_pcSensorOff("pccubesensor2_search_crow_05")
  Fn_pcSensorOff("pccubesensor2_search_crow_out_01")
  Fn_pcSensorOff("pccubesensor2_search_crow_out_02")
end
function Ingame()
  local L0_0, L1_1, L2_2
  for _FORV_3_, _FORV_4_ in L0_0(L1_1) do
    Fn_findNpc(_FORV_4_.name):ignoreStoop()
  end
  L0_0(L1_1)
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0(L1_1, L2_2, false, {isRepeat = true})
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1, L2_2, false)
  _is_find_crow = false
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1, L2_2, Camera.kControl_All, false)
  L0_0(L1_1, L2_2, 0.2)
  L0_0(L1_1, L2_2, Camera.kControl_All, true)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0(L1_1)
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0()
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1, L2_2, false)
  L0_0()
  L0_0(L1_1, L2_2, 1)
  L0_0(L1_1)
  L0_0(L1_1, L2_2, Camera.kControl_All, false)
  L0_0(L1_1, L2_2, 0.3)
  L0_0(L1_1, L2_2, Camera.kControl_All, true)
  L0_0()
  L0_0(L1_1, L2_2, false, {isStop = true, isRepeat = false})
  L0_0(L1_1, L2_2, 1, "", _puppet_tbl.injured_01)
  L2_2.valid = false
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  while true do
    if L0_0 ~= nil then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0(L1_1)
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0()
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2, false, {isStop = true, isRepeat = false})
  L0_0(L1_1, L2_2, false, {isStop = true, isRepeat = false})
  L0_0(L1_1, L2_2, false)
  L2_2.valid = false
  L0_0(L1_1, L2_2)
  L2_2.valid = false
  L0_0(L1_1, L2_2)
  L0_0()
  L0_0(L1_1, L2_2, 1)
  L0_0(L1_1)
  L0_0(L1_1, L2_2, Camera.kControl_All, false)
  L0_0(L1_1, L2_2, 0.3)
  L0_0(L1_1, L2_2, Camera.kControl_All, true)
  L0_0()
  L0_0(L1_1, L2_2, false, {isStop = true, isRepeat = false})
  L0_0(L1_1, L2_2, 1, "", _puppet_tbl.injured_02)
  L2_2.valid = false
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2, L1_1(L2_2, "locator2_navi_search_crow_03"))
  while true do
    if L0_0 ~= nil then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0(L1_1)
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  L0_0(L1_1)
  _is_in_sensor = false
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0()
  L0_0(L1_1, L2_2, true)
  L0_0(L1_1)
  L0_0(L1_1, L2_2, "locator2_sdemo_04_aim_01")
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0.pup_crow = L1_1
  L0_0(L1_1, L2_2)
  L1_1(L2_2, false)
  L1_1(L2_2, true)
  L1_1()
  L1_1(L2_2, "man01_groggy_u_down_01", false, {isStop = true, isRepeat = false})
  L1_1(L2_2, "m12_004", 1, "", _puppet_tbl.injured_05)
  L1_1(L2_2, {valid = false})
  L1_1(L2_2)
  L1_1(L2_2, {
    {
      pos = "locator2_sdemo_04_cam_02",
      time = 3,
      hashfunc = "EaseOut"
    }
  }, nil)
  while true do
    if L1_1 then
      L1_1()
    end
  end
  L1_1(L2_2)
  table.insert(L1_1, {
    pos = _puppet_tbl.pup_crow:getWorldPos(),
    action = Supporter.MovePoint.Air,
    vel = 10
  })
  while findGameObject2("Node", "locator2_sdemo_04_crow_move_" .. string.format("%02d", L2_2)) ~= nil do
    table.insert(L1_1, {
      pos = findGameObject2("Node", "locator2_sdemo_04_crow_move_" .. string.format("%02d", L2_2)):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 10
    })
    do break end
    break
  end
  L0_0:setMovePoints(L1_1)
  L0_0:startMovePoint()
  L1_1(L2_2, nil, {
    {
      pos = "warppoint2_crow_01",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    if L1_1 then
      L1_1()
    end
  end
  L1_1(L2_2)
  L1_1(L2_2, 1)
  while true do
    if L1_1 then
      L1_1()
    end
  end
  _is_find_crow = true
  L1_1()
  L1_1(L2_2, false)
  while true do
    if L1_1 == false then
      L1_1()
    end
  end
  L1_1(L2_2)
  L1_1()
  L1_1(L2_2, "warppoint2_injured_06_01")
  L1_1(L2_2, "warppoint2_injured_07_01")
  L1_1(L2_2, "man52_stay_fighting_00", false)
  L1_1(L2_2, "stoop_00", false)
  L1_1(L2_2, {valid = false})
  L1_1(L2_2, findGameObject2("Node", "warppoint2_crow_02"), Supporter.FirstAction.Ground)
  L1_1(L2_2, true)
  L1_1()
  L1_1(L2_2, "cro01_fighting_00")
  L1_1(L2_2, L2_2("Node", "locator2_navi_search_crow_04"))
  L1_1(L2_2)
  L1_1(L2_2, "m10_504c", 1)
  _is_in_sensor = false
  L1_1(L2_2)
  while true do
    if L1_1 == false then
      L1_1()
    end
  end
  L1_1(L2_2)
  _is_in_sensor = false
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1()
  L1_1(L2_2, Camera.kPlayer, Camera.kControl_All, false)
  L1_1(L2_2)
  L1_1(L2_2, false)
  L1_1(L2_2)
  L1_1(L2_2, false)
  L1_1(L2_2, false)
  L1_1(L2_2, false)
  L1_1(L2_2)
  L1_1(L2_2, "warppoint2_injured_06_02")
  L1_1(L2_2, "warppoint2_injured_07_02")
  while true do
    if not L1_1 then
      L1_1()
    end
  end
  L1_1(L2_2, true)
  L1_1(L2_2)
  L1_1(L2_2, true)
  L1_1(L2_2, true)
  L1_1(L2_2, "man01_down_b_01", false)
  L1_1(L2_2, "man01_groggy_d_00", false)
  L1_1(L2_2, 1)
  L1_1(L2_2)
  _pdemo_01 = nil
  L1_1(L2_2)
  L1_1(L2_2, 0.1, 0.2, 2)
  L1_1(L2_2, Camera.kPlayer, Camera.kControl_All, true)
  L1_1(L2_2)
  L1_1(L2_2, "man01_groggy_d_down_00", false, {isStop = true, isRepeat = false})
  L1_1(L2_2, "m12_003", 1, "", _puppet_tbl.injured_07)
  L1_1(L2_2, {valid = false})
  L1_1()
  L1_1(L2_2)
  L2_2(1.3)
  L2_2(findGameObject2("Node", "locator2_navi_search_crow_05"))
  L2_2("pccubesensor2_search_crow_05")
  _is_in_sensor = false
  while true do
    if L2_2 == false then
      L2_2()
    end
  end
  L2_2()
  L2_2("pccubesensor2_search_crow_05")
  _is_in_sensor = false
  L2_2(L1_1)
  L1_1()
  L1_1(L2_2)
  L1_1()
  L1_1()
  L1_1()
end
function Finalize()
  local L1_3
  L1_3 = _puppet_tbl
  L1_3.pup_crow = nil
end
function crowAlphaOff()
  for _FORV_3_ = 1, 9 do
    _puppet_tbl.pup_crow:setAlpha(1 - _FORV_3_ / 10)
    waitSeconds(0.1)
  end
  _FOR_.pup_crow:setVisible(false)
  _puppet_tbl.pup_crow:setActive(false)
end
function crowAlphaOn()
  _puppet_tbl.pup_crow:setVisible(true)
  _puppet_tbl.pup_crow:setActive(true)
  _puppet_tbl.pup_crow:setAlpha(1)
end
function moveObject(A0_4, A1_5, A2_6)
  return invokeTask(function()
    local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24
    L0_7 = A0_4
    if L0_7 ~= nil then
      L0_7 = A2_6
      if L0_7 ~= nil then
        L0_7 = A2_6
        L0_7 = L0_7 / 30
        L1_8 = A0_4
        L2_9 = L1_8
        L1_8 = L1_8.getWorldTransform
        L2_9 = L1_8(L2_9)
        for L6_13, L7_14 in L3_10(L4_11) do
          L8_15 = findGameObject2
          L9_16 = "Node"
          L10_17 = L7_14
          L8_15 = L8_15(L9_16, L10_17)
          if L8_15 ~= nil then
            L10_17 = L8_15
            L9_16 = L8_15.getWorldTransform
            L10_17 = L9_16(L10_17)
            L11_18 = Fn_get_distance
            L12_19 = L1_8
            L11_18 = L11_18(L12_19, L13_20)
            if L11_18 ~= 0 then
              L12_19 = L11_18 / L0_7
              for L16_23 = 1, L12_19 do
                L17_24 = L16_23 / L12_19
                A0_4:setWorldTransform(LerpVector(L17_24, L1_8, L9_16), SlerpQuat(L17_24, L2_9, L10_17))
                wait()
              end
            end
            L1_8 = L9_16
            L2_9 = L10_17
          end
        end
      end
    end
  end)
end
function isInEyeSight(A0_25, A1_26)
  local L2_27, L3_28, L4_29
  L2_27 = Fn_isInSightTarget
  L3_28 = A0_25
  L4_29 = 1
  L2_27 = L2_27(L3_28, L4_29)
  if L2_27 == true then
    L2_27 = Fn_getDistanceToPlayer
    L3_28 = A0_25
    L2_27 = L2_27(L3_28)
    if A1_26 >= L2_27 then
      L2_27 = Fn_getPlayerWorldTransform
      L3_28 = L2_27()
      L4_29 = L2_27.y
      L4_29 = L4_29 + 1.5
      L2_27.y = L4_29
      L4_29 = Query
      L4_29 = L4_29.setEyeSightTransform
      L4_29(L4_29, L2_27, L3_28)
      L4_29 = Query
      L4_29 = L4_29.setEyeSightAngle
      L4_29(L4_29, Deg2Rad(45))
      L4_29 = Query
      L4_29 = L4_29.setEyeSightRange
      L4_29(L4_29, A1_26)
      L4_29 = A0_25.getWorldPos
      L4_29 = L4_29(A0_25)
      L4_29.y = L4_29.y + 0.5
      return Query:raycastEyeSight(L4_29) == nil
    end
  end
  L2_27 = false
  return L2_27
end
function pccubesensor2_search_crow_01_OnEnter()
  local L0_30, L1_31
  _is_in_sensor = true
end
function pccubesensor2_search_crow_01_OnLeave()
  local L0_32, L1_33
  _is_in_sensor = false
end
function pccubesensor2_search_crow_02_OnEnter()
  local L0_34, L1_35
  _is_in_sensor = true
end
function pccubesensor2_search_crow_02_OnLeave()
  local L0_36, L1_37
  _is_in_sensor = false
end
function pccubesensor2_search_crow_03_OnEnter()
  local L0_38, L1_39
  _is_in_sensor = true
end
function pccubesensor2_search_crow_03_OnLeave()
  local L0_40, L1_41
  _is_in_sensor = false
end
function pccubesensor2_search_crow_04_OnEnter()
  local L0_42, L1_43
  _is_in_sensor = true
end
function pccubesensor2_search_crow_04_OnLeave()
  local L0_44, L1_45
  _is_in_sensor = false
end
function pccubesensor2_search_crow_05_OnEnter()
  local L0_46, L1_47
  _is_in_sensor = true
end
function pccubesensor2_search_crow_05_OnLeave()
  local L0_48, L1_49
  _is_in_sensor = false
end
function pccubesensor2_search_crow_out_01_OnEnter()
  local L0_50, L1_51
end
function pccubesensor2_search_crow_out_01_OnLeave()
  if _is_find_crow == false then
    Fn_captionView("ep07_05013")
  else
    Fn_captionView("ep07_05014")
  end
end
function pccubesensor2_search_crow_out_02_OnEnter()
  local L0_52, L1_53
end
function pccubesensor2_search_crow_out_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function invokeMovePlayerTask(A0_54, A1_55)
  local L2_56, L3_57
  L2_56 = {}
  if A1_55 then
    L3_57 = A1_55.arrivedLength
  else
    L3_57 = L3_57 or 1
  end
  L2_56.arrivedLength = L3_57
  L3_57 = Player
  L3_57 = L3_57.getPuppet
  L3_57 = L3_57(L3_57)
  return RAC_InvokeTaskWithDestractor(function()
    local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64
    for L3_61, L4_62 in L0_58(L1_59) do
      L5_63 = findGameObject2
      L6_64 = "Node"
      L5_63 = L5_63(L6_64, L4_62)
      if L5_63 == nil then
        return
      end
      L6_64 = L5_63.getWorldPos
      L6_64 = L6_64(L5_63)
      while L2_56.arrivedLength < Fn_getDistanceToPlayer(L6_64) do
        wait()
      end
      invokeTask(function()
        while true do
          Fn_playPlayerMotionWait("kit01_run_l_00")
          Fn_playPlayerMotionWait("kit01_run_r_00")
        end
      end):abort()
    end
    if L1_59 == false then
    else
    end
    L1_59(L2_60)
  end, function()
    L3_57:playPoseAnimation("stay")
  end)
end
