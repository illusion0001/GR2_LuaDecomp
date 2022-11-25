dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
_crow_puppet = nil
switch = {}
mnavi_hdl = {}
hole_hdl = {}
hole_node = {}
hole_cnt = 4
wind_obj = {}
wind_hdl = {}
wind_se = {}
windyeff_hdl = {}
crow_vel = 25
crow_vel_al = 6.6
moco_area = {}
moco_loc = {}
moco = {}
_talk_on = false
kitun_goal = false
crow_change = false
crow_change2 = false
_crow_stop = false
_crow_goal = false
cap_flg = false
end_flg = false
release_cnt = 0
crow_sel = false
_wall_damage = 0
sdemo = nil
sdemo_2nd = nil
navi_cap = false
navi_cap2 = false
ep21_floting_table = {
  zenhan = {
    {
      name = "co_a_04_11",
      Node = "locator2_04_end_11",
      bool = false
    },
    {
      name = "co_a_04_12",
      Node = "locator2_04_end_12",
      bool = false
    },
    {
      name = "co_a_04_16",
      Node = "locator2_04_end_16",
      bool = false
    },
    {
      name = "co_a_04_17",
      Node = "locator2_04_end_17",
      bool = false
    },
    {
      name = "co_a_04_18",
      Node = "locator2_04_end_18",
      bool = false
    },
    {
      name = "co_a_04_19",
      Node = "locator2_04_end_19",
      bool = false
    },
    {
      name = "co_a_04_20",
      Node = "locator2_04_end_20",
      bool = false
    },
    {
      name = "co_a_04_21",
      Node = "locator2_04_end_21",
      bool = false
    },
    {
      name = "co_a_04_22",
      Node = "locator2_04_end_22",
      bool = false
    },
    {
      name = "co_a_04_23",
      Node = "locator2_04_end_23",
      bool = false
    },
    {
      name = "co_a_04_24",
      Node = "locator2_04_end_24",
      bool = false
    },
    {
      name = "co_a_05_06",
      Node = "locator2_05_end_06",
      bool = false
    },
    {
      name = "co_a_05_07",
      Node = "locator2_05_end_07",
      bool = false
    },
    {
      name = "co_a_05_08",
      Node = "locator2_05_end_08",
      bool = false
    },
    {
      name = "co_a_05_10",
      Node = "locator2_05_end_10",
      bool = false
    },
    {
      name = "co_a_05_15",
      Node = "locator2_05_end_15",
      bool = false
    },
    {
      name = "co_a_05_17",
      Node = "locator2_05_end_17",
      bool = false
    },
    {
      name = "co_a_05_21",
      Node = "locator2_05_end_21",
      bool = false
    },
    {
      name = "co_a_05_22",
      Node = "locator2_05_end_22",
      bool = false
    },
    {
      name = "co_a_05_23",
      Node = "locator2_05_end_23",
      bool = false
    },
    {
      name = "co_a_05_24",
      Node = "locator2_05_end_24",
      bool = false
    },
    {
      name = "co_a_05_25",
      Node = "locator2_05_end_25",
      bool = false
    },
    {
      name = "co_a_05_26",
      Node = "locator2_05_end_26",
      bool = false
    },
    {
      name = "co_a_05_27",
      Node = "locator2_05_end_27",
      bool = false
    },
    {
      name = "co_a_05_28",
      Node = "locator2_05_end_28",
      bool = false
    },
    {
      name = "co_a_06_01",
      Node = "locator2_06_end_01",
      bool = false
    },
    {
      name = "co_a_06_02",
      Node = "locator2_06_end_02",
      bool = false
    },
    {
      name = "co_a_06_03",
      Node = "locator2_06_end_03",
      bool = false
    },
    {
      name = "co_a_06_07",
      Node = "locator2_06_end_07",
      bool = false
    },
    {
      name = "co_a_06_08",
      Node = "locator2_06_end_08",
      bool = false
    },
    {
      name = "co_a_06_09",
      Node = "locator2_06_end_09",
      bool = false
    },
    {
      name = "co_a_06_20",
      Node = "locator2_06_end_20",
      bool = false
    },
    {
      name = "co_a_06_21",
      Node = "locator2_06_end_21",
      bool = false
    },
    {
      name = "co_a_06_22",
      Node = "locator2_06_end_22",
      bool = false
    },
    {
      name = "co_a_06_23",
      Node = "locator2_06_end_23",
      bool = false
    },
    {
      name = "co_a_06_24",
      Node = "locator2_06_end_24",
      bool = false
    },
    {
      name = "co_a_06_25",
      Node = "locator2_06_end_25",
      bool = false
    },
    {
      name = "co_a_06_26",
      Node = "locator2_06_end_26",
      bool = false
    },
    {
      name = "co_a_06_27",
      Node = "locator2_06_end_27",
      bool = false
    },
    {
      name = "co_a_06_28",
      Node = "locator2_06_end_28",
      bool = false
    },
    {
      name = "co_a_06_29",
      Node = "locator2_06_end_29",
      bool = false
    }
  },
  kouhan = {
    {
      name = "co_a_04_01",
      Node = "locator2_04_end_01",
      bool = false
    },
    {
      name = "co_a_04_02",
      Node = "locator2_04_end_02",
      bool = false
    },
    {
      name = "co_a_04_03",
      Node = "locator2_04_end_03",
      bool = false
    },
    {
      name = "co_a_04_04",
      Node = "locator2_04_end_04",
      bool = false
    },
    {
      name = "co_a_04_05",
      Node = "locator2_04_end_05",
      bool = false
    },
    {
      name = "co_a_04_06",
      Node = "locator2_04_end_06",
      bool = false
    },
    {
      name = "co_a_04_07",
      Node = "locator2_04_end_07",
      bool = false
    },
    {
      name = "co_a_04_08",
      Node = "locator2_04_end_08",
      bool = false
    },
    {
      name = "co_a_04_09",
      Node = "locator2_04_end_09",
      bool = false
    },
    {
      name = "co_a_04_10",
      Node = "locator2_04_end_10",
      bool = false
    },
    {
      name = "co_a_04_13",
      Node = "locator2_04_end_13",
      bool = false
    },
    {
      name = "co_a_04_14",
      Node = "locator2_04_end_14",
      bool = false
    },
    {
      name = "co_a_04_15",
      Node = "locator2_04_end_15",
      bool = false
    },
    {
      name = "co_a_04_25",
      Node = "locator2_04_end_25",
      bool = false
    },
    {
      name = "co_a_04_26",
      Node = "locator2_04_end_26",
      bool = false
    },
    {
      name = "co_a_05_01",
      Node = "locator2_05_end_01",
      bool = false
    },
    {
      name = "co_a_05_02",
      Node = "locator2_05_end_02",
      bool = false
    },
    {
      name = "co_a_05_03",
      Node = "locator2_05_end_03",
      bool = false
    },
    {
      name = "co_a_05_04",
      Node = "locator2_05_end_04",
      bool = false
    },
    {
      name = "co_a_05_05",
      Node = "locator2_05_end_05",
      bool = false
    },
    {
      name = "co_a_05_09",
      Node = "locator2_05_end_09",
      bool = false
    },
    {
      name = "co_a_05_11",
      Node = "locator2_05_end_11",
      bool = false
    },
    {
      name = "co_a_05_12",
      Node = "locator2_05_end_12",
      bool = false
    },
    {
      name = "co_a_05_13",
      Node = "locator2_05_end_13",
      bool = false
    },
    {
      name = "co_a_05_14",
      Node = "locator2_05_end_14",
      bool = false
    },
    {
      name = "co_a_05_16",
      Node = "locator2_05_end_16",
      bool = false
    },
    {
      name = "co_a_05_18",
      Node = "locator2_05_end_18",
      bool = false
    },
    {
      name = "co_a_05_19",
      Node = "locator2_05_end_19",
      bool = false
    },
    {
      name = "co_a_05_20",
      Node = "locator2_05_end_20",
      bool = false
    },
    {
      name = "co_a_06_04",
      Node = "locator2_06_end_04",
      bool = false
    },
    {
      name = "co_a_06_05",
      Node = "locator2_06_end_05",
      bool = false
    },
    {
      name = "co_a_06_06",
      Node = "locator2_06_end_06",
      bool = false
    },
    {
      name = "co_a_06_10",
      Node = "locator2_06_end_10",
      bool = false
    },
    {
      name = "co_a_06_11",
      Node = "locator2_06_end_11",
      bool = false
    },
    {
      name = "co_a_06_12",
      Node = "locator2_06_end_12",
      bool = false
    },
    {
      name = "co_a_06_13",
      Node = "locator2_06_end_13",
      bool = false
    },
    {
      name = "co_a_06_14",
      Node = "locator2_06_end_14",
      bool = false
    },
    {
      name = "co_a_06_15",
      Node = "locator2_06_end_15",
      bool = false
    },
    {
      name = "co_a_06_16",
      Node = "locator2_06_end_16",
      bool = false
    },
    {
      name = "co_a_06_17",
      Node = "locator2_06_end_17",
      bool = false
    },
    {
      name = "co_a_06_18",
      Node = "locator2_06_end_18",
      bool = false
    },
    {
      name = "co_a_06_19",
      Node = "locator2_06_end_19",
      bool = false
    }
  }
}
_area_ctrls = {}
function Initialize()
  sdemo = SDemo.create("ep21_a")
  sdemo_2nd = SDemo.create("ep21_a_2nd")
  Fn_pcSensorOff("pccubesensor2_reset_00")
  Fn_pcSensorOff("pccubesensor2_reset_01")
  findGameObject2("Sensor", "cubesensor2_02"):setActive(false)
  findGameObject2("Sensor", "cubesensor2_03"):setActive(false)
  for _FORV_3_, _FORV_4_ in ipairs(ep21_floting_table.zenhan) do
    _area_ctrls[_FORV_4_.name] = AreaController.create(_FORV_4_.name)
    _area_ctrls[_FORV_4_.name]:setMoveParam({velocity = 5})
    _area_ctrls[_FORV_4_.name].handle:setExpandedAabb(true)
  end
  for _FORV_3_, _FORV_4_ in ipairs(ep21_floting_table.kouhan) do
    _area_ctrls[_FORV_4_.name] = AreaController.create(_FORV_4_.name)
    _area_ctrls[_FORV_4_.name]:setMoveParam({velocity = 5})
    _area_ctrls[_FORV_4_.name].handle:setExpandedAabb(true)
  end
  navi_goal = findGameObject2("Node", "pccubesensor2_goal_01")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28
  L0_0 = Fn_loadEventData
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_getPlayer
  L0_0 = L0_0()
  while true do
    while true do
      if L1_1 == nil then
        _crow_puppet = L1_1
        L1_1()
      end
    end
  end
  while true do
    while true do
      if L1_1 == nil then
        _brain_crow = L1_1
        L1_1()
      end
    end
  end
  while true do
    if not L1_1 then
      L1_1()
    end
  end
  co_a_01_hdl = L1_1
  for L4_4 = 1, 14 do
    L6_6 = L5_5
    L7_7 = findGameObject2
    L8_8 = "Node"
    L9_9 = "locator2_holetop_"
    L10_10 = string
    L10_10 = L10_10.format
    L11_11 = "%02d"
    L10_10 = L10_10(L11_11, L12_12)
    L9_9 = L9_9 .. L10_10
    L7_7 = L7_7(L8_8, L9_9)
    L8_8 = true
    L5_5(L6_6, L7_7, L8_8)
  end
  for L6_6 = 1, 34 do
    L7_7 = moco_area
    L9_9 = L2_2
    L8_8 = L2_2.findSubArea
    L10_10 = "co_a_05_"
    L11_11 = string
    L11_11 = L11_11.format
    L11_11 = L11_11(L12_12, L13_13)
    L10_10 = L10_10 .. L11_11
    L8_8 = L8_8(L9_9, L10_10)
    L7_7[L6_6] = L8_8
    L7_7 = Vector
    L8_8 = 0
    L9_9 = 0
    L10_10 = 0
    L7_7 = L7_7(L8_8, L9_9, L10_10)
    L8_8 = moco_area
    L8_8 = L8_8[L6_6]
    L9_9 = L8_8
    L8_8 = L8_8.getWorldRot
    L8_8 = L8_8(L9_9)
    L9_9 = L7_7.x
    L9_9 = L9_9 + 0.2
    L7_7.x = L9_9
    L9_9 = L7_7.y
    L9_9 = L9_9 - 0.35
    L7_7.y = L9_9
    L9_9 = L7_7.z
    L9_9 = L9_9 - 1.18
    L7_7.z = L9_9
    L9_9 = L8_8.y
    L9_9 = L9_9 - 0.8
    L8_8.y = L9_9
    L9_9 = moco_loc
    L10_10 = createGameObject2
    L11_11 = "Node"
    L10_10 = L10_10(L11_11)
    L9_9[L6_6] = L10_10
    L9_9 = moco_loc
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.setName
    L11_11 = "locater2_moco_"
    L11_11 = L11_11 .. L12_12
    L9_9(L10_10, L11_11)
    L9_9 = moco_loc
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.try_init
    L9_9(L10_10)
    L9_9 = moco_loc
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.waitForReady
    L9_9(L10_10)
    L9_9 = moco_loc
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.try_start
    L9_9(L10_10)
    L9_9 = moco_loc
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.setWorldTransform
    L11_11 = L7_7
    L9_9(L10_10, L11_11, L12_12)
    L9_9 = moco
    L10_10 = Fn_createGimmickBg
    L11_11 = "locater2_moco_"
    L11_11 = L11_11 .. L12_12
    L15_15 = L6_6
    L10_10 = L10_10(L11_11, L12_12, L13_13, L14_14)
    L9_9[L6_6] = L10_10
    L9_9 = moco_area
    L9_9 = L9_9[L6_6]
    L10_10 = L9_9
    L9_9 = L9_9.appendChild
    L11_11 = moco
    L11_11 = L11_11[L6_6]
    L9_9 = L9_9(L10_10, L11_11)
    L10_10 = print
    L11_11 = L9_9
    L10_10(L11_11)
  end
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3()
  L3_3()
  L3_3(L4_4, L5_5)
  L4_4(L5_5)
  L4_4()
  L4_4()
  L6_6 = 25
  L4_4(L5_5, L6_6)
  L6_6 = 0
  L4_4(L5_5, L6_6)
  L6_6 = "pc1_076"
  L7_7 = 1
  L8_8 = ""
  L9_9 = L0_0
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9)
  L4_4(L5_5)
  if not L4_4 then
    L6_6 = L5_5
    L6_6 = Vector
    L7_7 = 0
    L8_8 = -5
    L9_9 = 0
    L6_6 = L6_6(L7_7, L8_8, L9_9)
    L6_6 = L5_5 - L6_6
    L7_7 = {
      L8_8,
      L9_9,
      L10_10
    }
    L8_8 = {}
    L8_8.pos = L5_5
    L9_9 = Supporter
    L9_9 = L9_9.MovePoint
    L9_9 = L9_9.Takeoff
    L8_8.action = L9_9
    L9_9 = crow_vel
    L8_8.vel = L9_9
    L9_9 = {}
    L9_9.pos = L5_5
    L10_10 = Supporter
    L10_10 = L10_10.MovePoint
    L10_10 = L10_10.Air
    L9_9.action = L10_10
    L10_10 = crow_vel
    L9_9.vel = L10_10
    L10_10 = {}
    L10_10.pos = L5_5
    L11_11 = Supporter
    L11_11 = L11_11.MovePoint
    L11_11 = L11_11.Air
    L10_10.action = L11_11
    L11_11 = crow_vel
    L10_10.vel = L11_11
    L8_8 = _brain_crow
    L9_9 = L8_8
    L8_8 = L8_8.setMovePoints
    L10_10 = L7_7
    L8_8(L9_9, L10_10)
    L8_8 = _brain_crow
    L9_9 = L8_8
    L8_8 = L8_8.startMovePoint
    L8_8(L9_9)
  end
  repeat
    L5_5()
    L6_6 = L5_5
  until L5_5
  L6_6 = L5_5
  L5_5(L6_6)
  L6_6 = L5_5
  L6_6 = {
    L7_7,
    L8_8,
    L9_9
  }
  L7_7 = {}
  L7_7.pos = L5_5
  L8_8 = Supporter
  L8_8 = L8_8.MovePoint
  L8_8 = L8_8.Air
  L7_7.action = L8_8
  L8_8 = crow_vel
  L7_7.vel = L8_8
  L8_8 = {}
  L9_9 = findGameObject2
  L10_10 = "Node"
  L11_11 = "locator2_crow_01"
  L9_9 = L9_9(L10_10, L11_11)
  L8_8.node = L9_9
  L9_9 = Supporter
  L9_9 = L9_9.MovePoint
  L9_9 = L9_9.Air
  L8_8.action = L9_9
  L9_9 = crow_vel
  L8_8.vel = L9_9
  L9_9 = {}
  L10_10 = findGameObject2
  L11_11 = "Node"
  L10_10 = L10_10(L11_11, L12_12)
  L9_9.node = L10_10
  L10_10 = Supporter
  L10_10 = L10_10.MovePoint
  L10_10 = L10_10.Alight
  L9_9.action = L10_10
  L10_10 = crow_vel_al
  L9_9.vel = L10_10
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.setMovePoints
  L9_9 = L6_6
  L7_7(L8_8, L9_9)
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.startMovePoint
  L7_7(L8_8)
  L7_7 = waitSeconds
  L8_8 = 3
  L7_7(L8_8)
  repeat
    L7_7 = wait
    L7_7()
    L7_7 = _brain_crow
    L8_8 = L7_7
    L7_7 = L7_7.isMovePointEnd
    L7_7 = L7_7(L8_8)
  until L7_7
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.clearMovePoint
  L7_7(L8_8)
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.setIdling
  L9_9 = true
  L7_7(L8_8, L9_9)
  L7_7 = Sound
  L8_8 = L7_7
  L7_7 = L7_7.playSE
  L9_9 = "cro010b"
  L10_10 = 1
  L11_11 = ""
  L7_7(L8_8, L9_9, L10_10, L11_11, L12_12)
  L7_7 = Fn_captionViewWait
  L8_8 = "ep21_00102"
  L7_7(L8_8)
  L7_7 = Sound
  L8_8 = L7_7
  L7_7 = L7_7.playSE
  L9_9 = "kit031b_1"
  L10_10 = 1
  L11_11 = ""
  L7_7(L8_8, L9_9, L10_10, L11_11, L12_12)
  L7_7 = Fn_captionViewWait
  L8_8 = "ep21_00103"
  L7_7(L8_8)
  L7_7 = waitSeconds
  L8_8 = 0.5
  L7_7(L8_8)
  L7_7 = HUD
  L8_8 = L7_7
  L7_7 = L7_7.info
  L9_9 = "ep21_info_01"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L7_7 = findGameObject2
  L8_8 = "Node"
  L9_9 = "pccubesensor2_flystone_01"
  L7_7 = L7_7(L8_8, L9_9)
  L8_8 = Fn_naviSet
  L9_9 = L7_7
  L8_8(L9_9)
  L8_8 = _brain_crow
  L9_9 = L8_8
  L8_8 = L8_8.isAir
  L8_8 = L8_8(L9_9)
  if L8_8 == false then
    L9_9 = _crow_puppet
    L10_10 = L9_9
    L9_9 = L9_9.getWorldPos
    L9_9 = L9_9(L10_10)
    L10_10 = Vector
    L11_11 = 0
    L10_10 = L10_10(L11_11, L12_12, L13_13)
    L10_10 = L9_9 - L10_10
    L11_11 = {
      L12_12,
      L13_13,
      L14_14
    }
    L12_12.pos = L9_9
    L12_12.action = L13_13
    L12_12.vel = L13_13
    L13_13.pos = L9_9
    L13_13.action = L14_14
    L13_13.vel = L14_14
    L14_14.pos = L10_10
    L15_15 = Supporter
    L15_15 = L15_15.MovePoint
    L15_15 = L15_15.Air
    L14_14.action = L15_15
    L15_15 = crow_vel
    L14_14.vel = L15_15
    L12_12(L13_13, L14_14)
    L12_12(L13_13)
  end
  repeat
    L9_9 = wait
    L9_9()
    L9_9 = _brain_crow
    L10_10 = L9_9
    L9_9 = L9_9.isMovePointEnd
    L9_9 = L9_9(L10_10)
  until L9_9
  L9_9 = _brain_crow
  L10_10 = L9_9
  L9_9 = L9_9.clearMovePoint
  L9_9(L10_10)
  L9_9 = print
  L10_10 = "setup_end"
  L9_9(L10_10)
  L9_9 = _crow_puppet
  L10_10 = L9_9
  L9_9 = L9_9.getWorldPos
  L9_9 = L9_9(L10_10)
  L10_10 = {
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    L25_25,
    L26_26,
    L27_27,
    L28_28,
    {
      node = findGameObject2("Node", "locator2_crow_12a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_12"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_12"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_12g"),
      action = Supporter.MovePoint.Idle,
      duration = 2
    },
    {
      node = findGameObject2("Node", "locator2_crow_12g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_12g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_14a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_14"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_14"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_14g"),
      action = Supporter.MovePoint.Idle,
      duration = 3
    },
    {
      node = findGameObject2("Node", "locator2_crow_14g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_14g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_16a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_16"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_16"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_08"),
      action = Supporter.MovePoint.Idle,
      duration = 4
    },
    {
      node = findGameObject2("Node", "locator2_crow_16g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_16g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_18a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_18"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_18"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_18g"),
      action = Supporter.MovePoint.Idle,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_18g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_18g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_22a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_22"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_22"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_22g"),
      action = Supporter.MovePoint.Idle,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_22g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_22g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_24a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_24"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    L25_25,
    L26_26,
    L27_27,
    L28_28,
    {
      node = findGameObject2("Node", "locator2_crow_34"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_34g"),
      action = Supporter.MovePoint.Idle,
      duration = 6
    },
    {
      node = findGameObject2("Node", "locator2_crow_34g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_34g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_36a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_36"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_36"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_36g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_36g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_38a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_38"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_38"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_38g"),
      action = Supporter.MovePoint.Idle,
      duration = 4
    },
    {
      node = findGameObject2("Node", "locator2_crow_38g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_38g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_39a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_39"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_39"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_39g"),
      action = Supporter.MovePoint.Idle,
      duration = 3
    },
    {
      node = findGameObject2("Node", "locator2_crow_39g"),
      action = Supporter.MovePoint.Takeoff,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_39g"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_40a"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_40"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_40"),
      action = Supporter.MovePoint.Alight,
      vel = crow_vel_al
    },
    {
      node = findGameObject2("Node", "locator2_crow_40g"),
      action = Supporter.MovePoint.Idle,
      duration = 6
    }
  }
  L11_11 = {}
  L11_11.pos = L9_9
  L11_11.action = L12_12
  L11_11.vel = L12_12
  L15_15 = "locator2_crow_03"
  L12_12.node = L13_13
  L12_12.action = L13_13
  L12_12.vel = L13_13
  L15_15 = "Node"
  L16_16 = "locator2_crow_03"
  L13_13.node = L14_14
  L13_13.action = L14_14
  L13_13.vel = L14_14
  L15_15 = findGameObject2
  L16_16 = "Node"
  L17_17 = "locator2_crow_03g"
  L15_15 = L15_15(L16_16, L17_17)
  L14_14.node = L15_15
  L15_15 = Supporter
  L15_15 = L15_15.MovePoint
  L15_15 = L15_15.Takeoff
  L14_14.action = L15_15
  L15_15 = crow_vel
  L14_14.vel = L15_15
  L15_15 = {}
  L16_16 = findGameObject2
  L17_17 = "Node"
  L18_18 = "locator2_crow_03g"
  L16_16 = L16_16(L17_17, L18_18)
  L15_15.node = L16_16
  L16_16 = Supporter
  L16_16 = L16_16.MovePoint
  L16_16 = L16_16.Air
  L15_15.action = L16_16
  L16_16 = crow_vel
  L15_15.vel = L16_16
  L16_16 = {}
  L17_17 = findGameObject2
  L18_18 = "Node"
  L19_19 = "locator2_crow_04a"
  L17_17 = L17_17(L18_18, L19_19)
  L16_16.node = L17_17
  L17_17 = Supporter
  L17_17 = L17_17.MovePoint
  L17_17 = L17_17.Air
  L16_16.action = L17_17
  L17_17 = crow_vel
  L16_16.vel = L17_17
  L17_17 = {}
  L18_18 = findGameObject2
  L19_19 = "Node"
  L20_20 = "locator2_crow_04"
  L18_18 = L18_18(L19_19, L20_20)
  L17_17.node = L18_18
  L18_18 = Supporter
  L18_18 = L18_18.MovePoint
  L18_18 = L18_18.Air
  L17_17.action = L18_18
  L18_18 = crow_vel
  L17_17.vel = L18_18
  L18_18 = {}
  L19_19 = findGameObject2
  L20_20 = "Node"
  L21_21 = "locator2_crow_04"
  L19_19 = L19_19(L20_20, L21_21)
  L18_18.node = L19_19
  L19_19 = Supporter
  L19_19 = L19_19.MovePoint
  L19_19 = L19_19.Alight
  L18_18.action = L19_19
  L19_19 = crow_vel_al
  L18_18.vel = L19_19
  L19_19 = {}
  L20_20 = findGameObject2
  L21_21 = "Node"
  L22_22 = "locator2_crow_04g"
  L20_20 = L20_20(L21_21, L22_22)
  L19_19.node = L20_20
  L20_20 = Supporter
  L20_20 = L20_20.MovePoint
  L20_20 = L20_20.Ground
  L19_19.action = L20_20
  L20_20 = crow_vel
  L19_19.vel = L20_20
  L20_20 = {}
  L21_21 = findGameObject2
  L22_22 = "Node"
  L23_23 = "locator2_crow_07g"
  L21_21 = L21_21(L22_22, L23_23)
  L20_20.node = L21_21
  L21_21 = Supporter
  L21_21 = L21_21.MovePoint
  L21_21 = L21_21.Ground
  L20_20.action = L21_21
  L21_21 = crow_vel
  L20_20.vel = L21_21
  L21_21 = {}
  L22_22 = findGameObject2
  L23_23 = "Node"
  L24_24 = "locator2_crow_07g"
  L22_22 = L22_22(L23_23, L24_24)
  L21_21.node = L22_22
  L22_22 = Supporter
  L22_22 = L22_22.MovePoint
  L22_22 = L22_22.Takeoff
  L21_21.action = L22_22
  L22_22 = crow_vel
  L21_21.vel = L22_22
  L22_22 = {}
  L23_23 = findGameObject2
  L24_24 = "Node"
  L25_25 = "locator2_crow_07g"
  L23_23 = L23_23(L24_24, L25_25)
  L22_22.node = L23_23
  L23_23 = Supporter
  L23_23 = L23_23.MovePoint
  L23_23 = L23_23.Air
  L22_22.action = L23_23
  L23_23 = crow_vel
  L22_22.vel = L23_23
  L23_23 = {}
  L24_24 = findGameObject2
  L25_25 = "Node"
  L26_26 = "locator2_crow_08a"
  L24_24 = L24_24(L25_25, L26_26)
  L23_23.node = L24_24
  L24_24 = Supporter
  L24_24 = L24_24.MovePoint
  L24_24 = L24_24.Air
  L23_23.action = L24_24
  L24_24 = crow_vel
  L23_23.vel = L24_24
  L24_24 = {}
  L25_25 = findGameObject2
  L26_26 = "Node"
  L27_27 = "locator2_crow_08"
  L25_25 = L25_25(L26_26, L27_27)
  L24_24.node = L25_25
  L25_25 = Supporter
  L25_25 = L25_25.MovePoint
  L25_25 = L25_25.Air
  L24_24.action = L25_25
  L25_25 = crow_vel
  L24_24.vel = L25_25
  L25_25 = {}
  L26_26 = findGameObject2
  L27_27 = "Node"
  L28_28 = "locator2_crow_08"
  L26_26 = L26_26(L27_27, L28_28)
  L25_25.node = L26_26
  L26_26 = Supporter
  L26_26 = L26_26.MovePoint
  L26_26 = L26_26.Alight
  L25_25.action = L26_26
  L26_26 = crow_vel_al
  L25_25.vel = L26_26
  L26_26 = {}
  L27_27 = findGameObject2
  L28_28 = "Node"
  L27_27 = L27_27(L28_28, "locator2_crow_08")
  L26_26.node = L27_27
  L27_27 = Supporter
  L27_27 = L27_27.MovePoint
  L27_27 = L27_27.Idle
  L26_26.action = L27_27
  L26_26.duration = 2
  L27_27 = {}
  L28_28 = findGameObject2
  L28_28 = L28_28("Node", "locator2_crow_08g")
  L27_27.node = L28_28
  L28_28 = Supporter
  L28_28 = L28_28.MovePoint
  L28_28 = L28_28.Takeoff
  L27_27.action = L28_28
  L28_28 = crow_vel
  L27_27.vel = L28_28
  L28_28 = {}
  L28_28.node = findGameObject2("Node", "locator2_crow_08g")
  L28_28.action = Supporter.MovePoint.Air
  L28_28.vel = crow_vel
  L11_11 = {}
  L11_11.node = L12_12
  L11_11.action = L12_12
  L11_11.vel = L12_12
  L15_15 = "locator2_crow_24g"
  L12_12.node = L13_13
  L12_12.action = L13_13
  L12_12.duration = 6
  L15_15 = "Node"
  L16_16 = "locator2_crow_24g"
  L13_13.node = L14_14
  L13_13.action = L14_14
  L13_13.vel = L14_14
  L15_15 = findGameObject2
  L16_16 = "Node"
  L17_17 = "locator2_crow_24g"
  L15_15 = L15_15(L16_16, L17_17)
  L14_14.node = L15_15
  L15_15 = Supporter
  L15_15 = L15_15.MovePoint
  L15_15 = L15_15.Air
  L14_14.action = L15_15
  L15_15 = crow_vel
  L14_14.vel = L15_15
  L15_15 = {}
  L16_16 = findGameObject2
  L17_17 = "Node"
  L18_18 = "locator2_crow_26a"
  L16_16 = L16_16(L17_17, L18_18)
  L15_15.node = L16_16
  L16_16 = Supporter
  L16_16 = L16_16.MovePoint
  L16_16 = L16_16.Air
  L15_15.action = L16_16
  L16_16 = crow_vel
  L15_15.vel = L16_16
  L16_16 = {}
  L17_17 = findGameObject2
  L18_18 = "Node"
  L19_19 = "locator2_crow_26"
  L17_17 = L17_17(L18_18, L19_19)
  L16_16.node = L17_17
  L17_17 = Supporter
  L17_17 = L17_17.MovePoint
  L17_17 = L17_17.Air
  L16_16.action = L17_17
  L17_17 = crow_vel
  L16_16.vel = L17_17
  L17_17 = {}
  L18_18 = findGameObject2
  L19_19 = "Node"
  L20_20 = "locator2_crow_26"
  L18_18 = L18_18(L19_19, L20_20)
  L17_17.node = L18_18
  L18_18 = Supporter
  L18_18 = L18_18.MovePoint
  L18_18 = L18_18.Alight
  L17_17.action = L18_18
  L18_18 = crow_vel_al
  L17_17.vel = L18_18
  L18_18 = {}
  L19_19 = findGameObject2
  L20_20 = "Node"
  L21_21 = "locator2_crow_26g"
  L19_19 = L19_19(L20_20, L21_21)
  L18_18.node = L19_19
  L19_19 = Supporter
  L19_19 = L19_19.MovePoint
  L19_19 = L19_19.Idle
  L18_18.action = L19_19
  L18_18.duration = 2
  L19_19 = {}
  L20_20 = findGameObject2
  L21_21 = "Node"
  L22_22 = "locator2_crow_26g"
  L20_20 = L20_20(L21_21, L22_22)
  L19_19.node = L20_20
  L20_20 = Supporter
  L20_20 = L20_20.MovePoint
  L20_20 = L20_20.Takeoff
  L19_19.action = L20_20
  L20_20 = crow_vel
  L19_19.vel = L20_20
  L20_20 = {}
  L21_21 = findGameObject2
  L22_22 = "Node"
  L23_23 = "locator2_crow_26g"
  L21_21 = L21_21(L22_22, L23_23)
  L20_20.node = L21_21
  L21_21 = Supporter
  L21_21 = L21_21.MovePoint
  L21_21 = L21_21.Air
  L20_20.action = L21_21
  L21_21 = crow_vel
  L20_20.vel = L21_21
  L21_21 = {}
  L22_22 = findGameObject2
  L23_23 = "Node"
  L24_24 = "locator2_crow_30a"
  L22_22 = L22_22(L23_23, L24_24)
  L21_21.node = L22_22
  L22_22 = Supporter
  L22_22 = L22_22.MovePoint
  L22_22 = L22_22.Air
  L21_21.action = L22_22
  L22_22 = crow_vel
  L21_21.vel = L22_22
  L22_22 = {}
  L23_23 = findGameObject2
  L24_24 = "Node"
  L25_25 = "locator2_crow_30"
  L23_23 = L23_23(L24_24, L25_25)
  L22_22.node = L23_23
  L23_23 = Supporter
  L23_23 = L23_23.MovePoint
  L23_23 = L23_23.Air
  L22_22.action = L23_23
  L23_23 = crow_vel
  L22_22.vel = L23_23
  L23_23 = {}
  L24_24 = findGameObject2
  L25_25 = "Node"
  L26_26 = "locator2_crow_30"
  L24_24 = L24_24(L25_25, L26_26)
  L23_23.node = L24_24
  L24_24 = Supporter
  L24_24 = L24_24.MovePoint
  L24_24 = L24_24.Alight
  L23_23.action = L24_24
  L24_24 = crow_vel_al
  L23_23.vel = L24_24
  L24_24 = {}
  L25_25 = findGameObject2
  L26_26 = "Node"
  L27_27 = "locator2_crow_30g"
  L25_25 = L25_25(L26_26, L27_27)
  L24_24.node = L25_25
  L25_25 = Supporter
  L25_25 = L25_25.MovePoint
  L25_25 = L25_25.Idle
  L24_24.action = L25_25
  L24_24.duration = 4
  L25_25 = {}
  L26_26 = findGameObject2
  L27_27 = "Node"
  L28_28 = "locator2_crow_30g"
  L26_26 = L26_26(L27_27, L28_28)
  L25_25.node = L26_26
  L26_26 = Supporter
  L26_26 = L26_26.MovePoint
  L26_26 = L26_26.Takeoff
  L25_25.action = L26_26
  L26_26 = crow_vel
  L25_25.vel = L26_26
  L26_26 = {}
  L27_27 = findGameObject2
  L28_28 = "Node"
  L27_27 = L27_27(L28_28, "locator2_crow_30g")
  L26_26.node = L27_27
  L27_27 = Supporter
  L27_27 = L27_27.MovePoint
  L27_27 = L27_27.Air
  L26_26.action = L27_27
  L27_27 = crow_vel
  L26_26.vel = L27_27
  L27_27 = {}
  L28_28 = findGameObject2
  L28_28 = L28_28("Node", "locator2_crow_34a")
  L27_27.node = L28_28
  L28_28 = Supporter
  L28_28 = L28_28.MovePoint
  L28_28 = L28_28.Air
  L27_27.action = L28_28
  L28_28 = crow_vel
  L27_27.vel = L28_28
  L28_28 = {}
  L28_28.node = findGameObject2("Node", "locator2_crow_34")
  L28_28.action = Supporter.MovePoint.Air
  L28_28.vel = crow_vel
  L10_10.warp = true
  L11_11 = _brain_crow
  L11_11 = L11_11.setMovePoints
  L11_11(L12_12, L13_13)
  L11_11 = _brain_crow
  L11_11 = L11_11.startMovePoint
  L11_11(L12_12)
  L11_11 = Fn_tutorialCaption
  L11_11(L12_12)
  L11_11 = 0
  repeat
    L11_11 = L11_11 + 1
    L12_12(L13_13)
    L12_12()
  until L12_12 or L11_11 > 300
  L12_12()
  duo_talk = L12_12
  while true do
    if L12_12 then
      if L12_12 == false then
        L12_12(L13_13)
        L12_12(L13_13, L14_14)
        L12_12(L13_13)
        _crow_stop = true
        L15_15 = 1
        L16_16 = ""
        L17_17 = _crow_puppet
        L12_12(L13_13, L14_14, L15_15, L16_16, L17_17)
        L12_12(L13_13)
      end
    end
    if L12_12 == true then
      _next_phase = false
      break
    end
    L12_12()
  end
  if L12_12 ~= nil then
    L12_12(L13_13)
    duo_talk = nil
  end
  hole_cnt2 = 10
  for L15_15 = 1, 14 do
    L16_16 = "co_hole_oc_01_center_"
    L17_17 = string
    L17_17 = L17_17.format
    L18_18 = "%02d"
    L19_19 = L15_15
    L17_17 = L17_17(L18_18, L19_19)
    L16_16 = L16_16 .. L17_17
    if L15_15 == 10 then
      L17_17 = hole_hdl
      L18_18 = Fn_findGimmickBgInBgset
      L19_19 = "co_hole_oc_02_center_10"
      L18_18 = L18_18(L19_19)
      L17_17[L15_15] = L18_18
    else
      L17_17 = hole_hdl
      L18_18 = Fn_findGimmickBgInBgset
      L19_19 = L16_16
      L18_18 = L18_18(L19_19)
      L17_17[L15_15] = L18_18
    end
    L17_17 = hole_node
    L18_18 = findGameObject2
    L19_19 = "Node"
    L20_20 = "locator2_holetop_"
    L21_21 = string
    L21_21 = L21_21.format
    L22_22 = "%02d"
    L23_23 = L15_15
    L21_21 = L21_21(L22_22, L23_23)
    L20_20 = L20_20 .. L21_21
    L18_18 = L18_18(L19_19, L20_20)
    L17_17[L15_15] = L18_18
    L17_17 = mnavi_hdl
    L18_18 = HUD
    L19_19 = L18_18
    L18_18 = L18_18.mnaviNew
    L20_20 = {}
    L21_21 = "mnavi_"
    L22_22 = L15_15
    L21_21 = L21_21 .. L22_22
    L20_20.name = L21_21
    L20_20.PochFadeLen0 = 5
    L20_20.PochFadeLen100 = 20
    L18_18 = L18_18(L19_19, L20_20)
    L17_17[L15_15] = L18_18
    L17_17 = mnavi_hdl
    L17_17 = L17_17[L15_15]
    L18_18 = L17_17
    L17_17 = L17_17.setTarget
    L19_19 = hole_hdl
    L19_19 = L19_19[L15_15]
    L17_17(L18_18, L19_19)
    L17_17 = hole_hdl
    L17_17 = L17_17[L15_15]
    L18_18 = L17_17
    L17_17 = L17_17.setLockonPermission
    L19_19 = true
    L17_17(L18_18, L19_19)
    L17_17 = hole_hdl
    L17_17 = L17_17[L15_15]
    L18_18 = L17_17
    L17_17 = L17_17.setVisibleBlockEnable
    L19_19 = false
    L17_17(L18_18, L19_19)
    L17_17 = hole_hdl
    L17_17 = L17_17[L15_15]
    L18_18 = L17_17
    L17_17 = L17_17.setCollidableBlockEnable
    L19_19 = false
    L17_17(L18_18, L19_19)
    L17_17 = wind_hdl
    L18_18 = createGameObject2
    L19_19 = "BulletShockwave"
    L18_18 = L18_18(L19_19)
    L17_17[L15_15] = L18_18
    L17_17 = hole_node
    L17_17 = L17_17[L15_15]
    L18_18 = L17_17
    L17_17 = L17_17.getWorldPos
    L17_17 = L17_17(L18_18)
    L18_18 = hole_node
    L18_18 = L18_18[L15_15]
    L19_19 = L18_18
    L18_18 = L18_18.getWorldRot
    L18_18 = L18_18(L19_19)
    L19_19 = wind_hdl
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.setParam
    L21_21 = {}
    L21_21.force = 10
    L21_21.type = "windfield"
    L22_22 = Vector
    L23_23 = 3
    L24_24 = 12
    L25_25 = 3
    L22_22 = L22_22(L23_23, L24_24, L25_25)
    L21_21.halfExtent = L22_22
    L21_21.pos = L17_17
    L21_21.rot = L18_18
    L21_21.time = 999
    L21_21.dir = "yAxis"
    L19_19(L20_20, L21_21)
    L19_19 = co_a_01_hdl
    L20_20 = L19_19
    L19_19 = L19_19.appendChild
    L21_21 = wind_hdl
    L21_21 = L21_21[L15_15]
    L22_22 = true
    L19_19(L20_20, L21_21, L22_22)
    L19_19 = wind_obj
    L20_20 = createGameObject2
    L21_21 = "Node"
    L20_20 = L20_20(L21_21)
    L19_19[L15_15] = L20_20
    L19_19 = wind_obj
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.setName
    L21_21 = "windeff_node_"
    L22_22 = string
    L22_22 = L22_22.format
    L23_23 = "%02d"
    L24_24 = L15_15
    L22_22 = L22_22(L23_23, L24_24)
    L21_21 = L21_21 .. L22_22
    L19_19(L20_20, L21_21)
    L19_19 = wind_obj
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.try_init
    L19_19(L20_20)
    L19_19 = wind_obj
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.waitForReady
    L19_19(L20_20)
    L19_19 = wind_obj
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.try_start
    L19_19(L20_20)
    L19_19 = wind_obj
    L19_19 = L19_19[L15_15]
    L20_20 = L19_19
    L19_19 = L19_19.setWorldTransform
    L21_21 = L17_17
    L22_22 = XYZRotQuatD
    L23_23 = -90
    L24_24 = 0
    L25_25 = 0
    L22_22 = L22_22(L23_23, L24_24, L25_25)
    L22_22 = L18_18 * L22_22
    L19_19(L20_20, L21_21, L22_22)
    L19_19 = co_a_01_hdl
    L20_20 = L19_19
    L19_19 = L19_19.appendChild
    L21_21 = wind_obj
    L21_21 = L21_21[L15_15]
    L22_22 = true
    L19_19(L20_20, L21_21, L22_22)
  end
  L12_12(L13_13)
  L12_12(L13_13)
  hole_break = L12_12
  L12_12(L13_13)
  L12_12.r_stick = true
  L12_12.l_stick = false
  L15_15 = L13_13
  L16_16 = L12_12
  L14_14(L15_15, L16_16)
  L15_15 = L14_14
  L16_16 = Camera
  L16_16 = L16_16.kPlayer
  L17_17 = Camera
  L17_17 = L17_17.kControl_Gyro
  L18_18 = false
  L14_14(L15_15, L16_16, L17_17, L18_18)
  L15_15 = L14_14
  L16_16 = Camera
  L16_16 = L16_16.kPlayer
  L17_17 = Camera
  L17_17 = L17_17.kControl_ResetView
  L18_18 = false
  L14_14(L15_15, L16_16, L17_17, L18_18)
  L15_15 = "\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176"
  L14_14(L15_15)
  L15_15 = "pccubesensor2_goal_01"
  L16_16 = 0
  view_task = L14_14
  L15_15 = 1.5
  L14_14(L15_15)
  L15_15 = L14_14
  L14_14(L15_15)
  view_task = nil
  L14_14.r_stick = true
  L14_14.l_stick = false
  L15_15 = {}
  L16_16 = Fn_unLockPlayerAbility
  L17_17 = L15_15
  L18_18 = L14_14
  L16_16(L17_17, L18_18)
  L16_16 = Camera
  L17_17 = L16_16
  L16_16 = L16_16.setControl
  L18_18 = Camera
  L18_18 = L18_18.kPlayer
  L19_19 = Camera
  L19_19 = L19_19.kControl_Gyro
  L20_20 = false
  L16_16(L17_17, L18_18, L19_19, L20_20)
  L16_16 = Camera
  L17_17 = L16_16
  L16_16 = L16_16.setControl
  L18_18 = Camera
  L18_18 = L18_18.kPlayer
  L19_19 = Camera
  L19_19 = L19_19.kControl_ResetView
  L20_20 = false
  L16_16(L17_17, L18_18, L19_19, L20_20)
  L16_16 = print
  L17_17 = "\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176"
  L16_16(L17_17)
  L16_16 = Fn_userCtrlOff
  L16_16()
  L16_16 = _brain_crow
  L17_17 = L16_16
  L16_16 = L16_16.setSlopeDegreeToRevertGravityColor
  L18_18 = 5
  L16_16(L17_17, L18_18)
  L16_16 = _brain_crow
  L17_17 = L16_16
  L16_16 = L16_16.setDetectThreatDistance
  L18_18 = 100
  L16_16(L17_17, L18_18)
  L16_16 = waitSeconds
  L17_17 = 0.3
  L16_16(L17_17)
  L16_16 = {L17_17}
  L17_17 = {}
  L17_17.pos = "camnode2_b_02"
  L17_17.time = 7
  L17_17 = {L18_18}
  L18_18 = {}
  L18_18.pos = "locator2_b_aim01"
  L18_18.time = 0
  L18_18 = sdemo
  L19_19 = L18_18
  L18_18 = L18_18.set
  L20_20 = "camnode2_b_01"
  L21_21 = "locator2_b_aim01"
  L22_22 = false
  L18_18(L19_19, L20_20, L21_21, L22_22)
  L18_18 = sdemo
  L19_19 = L18_18
  L18_18 = L18_18.play
  L20_20 = L16_16
  L21_21 = L17_17
  L18_18(L19_19, L20_20, L21_21)
  L19_19 = L0_0
  L18_18 = L0_0.setVisible
  L20_20 = false
  L18_18(L19_19, L20_20)
  L18_18 = Fn_userCtrlOff
  L18_18()
  L18_18 = Fn_resetPcPos
  L19_19 = "locator2_reset_01"
  L20_20 = Player
  L20_20 = L20_20.kReset_Standing
  L18_18(L19_19, L20_20)
  L18_18 = waitSeconds
  L19_19 = 1.5
  L18_18(L19_19)
  L18_18 = Fn_captionViewWait
  L19_19 = "ep21_00105"
  L18_18(L19_19)
  L18_18 = _brain_crow
  L19_19 = L18_18
  L18_18 = L18_18.isMovePointEnd
  L18_18 = L18_18(L19_19)
  if not L18_18 then
    L18_18 = _brain_crow
    L19_19 = L18_18
    L18_18 = L18_18.clearMovePoint
    L18_18(L19_19)
  end
  L18_18 = findGameObject2
  L19_19 = "Node"
  L20_20 = "locator2_crow_42g"
  L18_18 = L18_18(L19_19, L20_20)
  L19_19 = L18_18
  L18_18 = L18_18.getWorldTransform
  L19_19 = L18_18(L19_19)
  L20_20 = _brain_crow
  L21_21 = L20_20
  L20_20 = L20_20.warp
  L22_22 = L18_18
  L23_23 = L19_19
  L20_20(L21_21, L22_22, L23_23)
  L20_20 = _brain_crow
  L21_21 = L20_20
  L20_20 = L20_20.setIdling
  L22_22 = true
  L20_20(L21_21, L22_22)
  L20_20 = _crow_puppet
  sdemo_chara = L20_20
  L20_20 = waitSeconds
  L21_21 = 1.5
  L20_20(L21_21)
  L20_20 = Vector
  L21_21 = 10.926834
  L22_22 = -1452.195557
  L23_23 = -3.320911
  L20_20 = L20_20(L21_21, L22_22, L23_23)
  L21_21 = Vector
  L22_22 = 4.3
  L23_23 = -1451.284424
  L24_24 = -4.753811
  L21_21 = L21_21(L22_22, L23_23, L24_24)
  L22_22 = sdemo_2nd
  L23_23 = L22_22
  L22_22 = L22_22.set
  L24_24 = L20_20
  L25_25 = L21_21
  L22_22(L23_23, L24_24, L25_25)
  L22_22 = sdemo_2nd
  L24_24 = "setCameraParam"
  L23_23 = L22_22
  L22_22 = L22_22[L24_24]
  L24_24 = nil
  L25_25 = 0.1
  L26_26 = {}
  L27_27 = "deg"
  L28_28 = 35
  L26_26[L27_27] = L28_28
  L22_22(L23_23, L24_24, L25_25, L26_26)
  L22_22 = {
    L23_23,
    L24_24,
    L25_25,
    L26_26,
    L27_27
  }
  L23_23 = {}
  L24_24 = Vector
  L25_25 = 4.409227
  L26_26 = -1450.574585
  L27_27 = -4.693492
  L24_24 = L24_24(L25_25, L26_26, L27_27)
  L23_23.pos = L24_24
  L23_23.time = 1
  L24_24 = "hashfunc"
  L25_25 = "EaseOut"
  L23_23[L24_24] = L25_25
  L24_24 = {}
  L25_25 = Vector
  L26_26 = 4.409227
  L27_27 = -1450.574585
  L28_28 = -4.693492
  L25_25 = L25_25(L26_26, L27_27, L28_28)
  L24_24.pos = L25_25
  L24_24.time = 1.5
  L25_25 = {}
  L26_26 = Vector
  L27_27 = 4.681288
  L28_28 = -1449.658203
  L26_26 = L26_26(L27_27, L28_28, -6.170304)
  L25_25.pos = L26_26
  L25_25.time = 2
  L26_26 = {}
  L27_27 = Vector
  L28_28 = 4.681288
  L27_27 = L27_27(L28_28, -1449.658203, -6.170304)
  L26_26.pos = L27_27
  L27_27 = 2.2
  L26_26.time = L27_27
  L27_27 = {}
  L28_28 = Vector
  L28_28 = L28_28(10.089797, -1451.765991, -3.659986)
  L27_27.pos = L28_28
  L27_27.time = 2
  L23_23 = sdemo_2nd
  L24_24 = L23_23
  L23_23 = L23_23.play
  L25_25 = nil
  L26_26 = L22_22
  L23_23(L24_24, L25_25, L26_26)
  L23_23 = invokeTask
  function L24_24()
    waitSeconds(4.9)
    sdemo_2nd:zoomIn(1, {deg = 18}, "easeInOut")
    waitSeconds(1.6)
    sdemo_2nd:zoomIn(10, {deg = 15}, "easeInOut")
  end
  L23_23(L24_24)
  L24_24 = L0_0
  L23_23 = L0_0.setVisible
  L25_25 = true
  L23_23(L24_24, L25_25)
  L23_23 = Fn_captionView
  L24_24 = "ep21_00130"
  L23_23(L24_24)
  L23_23 = waitSeconds
  L24_24 = 3
  L23_23(L24_24)
  L23_23 = _brain_crow
  L24_24 = L23_23
  L23_23 = L23_23.setIdling
  L25_25 = false
  L23_23(L24_24, L25_25)
  L23_23 = _crow_puppet
  L24_24 = L23_23
  L23_23 = L23_23.getWorldPos
  L23_23 = L23_23(L24_24)
  L24_24 = {
    L25_25,
    L26_26,
    L27_27,
    L28_28,
    {
      pos = L23_23,
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    },
    {
      node = findGameObject2("Node", "locator2_crow_44"),
      action = Supporter.MovePoint.Air,
      vel = crow_vel
    }
  }
  L25_25 = {}
  L25_25.pos = L23_23
  L26_26 = Supporter
  L26_26 = L26_26.MovePoint
  L26_26 = L26_26.Takeoff
  L25_25.action = L26_26
  L26_26 = crow_vel
  L25_25.vel = L26_26
  L26_26 = {}
  L26_26.pos = L23_23
  L27_27 = Supporter
  L27_27 = L27_27.MovePoint
  L27_27 = L27_27.Air
  L26_26.action = L27_27
  L27_27 = crow_vel
  L26_26.vel = L27_27
  L27_27 = {}
  L28_28 = findGameObject2
  L28_28 = L28_28("Node", "locator2_crow_44")
  L27_27.node = L28_28
  L28_28 = Supporter
  L28_28 = L28_28.MovePoint
  L28_28 = L28_28.Air
  L27_27.action = L28_28
  L28_28 = crow_vel
  L27_27.vel = L28_28
  L28_28 = {}
  L28_28.node = findGameObject2("Node", "locator2_crow_44")
  L28_28.action = Supporter.MovePoint.FallKick
  L28_28.target = hole_hdl[1]
  L28_28.vel = crow_vel
  L28_28.power = 100
  L25_25 = _crow_puppet
  L26_26 = L25_25
  L25_25 = L25_25.getWorldPos
  L25_25 = L25_25(L26_26)
  repeat
    L26_26 = wait
    L26_26()
    L26_26 = _brain_crow
    L27_27 = L26_26
    L26_26 = L26_26.isMovePointEnd
    L26_26 = L26_26(L27_27)
  until L26_26
  repeat
    L26_26 = true
    _crow_stop = L26_26
    L26_26 = _brain_crow
    L27_27 = L26_26
    L26_26 = L26_26.setMovePoints
    L28_28 = L24_24
    L26_26(L27_27, L28_28)
    L26_26 = _brain_crow
    L27_27 = L26_26
    L26_26 = L26_26.startMovePoint
    L26_26(L27_27)
    L26_26 = wait
    L26_26()
    while true do
      L26_26 = _crow_stop
      L27_27 = true
      if L26_26 == L27_27 then
        L26_26 = _brain_crow
        L27_27 = L26_26
        L26_26 = L26_26.isMovePointEnd
        L26_26 = L26_26(L27_27)
        if L26_26 then
          L26_26 = _brain_crow
          L27_27 = L26_26
          L26_26 = L26_26.clearMovePoint
          L26_26(L27_27)
          L26_26 = false
          _crow_stop = L26_26
        end
        L26_26 = print
        L27_27 = "\227\130\175\227\131\173\227\130\166\231\167\187\229\139\149\231\181\130\228\186\134\229\190\133\227\129\161"
        L26_26(L27_27)
        L26_26 = wait
        L26_26()
      end
    end
    L26_26 = hole_hdl
    L26_26 = L26_26[1]
    L28_28 = "isBroken"
    L27_27 = L26_26
    L26_26 = L26_26[L28_28]
    L26_26 = L26_26(L27_27)
    if L26_26 then
      L26_26 = wind_hdl
      L26_26 = L26_26[1]
      L28_28 = "attack"
      L27_27 = L26_26
      L26_26 = L26_26[L28_28]
      L26_26(L27_27)
      L26_26 = "wind_se"
      L26_26 = _ENV[L26_26]
      L27_27 = Sound
      L28_28 = L27_27
      L27_27 = L27_27.playSEHandle
      L27_27 = L27_27(L28_28, "amb_ep21_003", 1, nil, wind_obj[1])
      L26_26[1] = L27_27
      L26_26 = "windyeff_hdl"
      L26_26 = _ENV[L26_26]
      L27_27 = "Fn_createEffect"
      L27_27 = _ENV[L27_27]
      L28_28 = "windfield"
      L27_27 = L27_27(L28_28, "ef_ev_wind_01", "windeff_node_" .. string.format("%02d", 1), true)
      L26_26[1] = L27_27
      L26_26 = co_a_01_hdl
      L27_27 = L26_26
      L26_26 = L26_26.appendChild
      L28_28 = "windyeff_hdl"
      L28_28 = _ENV[L28_28]
      L28_28 = L28_28[1]
      L26_26(L27_27, L28_28, true)
    end
    L26_26 = _brain_crow
    L27_27 = L26_26
    L26_26 = L26_26.clearMovePoint
    L26_26(L27_27)
    L26_26 = false
    _crow_stop = L26_26
    L26_26 = wait
    L26_26()
    L26_26 = print
    L27_27 = "\231\160\180\229\163\138\229\190\133\227\129\161"
    L26_26(L27_27)
    L26_26 = hole_hdl
    L26_26 = L26_26[1]
    L28_28 = "isBroken"
    L27_27 = L26_26
    L26_26 = L26_26[L28_28]
    L26_26 = L26_26(L27_27)
  until L26_26
  L26_26 = waitSeconds
  L27_27 = 1
  L26_26(L27_27)
  L26_26 = Fn_captionView
  L27_27 = "ep21_00106"
  L26_26(L27_27)
  L26_26 = waitSeconds
  L27_27 = 3.5
  L26_26(L27_27)
  L26_26 = {L27_27}
  L27_27 = {}
  L27_27.pos = "camnode2_b_02"
  L27_27.time = 0
  L27_27 = {
    L28_28,
    {
      pos = "locator2_b_aim02",
      time = 4
    }
  }
  L28_28 = {}
  L28_28.pos = "locator2_b_aim01"
  L28_28.time = 1.4
  L28_28 = sdemo
  L28_28 = L28_28.set
  L28_28(L28_28, "camnode2_b_01", "locator2_b_aim01", false)
  L28_28 = sdemo
  L28_28 = L28_28.play
  L28_28(L28_28, L26_26, L27_27)
  L28_28 = sdemo
  L28_28 = L28_28.setCameraParam
  L28_28(L28_28, nil, 0.1, {deg = 50})
  L28_28 = waitSeconds
  L28_28(1)
  L28_28 = mnavi_hdl
  L28_28 = L28_28[1]
  L28_28 = L28_28.setActive
  L28_28(L28_28, false)
  L28_28 = mnavi_hdl
  L28_28[1] = nil
  L28_28 = hole_hdl
  L28_28[1] = nil
  L28_28 = "hole_cnt"
  _ENV[L28_28] = hole_cnt - 1
  L28_28 = "stone_floating"
  L28_28 = _ENV[L28_28]
  L28_28(ep21_floting_table.zenhan)
  L28_28 = waitSeconds
  L28_28(2)
  L28_28 = Fn_captionViewWait
  L28_28("ep21_00107")
  L28_28 = "stone_pause"
  L28_28 = _ENV[L28_28]
  L28_28(ep21_floting_table.zenhan, true)
  L28_28 = Fn_userCtrlOn
  L28_28()
  L28_28 = sdemo
  L28_28 = L28_28.stop
  L28_28(L28_28, 1)
  L28_28 = Fn_captionViewWait
  L28_28("ep21_00200")
  L28_28 = Fn_captionView
  L28_28("ep21_00210")
  L28_28 = Camera
  L28_28 = L28_28.setControl
  L28_28(L28_28, Camera.kPlayer, Camera.kControl_Gyro, true)
  L28_28 = Camera
  L28_28 = L28_28.setControl
  L28_28(L28_28, Camera.kPlayer, Camera.kControl_ResetView, true)
  L28_28 = "Fn_setCatWarpCheckPoint"
  L28_28 = _ENV[L28_28]
  L28_28("locator2_reset_00")
  L28_28 = "Fn_pcSensorOn"
  L28_28 = _ENV[L28_28]
  L28_28("pccubesensor2_reset_00")
  L28_28 = Fn_missionView
  L28_28("ep21_00108", 5)
  while true do
    L28_28 = _brain_crow
    L28_28 = L28_28.isMovePointEnd
    L28_28 = L28_28(L28_28)
    if L28_28 then
      L28_28 = _brain_crow
      L28_28 = L28_28.clearMovePoint
      L28_28(L28_28)
      break
    end
    L28_28 = wait
    L28_28()
  end
  L28_28 = waitPhace
  L28_28()
  L28_28 = _brain_crow
  L28_28 = L28_28.setClimbHeightToStartMoveGoal
  L28_28(L28_28, 30)
  L28_28 = Sound
  L28_28 = L28_28.playSE
  L28_28(L28_28, "cro_240", 1, "", _crow_puppet)
  L28_28 = Fn_captionViewWait
  L28_28("ep21_00112")
  L28_28 = Fn_captionViewWait
  L28_28("ep21_00113")
  L28_28 = Fn_naviKill
  L28_28()
  L28_28 = Fn_missionView
  L28_28("ep21_00114", 5)
  L28_28 = "Fn_setCatWarpCheckPoint"
  L28_28 = _ENV[L28_28]
  L28_28("locator2_reset_02")
  L28_28 = "Fn_pcSensorOn"
  L28_28 = _ENV[L28_28]
  L28_28("pccubesensor2_reset_01")
  L28_28 = {
    findGameObject2("Node", "locator2_goal_h_around1"):getWorldPos(),
    findGameObject2("Node", "locator2_goal_h_around2"):getWorldPos()
  }
  clow_clime("locator2_goal_h", L28_28)
  crow_break = invokeTask(function()
    local L0_29, L1_30
    repeat
      repeat
        if L0_29 == true then
          L0_29(L1_30)
          L0_29(L1_30)
          L0_29(L1_30)
          if L0_29 ~= nil then
            _brain_crow:setMovePoints(L1_30)
            _brain_crow:startMovePoint()
            Fn_captionViewWait("ep21_00120")
            repeat
              wait()
            until _brain_crow:isMovePointEnd()
            _brain_crow:clearMovePoint()
          end
          L0_29(L1_30)
          for _FORV_3_ = 5, 6 do
            if hole_hdl[_FORV_3_] ~= nil then
              mnavi_hdl[_FORV_3_]:setActive(true)
              navi_cap = true
            end
          end
          if L0_29 == true then
            L0_29(L1_30)
          end
          crow_change = false
          L1_30("locator2_goal_h", L0_29)
        end
        L0_29()
      until L0_29 == nil
    until L0_29 == true
  end)
  crow_break2 = invokeTask(function()
    repeat
      if crow_change2 == true then
        print("\227\130\175\227\131\173\227\130\166\229\139\157\230\137\139\227\129\171\229\163\138\227\129\153\239\188\146\229\155\158\231\155\174\229\137\141")
        for _FORV_3_ = 8, 12 do
          if hole_hdl[_FORV_3_] ~= nil and _FORV_3_ ~= 10 then
            mnavi_hdl[_FORV_3_]:setActive(true)
            navi_cap2 = true
          end
        end
        if _FOR_ == true then
          Fn_captionViewWait("ep21_00129")
        end
      end
      wait()
    until navi_cap2 == true
  end)
  crow_goal = invokeTask(function()
    local L0_31
    L0_31 = findGameObject2
    L0_31 = L0_31("Node", "locator2_goal_h")
    L0_31 = L0_31.getWorldPos
    L0_31 = L0_31(L0_31)
    lito2_pos = L0_31
    repeat
      L0_31 = wait
      L0_31()
      L0_31 = print
      L0_31(lito2_pos:DistanceTo(_crow_puppet:getWorldPos()))
      L0_31 = lito2_pos
      L0_31 = L0_31.DistanceTo
      L0_31 = L0_31(L0_31, _crow_puppet:getWorldPos())
    until L0_31 < 10
    _crow_goal = true
    L0_31 = _brain_crow
    L0_31 = L0_31.clearMovePoint
    L0_31(L0_31)
    L0_31 = _brain_crow
    L0_31 = L0_31.setAbility
    L0_31(L0_31, Supporter.Ability.Warp, false)
    L0_31 = _brain_crow
    L0_31 = L0_31.setIdling
    L0_31(L0_31, true)
    L0_31 = kitun_goal
    if L0_31 == false then
      L0_31 = Fn_captionViewWait
      L0_31("ep21_00122")
    end
    L0_31 = findGameObject2
    L0_31 = L0_31("Node", "locator2_goal_h")
    Fn_naviSet(L0_31)
    Fn_pcSensorOn("pccubesensor2_goal_02")
  end)
  waitPhace()
  Fn_pcSensorOff("pccubesensor2_goal_01")
  end_flg = true
  for _FORV_32_ = 5, 14 do
    if mnavi_hdl[_FORV_32_] ~= nil then
      mnavi_hdl[_FORV_32_]:setActive(false)
    end
  end
  Fn_captionViewWait("ep21_00123")
  _brain_crow:setIdling(false)
  Fn_lookAtObject("camnode2_b_04"):abort()
  waitPhace()
  _brain_crow:clearClimbObjects()
  _brain_crow:setAbility(Supporter.Ability.Warp, true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
  end
end
function pccubesensor2_film_01_OnEnter(A0_32)
  count = 0
  film_count = invokeTask(function()
    repeat
      count = count + 1
      wait()
    until count > 30
    A0_32:setActive(false)
    _next_phase = true
  end)
end
function pccubesensor2_film_01_OnLeave(A0_33)
  if film_count ~= nil then
    film_count:abort()
    film_count = nil
  end
end
function pccubesensor2_goal_01_OnEnter(A0_34)
  A0_34:setActive(false)
  invokeTask(function()
    local L0_35
    kitun_goal = true
    L0_35 = _crow_goal
    if L0_35 == false then
      L0_35 = Fn_naviKill
      L0_35()
    end
    L0_35 = Fn_captionViewWait
    L0_35("ep21_00124")
    L0_35 = findGameObject2
    L0_35 = L0_35("Node", "locator2_goal_h")
    Fn_naviSet(L0_35)
  end)
end
function pccubesensor2_goal_02_OnEnter(A0_36)
  A0_36:setActive(false)
  kitun_goal = true
  Fn_naviKill()
  if end_flg == false then
    _next_phase = true
  end
  invokeTask(function()
    waitSeconds(3)
    Fn_naviKill()
  end)
end
function pccubesensor2_01_OnEnter(A0_37)
  A0_37:setActive(false)
  _next_phase = true
end
function pccubesensor2_flystone_01_OnEnter(A0_38)
  Fn_naviKill()
  A0_38:setActive(false)
  _next_phase = true
end
function pccubesensor2_flystone_02_OnEnter(A0_39)
  Fn_naviKill()
  A0_39:setActive(false)
  _next_phase = true
end
function pccubesensor2_flystone_03_OnEnter(A0_40)
  A0_40:setActive(false)
  invokeTask(function()
    Fn_captionViewWait("ep21_00125")
  end)
end
function cubesensor2_00_OnEnter(A0_41)
  A0_41:setActive(false)
  _talk_on = true
end
function cubesensor2_01_OnEnter(A0_42)
  A0_42:setActive(false)
  crow_change = true
  print("\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\153\227\130\139\230\140\135\228\187\164\239\188\145")
end
function cubesensor2_02_OnEnter(A0_43)
  A0_43:setActive(false)
  crow_change = true
  print("\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\153\227\130\139\230\140\135\228\187\164\239\188\146")
end
function cubesensor2_03_OnEnter(A0_44)
  A0_44:setActive(false)
  crow_change2 = true
  print("\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\153\227\130\139\230\140\135\228\187\164\239\188\147")
end
function cubesensor2_04_OnEnter(A0_45)
  A0_45:setActive(false)
  crow_change2 = true
  print("\227\130\175\227\131\173\227\130\166\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\153\227\130\139\230\140\135\228\187\164\239\188\148")
end
function pccubesensor2_reset_00_OnEnter()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_reset_01_OnEnter()
  invokeTask(function()
    local L0_46
    L0_46 = Fn_catWarp
    L0_46()
    L0_46 = kitun_goal
    if L0_46 ~= true then
      L0_46 = _crow_goal
    elseif L0_46 == true then
      L0_46 = findGameObject2
      L0_46 = L0_46("Node", "locator2_goal_h")
      Fn_naviSet(L0_46)
      Fn_pcSensorOn("pccubesensor2_goal_02")
    end
  end)
end
function navi_on()
  local L0_47, L1_48
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function stone_floating(A0_49)
  for _FORV_4_, _FORV_5_ in ipairs(A0_49) do
    _FORV_5_.bool = true
    _area_ctrls[_FORV_5_.name]:setMoveParam({move_type = 2, move_atime = 2})
    _area_ctrls[_FORV_5_.name]:move(_FORV_5_.Node)
    wait()
  end
end
function stone_pause(A0_50, A1_51)
  for _FORV_5_, _FORV_6_ in ipairs(A0_50) do
    _FORV_6_.bool = false
    _area_ctrls[_FORV_6_.name]:pause(A1_51)
  end
end
function clowmove_posset(A0_52)
  return (findGameObject2("Node", A0_52):getWorldPos())
end
function clow_clime(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
  L2_55 = _brain_crow
  L3_56 = L2_55
  L2_55 = L2_55.setClimbObjects
  L4_57 = Supporter
  L4_57 = L4_57.ClimbTarget
  L4_57 = L4_57.ep21_Stone
  L2_55 = L2_55(L3_56, L4_57, L5_58)
  L3_56 = findGameObject2
  L4_57 = "Node"
  L3_56 = L3_56(L4_57, L5_58)
  L4_57 = L3_56.getWorldPos
  L4_57 = L4_57(L5_58)
  L5_58(L6_59, L7_60)
  for L8_61, L9_62 in L5_58(L6_59) do
    _brain_crow:addClimbPoint(L9_62)
  end
  L8_61 = 150
  L5_58(L6_59, L7_60, L8_61)
  if L2_55 then
    L5_58(L6_59, L7_60)
    L5_58(L6_59)
  else
    L5_58(L6_59)
    L5_58(L6_59)
  end
end
function ore_check_eye(A0_63, A1_64, A2_65)
  local L3_66, L4_67, L5_68, L6_69
  if A2_65 == nil then
    A2_65 = 20
  end
  L3_66 = false
  L4_67 = Fn_isInSightTarget
  L5_68 = A1_64
  L4_67 = L4_67(L5_68)
  if L4_67 == true then
    L4_67 = Fn_getPcPosRot
    L5_68 = L4_67()
    L6_69 = L4_67.y
    L6_69 = L6_69 + 1.5
    L4_67.y = L6_69
    L6_69 = Query
    L6_69 = L6_69.setEyeSightTransform
    L6_69(L6_69, L4_67, L5_68)
    L6_69 = Query
    L6_69 = L6_69.setEyeSightAngle
    L6_69(L6_69, Deg2Rad(360))
    L6_69 = Query
    L6_69 = L6_69.setEyeSightRange
    L6_69(L6_69, A2_65)
    L6_69 = A1_64.getWorldPos
    L6_69 = L6_69(A1_64)
    if A2_65 >= Fn_getDistanceToPlayer(A0_63) and Query:raycastEyeSight(L6_69) == nil then
      L3_66 = true
    end
  end
  return L3_66
end
function moco_check_eye(A0_70)
  moco_reset = invokeTask(function()
    local L1_71, L2_72, L3_73
    repeat
      for _FORV_3_ = 1, 34 do
        if A0_70 == nil then
          A0_70 = 10
        end
        if Fn_isInSightTarget(moco[_FORV_3_]) == false and moco[_FORV_3_]:isBroken() then
          moco[_FORV_3_]:requestRestore()
        end
        wait()
      end
    until L1_71
  end)
end
_specialgem_time = 10
function specialGemrReset(A0_74)
  if A0_74 ~= nil then
    _specialgem_time = A0_74
  end
  print("\227\130\184\227\130\167\227\131\160\229\134\141\231\148\159\230\136\144\233\150\139\229\167\139")
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
function specialGemReCreate(A0_75)
  invokeTask(function()
    print("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144\230\186\150\229\130\153")
    waitSeconds(_specialgem_time)
    createGem(A0_75, 6)
    print("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144")
  end)
end
function createGem(A0_76, A1_77)
  local L2_78, L3_79, L4_80
  L3_79 = A0_76
  L2_78 = A0_76.getName
  L2_78 = L2_78(L3_79)
  if L2_78 ~= nil then
    L3_79 = print
    L4_80 = "***** Gam create : "
    L4_80 = L4_80 .. L2_78 .. " *****"
    L3_79(L4_80)
    L3_79 = createGameObject2
    L4_80 = "Gem"
    L3_79 = L3_79(L4_80)
    L4_80 = L3_79.setName
    L4_80(L3_79, L2_78)
    L4_80 = L3_79.setGemModelNo
    L4_80(L3_79, A1_77)
    L4_80 = A0_76.getWorldPos
    L4_80 = L4_80(A0_76)
    L4_80 = L4_80 + Vector(0, 0, 0)
    L3_79:setWorldPos(L4_80)
    L3_79:setForceMove()
    L3_79:setVisible(true)
    L3_79:setVisibleBlockHalfSize(150)
    L3_79:try_init()
    L3_79:waitForReadyAsync(function()
      L3_79:try_start()
    end)
    return L3_79
  else
  end
  L3_79 = nil
  return L3_79
end
function movieWallDmg()
  print("movieWallDmg check start")
  _crow_twingravkick = false
  function judge_callback(A0_81, A1_82, A2_83, A3_84)
    print("judge:" .. A1_82 .. "=" .. A2_83)
    if A3_84:getName() ~= nil then
      print("  sender:" .. A3_84:getName())
    else
      print("  sender: not named")
    end
    if Player:getAction() == Player.kAction_JuptTwinGravKickFalling then
      crow_sel = true
      return 2
    else
      crow_sel = false
    end
  end
  Fn_findGimmickBgInBgset("co_hole_oc_02_center_10"):setEventListener("judge", judge_callback)
end
