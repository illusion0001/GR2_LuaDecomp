import("Sound")
import("EventData")
import("GameDatabase")
import("HUD")
dofile("/Game/Event2/Table/SoundFunc.lua")
dofile("/Game/Event2/Table/SoundTable.lua")
_exit_sandbox = false
_request = false
_sandbox = nil
_request_reset = false
_request_table = {}
_phase = nil
_type = nil
_bgm_label = nil
_amb_handle = nil
_sdemo_cnt = 0
_buttle_cnt = 0
_sdemo_cut = 0
_num = 0
_sdemo = nil
_kdemo = nil
_cdemo = nil
_pdemo = nil
_request_first_amb = false
_request_load_sxd = false
_new_sxd_name = nil
_old_sxd_name = nil
_request_demo_load_sxd = false
_unload_demo_sxd = false
_new_demo_sxd_name = nil
_old_demo_sxd_name = nil
_request_voice_sxd = false
_new_voice_sxd_name = nil
_old_voice_sxd_name = nil
_request_evemy_sxd = false
_new_evemy_sxd_name = nil
_old_evemy_sxd_name = nil
_request_tv_sxd = false
_new_tv_sxd_name = nil
_old_tv_sxd_name = nil
_amb_name = nil
_bgm_cancel = false
_zls_load = {
  false,
  false,
  false
}
_jingle_name = nil
_log = {}
_unloadlog = {}
function main()
  debugDisp()
  debugPrint("no initialize")
  loadStream(1)
  invokeSystemTask(sxdLoadTask)
  invokeSystemTask(soundManagement)
  invokeSystemTask(playJingle)
  wait()
end
function exitsandbox()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  if L0_0 ~= nil then
    L0_0(L1_1, L2_2)
  end
  if L0_0 then
    L0_0(L1_1, L2_2)
    L0_0(L1_1)
  end
  if L0_0 then
    L0_0(L1_1, L2_2)
    L0_0(L1_1)
  end
  if L0_0 then
    L0_0(L1_1, L2_2)
    L0_0(L1_1)
  end
  if L0_0 then
    L0_0(L1_1, L2_2)
    L0_0(L1_1)
    if L0_0 == "mine" then
    else
    end
    if L1_1 then
      if L2_2 then
        for L5_5, L6_6 in L2_2(L3_3) do
          L8_8 = "unload sxd : "
          L9_9 = L6_6
          L8_8 = L8_8 .. L9_9
          L7_7(L8_8)
          L8_8 = L7_7
          L9_9 = L6_6
          L7_7(L8_8, L9_9)
        end
      end
    end
  end
  if L0_0 then
    for L3_3, L4_4 in L0_0(L1_1) do
      L5_5(L6_6, L7_7)
      L5_5(L6_6)
    end
  end
  for L3_3, L4_4 in L0_0(L1_1) do
    if L4_4 then
      for L8_8, L9_9 in L5_5(L6_6) do
        Sound:unloadStreamHeader(L9_9)
      end
    end
  end
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  _bgm_cancel = true
  _exit_sandbox = true
end
setExitCallback(exitsandbox)
function loadStream(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19
  for L4_14 = 1, A0_10 do
    if L5_15 == false then
      for L8_18, L9_19 in L5_15(L6_16) do
        debugPrint("loadStreamName : " .. L9_19)
        Sound:loadStreamHeader(L9_19)
      end
      L5_15[L4_14] = true
    end
  end
end
function playJingle()
  local L0_20
  while true do
    L0_20 = _exit_sandbox
    if not L0_20 then
      L0_20 = _jingle_name
      if L0_20 then
        L0_20 = debugPrint
        L0_20(_jingle_name .. "\227\130\146\227\130\185\227\131\134\227\131\188\227\131\136\227\130\146\229\164\137\227\129\136\227\129\166\229\134\141\231\148\159")
        L0_20 = Sound
        L0_20 = L0_20.pushSoundState
        L0_20(L0_20, 11)
        L0_20 = Sound
        L0_20 = L0_20.playSEHandle
        L0_20 = L0_20(L0_20, _jingle_name)
        repeat
          while not _exit_sandbox do
            wait()
          end
        until Sound:isPlayingSEHandle(L0_20) ~= 1
        Sound:popSoundState()
        debugPrint(_jingle_name .. "\227\130\146\227\130\185\227\131\134\227\131\188\227\131\136\227\130\146\229\164\137\227\129\136\227\129\166\231\181\130\228\186\134")
        _jingle_name = nil
      end
      L0_20 = wait
      L0_20()
    end
  end
end
function sxdLoadTask()
  local L0_21, L1_22, L2_23, L3_24, L4_25
  while true do
    if not L0_21 then
      if L0_21 then
        L0_21()
        _request_first_amb = false
      end
      if L0_21 then
        _old_voice_sxd_name = L0_21
        _request_voice_sxd = false
      end
      if L0_21 then
        _old_evemy_sxd_name = L0_21
        _request_evemy_sxd = false
      end
      if L0_21 then
        _old_tv_sxd_name = L0_21
        _request_tv_sxd = false
      end
      if L0_21 then
        _old_sxd_name = L0_21
        _request_load_sxd = false
      end
      if L0_21 then
        for L3_24, L4_25 in L0_21(L1_22) do
          if not Sound:isLoadResource(L4_25) then
            Sound:loadResource(L4_25)
          end
          debugPrint("load demo sxd : " .. L4_25)
        end
        _old_demo_sxd_name = L0_21
        _request_demo_load_sxd = false
        _new_demo_sxd_name = nil
      end
      if L0_21 then
        if L0_21 then
          for L3_24, L4_25 in L0_21(L1_22) do
            if _old_sxd_name ~= L4_25 then
              Sound:unloadResource(L4_25)
              setUnloadLog(val)
              debugPrint("unload demo sxd : " .. L4_25)
            else
              debugPrint("skip unload demo sxd : " .. L4_25)
            end
          end
          _old_demo_sxd_name = nil
          _unload_demo_sxd = nil
        end
      end
      if L0_21 then
        if L0_21 then
          L0_21()
        end
        _amb_name = nil
      end
      if L0_21 > 12 then
        L1_22(L2_23)
      elseif L0_21 > 4 then
        L1_22(L2_23)
      end
      L1_22()
    end
  end
end
function soundManagement()
  debugPrint("main task run!!")
  while not _exit_sandbox do
    if _request then
      _request_reset = false
      if findBgmParam() then
        if findBgmParam().play then
          if findBgmParam().variable then
            Sound:prepareBgm(findBgmParam().label, findBgmParam().variable_name, findBgmParam().variable)
            print("bgm : " .. findBgmParam().label .. " : " .. findBgmParam().variable_name .. " : " .. findBgmParam().variable)
          else
            Sound:prepareBgm(findBgmParam().label)
          end
          if Sound:checkReadyBgm(findBgmParam().label) ~= -1 then
            while true do
              if Sound:checkReadyBgm(findBgmParam().label) == -1 then
                if GameDatabase:get(ggd.GlobalSystemFlags__Demo) == false then
                  print("\227\131\135\227\131\162\228\184\173\227\129\171BGM\227\129\140\229\164\137\227\130\143\227\129\163\227\129\159\229\143\175\232\131\189\230\128\167\227\129\140\227\129\130\227\130\139\227\129\174\227\129\167\227\128\129\229\134\141\229\186\166\232\170\173\227\129\191\232\190\188\227\129\191\227\130\146\232\161\140\227\129\132\227\129\190\227\129\153\227\128\130")
                  if findBgmParam().variable then
                    Sound:prepareBgm(findBgmParam().label, findBgmParam().variable_name, findBgmParam().variable)
                    print("bgm : " .. findBgmParam().label .. " : " .. findBgmParam().variable_name .. " : " .. findBgmParam().variable)
                  else
                    Sound:prepareBgm(findBgmParam().label)
                  end
                end
              else
              end
              if not Sound:isReadyBgm(findBgmParam().label) and Sound:getPlayingBgmName() ~= findBgmParam().label and not _request_reset then
                wait()
              end
            end
            if not _request_reset then
              Sound:playBgm(findBgmParam().label, 1, findBgmParam().delay, findBgmParam().fade_in, findBgmParam().fade_out)
              debugPrint("playbgm : " .. tostring(findBgmParam().label))
              _bgm_label = findBgmParam().label
            else
              debugPrint("isReadyBgm\228\184\173\227\129\171reset\227\129\140\232\166\129\230\177\130\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
            end
          else
            debugPrint(findBgmParam().label .. " \227\129\140\231\153\187\233\140\178\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\229\134\141\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
            elseif findBgmParam().variable then
              Sound:setBgmVariable(findBgmParam().label, findBgmParam().variable_name, findBgmParam().variable)
              print("bgm : " .. findBgmParam().label .. " : " .. findBgmParam().variable_name .. " : " .. findBgmParam().variable)
            end
          end
        if not _request_reset and findBgmParam().func then
          findBgmParam().func()
        end
      end
      _request = false
    end
    wait()
  end
end
function findBgmParam()
  local L0_26
  L0_26 = setLog
  L0_26()
  L0_26 = bgm_list
  L0_26 = L0_26[_sandbox]
  if not L0_26 then
    L0_26 = nil
    return L0_26
  end
  L0_26 = bgm_list
  L0_26 = L0_26[_sandbox]
  L0_26 = #L0_26
  if L0_26 <= 0 then
    L0_26 = nil
    return L0_26
  end
  L0_26 = nil
  for _FORV_4_, _FORV_5_ in ipairs(_request_table) do
    for _FORV_9_, _FORV_10_ in ipairs(bgm_list[_sandbox]) do
      if _FORV_10_.phase == _FORV_5_.phase then
        if _type == "sdemo" then
        elseif _type == "kdemo" then
        elseif _type == "cdemo" then
        elseif _type == "pdemo" then
        else
        end
        if true then
          _num = _FORV_9_
          L0_26 = {
            label = _FORV_10_.label,
            variable_name = _FORV_10_.variable_name or "bgm_state",
            variable = _FORV_10_.variable,
            play = (_FORV_10_.label ~= nil and _FORV_10_.label ~= _bgm_label or _FORV_10_.forcing) and true,
            delay = _FORV_10_.delay or 0,
            fade_in = _FORV_10_.fade_in or 0,
            fade_out = _FORV_10_.fade_out or 0,
            func = _FORV_10_.func or nil
          }
          if _FORV_10_.city_bgm ~= nil then
            GameDatabase:set(ggd.GlobalSystemFlags__CityBgm, _FORV_10_.city_bgm)
          end
        end
      end
    end
  end
  _request_table = {}
  return L0_26
end
function reloadSxd(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41
  if A0_27 ~= nil and A0_27 ~= A1_28 then
    L2_29 = {}
    L3_30 = {}
    if A1_28 then
      L4_31 = string
      L4_31 = L4_31.match
      L5_32 = A1_28
      L4_31 = L4_31(L5_32, L6_33)
      if L4_31 == "mine" then
        L5_32 = Sound
        L5_32 = L5_32.unloadResource
        L5_32(L6_33, L7_34)
        L5_32 = setUnloadLog
        L5_32(L6_33)
        L5_32 = debugPrint
        L5_32(L6_33)
      else
        L5_32 = true
        if L6_33 then
          for L9_36, L10_37 in L6_33(L7_34) do
            if L10_37 == A1_28 then
              L5_32 = false
              break
            end
          end
        end
        if L5_32 then
          L6_33(L7_34, L8_35)
          L6_33(L7_34)
          L6_33(L7_34)
        else
          L6_33(L7_34)
        end
      end
      L5_32 = nil
      if L4_31 == "mine" then
        L5_32 = A1_28
      else
        L5_32 = L6_33
      end
      if L5_32 then
        if L6_33 then
          for L9_36, L10_37 in L6_33(L7_34) do
            L11_38(L12_39, L13_40)
          end
        end
      end
    end
    L4_31 = string
    L4_31 = L4_31.match
    L5_32 = A0_27
    L4_31 = L4_31(L5_32, L6_33)
    if L4_31 == "mine" then
      L5_32 = Sound
      L5_32 = L5_32.isLoadResource
      L5_32 = L5_32(L6_33, L7_34)
      if not L5_32 then
        L5_32 = Sound
        L5_32 = L5_32.loadResource
        L5_32(L6_33, L7_34)
      end
      L5_32 = debugPrint
      L5_32(L6_33)
    else
      L5_32 = Sound
      L5_32 = L5_32.isLoadResource
      L5_32 = L5_32(L6_33, L7_34)
      if not L5_32 then
        L5_32 = Sound
        L5_32 = L5_32.loadResource
        L5_32(L6_33, L7_34)
      end
      L5_32 = debugPrint
      L5_32(L6_33)
    end
    L5_32 = nil
    if L4_31 == "mine" then
      L5_32 = A0_27
    else
      L5_32 = L6_33
    end
    if L5_32 then
      if L6_33 then
        for L9_36, L10_37 in L6_33(L7_34) do
          L11_38(L12_39, L13_40)
        end
      end
    end
    for L9_36, L10_37 in L6_33(L7_34) do
      for L14_41, _FORV_15_ in L11_38(L12_39) do
        if L10_37 == _FORV_15_ then
          table.remove(L2_29, L14_41)
          table.remove(L3_30, L9_36)
        end
      end
    end
    for L9_36, L10_37 in L6_33(L7_34) do
      L11_38(L12_39, L13_40)
      L11_38(L12_39)
      L11_38(L12_39)
    end
    for L9_36, L10_37 in L6_33(L7_34) do
      if not L11_38 then
        L11_38(L12_39, L13_40)
      end
      L11_38(L12_39)
    end
    return A0_27
  end
  return A1_28
end
_request_tmp = nil
function request(A0_42, A1_43, A2_44, A3_45)
  local L4_46
  _request = true
  L4_46 = {}
  L4_46.phase = nil
  L4_46.type = nil
  L4_46.kdemo = nil
  L4_46.sdemo = nil
  L4_46.cdemo = nil
  L4_46.pdemo = nil
  if _sandbox ~= A0_42 and A0_42 ~= nil then
    if _sandbox then
      _bgm_cancel = true
    end
    _sandbox = A0_42
    _sdemo_cnt = 0
    _buttle_cnt = 0
    _request_table = {}
  end
  L4_46.type = A1_43
  _type = A1_43
  if A1_43 == "sdemo" then
    if not A3_45 then
      _sdemo_cnt = _sdemo_cnt + 1
    end
    _sdemo_cut = _sdemo_cut + 1
    L4_46.phase = A2_44 .. _sdemo_cnt
    L4_46.sdemo = _sdemo_cut
    _phase = A2_44 .. _sdemo_cnt
    _sdemo = _sdemo_cut
  elseif A1_43 == "kdemo" then
    L4_46.phase = A2_44
    L4_46.kdemo = A3_45
    _phase = A2_44
    _kdemo = A3_45
  elseif A1_43 == "battle" then
    _buttle_cnt = _buttle_cnt + 1
    L4_46.phase = A2_44 .. _buttle_cnt
    _phase = A2_44 .. _buttle_cnt
  elseif A1_43 == "pdemo" then
    L4_46.phase = A2_44
    L4_46.pdemo = A3_45
    _phase = A2_44
    _pdemo = A3_45
  elseif A0_42 == "eventheader" then
    if GameDatabase:get(ggd.GlobalSystemFlags__Demo) then
      L4_46 = nil
      if _request_tmp and _request_tmp:isRunning() then
        _request_tmp:abort()
      end
      _request_tmp = invokeTask(function()
        while GameDatabase:get(ggd.GlobalSystemFlags__Demo) do
          wait()
        end
        wait(3)
        _request = true
        L4_46 = {}
        L4_46.type = A1_43
        L4_46.phase = A2_44
        table.insert(_request_table, 1, L4_46)
      end)
    else
      L4_46.phase = A2_44
      _phase = A2_44
    end
  elseif A0_42 == nil then
    L4_46 = nil
    print(A2_44 .. "\227\129\175sandbox\227\129\140nil\227\129\170\227\129\174\227\129\167\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\168\227\129\151\227\129\166\229\143\151\227\129\145\228\187\152\227\129\145\227\129\190\227\129\155\227\130\147")
  else
    L4_46.phase = A2_44
    _phase = A2_44
  end
  if L4_46 then
    table.insert(_request_table, 1, L4_46)
  end
end
function reset()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55
  _request_reset = true
  _bgm_label = nil
  L0_47()
  L0_47()
  for L3_50 = 2, #L1_48 do
    if L4_51 == true then
      for L7_54, L8_55 in L4_51(L5_52) do
        Sound:unloadStreamHeader(L8_55)
      end
      L4_51[L3_50] = false
    end
  end
end
function resetCounter()
  local L0_56, L1_57
  _sdemo_cnt = 0
  _buttle_cnt = 0
  _sdemo_cut = 0
end
function resetParam()
  _bgm_label = nil
  _sdemo_cnt = 0
  _buttle_cnt = 0
  _sdemo_cut = 0
  Sound:playBgm("", 1, 0, 0, 0)
end
function requestAmb(A0_58)
  local L1_59
  _amb_name = A0_58
end
function requestFirstAmb()
  local L0_60, L1_61
  _request_first_amb = true
end
function requestLoadSxd(A0_62)
  local L1_63
  _request_load_sxd = true
  _new_sxd_name = A0_62
end
function isRequestLoadSxd()
  local L0_64, L1_65
  L0_64 = _request_load_sxd
  return L0_64
end
function requestLoadDemoSxd(A0_66)
  _request_demo_load_sxd = true
  _new_demo_sxd_name = copyTable(A0_66)
end
function isRequestLoadDemoSxd()
  local L0_67, L1_68
  L0_67 = _request_demo_load_sxd
  return L0_67
end
function requestUnLoadDemoSxd()
  local L0_69, L1_70
  _unload_demo_sxd = true
end
function setVoiceAnotherzone()
  local L0_71, L1_72
  _request_voice_sxd = true
  _new_voice_sxd_name = "anotherzone_se"
end
function setVoiceJirga()
  local L0_73, L1_74
end
function setVoiceHex()
  local L0_75, L1_76
end
function setVoiceBunga()
  local L0_77, L1_78
end
function setVoiceStPo()
  local L0_79, L1_80
end
function setVoiceStHx()
  local L0_81, L1_82
end
function requestJingle(A0_83)
  local L1_84
  _jingle_name = A0_83
end
function copyTable(A0_85)
  local L1_86, L2_87, L3_88, L4_89, L5_90, L6_91
  L1_86 = {}
  for L5_90, L6_91 in L2_87(L3_88) do
    if type(L6_91) == "table" then
      L1_86[L5_90] = copyTable(L6_91)
    else
      L1_86[L5_90] = L6_91
    end
  end
  return L1_86
end
import("Font")
import("Debug")
_debugDisp = false
_debugLine = 0
_debugDispX = 0
_debugIcon = 0
function debugPrint(A0_92)
  print(" < snd mng > " .. A0_92)
end
function debugDisp()
  invokeSystemTask(function()
    local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L14_107, L15_108, L16_109, L17_110, L18_111, L19_112, L20_113, L21_114
    while true do
      if not L0_93 then
        if L0_93 == false then
          if L0_93 >= 1 then
            _debugLine = 0
            _debugDispX = 0
            L5_98 = "city bgm = [ "
            L6_99 = tostring
            L7_100 = GameDatabase
            L7_100 = L7_100.get
            L21_114 = L7_100(L8_101, L9_102)
            L6_99 = L6_99(L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L14_107, L15_108, L16_109, L17_110, L18_111, L19_112, L20_113, L21_114, L7_100(L8_101, L9_102))
            L7_100 = " ]"
            L5_98 = L5_98 .. L6_99 .. L7_100
            L4_97(L5_98)
            L5_98 = "mission  = [ "
            L6_99 = L1_94
            L7_100 = " ]"
            L5_98 = L5_98 .. L6_99 .. L7_100
            L4_97(L5_98)
            L5_98 = "phase    = [ "
            L6_99 = L2_95
            L7_100 = " ]"
            L5_98 = L5_98 .. L6_99 .. L7_100
            L4_97(L5_98)
            if L4_97 == "sdemo" then
              L5_98 = "sdemo    = [ "
              L6_99 = _sdemo
              L7_100 = " ]"
              L5_98 = L5_98 .. L6_99 .. L7_100
              L4_97(L5_98)
            elseif L4_97 == "kdemo" then
              L5_98 = "kdemo    = [ "
              L6_99 = _kdemo
              L7_100 = " ]"
              L5_98 = L5_98 .. L6_99 .. L7_100
              L4_97(L5_98)
            elseif L4_97 == "pdemo" then
              L5_98 = "pdemo    = [ "
              L6_99 = _pdemo
              L7_100 = " ]"
              L5_98 = L5_98 .. L6_99 .. L7_100
              L4_97(L5_98)
            else
              L4_97()
            end
          end
          if L0_93 >= 2 then
            if L1_94 then
              if L1_94 > 0 then
                L1_94(L2_95)
                L5_98 = false
                L6_99 = true
                L7_100 = 0
                for L11_104, L12_105 in L8_101(L9_102) do
                  L13_106 = L12_105.phase
                  L13_106 = L13_106 or "nil"
                  L14_107 = L12_105.label
                  L14_107 = L14_107 or "nil"
                  L15_108 = L12_105.variable_name
                  L15_108 = L15_108 or "bgm_state"
                  L16_109 = L12_105.variable
                  if L16_109 then
                    L16_109 = string
                    L16_109 = L16_109.format
                    L17_110 = "%-15s"
                    L18_111 = L12_105.variable
                    L16_109 = L16_109(L17_110, L18_111)
                  else
                    L16_109 = L16_109 or "nil"
                  end
                  L17_110 = ""
                  L18_111 = ""
                  L19_112 = ""
                  L20_113 = ""
                  L21_114 = "  "
                  if L12_105.sdemo then
                    L17_110 = "sdemo [ " .. string.format("%-6s", L12_105.sdemo) .. " ] "
                  elseif L12_105.kdemo then
                    L17_110 = "kdemo [ " .. string.format("%-6s", L12_105.kdemo) .. " ] "
                  elseif L12_105.pdemo then
                    L17_110 = "pdemo [ " .. string.format("%-6s", L12_105.pdemo) .. " ] "
                  end
                  if _num == L11_104 then
                    L21_114 = " >"
                  end
                  if L12_105.delay then
                    L18_111 = "delay [ " .. string.format("%d", L12_105.delay) .. " ] "
                  end
                  if L12_105.fade_in then
                    L19_112 = "in [ " .. string.format("%d", L12_105.fade_in) .. " ] "
                  end
                  if L12_105.fade_out then
                    L20_113 = "out [ " .. string.format("%d", L12_105.fade_out) .. " ] "
                  end
                  if L2_95 then
                    if _num < 12 then
                      if L11_104 > 12 then
                        L5_98 = true
                        L6_99 = false
                      end
                    elseif not L3_96 then
                      L6_99 = false
                    else
                      if L11_104 <= _num - 10 then
                        L6_99 = false
                      else
                        L6_99 = true
                      end
                      if L7_100 >= 12 then
                        L5_98 = true
                        L6_99 = false
                      end
                    end
                  end
                  if L4_97 then
                    debugDispPirint("  ...")
                    L7_100 = L7_100 + 1
                  end
                  if L6_99 then
                    debugDispPirint(L21_114 .. "label [ " .. string.format("%-8s", L14_107) .. " ] variable [ " .. L16_109 .. " ] phase [ " .. string.format("%-15s", L13_106) .. " ] " .. L17_110 .. L18_111 .. L19_112 .. L20_113)
                    L7_100 = L7_100 + 1
                  end
                  if not L5_98 then
                  end
                end
              end
            else
              L1_94(L2_95)
            end
          end
          if L0_93 >= 3 then
            _debugLine = 18
            if L1_94 > 0 then
              L1_94(L2_95)
              for L4_97, L5_98 in L1_94(L2_95) do
                L6_99 = ""
                L7_100 = L5_98.sdemo
                if L7_100 then
                  L7_100 = "sdemo [ "
                  L6_99 = L7_100 .. L8_101 .. L9_102
                else
                  L7_100 = L5_98.kdemo
                  if L7_100 then
                    L7_100 = "kdemo [ "
                    L6_99 = L7_100 .. L8_101 .. L9_102
                  else
                    L7_100 = L5_98.pdemo
                    if L7_100 then
                      L7_100 = "pdemo [ "
                      L6_99 = L7_100 .. L8_101 .. L9_102
                    end
                  end
                end
                L7_100 = debugDispPirint
                L11_104 = "%-11s"
                L12_105 = L5_98.mission
                L11_104 = " ] phase [ "
                L12_105 = string
                L12_105 = L12_105.format
                L13_106 = "%-15s"
                L14_107 = L5_98.phase
                L12_105 = L12_105(L13_106, L14_107)
                L13_106 = " ] "
                L14_107 = L6_99
                L15_108 = L5_98.icon
                L7_100(L8_101)
              end
            else
              L1_94(L2_95)
            end
          end
        else
          _debugLine = 0
          _debugDispX = 0
          L0_93(L1_94)
          L5_98 = _new_sxd_name
          L21_114 = L4_97(L5_98)
          L5_98 = "%-15s"
          L6_99 = tostring
          L7_100 = _old_sxd_name
          L21_114 = L6_99(L7_100)
          L5_98 = " ] "
          L0_93(L1_94)
          L5_98 = _new_voice_sxd_name
          L21_114 = L4_97(L5_98)
          L5_98 = "%-15s"
          L6_99 = tostring
          L7_100 = _old_voice_sxd_name
          L21_114 = L6_99(L7_100)
          L5_98 = " ] "
          L0_93(L1_94)
          L5_98 = _new_evemy_sxd_name
          L21_114 = L4_97(L5_98)
          L5_98 = "%-15s"
          L6_99 = tostring
          L7_100 = _old_evemy_sxd_name
          L21_114 = L6_99(L7_100)
          L5_98 = " ] "
          L0_93(L1_94)
          L5_98 = _new_tv_sxd_name
          L21_114 = L4_97(L5_98)
          L5_98 = "%-15s"
          L6_99 = tostring
          L7_100 = _old_tv_sxd_name
          L21_114 = L6_99(L7_100)
          L5_98 = " ] "
          L0_93(L1_94)
          L0_93(L1_94)
          if L0_93 then
            if L0_93 == "mine" then
            else
            end
            if L1_94 then
              if L2_95 then
                for L5_98, L6_99 in L2_95(L3_96) do
                  L7_100 = debugDispPirint
                  L7_100(L8_101)
                end
              end
            end
          end
          L0_93(L1_94)
          if L0_93 ~= nil then
            for L3_96, L4_97 in L0_93(L1_94) do
              L5_98 = debugDispPirint
              L6_99 = " ["
              L7_100 = tostring
              L7_100 = L7_100(L8_101)
              L6_99 = L6_99 .. L7_100 .. L8_101
              L5_98(L6_99)
            end
          end
          L0_93(L1_94)
          for L3_96, L4_97 in L0_93(L1_94) do
            L5_98 = debugDispPirint
            L6_99 = tostring
            L7_100 = L4_97
            L21_114 = L6_99(L7_100)
            L5_98(L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L14_107, L15_108, L16_109, L17_110, L18_111, L19_112, L20_113, L21_114, L6_99(L7_100))
          end
          _debugLine = 0
          _debugDispX = 500
          L0_93(L1_94)
          for L3_96, L4_97 in L0_93(L1_94) do
            L5_98 = debugDispPirint
            L6_99 = L3_96
            L7_100 = " : "
            L6_99 = L6_99 .. L7_100 .. L8_101
            L5_98(L6_99)
          end
        end
        L0_93()
      end
    end
  end)
end
function debugDispPirint(A0_115)
  if A0_115 then
    if Debug:isDebugMenuOpen() == true then
      Font:debugPrint(250 + _debugDispX, 30 + 16 * _debugLine, A0_115)
    else
      Font:debugPrint(30 + _debugDispX, 30 + 16 * _debugLine, A0_115)
    end
  end
  _debugLine = _debugLine + 1
end
function setLog()
  local L0_116, L1_117, L2_118, L3_119, L4_120, L5_121, L6_122
  L0_116 = 0
  if L1_117 >= 1 then
    if L1_117 == 0 then
      _debugIcon = 1
      L0_116 = 1
    else
      _debugIcon = 0
      L0_116 = 2
    end
  end
  for L4_120, L5_121 in L1_117(L2_118) do
    L6_122 = {}
    L6_122.mission = _sandbox
    L6_122.phase = L5_121.phase
    if L5_121.type == "sdemo" then
      L6_122.sdemo = L5_121.sdemo
    elseif L5_121.type == "kdemo" then
      L6_122.kdemo = L5_121.kdemo
    elseif L5_121.type == "cdemo" then
      L6_122.cdemo = L5_121.cdemo
    elseif L5_121.type == "pdemo" then
      L6_122.pdemo = L5_121.pdemo
    end
    if L0_116 == 1 then
      L6_122.icon = " \239\188\160"
    elseif L0_116 == 2 then
      L6_122.icon = " \226\150\161"
    end
    table.insert(_log, L4_120, L6_122)
    if #_log > 5 then
      table.remove(_log)
    end
    if not (L4_120 > 5) then
    end
  end
end
function setUnloadLog(A0_123)
  table.insert(_unloadlog, 1, A0_123)
  if #_unloadlog > 20 then
    table.remove(_unloadlog)
  end
end
g_customDebugMenu = {
  {
    name = "DebugDispBgm",
    callback = function()
      local L0_124
      L0_124 = GameDatabase
      L0_124 = L0_124.get
      L0_124 = L0_124(L0_124, ggd.Debug__DispBgm)
      L0_124 = L0_124 + 1
      if L0_124 > 3 then
        L0_124 = 0
      end
      GameDatabase:set(ggd.Debug__DispBgm, L0_124)
    end
  },
  {
    name = "DebugDisp",
    callback = function()
      local L1_125
      L1_125 = _debugDisp
      L1_125 = not L1_125
      _debugDisp = L1_125
    end
  }
}
