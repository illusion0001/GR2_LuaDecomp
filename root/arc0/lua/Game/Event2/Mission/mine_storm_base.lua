import("Ugc")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
_kitMotionTable = {
  motion1 = "kit01_down_a_00",
  motion2 = "kit01_down_b_00",
  motion3 = "kit01_stay_00"
}
function Initialize()
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__SaveLoadSave, true)
  if GameDatabase:get(ggd.Savedata__CreneShipFlags__ShipName) == "ve_crane_root" then
    createPcStartPos("mine_po_setup")
  else
    createPcStartPos("mine_hx_setup")
  end
  Ugc:disableFriendDGUpdate(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    "az2_a_28",
    "wa_a_17"
  }
  L1_1 = "db_rock_01"
  L2_2 = "pi_a_15"
  L3_3 = "db_rock_oc_02"
  L4_4 = "pi2_a_18"
  L5_5 = "pi_a_26"
  L1_1 = 1
  while true do
    L2_2 = findGameObject2
    L3_3 = "Node"
    L4_4 = "locator2_debris_"
    L5_5 = string
    L5_5 = L5_5.format
    L5_5 = L5_5("%02d", L1_1)
    L4_4 = L4_4 .. L5_5
    L2_2 = L2_2(L3_3, L4_4)
    if L2_2 ~= nil then
      L3_3 = Fn_createDebris
      L4_4 = L2_2
      L5_5 = "debris_"
      L5_5 = L5_5 .. string.format("%02d", L1_1)
      L3_3 = L3_3(L4_4, L5_5, L0_0[RandI(1, #L0_0)])
      L5_5 = L2_2
      L4_4 = L2_2.getWorldPos
      L4_4 = L4_4(L5_5)
      L5_5 = Vector
      L5_5 = L5_5(RandF(-5, 5), RandF(-5, 5), RandF(-5, 5))
      L4_4 = L4_4 + L5_5
      L5_5 = Vector
      L5_5 = L5_5(RandF(10, 25), RandF(10, 25), RandF(10, 25))
      L3_3:play(L4_4, RandF(0.5, 2), -1, L5_5, 2)
    else
      break
    end
    L1_1 = L1_1 + 1
  end
  L2_2 = Fn_waitGravityStormOutAndCageSkip
  L2_2()
  L2_2 = GameDatabase
  L3_3 = L2_2
  L2_2 = L2_2.set
  L4_4 = ggd
  L4_4 = L4_4.GlobalSystemFlags__GameOverEnable
  L5_5 = true
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = 0
  L3_3 = GameDatabase
  L4_4 = L3_3
  L3_3 = L3_3.get
  L5_5 = ggd
  L5_5 = L5_5.Savedata__CreneShipFlags__PlayerDead
  L3_3 = L3_3(L4_4, L5_5)
  if L3_3 == true then
    L4_4 = Fn_captionViewEnd
    L4_4()
    L4_4 = Fn_userCtrlOff
    L4_4()
    L4_4 = Player
    L5_5 = L4_4
    L4_4 = L4_4.setSituation
    L4_4(L5_5, Player.kSituation_Normal, true, 0.1, false, false)
    L4_4 = waitSeconds
    L5_5 = 0.5
    L4_4(L5_5)
    L4_4 = Fn_loadPlayerMotion
    L5_5 = _kitMotionTable
    L4_4(L5_5)
    L2_2 = 3
  else
    L4_4 = GameDatabase
    L5_5 = L4_4
    L4_4 = L4_4.get
    L4_4 = L4_4(L5_5, ggd.Savedata__EventManageFlags__LateMissionName)
    L5_5 = string
    L5_5 = L5_5.find
    L5_5 = L5_5(L4_4, "mine")
    if L5_5 ~= nil then
      L5_5 = string
      L5_5 = L5_5.find
      L5_5 = L5_5(L4_4, "storm")
      if L5_5 == nil then
        L2_2 = 2
      end
    else
      L2_2 = 1
    end
  end
  L4_4 = bgManager
  L5_5 = L4_4
  L4_4 = L4_4.sendEvent
  L4_4(L5_5, "requestCraneShip", {
    ship = {set_mine_storm = L2_2},
    cage = {set_mine_storm = L2_2},
    gstm = {set_mine_storm = L2_2}
  })
  L4_4 = MineManager
  if L4_4 then
    L4_4 = MineManager
    L5_5 = L4_4
    L4_4 = L4_4.isRunning
    L4_4 = L4_4(L5_5)
    if L4_4 then
      L4_4 = MineManager
      L5_5 = L4_4
      L4_4 = L4_4.sendEvent
      L4_4(L5_5, "setLoackUpdateMine", false)
    end
  end
  function L4_4()
    Fn_setCrewActive(true)
    if L3_3 then
      Player:setStay(true, true)
      Fn_playPlayerMotionWait(_kitMotionTable.motion1)
    end
  end
  L5_5 = Fn_missionStart
  L5_5(L4_4)
  if L3_3 == true then
    L5_5 = Fn_playPlayerMotionWait
    L5_5(_kitMotionTable.motion2, 0, 0.3)
    L5_5 = Fn_playPlayerMotion
    L5_5(_kitMotionTable.motion3, -1, 0.3)
    L5_5 = waitSeconds
    L5_5(2.4)
    L5_5 = bgManager
    L5_5 = L5_5.sendEvent
    L5_5(L5_5, "requestCraneShip", {
      ship = {show_digout_result = true}
    })
    L5_5 = wait
    L5_5()
    L5_5 = bgManager
    L5_5 = L5_5.sendEvent
    L5_5(L5_5, "requestCraneShip", {
      ship = {marker_in = true},
      cage = {marker_in = true}
    })
  end
  L5_5 = GameDatabase
  L5_5 = L5_5.set
  L5_5(L5_5, ggd.Savedata__CreneShipFlags__PlayerDead, false)
  L5_5 = bgManager
  L5_5 = L5_5.sendEvent
  L5_5(L5_5, "requestCraneShip", {
    ship = {marker_in = true},
    cage = {marker = true}
  })
  L5_5 = Fn_waitCageMoveEnd
  L5_5()
  L5_5 = bgManager
  L5_5 = L5_5.sendEvent
  L5_5(L5_5, "requestCraneShip", {
    ship = {show_digout_result = true}
  })
  L5_5 = wait
  L5_5()
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Player
  L5_5 = L5_5.setStay
  L5_5(L5_5, false)
  L5_5 = Fn_setCatWarp
  L5_5(true)
  L5_5 = Fn_waitGravityStormInOrDeparture
  L5_5 = L5_5()
  if L5_5 >= 1 then
    Ugc:removeInstantDeathGhost()
    Ugc:downloadOtherDeathGhost()
    if L5_5 == 1 then
      Fn_setKeepPlayerPos()
    end
    Fn_setNextMissionFlag()
    Fn_nextMission()
  end
  Fn_exitSandbox()
end
function Finalize()
  local L0_6, L1_7
end
function createPcStartPos(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16
  L1_9 = loadFileAsset
  L2_10 = "evb"
  L3_11 = "evx/"
  L4_12 = A0_8
  L3_11 = L3_11 .. L4_12
  L1_9 = L1_9(L2_10, L3_11)
  L2_10 = nil
  if L1_9 then
    L4_12 = L1_9
    L3_11 = L1_9.wait
    L3_11(L4_12)
    L4_12 = L1_9
    L3_11 = L1_9.getRoot
    L3_11 = L3_11(L4_12)
    L4_12 = _findNodeTransform
    L5_13 = L3_11
    L6_14 = "locator2_pc_ship_pos_01"
    L6_14 = L4_12(L5_13, L6_14)
    if L4_12 then
      L7_15 = Fn_findAreaHandle
      L8_16 = L6_14
      L7_15 = L7_15(L8_16)
      if L7_15 then
        L8_16 = createGameObject2
        L8_16 = L8_16("Node")
        L8_16:setName("locator2_pc_start_pos")
        L7_15:appendChild(L8_16)
        L8_16:setTransform(L4_12, L5_13)
      end
    end
  end
end
function _findNodeTransform(A0_17, A1_18, A2_19)
  local L3_20, L4_21, L5_22, L6_23, L7_24
  L4_21 = A0_17
  L3_20 = A0_17.findParentBundle
  L5_22 = A1_18
  L3_20 = L3_20(L4_21, L5_22)
  if L3_20 then
    L5_22 = L3_20
    L4_21 = L3_20.getString
    L6_23 = "areaname"
    L4_21 = L4_21(L5_22, L6_23)
    if L4_21 then
      L5_22 = nil
      if A2_19 then
        L7_24 = A0_17
        L6_23 = A0_17.findBundle
        L6_23 = L6_23(L7_24, A2_19, true)
        L5_22 = L6_23
      else
        L7_24 = A0_17
        L6_23 = A0_17.findBundle
        L6_23 = L6_23(L7_24, A1_18, true)
        L5_22 = L6_23
      end
      if L5_22 then
        L7_24 = L3_20
        L6_23 = L3_20.worldToLocal
        L7_24 = L6_23(L7_24, L5_22:getTranslation(), L5_22:getRotation())
        return L6_23, L7_24, L4_21
      end
    else
      L5_22 = _findNodeTransform
      L6_23 = A0_17
      L7_24 = L3_20.getName
      L7_24 = L7_24(L3_20)
      return L5_22(L6_23, L7_24, A1_18)
    end
  end
  L4_21 = nil
  return L4_21
end
