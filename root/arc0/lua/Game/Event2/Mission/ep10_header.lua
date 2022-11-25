dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
_tutorialCaption_active = false
_tutorialCaption_kill = false
function Initialize()
  if GameDatabase:get(ggd.Savedata__EventFlags__eps10__flag01) <= 0 then
    setNpcSenser(findGameObject2("Node", "locator2_ft10_Exclusion_01"), Vector(1.5, 2, 1.5), "ep10_othoer_mission_01")
    setNpcSenser(findGameObject2("Node", "locator2_ft10_Exclusion_02"), Vector(1.5, 2, 1.5), "ep10_othoer_mission_02")
    setNpcSenser(findGameObject2("Node", "locator2_ft10_Exclusion_03"), Vector(1.5, 2, 1.5), "ep10_othoer_mission_03")
  end
end
function Ingame()
  while HUD:faderAlpha() > 0 do
    wait()
  end
  Fn_userCtrlOn()
  if _tutorialCaption_kill == false and GameDatabase:get(ggd.Savedata__EventFlags__eps10__flag01) == 0 then
    Fn_captionViewWait("ep10_09019")
    waitSeconds(0.5)
    print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\232\161\168\231\164\186\227\129\153\227\130\139")
    _tutorialCaption_active = true
    Fn_tutorialCaption("tune_norm_mars")
    GameDatabase:set(ggd.Savedata__EventFlags__eps10__flag01, 1)
  end
end
function Finalize()
  local L0_0, L1_1
end
function pccubesensor2_tutorial_area_OnLeave()
  print("ft10\227\129\174\233\150\139\229\167\139\228\189\141\231\189\174\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159")
  if _tutorialCaption_active == true then
    print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171\227\129\153\227\130\139")
    _tutorialCaption_active = false
    _tutorialCaption_kill = true
    Fn_tutorialCaptionKill()
    Fn_pcSensorOff("pccubesensor2_tutorial_area")
    Fn_pcSensorOff("ep10_othoer_mission_01")
    Fn_pcSensorOff("ep10_othoer_mission_02")
    Fn_pcSensorOff("ep10_othoer_mission_03")
    if findGameObject2("Sensor", "ep10_mission_start_area") then
      Fn_pcSensorOff("ep10_mission_start_area")
    end
  elseif _tutorialCaption_kill == false then
    print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\232\161\168\231\164\186\227\129\151\227\129\170\227\129\132")
    _tutorialCaption_kill = true
    Fn_pcSensorOff("pccubesensor2_tutorial_area")
    if findGameObject2("Sensor", "ep10_mission_start_area") then
      Fn_pcSensorOff("ep10_mission_start_area")
    end
  end
end
function ep10_othoer_mission_01_OnLeave()
  captionOnFunc()
end
function ep10_othoer_mission_01_OnEnter()
  captionOffFunc()
end
function ep10_othoer_mission_02_OnLeave()
  captionOnFunc()
end
function ep10_othoer_mission_02_OnEnter()
  captionOffFunc()
end
function ep10_othoer_mission_03_OnLeave()
  captionOnFunc()
end
function ep10_othoer_mission_03_OnEnter()
  captionOffFunc()
end
function captionOnFunc()
  if _tutorialCaption_kill == false then
    print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\229\134\141\232\161\168\231\164\186")
    _tutorialCaption_active = true
    Fn_tutorialCaption("tune_norm_mars")
  end
end
function captionOffFunc()
  if _tutorialCaption_kill == false then
    print("ep10\227\129\174\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139\227\130\173\227\131\163\227\131\169\228\187\165\229\164\150\227\129\174\227\131\158\227\131\188\227\130\171\227\131\188\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159")
    if _tutorialCaption_active == true then
      print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171\227\129\153\227\130\139")
      _tutorialCaption_active = false
      Fn_tutorialCaptionKill()
    elseif _tutorialCaption_kill == false then
      print("\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\232\161\168\231\164\186\227\129\151\227\129\170\227\129\132")
      _tutorialCaption_kill = true
    end
  end
end
