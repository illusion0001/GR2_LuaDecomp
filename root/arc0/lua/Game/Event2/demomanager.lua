import("PhotoMgr")
import("Time")
import("Font")
import("Sound")
import("Net")
import("Debug")
dofile("/Game/Event2/Common/GgdCommon.lua")
dofile("/Game/Event2/Common/MobCommon.lua")
dofile("/Game/Misc/cdemo.lua")
dofile("/Game/Event2/Table/RecollectionTable.lua")
_demo_list = {}
_prepare_list = {}
_prepare_name = nil
_prepare_type = "None"
CDemo = {
  capture_wait = true,
  finish = true,
  sndmng = nil,
  cdemo_name = "None"
}
_exitsandbox = false
_capture_permit = false
_capture_finish = false
_sndmng = nil
_emymng = nil
_return_title = false
_main_task = nil
_about_capture_task = false
function main()
  _sndmng = g_own:getGameObject("soundManager")
  _emymng = g_own:getGameObject("enemyManager")
  if not Debug:isMasterBuild() then
    debugDisp()
  end
  _main_task = invokeTask(demoManagement)
  wait()
end
function callBackExitSandbox()
  _sndmng = nil
  _emymng = nil
  _main_task = nil
  CDemo.capture_wait = false
  _exitsandbox = true
  _prepare_list = {}
  _prepare_name = nil
  _prepare_type = "None"
  HUD:menuCancel("Movie")
  HUD:menuCancel("TrueStaffRoll")
  HUD:menuCancel("FalseStaffRoll")
  HUD:menuCancel("Chapter")
end
setExitCallback(callBackExitSandbox)
function reset()
  if GameDatabase:get(ggd.GlobalSystemFlags__Demo) then
    _main_task:abort()
    GameDatabase:set(ggd.GlobalSystemFlags__Demo, false)
    _demo_list = {}
    _capture_permit = false
    _capture_finish = false
    _return_title = false
    _about_capture_task = true
    CDemo.capture_wait = false
    _main_task = invokeTask(demoManagement)
    debugPrint("\227\131\135\227\131\162\228\184\173\227\129\171\227\130\191\227\130\164\227\131\136\227\131\171\227\129\171\230\136\187\227\129\163\227\129\159\229\143\175\232\131\189\230\128\167\227\129\140\227\129\130\227\130\139\227\129\174\227\129\167\227\128\129demoManagement\227\130\146\228\189\156\227\130\138\231\155\180\227\129\151\227\129\190\227\129\151\227\129\159")
  end
  _prepare_list = {}
  _prepare_name = nil
  _prepare_type = "None"
  HUD:menuCancel("Movie")
  HUD:menuCancel("TrueStaffRoll")
  HUD:menuCancel("FalseStaffRoll")
  HUD:menuCancel("Chapter")
end
function demoManagement()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
  L0_0 = nil
  L1_1 = false
  L2_2 = {}
  L3_3 = 0
  while true do
    L3_3 = #L4_4
    if L3_3 > 0 then
      L7_7 = true
      L4_4(L5_5, L6_6, L7_7)
      for L7_7, L8_8 in L4_4(L5_5) do
        L9_9 = L8_8.name
        L10_10 = _override_moive_name
        L10_10 = L10_10[L9_9]
        if L10_10 then
          L10_10 = _override_moive_name
          L9_9 = L10_10[L9_9]
        end
        L10_10 = string
        L10_10 = L10_10.match
        L10_10 = L10_10(L11_11, L12_12)
        L10_10 = L10_10 .. L11_11
        for L15_15, L16_16 in L12_12(L13_13) do
          if L16_16 == L10_10 then
            break
          end
        end
        if L11_11 then
          L12_12(L13_13, L14_14)
        end
      end
      L7_7 = L2_2
      L4_4(L5_5, L6_6, L7_7)
      repeat
        L4_4()
      until not L4_4
      for L7_7, L8_8 in L4_4(L5_5) do
        L9_9 = L8_8.category
        L10_10 = L8_8.name
        L11_11(L12_12)
        L11_11(L12_12)
        if L11_11 ~= nil then
          if L11_11 ~= L10_10 then
            if L11_11 == "moive" then
              L11_11(L12_12)
              L11_11(L12_12, L13_13)
              L11_11()
              _prepare_name = nil
            end
          end
        end
        if L9_9 == "c_demo" then
          if L11_11 ~= nil then
          elseif L11_11 ~= L10_10 then
            CDemo = L11_11
            if L10_10 == "ep80_00700c" then
              L11_11(L12_12, L13_13)
              L15_15 = string
              L15_15 = L15_15.match
              L16_16 = L10_10
              L16_16 = L15_15(L16_16, "%d+")
              L15_15 = 1
              L16_16 = true
              L11_11(L12_12, L13_13, L14_14, L15_15, L16_16)
            else
              L15_15 = string
              L15_15 = L15_15.match
              L16_16 = L10_10
              L16_16 = L15_15(L16_16, "%d+")
              L16_16 = L14_14(L15_15, L16_16, L15_15(L16_16, "%d+"))
              L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L14_14(L15_15, L16_16, L15_15(L16_16, "%d+")))
            end
            L11_11(L12_12)
          end
          _prepare_name = nil
          if L11_11 then
            L11_11.capture_wait = false
          end
          if L11_11 then
            L11_11.capture_wait = false
          end
          while true do
            if L11_11 then
              L11_11()
            end
          end
          L11_11(L12_12, L13_13)
          L15_15 = L7_7
          L11_11(L12_12, L13_13, L14_14, L15_15)
          if L10_10 == "ep04_00500c" then
            L0_0 = 3
          elseif L10_10 == "ep12_00600c" then
            L0_0 = 4
          end
          L11_11(L12_12, L13_13)
          L11_11(L12_12, L13_13)
          L15_15 = tonumber
          L16_16 = string
          L16_16 = L16_16.match
          L16_16 = L16_16(L10_10, "%d+")
          L15_15 = L15_15(L16_16, L16_16(L10_10, "%d+"))
          L11_11(L12_12)
          L11_11(L12_12, L13_13, L14_14)
        elseif L9_9 == "movie" then
          L15_15 = L7_7
          L15_15 = _override_moive_name
          L15_15 = L15_15[L10_10]
          L15_15 = L15_15 and _override_moive_name
          L15_15 = _prepare_name
          if L15_15 ~= nil then
            L15_15 = _prepare_name
          elseif L15_15 ~= L14_14 then
            L15_15 = _prepareMovieDemo
            L16_16 = L14_14
            L15_15(L16_16, L11_11, L12_12)
            L15_15 = wait
            L15_15()
          end
          _prepare_name = nil
          L15_15 = CDemo
          L15_15.capture_wait = false
          while true do
            L15_15 = _isDemoRunning
            L15_15 = L15_15()
            if L15_15 then
              L15_15 = HUD
              L16_16 = L15_15
              L15_15 = L15_15.faderAlpha
              L15_15 = L15_15(L16_16)
              if L15_15 ~= 0 then
                L15_15 = HUD
                L16_16 = L15_15
                L15_15 = L15_15.fadein
                L15_15(L16_16, 0)
              end
              L15_15 = wait
              L15_15()
            end
          end
          L15_15 = _skipAutoSaveDemo
          L16_16 = L10_10
          L15_15(L16_16, L7_7)
          L15_15 = setNextMissionDemo
          L16_16 = _demo_list
          L15_15(L16_16, L10_10, L9_9, L7_7)
          L15_15 = _sndmng
          L16_16 = L15_15
          L15_15 = L15_15.sendEvent
          L15_15(L16_16, "request", L14_14, "movie", "play")
          L15_15 = _return_title
          if not L15_15 then
            if L13_13 then
              L15_15 = debugPrint
              L16_16 = "\227\131\160\227\131\188\227\131\147\227\131\188\227\129\174\227\130\173\227\131\163\227\131\151\227\131\129\227\131\163\227\131\188\227\130\179\227\131\188\227\131\171\227\131\144\227\131\131\227\130\175\232\168\173\229\174\154\227\130\146\227\130\185\227\130\173\227\131\131\227\131\151\227\129\151\227\129\190\227\129\153"
              L15_15(L16_16)
            else
              _about_capture_task = false
              L15_15 = HUD
              L16_16 = L15_15
              L15_15 = L15_15.setMovieCallback
              L15_15(L16_16, _waitSceneCapture)
            end
          end
          if L10_10 == "ep00_00500m" then
            L0_0 = 1
          end
          L15_15 = _switchDemoPause
          L16_16 = _demo_list
          L15_15(L16_16, L7_7)
          L15_15 = HUD
          L16_16 = L15_15
          L15_15 = L15_15.menuOpen
          L15_15(L16_16, "Movie")
          L15_15 = debugPrint
          L16_16 = "play moive : "
          L16_16 = L16_16 .. L10_10 .. " : " .. L14_14
          L15_15(L16_16)
          L15_15 = _waitRunning
          L16_16 = L10_10
          L15_15(L16_16, L3_3, "Movie")
        elseif L9_9 == "monologue" then
          L11_11.OnEnter = L12_12
          L11_11.OnIdle = L12_12
          L11_11.OnCancel = L12_12
          L11_11.RequestCapture = L12_12
          L11_11.WaitCapture = L12_12
          L15_15 = true
          L12_12(L13_13, L14_14, L15_15)
          L15_15 = L10_10
          L16_16 = "kdemo"
          L12_12(L13_13, L14_14, L15_15, L16_16, L10_10, "start")
          L15_15 = L11_11
          L12_12(L13_13, L14_14, L15_15)
          L12_12(L13_13)
          repeat
            L12_12()
          until L12_12
          L15_15 = false
          L12_12(L13_13, L14_14, L15_15)
          L15_15 = L10_10
          L16_16 = "kdemo"
          L12_12(L13_13, L14_14, L15_15, L16_16, L10_10, "end")
        elseif L9_9 == "recoll" then
          if L11_11 then
            L11_11(L12_12, L13_13, L14_14)
            while true do
              if L11_11 then
                L11_11()
              end
            end
            L11_11(L12_12, L13_13)
            L11_11()
            if L7_7 == 1 then
              L11_11(L12_12)
            else
              L11_11(L12_12)
            end
            L15_15 = "caption"
            L16_16 = "start"
            L11_11(L12_12, L13_13, L14_14, L15_15, L16_16)
            for L14_14, L15_15 in L11_11(L12_12) do
              L16_16 = L15_15.voice
              if L16_16 then
                L16_16 = invokeTask
                L16_16(function()
                  waitSeconds(L15_15.fadein)
                  Sound:playSE(L15_15.voice)
                end)
                L16_16 = wait
                L16_16()
              end
              L16_16 = L15_15.text_id
              if L16_16 then
                L16_16 = _sndmng
                L16_16 = L16_16.sendEvent
                L16_16(L16_16, "request", L10_10, "caption", L15_15.text_id)
                L16_16 = HUD
                L16_16 = L16_16.captionBegin
                L16_16(L16_16, L15_15.text_id, L15_15.time, Font.kLayerFront, L15_15.fadein, L15_15.fadeout)
                L16_16 = debugPrint
                L16_16(L15_15.text_id)
                repeat
                  L16_16 = wait
                  L16_16()
                  L16_16 = HUD
                  L16_16 = L16_16.captionGetTextId
                  L16_16 = L16_16(L16_16)
                until not L16_16
                L16_16 = debugPrint
                L16_16("\232\161\168\231\164\186\231\181\130\228\186\134")
              end
              L16_16 = debugPrint
              L16_16("\227\130\164\227\131\179\227\130\191\227\131\188\227\131\144\227\131\171\228\184\173")
              L16_16 = waitSeconds
              L16_16(L15_15.interval + L15_15.fadeout)
              L16_16 = L15_15.fader
              if L16_16 == "whiteout" then
                L16_16 = 0
                if L15_15.fadetime then
                  L16_16 = L15_15.fadetime
                end
                HUD:whiteout(L16_16)
                while not HUD:faderStability() do
                  wait()
                end
              else
              end
            end
            while true do
              if L11_11 ~= nil then
                L11_11()
              end
            end
            L15_15 = "caption"
            L16_16 = "end"
            L11_11(L12_12, L13_13, L14_14, L15_15, L16_16)
            L11_11(L12_12, L13_13, L14_14)
          end
        elseif L9_9 == "chapter" then
          L16_16 = L12_12(L13_13, L14_14)
          L12_12(L13_13, L14_14)
          L12_12(L13_13, L14_14)
          L12_12(L13_13)
          while true do
            if L12_12 then
              L12_12()
            end
          end
          L12_12(L13_13, L14_14)
          L15_15 = L9_9
          L16_16 = L7_7
          L12_12(L13_13, L14_14, L15_15, L16_16)
          L15_15 = L10_10
          L16_16 = "chapter"
          L12_12(L13_13, L14_14, L15_15, L16_16, "start")
          L12_12(L13_13, L14_14)
          L12_12(L13_13, L14_14)
          L12_12(L13_13)
          L12_12(L13_13)
          L12_12(L13_13, L14_14)
          L1_1 = true
          L12_12(L13_13)
          L15_15 = "Chapter"
          L12_12(L13_13, L14_14, L15_15)
        elseif L9_9 == "staff" then
          if L10_10 == "ep27_00400s" then
            L11_11(L12_12, L13_13)
            while true do
              if L11_11 then
                L11_11()
              end
            end
            L11_11(L12_12, L13_13)
            L15_15 = "staff_roll"
            L16_16 = "start"
            L11_11(L12_12, L13_13, L14_14, L15_15, L16_16)
            L0_0 = 6
            L11_11(L12_12, L13_13)
            L11_11(L12_12, L13_13)
            L11_11(L12_12, L13_13)
            L11_11(L12_12)
            L11_11()
            L11_11(L12_12, L13_13, L14_14)
          else
            L11_11(L12_12, L13_13)
            while true do
              if L11_11 then
                L11_11()
              end
            end
            L11_11(L12_12, L13_13)
            L15_15 = "staff_roll"
            L16_16 = "start"
            L11_11(L12_12, L13_13, L14_14, L15_15, L16_16)
            L0_0 = 5
            L11_11(L12_12, L13_13)
            L11_11(L12_12, L13_13)
            L11_11(L12_12, L13_13)
            L11_11(L12_12)
            L11_11()
            L11_11(L12_12, L13_13, L14_14)
          end
        end
        L11_11()
        break
      end
      while true do
        if L4_4 then
          L4_4()
        end
      end
      L4_4(L5_5)
      L4_4(L5_5, L6_6)
      L2_2 = L4_4
      if L1_1 then
        L4_4(L5_5)
        L4_4(L5_5)
        L1_1 = false
      end
      if not L4_4 then
        if L4_4 ~= "monologue" then
          L4_4(L5_5)
        end
      else
        L4_4(L5_5, L6_6)
      end
      if L0_0 then
        L7_7 = "\227\129\174\229\143\150\229\190\151\227\129\140\229\143\175\232\131\189\227\129\171\227\129\170\227\130\138\227\129\190\227\129\151\227\129\159"
        L4_4(L5_5)
        L7_7 = L0_0
        L4_4(L5_5, L6_6, L7_7)
        L0_0 = nil
      end
      _capture_permit = false
      _capture_finish = false
      _demo_list = L4_4
      L4_4(L5_5)
      if not L4_4 then
        L7_7 = false
        L4_4(L5_5, L6_6, L7_7)
      end
      if L4_4 then
        _prepare_list = L4_4
        if L4_4 then
          L7_7 = "gameOver"
          L5_5(L6_6, L7_7)
          _return_title = false
        end
      end
    end
    if L4_4 > 0 then
      for L7_7, L8_8 in L4_4(L5_5) do
        L9_9 = L8_8.category
        L10_10 = L8_8.name
        L11_11(L12_12)
        L11_11(L12_12)
        if L9_9 == "c_demo" then
          CDemo = L11_11
          L15_15 = string
          L15_15 = L15_15.match
          L16_16 = L10_10
          L16_16 = L15_15(L16_16, "%d+")
          L16_16 = L14_14(L15_15, L16_16, L15_15(L16_16, "%d+"))
          L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L14_14(L15_15, L16_16, L15_15(L16_16, "%d+")))
          _prepare_name = L10_10
          _prepare_type = "cdemo"
          break
        end
        if L9_9 == "movie" then
          L11_11(L12_12)
          L11_11(L12_12, L13_13)
          L11_11()
          L15_15 = L11_11
          L16_16 = L12_12
          L13_13(L14_14, L15_15, L16_16)
          _prepare_name = L10_10
          _prepare_type = "moive"
        end
        break
      end
      _prepare_list = L4_4
    end
    L4_4()
  end
end
function _prepareMovieDemo(A0_17, A1_18, A2_19)
  local L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29
  L3_20 = "capture"
  L4_21 = "black"
  L5_22 = "white"
  L6_23 = A1_18 and L3_20 or L4_21
  L7_24 = A2_19 and L3_20 or L4_21
  L8_25 = ""
  L9_26 = "0.0.0.0"
  L10_27 = 0.5
  L11_28 = "0.0.0.255"
  L12_29 = 0.5
  if L6_23 == L3_20 then
    L9_26 = "0.0.0.0"
    L10_27 = 0
    L8_25 = L8_25 .. "CaptureStart"
    debugPrint(A0_17 .. "\227\129\174\233\150\139\229\167\139\227\130\146\227\130\173\227\131\163\227\131\151\227\131\129\227\131\163\227\129\153\227\130\139\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  elseif L6_23 == L5_22 then
    L9_26 = "255.255.255.0"
    L10_27 = 0.5
    debugPrint(A0_17 .. "\227\129\174\233\150\139\229\167\139\227\130\146\227\131\155\227\131\175\227\130\164\227\131\136\227\130\162\227\130\166\227\131\136\227\129\174\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  else
    L9_26 = "0.0.0.0"
    L10_27 = 0.5
    debugPrint(A0_17 .. "\227\129\174\233\150\139\229\167\139\227\130\146\227\131\150\227\131\169\227\131\131\227\130\175\227\130\162\227\130\166\227\131\136\227\129\174\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  end
  if L7_24 == L3_20 then
    L11_28 = "0.0.0.0"
    L12_29 = 0
    L8_25 = L8_25 .. "CaptureEnd"
    debugPrint(A0_17 .. "\227\129\174\231\181\130\228\186\134\227\130\146\227\130\173\227\131\163\227\131\151\227\131\129\227\131\163\227\129\153\227\130\139\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  elseif L7_24 == L5_22 then
    L11_28 = "255.255.255.255"
    L12_29 = 0.5
    debugPrint(A0_17 .. "\227\129\174\231\181\130\228\186\134\227\130\146\227\131\155\227\131\175\227\130\164\227\131\136\227\130\162\227\130\166\227\131\136\227\129\174\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  else
    L11_28 = "0.0.0.255"
    L12_29 = 0.5
    debugPrint(A0_17 .. "\227\129\174\231\181\130\228\186\134\227\130\146\227\131\150\227\131\169\227\131\131\227\130\175\227\130\162\227\130\166\227\131\136\227\129\174\232\168\173\229\174\154\227\129\171\227\129\151\227\129\190\227\129\153")
  end
  HUD:prepareMovie(A0_17, L10_27, L9_26, L12_29, L11_28)
  HUD:menuReserve("Movie", L8_25)
  debugPrint(A0_17 .. "\227\130\146\228\186\136\231\180\132\227\129\151\227\129\190\227\129\151\227\129\159")
end
function _waitSceneCapture(A0_30)
  print(" [Capture in demo]" .. tostring(A0_30))
  invokeSystemTask(function()
    _capture_finish = false
    print(" <demo mng > wait capture")
    if _emymng then
      _emymng:requestIdlingEnemy(true)
    end
    HUD:menuNeedScriptingCapture()
    PhotoMgr:DeleteAllItem()
    if not _return_title then
      while not _exitsandbox and not _capture_permit and not _about_capture_task do
        wait()
      end
      wait(10)
    end
    if _emymng then
      _emymng:requestIdlingEnemy(false)
    end
    HUD:menuNotifyReadyCapture()
    wait()
    print(" <demo mng > finish capture")
    _capture_finish = true
    _about_capture_task = false
  end)
end
function _isDemoRunning()
  if HUD:menuStatus("Movie").state == "running" or HUD:menuStatus("CDemo").state == "running" or HUD:menuStatus("Chapter").state == "running" or HUD:menuStatus("FalseStaffRoll").state == "running" or HUD:menuStatus("TrueStaffRoll").state == "running" then
    return true
  end
  return false
end
function _checkMoveStartCapture(A0_31, A1_32)
  local L2_33, L3_34
  if A1_32 > 1 then
    L2_33 = A1_32 - 1
    L2_33 = A0_31[L2_33]
    if L2_33 then
      L2_33 = A1_32 - 1
      L2_33 = A0_31[L2_33]
      L2_33 = L2_33.category
      if L2_33 == "c_demo" then
        L3_34 = true
        return L3_34
      end
    end
  end
  L2_33 = false
  return L2_33
end
function _checkMoveEndCapture(A0_35, A1_36)
  local L2_37, L3_38
  L2_37 = #A0_35
  if A1_36 < L2_37 then
    L2_37 = A1_36 + 1
    L2_37 = A0_35[L2_37]
    if L2_37 then
      L2_37 = A1_36 + 1
      L2_37 = A0_35[L2_37]
      L2_37 = L2_37.category
      if L2_37 == "c_demo" or L2_37 == "chapter" or L2_37 == "staff" then
        L3_38 = true
        return L3_38
      end
    end
  end
  L2_37 = false
  return L2_37
end
function _checkMoveSkipCapture(A0_39, A1_40)
  local L2_41, L3_42
  L2_41 = #A0_39
  if A1_40 < L2_41 then
    L2_41 = A1_40 + 1
    L2_41 = A0_39[L2_41]
    if L2_41 then
      L2_41 = A1_40 + 1
      L2_41 = A0_39[L2_41]
      L2_41 = L2_41.category
      if L2_41 == "c_demo" or L2_41 == "chapter" or L2_41 == "staff" or L2_41 == "recoll" then
        L3_42 = true
        return L3_42
      end
    end
  end
  L2_41 = false
  return L2_41
end
function _switchDemoPause(A0_43, A1_44)
  if #A0_43 >= 2 then
    if A1_44 == 1 then
      HUD:setEnableDemoPauseAndCapture(false)
      debugPrint("\232\164\135\230\149\176\227\131\135\227\131\162\227\129\174\229\133\136\233\160\173\227\129\170\227\129\174\227\129\167\227\131\157\227\131\188\227\130\186\227\130\146\227\129\149\227\129\155\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130 " .. A0_43[A1_44].name)
    elseif A1_44 == #A0_43 then
      HUD:setEnableDemoPauseAndCapture(true)
      debugPrint("\232\164\135\230\149\176\227\131\135\227\131\162\227\129\174\230\156\128\229\190\140\227\129\170\227\129\174\227\129\167\227\131\157\227\131\188\227\130\186\227\130\146\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130 " .. A0_43[A1_44].name)
    elseif A1_44 == nil then
      HUD:setEnableDemoPauseAndCapture(true)
      debugPrint("\230\156\128\229\190\140\227\129\174\227\131\135\227\131\162\227\129\140\231\181\130\228\186\134\227\129\151\227\129\159\227\129\174\227\129\167\229\191\181\227\129\174\227\129\159\227\130\129\230\136\187\227\129\151\227\129\190\227\129\153 " .. A0_43[#A0_43].name)
    end
  end
end
function _skipAutoSaveDemo(A0_45, A1_46)
  if A0_45 == "ep26_00700m" or A0_45 == "ep26_re01" or A0_45 == "ep26_00750m" or A0_45 == "ep26_00800m" or A0_45 == "ep26_00900c" or A0_45 == "ep27_00300m" or A0_45 == "ep27_re01" or A0_45 == "ep27_00400s" then
    debugPrint(A0_45 .. "\227\129\175\227\130\170\227\131\188\227\131\136\227\130\187\227\131\188\227\131\150\227\129\140\227\130\185\227\130\173\227\131\131\227\131\151\227\129\149\227\130\140\227\129\190\227\129\153")
    _autoSaveSkip()
  end
  if A1_46 > 1 then
    debugPrint(A0_45 .. "\227\129\175\227\130\170\227\131\188\227\131\136\227\130\187\227\131\188\227\131\150\227\129\140\227\130\185\227\130\173\227\131\131\227\131\151\227\129\149\227\130\140\227\129\190\227\129\153")
    _autoSaveSkip()
  end
end
function _waitRunning(A0_47, A1_48, A2_49)
  wait()
  if HUD:menuStatus(A2_49).state == "no entry" then
    debugPrint("\229\136\164\229\174\154\229\137\141\227\129\171\227\131\157\227\131\188\227\130\186\227\129\149\227\130\140\227\129\166\227\131\135\227\131\162\227\129\140\231\181\130\228\186\134\227\129\151\227\129\159\227\130\136\227\129\134\227\129\170\227\129\174\227\129\167running\227\129\174\227\131\129\227\130\167\227\131\131\227\130\175\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147")
  elseif A1_48 > 1 then
    debugPrint("\232\164\135\230\149\176\227\131\135\227\131\162\227\129\170\227\129\174\227\129\167 " .. A0_47 .. " \227\129\140\229\174\159\232\161\140\227\129\149\227\130\140\227\130\139\227\129\190\227\129\167\230\172\161\227\129\171\233\128\178\227\129\190\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\229\190\133\227\129\161\227\129\190\227\129\153")
    debugPrint("\226\152\134 wait running " .. A0_47 .. " " .. tostring(A2_49) .. " " .. tostring(HUD:menuStatus(A2_49).state))
    while HUD:menuStatus(A2_49).state ~= "running" do
      debugPrint("\226\152\134 wait running " .. A0_47 .. " " .. tostring(A2_49) .. " " .. tostring(HUD:menuStatus(A2_49).state))
      wait()
    end
    debugPrint(A0_47 .. " \227\129\140\229\174\159\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
  end
end
function startup()
  if setStartMission() then
    _demo_list = setStartMission()
  elseif setStartMission() then
    _prepare_list = setStartMission()
  end
  _return_title = setStartMission()
  return setStartMission()
end
function setDemoList(A0_50, A1_51)
  if #_demo_list == 0 then
    _capture_permit = false
    _capture_finish = false
    CDemo.capture_wait = true
    _demo_list = A0_50
    _return_title = A1_51
  else
    debugPrint("\227\131\135\227\131\162\227\129\175\227\128\129\227\129\153\227\129\167\227\129\171\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\229\164\137\230\155\180\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
  end
end
function setPrepareList(A0_52)
  if #_prepare_list == 0 then
    _prepare_list = A0_52
  else
    debugPrint("\229\133\136\232\170\173\227\129\191\227\129\174\227\131\135\227\131\162\227\129\175\227\128\129\227\129\153\227\129\167\227\129\171\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\229\164\137\230\155\180\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
  end
end
function setCapturePermit()
  local L1_53
  _capture_permit = true
  L1_53 = CDemo
  L1_53.capture_wait = false
end
function setDebugFlags()
  return DBG_setCurrentMission()
end
function debugSkipStaffRoll()
  if GameDatabase:get(ggd.Debug__StartMission) == "None" or GameDatabase:get(ggd.Debug__StartMission) == nil then
  else
    HUD:creditCancelEnable()
  end
end
import("Font")
import("Debug")
_debugDisp = false
_debugDispX = 0
_debugLine = 0
function debugPrint(A0_54)
  print(" <demo mng > " .. A0_54)
end
function debugDispPrint(A0_55)
  local L1_56
  L1_56 = _debugDispX
  L1_56 = L1_56 + (Debug:isDebugMenuOpen() and 250 or 50)
  Font:debugPrint(L1_56, 50 + 18 * _debugLine, A0_55)
  _debugLine = _debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_57, L1_58, L2_59, L3_60, L4_61
    L0_57 = _phase
    while true do
      if not L1_58 then
        if L0_57 ~= L1_58 then
          L0_57 = _phase
          L1_58(L2_59)
        end
        if L1_58 then
          _debugDispX = 0
          _debugLine = 0
          L1_58(L2_59)
          L4_61 = _prepare_name
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = _prepare_type
          L4_61 = " ]"
          L1_58(L2_59)
          if L1_58 > 0 then
            L4_61 = _prepare_list
            L4_61 = L4_61[1]
            L4_61 = L4_61.name
            L4_61 = " ]"
            L1_58(L2_59)
          else
            L1_58(L2_59)
          end
          L4_61 = _capture_permit
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = _capture_finish
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = CDemo
          L4_61 = L4_61.capture_wait
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = CDemo
          L4_61 = L4_61.capture_wait_notime
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = _return_title
          L4_61 = " ]"
          L1_58(L2_59)
          L4_61 = _about_capture_task
          L4_61 = " ]"
          L1_58(L2_59)
          L1_58(L2_59)
          if L1_58 > 0 then
            for L4_61, _FORV_5_ in L1_58(L2_59) do
              debugDispPrint(L4_61 .. " : type [ " .. string.format("%-10s", _FORV_5_.category) .. " ]  name [ " .. string.format("%-15s", _FORV_5_.name) .. " ] ")
            end
          end
          L1_58(L2_59)
          if L1_58 > 0 then
            for L4_61, _FORV_5_ in L1_58(L2_59) do
              debugDispPrint(L4_61 .. " : type [ " .. string.format("%-10s", _FORV_5_.category) .. " ]  name [ " .. string.format("%-15s", _FORV_5_.name) .. " ] ")
            end
          end
          L1_58(L2_59)
          L4_61 = L3_60
          L1_58(L2_59)
          L4_61 = L3_60
          L1_58(L2_59)
          L4_61 = L3_60
          L1_58(L2_59)
          L4_61 = L3_60
          L1_58(L2_59)
          L4_61 = L3_60
          L1_58(L2_59)
        end
        L1_58()
      end
    end
  end)
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_62
      L1_62 = _debugDisp
      L1_62 = not L1_62
      _debugDisp = L1_62
    end
  }
}
