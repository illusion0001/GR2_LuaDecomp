dofile("/Game/Event2/Common/EventCommon.lua")
_ele_event_mot_list = {
  fly_in = "ele01_fly_in_00",
  fly = "ele01_fly_00"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "ele_02",
      type = "ele02",
      node = "locator2_ele_01",
      active = true
    }
  }
  Fn_setupNpc(L0_0)
  ele_hdl = Fn_findNpcPuppet("ele_02")
  sdemo = SDemo.create("eps21")
  Fn_loadNpcEventMotion("ele_02", _ele_event_mot_list)
  lightgial_01 = Fn_createEffect("ef_hs_lgt_01", "ef_hs_lgt_01", {
    obj = Fn_findNpcPuppet("ele_02"),
    joint = "loc_ef_point_00"
  }, false)
  lightgial2_01 = Fn_createEffect("ef_hs_lgt2_01", "ef_hs_lgt_00", {
    obj = Fn_findNpcPuppet("ele_02"),
    joint = "loc_ef_point_00"
  }, false)
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.getPuppet
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_setCatWarp
  L2_3 = false
  L1_2(L2_3)
  L1_2 = findGameObject2
  L2_3 = "Node"
  L3_4 = "locator2_cam_00"
  L1_2 = L1_2(L2_3, L3_4)
  sdemo_cam = L1_2
  L1_2 = findGameObject2
  L2_3 = "Node"
  L3_4 = "locator2_look_01"
  L1_2 = L1_2(L2_3, L3_4)
  sdemo_chara = L1_2
  L1_2 = sdemo
  L2_3 = L1_2
  L1_2 = L1_2.set
  L3_4 = sdemo_cam
  L4_5 = sdemo_chara
  L5_6 = kSDEMO_APPEND_AIM
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = sdemo
  L2_3 = L1_2
  L1_2 = L1_2.play
  L1_2(L2_3)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = waitSeconds
  L2_3 = 2
  L1_2(L2_3)
  L1_2 = Fn_captionViewWait
  L2_3 = "ep21_00010"
  L1_2(L2_3)
  L1_2 = Sound
  L2_3 = L1_2
  L1_2 = L1_2.playSE
  L3_4 = "ele_008"
  L4_5 = 1
  L5_6 = ""
  L6_7 = ele_hdl
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L1_2 = waitSeconds
  L2_3 = 2.7
  L1_2(L2_3)
  L1_2 = Fn_captionView
  L2_3 = "ep21_00020"
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 1.5
  L1_2(L2_3)
  L1_2 = {L2_3}
  L2_3 = {}
  L2_3.pos = "locator2_cam_00"
  L2_3.time = 0
  L2_3 = {L3_4, L4_5}
  L3_4 = {}
  L3_4.pos = "locator2_look_01"
  L3_4.time = 0
  L4_5 = {}
  L4_5.pos = "locator2_look_02"
  L4_5.time = 1
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_look_01"
  L3_4 = L3_4(L4_5, L5_6)
  sdemo_chara = L3_4
  L3_4 = sdemo
  L4_5 = L3_4
  L3_4 = L3_4.set
  L5_6 = sdemo_cam
  L6_7 = sdemo_chara
  L7_8 = kSDEMO_APPEND_AIM
  L3_4(L4_5, L5_6, L6_7, L7_8)
  L3_4 = sdemo
  L4_5 = L3_4
  L3_4 = L3_4.play
  L5_6 = L1_2
  L6_7 = L2_3
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_look_02"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = Player
  L5_6 = L4_5
  L4_5 = L4_5.setLookAtIk
  L6_7 = true
  L7_8 = 1
  L9_10 = L3_4
  L8_9 = L3_4.getWorldPos
  L9_10 = L8_9(L9_10)
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L8_9(L9_10))
  L4_5 = Sound
  L5_6 = L4_5
  L4_5 = L4_5.playSE
  L6_7 = "ele_008"
  L7_8 = 1
  L8_9 = ""
  L9_10 = ele_hdl
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10)
  L4_5 = waitSeconds
  L5_6 = 2
  L4_5(L5_6)
  L4_5 = {L5_6}
  L5_6 = {}
  L5_6.pos = "locator2_cam_00"
  L5_6.time = 0
  L5_6 = {L6_7, L7_8}
  L6_7 = {}
  L6_7.pos = "locator2_look_02"
  L6_7.time = 0
  L7_8 = {}
  L7_8.pos = "locator2_ele_01"
  L7_8.time = 1
  L6_7 = findGameObject2
  L7_8 = "Node"
  L8_9 = "locator2_look_02"
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_look_02"
  L7_8 = L7_8(L8_9, L9_10)
  sdemo_chara = L7_8
  L7_8 = sdemo
  L8_9 = L7_8
  L7_8 = L7_8.set
  L9_10 = sdemo_cam
  L7_8(L8_9, L9_10, sdemo_chara, kSDEMO_APPEND_AIM)
  L7_8 = sdemo
  L8_9 = L7_8
  L7_8 = L7_8.play
  L9_10 = L4_5
  L7_8(L8_9, L9_10, L5_6)
  L7_8 = Fn_findNpcPuppet
  L8_9 = "ele_02"
  L7_8 = L7_8(L8_9)
  L8_9 = Player
  L9_10 = L8_9
  L8_9 = L8_9.setLookAtIk
  L8_9(L9_10, true, 1, L7_8:getWorldPos())
  L8_9 = waitSeconds
  L9_10 = 1.6
  L8_9(L9_10)
  L8_9 = sdemo
  L9_10 = L8_9
  L8_9 = L8_9.zoomIn
  L8_9(L9_10, 0.5, {deg = 30}, "easeOut")
  L8_9 = Sound
  L9_10 = L8_9
  L8_9 = L8_9.playSE
  L8_9(L9_10, "kit040a", 1, "", L0_1)
  L8_9 = Fn_captionViewWait
  L9_10 = "ep21_00000"
  L8_9(L9_10)
  L8_9 = waitSeconds
  L9_10 = 1
  L8_9(L9_10)
  L8_9 = Fn_getPlayer
  L8_9 = L8_9()
  L9_10 = Fn_findNpcPuppet
  L9_10 = L9_10("ele_02")
  sdemo_chara = L9_10
  L9_10 = findGameObject2
  L9_10 = L9_10("Node", "locator2_cam_00")
  sdemo_cam = L9_10
  L9_10 = sdemo
  L9_10 = L9_10.set
  L9_10(L9_10, sdemo_cam, sdemo_chara, kSDEMO_APPEND_AIM)
  L9_10 = sdemo
  L9_10 = L9_10.play
  L9_10(L9_10, L4_5)
  L9_10 = sdemo_chara
  L9_10 = L9_10.getWorldPos
  L9_10 = L9_10(L9_10)
  Fn_playNpcEventMotion("ele_02", _ele_event_mot_list.fly_in, 0, 0, false)
  print("\229\137\141\229\141\138\231\181\130\228\186\134")
  for _FORV_14_ = 1, 20 do
    L9_10.y = L9_10.y + 0.02
    sdemo_chara:setWorldPos(L9_10)
    wait()
  end
  print("\229\137\141\229\141\138\231\181\130\228\186\134")
  Sound:playSE("ele_009", 1, "", ele_hdl)
  Fn_playNpcEventMotion("ele_02", _ele_event_mot_list.fly, 0, 0, false)
  Sound:playSE("kit064c", 1, "", L8_9)
  Fn_captionView("ep21_00001")
  repeat
    L9_10.x = L9_10.x - 0.08
    L9_10.y = L9_10.y + 0.2
    L9_10.z = L9_10.z + 0.32
    sdemo_chara:setWorldPos(L9_10)
    wait()
  until L9_10.y > 500
  waitSeconds(0.1)
  sdemo:set("locator2_cam_04", L8_9, true)
  sdemo:offset(nil, Vector(0, 1, 0))
  sdemo:setCameraParam(nil, nil, {deg = 50})
  sdemo:play()
  waitSeconds(1)
  Fn_userCtrlOn()
  Fn_kaiwaDemoView("eps21_00010k")
  sdemo:stop(1)
  Fn_setNpcActive("ele_02", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L1_11, L2_12, L3_13
  L1_11 = Player
  L2_12 = L1_11
  L1_11 = L1_11.setLookAtIk
  L3_13 = false
  L1_11(L2_12, L3_13, 1, Vector(0, 0, 0))
end
