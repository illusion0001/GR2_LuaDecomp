dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
_cat_warp_flag = false
_sensorEvent1 = false
_sensorEvent2 = false
_sensorEvent4 = false
_sensorEvent5 = false
_ground_height = 0
_bulbosa_task = nil
_caption_task = nil
_child_afraid = false
_child_navi_task = nil
_child_grab_task = nil
_child_grab_caption = nil
_child_grab_voice = nil
_child_navi_stop = false
_child_navi_flag = false
_child_fall_over = false
_child_afraid_over = false
_target_navi_hdl = nil
_targeted_navi_hdl = nil
_caption_timer = 0
_player_reset = nil
_child_reset = nil
_npc_bulbosa = "eps16_bullbossa"
_npc_child = "eps16_child"
_npc_sdemo_child = "npcgen2_sdemo_child"
_npc_sdemo_bird1 = "sdemo_bird_01"
_npc_sdemo_bird2 = "sdemo_bird_02"
_npc_sdemo_bird3 = "sdemo_bird_03"
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = _npc_bulbosa,
      type = "bul01",
      node = "locator2_bulbosa_pos",
      active = true,
      not_mob = true
    },
    {
      name = _npc_child,
      type = "chi20",
      node = "locator2_child_pos",
      active = true,
      not_mob = true
    },
    {
      name = _npc_sdemo_child,
      type = "chi20",
      node = "locator2_sdemo_child_01",
      attach = true,
      use_gravity = false,
      anim_name = "sit_00",
      active = false
    },
    {
      name = _npc_sdemo_bird1,
      type = "brd01",
      node = "locator2_sdemo_bird_01",
      attach = true,
      use_gravity = false,
      anim_name = "fly",
      active = false
    },
    {
      name = _npc_sdemo_bird2,
      type = "brd01",
      node = "locator2_sdemo_bird_02",
      attach = true,
      use_gravity = false,
      anim_name = "fly",
      active = false
    },
    {
      name = _npc_sdemo_bird3,
      type = "brd01",
      node = "locator2_sdemo_bird_03",
      attach = true,
      use_gravity = false,
      anim_name = "fly",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _player_reset = "locator2_pc_start_pos"
  _child_reset = "locator2_child_pos"
  sdemo = SDemo.create("eps16_sdemo")
  Fn_pcSensorOff("pccubesensor2_01_01")
  Fn_pcSensorOff("pccubesensor2_01_02")
  Fn_pcSensorOff("pccubesensor2_02")
  Fn_pcSensorOff("pccubesensor2_04")
  Fn_pcSensorOff("pccubesensor2_05")
end
function Ingame()
  local L0_1, L1_2, L2_3
  L0_1 = Fn_setCatWarp
  L1_2 = true
  L0_1(L1_2)
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = child_cry
  L0_1 = L0_1()
  _child_cry_task = L0_1
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_captionViewWait
  L1_2 = "ep16_00000"
  L0_1(L1_2)
  L0_1 = waitSeconds
  L1_2 = 0.5
  L0_1(L1_2)
  L0_1 = Sound
  L1_2 = L0_1
  L0_1 = L0_1.playSE
  L2_3 = "bul_901b"
  L0_1(L1_2, L2_3, 1, "", puppets[_npc_bulbosa])
  L0_1 = waitSeconds
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setLookAtIk
  L2_3 = true
  L0_1(L1_2, L2_3, 1, getNodePos("locator2_bulbosa_pos", 1.5))
  L0_1 = RAC_LookAtObjectWait
  L1_2 = "locator2_bulbosa_pos"
  L2_3 = 1.5
  L0_1(L1_2, L2_3, 0.3)
  L0_1 = Fn_playMotionNpc
  L1_2 = _npc_bulbosa
  L2_3 = "greeting"
  L0_1(L1_2, L2_3, true)
  L0_1 = waitSeconds
  L1_2 = 0.5
  L0_1(L1_2)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setLookAtIk
  L2_3 = false
  L0_1(L1_2, L2_3, 1, Vector(0, 0, 0))
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "eps16_00010k"
  L0_1(L1_2)
  L0_1 = {}
  L0_1.arrivedLength = 0.1
  L0_1.recast = true
  L1_2 = {
    L2_3,
    {
      pos = "locator2_Bulbosa_03",
      opt = nil
    },
    {
      pos = "locator2_Bulbosa_04",
      opt = nil
    },
    {
      pos = "locator2_Bulbosa_05",
      opt = nil
    },
    {
      pos = "locator2_Bulbosa_06",
      opt = nil
    },
    {
      pos = "locator2_Bulbosa_07",
      opt = nil
    },
    {
      pos = "locator2_Bulbosa_08",
      opt = nil
    }
  }
  L2_3 = {}
  L2_3.pos = "locator2_Bulbosa_02"
  L2_3.opt = nil
  L2_3 = invokeTask
  L2_3 = L2_3(function()
    Fn_playMotionNpc(_npc_bulbosa, "greeting", true)
    Fn_moveNpc(_npc_bulbosa, L1_2, L0_1)
    while true do
      if Fn_findNpc(_npc_bulbosa):getMoveCurrentIndex() > 3 and not Fn_isInSightTarget(puppets[_npc_bulbosa], 1) and Fn_getDistanceToPlayer(puppets[_npc_bulbosa]) > 30 then
        Fn_playMotionNpc(_npc_bulbosa, "stay", false)
        Fn_setNpcActive(_npc_bulbosa, false)
        break
      end
      wait()
    end
  end)
  _bulbosa_task = L2_3
  L2_3 = Fn_playMotionNpc
  L2_3(_npc_child, "stay", false)
  L2_3 = _child_cry_task
  if L2_3 ~= nil then
    L2_3 = _child_cry_task
    L2_3 = L2_3.abort
    L2_3(L2_3)
    _child_cry_task = nil
  end
  L2_3 = playWithGrab
  L2_3()
  L2_3 = Fn_setGrabNpc
  L2_3(_npc_child, true, true)
  _child_reset = nil
  L2_3 = {}
  L2_3.runLength = -1
  Fn_moveNpc(_npc_child, {
    {
      pos = "locator2_child_01",
      opt = L2_3
    }
  }, L2_3)
  Sound:playSE("w22_901b", 1, "", puppets[_npc_child])
  Fn_captionView("ep16_00054")
  waitNpcMoveEnd(_npc_child)
  while invokeTask(function()
    Fn_turnNpc(_npc_bulbosa, puppets[_npc_child])
  end) ~= nil and invokeTask(function()
    Fn_turnNpc(_npc_bulbosa, puppets[_npc_child])
  end):isRunning() or invokeTask(function()
    Fn_turnNpc(_npc_child, puppets[_npc_bulbosa])
  end) ~= nil and invokeTask(function()
    Fn_turnNpc(_npc_child, puppets[_npc_bulbosa])
  end):isRunning() do
    wait()
  end
  while true do
    if Fn_getDistanceToPlayer(puppets[_npc_bulbosa]) < 3 then
      Fn_naviKill()
      Fn_kaiwaDemoView("eps16_00020k")
      break
    else
      Fn_naviSet(findGameObject2("Node", "locator2_Bulbosa_01"))
    end
    if isNpcMotionEnd(_npc_child) then
      Fn_playMotionNpc(_npc_child, "talk_laugh_00", false)
    end
    wait()
  end
  while invokeTask(function()
    Fn_turnNpc(_npc_bulbosa)
    Sound:playSE("bul_915c", 1, "", puppets[_npc_bulbosa])
    Fn_playMotionNpc(_npc_bulbosa, "greeting", true)
  end) ~= nil and invokeTask(function()
    Fn_turnNpc(_npc_bulbosa)
    Sound:playSE("bul_915c", 1, "", puppets[_npc_bulbosa])
    Fn_playMotionNpc(_npc_bulbosa, "greeting", true)
  end):isRunning() or invokeTask(function()
    Fn_turnNpc(_npc_child)
    Sound:playSE("w22_915c", 1, "", puppets[_npc_child])
    Fn_playMotionNpc(_npc_child, "greeting", true)
  end) ~= nil and invokeTask(function()
    Fn_turnNpc(_npc_child)
    Sound:playSE("w22_915c", 1, "", puppets[_npc_child])
    Fn_playMotionNpc(_npc_child, "greeting", true)
  end):isRunning() do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_01_01_OnLeave()
  if _sensorEvent1 then
    return
  end
  _sensorEvent1 = true
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    Player:setStay(false)
    Fn_userCtrlOn()
    if isNpcGrabbed(_npc_child) then
      if _child_afraid and not _cat_warp_flag then
        _child_afraid_over = true
      else
        Sound:playSE("w22_935b", 1, "", puppets[_npc_child])
        Fn_captionViewWait("ep16_00001")
        Player:playVoice({
          {"kit051a", 100}
        })
        Fn_captionViewWait("ep16_00002")
      end
    else
      Fn_captionViewWait("ep16_00004")
    end
    _sensorEvent1 = false
  end)
end
function pccubesensor2_01_02_OnLeave()
  if not _child_fall_over and not _child_afraid_over then
    catWarp()
  end
end
function pccubesensor2_02_OnEnter()
  local L0_4, L1_5
  _sensorEvent2 = true
end
function pccubesensor2_02_OnLeave()
  Sound:playSE("w22_914a", 1, "", puppets[_npc_child])
  Fn_captionView("ep16_00005")
  _sensorEvent2 = false
end
function pccubesensor2_04_OnEnter()
  local L0_6, L1_7
  _sensorEvent4 = true
end
function pccubesensor2_04_OnLeave()
  local L0_8, L1_9
  _sensorEvent4 = false
end
function pccubesensor2_05_OnEnter()
  local L0_10, L1_11
  _sensorEvent5 = true
end
function pccubesensor2_05_OnLeave()
  local L0_12, L1_13
  _sensorEvent5 = false
end
function pccubesensor2_06_01_OnLeave()
  if not _child_fall_over and not _child_afraid_over then
    invokeTask(function()
      Fn_userCtrlAllOff()
      Player:setStay(true)
      Fn_captionView("ep16_00004")
      Player:setStay(false)
      Fn_userCtrlOn()
    end)
  end
end
function pccubesensor2_06_02_OnLeave()
  if not _child_fall_over and not _child_afraid_over then
    catWarp()
  end
end
function catWarp()
  invokeTask(function()
    _cat_warp_flag = true
    Player:setStay(true)
    Fn_userCtrlAllOff()
    Player:setNoDamageMode(Player.kNoDamage_All, true)
    _child_navi_flag = false
    RAC_MultiNaviClear()
    if _child_grab_task ~= nil then
      _child_grab_task:abort()
      _child_grab_task = nil
    end
    Fn_missionViewEnd()
    Fn_captionViewEnd()
    Fn_catWarpIn()
    Player:dropGrabObject()
    wait()
    if _child_reset ~= nil then
      Fn_warpNpc(_npc_child, _child_reset)
    end
    Fn_setCatWarpCheckPoint(_player_reset)
    Fn_catWarpCheckPoint()
    Player:setStay(false)
    Fn_catWarpOut()
    while not HUD:faderStability() do
      wait()
    end
    wait(15)
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Fn_userCtrlOn()
    _cat_warp_flag = false
  end)
end
function waitCaptionFunction(A0_14, A1_15)
  if A1_15 == nil then
    A1_15 = true
  end
  _caption_task = invokeTask(A0_14)
  while _caption_task ~= nil do
    if _cat_warp_flag or _child_fall_over or _child_afraid_over then
      if _caption_task ~= nil then
        _caption_task:abort()
        _caption_task = nil
      end
      while _cat_warp_flag or _child_fall_over or _child_afraid_over do
        wait()
      end
      while not Fn_findNpc(_npc_child):isGrabbed() or Fn_isCaptionView() do
        wait()
      end
      if A1_15 then
        _caption_task = invokeTask(A0_14)
      end
    else
    end
    if _caption_task == nil or _caption_task:isRunning() then
      wait()
    end
  end
  if _caption_task ~= nil then
    _caption_task:abort()
    _caption_task = nil
  end
  while not Fn_findNpc(_npc_child):isGrabbed() or Fn_isCaptionView() do
    wait()
  end
end
function playWithGrab()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L0_16 = 240
  L1_17 = 200
  L2_18 = Fn_pcSensorOn
  L3_19 = "pccubesensor2_01_01"
  L2_18(L3_19)
  L2_18 = Fn_pcSensorOn
  L3_19 = "pccubesensor2_01_02"
  L2_18(L3_19)
  L2_18 = Fn_findNpc
  L3_19 = _npc_child
  L2_18 = L2_18(L3_19)
  L3_19 = waitSeconds
  L4_20 = 4
  L3_19(L4_20)
  L3_19 = Player
  L4_20 = L3_19
  L3_19 = L3_19.setGrabExceptionalObject
  L5_21 = {L6_22}
  L6_22 = _npc_child
  L3_19(L4_20, L5_21)
  L3_19 = Fn_userCtrlOn
  L3_19()
  L3_19 = Sound
  L4_20 = L3_19
  L3_19 = L3_19.playSE
  L5_21 = "w22_903c"
  L6_22 = 1
  L7_23 = ""
  L8_24 = puppets
  L9_25 = _npc_child
  L8_24 = L8_24[L9_25]
  L3_19(L4_20, L5_21, L6_22, L7_23, L8_24)
  L3_19 = Fn_captionViewWait
  L4_20 = "ep16_00006"
  L3_19(L4_20)
  L3_19 = Player
  L4_20 = L3_19
  L3_19 = L3_19.playVoice
  L5_21 = {L6_22}
  L6_22 = {L7_23, L8_24}
  L7_23 = "kit050a"
  L8_24 = 100
  L3_19(L4_20, L5_21)
  L3_19 = Fn_captionViewWait
  L4_20 = "ep16_00007"
  L3_19(L4_20)
  L3_19 = Fn_missionView
  L4_20 = "ep16_00008"
  L3_19(L4_20)
  L3_19 = waitSeconds
  L4_20 = RAC_NAVI_DELAY_DEFAULT
  L3_19(L4_20)
  L3_19 = Fn_setGrabNpc
  L4_20 = _npc_child
  L5_21 = false
  L6_22 = true
  L3_19(L4_20, L5_21, L6_22)
  L4_20 = L2_18
  L3_19 = L2_18.setEventListener
  L5_21 = "npcFall"
  function L6_22()
    print("npcFall.." .. L2_18:getName())
    if not _cat_warp_flag then
      _child_fall_over = true
    end
  end
  L3_19(L4_20, L5_21, L6_22)
  L3_19 = invokeTask
  function L4_20()
    _child_navi_flag = false
    while true do
      if _cat_warp_flag then
        _targeted_navi_hdl = nil
      elseif not _child_fall_over and not _child_afraid_over then
        if not _child_navi_flag then
          if not L2_18:isGrabbed() and not _child_navi_stop then
            RAC_MultiNaviAdd(L2_18:getPuppet())
            if _child_grab_task ~= nil then
              _child_grab_task:abort()
              _child_grab_task = nil
            end
            _child_grab_task = RAC_grabNpcCaption(_npc_child, {
              {
                caption = "ic_tutorial_00410",
                range = 3,
                time = 0
              },
              {
                caption = _child_grab_caption,
                voice = _child_grab_voice,
                range = 10,
                fall_check = true
              },
              {caption = nil, range = 15},
              {
                caption = "ep16_00009",
                voice = nil,
                range = 30,
                fall_check = true
              }
            }, false, true)
            _child_navi_flag = true
          end
        elseif L2_18:isGrabbed() or _child_navi_stop then
          RAC_MultiNaviDel(L2_18:getPuppet())
          if _child_grab_task ~= nil then
            _child_grab_task:abort()
            _child_grab_task = nil
          end
          _child_navi_flag = false
        end
        if _targeted_navi_hdl == nil then
          if L2_18:isGrabbed() and _target_navi_hdl ~= nil then
            Fn_naviSet(_target_navi_hdl)
            _targeted_navi_hdl = _target_navi_hdl
          end
        elseif not L2_18:isGrabbed() or _target_navi_hdl == nil then
          Fn_naviKill()
          _targeted_navi_hdl = nil
        end
      else
        Player:setStay(true)
        Fn_userCtrlAllOff()
        _child_navi_flag = false
        _targeted_navi_hdl = nil
        RAC_MultiNaviClear()
        if _child_grab_task ~= nil then
          _child_grab_task:abort()
          _child_grab_task = nil
        end
        Fn_missionViewEnd()
        Fn_captionViewEnd()
        if _child_afraid_over then
          Sound:playSE("w22_917c", 1, "", puppets[_npc_child])
          Fn_captionViewWait("ep16_00010")
          Player:playVoice({
            {"kit020a", 100}
          })
          Fn_captionViewWait("ep16_00011")
        elseif _child_fall_over then
          Sound:playSE("w22_917c", 1, "", puppets[_npc_child])
          Fn_captionViewWait("ep16_00012")
          Player:playVoice({
            {"kit020a", 100}
          })
          Fn_captionViewWait("ep16_00013")
        end
        Fn_blackout()
        Player:dropGrabObject()
        wait()
        Fn_warpNpc(_npc_child, _child_reset)
        Fn_resetPcPos(_player_reset)
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
        _child_fall_over = false
        _child_afraid_over = false
      end
      wait()
    end
  end
  L3_19 = L3_19(L4_20)
  _child_navi_task = L3_19
  _child_afraid = true
  L3_19 = 0
  while true do
    L5_21 = L2_18
    L4_20 = L2_18.isGrabbed
    L4_20 = L4_20(L5_21)
    if L4_20 then
      L4_20 = _child_fall_over
      if not L4_20 then
        L4_20 = _child_afraid_over
        if not L4_20 then
          L4_20 = _child_navi_flag
          if not L4_20 then
            L4_20 = _child_cry_task
            if L4_20 ~= nil then
              L4_20 = _child_cry_task
              L5_21 = L4_20
              L4_20 = L4_20.abort
              L4_20(L5_21)
              _child_cry_task = nil
            end
            L4_20 = Fn_missionViewEnd
            L4_20()
            L4_20 = Sound
            L5_21 = L4_20
            L4_20 = L4_20.playSE
            L6_22 = "w22_933c"
            L7_23 = 1
            L8_24 = ""
            L9_25 = puppets
            L9_25 = L9_25[_npc_child]
            L4_20(L5_21, L6_22, L7_23, L8_24, L9_25)
            L4_20 = Fn_captionView
            L5_21 = "ep16_00014"
            L4_20(L5_21)
            break
          end
        end
      end
    end
    L3_19 = L3_19 + 1
    if L0_16 < L3_19 then
      L4_20 = isNpcMotionEnd
      L5_21 = _npc_child
      L4_20 = L4_20(L5_21)
      if L4_20 then
        L4_20 = child_cry
        L4_20 = L4_20()
        _child_cry_task = L4_20
      end
    end
    L4_20 = wait
    L4_20()
  end
  L3_19 = waitSeconds
  L4_20 = 3
  L3_19(L4_20)
  while true do
    L4_20 = L2_18
    L3_19 = L2_18.isGrabbed
    L3_19 = L3_19(L4_20)
    if not L3_19 then
      L3_19 = wait
      L3_19()
    end
  end
  L3_19 = waitCaptionFunction
  function L4_20()
    Player:playVoice({
      {"kit036a", 100}
    })
    Fn_captionViewWait("ep16_00015")
    Sound:playSE("w22_904a", 1, "", puppets[_npc_child])
    Fn_captionViewWait("ep16_00016")
  end
  L3_19(L4_20)
  _child_grab_caption = "ep16_00017"
  _child_grab_voice = "w22_908a"
  L3_19 = Fn_missionView
  L4_20 = "ep16_00018"
  L3_19(L4_20)
  L3_19 = 0
  L4_20 = false
  _caption_timer = L1_17
  while not (L0_16 < L3_19) do
    L5_21 = _sensorEvent1
    if not L5_21 then
      L5_21 = _child_fall_over
      if not L5_21 then
        L5_21 = _child_afraid_over
        if not L5_21 then
          L5_21 = _child_navi_flag
          if not L5_21 then
            if L3_19 == 30 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_919a"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00019"
              L5_21(L6_22)
              L4_20 = false
            elseif L3_19 == 100 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_919c"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00020"
              L5_21(L6_22)
              L4_20 = false
            elseif L3_19 == 170 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_919b"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00021"
              L5_21(L6_22)
              L4_20 = false
            end
          end
          L6_22 = L2_18
          L5_21 = L2_18.isGrabbed
          L5_21 = L5_21(L6_22)
          if L5_21 then
            L5_21 = Player
            L6_22 = L5_21
            L5_21 = L5_21.getAction
            L5_21 = L5_21(L6_22)
            L6_22 = Player
            L7_23 = L6_22
            L6_22 = L6_22.getJumpStyle
            L6_22 = L6_22(L7_23)
            L7_23 = Player
            L7_23 = L7_23.kAction_Run
            if L5_21 ~= L7_23 then
              L7_23 = Player
              L7_23 = L7_23.kAction_MoonWalk
            else
              if L5_21 == L7_23 then
                L3_19 = L3_19 + 1
            end
            else
              L7_23 = Player
              L7_23 = L7_23.kAction_Idle
              if L5_21 == L7_23 then
                L7_23 = _caption_timer
                if L7_23 == 0 then
                  L7_23 = _child_navi_flag
                  if not L7_23 then
                    L7_23 = Sound
                    L8_24 = L7_23
                    L7_23 = L7_23.playSE
                    L9_25 = "w22_903c"
                    L7_23(L8_24, L9_25, 1, "", puppets[_npc_child])
                    L7_23 = Fn_captionView
                    L8_24 = "ep16_00022"
                    L7_23(L8_24)
                    _caption_timer = L1_17
                    L4_20 = false
                  end
                end
              else
                L7_23 = Player
                L8_24 = L7_23
                L7_23 = L7_23.isGravityControlMode
                L7_23 = L7_23(L8_24)
                if not L7_23 then
                  L7_23 = Player
                  L7_23 = L7_23.kAction_Jump
                  if L5_21 == L7_23 then
                    L7_23 = Player
                    L7_23 = L7_23.kJumpStyle_Spring
                    if L6_22 ~= L7_23 then
                      L7_23 = Player
                      L7_23 = L7_23.kJumpStyle_Rocket
                    end
                  end
                elseif L6_22 == L7_23 then
                  if not L4_20 then
                    L7_23 = waitCaptionFunction
                    function L8_24()
                      Sound:playSE("w22_933b", 1, "", puppets[_npc_child])
                      Fn_captionViewWait("ep16_00023")
                      Player:playVoice({
                        {"kit038b", 100}
                      })
                      Fn_captionView("ep16_00024")
                    end
                    L9_25 = false
                    L7_23(L8_24, L9_25)
                    _caption_timer = L1_17
                    L4_20 = true
                  else
                    L7_23 = _caption_timer
                    if L7_23 == 0 then
                      _child_afraid_over = true
                      L4_20 = false
                    end
                  end
                end
              end
            end
            L7_23 = math
            L7_23 = L7_23.max
            L8_24 = _caption_timer
            L8_24 = L8_24 - 1
            L9_25 = 0
            L7_23 = L7_23(L8_24, L9_25)
            _caption_timer = L7_23
          end
        end
      end
    end
    L5_21 = wait
    L5_21()
  end
  _child_afraid = false
  L3_19 = waitCaptionFunction
  function L4_20()
    Player:playVoice({
      {"kit040b", 100}
    })
    Fn_captionViewWait("ep16_00025")
    Sound:playSE("w22_906c", 1, "", puppets[_npc_child])
    Fn_captionViewWait("ep16_00026")
    Player:playVoice({
      {"kit050c", 100}
    })
    Fn_captionViewWait("ep16_00027")
  end
  L3_19(L4_20)
  L3_19 = Fn_missionView
  L4_20 = "ep16_00028"
  L3_19(L4_20)
  L3_19 = 0
  L4_20 = false
  _caption_timer = L1_17
  while not (L0_16 < L3_19) do
    L5_21 = _sensorEvent1
    if not L5_21 then
      L5_21 = _child_fall_over
      if not L5_21 then
        L5_21 = _child_afraid_over
        if not L5_21 then
          L5_21 = _child_navi_flag
          if not L5_21 then
            if L3_19 == 30 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_920a"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00029"
              L5_21(L6_22)
              L4_20 = false
            elseif L3_19 == 100 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_920b"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00030"
              L5_21(L6_22)
              L4_20 = false
            elseif L3_19 == 170 then
              L5_21 = Sound
              L6_22 = L5_21
              L5_21 = L5_21.playSE
              L7_23 = "w22_920c"
              L8_24 = 1
              L9_25 = ""
              L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
              L5_21 = Fn_captionView
              L6_22 = "ep16_00031"
              L5_21(L6_22)
              L4_20 = false
            end
          end
          L6_22 = L2_18
          L5_21 = L2_18.isGrabbed
          L5_21 = L5_21(L6_22)
          if L5_21 then
            L5_21 = Player
            L6_22 = L5_21
            L5_21 = L5_21.getAction
            L5_21 = L5_21(L6_22)
            L6_22 = Player
            L6_22 = L6_22.kAction_Slider
            if L5_21 == L6_22 then
              L3_19 = L3_19 + 1
            else
              L6_22 = Player
              L6_22 = L6_22.kAction_Idle
              if L5_21 == L6_22 then
                L6_22 = _caption_timer
                if L6_22 == 0 then
                  L6_22 = _child_navi_flag
                  if not L6_22 then
                    L6_22 = Sound
                    L7_23 = L6_22
                    L6_22 = L6_22.playSE
                    L8_24 = "w22_906b"
                    L9_25 = 1
                    L6_22(L7_23, L8_24, L9_25, "", puppets[_npc_child])
                    L6_22 = Fn_captionView
                    L7_23 = "ep16_00032"
                    L6_22(L7_23)
                    _caption_timer = L1_17
                    L4_20 = false
                  end
                end
              else
                L6_22 = Player
                L7_23 = L6_22
                L6_22 = L6_22.isGravityControlMode
                L6_22 = L6_22(L7_23)
                if L6_22 then
                  L6_22 = Player
                  L6_22 = L6_22.kAction_Float
                  if L5_21 ~= L6_22 then
                    if not L4_20 then
                      L6_22 = waitCaptionFunction
                      function L7_23()
                        Sound:playSE("w22_933b", 1, "", puppets[_npc_child])
                        Fn_captionViewWait("ep16_00033")
                        Player:playVoice({
                          {"kit038b", 100}
                        })
                        Fn_captionView("ep16_00034")
                      end
                      L8_24 = false
                      L6_22(L7_23, L8_24)
                      _caption_timer = L1_17
                      L4_20 = true
                    else
                      L6_22 = _caption_timer
                      if L6_22 == 0 then
                        _child_afraid_over = true
                        L4_20 = false
                      end
                    end
                  end
                end
              end
            end
            L6_22 = math
            L6_22 = L6_22.max
            L7_23 = _caption_timer
            L7_23 = L7_23 - 1
            L8_24 = 0
            L6_22 = L6_22(L7_23, L8_24)
            _caption_timer = L6_22
          end
        end
      end
    end
    L5_21 = wait
    L5_21()
  end
  L3_19 = Fn_pcSensorOff
  L4_20 = "pccubesensor2_01_01"
  L3_19(L4_20)
  L3_19 = Fn_pcSensorOff
  L4_20 = "pccubesensor2_01_02"
  L3_19(L4_20)
  L3_19 = Fn_pcSensorOn
  L4_20 = "pccubesensor2_02"
  L3_19(L4_20)
  while true do
    L4_20 = L2_18
    L3_19 = L2_18.isGrabbed
    L3_19 = L3_19(L4_20)
    if not L3_19 then
      L3_19 = wait
      L3_19()
    end
  end
  L3_19 = waitCaptionFunction
  function L4_20()
    Sound:playSE("w22_910c", 1, "", puppets[_npc_child])
    Fn_captionViewWait("ep16_00035")
    Sound:playSE("w22_909a", 1, "", puppets[_npc_child])
    Fn_captionViewWait("ep16_00036")
    RAC_LookAtObjectWait("locator2_navi_01", 0, 0.5)
  end
  L3_19(L4_20)
  L3_19 = RAC_missionNaviCaptionWait
  L4_20 = "ep16_00037"
  L5_21 = "locator2_navi_01"
  L6_22 = "ep16_00038"
  L7_23, L8_24, L9_25 = nil, nil, nil
  L3_19(L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, "kit036c")
  L3_19 = findGameObject2
  L4_20 = "Node"
  L5_21 = "locator2_navi_01"
  L3_19 = L3_19(L4_20, L5_21)
  _target_navi_hdl = L3_19
  L3_19 = _target_navi_hdl
  _targeted_navi_hdl = L3_19
  L3_19 = 0
  while not (L3_19 > 170) do
    L5_21 = L2_18
    L4_20 = L2_18.isGrabbed
    L4_20 = L4_20(L5_21)
    if L4_20 then
      L4_20 = _sensorEvent2
      if L4_20 then
        L4_20 = _child_fall_over
        if not L4_20 then
          L4_20 = _child_afraid_over
          if not L4_20 then
            L4_20 = _child_navi_flag
            if not L4_20 then
              _target_navi_hdl = nil
              if L3_19 == 30 then
                L4_20 = Sound
                L5_21 = L4_20
                L4_20 = L4_20.playSE
                L6_22 = "w22_920a"
                L7_23 = 1
                L8_24 = ""
                L9_25 = puppets
                L9_25 = L9_25[_npc_child]
                L4_20(L5_21, L6_22, L7_23, L8_24, L9_25)
                L4_20 = Fn_captionView
                L5_21 = "ep16_00039"
                L4_20(L5_21)
              elseif L3_19 == 100 then
                L4_20 = Sound
                L5_21 = L4_20
                L4_20 = L4_20.playSE
                L6_22 = "w22_920b"
                L7_23 = 1
                L8_24 = ""
                L9_25 = puppets
                L9_25 = L9_25[_npc_child]
                L4_20(L5_21, L6_22, L7_23, L8_24, L9_25)
                L4_20 = Fn_captionView
                L5_21 = "ep16_00040"
                L4_20(L5_21)
              end
              L3_19 = L3_19 + 1
            end
          end
        end
      else
        L4_20 = findGameObject2
        L5_21 = "Node"
        L6_22 = "locator2_navi_01"
        L4_20 = L4_20(L5_21, L6_22)
        _target_navi_hdl = L4_20
      end
    end
    L4_20 = wait
    L4_20()
  end
  _target_navi_hdl = nil
  L3_19 = Fn_pcSensorOff
  L4_20 = "pccubesensor2_02"
  L3_19(L4_20)
  L3_19 = waitCaptionFunction
  function L4_20()
    Sound:playSE("w22_919a", 1, "", puppets[_npc_child])
    Fn_captionViewWait("ep16_00041")
    RAC_LookAtObject("locator2_navi_03", 0, 0.5)
  end
  L3_19(L4_20)
  L3_19 = Fn_pcSensorOn
  L4_20 = "pccubesensor2_04"
  L3_19(L4_20)
  L3_19 = RAC_missionNaviCaptionWait
  L4_20 = "ep16_00042"
  L5_21 = "locator2_navi_03"
  L6_22 = "ep16_00043"
  L7_23, L8_24, L9_25 = nil, nil, nil
  L3_19(L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, "kit031a")
  L3_19 = findGameObject2
  L4_20 = "Node"
  L5_21 = "locator2_navi_03"
  L3_19 = L3_19(L4_20, L5_21)
  _target_navi_hdl = L3_19
  L3_19 = _target_navi_hdl
  _targeted_navi_hdl = L3_19
  L3_19 = false
  L4_20 = false
  while true do
    L6_22 = L2_18
    L5_21 = L2_18.isGrabbed
    L5_21 = L5_21(L6_22)
    if L5_21 then
      if not L3_19 then
        L5_21 = Fn_getDistanceToPlayer
        L6_22 = "locator2_navi_03"
        L5_21 = L5_21(L6_22)
        if L5_21 < 100 then
          L3_19 = true
          L5_21 = Sound
          L6_22 = L5_21
          L5_21 = L5_21.playSE
          L7_23 = "w22_906c"
          L8_24 = 1
          L9_25 = ""
          L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
          L5_21 = Fn_captionView
          L6_22 = "ep16_00044"
          L5_21(L6_22)
        end
      end
      if not L4_20 then
        L5_21 = Fn_getDistanceToPlayer
        L6_22 = "locator2_navi_03"
        L5_21 = L5_21(L6_22)
        if L5_21 < 50 then
          L4_20 = true
          L5_21 = Sound
          L6_22 = L5_21
          L5_21 = L5_21.playSE
          L7_23 = "w22_904c"
          L8_24 = 1
          L9_25 = ""
          L5_21(L6_22, L7_23, L8_24, L9_25, puppets[_npc_child])
          L5_21 = Fn_captionView
          L6_22 = "ep16_00045"
          L5_21(L6_22)
        end
      end
      L5_21 = _sensorEvent4
    end
    if not L5_21 then
      L5_21 = wait
      L5_21()
    end
  end
  _target_navi_hdl = nil
  L3_19 = Fn_missionViewEnd
  L3_19()
  L3_19 = Player
  L4_20 = L3_19
  L3_19 = L3_19.setStay
  L5_21 = true
  L6_22 = false
  L3_19(L4_20, L5_21, L6_22)
  L3_19 = Fn_userCtrlOff
  L3_19()
  L3_19 = Fn_blackout
  L4_20 = 2
  L3_19(L4_20)
  _child_navi_stop = true
  L3_19 = waitSeconds
  L4_20 = 2
  L3_19(L4_20)
  L3_19 = Player
  L4_20 = L3_19
  L3_19 = L3_19.dropGrabObject
  L3_19(L4_20)
  _child_grab_caption = nil
  L3_19 = Fn_setBgmPoint
  L4_20 = "event"
  L5_21 = "scriptdemo"
  L3_19(L4_20, L5_21)
  L4_20 = L2_18
  L3_19 = L2_18.setGrabReleaseForce
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = _npc_child
  L5_21 = false
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = _npc_sdemo_child
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = _npc_sdemo_bird1
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = _npc_sdemo_bird2
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = _npc_sdemo_bird3
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_resetPcPos
  L4_20 = "locator2_sdemo_pc_01"
  L3_19(L4_20)
  L3_19 = Fn_findNpc
  L4_20 = _npc_sdemo_bird1
  L3_19 = L3_19(L4_20)
  L5_21 = L3_19
  L4_20 = L3_19.wanderFly
  L6_22 = 15
  L7_23 = 5
  L8_24 = 15
  L4_20(L5_21, L6_22, L7_23, L8_24)
  L4_20 = Fn_findNpc
  L5_21 = _npc_sdemo_bird2
  L4_20 = L4_20(L5_21)
  L6_22 = L4_20
  L5_21 = L4_20.wanderFly
  L7_23 = 15
  L8_24 = 5
  L9_25 = 15
  L5_21(L6_22, L7_23, L8_24, L9_25)
  L5_21 = Fn_findNpc
  L6_22 = _npc_sdemo_bird3
  L5_21 = L5_21(L6_22)
  L7_23 = L5_21
  L6_22 = L5_21.wanderFly
  L8_24 = 15
  L9_25 = 5
  L6_22(L7_23, L8_24, L9_25, 15)
  _player_reset = "locator2_sdemo_pc_02"
  _child_reset = "locator2_sdemo_child_02"
  L6_22 = {L7_23}
  L7_23 = {}
  L7_23.pos = "locator2_sdemo_camera_02"
  L7_23.time = 8
  L7_23 = {L8_24}
  L8_24 = {}
  L8_24.pos = "locator2_sdemo_target_01"
  L8_24.time = 8
  L8_24 = sdemo
  L9_25 = L8_24
  L8_24 = L8_24.set
  L8_24(L9_25, "locator2_sdemo_camera_01", "locator2_sdemo_target_01", false)
  L8_24 = sdemo
  L9_25 = L8_24
  L8_24 = L8_24.play
  L8_24(L9_25, L6_22, L7_23)
  L8_24 = Fn_fadein
  L8_24()
  L8_24 = waitSeconds
  L9_25 = 3
  L8_24(L9_25)
  L8_24 = Fn_captionView
  L9_25 = "ep16_00046"
  L8_24(L9_25)
  L8_24 = waitSeconds
  L9_25 = 4
  L8_24(L9_25)
  L8_24 = {L9_25}
  L9_25 = {}
  L9_25.pos = "locator2_sdemo_camera_03"
  L9_25.time = 1
  L9_25 = {
    {
      pos = "locator2_sdemo_target_03",
      time = 6
    },
    {
      pos = "locator2_sdemo_target_04",
      time = 6
    }
  }
  sdemo:set("locator2_sdemo_camera_03", "locator2_sdemo_target_02", false)
  sdemo:play(L8_24, L9_25)
  Player:playVoice({
    {"kit040b", 100}
  })
  Fn_captionViewWait("ep16_00047")
  waitSeconds(0.5)
  Sound:playSE("w22_908c", 1, "", puppets[_npc_child])
  Fn_captionViewWait("ep16_00048")
  waitSeconds(0.5)
  Fn_captionViewWait("ep16_00049")
  Fn_blackout()
  Fn_setNpcActive(_npc_sdemo_child, false)
  Fn_setNpcActive(_npc_sdemo_bird1, false)
  Fn_setNpcActive(_npc_sdemo_bird2, false)
  Fn_setNpcActive(_npc_sdemo_bird3, false)
  Fn_setNpcActive(_npc_child, true)
  Fn_warpNpc(_npc_child, "locator2_sdemo_child_02")
  Fn_playMotionNpc(_npc_child, "stay", false)
  waitSeconds(2)
  sdemo:stop(0)
  Fn_setBgmPoint("event", "stage")
  Player:setStay(false)
  if _bulbosa_task ~= nil then
    _bulbosa_task:abort()
    _bulbosa_task = nil
  end
  Fn_setNpcActive(_npc_bulbosa, true)
  Fn_playMotionNpc(_npc_bulbosa, "stay", false)
  Fn_warpNpc(_npc_bulbosa, "locator2_Bulbosa_01")
  Fn_resetPcPos(_player_reset)
  Fn_fadein()
  Fn_userCtrlOn()
  Fn_pcSensorOn("pccubesensor2_05")
  invokeTask(function()
    Fn_turnNpc(_npc_child)
  end)
  Sound:playSE("w22_909c", 1, "", puppets[_npc_child])
  Fn_captionViewWait("ep16_00050")
  Fn_missionView("ep16_00051")
  waitSeconds(RAC_NAVI_DELAY_DEFAULT)
  Fn_setGrabNpc(_npc_child, false, true)
  _child_navi_stop = false
  while true do
    if L2_18:isGrabbed() and not _child_fall_over and not _child_afraid_over and not _child_navi_flag then
      Player:playVoice({
        {"kit032a", 100}
      })
      Fn_captionView("ep16_00052")
      break
    end
    wait()
  end
  waitSeconds(2)
  _target_navi_hdl = findGameObject2("Node", "locator2_Bulbosa_01")
  while true do
    if L2_18:isGrabbed() then
      if not false and 50 > Fn_getDistanceToPlayer("locator2_Bulbosa_01") then
        Sound:playSE("w22_924c", 1, "", puppets[_npc_child])
        Fn_captionView("ep16_00053")
      end
      if _sensorEvent5 then
        invokeTask(function()
          Fn_turnNpc(_npc_bulbosa)
          Sound:playSE("bul_904c", 1, "", puppets[_npc_bulbosa])
          Fn_playMotionNpc(_npc_bulbosa, "greeting", true)
        end)
        break
      end
    end
    wait()
  end
  _target_navi_hdl = nil
  if _child_navi_task ~= nil then
    _child_navi_task:abort()
    _child_navi_task = nil
  end
  if _child_grab_task ~= nil then
    _child_grab_task:abort()
    _child_grab_task = nil
  end
  Fn_naviKill()
  RAC_MultiNaviClear()
end
function child_cry()
  local L0_26
  L0_26 = {}
  L0_26.se_hdl = nil
  function L0_26.update(A0_27)
    local L1_28, L2_29
    L1_28 = {
      L2_29,
      "w22_917b",
      "w22_917c"
    }
    L2_29 = "w22_917a"
    L2_29 = Fn_playMotionNpc
    L2_29(_npc_child, "cry_00", false)
    while true do
      L2_29 = A0_27.se_hdl
      if L2_29 == nil then
        L2_29 = math
        L2_29 = L2_29.random
        L2_29 = L2_29(#L1_28)
        print("child_cry.." .. L2_29)
        A0_27.se_hdl = Sound:playSEHandle(L1_28[L2_29], 1, "", puppets[_npc_child])
        while A0_27.se_hdl ~= nil do
          wait()
        end
        waitSeconds(1)
      end
      L2_29 = wait
      L2_29()
    end
  end
  function L0_26.destractor(A0_30)
    if A0_30.se_hdl ~= nil then
      Sound:stopSEHandle(A0_30.se_hdl)
      A0_30.se_hdl = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L0_26.update, L0_26.destractor, L0_26)
end
