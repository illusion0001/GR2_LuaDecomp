dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/gm_boss.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
import("Area")
_area_ctrls = {}
_puppet_crow = nil
_brain_crow = nil
_crow_set = false
_crow_move_request = false
_crow_move_end = false
_crow_move_points = nil
_crow_move_warp = nil
_crow_warp_idling = nil
_crow_first_warp = false
_crow_relay_pre = 0
_crow_check_pre = 0
_crow_route_L = {
  4,
  5,
  6,
  1,
  2,
  3
}
_crow_route_R = {
  2,
  5,
  1,
  6,
  4,
  3
}
_crow_move_tbl = {
  next_point = {
    {
      pos = Vector(0, 0, 0),
      action = Supporter.MovePoint.Air,
      vel = 15
    },
    {
      pos = Vector(0, 0, 0),
      action = Supporter.MovePoint.Air,
      vel = 15
    },
    {
      pos = Vector(0, 0, 0),
      action = Supporter.MovePoint.Idle,
      vel = 15
    }
  }
}
_crow_follow = false
_crow_follow_volume = 5
_caption_01_sensor = false
_caption_02_sensor = false
_caption_03_sensor = false
_caption_04_sensor = false
_caption_05_sensor = false
_caption_max = 5
_title = false
_central_tower = nil
_central_tower_sensor = false
_check_top_tbl = {
  false,
  false,
  false,
  false,
  false,
  false
}
_check_sub_tbl = {
  false,
  false,
  false,
  false
}
_check_sensor_in = {
  false,
  false,
  false,
  false,
  false,
  false
}
_check_bot_tbl = {
  false,
  false,
  false,
  false,
  false,
  false,
  false
}
_searching_top = nil
_searching_bottom = nil
_entrance = nil
_bottom_start = false
_bottom_outside = false
_bottom_end = false
_rooftop_max = 6
_mistake_max = 5
_bottom_max = 7
_requestRooftop = false
_rooftopEnd = false
_entrance_sensor = false
_eyesight = {}
enemy_handle_table = {
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
}
enemy_marker_table = {
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
}
enmgen_gm_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_gm_01",
      name = "enm_gm_01"
    },
    {
      type = "jammer",
      locator = "locator_gm_02",
      name = "enm_gm_02"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_03",
      name = "enm_gm_03"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_04",
      name = "enm_gm_04"
    },
    {
      type = "jammer",
      locator = "locator_gm_05",
      name = "enm_gm_05"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_06",
      name = "enm_gm_06"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_07",
      name = "enm_gm_07"
    },
    {
      type = "jammer",
      locator = "locator_gm_08",
      name = "enm_gm_08"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_09",
      name = "enm_gm_09"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_10",
      name = "enm_gm_10"
    },
    {
      type = "jammer",
      locator = "locator_gm_11",
      name = "enm_gm_11"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_12",
      name = "enm_gm_12"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_13",
      name = "enm_gm_13"
    },
    {
      type = "jammer",
      locator = "locator_gm_14",
      name = "enm_gm_14"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_15",
      name = "enm_gm_15"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_16",
      name = "enm_gm_16"
    },
    {
      type = "gellyfish",
      locator = "locator_gm_17",
      name = "enm_gm_17"
    },
    {
      type = "jammer",
      locator = "locator_gm_18",
      name = "enm_gm_18"
    },
    {
      type = "jammer",
      locator = "locator_gm_19",
      name = "enm_gm_19"
    },
    {
      type = "jammer",
      locator = "locator_gm_20",
      name = "enm_gm_20"
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
  onSpawn = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
    A0_6:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
function Initialize()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22
  L0_17 = GmBoss
  L0_17 = L0_17.create
  L0_17 = L0_17(L1_18, L2_19)
  _gm = L0_17
  L0_17 = Fn_warshipWarpRequest
  L5_22 = L1_18(L2_19, L3_20)
  L0_17(L1_18, L2_19, L3_20, L4_21, L5_22, L1_18(L2_19, L3_20))
  L0_17 = Fn_getMissionPart
  L0_17 = L0_17()
  L1_18(L2_19)
  L1_18(L2_19)
  L1_18(L2_19)
  L1_18(L2_19)
  L1_18(L2_19)
  for L4_21 = 1, _rooftop_max do
    L5_22 = Fn_sensorOff
    L5_22(string.format("cubesensor2_rooftop_%02d", L4_21))
  end
  for L4_21 = 1, _mistake_max do
    L5_22 = Fn_pcSensorOff
    L5_22(string.format("pccubesensor2_mistake_%02d", L4_21))
  end
  for L4_21 = 1, 4 do
    L5_22 = Fn_pcSensorOff
    L5_22(string.format("pccubesensor2_bottomall_%02d", L4_21))
  end
  L1_18(L2_19)
  if L0_17 == "ep12_b" then
    for L4_21 = 1, _caption_max do
      L5_22 = Fn_pcSensorOff
      L5_22(string.format("pcspheresensor2_caption_%02d", L4_21))
    end
    L1_18(L2_19)
  end
  for L4_21 = 1, 6 do
    L5_22 = {}
    L5_22.hdl = nil
    L5_22.pos = Vector(0, 0, 0)
    L5_22.insight = false
    L5_22.sphere = false
    L5_22.raycast = nil
    L5_22.hdl = findGameObject2("Node", string.format("locator2_entrance_eyeSight_%02d", L4_21))
    L5_22.pos = L5_22.hdl:getWorldPos()
    table.insert(_eyesight, L5_22)
  end
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_03"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_11"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_07"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_05"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_15"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_01 = L2_19
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_11"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_02"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_12"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_05"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_08"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_02 = L2_19
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_02"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_12"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_13"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_10"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_03 = L2_19
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_13"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_05"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_05"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_14"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_04 = L2_19
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_02"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_01"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_check_06"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_05 = L2_19
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_15"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_01 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_03"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_02 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_10"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_03 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_14"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_04 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_05 = L3_20
  L4_21 = {}
  L5_22 = Vector
  L5_22 = L5_22(0, 0, 0)
  L4_21.pos = L5_22
  L5_22 = Supporter
  L5_22 = L5_22.MovePoint
  L5_22 = L5_22.Air
  L4_21.action = L5_22
  L4_21.vel = 15
  L5_22 = {}
  L5_22.pos = findGameObject2("Node", "locator2_crow_Relaypoint_04"):getWorldPos()
  L5_22.action = Supporter.MovePoint.Air
  L5_22.vel = 15
  L2_19.check_06 = L3_20
  L1_18.building_06 = L2_19
  _crow_building_move = L1_18
end
function Ingame()
  local L0_23
  L0_23 = Area
  L0_23 = L0_23.setForceSceneParams
  L0_23(L0_23, "gm_b_root")
  L0_23 = _gm
  L0_23 = L0_23.setDispFlag
  L0_23(L0_23, "f", false)
  L0_23 = _gm
  L0_23 = L0_23.setDispFlag
  L0_23(L0_23, "l", false)
  L0_23 = _gm
  L0_23 = L0_23.setDispFlag
  L0_23(L0_23, "r", false)
  L0_23 = _gm
  L0_23 = L0_23.run
  L0_23(L0_23)
  L0_23 = _crow_set
  if L0_23 == false then
    L0_23 = print
    L0_23("****** crow set ******")
    L0_23 = Fn_getMissionPart
    L0_23 = L0_23()
    _puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, "locator2_crow_start_" .. L0_23)
    _brain_crow = _puppet_crow:getBrain()
    _crow_set = true
  end
  L0_23 = invokeTask
  L0_23 = L0_23(function()
    repeat
      if _crow_move_request == "RooftopMove" then
        print("****** Crow RooftopMove : START ******")
        crowRooftopMove2()
        _crow_move_request = false
      elseif _crow_move_request == "WARP" then
        print("****** Crow warp : START ******")
        repeat
          wait()
        until crowMoveWarp()
        _crow_move_request = false
      elseif _crow_move_request == "FOLLOWPC" then
        print("****** Crow followPc : START ******")
        crowFollowPc()
        _crow_move_request = false
      elseif _crow_move_request == "SAFETYWARP" then
        print("***** Crow Safety warp *****")
        crowSafetyWarp()
        _crow_move_request = false
      end
      wait()
    until false
  end)
  _crow_request_task = L0_23
  L0_23 = invokeTask
  L0_23 = L0_23(function()
    local L0_24, L1_25, L2_26, L3_27
    repeat
      if L0_24 == "ep12_b" then
        repeat
          if L0_24 == "START" then
            L0_24(L1_25)
            _central_tower = "RUN"
            L0_24(L1_25)
          end
          L0_24()
        until L0_24 == "END"
        L0_24(L1_25)
        repeat
          if L0_24 == "START" then
            L0_24(L1_25)
            for L3_27 = 1, _rooftop_max do
              Fn_sensorOn(string.format("cubesensor2_rooftop_%02d", L3_27))
            end
            for L3_27 = 1, _mistake_max do
              Fn_pcSensorOn(string.format("pccubesensor2_mistake_%02d", L3_27))
            end
            L0_24(L1_25)
            _searching_top = "RUN"
          end
          L0_24()
        until L0_24 == "END"
        L0_24(L1_25)
        repeat
          if L0_24 == "START" then
            L0_24(L1_25)
            L0_24(L1_25)
            repeat
              L0_24()
            until L0_24
            for L3_27 = 1, _bottom_max do
              Fn_pcSensorOn(string.format("pccubesensor2_bottom_%02d", L3_27))
            end
            _searching_bottom = "RUN"
            L3_27 = 90
            L0_24(L1_25, L2_26, L3_27, function()
              local L0_28, L1_29, L2_30, L3_31, L4_32
              for L3_31 = 1, 4 do
                L4_32 = Fn_pcSensorOn
                L4_32(string.format("pccubesensor2_bottomall_%02d", L3_31))
              end
            end)
            L0_24(L1_25)
          end
          L0_24()
        until L0_24 == "END"
      end
      L0_24()
    until L0_24 == "END"
  end)
  _ep12_b_task = L0_23
end
function requestCrowPuppet()
  local L0_33, L1_34
  L0_33 = _puppet_crow
  return L0_33
end
function requestCrowBrain()
  local L0_35, L1_36
  L0_35 = _brain_crow
  return L0_35
end
function requestCrowSet()
  local L0_37, L1_38
  L0_37 = _crow_set
  return L0_37
end
function crow_position()
  _brain_crow:setIdling(true)
  wait(3)
  _brain_crow:setIdling(false)
  return (_puppet_crow:getWorldPos())
end
function crowSafetyWarp()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46
  L0_39 = _brain_crow
  L1_40 = L0_39
  L0_39 = L0_39.setFollowPoint
  L2_41 = false
  L0_39(L1_40, L2_41, L3_42, L4_43)
  L0_39 = _brain_crow
  L1_40 = L0_39
  L0_39 = L0_39.setAbility
  L2_41 = Supporter
  L2_41 = L2_41.Ability
  L2_41 = L2_41.Attack
  L0_39(L1_40, L2_41, L3_42)
  L0_39 = crow_position
  L0_39 = L0_39()
  L1_40 = 999
  L2_41 = 1
  for L6_45 = 1, 5 do
    L7_46 = findGameObject2
    L7_46 = L7_46("Node", string.format("locator2_crow_Relaypoint_%02d", L6_45))
    L7_46 = L7_46.getWorldPos
    L7_46 = L7_46(L7_46)
    if L1_40 > L0_39:DistanceTo(L7_46) then
      L1_40 = L0_39:DistanceTo(L7_46)
      L2_41 = L6_45
    end
  end
  _crow_move_warp = L3_42
  _crow_warp_idling = false
  L3_42()
  L6_45 = "locator2_crow_Relaypoint_%02d"
  L7_46 = L2_41
  L6_45 = "] ****"
  L3_42(L4_43)
end
function crowWarpLoc()
  local L0_47, L1_48
  L0_47 = _crow_move_warp
  return L0_47
end
function crowRooftopMove2()
  local L0_49, L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57
  L0_49 = print
  L1_50 = "***** crowRooftopMove *****"
  L0_49(L1_50)
  L0_49 = {}
  L1_50 = crow_position
  L1_50 = L1_50()
  L2_51 = _brain_crow
  L3_52 = L2_51
  L2_51 = L2_51.clearMovePoint
  L2_51(L3_52)
  L2_51 = 999
  L3_52 = 1
  for L7_56 = 1, 6 do
    if L7_56 ~= 3 and L7_56 ~= 5 then
      L8_57 = findGameObject2
      L8_57 = L8_57("Node", string.format("locator2_crow_check_%02d", L7_56))
      L8_57 = L8_57.getWorldPos
      L8_57 = L8_57(L8_57)
      if L2_51 > L1_50:DistanceTo(L8_57) then
        L2_51 = L1_50:DistanceTo(L8_57)
        L3_52 = L7_56
      end
    end
  end
  L8_57 = L3_52
  L4_53(L5_54)
  L4_53(L5_54)
  L4_53(L5_54)
  L4_53.pos = L5_54
  L8_57 = "locator2_crow_check_%02d"
  L8_57 = L7_56(L8_57, L3_52)
  L4_53.pos = L5_54
  L4_53.pos = L5_54
  L4_53()
  L4_53(L5_54, L6_55)
  L4_53(L5_54)
  L4_53(L5_54)
  repeat
    L4_53()
  until L4_53
  L4_53(L5_54)
  _crow_check_pre = L3_52
  L4_53(L5_54)
  if L4_53 == 1 then
    L0_49 = _crow_route_L
  else
    L0_49 = _crow_route_R
  end
  for L8_57, _FORV_9_ in L5_54(L6_55) do
    if _FORV_9_ == L3_52 then
      break
    end
  end
  repeat
    L5_54(L6_55)
    repeat
      L7_56()
      L8_57 = L0_49[L6_55]
    until L7_56 == false
    L8_57 = "check_%02d"
    L8_57 = print
    L8_57("building   : " .. L5_54)
    L8_57 = print
    L8_57("next_check : " .. L6_55)
    L8_57 = print
    L8_57("check_id   : " .. L7_56)
    L8_57 = _brain_crow
    L8_57 = L8_57.clearMovePoint
    L8_57(L8_57)
    L8_57 = _crow_building_move
    L8_57 = L8_57[L5_54]
    L8_57 = L8_57[L7_56]
    L8_57 = L8_57[1]
    L8_57.pos = crow_position()
    L8_57 = wait
    L8_57()
    L8_57 = _brain_crow
    L8_57 = L8_57.setMovePoints
    L8_57(L8_57, _crow_building_move[L5_54][L7_56])
    L8_57 = _brain_crow
    L8_57 = L8_57.startMovePoint
    L8_57(L8_57)
    L8_57 = print
    L8_57("***** crow moveing ****")
    repeat
      L8_57 = wait
      L8_57()
      L8_57 = _brain_crow
      L8_57 = L8_57.isMovePointEnd
      L8_57 = L8_57(L8_57)
    until L8_57
    L8_57 = print
    L8_57("***** crow move end *****")
    L8_57 = waitSeconds
    L8_57(3)
    L8_57 = wait
    L8_57()
    L8_57 = _searching_top
  until L8_57 == "END"
end
function crowMoveWarp()
  local L0_58
  L0_58 = {}
  L0_58.node_posrot = findGameObject2("Node", _crow_move_warp)
  L0_58.forced = true
  L0_58.end_idling = _crow_warp_idling
  _brain_crow:startWarpAction(L0_58)
  repeat
    wait()
  until _brain_crow:isWarpActionEnd()
  _crow_move_warp = nil
  _crow_warp_idling = nil
  _crow_move_end = true
  return true
end
function crowFollowPc()
  print("crow_follow : " .. tostring(_crow_follow))
  print("pc " .. tostring(Fn_getPcPosRot()))
  print("crow_follow_volume : " .. tostring(_crow_follow_volume))
  _brain_crow:setFollowPoint(_crow_follow, Fn_getPcPosRot(), _crow_follow_volume)
  _crow_move_end = true
end
function crowIdling(A0_59)
  print("crow idle : " .. tostring(A0_59))
  _brain_crow:setIdling(A0_59)
end
function crowAttack(A0_60)
  _brain_crow:setAbility(Supporter.Ability.Attack, A0_60)
end
function crowMoveVelocity(A0_61, A1_62)
  _brain_crow:setMoveVelocityRatio(A0_61, A1_62)
end
function moveRequest()
  local L0_63, L1_64
  L0_63 = _crow_move_request
  return L0_63
end
function requestCrowRooftopMove()
  if not _crow_move_request then
    print("***** requestCrowRooftopMove *****")
    _crow_move_request = "RooftopMove"
    _crow_move_end = false
    return true
  end
  return false
end
function requestCrowWarp(A0_65, A1_66)
  if not _crow_move_request then
    print("***** requestCrowWarp *****")
    _crow_move_request = "WARP"
    _crow_move_warp = A0_65
    _crow_warp_idling = A1_66
    _crow_move_end = false
    return true
  end
  return false
end
function isCrowMoveEnd()
  local L0_67, L1_68
  L0_67 = _crow_move_end
  return L0_67
end
function requestCrowFollowPC(A0_69, A1_70)
  if not _crow_move_request then
    print("***** requestCrowFollowPC : " .. tostring(A0_69) .. " *****")
    _crow_follow = A0_69
    _crow_follow_volume = A1_70
    _crow_move_request = "FOLLOWPC"
    _crow_move_end = false
  end
end
function crowMoveclear()
  _brain_crow:clearMovePoint()
  _crow_move_end = true
end
function requestCrowSafetyWarp()
  if not _crow_move_request then
    print("***** crowSafetyWarp *****")
    _crow_move_request = "SAFETYWARP"
    _crow_move_end = false
    return true
  end
  return false
end
function requestHandle(A0_71, A1_72)
  if findGameObject2(A0_71, A1_72) == nil then
    return nil
  else
    return (findGameObject2(A0_71, A1_72))
  end
end
function pcspheresensor2_end_OnEnter()
  local L0_73, L1_74
  _title = true
end
function isTitleStart()
  local L0_75, L1_76
  L0_75 = _title
  return L0_75
end
function pcspheresensor2_caption_01_OnEnter(A0_77)
  Fn_sensorOff(A0_77)
  _caption_01_sensor = true
end
function pcspheresensor2_caption_02_OnEnter(A0_78)
  Fn_sensorOff(A0_78)
  _caption_02_sensor = true
end
function pcspheresensor2_caption_03_OnEnter(A0_79)
  Fn_sensorOff(A0_79)
  _caption_03_sensor = true
end
function pcspheresensor2_caption_04_OnEnter(A0_80)
  Fn_sensorOff(A0_80)
  _caption_04_sensor = true
end
function pcspheresensor2_caption_05_OnEnter(A0_81)
  Fn_sensorOff(A0_81)
  _caption_05_sensor = true
end
function caption01Sensor()
  local L0_82, L1_83
  L0_82 = _caption_01_sensor
  return L0_82
end
function caption02Sensor()
  local L0_84, L1_85
  L0_84 = _caption_02_sensor
  return L0_84
end
function caption03Sensor()
  local L0_86, L1_87
  L0_86 = _caption_03_sensor
  return L0_86
end
function caption04Sensor()
  local L0_88, L1_89
  L0_88 = _caption_04_sensor
  return L0_88
end
function caption05Sensor()
  local L0_90, L1_91
  L0_90 = _caption_05_sensor
  return L0_90
end
function requestCentralTower(A0_92)
  local L1_93
  _central_tower = A0_92
end
function isCentralTower()
  local L0_94, L1_95
  L0_94 = _central_tower
  return L0_94
end
function isCentralTowerSensor()
  local L0_96, L1_97
  L0_96 = _central_tower_sensor
  return L0_96
end
function requestSearchingTop(A0_98)
  local L1_99
  _searching_top = A0_98
end
function isSearchingTop()
  local L0_100, L1_101
  L0_100 = _searching_top
  return L0_100
end
function requestSearchingBottom(A0_102)
  local L1_103
  _searching_bottom = A0_102
end
function isSearchingBottom()
  local L0_104, L1_105
  L0_104 = _searching_bottom
  return L0_104
end
function requestEntrance(A0_106)
  local L1_107
  _entrance = A0_106
end
function isEntrance()
  local L0_108, L1_109
  L0_108 = _entrance
  return L0_108
end
function pcspheresensor2_central_tower_OnEnter(A0_110)
  Fn_pcSensorOff(A0_110)
  _central_tower_sensor = true
end
function cubesensor2_rooftop_OnEnter(A0_111, A1_112)
  invokeTask(function()
    local L0_113
    L0_113 = tonumber
    L0_113 = L0_113(string.sub(A0_111:getName(), -2))
    if A1_112 ~= nil and A1_112:getName() == "player" or A1_112:getName() == "_puppet_supporter_crow" then
      _check_top_tbl[L0_113] = A1_112:getName()
    end
    if A1_112:getName() == "player" then
      _check_sensor_in[L0_113] = true
    end
  end)
end
function cubesensor2_rooftop_OnLeave(A0_114, A1_115)
  if A1_115:getName() == "player" then
    _check_sensor_in[tonumber(string.sub(A0_114:getName(), -2))] = false
  end
end
function rooftopSensorIN(A0_116)
  return _check_sensor_in[A0_116]
end
function requestRooftop()
  local L0_117
  L0_117 = _check_top_tbl
  return L0_117, table.maxn(_check_top_tbl)
end
function pccubesensor2_mistake_OnEnter(A0_118)
  invokeTask(function()
    Fn_pcSensorOff(A0_118)
    _check_sub_tbl[tonumber(string.sub(A0_118:getName(), -2))] = true
  end)
end
function requestMistake()
  local L0_119
  L0_119 = _check_sub_tbl
  return L0_119, table.maxn(_check_sub_tbl)
end
function pccubesensor2_bottomstart_OnEnter(A0_120, A1_121)
  Fn_pcSensorOff(A0_120)
  _bottom_start = true
end
function requestBottomStart()
  local L0_122, L1_123
  L0_122 = _bottom_start
  return L0_122
end
function pccubesensor2_bottom_OnEnter(A0_124, A1_125)
  print("**** bottom : " .. A0_124:getName() .. " ****")
  invokeTask(function()
    _check_bot_tbl[tonumber(string.sub(A0_124:getName(), -2))] = true
  end)
end
function pccubesensor2_bottom_OnLeave(A0_126, A1_127)
  invokeTask(function()
    _check_bot_tbl[tonumber(string.sub(A0_126:getName(), -2))] = false
  end)
end
function requestBottom()
  local L0_128
  L0_128 = _check_bot_tbl
  return L0_128, table.maxn(_check_bot_tbl)
end
function bottomSensor(A0_129, A1_130)
  local L2_131
  if A1_130 then
    L2_131 = Fn_pcSensorOn
    L2_131(string.format("pccubesensor2_bottom_%02d", A0_129))
  else
    L2_131 = Fn_pcSensorOff
    L2_131(string.format("pccubesensor2_bottom_%02d", A0_129))
  end
end
function pccubesensor2_bottomall_OnEnter(A0_132, A1_133)
  print("******** bottomALL sensor : " .. A0_132:getName() .. " ********")
  Fn_pcSensorOff(A0_132)
  _bottom_outside = true
  EventHelper:timerCallback("sensor_on", 30, function()
    Fn_pcSensorOn(A0_132)
    _bottom_outside = false
  end)
end
function requestBottomAll()
  local L0_134, L1_135
  L0_134 = _bottom_outside
  return L0_134
end
function pccubesensor2_bottomend_OnEnter(A0_136, A1_137)
  print("******** bottomEND sensor : " .. A0_136:getName() .. " ********")
  Fn_pcSensorOff(A0_136)
  _bottom_end = true
  EventHelper:timerCallback("sensor_on", 30, function()
    Fn_pcSensorOn(A0_136)
    _bottom_end = false
  end)
end
function requestBottomEnd()
  local L0_138, L1_139
  L0_138 = _bottom_end
  return L0_138
end
function pccubesensor2_entrance_OnEnter(A0_140)
  Fn_pcSensorOff(A0_140)
  _entrance_sensor = true
end
function isEntranceSensor()
  local L0_141, L1_142
  L0_141 = _entrance_sensor
  return L0_141
end
function entrance_check_eye()
  local L0_143, L1_144, L2_145, L3_146
  L0_143 = false
  L1_144 = false
  for _FORV_5_, _FORV_6_ in L2_145(L3_146) do
    if _FORV_6_.hdl ~= nil then
      _FORV_6_.insight = Fn_isInSightTarget(_FORV_6_.hdl)
      if _FORV_6_.insight then
        L1_144 = true
      end
    end
  end
  if L1_144 then
    L2_145.y = L2_145.y + 1.2
    Query:setEyeSightTransform(L2_145, L3_146)
    Query:setEyeSightAngle(Deg2Rad(360))
    Query:setEyeSightRange(30)
    for _FORV_7_, _FORV_8_ in ipairs(_eyesight) do
      if _FORV_8_.insight then
        _FORV_8_.sphere = Query:checkEyeSightSphere(_FORV_8_.pos, 3)
        _FORV_8_.raycast = Query:raycastEyeSight(_FORV_8_.pos)
        if _FORV_8_.sphere == true and _FORV_8_.raycast == nil then
          L0_143 = true
        end
      end
    end
  else
  end
  return L0_143
end
function pccubesensor2_catwarp_ep12_OnLeave()
  invokeTask(function()
    Fn_setCatWarpCheckPoint(string.format("locator2_pc_catwarp_%s", Fn_getMissionPart()))
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_warning_ep12_OnLeave()
  print("catwarp warning")
  catwarpWarning("ep12_09016")
end
function catwarpWarning(A0_147)
  invokeTask(function()
    Player:setStay(true)
    waitSeconds(0.3)
    Player:setStay(false)
    Fn_captionViewWait(A0_147)
  end)
end
function Finalize()
  Area:setForceSceneParams("")
end
