import("PhotoMgr")
import("Sound")
PDemo = {}
function PDemo.create(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7
  L3_3 = createGameObject2
  L4_4 = "PolyDemo"
  L3_3 = L3_3(L4_4)
  L4_4 = loadFileAsset
  L5_5 = "evd"
  L6_6 = "/pdemo/"
  L7_7 = A0_0
  L6_6 = L6_6 .. L7_7
  L4_4 = L4_4(L5_5, L6_6)
  L5_5 = loadFileAsset
  L6_6 = "evd"
  L7_7 = "/pdemo/"
  L7_7 = L7_7 .. A0_0 .. "_eff"
  L5_5 = L5_5(L6_6, L7_7)
  if L4_4 then
    L7_7 = L4_4
    L6_6 = L4_4.wait
    L6_6(L7_7)
    L7_7 = L3_3
    L6_6 = L3_3.setDescription
    L6_6(L7_7, L4_4:getRoot())
  end
  if L5_5 then
    L7_7 = L5_5
    L6_6 = L5_5.wait
    L6_6(L7_7)
    L7_7 = L3_3
    L6_6 = L3_3.setEffectDescription
    L6_6(L7_7, L5_5:getRoot())
  end
  L7_7 = L3_3
  L6_6 = L3_3.setName
  L6_6(L7_7, A0_0)
  L7_7 = L3_3
  L6_6 = L3_3.setManualSwitchCamera
  L6_6(L7_7, true)
  if A1_1 then
    L7_7 = A1_1
    L6_6 = A1_1.appendChild
    L6_6(L7_7, L3_3)
  end
  L7_7 = L3_3
  L6_6 = L3_3.setVisible
  L6_6(L7_7, false)
  L6_6 = true
  if A2_2 ~= nil then
    L7_7 = A2_2.camera
    if L7_7 ~= nil then
      L7_7 = A2_2.camera
      if L7_7 == false then
        L6_6 = false
      end
    end
    L7_7 = A2_2.scene_param
    if L7_7 ~= nil then
      L7_7 = A2_2.scene_param
    elseif L7_7 == false then
      L7_7 = L3_3.setIgnoreOwnSceneParam
      L7_7(L3_3, true)
      L7_7 = L3_3.setDisableSceneParamReset
      L7_7(L3_3, true)
    end
    L7_7 = A2_2.no_se
    if L7_7 ~= nil then
      L7_7 = A2_2.no_se
    else
      if L7_7 == false then
        no_se = false
    end
    else
      no_se = true
    end
  end
  L7_7 = {}
  L7_7.name = A0_0
  L7_7.pdemo = L3_3
  L7_7.camera = L6_6
  L7_7.no_se = no_se
  L7_7.sehandle = nil
  PDemo._installMethods(L7_7)
  return L7_7
end
function PDemo.play(A0_8, A1_9, A2_10)
  if not PDemo._isValid(A0_8) then
    return false
  end
  if A2_10 ~= false then
    Player:dropGrabObject(-1)
    wait()
  end
  Bullet:reset(Bullet.ID.Shockwave, Bullet.Owner.Player)
  if not A0_8:_isPlayPossible() then
    invokeTask(function()
      print(" [  pdemo  ] \227\131\157\227\131\170\227\131\135\227\131\162\229\190\133\230\169\159\228\184\173")
      A0_8.pdemo:setVisible(true)
      if A0_8.camera == true then
        A0_8.pdemo:switchCamera(true, 0)
      end
      A0_8.pdemo:play()
      A0_8.pdemo:stop()
      A0_8.pdemo:setCurrentFrame(1)
      while not A0_8:_isPlayPossible() do
        wait()
      end
      print(" [  pdemo  ] \227\131\157\227\131\170\227\131\135\227\131\162\229\190\133\230\169\159\231\181\130\228\186\134")
      A0_8:_play(A1_9)
    end)
    wait()
  else
    A0_8:_play(A1_9)
  end
end
function PDemo.switchCamera(A0_11, A1_12, A2_13)
  A0_11.pdemo:switchCamera(A1_12, A2_13 or 1)
end
function PDemo.stop(A0_14, A1_15, A2_16)
  local L3_17, L4_18
  L3_17 = PDemo
  L3_17 = L3_17._isValid
  L4_18 = A0_14
  L3_17 = L3_17(L4_18)
  if not L3_17 then
    L3_17 = false
    return L3_17
  end
  L3_17 = A0_14.camera
  if L3_17 == true then
    L3_17 = A0_14.pdemo
    L4_18 = L3_17
    L3_17 = L3_17.switchCamera
    L3_17(L4_18, false, A1_15 or 1)
    L3_17 = g_own
    L4_18 = L3_17
    L3_17 = L3_17.getGameObject
    L3_17 = L3_17(L4_18, "soundManager")
    if L3_17 then
      L4_18 = event_name
      if not L4_18 then
        L4_18 = g_own
        L4_18 = L4_18.getName
        L4_18 = L4_18(L4_18)
      end
      L3_17:sendEvent("request", L4_18, "pdemo", A0_14.name, "end")
    end
  end
  if A2_16 == true then
    L3_17 = A0_14.pdemo
    L4_18 = L3_17
    L3_17 = L3_17.stop
    L3_17(L4_18)
  end
  L3_17 = A0_14.sehandle
  if L3_17 then
    L3_17 = Sound
    L4_18 = L3_17
    L3_17 = L3_17.stopSEHandle
    L3_17(L4_18, A0_14.sehandle)
    L3_17 = print
    L4_18 = "pdemo : stopSE"
    L3_17(L4_18, A0_14.sehandle)
    A0_14.sehandle = nil
  end
end
function PDemo.isLoading(A0_19)
  if not PDemo._isValid(A0_19) then
    return false
  end
  return A0_19.pdemo:isSetupDone()
end
function PDemo.isEnd(A0_20)
  if not PDemo._isValid(A0_20) then
    return false
  end
  return A0_20.pdemo:isDemoEnd()
end
function PDemo.try_term(A0_21)
  if not PDemo._isValid(A0_21) then
    return false
  end
  A0_21.sehandle = nil
  A0_21.pdemo:try_term()
end
function PDemo.isStopped(A0_22)
  if not PDemo._isValid(A0_22) then
    return true
  end
  return A0_22.pdemo:isStopped()
end
function PDemo.reset(A0_23)
  if not PDemo._isValid(A0_23) then
    return false
  end
  if A0_23.sehandle then
    Sound:stopSEHandle(A0_23.sehandle)
    print("pdemo : stopSE", A0_23.sehandle)
    A0_23.sehandle = nil
  end
  A0_23.pdemo:reset()
end
function PDemo.setVisible(A0_24, A1_25)
  if not PDemo._isValid(A0_24) then
    return false
  end
  A0_24.pdemo:setVisible(A1_25)
end
function PDemo.getCurrentFrame(A0_26)
  if not PDemo._isValid(A0_26) then
    return false
  end
  return A0_26.pdemo:getCurrentFrame()
end
function PDemo.setCurrentFrame(A0_27, A1_28)
  if not PDemo._isValid(A0_27) then
    return false
  end
  return A0_27.pdemo:setCurrentFrame(A1_28)
end
function PDemo._isValid(A0_29)
  local L1_30
  if A0_29 == nil then
    L1_30 = false
    return L1_30
  end
  L1_30 = true
  return L1_30
end
function PDemo._installMethods(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36
  for L4_35, L5_36 in L1_32(L2_33) do
    if type(L5_36) == "function" then
      A0_31[L4_35] = L5_36
    end
  end
end
function PDemo._play(A0_37, A1_38)
  local L2_39, L3_40
  L2_39 = PhotoMgr
  L3_40 = L2_39
  L2_39 = L2_39.DeleteAllItem
  L2_39(L3_40)
  L2_39 = A0_37.pdemo
  L3_40 = L2_39
  L2_39 = L2_39.setVisible
  L2_39(L3_40, true)
  L2_39 = A0_37.camera
  if L2_39 == true then
    L2_39 = A0_37.pdemo
    L3_40 = L2_39
    L2_39 = L2_39.switchCamera
    L2_39(L3_40, true, 0)
  end
  L2_39 = g_own
  L3_40 = L2_39
  L2_39 = L2_39.getGameObject
  L2_39 = L2_39(L3_40, "soundManager")
  if L2_39 then
    L3_40 = event_name
    if not L3_40 then
      L3_40 = g_own
      L3_40 = L3_40.getName
      L3_40 = L3_40(L3_40)
    end
    L2_39:sendEvent("request", L3_40, "pdemo", A0_37.name, "start")
  end
  L3_40 = A0_37.no_se
  if L3_40 ~= true then
    L3_40 = Sound
    L3_40 = L3_40.playSEHandle
    L3_40 = L3_40(L3_40, A0_37.name)
    A0_37.sehandle = L3_40
    L3_40 = A0_37.sehandle
    __pdemo_sehandle = L3_40
    L3_40 = print
    L3_40("pdemo : playSE", A0_37.sehandle)
  end
  L3_40 = A0_37.pdemo
  L3_40 = L3_40.play
  L3_40(L3_40)
  if A1_38 == "blackout" or A1_38 == "whiteout" then
    L3_40 = invokeTask
    L3_40(function()
      local L0_41, L1_42
      L0_41 = A0_37.pdemo
      L1_42 = L0_41
      L0_41 = L0_41.getTotalDuration
      L0_41 = L0_41(L1_42)
      L1_42 = L0_41 - 30
      if L1_42 > 0 then
        wait(L1_42)
      end
      if A1_38 == "blackout" then
        HUD:blackout(1)
      elseif A1_38 == "whiteout" then
        HUD:whiteout(1)
      end
    end)
  end
end
function PDemo._isPlayPossible(A0_43)
  if HUD:faderAlpha() >= 1 or GameDatabase:get(ggd.GlobalSystemFlags__Demo) then
    return false
  end
  return true
end
