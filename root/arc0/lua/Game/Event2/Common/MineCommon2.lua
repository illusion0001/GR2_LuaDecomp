import("Ugc")
import("Analytics")
_ENEMYMARKER_RANGE = 50
_gravity_gate = {
  sensor = nil,
  marker = nil,
  node = nil,
  effect = nil,
  sound = nil,
  nextFloor = 1
}
function _terminateGravityGate()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  for L3_3, L4_4 in L0_0(L1_1) do
    if L4_4 then
      if L3_3 == "sound" then
        Sound:stopSEHandle(L4_4)
        _gravity_gate[L3_3] = nil
      elseif L3_3 == "node" then
      elseif L3_3 == "nextFloor" then
        L4_4 = 1
      else
        L4_4:try_term()
        _gravity_gate[L3_3] = nil
      end
    end
  end
end
function Fn_setGravityGateActive(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
  L1_6 = Fn_getMine99Depth
  L1_6 = L1_6()
  for L5_10, L6_11 in L2_7(L3_8) do
    if L6_11 then
      if L5_10 == "sound" then
        L7_12 = Sound
        L7_12 = L7_12.stopSEHandle
        L7_12(L7_12, L6_11)
        L7_12 = _gravity_gate
        L7_12[L5_10] = nil
        if A0_5 then
          L7_12 = _gravity_gate
          L7_12 = L7_12.nextFloor
          if L1_6 > L7_12 then
            L7_12 = _gravity_gate
            L7_12 = L7_12.node
            if L7_12 then
              L7_12 = _gravity_gate
              L7_12[L5_10] = Sound:playSEHandle("amb_ep00_001", 1, nil, _gravity_gate.node)
            end
          end
        end
      elseif L5_10 == "node" then
      elseif L5_10 == "nextFloor" then
        L6_11 = 1
      else
        L7_12 = A0_5 and L1_6 >= L7_12
        L6_11:setActive(L7_12)
      end
    end
  end
end
function Fn_setupGravityGate(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23
  L4_17 = _terminateGravityGate
  L4_17()
  L4_17 = A2_15 or "locator2_im_entrance_01"
  L5_18 = findGameObject2
  L6_19 = "Node"
  L7_20 = L4_17
  L5_18 = L5_18(L6_19, L7_20)
  if L5_18 == nil then
    L6_19 = print
    L7_20 = L4_17
    L8_21 = "\239\188\154\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L7_20 = L7_20 .. L8_21
    L6_19(L7_20)
    L6_19 = false
    return L6_19
  end
  L6_19 = findUpArea
  L7_20 = L5_18
  L6_19 = L6_19(L7_20)
  if L6_19 == nil then
    L7_20 = false
    return L7_20
  end
  L7_20 = createGameObject2
  L8_21 = "Node"
  L7_20 = L7_20(L8_21)
  L9_22 = L7_20
  L8_21 = L7_20.setName
  L10_23 = "gate_node"
  L8_21(L9_22, L10_23)
  L9_22 = L6_19
  L8_21 = L6_19.appendChild
  L10_23 = L7_20
  L8_21(L9_22, L10_23)
  L9_22 = L7_20
  L8_21 = L7_20.setTransform
  L10_23 = L5_18.getTransform
  L10_23 = L10_23(L5_18)
  L8_21(L9_22, L10_23, L10_23(L5_18))
  L8_21 = {}
  L8_21.target = L7_20
  L8_21.find_type = "Node"
  L9_22 = {}
  L9_22.name = "gui_marker_10"
  L10_23 = string
  L10_23 = L10_23.format
  L10_23 = L10_23("ui_acdialog_main_mine99_%02d", A1_14)
  L9_22.ad_title_id = L10_23
  L9_22.ad_sub_id = "ui_acdialog_sub_11"
  L10_23 = string
  L10_23 = L10_23.format
  L10_23 = L10_23("ui_map_msinfo_main_mine99_%02d", A1_14)
  L9_22.map_title_id = L10_23
  L9_22.map_sub_id = "ui_map_msinfo_header_12"
  L9_22.giude_id = "ui_keyguide_ac_00"
  L9_22.alert_id = "ui_acdialog_alert_01"
  L9_22.pattern = "Default"
  L9_22.map_disp = true
  L9_22.active = true
  function L10_23()
    local L0_24
    L0_24 = Fn_userCtrlOff
    L0_24(false)
    L0_24 = Player
    L0_24 = L0_24.setStay
    L0_24(L0_24, true)
    L0_24 = _gravity_gate
    L0_24 = L0_24.marker
    if L0_24 then
      L0_24 = _gravity_gate
      L0_24 = L0_24.marker
      L0_24 = L0_24.playOut
      L0_24(L0_24)
      repeat
        L0_24 = wait
        L0_24()
        L0_24 = _gravity_gate
        L0_24 = L0_24.marker
        L0_24 = L0_24.isOutEnd
        L0_24 = L0_24(L0_24)
      until L0_24
    end
    L0_24 = Fn_blackout
    L0_24(1)
    L0_24 = Player
    L0_24 = L0_24.setStay
    L0_24(L0_24, false)
    L0_24 = GameDatabase
    L0_24 = L0_24.get
    L0_24(L0_24, ggd.Savedata__CreneShipFlags__PlayerLife, Player:getEnergy(Player.kEnergy_Life))
    L0_24 = bgManager
    if L0_24 then
      L0_24 = bgManager
      L0_24 = L0_24.isRunning
      L0_24 = L0_24(L0_24)
      if L0_24 then
        L0_24 = bgManager
        L0_24 = L0_24.sendEvent
        L0_24(L0_24, "requestBgSet", {
          newMine = "mine99_" .. string.format("%03d", A1_14)
        })
        repeat
          L0_24 = wait
          L0_24()
          L0_24 = bgManager
          L0_24 = L0_24.sendEvent
          L0_24 = L0_24(L0_24, "getBgSetInfomation", {isNewMine = true})
        until L0_24
      end
    end
    L0_24 = HUD
    L0_24 = L0_24.talismanSetForceVisible
    L0_24(L0_24, false, true)
    L0_24 = HUD
    L0_24 = L0_24.enableShortCatTalismanOreList
    L0_24(L0_24, false)
    L0_24 = GameDatabase
    L0_24 = L0_24.get
    L0_24 = L0_24(L0_24, ggd.Savedata__EventManageFlags__CurrentMissionName)
    if string.find(L0_24, "mine99_") then
      Fn_noticeExitMineAnalytics(L0_24)
    elseif string.find(L0_24, "mine") then
      Fn_noticeExitMine(tonumber(string.sub(L0_24, 5, string.len(L0_24))))
      Fn_noticeExitMineAnalytics(L0_24)
      Fn_closeMine99(L0_24)
    end
    L0_24 = Fn_setNextMissionFlag
    L0_24(A0_13)
    L0_24 = Fn_nextMission
    L0_24()
    L0_24 = Fn_exitSandbox
    L0_24()
  end
  _gravity_gate.node = L7_20
  _gravity_gate.sensor, _gravity_gate.marker = setupMarkerBase(L8_21, L9_22, L10_23)
  _gravity_gate.effect = Fn_createEffect("ef_ev_bk_mgn", "ef_ev_bk_mgn", Vector(0, 1, 0), true)
  _gravity_gate.node:appendChild(_gravity_gate.effect)
  _gravity_gate.effect:setTransform(Vector(0, 4, -2))
  _gravity_gate.nextFloor = A1_14
  Fn_setGravityGateActive(A3_16)
  return true
end
function Fn_noticeEnterMine(A0_25)
  Ugc:mineIn(A0_25)
end
function Fn_noticeExitMine(A0_26)
  local L1_27
  L1_27 = _getMined
  L1_27 = L1_27()
  Ugc:mineOut(A0_26, L1_27)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("addGravityOreMinedCount", A0_26, L1_27)
  end
end
function Fn_noticeEnterMineAnalytics(A0_28)
  local L1_29
  L1_29 = nil
  if MineManager and MineManager:isRunning() then
    L1_29 = MineManager:sendEvent("getReceiveTotalMined", A0_28)
  end
  Analytics:mineEnter(A0_28, L1_29)
end
function Fn_noticeExitMineAnalytics(A0_30)
  local L1_31
  L1_31 = _getMined
  L1_31 = L1_31()
  Analytics:mineExit(A0_30, L1_31)
end
function _getMined()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("getMineCount")
  end
  return 0
end
function Fn_sendBulkMineSetupRun(A0_32, A1_33, A2_34, A3_35)
  repeat
    wait()
  until Fn_sendIsWaitPreparationMineManager()
  Fn_sendMineSetupMineName(A0_32)
  if A1_33 then
    Fn_sendMineSetupBaseGravityOre(A1_33)
  end
  if A2_34 then
    Fn_sendMineSetupAddGravityOre(A2_34)
  end
  if A3_35 then
    Fn_sendMineSetupDeathGhost(A3_35)
  end
  Fn_sendMineSetupRun()
end
function Fn_sendIsWaitPreparationMineManager()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendIsWaitPreparationMineManager")
  end
  return nil
end
function Fn_sendMineSetupRun()
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendMineSetupRun")
  end
end
function Fn_sendMineSetupMineName(A0_36)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupMineName", A0_36)
  end
end
function Fn_sendMineSetupBaseGravityOre(A0_37)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupBaseGravityOre", A0_37.mineOreEvdName, A0_37.instance_flg, A0_37.manager_name, A0_37.deploy_areas, A0_37.exclusion_areas)
  end
end
function Fn_sendMineSetupAddGravityOre(A0_38)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupAddGravityOre", A0_38.mineOreEvdName, A0_38.instance_flg, A0_38.manager_name, A0_38.deploy_areas, A0_38.exclusion_areas)
  end
end
function Fn_sendMineSetupDeathGhost(A0_39)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendMineSetupDeathGhost", A0_39.node)
  end
end
function Fn_sendIsRunMine()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendIsRunMine")
  end
  return false
end
function mineFinalize(A0_40)
  local L1_41
end
function Fn_closeMine99(A0_42)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("closeMine99", A0_42)
  end
end
function Fn_RestorBaseGravityOre()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("restorBaseGravityOre")
  end
end
function Fn_RestorAddGravityOre()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("restorAddGravityOre")
  end
end
function Fn_sendMineSetupCallBrokenGravityOre(A0_43)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendMineSetupCallBrokenGravityOre", g_own:getName(), A0_43)
  end
end
function Fn_sendMineSetupCallOnPreciousGemGet(A0_44)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendMineSetupCallOnPreciousGemGet", g_own:getName(), A0_44)
  end
end
function Fn_sendMineSetupCallOnCrowPreciousGemGet(A0_45)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendMineSetupCallOnCrowPreciousGemGet", g_own:getName(), A0_45)
  end
end
function getGemCount()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("getGemCount")
  end
  return nil
end
function getCrowGemCnt()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("getCrowGemCount")
  end
  return nil
end
function Fn_sendSetOtherPreciousGemCount(A0_46, A1_47)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendSetOtherPreciousGemCount", A0_46, A1_47)
  end
end
function Fn_sendStopOtherPreciousGemCount()
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendStopOtherPreciousGemCount")
  end
end
function Fn_sendSetOtherPreciousGemNum(A0_48)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendSetOtherPreciousGemNum", A0_48)
  end
end
function Fn_getGravityOre2(A0_49)
  local L1_50
  L1_50 = nil
  if MineManager and MineManager:isRunning() then
    L1_50 = MineManager:findGameObject2("GravityOre2", A0_49)
  end
  L1_50 = L1_50 or findGameObject2("GravityOre2", A0_49)
  return L1_50
end
function EnemeyDropGem(A0_51, A1_52)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("EnemeyDropGem", A0_51, A1_52.brain, {
      A1_52.pos.x,
      A1_52.pos.y,
      A1_52.pos.z
    }, {
      A1_52.impulse.x,
      A1_52.impulse.y,
      A1_52.impulse.z
    })
  end
  return false
end
function Fn_sendRequestResetGachaTable(A0_53, A1_54)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("requestResetGachaTable", A0_53, A1_54)
  end
end
function Fn_sendRequestRemoveDrop(A0_55)
  if MineManager and MineManager:isRunning() then
    MineManager:sendEvent("sendRequestRemoveDrop", A0_55)
  end
end
function Fn_getMine99Depth()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("getMine99Depth")
  end
  return 30
end
function Fn_EnemyDropGraviryOre(A0_56, A1_57, A2_58, A3_59)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("EnemyDropGraviryOre", A0_56, {
      pos = {
        x = A1_57.pos.x,
        y = A1_57.pos.y,
        z = A1_57.pos.z
      },
      impulse = {
        x = A1_57.impulse.x,
        y = A1_57.impulse.y,
        z = A1_57.impulse.z
      }
    }, A2_58, A3_59)
  end
end
function deleteEnemyGenerator(A0_60)
  if findGameObject2("EnemyGenerator", A0_60) then
    findGameObject2("EnemyGenerator", A0_60):try_term()
  end
end
function requestEnemySpawn(A0_61)
  if findGameObject2("EnemyGenerator", A0_61) then
    print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", A0_61))
    findGameObject2("EnemyGenerator", A0_61):requestSpawn()
  end
end
