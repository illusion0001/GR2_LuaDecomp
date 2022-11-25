dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
PHASE_WAIT = 0
PHASE_FREIGHTER_STEALTH_SDEMO_INIT = 1
PHASE_FREIGHTER_STEALTH_SDEMO_INIT_END = 2
PHASE_FREIGHTER_STEALTH_SDEMO = 3
PHASE_FREIGHTER_STEALTH_SDEMO_END = 4
PHASE_FREIGHTER_STEALTH_C_INIT = 5
PHASE_FREIGHTER_STEALTH_C_INIT_END = 6
PHASE_FREIGHTER_STEALTH_D_INIT = 7
PHASE_FREIGHTER_STEALTH_D_INIT_END = 8
PHASE_FREIGHTER_STEALTH_MAIN = 9
PHASE_FREIGHTER_STEALTH_MAIN_END = 10
PHASE_FREIGHTER_STEALTH_MAIN_RESTART = 11
FREIGHTER_NAME = "ve_f"
FREIGHTER_MOVE_START_SPEED = 5
FREIGHTER_MOVE_START_SEC = 15
FREIGHTER_MOVE_SPEED = 9.3
FREIGHTER_MOVE_ANGLE = 30
FIGHER_MOVE_A_SPEED = 9.2
FIGHER_MOVE_B_SPEED = 9.7
FIGHER_MOVE_C_SPEED = 11
_puppet_tbl = {}
_phase = 0
_start_mission_part = nil
_freighter_handle = nil
_freighter_se = nil
_is_out_of_range = false
_fighter_stealth_fail = false
_is_in_freighter_front = false
_is_in_freighter_hide_sensor = false
_is_in_fighter_start_sensor = false
_freighter_dnode_hdl = nil
_freighter_move_task = nil
_fighter_move_task = nil
_seleb_move_task = nil
_rode_ship_first = false
_req_black_out = false
_sdemo = nil
enmgen2_fighter_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator_01",
      name = "ep07_fighter_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_02",
      name = "ep07_fighter_passenger_01",
      target_vehicle = "ep07_fighter_01"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  _start_mission_part = L0_0
  L0_0 = _start_mission_part
  if L0_0 == "ep07_c" then
    L0_0 = PHASE_FREIGHTER_STEALTH_C_INIT
    _phase = L0_0
  else
    L0_0 = _start_mission_part
    if L0_0 == "ep07_d" then
      L0_0 = PHASE_FREIGHTER_STEALTH_D_INIT
      _phase = L0_0
    else
      L0_0 = PHASE_WAIT
      _phase = L0_0
    end
  end
  L0_0 = Fn_findAreaHandle
  L0_0 = L0_0("up_a_04_01")
  _up_a_04_01_hdl = L0_0
  L0_0 = _up_a_04_01_hdl
  L0_0 = L0_0.setDriftEnable
  L0_0(L0_0, false)
  L0_0 = Fn_findAreaHandle
  L0_0 = L0_0("ar_a_root")
  _ar_a_root_hdl = L0_0
  L0_0 = _ar_a_root_hdl
  L0_0 = L0_0.setExpandedAabb
  L0_0(L0_0, true)
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  _freighter_handle = L0_0
  L0_0 = _freighter_handle
  L0_0 = L0_0.setName
  L0_0(L0_0, "ve_f")
  L0_0 = _freighter_handle
  L0_0 = L0_0.setActive
  L0_0(L0_0, true)
  L0_0 = _freighter_handle
  L0_0 = L0_0.setDriftEnable
  L0_0(L0_0, false)
  L0_0 = _freighter_handle
  L0_0 = L0_0.try_init
  L0_0(L0_0)
  L0_0 = _freighter_handle
  L0_0 = L0_0.waitForReady
  L0_0(L0_0)
  L0_0 = _freighter_handle
  L0_0 = L0_0.try_start
  L0_0(L0_0)
  L0_0 = Fn_loadEventData
  L0_0("evx/ep07_com_a_ve_f", {
    "evarea2_ve_f"
  }, true)
  L0_0 = freighterReset
  L0_0()
  L0_0 = {
    {
      name = "ep07_merchant_01",
      type = "man41",
      node = "locator2_merchant_01",
      active = false
    },
    {
      name = "ep07_merchant_02",
      type = "man41",
      node = "locator2_merchant_02",
      active = false,
      disable_collision = true
    },
    {
      name = "ep07_seleb",
      type = "man46",
      node = "locator2_seleb_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_sensorOff("spheresensor2_fighter_start_01")
  Fn_pcSensorOff("pcspheresensor2_ar_attack")
  Fn_pcSensorOff("pccubesensor2_freighter_front_01")
  Fn_pcSensorOff("pccubesensor2_freighter_hide_01")
  Fn_pcSensorOff("pcspheresensor2_freighter_out_01")
  Fn_pcSensorOff("pcspheresensor2_soliloquy_01")
  _sdemo = SDemo.create("ep07_com_a")
  Fn_coercionPoseNomal()
  Fn_setCatWarp(false)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = Fn_loadNpcEventMotion
  L1_2 = "ep07_merchant_02"
  L2_3 = {L3_4}
  L3_4 = "man01_viecle_a_00"
  L0_1(L1_2, L2_3)
  while true do
    L0_1 = _phase
    L1_2 = PHASE_WAIT
    if L0_1 == L1_2 then
      while true do
        L0_1 = Fn_getMissionPart
        L0_1 = L0_1()
        if L0_1 ~= "ep07_b" then
          L0_1 = wait
          L0_1()
        end
      end
      L0_1 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT
      _phase = L0_1
    else
      L0_1 = _phase
      L1_2 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT
      if L0_1 == L1_2 then
        L0_1 = invokeTask
        L1_2 = spawnFighter
        L0_1(L1_2)
        L0_1 = Fn_setNpcActive
        L1_2 = "ep07_seleb"
        L2_3 = true
        L0_1(L1_2, L2_3)
        L0_1 = Fn_setNpcActive
        L1_2 = "ep07_merchant_01"
        L2_3 = true
        L0_1(L1_2, L2_3)
        L0_1 = Fn_playMotionNpc
        L1_2 = "ep07_seleb"
        L2_3 = "talk_03"
        L3_4 = false
        L4_5 = {}
        L4_5.isRepeat = true
        L0_1(L1_2, L2_3, L3_4, L4_5)
        L0_1 = Fn_playMotionNpc
        L1_2 = "ep07_merchant_01"
        L2_3 = "talk_04"
        L3_4 = false
        L4_5 = {}
        L4_5.isRepeat = true
        L0_1(L1_2, L2_3, L3_4, L4_5)
        L0_1 = _sdemo
        L1_2 = L0_1
        L0_1 = L0_1.reset
        L0_1(L1_2)
        L0_1 = _sdemo
        L1_2 = L0_1
        L0_1 = L0_1.set
        L2_3 = "locator2_sdemo_01_cam_01"
        L3_4 = "locator2_sdemo_01_aim_01"
        L0_1(L1_2, L2_3, L3_4)
        L0_1 = _sdemo
        L1_2 = L0_1
        L0_1 = L0_1.play
        L0_1(L1_2)
        L0_1 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT_END
        _phase = L0_1
      else
        L0_1 = _phase
        L1_2 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT_END
        if L0_1 == L1_2 then
        else
          L0_1 = _phase
          L1_2 = PHASE_FREIGHTER_STEALTH_SDEMO
          if L0_1 == L1_2 then
            L0_1 = waitSeconds
            L1_2 = 2.5
            L0_1(L1_2)
            L0_1 = Fn_kaiwaDemoView
            L1_2 = "ep07_00110k"
            L0_1(L1_2)
            L0_1 = Player
            L1_2 = L0_1
            L0_1 = L0_1.setLookAtIk
            L2_3 = true
            L3_4 = 1
            L4_5 = findGameObject2
            L5_6 = "Node"
            L4_5 = L4_5(L5_6, "locator2_sdemo_01_aim_01")
            L5_6 = L4_5
            L4_5 = L4_5.getWorldPos
            L5_6 = L4_5(L5_6)
            L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L4_5(L5_6))
            L0_1 = _sdemo
            L1_2 = L0_1
            L0_1 = L0_1.play
            L2_3 = {L3_4}
            L3_4 = {}
            L3_4.pos = "locator2_sdemo_01_cam_02"
            L3_4.time = 0.7
            L3_4.hashfunc = "EaseOut"
            L3_4 = {L4_5}
            L4_5 = {}
            L4_5.pos = "locator2_sdemo_01_aim_02"
            L4_5.time = 1
            L4_5.hashfunc = "Linear"
            L0_1(L1_2, L2_3, L3_4)
            while true do
              L0_1 = _sdemo
              L1_2 = L0_1
              L0_1 = L0_1.isPlay
              L0_1 = L0_1(L1_2)
              if L0_1 then
                L0_1 = wait
                L0_1()
              end
            end
            L0_1 = _sdemo
            L1_2 = L0_1
            L0_1 = L0_1.play
            L2_3 = {L3_4}
            L3_4 = {}
            L3_4.pos = "locator2_sdemo_01_cam_03"
            L3_4.time = 1.5
            L3_4.hashfunc = "EaseInOut"
            L3_4 = {L4_5}
            L4_5 = {}
            L4_5.pos = "locator2_sdemo_01_aim_03"
            L4_5.time = 1.5
            L4_5.hashfunc = "EaseOut"
            L0_1(L1_2, L2_3, L3_4)
            while true do
              L0_1 = _sdemo
              L1_2 = L0_1
              L0_1 = L0_1.isPlay
              L0_1 = L0_1(L1_2)
              if L0_1 then
                L0_1 = wait
                L0_1()
              end
            end
            L0_1 = Fn_resetPcPos
            L1_2 = "warppoint2_pc_01"
            L0_1(L1_2)
            L0_1 = waitSeconds
            L1_2 = 1.5
            L0_1(L1_2)
            L0_1 = Fn_kaiwaDemoView
            L1_2 = "ep07_00120k"
            L0_1(L1_2)
            L0_1 = Fn_playMotionNpc
            L1_2 = "ep07_merchant_01"
            L2_3 = "greeting"
            L3_4 = false
            L0_1(L1_2, L2_3, L3_4)
            L0_1 = Fn_playMotionNpc
            L1_2 = "ep07_seleb"
            L2_3 = "reply_yes"
            L3_4 = false
            L0_1(L1_2, L2_3, L3_4)
            L0_1 = Fn_findNpc
            L1_2 = "ep07_merchant_01"
            L0_1 = L0_1(L1_2)
            L1_2 = Fn_findNpc
            L2_3 = "ep07_seleb"
            L1_2 = L1_2(L2_3)
            repeat
              repeat
                L2_3 = wait
                L2_3()
                L3_4 = L0_1
                L2_3 = L0_1.isMotionEnd
                L2_3 = L2_3(L3_4)
              until L2_3
              L3_4 = L1_2
              L2_3 = L1_2.isMotionEnd
              L2_3 = L2_3(L3_4)
            until L2_3
            L0_1 = RAC_invokeMoveCharaTask
            L1_2 = "ep07_seleb"
            L2_3 = "locator2_seleb_move_"
            L0_1 = L0_1(L1_2, L2_3)
            _seleb_move_task = L0_1
            L0_1 = invokeTask
            L1_2 = Fn_turnNpc
            L2_3 = "ep07_merchant_01"
            L3_4 = _freighter_handle
            L0_1 = L0_1(L1_2, L2_3, L3_4)
            L1_2 = Fn_captionView
            L2_3 = "ep07_09000"
            L1_2(L2_3)
            L1_2 = waitSeconds
            L2_3 = 1
            L1_2(L2_3)
            L1_2 = _sdemo
            L2_3 = L1_2
            L1_2 = L1_2.play
            L3_4 = nil
            L4_5 = {L5_6}
            L5_6 = {}
            L5_6.pos = "locator2_sdemo_01_aim_04"
            L5_6.time = 4
            L5_6.hashfunc = "EaseOut"
            L1_2(L2_3, L3_4, L4_5)
            while true do
              L1_2 = Fn_isCaptionView
              L1_2 = L1_2()
              if L1_2 == true then
                L1_2 = wait
                L1_2()
              end
            end
            L2_3 = L0_1
            L1_2 = L0_1.abort
            L1_2(L2_3)
            L0_1 = nil
            L1_2 = Fn_setNpcActive
            L2_3 = "ep07_merchant_01"
            L3_4 = false
            L1_2(L2_3, L3_4)
            L1_2 = Fn_setNpcActive
            L2_3 = "ep07_merchant_02"
            L3_4 = true
            L1_2(L2_3, L3_4)
            L1_2 = Fn_playMotionNpc
            L2_3 = "ep07_merchant_02"
            L3_4 = "man01_viecle_a_00"
            L4_5 = false
            L1_2(L2_3, L3_4, L4_5)
            L1_2 = {L2_3, L3_4}
            L2_3 = {}
            L2_3.wait_seconds = 0
            L3_4 = FREIGHTER_MOVE_START_SPEED
            L2_3.velocity = L3_4
            L3_4 = {}
            L4_5 = FREIGHTER_MOVE_START_SEC
            L3_4.wait_seconds = L4_5
            L4_5 = FREIGHTER_MOVE_SPEED
            L3_4.velocity = L4_5
            L2_3 = invokeAreaMoveTask
            L3_4 = _freighter_handle
            L4_5 = "locator2_freighter_move_"
            L5_6 = L1_2
            L2_3 = L2_3(L3_4, L4_5, L5_6, FREIGHTER_MOVE_ANGLE, nil)
            _freighter_move_task = L2_3
            L2_3 = Sound
            L3_4 = L2_3
            L2_3 = L2_3.playSEHandle
            L4_5 = "ship_fly"
            L5_6 = 1
            L2_3 = L2_3(L3_4, L4_5, L5_6, "", _freighter_handle)
            _freighter_se = L2_3
            while true do
              L2_3 = _sdemo
              L3_4 = L2_3
              L2_3 = L2_3.isPlay
              L2_3 = L2_3(L3_4)
              if L2_3 then
                L2_3 = wait
                L2_3()
              end
            end
            L2_3 = _sdemo
            L3_4 = L2_3
            L2_3 = L2_3.reset
            L2_3(L3_4)
            L2_3 = _sdemo
            L3_4 = L2_3
            L2_3 = L2_3.set
            L4_5 = "locator2_sdemo_01_cam_04"
            L5_6 = "locator2_sdemo_01_aim_05"
            L2_3(L3_4, L4_5, L5_6, true)
            L2_3 = Fn_userCtrlOn
            L2_3()
            L2_3 = Fn_captionView
            L3_4 = "ep07_09001"
            L2_3(L3_4)
            L2_3 = waitSeconds
            L3_4 = 0.2
            L2_3(L3_4)
            L2_3 = _sdemo
            L3_4 = L2_3
            L2_3 = L2_3.stop
            L4_5 = 1
            L2_3(L3_4, L4_5)
            L2_3 = waitSeconds
            L3_4 = 1
            L2_3(L3_4)
            L2_3 = GameDatabase
            L3_4 = L2_3
            L2_3 = L2_3.set
            L4_5 = ggd
            L4_5 = L4_5.EventFlags__ep07__flag02
            L5_6 = 0
            L2_3(L3_4, L4_5, L5_6)
            L2_3 = PHASE_FREIGHTER_STEALTH_SDEMO_END
            _phase = L2_3
          else
            L0_1 = _phase
            L1_2 = PHASE_FREIGHTER_STEALTH_SDEMO_END
            if L0_1 == L1_2 then
              while true do
                L0_1 = Fn_getMissionPart
                L0_1 = L0_1()
                if L0_1 ~= "ep07_c" then
                  L0_1 = wait
                  L0_1()
                end
              end
              L0_1 = PHASE_FREIGHTER_STEALTH_MAIN
              _phase = L0_1
            else
              L0_1 = _phase
              L1_2 = PHASE_FREIGHTER_STEALTH_C_INIT
              if L0_1 == L1_2 then
                L0_1 = Fn_userCtrlOff
                L0_1()
                L0_1 = Fn_resetPcPos
                L1_2 = "warppoint2_pc_01"
                L0_1(L1_2)
                L0_1 = invokeTask
                L1_2 = spawnFighter
                L0_1(L1_2)
                L0_1 = Fn_setNpcActive
                L1_2 = "ep07_seleb"
                L2_3 = true
                L0_1(L1_2, L2_3)
                L0_1 = RAC_invokeMoveCharaTask
                L1_2 = "ep07_seleb"
                L2_3 = "locator2_seleb_move_"
                L0_1 = L0_1(L1_2, L2_3)
                _seleb_move_task = L0_1
                L0_1 = Fn_setNpcActive
                L1_2 = "ep07_merchant_02"
                L2_3 = true
                L0_1(L1_2, L2_3)
                L0_1 = Fn_playMotionNpc
                L1_2 = "ep07_merchant_02"
                L2_3 = "man01_viecle_a_00"
                L3_4 = false
                L0_1(L1_2, L2_3, L3_4)
                L0_1 = {L1_2, L2_3}
                L1_2 = {}
                L1_2.wait_seconds = 0
                L2_3 = FREIGHTER_MOVE_START_SPEED
                L1_2.velocity = L2_3
                L2_3 = {}
                L3_4 = FREIGHTER_MOVE_START_SEC
                L2_3.wait_seconds = L3_4
                L3_4 = FREIGHTER_MOVE_SPEED
                L2_3.velocity = L3_4
                L1_2 = invokeAreaMoveTask
                L2_3 = _freighter_handle
                L3_4 = "locator2_freighter_move_"
                L4_5 = L0_1
                L5_6 = FREIGHTER_MOVE_ANGLE
                L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, nil)
                _freighter_move_task = L1_2
                L1_2 = Sound
                L2_3 = L1_2
                L1_2 = L1_2.playSEHandle
                L3_4 = "ship_fly"
                L4_5 = 1
                L5_6 = ""
                L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, _freighter_handle)
                _freighter_se = L1_2
                _rode_ship_first = false
                L1_2 = PHASE_FREIGHTER_STEALTH_C_INIT_END
                _phase = L1_2
              else
                L0_1 = _phase
                L1_2 = PHASE_FREIGHTER_STEALTH_C_INIT_END
                if L0_1 == L1_2 then
                else
                  L0_1 = _phase
                  L1_2 = PHASE_FREIGHTER_STEALTH_D_INIT
                  if L0_1 == L1_2 then
                    L0_1 = Fn_userCtrlOff
                    L0_1()
                    L0_1 = invokeTask
                    L1_2 = spawnFighter
                    L0_1(L1_2)
                    L0_1 = Fn_setNpcActive
                    L1_2 = "ep07_merchant_02"
                    L2_3 = true
                    L0_1(L1_2, L2_3)
                    L0_1 = Fn_playMotionNpc
                    L1_2 = "ep07_merchant_02"
                    L2_3 = "man01_viecle_a_00"
                    L3_4 = false
                    L0_1(L1_2, L2_3, L3_4)
                    L0_1 = invokeAreaMoveTask
                    L1_2 = _freighter_handle
                    L2_3 = "locator2_freighter_move_"
                    L3_4 = FREIGHTER_MOVE_SPEED
                    L4_5 = FREIGHTER_MOVE_ANGLE
                    L5_6 = 4
                    L0_1 = L0_1(L1_2, L2_3, L3_4, L4_5, L5_6)
                    _freighter_move_task = L0_1
                    L0_1 = Sound
                    L1_2 = L0_1
                    L0_1 = L0_1.playSEHandle
                    L2_3 = "ship_fly"
                    L3_4 = 1
                    L4_5 = ""
                    L5_6 = _freighter_handle
                    L0_1 = L0_1(L1_2, L2_3, L3_4, L4_5, L5_6)
                    _freighter_se = L0_1
                    _rode_ship_first = true
                    L0_1 = PHASE_FREIGHTER_STEALTH_D_INIT_END
                    _phase = L0_1
                  else
                    L0_1 = _phase
                    L1_2 = PHASE_FREIGHTER_STEALTH_D_INIT_END
                    if L0_1 == L1_2 then
                    else
                      L0_1 = _phase
                      L1_2 = PHASE_FREIGHTER_STEALTH_MAIN
                      if L0_1 == L1_2 then
                        L0_1 = Fn_pcSensorOn
                        L1_2 = "pcspheresensor2_ar_attack"
                        L0_1(L1_2)
                        _is_out_of_range = false
                        L0_1 = Fn_pcSensorOn
                        L1_2 = "pcspheresensor2_freighter_out_01"
                        L0_1(L1_2)
                        _is_in_freighter_front = false
                        L0_1 = Fn_pcSensorOn
                        L1_2 = "pccubesensor2_freighter_front_01"
                        L0_1(L1_2)
                        L0_1 = "DNode_freighter_01"
                        L1_2 = createGameObject2
                        L2_3 = "DNode"
                        L1_2 = L1_2(L2_3)
                        _freighter_dnode_hdl = L1_2
                        L1_2 = _freighter_dnode_hdl
                        L2_3 = L1_2
                        L1_2 = L1_2.setName
                        L3_4 = L0_1
                        L1_2(L2_3, L3_4)
                        L1_2 = _freighter_dnode_hdl
                        L2_3 = L1_2
                        L1_2 = L1_2.setAsSphere
                        L3_4 = 0.5
                        L1_2(L2_3, L3_4)
                        L1_2 = _freighter_handle
                        L2_3 = L1_2
                        L1_2 = L1_2.appendChild
                        L3_4 = _freighter_dnode_hdl
                        L1_2(L2_3, L3_4)
                        L1_2 = _freighter_dnode_hdl
                        L2_3 = L1_2
                        L1_2 = L1_2.try_init
                        L1_2(L2_3)
                        L1_2 = _freighter_dnode_hdl
                        L2_3 = L1_2
                        L1_2 = L1_2.waitForReady
                        L1_2(L2_3)
                        L1_2 = _freighter_dnode_hdl
                        L2_3 = L1_2
                        L1_2 = L1_2.try_start
                        L1_2(L2_3)
                        _is_in_fighter_start_sensor = false
                        L1_2 = findGameObject2
                        L2_3 = "Sensor"
                        L3_4 = "spheresensor2_fighter_start_01"
                        L1_2 = L1_2(L2_3, L3_4)
                        L3_4 = L1_2
                        L2_3 = L1_2.setFilterName
                        L4_5 = L0_1
                        L2_3(L3_4, L4_5)
                        L2_3 = Fn_sensorOn
                        L3_4 = L1_2
                        L2_3(L3_4)
                        L0_1 = Fn_pcSensorOn
                        L1_2 = "pcspheresensor2_soliloquy_01"
                        L0_1(L1_2)
                        L0_1 = Fn_userCtrlOn
                        L0_1()
                        while true do
                          L0_1 = HUD
                          L1_2 = L0_1
                          L0_1 = L0_1.captionGetTextId
                          L0_1 = L0_1(L1_2)
                          if L0_1 ~= nil then
                            L0_1 = wait
                            L0_1()
                          end
                        end
                        L0_1 = findGameObject2
                        L1_2 = "PlayerSensor"
                        L2_3 = "pcspheresensor2_ar_attack"
                        L0_1 = L0_1(L1_2, L2_3)
                        L1_2 = 0
                        L3_4 = L0_1
                        L2_3 = L0_1.getLocalAabb
                        L2_3 = L2_3(L3_4)
                        L3_4 = L2_3.max
                        L3_4 = L3_4.x
                        L4_5 = L2_3.min
                        L4_5 = L4_5.x
                        L3_4 = L3_4 - L4_5
                        L1_2 = L3_4 * 0.5
                        L2_3 = false
                        L3_4 = nil
                        _fighter_stealth_fail = false
                        L4_5 = nil
                        L5_6 = false
                        GameDatabase:set(ggd.EventFlags__ep07__flag02, 0)
                        while _req_black_out == false do
                          if _is_out_of_range == true then
                            break
                          end
                          if L2_3 == false and L1_2 > Fn_get_distance(_freighter_handle:getWorldPos(), L0_1:getWorldPos()) then
                            L2_3 = true
                          end
                          if _is_in_freighter_front == true then
                            if L4_5 == nil then
                              L4_5 = invokeTask(function()
                                waitSeconds(2)
                                L5_6 = true
                              end)
                            end
                          elseif L4_5 ~= nil then
                            L4_5:abort()
                            L4_5 = nil
                          end
                          if L5_6 == true then
                            break
                          end
                          if _fighter_move_task == nil and _is_in_fighter_start_sensor == true then
                            Fn_sensorOff("spheresensor2_fighter_start_01")
                            _is_in_fighter_start_sensor = false
                            _fighter_move_task = invokeFighterMoveTask()
                            if L3_4 ~= nil then
                              L3_4:abort()
                            end
                            L3_4 = invokeFighterEventPlayerTask()
                            print("\230\136\166\233\151\152\230\169\159\227\129\174\231\167\187\229\139\149\233\150\139\229\167\139")
                          end
                          if _fighter_stealth_fail == true then
                            break
                          elseif true == false and L2_3 == true then
                            break
                          end
                          if _rode_ship_first == false then
                            if L2_3 == false then
                              if true == true and (Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run or Player:getJumpStyle() == Player.kJumpStyle_FromGround) then
                                Fn_naviKill()
                                Fn_captionView("ep07_09004")
                                _rode_ship_first = true
                              end
                            else
                              break
                            end
                          end
                          wait()
                        end
                        Player:setStay(true)
                        invokeTask(function()
                          Fn_missionView("ep07_09002")
                          if _rode_ship_first == false then
                            waitSeconds(1.3)
                          end
                          if _rode_ship_first == false then
                            Fn_naviSet(findGameObject2("Node", "locator2_freighter_navi"))
                          end
                        end):abort()
                        Fn_pcSensorOff("pcspheresensor2_soliloquy_01")
                        if 2 ~= nil then
                          Fn_naviKill()
                          if L4_5 ~= nil then
                            L4_5:abort()
                            L4_5 = nil
                          end
                          if L3_4 ~= nil then
                            L3_4:abort()
                            L3_4 = nil
                          end
                          if 2 == 1 then
                            RAC_LookAtObjectWait(findGameObject2("Puppet", "ep07_fighter_01"), 0, 1)
                            Fn_captionViewWait("ep07_09006")
                            Fn_captionViewWait("ep07_09007")
                          elseif 2 == 2 then
                            Fn_captionViewWait("ep07_09008")
                          elseif 2 == 3 then
                            Sound:playSE("m03_005", 1, "", _puppet_tbl.ep07_merchant_02)
                            Fn_captionViewWait("ep07_09009")
                          elseif 2 == 4 then
                            Fn_captionViewWait("ep07_09010")
                          end
                          Fn_blackout()
                          deleteFreighter()
                          GameDatabase:set(ggd.EventFlags__ep07__flag02, 1)
                          _phase = PHASE_FREIGHTER_STEALTH_MAIN_RESTART
                        else
                          Fn_blackout()
                        end
                        _freighter_move_task:abort()
                        _freighter_move_task = nil
                        Sound:stopSEHandle(_freighter_se)
                        _freighter_se = nil
                        if L4_5 ~= nil then
                          L4_5:abort()
                          L4_5 = nil
                        end
                        if L3_4 ~= nil then
                          L3_4:abort()
                          L3_4 = nil
                        end
                        if _seleb_move_task ~= nil then
                          _seleb_move_task:abort()
                          _seleb_move_task = nil
                          RAC_stopNpcMoveTask("ep07_seleb")
                        end
                        if _fighter_move_task ~= nil then
                          _fighter_move_task:abort()
                          _fighter_move_task = nil
                        end
                        findGameObject2("EnemyGenerator", "enmgen2_fighter_01"):requestAllEnemyKill()
                        Fn_sensorOff("spheresensor2_fighter_start_01")
                        _is_in_fighter_start_sensor = false
                        Fn_pcSensorOff("pccubesensor2_freighter_front_01")
                        _is_in_freighter_front = false
                        Fn_pcSensorOff("pcspheresensor2_freighter_out_01")
                        _is_out_of_range = false
                        Fn_pcSensorOff("pcspheresensor2_ar_attack")
                        Fn_setNpcActive("ep07_merchant_02", false)
                        Fn_resetCoercionPose()
                        Player:setStay(false)
                        if _phase ~= PHASE_FREIGHTER_STEALTH_MAIN_RESTART then
                          _phase = PHASE_FREIGHTER_STEALTH_MAIN_END
                        else
                        end
                      else
                        L0_1 = _phase
                        L1_2 = PHASE_FREIGHTER_STEALTH_MAIN_END
                        if L0_1 == L1_2 then
                        else
                          L0_1 = _phase
                          L1_2 = PHASE_FREIGHTER_STEALTH_MAIN_RESTART
                          if L0_1 == L1_2 then
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L0_1 = wait
    L0_1()
  end
end
function Finalize()
  if _freighter_se ~= nil then
    Sound:stopSEHandle(_freighter_se)
    _freighter_se = nil
  end
  deleteFreighter()
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
  end
  if _up_a_04_01_hdl then
    _up_a_04_01_hdl:setDriftEnable(true)
  end
  if _ar_a_root_hdl then
    _ar_a_root_hdl:setExpandedAabb(false)
  end
end
function invokeAreaMoveTask(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12
  L5_12 = {}
  L5_12.vel_change_task = nil
  Area:setMoveEnable(true)
  if A0_7 then
    A0_7:setMoveEnable(true)
  end
  function L5_12.update(A0_13)
    local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20
    L1_14 = {}
    L2_15 = 1
    if L3_16 ~= nil then
      L2_15 = A4_11
    end
    while true do
      L6_19 = "%s%02d"
      L7_20 = A1_8
      L7_20 = L5_18(L6_19, L7_20, L2_15)
      if L3_16 ~= nil then
        L6_19 = L3_16
        L7_20 = L5_18(L6_19)
        L4_17(L5_18, L6_19, L7_20, L5_18(L6_19))
        L6_19 = L3_16
        L4_17(L5_18, L6_19)
      else
        break
      end
      L2_15 = L2_15 + 1
    end
    if L3_16 == "table" then
      L3_16(L4_17, L5_18)
      A0_13.vel_change_task = L3_16
    else
      L3_16(L4_17, L5_18)
    end
    L3_16(L4_17, L5_18)
    while true do
      if not L3_16 then
        L3_16()
      end
    end
    L3_16(L4_17)
    for L6_19, L7_20 in L3_16(L4_17) do
      A0_7:appendMoveTarget(L7_20)
    end
    L3_16(L4_17)
    while true do
      if not L3_16 then
        L3_16()
      end
    end
    L3_16(L4_17)
  end
  function L5_12.destructor(A0_21)
    while not Fn_getAreaAnimMoveDriftEnable() do
      wait()
    end
    if A0_21.vel_change_task ~= nil then
      A0_21.vel_change_task:abort()
      A0_21.vel_change_task = nil
    end
    A0_7:beginMoveTargets()
    A0_7:endMoveTargets()
  end
  return RAC_InvokeTaskWithDestractor(L5_12.update, L5_12.destructor, L5_12)
end
function spawnFighter()
  print("\230\136\166\233\151\152\230\169\159\230\186\150\229\130\153\229\190\133\227\129\161")
  findGameObject2("EnemyGenerator", "enmgen2_fighter_01"):requestSpawn()
  findGameObject2("EnemyGenerator", "enmgen2_fighter_01"):setEnemyMarker(false)
  findGameObject2("EnemyGenerator", "enmgen2_fighter_01"):requestIdlingEnemy(true)
  print("\227\129\147\227\129\147\227\129\167\229\135\166\231\144\134\227\129\140\231\181\130\227\130\143\227\130\137\227\129\170\227\129\132\229\160\180\229\144\136\227\129\175 EnemyGenerator \227\129\174 active_range \227\129\140\231\139\173\227\129\143\227\128\129\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\229\133\165\227\129\163\227\129\166\227\129\132\227\129\170\227\129\132\229\143\175\232\131\189\230\128\167\227\129\140\227\129\130\227\130\138\227\129\190\227\129\153")
  while findGameObject2("EnemyBrain", "ep07_fighter_01"):isReadyEnemy() == false do
    wait()
  end
  findGameObject2("EnemyBrain", "ep07_fighter_01"):setInvincibility(true)
  findGameObject2("EnemyBrain", "ep07_fighter_01"):setEnableHomingTarget(false)
  findGameObject2("EnemyBrain", "ep07_fighter_01"):setEnableTarget(false)
  print("\230\136\166\233\151\152\230\169\159\230\186\150\229\130\153\229\174\140\228\186\134")
end
function invokeFighterMoveTask()
  local L0_22
  L0_22 = {}
  L0_22.caption_task = nil
  L0_22.move_se_handle = nil
  function L0_22.update(A0_23)
    local L1_24, L2_25, L3_26, L4_27
    L1_24 = findGameObject2
    L2_25 = "Puppet"
    L3_26 = "ep07_fighter_01"
    L1_24 = L1_24(L2_25, L3_26)
    L3_26 = L1_24
    L2_25 = L1_24.getBrain
    L2_25 = L2_25(L3_26)
    L3_26 = {}
    L4_27 = 1
    while findGameObject2("Node", "locator2_fighter_move_a_" .. string.format("%02d", L4_27)) ~= nil do
      table.insert(L3_26, findGameObject2("Node", "locator2_fighter_move_a_" .. string.format("%02d", L4_27)):getName())
      do break end
      do break end
      L4_27 = L4_27 + 1
    end
    while true do
      L4_27 = L2_25.isReadyEnemy
      L4_27 = L4_27(L2_25)
      if L4_27 == false then
        L4_27 = print
        L4_27("error \227\129\147\227\129\147\227\129\167\229\190\133\227\129\163\227\129\166\227\129\151\227\129\190\227\129\134\227\129\168\230\136\166\233\151\152\230\169\159\227\129\168\232\178\168\231\137\169\232\136\185\227\129\174\228\189\141\231\189\174\227\129\140\227\129\154\227\130\140\227\130\139")
        L4_27 = wait
        L4_27()
      end
    end
    L4_27 = Sound
    L4_27 = L4_27.playSEHandle
    L4_27 = L4_27(L4_27, "ene_robot_fly1", 1, "", L1_24)
    A0_23.move_se_handle = L4_27
    L4_27 = L2_25.move
    L4_27(L2_25, L3_26, {
      speed = FIGHER_MOVE_A_SPEED,
      loop = false,
      curve = true
    })
    repeat
      L4_27 = wait
      L4_27()
      L4_27 = L2_25.isMoveEnd
      L4_27 = L4_27(L2_25)
    until L4_27
    L4_27 = print
    L4_27("\230\136\166\233\151\152\230\169\159 \228\184\166\232\181\176\233\150\139\229\167\139")
    L4_27 = invokeTask
    L4_27 = L4_27(function()
      local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34
      L0_28 = {
        L1_29,
        L2_30,
        L3_31,
        L4_32
      }
      for L4_32, L5_33 in L1_29(L2_30) do
        L6_34 = Fn_captionViewWait
        L6_34(L5_33)
        L6_34 = waitSeconds
        L6_34(0.2)
      end
      L1_29(L2_30)
      for L5_33, L6_34 in L2_30(L3_31) do
        Fn_captionViewWait(L6_34)
        waitSeconds(0.2)
      end
      L2_30(L3_31)
      L2_30(L3_31)
      L2_30(L3_31)
      _req_black_out = true
    end)
    A0_23.caption_task = L4_27
    L4_27 = {}
    L3_26 = L4_27
    L4_27 = 1
    while findGameObject2("Node", "locator2_fighter_move_b_" .. string.format("%02d", L4_27)) ~= nil do
      table.insert(L3_26, findGameObject2("Node", "locator2_fighter_move_b_" .. string.format("%02d", L4_27)):getName())
      do break end
      do break end
      L4_27 = L4_27 + 1
    end
    L4_27 = L2_25.move
    L4_27(L2_25, L3_26, {
      speed = FIGHER_MOVE_B_SPEED,
      loop = false,
      curve = true
    })
    repeat
      L4_27 = _fighter_stealth_fail
      if L4_27 == false then
        L4_27 = _is_in_freighter_hide_sensor
        if L4_27 == false then
          _fighter_stealth_fail = true
          L4_27 = A0_23.caption_task
          L4_27 = L4_27.abort
          L4_27(L4_27)
          A0_23.caption_task = nil
        end
      end
      L4_27 = wait
      L4_27()
      L4_27 = L2_25.isMoveEnd
      L4_27 = L4_27(L2_25)
    until L4_27
    L4_27 = print
    L4_27("\230\136\166\233\151\152\230\169\159 \233\155\162\232\132\177\233\150\139\229\167\139")
    L4_27 = {}
    L3_26 = L4_27
    L4_27 = 1
    while findGameObject2("Node", "locator2_fighter_move_c_" .. string.format("%02d", L4_27)) ~= nil do
      table.insert(L3_26, findGameObject2("Node", "locator2_fighter_move_c_" .. string.format("%02d", L4_27)):getName())
      do break end
      do break end
      L4_27 = L4_27 + 1
    end
    L4_27 = L2_25.move
    L4_27(L2_25, L3_26, {
      speed = FIGHER_MOVE_C_SPEED,
      loop = false,
      curve = true
    })
    repeat
      L4_27 = wait
      L4_27()
      L4_27 = L2_25.isMoveEnd
      L4_27 = L4_27(L2_25)
    until L4_27
    L4_27 = Sound
    L4_27 = L4_27.stopSEHandle
    L4_27(L4_27, A0_23.move_se_handle)
    A0_23.move_se_handle = nil
    L4_27 = print
    L4_27("\230\136\166\233\151\152\230\169\159 \231\167\187\229\139\149\231\181\130\228\186\134")
    L4_27 = A0_23.caption_task
    if L4_27 ~= nil then
      while true do
        L4_27 = A0_23.caption_task
        L4_27 = L4_27.isRunning
        L4_27 = L4_27(L4_27)
        if L4_27 then
          L4_27 = wait
          L4_27()
        end
      end
      L4_27 = A0_23.caption_task
      L4_27 = L4_27.abort
      L4_27(L4_27)
      A0_23.caption_task = nil
    end
  end
  function L0_22.destructor(A0_35)
    if A0_35.caption_task ~= nil then
      A0_35.caption_task:abort()
      A0_35.caption_task = nil
    end
    if A0_35.move_se_handle ~= nil then
      Sound:stopSEHandle(A0_35.move_se_handle)
      A0_35.move_se_handle = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L0_22.update, L0_22.destructor, L0_22)
end
function invokeFighterEventPlayerTask()
  local L0_36
  L0_36 = {}
  L0_36.look_task = nil
  L0_36.sensor_enable = false
  L0_36.success_cap_check_point = false
  L0_36.main_task = invokeTask(function()
    local L0_37, L1_38
    L0_37 = L0_36
    L1_38 = findGameObject2
    L1_38 = L1_38("Puppet", "ep07_fighter_01")
    while 300 < Fn_getDistanceToPlayer(L1_38:getWorldPos()) do
      wait()
    end
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    L0_37.look_task = Fn_lookAtObject(L1_38, 0)
    Fn_captionViewWait("ep07_09019")
    L0_37.look_task:abort()
    L0_37.look_task = nil
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    L0_37.sensor_enable = true
    _is_in_freighter_hide_sensor = false
    Fn_pcSensorOn("pccubesensor2_freighter_hide_01")
    Fn_captionViewWait("ep07_09020")
    Fn_missionViewWait("ep07_09021")
    while _is_in_freighter_hide_sensor == false do
      wait()
    end
    Fn_captionView("ep07_09022")
    while true do
      wait()
    end
  end)
  function L0_36.abort(A0_39)
    if A0_39.look_task ~= nil then
      A0_39.look_task:abort()
      A0_39.look_task = nil
      Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    end
    if A0_39.sensor_enable == true then
      Fn_pcSensorOff("pccubesensor2_freighter_hide_01")
      _is_in_freighter_hide_sensor = false
      A0_39.sensor_enable = false
    end
    if A0_39.main_task ~= nil then
      A0_39.main_task:abort()
      A0_39.main_task = nil
    end
  end
  return L0_36
end
function pccubesensor2_freighter_front_01_OnEnter()
  local L0_40, L1_41
  _is_in_freighter_front = true
end
function pccubesensor2_freighter_front_01_OnLeave()
  local L0_42, L1_43
  _is_in_freighter_front = false
end
function pccubesensor2_freighter_hide_01_OnEnter()
  local L0_44, L1_45
  _is_in_freighter_hide_sensor = true
end
function pccubesensor2_freighter_hide_01_OnLeave()
  local L0_46, L1_47
  _is_in_freighter_hide_sensor = false
end
function pcspheresensor2_freighter_out_01_OnEnter()
  local L0_48, L1_49
  _is_out_of_range = false
end
function pcspheresensor2_freighter_out_01_OnLeave()
  local L0_50, L1_51
  _is_out_of_range = true
end
function spheresensor2_fighter_start_01_OnEnter()
  local L0_52, L1_53
  _is_in_fighter_start_sensor = true
end
function spheresensor2_fighter_start_01_OnLeave()
  local L0_54, L1_55
end
function pcspheresensor2_soliloquy_01_OnEnter()
  Fn_pcSensorOff("pcspheresensor2_soliloquy_01")
  if Player:getRecentAreaName() ~= nil and Player:getRecentAreaName() == FREIGHTER_NAME then
    Fn_captionView("ep07_09026")
  end
end
function pcspheresensor2_soliloquy_01_OnLeave()
  local L0_56, L1_57
end
function isThisStartMissionPart()
  if _start_mission_part == Fn_getMissionPart() then
    return true
  end
  return false
end
function missionPartInitIsEnd()
  local L0_58, L1_59
  L0_58 = _phase
  L1_59 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT_END
  if L0_58 ~= L1_59 then
    L0_58 = _phase
    L1_59 = PHASE_FREIGHTER_STEALTH_C_INIT_END
    if L0_58 ~= L1_59 then
      L0_58 = _phase
      L1_59 = PHASE_FREIGHTER_STEALTH_D_INIT_END
      if L0_58 ~= L1_59 then
        L0_58 = _phase
        L1_59 = PHASE_FREIGHTER_STEALTH_MAIN
      end
    end
  elseif L0_58 == L1_59 then
    L0_58 = true
    return L0_58
  end
  L0_58 = false
  return L0_58
end
function missionPartMainStart()
  local L0_60, L1_61
  L0_60 = _phase
  L1_61 = PHASE_FREIGHTER_STEALTH_SDEMO_INIT_END
  if L0_60 == L1_61 then
    L0_60 = PHASE_FREIGHTER_STEALTH_SDEMO
    _phase = L0_60
  else
    L0_60 = _phase
    L1_61 = PHASE_FREIGHTER_STEALTH_C_INIT_END
    if L0_60 == L1_61 then
      L0_60 = PHASE_FREIGHTER_STEALTH_MAIN
      _phase = L0_60
    else
      L0_60 = _phase
      L1_61 = PHASE_FREIGHTER_STEALTH_D_INIT_END
      if L0_60 == L1_61 then
        L0_60 = PHASE_FREIGHTER_STEALTH_MAIN
        _phase = L0_60
      end
    end
  end
end
function missionPartMainIsEnd()
  if _phase == PHASE_FREIGHTER_STEALTH_SDEMO_END or _phase == PHASE_FREIGHTER_STEALTH_MAIN_END then
    return true
  elseif _phase == PHASE_FREIGHTER_STEALTH_MAIN and Fn_getMissionPart() == "ep07_c" then
    return _fighter_move_task ~= nil
  end
  return false
end
function missionPartMainIsRestart()
  if _phase == PHASE_FREIGHTER_STEALTH_MAIN_RESTART then
    return true
  end
  return false
end
function isStealthCheckPoint()
  local L1_62
  L1_62 = _fighter_move_task
  L1_62 = L1_62 ~= nil
  return L1_62
end
function getFreighterHundle()
  local L0_63, L1_64
  L0_63 = _freighter_handle
  return L0_63
end
function freighterReset()
  local L0_65
  L0_65 = nil
  if _start_mission_part == "ep07_d" then
    L0_65 = findGameObject2("Node", "locator2_freighter_restart_pos")
  else
    L0_65 = findGameObject2("Node", "locator2_freighter_start_pos")
  end
  _freighter_handle:setWorldTransform(L0_65:getWorldTransform())
  _freighter_handle:setForceMove()
  _freighter_handle:beginMoveTargets()
  _freighter_handle:endMoveTargets()
end
function deleteFreighter()
  if _freighter_dnode_hdl ~= nil then
    _freighter_dnode_hdl:try_term()
    _freighter_dnode_hdl = nil
  end
  if _freighter_handle ~= nil then
    _freighter_handle:beginMoveTargets()
    _freighter_handle:endMoveTargets()
    _freighter_handle:try_term()
    _freighter_handle = nil
  end
end
function ep07_findGameObject2(A0_66, A1_67)
  return findGameObject2(A0_66, A1_67)
end
