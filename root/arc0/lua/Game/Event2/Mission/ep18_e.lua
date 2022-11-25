dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_sdemo = nil
_warp_caption_flag = false
_player_pup = nil
_crow_pup = nil
_brain_crow = nil
_finish_crow_setup = false
function Initialize()
  local L0_0, L1_1
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "ep18_e"
  L0_0 = L0_0(L1_1)
  _sdemo = L0_0
  L0_0 = Vector
  L1_1 = -162.45196
  L0_0 = L0_0(L1_1, 150.914, -15.26792)
  L1_1 = Vector
  L1_1 = L1_1(-158.3, 154, -15.59386)
  _sdemo:set(L0_0, L1_1)
  _sdemo:setCameraParam(nil, 0.1, {deg = 15})
  Player:muteVoice(Player.kVoiceMuteLv_All)
  Fn_setCatWarpCheckPoint("locator2_pc_fall_pos1")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L0_2 = Fn_getPlayer
  L0_2 = L0_2()
  _player_pup = L0_2
  L0_2 = {}
  L0_2 = L1_3
  for L4_6, L5_7 in L1_3(L2_4) do
    L6_8 = L0_2[L4_6]
    L7_9 = L6_8
    L6_8 = L6_8.setVisiblePermission
    L8_10 = false
    L6_8(L7_9, L8_10)
    L6_8 = L0_2[L4_6]
    L7_9 = L6_8
    L6_8 = L6_8.setCollidablePermission
    L8_10 = false
    L6_8(L7_9, L8_10)
  end
  L4_6 = false
  L2_4(L3_5, L4_6)
  L4_6 = false
  L2_4(L3_5, L4_6)
  L4_6 = L2_4
  L5_7 = false
  L3_5(L4_6, L5_7)
  L4_6 = L2_4
  L5_7 = false
  L3_5(L4_6, L5_7)
  function L4_6()
    print("Alpha", HUD:faderAlpha())
    if HUD:faderAlpha() == 1 then
      print("fade\228\184\173\227\129\174\229\135\166\231\144\134")
      L3_5 = true
      setUpCrow()
      sdemofunc()
    else
      print("fade\227\129\151\227\129\170\227\129\132\229\160\180\229\144\136\227\129\174\229\135\166\231\144\134")
      L3_5 = false
      invokeTask(function()
        sdemofunc()
        setUpCrow()
      end)
    end
  end
  L5_7 = Fn_missionStart
  L6_8 = L4_6
  L5_7(L6_8)
  if L3_5 == true then
    L5_7 = waitSeconds
    L6_8 = 1.5
    L5_7(L6_8)
  elseif L3_5 == false then
    L5_7 = waitSeconds
    L6_8 = 2.5
    L5_7(L6_8)
  end
  L5_7 = findGameObject2
  L6_8 = "Node"
  L7_9 = "locator2_pc_fall_pos"
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = L5_7
  L5_7 = L5_7.getWorldPos
  L5_7 = L5_7(L6_8)
  L6_8 = findGameObject2
  L7_9 = "Node"
  L8_10 = "locator2_pc_fall_pos"
  L6_8 = L6_8(L7_9, L8_10)
  L7_9 = L6_8
  L6_8 = L6_8.getWorldRot
  L6_8 = L6_8(L7_9)
  L7_9 = Player
  L8_10 = L7_9
  L7_9 = L7_9.setStay
  L9_11 = true
  L10_12 = true
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = Fn_setPcPosRot
  L8_10 = L5_7
  L9_11 = L6_8
  L10_12 = Player
  L10_12 = L10_12.kReset_Falling
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = _player_pup
  L8_10 = L7_9
  L7_9 = L7_9.setVisible
  L9_11 = true
  L7_9(L8_10, L9_11)
  L7_9 = waitSeconds
  L8_10 = 0.3
  L7_9(L8_10)
  while true do
    L7_9 = _finish_crow_setup
    if L7_9 ~= true then
      L7_9 = wait
      L7_9()
    end
  end
  L7_9 = findGameObject2
  L8_10 = "Node"
  L9_11 = "locator2_crow_fall_pos_01"
  L7_9 = L7_9(L8_10, L9_11)
  L8_10 = L7_9
  L7_9 = L7_9.getWorldPos
  L7_9 = L7_9(L8_10)
  L8_10 = findGameObject2
  L9_11 = "Node"
  L10_12 = "locator2_crow_fall_pos_02"
  L8_10 = L8_10(L9_11, L10_12)
  L9_11 = L8_10
  L8_10 = L8_10.getWorldPos
  L8_10 = L8_10(L9_11)
  L9_11 = findGameObject2
  L10_12 = "Node"
  L11_13 = "locator2_crow_fall_pos_03"
  L9_11 = L9_11(L10_12, L11_13)
  L10_12 = L9_11
  L9_11 = L9_11.getWorldPos
  L9_11 = L9_11(L10_12)
  L10_12 = {
    L11_13,
    {
      pos = L8_10,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L8_10,
      action = Supporter.MovePoint.Alight,
      vel = 30
    },
    {
      pos = L8_10,
      action = Supporter.MovePoint.Idle,
      type_idle = Supporter.FirstAction.BattleOnGround,
      duration = 1
    }
  }
  L11_13 = {}
  L11_13.pos = L7_9
  L11_13.action = Supporter.MovePoint.Air
  L11_13.vel = 10
  L11_13 = _brain_crow
  L11_13 = L11_13.setMovePoints
  L11_13(L11_13, L10_12)
  L11_13 = _brain_crow
  L11_13 = L11_13.startMovePoint
  L11_13(L11_13)
  L11_13 = _crow_pup
  L11_13 = L11_13.setVisible
  L11_13(L11_13, true)
  L11_13 = waitSeconds
  L11_13(4.7)
  L11_13 = Fn_kaiwaDemoView
  L11_13("ep18_00320k")
  L11_13 = Camera
  L11_13 = L11_13.lookTo
  L11_13(L11_13, Vector(-166.498, 151.89, -14.471), 0, 0)
  L11_13 = _sdemo
  L11_13 = L11_13.stop
  L11_13(L11_13)
  L11_13 = Player
  L11_13 = L11_13.muteVoice
  L11_13(L11_13, Player.kVoiceMuteLv_NoMute)
  L11_13 = Fn_setCatActive
  L11_13(true)
  L11_13 = Fn_setRavenActive
  L11_13(true)
  repeat
    L11_13 = wait
    L11_13()
    L11_13 = _brain_crow
    L11_13 = L11_13.isMovePointEnd
    L11_13 = L11_13(L11_13)
  until L11_13
  L11_13 = _brain_crow
  L11_13 = L11_13.clearMovePoint
  L11_13(L11_13)
  L11_13 = Player
  L11_13 = L11_13.setStay
  L11_13(L11_13, false)
  L11_13 = Fn_userCtrlOn
  L11_13()
  L11_13 = _brain_crow
  L11_13 = L11_13.setIdling
  L11_13(L11_13, false)
  L11_13 = Fn_sendEventComSb
  L11_13("endKaliCtrl")
  L11_13 = Fn_sendEventComSb
  L11_13("setKaliMarker", true)
  L11_13 = Fn_missionView
  L11_13("ep18_04000")
  L11_13 = Fn_setBgmPoint
  L11_13("battle", "bgmPoint3")
  L11_13 = Fn_disappearNpc
  L11_13("ep18_kaji", 0)
  L11_13 = Fn_sendEventComSb
  L11_13("kali_HPgauge_ep18_e")
  L11_13 = false
  repeat
    L11_13 = Fn_sendEventComSb("isKaliDead")
    wait()
  until L11_13
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function playEffect()
  local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20
  for L3_17 = 1, 5 do
    L4_18 = "locator2_Durga_Crystal_"
    L5_19 = string
    L5_19 = L5_19.format
    L6_20 = "%02d"
    L5_19 = L5_19(L6_20, L3_17)
    L4_18 = L4_18 .. L5_19
    L5_19 = "durga_effect_1_"
    L6_20 = string
    L6_20 = L6_20.format
    L6_20 = L6_20("%02d", L3_17)
    L5_19 = L5_19 .. L6_20
    L6_20 = "durga_effect_2_"
    L6_20 = L6_20 .. string.format("%02d", L3_17)
  end
end
function sdemofunc()
  local L0_21, L1_22
  L0_21 = {L1_22}
  L1_22 = {"easeOut"}
  L1_22.pos = "locator2_cam_02"
  L1_22.time = 5
  L1_22 = {
    {
      pos = "locator2_aim_02",
      time = 4
    }
  }
  Fn_sendEventComSb("sdemoPlay")
  _sdemo:play(L0_21, L1_22)
  if Player:getAction(Player.kAbility_SpTornado) then
    Player:setAction(Player.kAction_Float, true)
  end
  Fn_userCtrlOff()
  _player_pup:setVisible(false)
  invokeTask(function()
    _sdemo:zoomOut(12, {deg = 33}, "easeOut")
  end)
  Fn_sendEventComSb("kaliCtrl")
  Fn_setCatActive(false, Vector(0, 0, 0))
end
function setUpCrow()
  _crow_pup = Fn_spawnSuppotCrow(nil, nil, nil, with_ange)
  _brain_crow = _crow_pup:getBrain()
  _brain_crow:setIdling(true)
  _crow_pup:setVisible(false)
  _finish_crow_setup = true
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_23
  L1_23 = _warp_caption_flag
  if L1_23 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_04001")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    _player_pup:setVisible(true)
  end
  Player:setStay(false)
end
