dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Mission/sm24_common.lua")
puppet_tbl = {}
is_in_sensor = false
is_out_of_range = false
photo_success = false
photo = nil
photo_target_tbl = nil
NPC_MOTION = {
  man_photo = "man01_photo_00",
  wom_wait = "wom01_appointment_00"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm24_talk_npc06",
      type = "wom46",
      node = "locator2_talk_npc_06",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  puppet_tbl.sm24_man01 = Fn_findNpcPuppet("sm24_man01")
  puppet_tbl.sm24_talk_npc04 = Fn_findNpcPuppet("sm24_talk_npc04")
  puppet_tbl.sm24_tourist01 = Fn_findNpcPuppet("sm24_tourist01")
  puppet_tbl.sm24_tourist02 = Fn_findNpcPuppet("sm24_tourist02")
  Fn_pcSensorOff("pccubesensor2_statue_01")
  Fn_pcSensorOff("pccubesensor2_statue_02")
  Fn_pcSensorOff("pccubesensor2_statue_out_01")
  Fn_pcSensorOff("pccubesensor2_statue_out_02")
  sdemo = SDemo.create("sm24_sdemo")
  Fn_loadNpcEventMotion("sm24_tourist01", NPC_MOTION)
  Fn_loadNpcEventMotion("sm24_talk_npc06", NPC_MOTION)
  RAC_startCatWarpControl("sm24_area_out", nil, "pccubesensor2_statue_out_02", "pccubesensor2_statue_out_01", "locator2_pc_start_pos", findGameObject2("Node", "locator2_navi_statue_02"), "locator2_navi_statue_02", "sm24_02000")
end
function Ingame()
  local L0_1, L1_2, L2_3
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = Fn_warpNpc
  L1_2 = "sm24_tourist01"
  L2_3 = "warppoint2_tourist_01_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_warpNpc
  L1_2 = "sm24_tourist02"
  L2_3 = "warppoint2_tourist_02_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_setNpcActive
  L1_2 = "sm24_talk_npc06"
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm24_talk_npc06"
  L2_3 = NPC_MOTION
  L2_3 = L2_3.wom_wait
  L0_1(L1_2, L2_3, false)
  L0_1 = Fn_sendEventComSb
  L1_2 = "isThisStartMissionPart"
  L0_1 = L0_1(L1_2)
  if L0_1 == true then
    L0_1 = Fn_setNpcActive
    L1_2 = "sm24_man01"
    L2_3 = true
    L0_1(L1_2, L2_3)
    L0_1 = Fn_warpNpc
    L1_2 = "sm24_man01"
    L2_3 = "warppoint2_man_01"
    L0_1(L1_2, L2_3)
    L0_1 = Fn_setNpcActive
    L1_2 = "sm24_talk_npc05"
    L2_3 = true
    L0_1(L1_2, L2_3)
    L0_1 = Fn_setNpcActive
    L1_2 = "sm24_tourist01"
    L2_3 = true
    L0_1(L1_2, L2_3)
    L0_1 = Fn_setNpcActive
    L1_2 = "sm24_tourist02"
    L2_3 = true
    L0_1(L1_2, L2_3)
  end
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = nil
  L1_2 = playSdemo02
  L1_2()
  L1_2 = Fn_sendEventComSb
  L2_3 = "endDispAlertness"
  L1_2(L2_3)
  function L1_2()
    Fn_missionView("sm24_02001")
  end
  L2_3 = L1_2
  L2_3()
  L2_3 = Fn_playMotionNpc
  L2_3("sm24_tourist01", NPC_MOTION.man_photo, false, {animBlendDuration = 0.8})
  L2_3 = Fn_playMotionNpc
  L2_3("sm24_tourist02", "photo_03", false, {animBlendDuration = 0.8})
  L2_3 = true
  photo_target_tbl = {
    {
      target = puppet_tbl.sm24_tourist01,
      check_angle = true
    },
    {
      target = puppet_tbl.sm24_tourist02,
      check_angle = true
    }
  }
  photo = Photo.create(kPHOTO_CAPTION_OFF, kPHOTO_TYPE_ALL, true, {near = 2, far = 50}, nil, "sm24_user_photo01")
  for _FORV_6_, _FORV_7_ in ipairs(photo_target_tbl) do
    photo:set(_FORV_7_.target)
  end
  while true do
    if touristPictureLoop() == false then
    end
  end
  invokeTask(function()
    while true do
      if HUD:isPhotoMode() == false then
        if L2_3 == false then
          HUD:enablePhotoMode(false)
          Fn_captionViewWait("sm24_02002")
        end
        L2_3 = false
        HUD:enablePhotoMode(true)
        HUD:setPhotoMode(true)
        print("\227\131\149\227\130\169\227\131\136\227\131\162\227\131\188\227\131\137\229\188\183\229\136\182\232\181\183\229\139\149B")
        while HUD:isPhotoMode() == false do
          wait()
          print("\232\181\183\229\139\149\228\184\173\229\136\164\229\174\154\227\129\171\227\129\170\227\130\139\227\129\190\227\129\167\229\190\133\227\129\163\227\129\166\227\129\132\227\130\139")
        end
      end
      wait()
    end
  end):abort()
  photo:kill()
  photo = nil
  is_out_of_range = false
  if photo_success == true then
    Fn_kaiwaDemoView("sm24_00600k")
  else
    Fn_kaiwaDemoView("sm24_00700k")
  end
  Fn_missionViewEnd()
  HUD:setPhotoMode(false)
  wait()
  Fn_userCtrlOn()
  waitSeconds(0.2)
  while invokeTask(Fn_turnNpc, "sm24_tourist01", puppet_tbl.sm24_tourist02):isRunning() or invokeTask(Fn_turnNpc, "sm24_tourist02", puppet_tbl.sm24_tourist01):isRunning() do
    wait()
  end
  invokeTask(Fn_turnNpc, "sm24_tourist01", puppet_tbl.sm24_tourist02):abort()
  invokeTask(Fn_turnNpc, "sm24_tourist02", puppet_tbl.sm24_tourist01):abort()
  L0_1 = invokeTouristOutTask(photo_success)
  do break end
  L1_2 = wait
  L1_2()
  L1_2 = Fn_missionViewWait
  L2_3 = "sm24_02003"
  L1_2(L2_3)
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.setControl
  L1_2(L2_3, Camera.kPlayer, Camera.kControl_All, false)
  L1_2 = RAC_LookAtObjectWait
  L2_3 = "locator2_look_at_statue_01"
  L1_2(L2_3, 0, 0.1)
  L1_2 = Sound
  L2_3 = L1_2
  L1_2 = L1_2.playSE
  L1_2(L2_3, "kit035b_1", 1)
  L1_2 = Fn_captionViewWait
  L2_3 = "sm24_02004"
  L1_2(L2_3)
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.setControl
  L1_2(L2_3, Camera.kPlayer, Camera.kControl_All, true)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_statue_out_01"
  L1_2(L2_3)
  is_in_sensor = false
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_statue_01"
  L1_2(L2_3)
  while true do
    L1_2 = is_in_sensor
    if L1_2 == false then
      L1_2 = wait
      L1_2()
    end
  end
  is_in_sensor = false
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_statue_01"
  L1_2(L2_3)
  L1_2 = Sound
  L2_3 = L1_2
  L1_2 = L1_2.playSE
  L1_2(L2_3, "kit037a", 1)
  L1_2 = Fn_captionViewWait
  L2_3 = "sm24_02005"
  L1_2(L2_3)
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.setControl
  L1_2(L2_3, Camera.kPlayer, Camera.kControl_All, false)
  L1_2 = RAC_LookAtObjectWait
  L2_3 = "locator2_look_at_statue_01"
  L1_2(L2_3, 0, 0.1)
  L1_2 = Fn_captionViewWait
  L2_3 = "sm24_02006"
  L1_2(L2_3)
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.setControl
  L1_2(L2_3, Camera.kPlayer, Camera.kControl_All, true)
  L1_2 = Fn_naviSet
  L2_3 = findGameObject2
  L2_3 = L2_3("Node", "locator2_navi_statue_01")
  L1_2(L2_3, L2_3("Node", "locator2_navi_statue_01"))
  is_in_sensor = false
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_statue_02"
  L1_2(L2_3)
  L1_2 = 0
  repeat
    L2_3 = is_in_sensor
    if L2_3 == true then
      L1_2 = L1_2 + 0.1
    else
      L1_2 = 0
    end
    L2_3 = wait
    L2_3()
  until L1_2 > 3
  L1_2 = Fn_naviKill
  L1_2()
  is_in_sensor = false
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_statue_02"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_statue_out_01"
  L1_2(L2_3)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setStay
  L1_2(L2_3, true)
  L1_2 = Fn_blackout
  L2_3 = 0.5
  L1_2(L2_3)
  if L0_1 ~= nil then
    L2_3 = L0_1
    L1_2 = L0_1.abort
    L1_2(L2_3)
    L0_1 = nil
  end
  L1_2 = Area
  L2_3 = L1_2
  L1_2 = L1_2.requestRestore
  L1_2(L2_3)
  L1_2 = RAC_endCatWarpControl
  L2_3 = "sm24_area_out"
  L1_2(L2_3)
  L1_2 = playSdemo04
  L1_2()
  L1_2 = Fn_setKeepPlayerPos
  L1_2()
  L1_2 = Fn_setNextMissionFlag
  L1_2()
  L1_2 = Fn_nextMission
  L1_2()
  L1_2 = Fn_exitSandbox
  L1_2()
end
function Finalize()
  if Fn_getPlayer() then
    RAC_endCatWarpControl("sm24_area_out")
  end
end
function touristPictureLoop()
  local L0_4
  while true do
    L0_4 = photo
    L0_4 = L0_4.run
    L0_4(L0_4)
    while true do
      L0_4 = photo
      L0_4 = L0_4.isRunning
      L0_4 = L0_4(L0_4)
      if L0_4 then
        L0_4 = wait
        L0_4()
      end
    end
    L0_4 = photo
    L0_4 = L0_4.getPhotoState
    L0_4 = L0_4(L0_4)
    if L0_4 ~= nil then
      if type(L0_4) ~= "table" then
        L0_4 = {
          {state = L0_4}
        }
      end
      for _FORV_5_, _FORV_6_ in ipairs(L0_4) do
        for _FORV_11_, _FORV_12_ in ipairs(photo_target_tbl) do
        end
        if _FORV_6_.state == kPHOTO_OK then
        elseif _FORV_6_.state == kPHOTO_NEAR then
          break
        elseif _FORV_6_.state == kPHOTO_FAR then
          break
        elseif _FORV_6_.state == kPHOTO_ANGLE or _FORV_6_.state == kPHOTO_BACK then
          if _FORV_12_.check_angle == true then
          else
          end
        elseif _FORV_6_.state == kPHOTO_OUT then
          break
        else
          print("\227\129\147\227\129\147\227\129\171\227\129\175\227\129\147\227\129\170\227\129\132\227\129\175\227\129\154")
          break
        end
      end
    end
    if nil == 0 then
      photo_success = true
      break
    elseif nil == 1 or nil == 2 or nil == 3 or nil == 4 then
      photo_success = false
      break
    else
      print("\229\134\153\231\156\159\229\136\164\229\174\154\228\184\173\230\150\173")
    end
  end
  L0_4 = waitSeconds
  L0_4(0.5)
  L0_4 = true
  return L0_4
end
function invokeTouristOutTask(A0_5)
  local L1_6
  L1_6 = {}
  L1_6.tourist_man_se_task = nil
  L1_6.tourist_wom_se_task = nil
  L1_6.tourist_man_deactive_task = nil
  L1_6.tourist_wom_deactive_task = nil
  function L1_6.update(A0_7)
    if A0_5 == true then
      A0_7.tourist_man_se_task = invokeTask(function()
        while true do
          Sound:playSE("m33_911", 0.6, "", puppet_tbl.sm24_tourist01)
          waitSeconds(5)
        end
      end)
      Fn_playMotionNpc("sm24_tourist01", "talk_laugh_00", false)
      waitSeconds(0.3)
      A0_7.tourist_wom_se_task = invokeTask(function()
        while true do
          Sound:playSE("w19_911", 0.6, "", puppet_tbl.sm24_tourist02)
          waitSeconds(5)
        end
      end)
      Fn_playMotionNpc("sm24_tourist02", "talk_laugh_00", false)
    else
      A0_7.tourist_man_se_task = invokeTask(function()
        while true do
          Sound:playSE("m33_921", 0.6, "", puppet_tbl.sm24_tourist01)
          waitSeconds(5)
        end
      end)
      Fn_playMotionNpc("sm24_tourist01", "talk_sad_00", false)
      waitSeconds(0.3)
      A0_7.tourist_wom_se_task = invokeTask(function()
        while true do
          Sound:playSE("w19_921", 0.6, "", puppet_tbl.sm24_tourist01)
          waitSeconds(5)
        end
      end)
      Fn_playMotionNpc("sm24_tourist02", "talk_sad_02", false)
    end
    while Fn_findNpc("sm24_tourist01"):isMotionEnd() == false do
      wait()
    end
    A0_7.tourist_man_se_task:abort()
    A0_7.tourist_man_se_task = nil
    A0_7.tourist_wom_se_task:abort()
    A0_7.tourist_wom_se_task = nil
    waitSeconds(0.5)
    A0_7.tourist_man_deactive_task = invokeMoveDeactiveTask("sm24_tourist01", "locator2_tourist_move_", 20)
    Fn_playMotionNpc("sm24_tourist02", "stay", false)
    waitSeconds(1.5)
    A0_7.tourist_wom_deactive_task = invokeMoveDeactiveTask("sm24_tourist02", "locator2_tourist_move_", 20)
    while A0_7.tourist_man_deactive_task:isRunning() or A0_7.tourist_wom_deactive_task:isRunning() do
      wait()
    end
  end
  function L1_6.destractor(A0_8)
    Fn_playMotionNpc("sm24_tourist01", "stay", false)
    Fn_playMotionNpc("sm24_tourist02", "stay", false)
    if A0_8.tourist_man_se_task ~= nil then
      A0_8.tourist_man_se_task:abort()
      A0_8.tourist_man_se_task = nil
    end
    if A0_8.tourist_wom_se_task ~= nil then
      A0_8.tourist_wom_se_task:abort()
      A0_8.tourist_wom_se_task = nil
    end
    if A0_8.tourist_man_deactive_task ~= nil then
      A0_8.tourist_man_deactive_task:abort()
      A0_8.tourist_man_deactive_task = nil
    end
    if A0_8.tourist_wom_deactive_task ~= nil then
      A0_8.tourist_wom_deactive_task:abort()
      A0_8.tourist_wom_deactive_task = nil
    end
    Fn_setNpcActive("sm24_tourist01", false)
    Fn_setNpcActive("sm24_tourist02", false)
  end
  return RAC_InvokeTaskWithDestractor(L1_6.update, L1_6.destractor, L1_6)
end
function playSdemo02()
  local L0_9, L1_10, L2_11
  L0_9 = Player
  L1_10 = L0_9
  L0_9 = L0_9.setStay
  L2_11 = true
  L0_9(L1_10, L2_11)
  L0_9 = Fn_warpNpc
  L1_10 = "sm24_man01"
  L2_11 = "warppoint2_man_02"
  L0_9(L1_10, L2_11)
  L0_9 = Fn_warpNpc
  L1_10 = "sm24_talk_npc05"
  L2_11 = "warppoint2_talk_npc_05_02"
  L0_9(L1_10, L2_11)
  L0_9 = RAC_invokeMoveCharaTask
  L1_10 = tailing_data_tbl
  L2_11 = tailing_data_tbl
  L2_11 = #L2_11
  L2_11 = L2_11 - 1
  L1_10 = L1_10[L2_11]
  L1_10 = L1_10.talk_npc_name
  L2_11 = tailing_data_tbl
  L2_11 = L2_11[#tailing_data_tbl - 1]
  L2_11 = L2_11.talk_npc_move_b_prefix
  L0_9 = L0_9(L1_10, L2_11, {
    arrivedLength = 1,
    runLength = 1000000,
    recast = true
  })
  L1_10 = sdemo
  L2_11 = L1_10
  L1_10 = L1_10.reset
  L1_10(L2_11)
  L1_10 = sdemo
  L2_11 = L1_10
  L1_10 = L1_10.set
  L1_10(L2_11, "locator2_sdemo_02_cam_01", "locator2_sdemo_02_aim_01")
  L1_10 = sdemo
  L2_11 = L1_10
  L1_10 = L1_10.switchCamera
  L1_10(L2_11, true, 1.5)
  L1_10 = sdemo
  L2_11 = L1_10
  L1_10 = L1_10.play
  L1_10(L2_11)
  L1_10 = waitSeconds
  L2_11 = 0.5
  L1_10(L2_11)
  L1_10 = Player
  L2_11 = L1_10
  L1_10 = L1_10.setLookAtIk
  L1_10(L2_11, true, 1, findGameObject2("Node", "locator2_pc_look_target_01"):getWorldPos())
  L1_10 = waitSeconds
  L2_11 = 1
  L1_10(L2_11)
  L1_10 = Player
  L2_11 = L1_10
  L1_10 = L1_10.setLookAtIk
  L1_10(L2_11, false, 1, Vector(0, 0, 0))
  L1_10 = Sound
  L2_11 = L1_10
  L1_10 = L1_10.playSE
  L1_10(L2_11, "kit020a", 1)
  L1_10 = Fn_captionView
  L2_11 = "sm24_02007"
  L1_10(L2_11)
  L1_10 = waitSeconds
  L2_11 = 1
  L1_10(L2_11)
  L1_10 = RAC_invokeMoveCharaTask
  L2_11 = "sm24_man01"
  L1_10 = L1_10(L2_11, "locator2_man_move_f_", {
    arrivedLength = 1,
    anim_walk_speed = man_param_data.walk_speed,
    runLength = 1000000,
    recast = true
  })
  L2_11 = sdemo
  L2_11 = L2_11.play
  L2_11(L2_11, {
    {
      pos = "locator2_sdemo_02_cam_02",
      time = 0.4,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo_02_cam_03",
      time = 0.6,
      hashfunc = "EaseOut"
    }
  }, {
    {
      pos = "locator2_sdemo_02_aim_02",
      time = 0.9,
      hashfunc = "Linear"
    }
  })
  while true do
    L2_11 = sdemo
    L2_11 = L2_11.isPlay
    L2_11 = L2_11(L2_11)
    if L2_11 then
      L2_11 = wait
      L2_11()
    end
  end
  L2_11 = sdemo
  L2_11 = L2_11.play
  L2_11(L2_11, {
    {
      pos = "locator2_sdemo_02_cam_04",
      time = 3
    }
  }, {
    {
      pos = "locator2_sdemo_02_aim_03",
      time = 3
    }
  })
  L2_11 = waitSeconds
  L2_11(1.5)
  L2_11 = Fn_captionViewWait
  L2_11("sm24_02008")
  while true do
    L2_11 = sdemo
    L2_11 = L2_11.isPlay
    L2_11 = L2_11(L2_11)
    if L2_11 then
      L2_11 = wait
      L2_11()
    end
  end
  L2_11 = L0_9.abort
  L2_11(L0_9)
  L0_9 = nil
  L2_11 = tailing_data_tbl
  L2_11 = L2_11[#tailing_data_tbl - 1]
  L2_11 = L2_11.talk_npc_name
  Fn_playMotionNpc(L2_11, "stay", false)
  Fn_setNpcActive(L2_11, false)
  Sound:playSE("m33_906c", 1, "", puppet_tbl.sm24_tourist01)
  Fn_captionView("sm24_02009")
  Fn_resetPcPos("locator2_pc_start_pos")
  waitSeconds(0.5)
  sdemo:play({
    {
      pos = "locator2_sdemo_02_cam_01",
      time = 2
    }
  }, {
    {
      pos = "locator2_sdemo_02_aim_01",
      time = 2
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  sdemo:stop(1)
  waitSeconds(2)
  L1_10:abort()
  L1_10 = nil
  RAC_stopNpcMoveTask("sm24_man01")
  Fn_setNpcActive("sm24_man01", false)
  Player:setStay(false)
end
function playSdemo04()
  local L0_12, L1_13, L2_14
  L0_12 = Fn_resetPcPos
  L1_13 = "warppoint2_pc_10"
  L0_12(L1_13)
  L0_12 = Fn_setNpcActive
  L1_13 = "sm24_man01"
  L2_14 = true
  L0_12(L1_13, L2_14)
  L0_12 = Fn_warpNpc
  L1_13 = "sm24_man01"
  L2_14 = "warppoint2_man_03"
  L0_12(L1_13, L2_14)
  L0_12 = sdemo
  L1_13 = L0_12
  L0_12 = L0_12.reset
  L0_12(L1_13)
  L0_12 = sdemo
  L1_13 = L0_12
  L0_12 = L0_12.set
  L2_14 = "locator2_sdemo_04_cam_01"
  L0_12(L1_13, L2_14, "locator2_sdemo_04_aim_01")
  L0_12 = sdemo
  L1_13 = L0_12
  L0_12 = L0_12.play
  L0_12(L1_13)
  L0_12 = sdemo
  L1_13 = L0_12
  L0_12 = L0_12.play
  L2_14 = {
    {
      pos = "locator2_sdemo_04_cam_02",
      time = 3,
      hashfunc = "EaseOut"
    }
  }
  L0_12(L1_13, L2_14, {
    {
      pos = "locator2_sdemo_04_aim_02",
      time = 3,
      hashfunc = "EaseOut"
    }
  })
  L0_12 = Fn_fadein
  L1_13 = 0.5
  L0_12(L1_13)
  L0_12 = Fn_captionViewWait
  L1_13 = "sm24_02010"
  L0_12(L1_13)
  while true do
    L0_12 = sdemo
    L1_13 = L0_12
    L0_12 = L0_12.isPlay
    L0_12 = L0_12(L1_13)
    if L0_12 then
      L0_12 = wait
      L0_12()
    end
  end
  L0_12 = Player
  L1_13 = L0_12
  L0_12 = L0_12.setLookAtIk
  L2_14 = true
  L0_12(L1_13, L2_14, 1, puppet_tbl.sm24_man01:getWorldPos())
  L0_12 = waitSeconds
  L1_13 = 1.5
  L0_12(L1_13)
  L0_12 = RAC_invokeMoveCharaTask
  L1_13 = "sm24_man01"
  L2_14 = "locator2_man_move_g_"
  L0_12 = L0_12(L1_13, L2_14, {
    arrivedLength = 0.5,
    anim_walk_speed = man_param_data.walk_speed,
    runLength = 1000000,
    recast = true
  })
  L1_13 = Sound
  L2_14 = L1_13
  L1_13 = L1_13.playSE
  L1_13(L2_14, "kit054a", 1)
  L1_13 = Fn_captionView
  L2_14 = "sm24_02011"
  L1_13(L2_14)
  L1_13 = waitSeconds
  L2_14 = 0.5
  L1_13(L2_14)
  L1_13 = sdemo
  L2_14 = L1_13
  L1_13 = L1_13.play
  L1_13(L2_14, {
    {
      pos = "locator2_sdemo_04_cam_03",
      time = 1,
      hashfunc = "EaseIn"
    },
    {
      pos = "locator2_sdemo_04_cam_04",
      time = 1,
      hashfunc = "EaseOut"
    }
  }, {
    {
      pos = "locator2_sdemo_04_aim_03",
      time = 2,
      hashfunc = "Linear"
    }
  })
  while true do
    L1_13 = sdemo
    L2_14 = L1_13
    L1_13 = L1_13.isPlay
    L1_13 = L1_13(L2_14)
    if L1_13 then
      L1_13 = wait
      L1_13()
    end
  end
  L1_13 = waitSeconds
  L2_14 = 0.5
  L1_13(L2_14)
  L1_13 = sdemo
  L2_14 = L1_13
  L1_13 = L1_13.play
  L1_13(L2_14, {
    {
      pos = "locator2_sdemo_04_cam_05",
      time = 3,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_04_aim_04",
      time = 3,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L2_14 = L0_12
    L1_13 = L0_12.isRunning
    L1_13 = L1_13(L2_14)
    if L1_13 then
      L1_13 = wait
      L1_13()
    end
  end
  L2_14 = L0_12
  L1_13 = L0_12.abort
  L1_13(L2_14)
  L0_12 = nil
  L1_13 = wait
  L1_13()
  L1_13 = Fn_findNpc
  L2_14 = "sm24_man01"
  L1_13 = L1_13(L2_14)
  L2_14 = Fn_findNpc
  L2_14 = L2_14("sm24_talk_npc06")
  Fn_playMotionNpc(L1_13, "greeting", false)
  Fn_playMotionNpc(L2_14, "greeting", false)
  repeat
    wait()
  until L1_13:isMotionEnd() and L2_14:isMotionEnd()
  while true do
    L1_13 = sdemo
    L2_14 = L1_13
    L1_13 = L1_13.isPlay
    L1_13 = L1_13(L2_14)
    if L1_13 then
      L1_13 = wait
      L1_13()
    end
  end
  L1_13 = waitSeconds
  L2_14 = 0.5
  L1_13(L2_14)
  while true do
    L1_13 = HUD
    L2_14 = L1_13
    L1_13 = L1_13.captionGetTextId
    L1_13 = L1_13(L2_14)
    if L1_13 ~= nil then
      L1_13 = wait
      L1_13()
    end
  end
  L1_13 = RAC_invokeMoveCharaTask
  L2_14 = "sm24_talk_npc06"
  L1_13 = L1_13(L2_14, "locator2_talk_npc_06_move_a_", {
    arrivedLength = 1,
    runLength = 1000000,
    recast = true
  })
  L2_14 = waitSeconds
  L2_14(1)
  L2_14 = RAC_invokeMoveCharaTask
  L2_14 = L2_14("sm24_man01", "locator2_man_move_h_", {
    arrivedLength = 1,
    anim_walk_speed = man_param_data.walk_speed,
    runLength = 1000000,
    noTurn = true,
    recast = true
  })
  Fn_resetPcPos("warppoint2_pc_11")
  sdemo:play(nil, {
    {
      pos = "locator2_sdemo_04_aim_05",
      time = 2,
      hashfunc = "Linear"
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  sdemo:reset()
  sdemo:set("locator2_sdemo_04_cam_06", "locator2_sdemo_04_aim_06")
  sdemo:play({
    {
      pos = "locator2_sdemo_04_cam_07",
      time = 3,
      hashfunc = "EaseOut"
    }
  }, nil)
  waitSeconds(0.5)
  Fn_captionViewWait("sm24_02012")
  while sdemo:isPlay() do
    wait()
  end
  waitSeconds(0.5)
  L2_14:abort()
  L2_14 = nil
  L1_13:abort()
  L1_13 = nil
  RAC_stopNpcMoveTask("sm24_man01")
  RAC_stopNpcMoveTask("sm24_talk_npc06")
  Fn_warpNpc("sm24_man01", "warppoint2_man_04")
  Fn_warpNpc("sm24_talk_npc06", "warppoint2_talk_npc_06_01")
  L1_13 = invokeTask(function()
    while RAC_invokeMoveCharaTask("sm24_talk_npc06", "locator2_talk_npc_06_move_b_", {
      arrivedLength = 1,
      runLength = 1000000,
      recast = true
    }):isRunning() do
      wait()
    end
    RAC_invokeMoveCharaTask("sm24_talk_npc06", "locator2_talk_npc_06_move_b_", {
      arrivedLength = 1,
      runLength = 1000000,
      recast = true
    }):abort()
    RAC_stopNpcMoveTask("sm24_talk_npc06")
    wait()
    Fn_turnNpc("sm24_talk_npc06", puppet_tbl.sm24_man01)
  end)
  L2_14 = RAC_invokeMoveCharaTask("sm24_man01", "locator2_man_move_i_", {
    arrivedLength = 1,
    anim_walk_speed = man_param_data.walk_speed,
    runLength = 1000000,
    recast = true
  })
  sdemo:reset()
  sdemo:set("locator2_sdemo_04_cam_08", "locator2_sdemo_04_aim_07", true)
  waitSeconds(0.5)
  sdemo:play({
    {
      pos = "locator2_sdemo_04_cam_09",
      time = 3,
      hashfunc = "EaseInOut"
    }
  }, nil)
  while L1_13:isRunning() or L2_14:isRunning() do
    wait()
  end
  L1_13:abort()
  L1_13 = nil
  L2_14:abort()
  L2_14 = nil
  RAC_stopNpcMoveTask("sm24_man01")
  while sdemo:isPlay() do
    wait()
  end
  Fn_blackout()
  sdemo:stop(0)
  Fn_setNpcActive("sm24_man01", false)
  Fn_setNpcActive("sm24_talk_npc06", false)
end
function pccubesensor2_statue_01_OnEnter()
  local L0_15, L1_16
  is_in_sensor = true
end
function pccubesensor2_statue_01_OnLeave()
  local L0_17, L1_18
  is_in_sensor = false
end
function pccubesensor2_statue_02_OnEnter()
  local L0_19, L1_20
  is_in_sensor = true
end
function pccubesensor2_statue_02_OnLeave()
  local L0_21, L1_22
  is_in_sensor = false
end
function pccubesensor2_tourist_out_02_OnEnter()
  local L0_23, L1_24
  is_out_of_range = false
end
function pccubesensor2_tourist_out_02_OnLeave()
  local L0_25, L1_26
  is_out_of_range = true
end
