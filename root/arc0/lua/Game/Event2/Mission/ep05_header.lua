dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("GameDatabase")
import("Pad")
BOX_MAX = 13
CAP_INTERVAL = 120
_vogo_box_task = nil
_vogo_box_hdl = {}
_vogo_ship_warp_task = nil
_any_mission_clear = false
_map_task = nil
_cid_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_loadEventData
  L1_1 = "evx/ep05_setup"
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  ship_hdl = L0_0
  L0_0 = ship_hdl
  L1_1 = L0_0
  L0_0 = L0_0.setName
  L0_0(L1_1, L2_2)
  L0_0 = {}
  L1_1 = {}
  L1_1.rand = 1
  L1_1.sign = 1
  L1_1.max_a = 1
  L1_1.min_a = 0.5
  L1_1.max_t = 30
  L1_1.min_t = 10
  L0_0.xz = L1_1
  L1_1 = {}
  L1_1.rand = 1
  L1_1.sign = 0.5
  L1_1.max_a = 1
  L1_1.min_a = 0.5
  L1_1.max_t = 20
  L1_1.min_t = 10
  L0_0.y = L1_1
  L1_1 = {}
  L1_1.rand = 0
  L1_1.sign = 0
  L1_1.max_a = 0
  L1_1.min_a = 0
  L1_1.max_t = 60
  L1_1.min_t = 30
  L0_0.angle = L1_1
  L1_1 = ship_hdl
  L1_1 = L1_1.setDriftParams
  L1_1(L2_2, L3_3)
  L1_1 = {
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    {
      model_name = "woodboxvogo_kk_01"
    },
    {
      model_name = "woodboxvogo_kk_01"
    },
    {
      model_name = "woodboxvogo_kk_02"
    },
    {
      model_name = "woodboxvogo_kk_02"
    },
    {
      model_name = "woodboxvogo_kk_01"
    },
    {
      model_name = "woodboxvogo_kk_01"
    },
    {
      model_name = "woodboxvogo_kk_02"
    },
    {
      model_name = "woodboxvogo_kk_02"
    },
    {
      model_name = "woodboxvogo_kk_02"
    }
  }
  L2_2.model_name = "woodboxvogo_kk_01"
  L3_3.model_name = "woodboxvogo_kk_02"
  L4_4.model_name = "woodboxvogo_kk_03"
  L5_5 = {}
  L5_5.model_name = "woodboxvogo_kk_03"
  for L5_5, _FORV_6_ in L2_2(L3_3) do
    _vogo_box_hdl[L5_5] = Fn_createGimmickBg("locator2_setup_box_vogo_" .. string.format("%02d", L5_5), "box_" .. string.format("%02d", L5_5), _FORV_6_.model_name, false)
  end
  if L2_2 ~= 1 then
    if L2_2 ~= 1 then
    end
  else
    if L2_2 == 1 then
      L2_2(L3_3)
      _any_mission_clear = true
  end
  else
    L2_2(L3_3)
    _any_mission_clear = false
  end
end
function Ingame()
  local L0_6, L1_7, L2_8
  L0_6 = invokeTask
  function L1_7()
    while true do
      if Fn_isValidNpc("eps05_cid01", 40) == false then
        Fn_disappearNpc("eps05_cid01")
        break
      end
      waitSeconds(1)
    end
  end
  L0_6 = L0_6(L1_7)
  _cid_task = L0_6
  L0_6 = findGameObject2
  L1_7 = "Node"
  L2_8 = "locator2_setup_ve_vogo_01"
  L0_6 = L0_6(L1_7, L2_8)
  L1_7 = ship_hdl
  L2_8 = L1_7
  L1_7 = L1_7.setWorldTransform
  L1_7(L2_8, L0_6:getWorldTransform())
  L1_7 = ship_hdl
  L2_8 = L1_7
  L1_7 = L1_7.setForceMove
  L1_7(L2_8)
  L1_7 = invokeTask
  function L2_8()
    local L0_9, L1_10, L2_11
    L0_9 = false
    L1_10 = Fn_getGameObject
    L2_11 = "bgManager"
    L1_10 = L1_10(L2_11)
    if not L1_10 then
      L2_11 = nil
      return L2_11
    end
    L2_11 = nil
    repeat
      L2_11 = L1_10:sendEvent("getBgsetHandle")
      wait()
    until L2_11 ~= nil
    while true do
      if HUD:faderAlpha() >= 1 then
        if L2_11:sendEvent("isConnectingFinish") then
          if L0_9 then
            print("ep05_header \227\131\180\227\130\169\227\130\180\232\136\185\227\129\174\229\134\141\233\133\141\231\189\174\227\130\146\232\161\140\227\129\132\227\129\190\227\129\153")
            if findGameObject2("Node", "locator2_setup_ve_vogo_01") then
              ship_hdl:setWorldTransform(findGameObject2("Node", "locator2_setup_ve_vogo_01"):getWorldTransform())
              ship_hdl:setForceMove()
              L0_9 = false
            end
          end
        else
          L0_9 = true
        end
      end
      wait()
    end
  end
  L1_7 = L1_7(L2_8)
  _vogo_ship_warp_task = L1_7
  L1_7 = nil
  while true do
    L2_8 = Fn_findNpcPuppet
    L2_8 = L2_8("ep05_vogo_01")
    L1_7 = L2_8
    if L1_7 == nil then
      L2_8 = wait
      L2_8()
    end
  end
  L2_8 = print
  L2_8("\227\131\180\227\130\169\227\130\180\227\131\143\227\131\179\227\131\137\227\131\171\229\143\150\229\190\151\231\181\130\228\186\134\239\188\129")
  L2_8 = false
  for _FORV_6_ = 1, BOX_MAX do
    _vogo_box_hdl[_FORV_6_]:setEventListener("broken", function(A0_12)
      if Fn_getDistanceToPlayer(L1_7) < 20 then
        L2_8 = true
      end
    end)
  end
  _vogo_box_task = invokeTask(function()
    local L0_13
    while true do
      L0_13 = L2_8
      if L0_13 == true then
        L0_13 = Player
        L0_13 = L0_13.setStay
        L0_13(L0_13, true)
        L0_13 = waitSeconds
        L0_13(1)
        L0_13 = print
        L0_13("vogo01_pupp =", L1_7)
        L0_13 = Mv_viewObj
        L0_13 = L0_13(L1_7, 0.4, 1.5)
        Player:setLookAtIk(true, 1, L1_7:getWorldPos())
        Fn_turnNpc("ep05_vogo_01")
        Fn_playMotionNpc("ep05_vogo_01", "angry_00", false)
        Sound:playSE("vog020a", 1, "", L1_7)
        Fn_captionViewWait("ep05_10000")
        L0_13 = Mv_safeTaskAbort(L0_13)
        Fn_blackout()
        Fn_playMotionNpc("ep05_vogo_01", "stay", false)
        wait()
        Fn_resetPcPos("locator2_resetpos_near_box")
        Fn_warpNpc("ep05_vogo_01", "locator2_vogo_01")
        Area:requestRestore()
        wait()
        Player:setStay(false)
        Fn_fadein()
        L2_8 = false
      end
      L0_13 = wait
      L0_13()
    end
  end)
  _map_task = invokeTask(function()
    local L0_14
    L0_14 = 0
    while true do
      if _any_mission_clear then
        print("\227\129\169\227\130\140\227\129\139\227\130\175\227\131\170\227\130\162\230\184\136\227\129\160\227\129\139\227\130\137\227\131\171\227\131\188\227\131\151\231\181\130\228\186\134")
        break
      end
      if L0_14 % CAP_INTERVAL == 0 then
        Fn_tutorialCaption("map")
        invokeTask(function()
          waitSeconds(5)
          print("\232\161\168\231\164\186\227\129\139\227\130\1375\231\167\146\231\181\140\233\129\142\227\129\151\227\129\159\227\129\139\227\130\137Fn_tutorialCaptionKill\239\188\129\239\188\129\239\188\129")
          Fn_tutorialCaptionKill()
        end)
      end
      if Pad:getButton(Pad.kButton_LR) == true then
        print("\227\131\156\227\130\191\227\131\179\230\138\188\227\129\151\227\129\159\227\129\139\227\130\137Fn_tutorialCaptionKill\239\188\129\239\188\129\239\188\129")
        Fn_tutorialCaptionKill()
      end
      waitSeconds(1)
      L0_14 = L0_14 + 1
    end
  end)
end
function Finalize()
  local L0_15, L1_16, L2_17, L3_18
  if L0_15 then
    if L0_15 then
      L0_15(L1_16)
    end
  end
  for L3_18 = 1, BOX_MAX do
    if _vogo_box_hdl[L3_18] then
      _vogo_box_hdl[L3_18]:setActive(false)
      _vogo_box_hdl[L3_18] = nil
      print("\227\131\180\227\130\169\227\130\180setup\231\174\177\233\157\158\232\161\168\231\164\186\239\188\154", L3_18)
    end
  end
  _vogo_box_task = L0_15
  _map_task = L0_15
  L0_15()
  if L0_15 ~= nil then
    if L0_15 == true then
      L0_15(L1_16)
    end
  end
  _cid_task = nil
  L3_18 = "ep05_follower02"
  L3_18 = L0_15
  L1_16(L2_17, L3_18)
end
