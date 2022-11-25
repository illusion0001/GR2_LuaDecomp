dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_flag = false
_policeMotions = {
  groggy_00 = "man01_groggy_00",
  groggy_01 = "man01_groggy_01"
}
_warp_caption_flag = false
function Initialize()
  local L0_0
  L0_0 = GameDatabase
  L0_0 = L0_0.get
  L0_0 = L0_0(L0_0, ggd.Savedata__EventFlags__ep18__flag02)
  if L0_0 == 0 then
    L0_0 = GameDatabase
    L0_0 = L0_0.set
    L0_0(L0_0, ggd.Savedata__EventFlags__ep18__flag02, 12)
  end
  L0_0 = {}
  table.insert(L0_0, {
    name = "policeman_01",
    type = "man31",
    node = "locator2_policeman_01",
    anim_name = "breath_00"
  })
  table.insert(L0_0, {
    name = "policeman_02",
    type = "man31",
    node = "locator2_policeman_02",
    anim_name = "check_00"
  })
  table.insert(L0_0, {
    name = "policeman_03",
    type = "man31",
    node = "locator2_policeman_03",
    anim_name = "dynamics_ash_down_front"
  })
  table.insert(L0_0, {
    name = "policeman_04",
    type = "man31",
    node = "locator2_policeman_04",
    anim_name = "driver_01"
  })
  table.insert(L0_0, {
    name = "policeman_05",
    type = "man31",
    node = "locator2_policeman_05",
    anim_name = "dynamics_ash_down_back"
  })
  table.insert(L0_0, {
    name = "policeman_06",
    type = "man31",
    node = "locator2_policeman_06",
    anim_name = "scared_00"
  })
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 1 then
    table.insert(L0_0, {
      name = "policeman_07",
      type = "man31",
      node = "locator2_policeman_07",
      anim_name = "stay_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 2 then
    table.insert(L0_0, {
      name = "policeman_08",
      type = "man31",
      node = "locator2_policeman_08",
      anim_name = "sit_floor_01"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 3 then
    table.insert(L0_0, {
      name = "policeman_09",
      type = "man31",
      node = "locator2_policeman_09",
      anim_name = "stay_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 4 then
    table.insert(L0_0, {
      name = "policeman_10",
      type = "man31",
      node = "locator2_policeman_10",
      anim_name = "breath_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 5 then
    table.insert(L0_0, {
      name = "policeman_11",
      type = "man31",
      node = "locator2_policeman_11",
      anim_name = "scared_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 6 then
    table.insert(L0_0, {
      name = "policeman_12",
      type = "man31",
      node = "locator2_policeman_12",
      anim_name = "check_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 7 then
    table.insert(L0_0, {
      name = "policeman_13",
      type = "man31",
      node = "locator2_policeman_13",
      anim_name = "sit_floor_01"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 8 then
    table.insert(L0_0, {
      name = "policeman_14",
      type = "man31",
      node = "locator2_policeman_14",
      anim_name = "sit_floor_01"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 9 then
    table.insert(L0_0, {
      name = "policeman_15",
      type = "man31",
      node = "locator2_policeman_15",
      anim_name = "breath_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 10 then
    table.insert(L0_0, {
      name = "policeman_16",
      type = "man31",
      node = "locator2_policeman_16",
      anim_name = "scared_00"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 11 then
    table.insert(L0_0, {
      name = "policeman_17",
      type = "man31",
      node = "locator2_policeman_17",
      anim_name = "dynamics_ash_down_front"
    })
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 12 then
    table.insert(L0_0, {
      name = "policeman_18",
      type = "man31",
      node = "locator2_policeman_18",
      anim_name = "driver_01"
    })
  end
  Fn_setupNpc(L0_0)
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 1 then
    Fn_loadNpcEventMotion("policeman_07", _policeMotions)
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag02) >= 3 then
    Fn_loadNpcEventMotion("policeman_09", _policeMotions)
  end
  Player:muteVoice(Player.kVoiceMuteLv_All)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = print
  L1_2 = GameDatabase
  L2_3 = L1_2
  L1_2 = L1_2.get
  L3_4 = ggd
  L3_4 = L3_4.Savedata__EventFlags__ep18__flag02
  L4_5 = L1_2(L2_3, L3_4)
  L0_1(L1_2, L2_3, L3_4, L4_5, L1_2(L2_3, L3_4))
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.get
  L2_3 = ggd
  L2_3 = L2_3.Savedata__EventFlags__ep18__flag02
  L0_1 = L0_1(L1_2, L2_3)
  if L0_1 >= 1 then
    L0_1 = Fn_playMotionNpc
    L1_2 = "policeman_07"
    L2_3 = _policeMotions
    L2_3 = L2_3.groggy_00
    L3_4 = false
    L0_1(L1_2, L2_3, L3_4)
  end
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.get
  L2_3 = ggd
  L2_3 = L2_3.Savedata__EventFlags__ep18__flag02
  L0_1 = L0_1(L1_2, L2_3)
  if L0_1 >= 3 then
    L0_1 = Fn_playMotionNpc
    L1_2 = "policeman_09"
    L2_3 = _policeMotions
    L2_3 = L2_3.groggy_01
    L3_4 = false
    L0_1(L1_2, L2_3, L3_4)
  end
  L0_1 = Fn_playMotionNpc
  L1_2 = "npcgen2_brokengrigo_01"
  L2_3 = "dynamics_ash_down_front"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "npcgen2_brokengrigo_02"
  L2_3 = "dynamics_ash_down_back"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "npcgen2_brokengrigo_03"
  L2_3 = "dynamics_ash_down_front"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_findNpc
  L1_2 = "npcgen2_brokengrigo_01"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.changeDamageType
  L2_3 = 0
  L0_1(L1_2, L2_3)
  L0_1 = Fn_findNpc
  L1_2 = "npcgen2_brokengrigo_02"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.changeDamageType
  L2_3 = 0
  L0_1(L1_2, L2_3)
  L0_1 = Fn_findNpc
  L1_2 = "npcgen2_brokengrigo_03"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.changeDamageType
  L2_3 = 0
  L0_1(L1_2, L2_3)
  L0_1 = Fn_disappearNpc
  L1_2 = "ep18_kaji"
  L2_3 = 0
  L0_1(L1_2, L2_3)
  L0_1 = playEffect
  L0_1()
  L0_1 = Fn_coercionPoseNomal
  L0_1()
  L0_1 = Fn_spawnSuppotCrow
  L0_1 = L0_1()
  L2_3 = L0_1
  L1_2 = L0_1.getBrain
  L1_2 = L1_2(L2_3)
  L3_4 = L1_2
  L2_3 = L1_2.setIdling
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_setBgmPoint
  L3_4 = "battle"
  L4_5 = "bgmPoint2"
  L2_3(L3_4, L4_5)
  function L2_3()
    invokeTask(function()
      Camera:lookTo(findGameObject2("Node", "locator2_lookto"):getWorldPos(), 0, 1)
      Fn_sendEventComSb("playScriptDemo")
    end)
  end
  L3_4 = Fn_missionStart
  L4_5 = L2_3
  L3_4(L4_5)
  L3_4 = Fn_findGimmickBgInBgset
  L4_5 = "g1_ropeway_pd_01a"
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4.setVisiblePermission
  L4_5(L3_4, false)
  L4_5 = L3_4.setCollidablePermission
  L4_5(L3_4, false)
  L4_5 = {}
  L4_5 = Fn_findGimmickBgInBgset("g1_ropeway_pd_02_01", true)
  for _FORV_8_, _FORV_9_ in pairs(L4_5) do
    if L4_5[_FORV_8_]:getParent() == L3_4 then
      L4_5[_FORV_8_]:setVisiblePermission(false)
      L4_5[_FORV_8_]:setCollidablePermission(false)
    end
  end
  invokeTask(function()
    waitSeconds(0.6)
    Fn_turnNpc("npcgen2_kaji", Fn_sendEventComSb("getKaliPuppet"))
  end)
  invokeTask(function()
    while not Fn_sendEventComSb("checkSdemoFinish") do
      wait()
    end
    Fn_resetCoercionPose()
    L1_2:setIdling(false)
  end)
  Fn_sendEventComSb("moveSeq")
  Fn_sendEventComSb("kali_HPgauge_ep18_d")
  waitSeconds(0.5)
  Fn_captionView("ep18_03004")
  caption()
  waitSeconds(3.3)
  Fn_turnNpc("npcgen2_kaji", Player:getPuppet())
  Fn_kaiwaDemoView("ep18_00310k")
  Fn_userCtrlOn()
  Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  Fn_missionView("ep18_03000")
  invokeTask(function()
    local L0_6, L1_7, L2_8
    L0_6 = wait
    L1_7 = 90
    L0_6(L1_7)
    L0_6 = Fn_sendEventComSb
    L1_7 = "getKaliPuppet"
    L0_6 = L0_6(L1_7)
    while true do
      L1_7 = Fn_getPlayerWorldPos
      L1_7 = L1_7()
      L2_8 = Fn_getPlayerWorldRot
      L2_8 = L2_8()
      L1_7.y = L1_7.y + 1
      Query:setEyeSightTransform(L1_7, L2_8)
      Query:setEyeSightAngle(Deg2Rad(50))
      Query:setEyeSightRange(15)
      if Query:raycastEyeSight(L0_6:getWorldPos()) ~= nil and not (50 >= Fn_getDistanceToPlayer(L0_6)) then
        wait()
      end
    end
    L1_7 = Fn_naviSet
    L2_8 = Fn_sendEventComSb
    L2_8 = L2_8("getKaliPuppet")
    L1_7(L2_8, L2_8("getKaliPuppet"))
  end)
  invokeTask(function()
    local L0_9, L1_10, L2_11
    L0_9 = Fn_moveNpc
    L1_10 = "npcgen2_kaji"
    L2_11 = "locator2_kaji_move_point_01"
    L0_9 = L0_9(L1_10, L2_11, {
      arrivedLength = 0.6,
      runLength = 3,
      anim_run_speed = 1
    })
    L1_10 = Fn_findNpc
    L2_11 = "npcgen2_kaji"
    L1_10 = L1_10(L2_11)
    while true do
      L2_11 = L1_10.isMoveEnd
      L2_11 = L2_11(L1_10)
      if L2_11 then
        L2_11 = invokeTask
        L2_11(function()
          Fn_turnNpc("policeman_04", Fn_findNpc("npcgen2_kaji"))
          Fn_playMotionNpc("policeman_04", "stay")
          Fn_playMotionNpc("policeman_04", "talk_00")
          while true do
            if Fn_findNpc("policeman_04"):isMotionEnd() == true then
              Fn_playMotionNpc("policeman_04", "talk_00")
            end
            wait()
          end
        end)
        L2_11 = Fn_turnNpc
        L2_11("npcgen2_kaji", Fn_findNpc("policeman_04"))
        L2_11 = Fn_playMotionNpc
        L2_11("npcgen2_kaji", "talk_00")
        L2_11 = Fn_createGimmickBg
        L2_11 = L2_11(nil, "kaji_note", "cimemo01_base", true)
        Fn_findNpcPuppet("npcgen2_kaji"):appendChildToJoint(L2_11, "loc_r_hand")
        break
      end
      L2_11 = wait
      L2_11()
    end
  end)
  repeat
    _flag = Fn_sendEventComSb("moveSeqEnd")
    wait()
  until _flag
  Fn_naviKill()
  Fn_captionViewEnd()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function caption()
  invokeTask(function()
    local L0_12
    L0_12 = 0
    while _flag ~= true do
      if L0_12 == 10 then
        Fn_captionView("ep18_03001", 5)
      elseif L0_12 == 25 then
        Fn_captionView("ep18_03002", 5)
      elseif L0_12 == 40 then
        Fn_captionView("ep18_03003", 5)
      end
      waitSeconds(1)
      L0_12 = L0_12 + 1
    end
  end)
end
function playEffect()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18
  for L3_16 = 1, 34 do
    L4_17 = "locator2_Durga_Bridge_Crystal_"
    L5_18 = string
    L5_18 = L5_18.format
    L5_18 = L5_18("%02d", L3_16)
    L4_17 = L4_17 .. L5_18
    L5_18 = "durga_bridge_effect_1_"
    L5_18 = L5_18 .. string.format("%02d", L3_16)
  end
  for L3_16 = 2, 6 do
    L4_17 = "locator2_Durga_Crystal_"
    L5_18 = string
    L5_18 = L5_18.format
    L5_18 = L5_18("%02d", L3_16)
    L4_17 = L4_17 .. L5_18
    L5_18 = "durga_effect_1_"
    L5_18 = L5_18 .. string.format("%02d", L3_16)
  end
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_19
  L1_19 = _warp_caption_flag
  if L1_19 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_03005")
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
  end
end
