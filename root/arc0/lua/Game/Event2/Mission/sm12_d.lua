dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm12_common.lua")
import("Vehicle")
ROUTE_MAX = 12
BIKE_SPEED = {
  STOP = 0,
  MIN = 4,
  LOW = 8,
  MID = 16,
  HIGH = 25,
  MAX = 10
}
WRITER_DIST = {
  LOST = 200,
  BREAK_CAR = 60,
  RESCUE_CAP = 40,
  GRAB = 10,
  LOST02 = 130,
  VOICE = 130
}
EVENT_TIME = {
  ESCAPE01 = 300,
  ESCAPE02 = 600,
  ESCAPE03 = 1200,
  ESCAPE04 = 8000,
  ESCAPE05 = 10000,
  RESCUE_FAILED = 550
}
GEM_CREATE_COUNT_SET = 190
GEM_CREATE_COUNT_INIT = 50
PHASE01 = 1
PHASE02 = 2
PHASE03 = 3
GEM_MAX = 3
_puppet_tbl = {}
_npc_tbl = {}
_event_sw = 1
_script_ship = {
  ship = nil,
  pos_route_tbl = nil,
  route_object = nil
}
FLY_ROUTE_MAX = 17
FLY_MAX = 20
_fly_route = {
  {
    num = 1,
    node = "locator2_writer_fly_01"
  },
  {
    num = 2,
    node = "locator2_writer_fly_02"
  },
  {
    num = 3,
    node = "locator2_writer_fly_03"
  },
  {
    num = 4,
    node = "locator2_writer_fly_04"
  },
  {
    num = 5,
    node = "locator2_writer_fly_05"
  },
  {
    num = 6,
    node = "locator2_writer_fly_06"
  },
  {
    num = 7,
    node = "locator2_writer_fly_07"
  },
  {
    num = 8,
    node = "locator2_writer_fly_08"
  },
  {
    num = 9,
    node = "locator2_writer_fly_09"
  },
  {
    num = 10,
    node = "locator2_writer_fly_10"
  },
  {
    num = 11,
    node = "locator2_writer_fly_11"
  },
  {
    num = 12,
    node = "locator2_writer_fly_12"
  },
  {
    num = 13,
    node = "locator2_writer_fly_13"
  },
  {
    num = 14,
    node = "locator2_writer_fly_14"
  },
  {
    num = 15,
    node = "locator2_writer_fly_15"
  },
  {
    num = 16,
    node = "locator2_writer_fly_16"
  },
  {
    num = 17,
    node = "locator2_writer_fly_17"
  },
  {
    num = 18,
    node = "locator2_writer_fly_18"
  },
  {
    num = 19,
    node = "locator2_writer_fly_19"
  },
  {
    num = 20,
    node = "locator2_writer_fly_20"
  }
}
_fly_bd_route = {
  {
    num = 1,
    node = "locator2_writer_bd_fly_01"
  },
  {
    num = 2,
    node = "locator2_writer_bd_fly_02"
  },
  {
    num = 3,
    node = "locator2_writer_bd_fly_03"
  },
  {
    num = 4,
    node = "locator2_writer_bd_fly_04"
  },
  {
    num = 5,
    node = "locator2_writer_bd_fly_05"
  },
  {
    num = 6,
    node = "locator2_writer_bd_fly_06"
  },
  {
    num = 7,
    node = "locator2_writer_bd_fly_07"
  },
  {
    num = 8,
    node = "locator2_writer_bd_fly_08"
  },
  {
    num = 9,
    node = "locator2_writer_bd_fly_09"
  },
  {
    num = 10,
    node = "locator2_writer_bd_fly_10"
  },
  {
    num = 11,
    node = "locator2_writer_bd_fly_11"
  },
  {
    num = 12,
    node = "locator2_writer_bd_fly_12"
  },
  {
    num = 13,
    node = "locator2_writer_bd_fly_13"
  },
  {
    num = 14,
    node = "locator2_writer_bd_fly_14"
  },
  {
    num = 15,
    node = "locator2_writer_bd_fly_15"
  },
  {
    num = 16,
    node = "locator2_writer_bd_fly_16"
  },
  {
    num = 17,
    node = "locator2_writer_bd_fly_17"
  },
  {
    num = 18,
    node = "locator2_writer_bd_fly_18"
  },
  {
    num = 19,
    node = "locator2_writer_bd_fly_19"
  },
  {
    num = 20,
    node = "locator2_writer_bd_fly_20"
  }
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "dummy",
      type = "man48",
      node = "locator2_dummy_01",
      reset = false
    },
    {
      name = "writer",
      type = "man68",
      node = "locator2_writer_start_harbor",
      reset = false
    },
    {
      name = "writer_end",
      type = "man68",
      node = "locator2_writer_end",
      not_mob = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_harbor_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_04")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_04")
  _sdemo_cut01 = SDemo.create("sm12_d_01")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
end
_WRITER_POSE = {
  RIDE01 = "man01_vbike01_stay_l_in_00",
  RIDE02 = "man01_vbike02_stay_l_in_00",
  RIDE_STAY = "man01_vbike01_stay_00"
}
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  L0_1 = Fn_findNpc
  L1_2 = "writer_end"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.ignoreStoop
  L0_1(L1_2)
  L0_1 = Fn_setNpcVisible
  L1_2 = "writer_end"
  L0_1(L1_2, L2_3)
  while true do
    L0_1 = Vehicle
    L1_2 = L0_1
    L0_1 = L0_1.isReady
    L0_1 = L0_1(L1_2)
    if not L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_setNpcActive
  L1_2 = "sm12_client"
  L0_1(L1_2, L2_3)
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    L5_6
  }
  L1_2 = {}
  L1_2.pos = "locator2_writer_fly_04"
  L1_2.attr = "fly"
  L2_3.pos = "locator2_writer_fly_05"
  L2_3.attr = "fly"
  L3_4.pos = "locator2_writer_fly_06"
  L3_4.attr = "fly"
  L4_5.pos = "locator2_writer_fly_07"
  L4_5.attr = "fly"
  L5_6.pos = "locator2_writer_fly_08"
  L5_6.attr = "fly"
  L1_2 = {}
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = findGameObject2
    L8_9 = "Node"
    L9_10 = L6_7.node
    L7_8 = L7_8(L8_9, L9_10)
    L8_9 = L7_8
    L7_8 = L7_8.getWorldPos
    L7_8 = L7_8(L8_9)
    L1_2[L5_6] = L7_8
  end
  L2_3.pos_route_tbl = L1_2
  for L6_7 = 1, GEM_MAX do
    L7_8 = Mv_createGem
    L8_9 = findGameObject2
    L9_10 = "Node"
    L10_11 = "locator2_egem_"
    L11_12 = string
    L11_12 = L11_12.format
    L12_13 = "%02d"
    L13_14 = L6_7
    L11_12 = L11_12(L12_13, L13_14)
    L10_11 = L10_11 .. L11_12
    L8_9 = L8_9(L9_10, L10_11)
    L9_10 = 4
    L7_8 = L7_8(L8_9, L9_10)
    L2_3[L6_7] = L7_8
  end
  L6_7 = _script_ship
  L6_7 = L6_7.pos_route_tbl
  L7_8 = "ForScript01"
  L8_9 = "esc_ship"
  L6_7 = L5_6(L6_7, L7_8, L8_9)
  L4_5.route_object = L6_7
  L3_4.ship = L5_6
  L6_7 = "Node"
  L7_8 = "locator2_ve02_01"
  L6_7 = L5_6
  L20_21 = L5_6(L6_7)
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L5_6(L6_7))
  L3_4(L4_5, L5_6)
  L3_4(L4_5, L5_6)
  L3_4(L4_5, L5_6)
  L3_4()
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4()
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5()
  L6_7 = false
  L4_5(L5_6, L6_7)
  L6_7 = true
  L4_5(L5_6, L6_7)
  L4_5(L5_6)
  L4_5(L5_6)
  L4_5(L5_6)
  L6_7 = "Node"
  L7_8 = L5_6
  L6_7 = L5_6.setName
  L8_9 = "pc_eye"
  L6_7(L7_8, L8_9)
  L7_8 = L5_6
  L6_7 = L5_6.setPos
  L6_7(L7_8)
  L7_8 = L5_6
  L6_7 = L5_6.setWorldPos
  L8_9 = Vector
  L9_10 = 0
  L10_11 = 1.5
  L11_12 = 0
  L8_9 = L8_9(L9_10, L10_11, L11_12)
  L8_9 = L4_5 + L8_9
  L6_7(L7_8, L8_9)
  L7_8 = L5_6
  L6_7 = L5_6.setForceMove
  L6_7(L7_8)
  L6_7 = start_game_obj
  L6_7()
  L6_7 = Fn_loadNpcEventMotion
  L7_8 = "writer"
  L8_9 = _WRITER_POSE
  L6_7(L7_8, L8_9)
  L6_7 = Fn_getPlayer
  L6_7 = L6_7()
  L7_8 = L6_7
  L6_7 = L6_7.setCollidable
  L8_9 = false
  L6_7(L7_8, L8_9)
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.getPuppet
  L6_7 = L6_7(L7_8)
  L8_9 = L6_7
  L7_8 = L6_7.setVisible
  L9_10 = false
  L7_8(L8_9, L9_10)
  L7_8 = Fn_setCatActive
  L8_9 = false
  L7_8(L8_9)
  L7_8 = _sdemo_cut01
  L8_9 = L7_8
  L7_8 = L7_8.set
  L9_10 = "pc_eye"
  L10_11 = _puppet_tbl
  L10_11 = L10_11.writer
  L11_12 = true
  L12_13 = Vector
  L13_14 = 0
  L14_15 = 1.5
  L15_16 = 0
  L20_21 = L12_13(L13_14, L14_15, L15_16)
  L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L12_13(L13_14, L14_15, L15_16))
  L7_8 = _sdemo_cut01
  L8_9 = L7_8
  L7_8 = L7_8.play
  L7_8(L8_9)
  repeat
    L7_8 = wait
    L7_8()
    L7_8 = Fn_findNpc
    L8_9 = "writer"
    L7_8 = L7_8(L8_9)
    L8_9 = L7_8
    L7_8 = L7_8.isMoveEnd
    L7_8 = L7_8(L8_9)
  until L7_8
  L7_8 = _sdemo_cut01
  L8_9 = L7_8
  L7_8 = L7_8.zoomIn
  L9_10 = 1
  L10_11 = {}
  L10_11.deg = 20
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = Fn_playMotionNpc
  L8_9 = "writer"
  L9_10 = "man01_vbike02_stay_l_in_00"
  L10_11 = false
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = waitSeconds
  L8_9 = 0.45
  L7_8(L8_9)
  L7_8 = _script_ship
  L7_8 = L7_8.ship
  L8_9 = L7_8
  L7_8 = L7_8.setPilot
  L9_10 = Fn_findNpcPuppet
  L10_11 = "writer"
  L9_10 = L9_10(L10_11)
  L10_11 = "loc_driver1"
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = invokeTask
  function L8_9()
    local L0_22
    L0_22 = {}
    L0_22.isStop = true
    L0_22.animBlendDuration = 0.25
    Fn_playMotionNpc("writer", "man01_vbike01_stay_00", false, L0_22)
    waitSeconds(3)
  end
  L7_8(L8_9)
  L7_8 = _script_ship
  L7_8 = L7_8.ship
  L8_9 = L7_8
  L7_8 = L7_8.procHorn
  L9_10 = false
  L7_8(L8_9, L9_10)
  L7_8 = waitSeconds
  L8_9 = 1.2
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L8_9 = "sm12_01300k"
  L7_8(L8_9)
  L7_8 = _script_ship
  L7_8 = L7_8.ship
  L8_9 = L7_8
  L7_8 = L7_8.setBaseSpeed
  L9_10 = BIKE_SPEED
  L9_10 = L9_10.HIGH
  L7_8(L8_9, L9_10)
  L7_8 = _script_ship
  L7_8 = L7_8.ship
  L8_9 = L7_8
  L7_8 = L7_8.setCurrSpeed
  L9_10 = 0
  L7_8(L8_9, L9_10)
  L7_8 = Fn_captionViewWait
  L8_9 = "sm12_03002"
  L7_8(L8_9)
  L7_8 = waitSeconds
  L8_9 = 1
  L7_8(L8_9)
  L8_9 = L6_7
  L7_8 = L6_7.setVisible
  L9_10 = true
  L7_8(L8_9, L9_10)
  L7_8 = Fn_setCatActive
  L8_9 = true
  L7_8(L8_9)
  L7_8 = Fn_getPlayer
  L7_8 = L7_8()
  L8_9 = L7_8
  L7_8 = L7_8.setCollidable
  L9_10 = true
  L7_8(L8_9, L9_10)
  L7_8 = _sdemo_cut01
  L8_9 = L7_8
  L7_8 = L7_8.stop
  L9_10 = 2
  L7_8(L8_9, L9_10)
  L7_8 = Player
  L8_9 = L7_8
  L7_8 = L7_8.setStay
  L9_10 = false
  L7_8(L8_9, L9_10)
  L7_8 = Fn_captionView
  L8_9 = "sm12_03003"
  L7_8(L8_9)
  L7_8 = Fn_naviSet
  L8_9 = _puppet_tbl
  L8_9 = L8_9.writer
  L7_8(L8_9)
  L7_8 = false
  L8_9 = 0
  L9_10 = PHASE01
  L10_11, L11_12, L12_13, L13_14 = nil, nil, nil, nil
  L14_15 = {}
  L15_16 = GEM_CREATE_COUNT_INIT
  while true do
    if L7_8 then
      L16_17 = Fn_blackout
      L16_17()
      if L10_11 ~= nil then
        L16_17 = Fn_setAlpha
        L20_21 = 1
        L16_17(L17_18, L18_19, L19_20, L20_21)
        L16_17 = L10_11.stop
        L16_17(L17_18)
        L16_17 = L10_11.setActive
        L16_17(L17_18, L18_19)
        L16_17 = L10_11.kill
        L16_17(L17_18)
        L10_11 = nil
      end
      if L11_12 ~= nil then
        L16_17 = Fn_setAlpha
        L20_21 = 1
        L16_17(L17_18, L18_19, L19_20, L20_21)
        L16_17 = L11_12.stop
        L16_17(L17_18)
        L16_17 = L11_12.setActive
        L16_17(L17_18, L18_19)
        L16_17 = L11_12.kill
        L16_17(L17_18)
        L11_12 = nil
      end
      if L12_13 ~= nil then
        L16_17 = Fn_setAlpha
        L20_21 = 1
        L16_17(L17_18, L18_19, L19_20, L20_21)
        L16_17 = L12_13.stop
        L16_17(L17_18)
        L16_17 = L12_13.setActive
        L16_17(L17_18, L18_19)
        L16_17 = L12_13.kill
        L16_17(L17_18)
        L12_13 = nil
      end
      L16_17 = {}
      for L20_21, _FORV_21_ in L17_18(L18_19) do
        if 2 < _FORV_21_.num then
          L16_17[L20_21 - 2] = findGameObject2("Node", _FORV_21_.node):getWorldPos()
        end
      end
      L17_18.pos_route_tbl = L16_17
      L17_18(L18_19, L19_20)
      L20_21 = 0.2
      L17_18(L18_19, L19_20, L20_21, 1)
      L17_18(L18_19, L19_20)
      L20_21 = "Node"
      L20_21 = L19_20
      L20_21 = L19_20(L20_21)
      L17_18(L18_19, L19_20, L20_21, L19_20(L20_21))
      L20_21 = _script_ship
      L20_21 = L20_21.pos_route_tbl
      L17_18.ship_route = L18_19
      L17_18(L18_19, L19_20)
      L20_21 = false
      L17_18(L18_19, L19_20, L20_21)
      L17_18(L18_19)
      L20_21 = Player
      L20_21 = L20_21.getEnergyMax
      L20_21 = L20_21(L20_21, Player.kEnergy_Gravity)
      L17_18(L18_19, L19_20, L20_21, true)
      for L20_21 = 1, GEM_MAX do
        L2_3[L20_21]:try_init()
      end
      L17_18(L18_19, L19_20)
      L17_18(L18_19, L19_20)
      L13_14 = L17_18
      for L20_21, _FORV_21_ in L17_18(L18_19) do
        _FORV_21_:try_term()
      end
      GEM_CREATE_COUNT_SET = 210
      L15_16 = GEM_CREATE_COUNT_INIT
      L17_18()
      L17_18(L18_19, L19_20)
      L17_18(L18_19)
      L7_8 = false
      L17_18(L18_19)
    end
    if L13_14 == nil then
      L16_17 = invokeTask
      L16_17 = L16_17(L17_18)
      L13_14 = L16_17
    end
    L16_17 = PHASE01
    if L9_10 == L16_17 then
      L16_17 = Fn_missionView
      L16_17(L17_18)
      L16_17 = waitSeconds
      L16_17(L17_18)
      if L8_9 == 0 then
        L16_17 = invokeTask
        L16_17 = L16_17(L17_18)
      elseif L8_9 == 1 then
        L16_17 = Fn_captionView
        L16_17(L17_18)
      else
        L16_17 = Fn_captionView
        L16_17(L17_18)
      end
      L16_17 = _script_ship
      L16_17 = L16_17.ship
      L16_17 = L16_17.setBaseSpeed
      L16_17(L17_18, L18_19)
      L16_17 = _script_ship
      L16_17 = L16_17.ship
      L16_17 = L16_17.setCurrSpeed
      L16_17(L17_18, L18_19)
      L16_17 = 0
      while true do
        if L18_19 > L19_20 then
          L19_20()
          function L20_21()
            Fn_setNpcActive("writer", false)
            Fn_setAlpha(_script_ship.ship, false, 0.1, 1)
            _script_ship.ship:setVisible(false)
          end
          L19_20(L20_21)
          L20_21 = L19_20
          L19_20(L20_21, true)
          L19_20()
          L20_21 = 0.5
          L19_20(L20_21)
          L20_21 = "sm12_03007"
          L19_20(L20_21)
          L8_9 = 1
          L7_8 = true
          L20_21 = L19_20
          L19_20(L20_21, false)
          break
        else
          if L18_19 < L19_20 then
            L9_10 = PHASE02
            GEM_CREATE_COUNT_SET = 220
        end
        else
          L16_17 = L16_17 + 1
          if L19_20 == 1 then
            if L16_17 > L19_20 then
              _event_sw = L19_20
              L20_21 = L19_20
              L19_20(L20_21, BIKE_SPEED.MID - _event_sw)
              L20_21 = L19_20
              L19_20(L20_21, 0)
            end
          elseif L19_20 == 2 then
            if L16_17 > L19_20 then
              L20_21 = L19_20
              L19_20(L20_21, BIKE_SPEED.MID - _event_sw + 1)
              L20_21 = L19_20
              L19_20(L20_21, 0)
              _event_sw = L19_20
            end
          elseif L19_20 == 3 then
            if L16_17 > L19_20 then
              L20_21 = L19_20
              L19_20(L20_21, BIKE_SPEED.MID - _event_sw + 2)
              L20_21 = L19_20
              L19_20(L20_21, 0)
              _event_sw = L19_20
            end
          elseif L19_20 == 4 then
            if L16_17 > L19_20 then
              L20_21 = L19_20
              L19_20(L20_21, BIKE_SPEED.LOW)
              L20_21 = L19_20
              L19_20(L20_21, 0)
              _event_sw = L19_20
            end
          else
            if L19_20 == 5 then
              if L16_17 > L19_20 then
                L20_21 = L19_20
                L19_20(L20_21, BIKE_SPEED.MIN)
                L20_21 = L19_20
                L19_20(L20_21, 0)
              end
            else
            end
          end
          L19_20()
          else
            L16_17 = PHASE02
            if L9_10 == L16_17 then
              L16_17 = Fn_captionViewWait
              L16_17(L17_18)
              L16_17 = Fn_lookAtObject
              L16_17 = L16_17(L17_18)
              L17_18(L18_19, L19_20)
              L17_18(L18_19)
              L17_18()
              L17_18(L18_19, L19_20)
              L20_21 = _script_ship
              L20_21 = L20_21.ship
              L10_11 = L17_18
              L20_21 = _script_ship
              L20_21 = L20_21.ship
              L12_13 = L17_18
              L17_18(L18_19, L19_20)
              L17_18(L18_19, L19_20)
              loop_task = L17_18
              if L17_18 ~= nil then
                L18_19.pos_route_tbl = L19_20
                L20_21 = L19_20
                L18_19.ship_route = L19_20
                L20_21 = _script_ship
                L20_21 = L20_21.ship_route
                L18_19(L19_20, L20_21)
              end
              L18_19(L19_20)
              L20_21 = L19_20
              L19_20(L20_21, BIKE_SPEED.MIN)
              L20_21 = L19_20
              L19_20(L20_21, 0)
              L20_21 = 2
              L19_20(L20_21)
              L20_21 = L16_17
              L19_20(L20_21)
              L20_21 = "sm12_01400k"
              L19_20(L20_21)
              if L10_11 ~= nil then
                L20_21 = L10_11
                L19_20(L20_21, false, 1, 1)
                L20_21 = L10_11
                L19_20(L20_21)
                L20_21 = L10_11
                L19_20(L20_21, false)
                L20_21 = L10_11
                L19_20(L20_21)
                L10_11 = nil
              end
              if L11_12 ~= nil then
                L20_21 = L11_12
                L19_20(L20_21, false, 1, 1)
                L20_21 = L11_12
                L19_20(L20_21)
                L20_21 = L11_12
                L19_20(L20_21, false)
                L20_21 = L11_12
                L19_20(L20_21)
                L11_12 = nil
              end
              L20_21 = _puppet_tbl
              L20_21 = L20_21.writer
              L19_20(L20_21)
              function L20_21()
                Fn_captionViewWait("sm12_03009")
                Fn_missionView("sm12_03010")
              end
              L19_20(L20_21)
              L20_21 = invokeTask
              L20_21(function()
                while true do
                  if WRITER_DIST.RESCUE_CAP > Fn_getDistanceToPlayer(_puppet_tbl.writer) then
                    print("\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\232\161\168\231\164\186\232\183\157\233\155\162", WRITER_DIST.RESCUE_CAP)
                    Fn_captionViewWait("sm12_03011")
                    L19_20 = true
                    break
                  end
                  wait()
                end
              end)
              L20_21 = false
              while 0 < EVENT_TIME.RESCUE_FAILED and (WRITER_DIST.GRAB < Fn_getDistanceToPlayer(_puppet_tbl.writer) or Pad:getButton(Pad.kButton_RR) == false) do
                if Fn_getDistanceToPlayer(_puppet_tbl.writer) > WRITER_DIST.LOST02 then
                end
                wait()
              end
              L13_14:abort()
              invokeTask(function()
                while not L19_20 do
                  wait()
                end
                while true do
                  if WRITER_DIST.GRAB < Fn_getDistanceToPlayer(_puppet_tbl.writer) then
                    Fn_setGrabNpc("writer", true, true)
                    Fn_tutorialCaptionKill()
                    print("\227\130\176\227\131\169\227\131\150\228\184\141\229\143\175")
                    L20_21 = false
                    wait()
                  elseif not L20_21 then
                    Fn_tutorialCaption("grab")
                    L20_21 = true
                    print("\227\130\176\227\131\169\227\131\150\232\168\177\229\143\175")
                  end
                  wait()
                end
              end):abort()
              Fn_naviKill()
              if WRITER_DIST.GRAB < Fn_getDistanceToPlayer(_puppet_tbl.writer) or Pad:getButton(Pad.kButton_RR) == false then
                L11_12 = Fn_createEffect("exp2", "ef_com_exp_02", _script_ship.ship, false)
                Sound:playSE("ene_robot_missile_hit")
                invokeTask(function()
                  Fn_setNpcActive("writer", false)
                  Fn_setAlpha(_script_ship.ship, false, 1.5, 10)
                  _script_ship.ship:setVisible(false)
                end)
                waitSeconds(1)
                Fn_captionViewWait("sm12_03012")
                L8_9 = 2
                L9_10 = PHASE01
                L7_8 = true
              else
                break
              end
            else
            end
          end
        end
      end
    L16_17 = wait
    L16_17()
  end
  L16_17 = Player
  L16_17 = L16_17.setStay
  L16_17(L17_18, L18_19)
  L16_17 = Fn_getGameObject
  L16_17 = L16_17(L17_18)
  L20_21 = "habena"
  L20_21 = "up_a_02_02"
  L20_21 = L19_20
  L19_20(L20_21, Fn_findNpcPuppet("writer"), L18_19)
  function L20_21()
    Fn_playMotionNpc("writer", "stay")
  end
  L19_20(L20_21)
  L20_21 = "writer"
  L19_20(L20_21, false, false)
  L20_21 = L19_20
  L19_20(L20_21, _puppet_tbl.writer)
  function L20_21()
    local L0_23, L1_24
    L0_23 = print
    L1_24 = "\230\156\128\229\136\157\227\129\174\228\189\156\229\174\182\227\129\168\227\129\174\232\183\157\233\155\162"
    L0_23(L1_24, Fn_getDistanceToPlayer(_puppet_tbl.writer))
    L0_23 = {L1_24}
    L1_24 = {}
    L1_24.pos = Fn_getPlayerWorldPos()
    L1_24.attr = "fly"
    L1_24 = {}
    L1_24.anim_lp = {"grabbed"}
    Fn_fly("writer", L0_23, L1_24)
    Fn_setGrabNpc("writer", false, false)
    Player:setGrabObject(_puppet_tbl.writer)
    print("\230\156\128\231\181\130\231\154\132\227\129\170\228\189\156\229\174\182\227\129\168\227\129\174\232\183\157\233\155\162", Fn_getDistanceToPlayer(_puppet_tbl.writer))
  end
  L19_20(L20_21)
  L20_21 = "sm12_03013"
  L19_20(L20_21)
  L20_21 = L19_20
  L19_20(L20_21, Camera.kPlayer, Camera.kControl_All, false)
  if L12_13 ~= nil then
    L20_21 = L12_13
    L19_20(L20_21)
    L20_21 = L12_13
    L19_20(L20_21, false)
    L20_21 = L12_13
    L19_20(L20_21)
    L12_13 = nil
  end
  L20_21 = _script_ship
  L20_21 = L20_21.ship
  L20_21 = waitSeconds
  L20_21(2)
  L20_21 = Fn_createEffect
  L20_21 = L20_21("exp2", "ef_com_exp_01", _script_ship.ship, false)
  e_b3_task = L20_21
  L20_21 = Sound
  L20_21 = L20_21.playSE
  L20_21(L20_21, "ene_robot_missile_hit")
  L20_21 = invokeTask
  L20_21(function()
    Fn_setAlpha(_script_ship.ship, false, 1.5, 10)
    _script_ship.ship:setVisible(false)
  end)
  L20_21 = waitSeconds
  L20_21(1.3)
  L9_10 = PHASE03
  L20_21 = Mv_safeTaskAbort
  L20_21 = L20_21(se_task)
  se_task = L20_21
  L20_21 = waitSeconds
  L20_21(2)
  L20_21 = Fn_kaiwaDemoView
  L20_21("sm12_01500k")
  L20_21 = Fn_pcSensorOff
  L20_21("pccubesensor2_catwarp_warning_04")
  L20_21 = Fn_pcSensorOff
  L20_21("pccubesensor2_catwarp_area_04")
  L20_21 = waitSeconds
  L20_21(1)
  L20_21 = Fn_blackout
  L20_21(1)
  L20_21 = Mv_safeTaskAbort
  L20_21 = L20_21(L19_20)
  L20_21 = _script_ship
  L20_21 = L20_21.ship
  L20_21 = L20_21.setVisible
  L20_21(L20_21, false)
  L20_21 = e_b3_task
  if L20_21 ~= nil then
    L20_21 = e_b3_task
    L20_21 = L20_21.stop
    L20_21(L20_21)
    L20_21 = e_b3_task
    L20_21 = L20_21.setActive
    L20_21(L20_21, false)
    L20_21 = e_b3_task
    L20_21 = L20_21.kill
    L20_21(L20_21)
    e_b3_task = nil
  end
  L20_21 = Player
  L20_21 = L20_21.dropGrabObject
  L20_21(L20_21)
  L20_21 = Fn_disappearNpc
  L20_21("writer")
  L20_21 = Fn_warpNpc
  L20_21("writer", "locator2_writer_end")
  L20_21 = Fn_setNpcVisible
  L20_21("writer_end", true)
  L20_21 = Fn_setNpcActive
  L20_21("sm12_client", true)
  L20_21 = Fn_warpNpc
  L20_21("sm12_client", "locator2_client_end")
  L20_21 = Fn_resetPcPos
  L20_21("locator2_pc_end")
  L20_21 = Fn_watchNpc
  L20_21("sm12_client", false)
  L20_21 = Fn_watchNpc
  L20_21("writer_end", false)
  L20_21 = Fn_fadein
  L20_21(1)
  L20_21 = waitSeconds
  L20_21(1)
  L20_21 = Fn_kaiwaDemoView
  L20_21("sm12_01600k")
  L20_21 = waitSeconds
  L20_21(0.5)
  L20_21 = Player
  L20_21 = L20_21.setStay
  L20_21(L20_21, false)
  L20_21 = Camera
  L20_21 = L20_21.setControl
  L20_21(L20_21, Camera.kPlayer, Camera.kControl_All, true)
  L20_21 = Fn_setKeepPlayerPos
  L20_21()
  L20_21 = Fn_setNextMissionFlag
  L20_21()
  L20_21 = Fn_nextMission
  L20_21()
  L20_21 = Fn_exitSandbox
  L20_21()
end
function Finalize()
  local L0_25, L1_26
end
function createGem(A0_27, A1_28)
  local L2_29, L3_30, L4_31
  L3_30 = A0_27
  L2_29 = A0_27.getName
  L2_29 = L2_29(L3_30)
  L3_30 = createGameObject2
  L4_31 = "Gem"
  L3_30 = L3_30(L4_31)
  L4_31 = L3_30.setGemModelNo
  L4_31(L3_30, A1_28)
  L4_31 = A0_27.getWorldPos
  L4_31 = L4_31(A0_27)
  L4_31 = L4_31 + Vector(0, 0, 0)
  L3_30:setWorldPos(L4_31)
  L3_30:setForceMove()
  L3_30:setVisible(true)
  L3_30:try_init()
  L3_30:waitForReadyAsync(function()
    L3_30:try_start()
  end)
  return L3_30
end
function pccubesensor2_harbor_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_harbor_01")
  _mv_is_goto_next_phase = true
end
function pccubesensor2_catwarp_warning_04_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_04_OnLeave()
  comCatWarpWarning("sm12_03014", nil)
end
function pccubesensor2_catwarp_area_04_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function CreateScriptVehicle(A0_32, A1_33, A2_34)
  local L3_35, L4_36
  L3_35 = Vehicle
  L4_36 = L3_35
  L3_35 = L3_35.spawnRoute
  L3_35 = L3_35(L4_36, A0_32, g_own)
  L4_36 = Vehicle
  L4_36 = L4_36.spawnVehicle
  L4_36 = L4_36(L4_36, A1_33, g_own)
  L4_36:setName(A2_34)
  L4_36:attach(L3_35)
  return L4_36, L3_35
end
function bikeBreakDownRoute()
  local L0_37, L1_38, L2_39, L3_40, L4_41
  L0_37 = _script_ship
  L0_37 = L0_37.ship
  L1_38 = L0_37
  L0_37 = L0_37.getWorldPos
  L0_37 = L0_37(L1_38)
  L1_38 = nil
  L2_39 = 0
  L3_40 = 300
  L4_41 = 1
  for _FORV_8_, _FORV_9_ in pairs(_fly_route) do
    print(tostring(_FORV_9_.node))
    L1_38 = findGameObject2("Node", _FORV_9_.node):getWorldPos()
    buf = Fn_get_distance(L0_37, L1_38)
    if buf > 20 and L4_41 <= _FORV_9_.num and L3_40 > buf then
      L4_41 = _FORV_9_.num
      L3_40 = buf
    end
  end
  if L4_41 >= ROUTE_MAX - 2 then
    for _FORV_10_, _FORV_11_ in pairs(_fly_bd_route) do
      ;({})[1] = findGameObject2("Node", _FORV_11_.node):getWorldPos()
    end
    print("\229\136\157\230\156\159\228\189\141\231\189\174\227\129\139\227\130\137\232\144\189\228\184\139\229\139\149\228\189\156\227\129\184")
    return {}
  end
  print("\227\131\144\227\130\164\227\130\175\227\131\171\227\131\188\227\131\136\227\129\174\233\129\184\229\174\154\227\128\129\231\149\170\229\143\183" .. L4_41 .. "\227\128\129\232\183\157\233\155\162:" .. L3_40)
  for _FORV_10_, _FORV_11_ in pairs(_fly_bd_route) do
    if L4_41 <= _FORV_10_ then
      ;({})[1 + 1] = findGameObject2("Node", _FORV_11_.node):getWorldPos()
    end
  end
  return {}
end
