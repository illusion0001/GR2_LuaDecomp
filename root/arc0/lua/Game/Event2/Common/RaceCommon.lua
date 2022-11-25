dofile("/Game/Event2/Common/ChallengeCommon.lua")
__cp_table = {}
__cp_pass = false
__arrow_tbl = {}
__arrow_hdl = {}
function _setSensorPos(A0_0, A1_1, A2_2, A3_3)
  local L4_4
  L4_4 = 0
  if A3_3 ~= "air" then
    L4_4 = L4_4 + A1_1.y
  end
  if A2_2 ~= nil then
    L4_4 = L4_4 + A2_2
  end
  A0_0:addBox(A1_1)
  A0_0:setPos(Vector(0, L4_4, 0))
end
function raceVctrlOnLeave(A0_5)
  A0_5:setActive(false)
end
function checkPointSensorOnEnter(A0_6)
  A0_6:setActive(false)
  __cp_pass = true
end
function setRaceArrow(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12
  if L1_8 == nil then
    return
  end
  for L4_11, L5_12 in L1_8(L2_9) do
    if L5_12.start_cp == A0_7 then
      invokeTask(function()
        __arrow_hdl[L4_11] = Fn_createRaceArrow(L5_12.name, L5_12.atr)
        __arrow_hdl[L4_11]:playIn()
      end)
    else
      if L5_12.end_cp == A0_7 and __arrow_hdl[L4_11] ~= nil then
        invokeTask(function()
          __arrow_hdl[L4_11]:playOut()
          repeat
            wait()
          until __arrow_hdl[L4_11]:isOutEnd()
          __arrow_hdl[L4_11]:try_term()
          __arrow_hdl[L4_11] = nil
        end)
      else
      end
    end
  end
end
function Fn_setCheckPointTable(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25
  L2_15 = {}
  L2_15.vctrl_a = nil
  L2_15.vctrl_b = nil
  L2_15.ex_sensor = nil
  L2_15.func = nil
  L2_15.size = nil
  L2_15.ofs_y = nil
  L2_15.marker = nil
  if A1_14 then
    L2_15.vctrl_a = L3_16
    L2_15.vctrl_b = L3_16
    L2_15.ex_sensor = L3_16
    L2_15.func = L3_16
    L2_15.size = L3_16
    L2_15.ofs_y = L3_16
    L2_15.marker = L3_16
  end
  __cp_cnt = 1
  for L6_19, L7_20 in L3_16(L4_17) do
    L8_21 = {}
    L9_22 = L7_20.name
    L8_21.name = L9_22
    L8_21.handle = nil
    L9_22 = {}
    L9_22.vctrl_a = nil
    L9_22.vctrl_b = nil
    L9_22.ex_sensor = nil
    L9_22.size = nil
    L9_22.func = nil
    L9_22.ofs_y = nil
    L9_22.marker = nil
    L8_21.opt = L9_22
    L9_22 = {}
    L9_22.name = nil
    L9_22.handle = nil
    L8_21.sensor = L9_22
    L9_22 = {}
    L9_22.name = nil
    L9_22.handle = nil
    L8_21.cp_icon = L9_22
    L9_22 = {}
    L9_22.name = nil
    L9_22.handle = nil
    L8_21.navi = L9_22
    L9_22 = L7_20.opt
    if L9_22 ~= nil then
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.vctrl_a
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.vctrl_a
      else
        L10_23 = L10_23 or L2_15.vctrl_a
      end
      L9_22.vctrl_a = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.vctrl_b
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.vctrl_b
      else
        L10_23 = L10_23 or L2_15.vctrl_b
      end
      L9_22.vctrl_b = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.ex_sensor
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.ex_sensor
      else
        L10_23 = L10_23 or L2_15.ex_sensor
      end
      L9_22.ex_sensor = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.func
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.func
      else
        L10_23 = L10_23 or L2_15.func
      end
      L9_22.func = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.size
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.size
      else
        L10_23 = L10_23 or L2_15.size
      end
      L9_22.size = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.ofs_y
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.ofs_y
      else
        L10_23 = L10_23 or L2_15.ofs_y
      end
      L9_22.ofs_y = L10_23
      L9_22 = L8_21.opt
      L10_23 = L7_20.opt
      L10_23 = L10_23.marker
      if L10_23 ~= nil then
        L10_23 = L7_20.opt
        L10_23 = L10_23.marker
      else
        L10_23 = L10_23 or L2_15.marker
      end
      L9_22.marker = L10_23
    else
      L8_21.opt = L2_15
    end
    L9_22 = findGameObject2
    L10_23 = "Node"
    L11_24 = L8_21.name
    L9_22 = L9_22(L10_23, L11_24)
    L8_21.handle = L9_22
    L9_22 = string
    L9_22 = L9_22.format
    L10_23 = "%02d"
    L11_24 = L6_19
    L9_22 = L9_22(L10_23, L11_24)
    L10_23 = "checkpoint_"
    L11_24 = L9_22
    L10_23 = L10_23 .. L11_24
    L11_24 = L8_21.cp_icon
    L12_25 = "marker_"
    L12_25 = L12_25 .. L10_23
    L11_24.name = L12_25
    L11_24 = L8_21.cp_icon
    L12_25 = createGameObject2
    L12_25 = L12_25("MapMarker")
    L11_24.handle = L12_25
    L11_24 = "gui_marker_23"
    L12_25 = L8_21.opt
    L12_25 = L12_25.marker
    if L12_25 == "goal" then
      L11_24 = "gui_marker_27"
    else
      L12_25 = L8_21.opt
      L12_25 = L12_25.marker
      if L12_25 == "goal_big" then
        L11_24 = "gui_marker_22"
      else
        L12_25 = L8_21.opt
        L12_25 = L12_25.marker
        if L12_25 == "goal_air" then
          L11_24 = "gui_marker_28"
        else
          L12_25 = L8_21.opt
          L12_25 = L12_25.marker
          if L12_25 == "air" then
            L11_24 = "gui_marker_21"
          end
        end
      end
    end
    L12_25 = L8_21.cp_icon
    L12_25 = L12_25.handle
    L12_25 = L12_25.setAssetName
    L12_25(L12_25, L11_24)
    L12_25 = L8_21.cp_icon
    L12_25 = L12_25.handle
    L12_25 = L12_25.setName
    L12_25(L12_25, L8_21.cp_icon.name)
    L12_25 = L8_21.cp_icon
    L12_25 = L12_25.handle
    L12_25 = L12_25.setupPattern
    L12_25(L12_25, "default")
    if L6_19 == 1 then
      L12_25 = L8_21.cp_icon
      L12_25 = L12_25.handle
      L12_25 = L12_25.setActive
      L12_25(L12_25, true)
    else
      L12_25 = L8_21.cp_icon
      L12_25 = L12_25.handle
      L12_25 = L12_25.setActive
      L12_25(L12_25, false)
    end
    L12_25 = L8_21.handle
    L12_25 = L12_25.appendChild
    L12_25(L12_25, L8_21.cp_icon.handle)
    L12_25 = L8_21.sensor
    L12_25.name = "sensor_" .. L10_23
    L12_25 = L8_21.sensor
    L12_25.handle = createGameObject2("PlayerSensor")
    L12_25 = L8_21.sensor
    L12_25 = L12_25.handle
    L12_25 = L12_25.setName
    L12_25(L12_25, L8_21.sensor.name)
    L12_25 = L8_21.sensor
    L12_25 = L12_25.handle
    L12_25 = L12_25.setDetectBehavior
    L12_25(L12_25, 1)
    L12_25 = L8_21.sensor
    L12_25 = L12_25.handle
    L12_25 = L12_25.setOnEnter
    L12_25(L12_25, "checkPointSensorOnEnter")
    L12_25 = L8_21.sensor
    L12_25 = L12_25.handle
    L12_25 = L12_25.setActive
    L12_25(L12_25, false)
    L12_25 = L8_21.handle
    L12_25 = L12_25.appendChild
    L12_25(L12_25, L8_21.sensor.handle)
    L12_25 = L8_21.opt
    L12_25 = L12_25.size
    if L12_25 ~= nil then
      L12_25 = L8_21.opt
      L12_25 = L12_25.size
    elseif not L12_25 then
      L12_25 = Vector
      L12_25 = L12_25(2, 1.5, 2)
    end
    _setSensorPos(L8_21.sensor.handle, L12_25, L8_21.opt.ofs_y, L8_21.opt.marker)
    L8_21.navi.name = "navi_" .. L9_22
    L8_21.navi.handle = createGameObject2("Node")
    L8_21.navi.handle:setName(L8_21.navi.name)
    L8_21.handle:appendChild(L8_21.navi.handle)
    if L8_21.opt.vctrl_a ~= nil then
      Fn_vctrlOff(L8_21.opt.vctrl_a)
    end
    if L8_21.opt.vctrl_b ~= nil then
      Fn_vctrlOff(L8_21.opt.vctrl_b)
    end
    if L8_21.opt.ex_sensor ~= nil then
      Fn_pcSensorOff(L8_21.opt.ex_sensor)
    end
    __cp_table[L6_19] = L8_21
  end
end
function Fn_runCheckPoint()
  local L0_26, L1_27, L2_28, L3_29, L4_30
  L0_26(L1_27)
  for L3_29, L4_30 in L0_26(L1_27) do
    Fn_naviSet(L4_30.navi.handle)
    L4_30.cp_icon.handle:setActive(true)
    if L4_30.opt.ex_sensor ~= nil then
      Fn_pcSensorOn(L4_30.opt.ex_sensor)
    else
      L4_30.sensor.handle:setActive(true)
    end
    if L4_30.opt.vctrl_a ~= nil then
      Fn_vctrlOn(L4_30.opt.vctrl_a)
    end
    while not __cp_pass do
      wait()
    end
    setRaceArrow(L3_29)
    Sound:pulse("success")
    __cp_pass = false
    if L4_30.opt.func ~= nil then
      L4_30.opt.func()
    end
    Fn_setCatWarpCheckPoint(L4_30.name)
    invokeTask(function()
      L4_30.cp_icon.handle:playOut()
      repeat
        wait()
      until L4_30.cp_icon.handle:isOutEnd()
      L4_30.cp_icon.handle:setActive(false)
    end)
    if L4_30.opt.vctrl_a ~= nil then
      Fn_vctrlOff(L4_30.opt.vctrl_a)
    end
    if L4_30.opt.vctrl_b ~= nil then
      Fn_vctrlOn(L4_30.opt.vctrl_b)
    end
    HUD:counter99_99AddNum()
    break
  end
  L0_26()
end
function Fn_getCheckPointCount()
  return HUD:counter99_99GetNum()
end
function Fn_endCheckPoint()
  print("Fn_endCheckPoint\227\129\175\229\187\131\230\173\162\227\129\151\227\129\190\227\129\151\227\129\159")
end
function Fn_setArrowTable(A0_31)
  local L1_32
  __arrow_tbl = A0_31
end
