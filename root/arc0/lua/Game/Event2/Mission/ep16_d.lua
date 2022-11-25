dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
function Initialize()
  Fn_requestVoiceHex()
  RAC_startCatWarpControl("ep16_area_out", nil, "pccubesensor2_mission_area01", "pccubesensor2_mission_area02", "locator2_pc_start_pos", nil, "locator2_pc_start_pos", "ep16_02003")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestSection"
  L2_2 = "d1"
  L0_0(L1_1, L2_2)
  L0_0 = waitComNextPhase
  L0_0()
  L0_0 = print
  L1_1 = "\227\131\166\227\131\139\227\130\171\227\131\154\227\131\171\227\131\161\227\129\174\230\186\150\229\130\153\229\190\133\227\129\161"
  L0_0(L1_1)
  while true do
    L0_0 = Fn_sendEventComSb
    L1_1 = "isReadyUnicaPermet"
    L0_0 = L0_0(L1_1)
    if L0_0 == false then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = print
  L1_1 = "\227\131\166\227\131\139\227\130\171\227\131\154\227\131\171\227\131\161\227\129\174\230\186\150\229\130\153\231\181\130\228\186\134"
  L0_0(L1_1)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_boss_01"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_lookAtObjectWait
  L2_2 = L0_0
  L3_3 = 1
  L4_4 = 0.3
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = RAC_missionNaviCaption
  L2_2 = "ep16_03000"
  L3_3 = nil
  L4_4 = "ep16_03001"
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setStay
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestIdlingEnemy"
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_setBgmPoint
  L2_2 = "event"
  L3_3 = "boss"
  L1_1(L2_2, L3_3)
  L1_1 = Fn_sendEventComSb
  L2_2 = "getMaxHealth"
  L3_3 = "unica"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = Fn_sendEventComSb
  L3_3 = "getMaxHealth"
  L4_4 = "permet"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L4_4 = L2_2
  while not Fn_sendEventComSb("isFatalFinish") do
    if false == false and Fn_sendEventComSb("getHealth", "unica") / L1_1 < 0.7 then
      print("Fn_setBgmPoint battle_unica1")
      Fn_setBgmPoint("event", "battle_unica1")
    end
    if false == false and Fn_sendEventComSb("getHealth", "unica") / L1_1 < 0.4 then
      print("Fn_setBgmPoint battle_unica2")
      Fn_setBgmPoint("event", "battle_unica2")
    end
    if false == false and Fn_sendEventComSb("getHealth", "permet") / L2_2 < 0.7 then
      print("Fn_setBgmPoint battle_permet1")
      Fn_setBgmPoint("event", "battle_permet1")
    end
    if false == false and Fn_sendEventComSb("getHealth", "permet") / L2_2 < 0.4 then
      print("Fn_setBgmPoint battle_permet2")
      Fn_setBgmPoint("event", "battle_permet2")
    end
    if L3_3 >= Fn_sendEventComSb("getHealth", "unica") then
      if Fn_sendEventComSb("getHealth", "unica") / L1_1 < 0.8 and not ({
        false,
        false,
        false
      })[1] then
        Fn_captionView("ep16_03002")
        ;({
          false,
          false,
          false
        })[1] = true
      end
      if Fn_sendEventComSb("getHealth", "unica") / L1_1 < 0.5 and not ({
        false,
        false,
        false
      })[2] then
        Fn_captionView("ep16_03003")
        ;({
          false,
          false,
          false
        })[2] = true
      end
      if Fn_sendEventComSb("getHealth", "unica") / L1_1 < 0.1 and not ({
        false,
        false,
        false
      })[3] then
        Fn_captionView("ep16_03004")
        ;({
          false,
          false,
          false
        })[3] = true
      end
    end
    if L4_4 >= Fn_sendEventComSb("getHealth", "permet") then
      if Fn_sendEventComSb("getHealth", "permet") / L2_2 < 0.8 and not ({
        false,
        false,
        false
      })[1] then
        Fn_captionView("ep16_03005")
        ;({
          false,
          false,
          false
        })[1] = true
      end
      if Fn_sendEventComSb("getHealth", "permet") / L2_2 < 0.5 and not ({
        false,
        false,
        false
      })[2] then
        Fn_captionView("ep16_03006")
        ;({
          false,
          false,
          false
        })[2] = true
      end
      if Fn_sendEventComSb("getHealth", "permet") / L2_2 < 0.1 and not ({
        false,
        false,
        false
      })[3] then
        Fn_captionView("ep16_03007")
        ;({
          false,
          false,
          false
        })[3] = true
      end
    end
    L4_4, L3_3 = Fn_sendEventComSb("getHealth", "permet"), Fn_sendEventComSb("getHealth", "unica")
    wait()
  end
  Fn_whiteout(0.3)
  Fn_sendEventComSb("killFatalMarker")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_5, L1_6
end
